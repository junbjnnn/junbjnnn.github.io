    public static int allianceHelp(int t, int allianceSize) {
        int boost = 60;
        if (t > 600) boost = t / 10;
        if (allianceSize > 10) allianceSize = 10;
        double allianceBoost = Math.floor(boost * allianceSize);
        System.out.println(allianceBoost);
        int result = t - (int) allianceBoost;
        if (allianceBoost > t) return 0;
        return result;
    }
