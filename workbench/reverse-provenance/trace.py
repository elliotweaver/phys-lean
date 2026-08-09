#!/usr/bin/env python
"""Trace import chains: for a given module, find a path from the roots to it,
and list its direct importers within/outside the closure."""
import json, os, sys
from collections import deque

OUT = os.path.dirname(os.path.abspath(__file__))
edges = json.load(open(os.path.join(OUT, "edges.json")))
closure = set(open(os.path.join(OUT, "closure.txt")).read().split())
roots = ["Phys.Algebra.MirrorFixedPoint", "Phys.Algebra.AlphaLandingFinal"]

def path_to(target):
    # BFS from roots following import edges
    prev = {r: None for r in roots}
    q = deque(roots)
    while q:
        m = q.popleft()
        if m == target:
            path = []
            while m:
                path.append(m)
                m = prev[m]
            return list(reversed(path))
        for i in edges.get(m, []):
            if i not in prev:
                prev[i] = m
                q.append(i)
    return None

for target in sys.argv[1:]:
    print("=== ", target)
    p = path_to(target)
    if p:
        print(" path:", " -> ".join(p))
    else:
        print(" NOT in closure")
    importers = [m for m, imps in edges.items() if target in imps]
    print(" importers:", [(m, m in closure) for m in importers])
