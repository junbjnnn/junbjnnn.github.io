    static String[][][] proCategorization(String[] pros, String[][] preferences) {
        Map<String, ArrayList<String>> m = new HashMap<>();
        Map<String, ArrayList<String>> m1 = new HashMap<>();
        Set<String> s = new HashSet<>();

        for (String[] preference : preferences) {
            String[] ar;
            ar = preference;
            Collections.addAll(s, ar);
        }

        List<String> sorted = new ArrayList<>(s);
        Collections.sort(sorted);

        for (int i = 0; i < pros.length; i++) {
            ArrayList<String> temp = new ArrayList<>(Arrays.asList(preferences[i]));
            m.put(pros[i], temp);
        }

        System.out.println("Current map:");
        System.out.println(m);

        for (String aSorted : sorted) {
            ArrayList<String> t1 = new ArrayList<>();
            for (Object o : m.entrySet()) {
                Map.Entry pair = (Map.Entry) o;
                ArrayList<String> t;
                t = (ArrayList<String>) pair.getValue();
                if (t.contains(aSorted))
                    t1.add((String) pair.getKey());
            }
            Collections.sort(t1);
            m1.put(aSorted, t1);
        }

        Map<String, ArrayList<String>> tm = new TreeMap<>(m1);
        System.out.println("Updated map:");
        System.out.println(tm);
        String[][][] ret = new String[sorted.size()][][];
        for (int i = 0; i < sorted.size(); i++) {
            ret[i] = new String[2][];
            ret[i][0] = new String[]{sorted.get(i)};
            ArrayList<String> strings = tm.get(sorted.get(i));
            ret[i][1] = strings.toArray(new String[strings.size()]);
        }
        return ret;
    }