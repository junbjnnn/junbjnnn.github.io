boolean isAdmissibleOverpayment(double[] prices, String[] notes, double x) {
        double sum = 0;
        double price;
        double percent = 0;
        String[] note;
        java.text.NumberFormat nf = java.text.NumberFormat.getPercentInstance();

        for (int i = 0; i < prices.length; i++) {
            price = prices[i];
            note = notes[i].split(" ");

            if (!note[0].toLowerCase().equals("same")) {
                try {
                    percent = nf.parse(note[0]).doubleValue();
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }

            if (note[1].toLowerCase().equals("higher")) {
                sum += price / (percent + 1) * percent;
            } else if (note[1].toLowerCase().equals("lower")) {
                sum -= price / (1 - percent) * percent;
            }
        }

        return !(sum > x);
}
