def domainType(domains):
    arr = []
    fi = {".com": "commercial" ,".org": "organization", ".net": "network", ".info":"information"}
    for d in domains:
        res = d[d.rfind('.'):]
        arr.append(fi[res])
    return arr