vector<vector<string>> requesttokens(const vector<string> &requests) {
    vector<vector<string>> ret;
    for(string s: requests) {
        transform(s.begin(), s.end(), s.begin(), ::tolower);

        int i=0;
        vector<string> tokens;
        while(i<s.size()) {
            while(i<s.size() && (s[i]<'a' || s[i]>'z')) ++i;
            int ts = i; // token start
            while(i<s.size() && (s[i]>='a' && s[i]<='z')) ++i;
            int te = i; // token end

            if(te>ts) tokens.push_back(s.substr(ts,te-ts));
        }
        sort(tokens.begin(), tokens.end());
        auto itr = unique(tokens.begin(), tokens.end());
        tokens.erase(itr, tokens.end());
        ret.push_back(tokens);
    }

    return ret;
}

vector<vector<int>> unionsizes(const vector<vector<string>> &tokens) {
    vector<vector<int>> ret(tokens.size(), vector<int>(tokens.size()));
    for(int i=0; i<tokens.size(); ++i) {
        for(int j=i+1; j<tokens.size(); ++j) {
            unordered_set<string> un;
            for(string si: tokens[i]) un.insert(si);
            for(string sj: tokens[j]) un.insert(sj);
            ret[i][j] = un.size();
        }
    }
    return ret;
}

vector<vector<int>> intersectsizes(const vector<vector<string>> &tokens) {
    vector<vector<int>> ret(tokens.size(), vector<int>(tokens.size()));
    for(int i=0; i<tokens.size(); ++i) {
        for(int j=i+1; j<tokens.size(); ++j) {
            unordered_set<string> s; // set i
            int tot = 0;
            for(string si: tokens[i]) s.insert(si);
            for(string sj: tokens[j])
                if(s.find(sj)!=s.end())
                    ++tot;
            ret[i][j] = tot;
        }
    }
    return ret;
}

std::vector<std::vector<int>> spamClusterization(std::vector<std::string> requests, std::vector<int> IDs, double threshold) {
    int s = requests.size();
    vector<vector<string>> rt = requesttokens(requests);
    vector<vector<int>> un = unionsizes(rt);
    vector<vector<int>> in = intersectsizes(rt);
    vector<int> clus(s);

    for(int i=0; i<s; ++i) clus[i]=i;

    for(int i=0; i<s; ++i) {
        for(int j=i+1; j<s; ++j) {
            if(in[i][j] >= un[i][j]*threshold) {
                clus[i] = min(clus[i],clus[j]);
                clus[j] = min(clus[i],clus[j]);
            }
        }
    }

    vector<vector<int>> ret;

    for(int i=0; i<s; ++i) {
        vector<int> iclus;
        for(int j=0; j<s; ++j) {
            if(clus[j] == i) iclus.push_back(IDs[j]);
        }
        if(iclus.size() > 1)
            ret.push_back(iclus);
    }

    for(auto &v: ret) sort(v.begin(), v.end());
    sort(ret.begin(), ret.end());
    return ret;

}