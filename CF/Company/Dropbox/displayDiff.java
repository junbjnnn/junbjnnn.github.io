    static String displayDiff(String oldVersion, String newVersion) {
        String OBased = _displayDiff(oldVersion, newVersion, false);
        String GreedBased = _displayDiff(oldVersion, newVersion, true);
        if (OBased.length() < GreedBased.length())
            return OBased;
        if (OBased.length() > GreedBased.length())
            return GreedBased;
        if (compareString(OBased, GreedBased) < 0)
            return OBased;
        return GreedBased;
    }

    static String _displayDiff(String oldVersion, String newVersion, boolean greedy) {
        if (!hasCommonChar(oldVersion, newVersion))
            return _write(new String[]{oldVersion, newVersion, ""});
        if (oldVersion.isEmpty() && newVersion.isEmpty()) {
            return "";
        }
        if (oldVersion.isEmpty()) {
            return "[" + newVersion + "]";
        }
        if (newVersion.isEmpty()) {
            return "(" + oldVersion + ")";
        }
        Object[] out = findFirstDiffs(oldVersion, newVersion, greedy);

        if (greedy) {
            // findDiff(Dold, Dnew) + C + findDiff(Old-C, new -C)
            String D_old = (String) out[0];
            String D_new = (String) out[1];
            String C = (String) out[2];
            String R_old = oldVersion.substring((Integer) out[3] == -1 ? oldVersion.length() : (Integer) out[3]);
            String R_new = newVersion.substring((Integer) out[4] == -1 ? newVersion.length() : (Integer) out[4]);
            return _displayDiff(D_old, D_new, true) + C + _displayDiff(R_old, R_new, true);
        } else {
            return _write(new String[]{(String) out[0], (String) out[1], (String) out[2]})
                    + _displayDiff(oldVersion.substring((Integer) out[3]), newVersion.substring((Integer) out[4]), false);
        }

    }

    static boolean hasCommonChar(String o, String n) {
        for (char c : o.toCharArray())
            if (n.contains(String.valueOf(c)))
                return true;
        return false;
    }

    // process the first chunk (from start until common chunk is found) of the comparison
    static Object[] findFirstDiffs(String oldStr, String newStr, boolean greedy) {
        System.out.printf("\nold: %s\nnew: %s\n", oldStr, newStr);
        String D_old;
        String D_new;
        String C;
        Integer nextOldIndex;
        Integer nextNewIndex;

        int[] peace = greedy ? goUntilPeaceGreedy(oldStr, newStr) : goUntilPeaceTradition(oldStr, newStr);
        if (peace[1] != -1) {
            D_old = oldStr.substring(0, peace[0]);
            D_new = newStr.substring(0, peace[1]);

            int clashIndex = goUntilClash(oldStr.substring(D_old.length()), newStr.substring(D_new.length()));
            C = oldStr.substring(D_old.length(), D_old.length() + clashIndex);
            nextOldIndex = D_old.length() + clashIndex;
            nextNewIndex = D_new.length() + clashIndex;
        } else {
            D_old = oldStr;
            D_new = newStr;
            C = "";
            nextOldIndex = oldStr.length();
            nextNewIndex = newStr.length();
        }
        return new Object[]{D_old, D_new, C, nextOldIndex, nextNewIndex};
    }

    // write to result
    static String _write(String[] chunks) {
        String D_old_str = chunks[0].isEmpty() ? "" : "(" + chunks[0] + ")";
        String D_new_str = chunks[1].isEmpty() ? "" : "[" + chunks[1] + "]";
        if (chunks[1].equals(chunks[2])) {
            return D_old_str + chunks[2] + D_new_str; // for the requirement: lexicographically smallest and letter < '['
        }
        return D_old_str + D_new_str + chunks[2];
    }

    // go until clash
    static int goUntilClash(String o, String n) {
        int i = 0;
        while (i < Math.min(o.length(), n.length()) && o.charAt(i) == n.charAt(i))
            i++;
        return i;
    }

    // go until first common chunk is found
    static int[] goUntilPeaceTradition(String o, String n) {
        int oi = 0;
        int ni;
        for (ni = 0; ni < n.length(); ni++) {
            for (oi = 0; oi < o.length(); oi++) {
                if (n.charAt(ni) == o.charAt(oi)) {
                    return new int[]{oi, ni};
                }
            }
        }
        return new int[]{oi, -1};
    }

    // go until longest common chunk is found
    static int[] goUntilPeaceGreedy(String o, String n) {
        int oi = -1;
        int ni = -1;
        String max = "";
        for (int i = 0; i < o.length(); i++) {
            for (int k = i + 1; k <= o.length(); k++) {
                String cur = o.substring(i, k);
                int n_i = n.indexOf(cur);
                if (cur.length() > max.length() && n_i >= 0) {
                    // updates max
                    max = cur;
                    //updates indices
                    oi = i;
                    ni = n_i;
                }
            }
        }
        return new int[]{oi, ni};
    }

    static int compareString(String a, String b) {
        a = convertBraces(a);
        b = convertBraces(b);
        return a.compareTo(b);
    }

    // silly conversion but it works for the required comparing criteria
    static String convertBraces(String a) {
        String newOpenP = String.valueOf(((char) 123));
        String newCloseP = String.valueOf(((char) 124));
        String newOpenB = String.valueOf(((char) 125));
        String newCloseB = String.valueOf(((char) 126));

        return a.replace("(", newOpenP)
                .replace(")", newCloseP)
                .replace("[", newOpenB)
                .replace("]", newCloseB);
    }