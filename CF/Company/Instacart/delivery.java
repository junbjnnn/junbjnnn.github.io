boolean[] delivery(int[] order, int[][] shoppers) {
        boolean[] shopperDel = new boolean[shoppers.length];
        double deliverTime;
        int distance = order[0];

        for (int i = 0; i < shoppers.length; i++) {
            deliverTime = (double) (distance + shoppers[i][0]) / shoppers[i][1] + shoppers[i][2];
            shopperDel[i] = !(deliverTime > (order[1] + order[2])) && !(deliverTime < order[1]);
        }

        return shopperDel;
}
