String smartAssigning(String[] names, boolean[] statuses, int[] projects, int[] tasks) {
        ArrayList<String> namesList = new ArrayList<>(Arrays.asList(names));
        HashMap<String, Integer> taskMap = new HashMap<>();
        HashMap<String, Integer> projectMap = new HashMap<>();

        // filter members, maintain maps
        for (int i = statuses.length - 1; i >= 0; i--) {
            if (!statuses[i]) {
                taskMap.put(namesList.get(i), tasks[i]);
                projectMap.put(namesList.get(i), projects[i]);
            } else {
                namesList.remove(i);
            }
        }

        if (namesList.size() == 1)
            return namesList.get(0);

        // sort the namesList based on tasksList
        namesList.sort(Comparator.comparingInt(taskMap::get));

        String name1 = namesList.get(0);
        String name2 = namesList.get(1);


        if (taskMap.get(name1) < taskMap.get(name2)) {
            return name1;
        } else if (projectMap.get(name1) < projectMap.get(name2)) {
            return name1;
        } else {
            return name2;
        }
}
