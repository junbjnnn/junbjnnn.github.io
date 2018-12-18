    public static double companyBotStrategy(int[][] trainingData) {

        int correct = 0;
        int correctCount = 0;

        int didNotAnswer = 0;

        int incorrect = 0;

        for (int[] aTrainingData : trainingData) {

            if (aTrainingData[1] == 1) {
                correct = correct + aTrainingData[0];
                correctCount++;
            } else if (aTrainingData[1] == 0) {
                didNotAnswer = didNotAnswer + aTrainingData[0];
            } else if (aTrainingData[1] == -1) {
                incorrect = incorrect + aTrainingData[0];
            }
        }

        double average = 0.0;

        if (correct > 0)
            average = (double) correct / (double) correctCount;

        return average;

    }