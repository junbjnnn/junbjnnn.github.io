String[] multiSelection(int[] dimensions, String[] tasks, int[][] mouseCoordinates) {
        int h = dimensions[1];
        int s = dimensions[2];
        int[] helper = new int[tasks.length * (h + s) + 1];
        int segment = h + s;
        int carry = 0;
        for (int i = 0; i < tasks.length; i++) {
            for (int j = 0; j <= h; j++) {
                helper[j + carry] = i + 1;
            }
            for (int j = 1; j <= s; j++) {
                helper[(j + (h)) + carry] = -1;
            }
            carry += segment;
        }

        int a = mouseCoordinates[0][1];
        int b = mouseCoordinates[1][1];
        int min = (a < b) ? a : b;
        int max = (a + b) - min;

        int[] resultHelper = new int[tasks.length];
        int rSize = 0;
        while (min <= max) {
            if (helper[min] > 0) {
                resultHelper[(helper[min] - 1)] = 1;
            }
            min++;
        }
        for (int aResultHelper : resultHelper) {
            if (aResultHelper > 0) {
                rSize++;
            }
        }

        String[] result = new String[rSize];
        int j = 0;
        for (int i = 0; i < tasks.length; i++) {
            if (resultHelper[i] > 0) {
                result[j++] = tasks[i];
            }
        }

        return result;
}
