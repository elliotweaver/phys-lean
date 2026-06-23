"""Print the exact monomials of each pc1(Proj_k)(Xz)(Xz) entry so we can read the
associator structure directly and write the Lean linear_combination by hand."""
from freesolve import Proj, Xz, pc1, a,b,c,p,q,r

def mstr(m):
    if isinstance(m, str): return m
    if m == (): return "1"
    return f"({mstr(m[0])}*{mstr(m[1])})"

if __name__ == "__main__":
    import sys
    k = int(sys.argv[1]) if len(sys.argv)>1 else 0
    M = pc1(Proj(k), Xz(a,b,c), Xz(p,q,r))
    print(f"=== Proj{k} ===")
    for i in range(3):
        for j in range(3):
            e = M[i][j]
            if not e:
                print(f"({i},{j}): 0"); continue
            print(f"({i},{j}):")
            for m,cf in sorted(e.items(), key=lambda kv: str(kv[0])):
                print(f"    {cf:+}  {mstr(m)}")
