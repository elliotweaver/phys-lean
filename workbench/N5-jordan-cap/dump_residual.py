"""dump_residual: after reducing entry (i,j) against the combined_span pool, print the
leftover residual monomials. This shows EXACTLY which associator structure the current
lever pool fails to cancel -> tells us the missing transport lever shape (W9.7: WRITE the
proof). Reuses combined_span's model + pool verbatim."""
import sys
import combined_span as cs

i, j = int(sys.argv[1]), int(sys.argv[2])
E = cs.D[i][j]
pool = cs.gen_pool(E)

# replicate solve() but return the residual vector + provenance
from fractions import Fraction as F
monset = set(E)
for _, v in pool: monset |= set(v)
order = {m: k for k, m in enumerate(sorted(monset, key=str))}
def lead(v): return min(v, key=lambda m: order[m])
pivots = {}
def reduce_vec(v, prov):
    v = dict(v); prov = dict(prov)
    while v:
        lm = lead(v)
        if lm in pivots:
            pv, pprov = pivots[lm]
            f = v[lm]/pv[lm]
            v = cs.add(v, {m: -f*cc for m, cc in pv.items()})
            for k, cc in pprov.items(): prov[k] = prov.get(k, F(0)) - f*cc
        else: return v, prov, lm
    return v, prov, None
for idx, (nm, v) in enumerate(pool):
    rv, rp, lm = reduce_vec(v, {idx: F(1)})
    if rv: pivots[lm] = (rv, rp)
rb, bprov, lm = reduce_vec(dict(E), {})
print(f"entry ({i},{j}): residual has {len(rb)} monomials")
def fmt(m):
    if isinstance(m, str): return m
    return "(" + fmt(m[0]) + "*" + fmt(m[1]) + ")"
for m, c in sorted(rb.items(), key=lambda t: cs.degree if False else str(t[0])):
    print(f"   {c:+}  {fmt(m)}")
