def tasksTypes(deadlines, day):
    past = 0
    withn_week = 0
    upcoming = 0
    for e in deadlines:
        if e <= day:
            past += 1
        elif e >= day + 1 and e <= day+7:
            withn_week += 1
        elif e > day + 7:
            upcoming +=1
        
    return [past, withn_week, upcoming]