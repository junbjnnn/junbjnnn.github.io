String[] recurringTask(String firstDate, int k, String[] daysOfTheWeek, int n) {
        String[] z = firstDate.split("/");
        int day = Integer.parseInt(z[0]);
        int month = Integer.parseInt(z[1]) - 1;
        int year = Integer.parseInt(z[2]);
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Calendar c = new GregorianCalendar(year, month, day);
        int count = 0;
        int count2 = 0;
        String[] s = new String[n];
        while (count < n) {
            for (String da : daysOfTheWeek) {
                if (count2 / 7 % k == 0
                        && (da.compareTo("Monday") == 0 && c.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY
                        || da.compareTo("Tuesday") == 0 && c.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY
                        || da.compareTo("Wednesday") == 0 && c.get(Calendar.DAY_OF_WEEK) == Calendar.WEDNESDAY
                        || da.compareTo("Thursday") == 0 && c.get(Calendar.DAY_OF_WEEK) == Calendar.THURSDAY
                        || da.compareTo("Friday") == 0 && c.get(Calendar.DAY_OF_WEEK) == Calendar.FRIDAY
                        || da.compareTo("Saturday") == 0 && c.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY
                        || da.compareTo("Sunday") == 0 && c.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY)) {
                    s[count++] = df.format(c.getTime());
                }
            }
            System.out.println(df.format(c.getTime()));
            c.add(Calendar.DAY_OF_MONTH, 1);
            count2++;
        }
        return s;
}
