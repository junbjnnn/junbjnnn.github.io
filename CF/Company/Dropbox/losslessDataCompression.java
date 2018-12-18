    String losslessDataCompression(String inputString, int width) {
        String toRet = "";
        char[] inp = inputString.toCharArray();

        int length;
        for (int i = 0; i < inp.length; i += length) {
            String window = window(inputString, i, width);

            int startIndex = 0;
            length = 1; // substring is exclusive end
            boolean present = false;
            while (i + length - 1 <= inputString.length() - 1) {
                // length++;
                int tempIndex = window.indexOf(inputString.substring(i, i + length)); // i,i+1
                // is
                // charAt(i)
                if (tempIndex != (-1)) {
                    present = true;
                    if (i <= width) {
                        startIndex = tempIndex;
                    } else {
                        startIndex = tempIndex + i - width;
                    }
                    if (i + length - 1 == inputString.length() - 1) {
                        break;
                    }
                    length++;

                } else {
                    length--;
                    break;
                }
            }

            if (present) {
                toRet += "(" + String.valueOf(startIndex) + "," + String.valueOf(length) + ")";
            } else {
                toRet += String.valueOf(inp[i]);
                length = 1;
            }
            System.out.println(toRet);
        }
        System.out.println("final: " + toRet);
        return toRet;
    }

    String window(String inp, int i, int width) {
        if (i - width >= 0 && i - 1 >= 0 && width > 0) {
            return inp.substring(i - width, i);
        } else if (i - 1 >= 0) {
            return inp.substring(0, i);
        } else {
            return "";
        }
    }