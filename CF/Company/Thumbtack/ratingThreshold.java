    public static int[] ratingThreshold(double threshold, int[][] ratings) {
        int returnArray[];
        ArrayList<int[]> arrayList = new ArrayList<>();
        ArrayList<Integer> counter = new ArrayList<>();

        if (ratings.length > 0) {
            Collections.addAll(arrayList, ratings);

            for (int j = 0; j < arrayList.size(); j++) {
                double sum = 0;
                for (int jj = 0; jj < arrayList.get(j).length; jj++) {
                    sum = arrayList.get(j)[jj] + sum;
                }
                if ((sum / arrayList.get(j).length) < threshold) {
                    counter.add(j);
                    sum = 0;
                } else {
                    sum = 0;
                }
            }
            if (counter.size() > 0) {
                returnArray = new int[counter.size()];
                for (int i = 0; i < counter.size(); i++) {
                    returnArray[i] = counter.get(i);
                }
            } else {
                returnArray = new int[]{};
            }
            return returnArray;

        } else {
            returnArray = new int[]{};
            return returnArray;
        }
    }