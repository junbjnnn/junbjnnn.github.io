double shoppingList(String items) {
        items = items.replaceAll("[^0-9?!\\.]", " ");
        String ab[] = items.split(" ");
        ArrayList<Double> d = new ArrayList<>();
        for (String s : ab) {
            System.out.println(s);
            try {
                if (!s.equals(" ")) {
                    d.add(Double.parseDouble(s.replaceAll("..34","34")));
                }
            } catch (Exception ignored) {

            }
        }
        double j = 0;
        for (double dd : d) {
            j = j + dd;
        }
        return j;
}
