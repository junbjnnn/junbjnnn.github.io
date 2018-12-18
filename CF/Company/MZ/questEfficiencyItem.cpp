int questEfficiencyItem(std::vector<int> h, std::vector<int> points, int timeForQuests) {
    int s = h.size();
    vector<vector<int>> dp(s+1,vector<int>(timeForQuests+1));

    for(int r=1; r<=s; ++r)
        for(int c=1; c<=timeForQuests; ++c)
            if(h[r-1]>c)
                dp[r][c] = dp[r-1][c];
            else
                dp[r][c] = max(dp[r-1][c],dp[r-1][c-h[r-1]]+points[r-1]);

    return dp[s][timeForQuests];
}