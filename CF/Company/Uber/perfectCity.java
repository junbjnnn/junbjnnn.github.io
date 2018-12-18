    double perfectCity(double[] departure, double[] destination) {
        double depX = departure[0];
        double depY = departure[1];
        double destX = destination[0];
        double destY = destination[1];

        if (Math.floor(depX) - Math.floor(destX) == 0) {
            System.out.println(1);
            double first = depX - Math.floor(depX) + destX - Math.floor(destX);
            double second = Math.abs(1 - depX + Math.floor(depX)) + Math.abs(1 - destX + Math.floor(destX));
            return Math.abs(depY - destY) + (first > second ? second : first);
        } else if (Math.abs(depY - destY) < 1) {
            double first = depY - Math.floor(depY) + destY - Math.floor(destY);
            double second = Math.abs(1 - depY + Math.floor(depY)) + Math.abs(1 - destY + Math.floor(destY));
            return Math.abs(depX - destX) + (first > second ? second : first);
        } else {
            System.out.println(3);
            return Math.abs(depX - destX) + Math.abs(depY - destY);
        }

    }