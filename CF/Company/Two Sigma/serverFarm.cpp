template<typename T> void print_queue(T& q) {
    while(!q.empty()) {
        std::cout << q.top() << " ";
        q.pop();
    }
    std::cout << '\n';
}

class Job{
public:
    int index;
    int time;
    Job(int i, int t){
        index = i;
        time = t;
    }

    bool operator < (const Job& str) const
    {
        if(time == str.time) return index < str.index;
        else return (time > str.time);
    }
};

class Process{
public:
    int id;
    int time;
    Process(int _x, int _y)
    {
        id = _x;
        time = _y;
    }
    int getId() const { return id; }
    int getTime() const { return time; }
};

class myComparator
{
public:
    int operator() (const Process& p1, const Process& p2)
    {
        if( p1.getTime() == p2.getTime() ) return p1.getId() > p2.getId();
        else return p1.getTime()>p2.getTime();
    }
};

std::vector<std::vector<int>> serverFarm(std::vector<int> jobs, int servers) {
    std::vector<std::vector<int>> r;
    priority_queue <Process, vector<Process>, myComparator > pq;
    vector<Job> js;

    for(int i = 0; i < servers; i++){
        pq.push( Process(i,0) );
        vector<int> t;
        r.push_back( t );
    }
    for(int i = 0; i < jobs.size(); i++)
        js.push_back( Job(i, jobs[i]) );

    sort(js.begin(), js.end());

    for(int i = 0; i < jobs.size(); i++){
        priority_queue <Process, vector<Process>, myComparator > temp = pq;
        cout << "current i: " << i<< endl;
        while(!temp.empty()){
            Process t = temp.top();
            cout << "server: " << t.id << " | current time: " << t.time << endl;
            temp.pop();
        }
        cout << endl;

        Process p = pq.top();
        pq.pop();
        p.time += js[i].time;
        pq.push(p);

        r[p.id].push_back( js[i].index );
    }

    return r;
}