    double[] fareEstimator(int ride_time, int ride_distance, double[] cost_per_minute, double[] cost_per_mile) {
        double[] arr = new double[cost_per_mile.length];
        for (int i = 0; i < cost_per_mile.length; i++) {
            arr[i] = cost_per_minute[i] * ride_time + cost_per_mile[i] * ride_distance;
        }
        return arr;
    }