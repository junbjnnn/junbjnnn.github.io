    private enum Location {
        WEST, EAST, NORTH, SOUTH
    }

    boolean parkingSpot(int[] carDimensions, int[][] parkingLot, int[] luckySpot) {
        if (parkingLot[luckySpot[0]][luckySpot[1]] == 1 || parkingLot[luckySpot[2]][luckySpot[3]] == 1) return false;

        System.out.println("Checking lucky spot...............");
        for (int i = luckySpot[0]; i < luckySpot[2] + 1; i++) {
            for (int j = luckySpot[1]; j < luckySpot[3] + 1; j++) {
                if (parkingLot[i][j] == 1) return false;
            }

        }
        int c = 0;
        System.out.println("Checking North....................");
        c += checkNorth(carDimensions, luckySpot, parkingLot);
        System.out.println();

        System.out.println("Checking South....................");
        c += checkSouth(carDimensions, luckySpot, parkingLot);
        System.out.println();

        System.out.println("Checking East....................");
        c += checkEast(carDimensions, luckySpot, parkingLot);
        System.out.println();

        System.out.println("Checking West....................");
        c += checkWest(carDimensions, luckySpot, parkingLot);
        System.out.println();

        System.out.println("Count: " + c);
        return c < 4 || (c < 4);

    }


    private static int checkEast(int[] carDimensions, int[] luckySpot, int[][] parkingLot) {
        for (int i = luckySpot[0]; i < luckySpot[2] + 1; i++) {
            for (int j = luckySpot[3] + 1; j < parkingLot[0].length; j++) {
                System.out.print(parkingLot[i][j] + " ");
                if (parkingLot[i][j] == 1) return 1;
            }
            System.out.println();
        }
        if (mustTurn(carDimensions, luckySpot, parkingLot, Location.EAST)) {
            return 1;
        }
        return 0;

    }

    private static int checkWest(int[] carDimensions, int[] luckySpot, int[][] parkingLot) {
        for (int i = luckySpot[0]; i < luckySpot[2] + 1; i++) {
            for (int j = 0; j < luckySpot[1]; j++) {
                System.out.print(parkingLot[i][j] + " ");
                if (parkingLot[i][j] == 1) return 1;
            }
            System.out.println();
        }
        if (mustTurn(carDimensions, luckySpot, parkingLot, Location.WEST)) {
            return 1;
        }
        return 0;
    }

    private static int checkSouth(int[] carDimensions, int[] luckySpot, int[][] parkingLot) {
        for (int i = luckySpot[2] + 1; i < parkingLot.length; i++) {
            for (int j = luckySpot[1]; j < luckySpot[3] + 1; j++) {
                System.out.print(parkingLot[i][j] + " ");
                if (parkingLot[i][j] == 1) return 1;
            }
            System.out.println();
        }
        if (mustTurn(carDimensions, luckySpot, parkingLot, Location.SOUTH)) {
            return 1;
        }
        return 0;
    }

    private static int checkNorth(int[] carDimensions, int[] luckySpot, int[][] parkingLot) {
        for (int i = 0; i < luckySpot[0]; i++) {
            for (int j = luckySpot[1]; j < luckySpot[3] + 1; j++) {
                System.out.print(parkingLot[i][j] + " ");
                if (parkingLot[i][j] == 1) return 1;
            }
            System.out.println();
        }
        if (mustTurn(carDimensions, luckySpot, parkingLot, Location.NORTH)) {
            return 1;
        }
        return 0;
    }

    private static boolean mustTurn(int[] carDimensions, int[] luckySpot, int[][] parkingLot, Location loc) {
        if (loc == Location.SOUTH || loc == Location.NORTH) {
            if (luckySpot[3] - luckySpot[1] + 1 > carDimensions[1]) {
                System.out.println("Must turn to park.");
                return true;
            }
        } else if (loc == Location.WEST || loc == Location.EAST) {
            if (luckySpot[2] - luckySpot[0] + 1 > carDimensions[0]) {
                System.out.println("Must turn to park.");
                return true;
            }
        }
        return false;
    }