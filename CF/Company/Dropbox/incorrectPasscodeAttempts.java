    static boolean incorrectPasscodeAttempts(String passcode, String[] attempts) {
        int count = 0;
        for (String attempt : attempts) {
            if (!attempt.equals(passcode))
                count++;
            else
                count = 0;
            if (count == 10)
                return true;
        }
        return false;
    }