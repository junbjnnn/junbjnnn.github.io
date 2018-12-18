    String[][] dailyOHLC(int[] timestamp, String[] instrument, String[] side, double[] price, int[] size) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        DecimalFormat df = new DecimalFormat("####0.00");

        List<EachInput> inputList = new ArrayList<>();

        // Key date+instrument, Sorted set of each input
        SortedMap<String, List<EachInput>> inputMap = new TreeMap<>();

        for (int i = 0; i < side.length; i++) {
            Date date = new Date(timestamp[i] * 1000L);
            EachInput each = new EachInput(timestamp[i], sdf.format(date.getTime()), instrument[i], side[i], price[i],
                    size[i]);
            inputList.add(each);
            String key = each.displayDate + each.instrument;
            List<EachInput> entries = inputMap.get(key);
            if (entries == null) {
                entries = new ArrayList<>();
            }
            entries.add(each);
            inputMap.put(key, entries);
        }


        Collection<List<EachInput>> values = inputMap.values();
        String[][] output = new String[values.size()][6];


        Iterator<List<EachInput>> vi = values.iterator();
        int count = 0;
        while (vi.hasNext()) {
            List<EachInput> next = vi.next();
            Collections.sort(next);
            output[count][0] = next.get(0).displayDate;
            output[count][1] = next.get(0).instrument;
            output[count][2] = df.format(next.get(0).price);
            output[count][5] = df.format(next.get(next.size() - 1).price);

            double lowestPrice = Double.MAX_VALUE;
            double highestPrice = Double.MIN_VALUE;

            for (EachInput aNext : next) {
                if (aNext.price > highestPrice) {
                    highestPrice = aNext.price;
                }

                if (aNext.price < lowestPrice) {
                    lowestPrice = aNext.price;
                }
            }

            output[count][3] = df.format(highestPrice);
            output[count][4] = df.format(lowestPrice);
            count++;
        }

        return output;
    }

    static class EachInput implements Comparator<EachInput>, Comparable<EachInput> {
        long timestamp;
        String displayDate;
        String instrument;
        String side;
        double price;
        int size;

        public EachInput(long timestamp, String displayDate, String instrument, String side, double price, int size) {
            this.timestamp = timestamp;

            this.displayDate = displayDate;
            this.instrument = instrument;
            this.side = side;
            this.price = price;
            this.size = size;
        }

        @Override
        public int compareTo(EachInput o) {
            if (timestamp < o.timestamp) {
                return 1;
            } else if (timestamp < o.timestamp) {
                return -1;
            }
            return instrument.compareTo(o.instrument);
        }

        @Override
        public String toString() {
            return "EachInput [timestamp=" + timestamp + ", displayDate=" + displayDate + ", instrument=" + instrument
                    + ", side=" + side + ", price=" + price + ", size=" + size + "]";
        }

        @Override
        public int compare(EachInput o1, EachInput o2) {
            if (o1.price > o2.price) {
                return 1;
            } else if (o1.price < o2.price) {
                return -1;
            }
            return 0;
        }

    }