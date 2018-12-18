function plagiarismCheck(code1, code2) {
    var cursor1,cursor2;
    var rosetta=[];
    var interlang;
    var was, becomes, match;
    code1 = code1.join('\n');
    code2 = code2.join('\n');

    cursor1 = code1;
    cursor2 = code2;

    // find code differences, record as "was" and "becomes"
    for(var i=0, j=0; i<cursor2.length; i++){
        if(cursor1[i] == cursor2[i]){
            continue;
        }

        match = cursor1.slice(i).match(/^[\w\d]+\b/);
        if(match){
             was = match[0];
        }else{
            return false;
        }

        match = cursor2.slice(i).match(/^[\w\d]+\b/);
        if(match){
             becomes = match[0];
        }else{
            return false;
        }

        console.log('::: '+ was + ' BECOMES ' + becomes);

        // quick fail if this isn't a variable
        if(!/^[a-zA-Z_]/.test(was)){
            return false;
        }

        // make changes to cursor1 so we can find the next diff
        regex = new RegExp('\\b'+was+'\\b', 'g');
        cursor1 = cursor1.replace(regex, becomes);

        // record the change
        rosetta.push([regex, becomes]);
    }

    // STEP 1: convert original string to intermediate string
    for(var i=0; i<rosetta.length; i++){
        code1 = code1.replace(rosetta[i][0],"{{"+i+"}}");
    }

    // STEP 2: convert to final language
    for(var i=0; i<rosetta.length; i++){
        interlang = new RegExp('\\{\\{'+i+'\\}\\}', 'g');
        code1 = code1.replace(interlang,rosetta[i][1]);
    }

    // compare resultant code
    return (code1 == code2);
}