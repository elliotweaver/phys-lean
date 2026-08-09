from fractions import Fraction as F

def mk(level):
    if level == 0:
        return (lambda a, b: [a[0]*b[0]], lambda a: [a[0]], 1)
    mul_lo, star_lo, d = mk(level-1)
    def mul(z, w):
        zr, zi = z[:d], z[d:]
        wr, wi = w[:d], w[d:]
        re = [x - y for x, y in zip(mul_lo(zr, wr), mul_lo(star_lo(wi), zi))]
        im = [x + y for x, y in zip(mul_lo(wi, zr), mul_lo(zi, star_lo(wr)))]
        return re + im
    def star(z):
        zr, zi = z[:d], z[d:]
        return star_lo(zr) + [-x for x in zi]
    return (mul, star, 2*d)

mulS, starS, _ = mk(4)

def e(i):
    v = [F(0)]*16; v[i] = F(1); return v
def add(u, v): return [a+b for a, b in zip(u, v)]
def scal(c, u): return [c*a for a in u]
def is_zero(u): return all(a == 0 for a in u)

def matrix_of(f):
    return [f(e(j)) for j in range(16)]

def rank(cols):
    rows = [[cols[c][r] for c in range(16)] for r in range(16)]
    rk = 0
    for col in range(16):
        sel = next((r for r in range(rk, 16) if rows[r][col] != 0), None)
        if sel is None: continue
        rows[rk], rows[sel] = rows[sel], rows[rk]
        pv = rows[rk][col]
        rows[rk] = [x/pv for x in rows[rk]]
        for r in range(16):
            if r != rk and rows[r][col] != 0:
                f2 = rows[r][col]
                rows[r] = [a - f2*b for a, b in zip(rows[r], rows[rk])]
        rk += 1
    return rk

if __name__ == '__main__':
    zdX = add(e(1), e(10)); zdY = add(e(5), e(14))
    assert is_zero(mulS(zdX, zdY))
    assert rank(matrix_of(lambda y: mulS(zdX, y))) == 12
    assert rank(matrix_of(lambda y: mulS(y, zdX))) == 12
    basis = [add(e(7), e(12)), add(scal(F(-1), e(6)), e(13)),
             add(e(5), e(14)), add(scal(F(-1), e(4)), e(15))]
    for b in basis:
        assert is_zero(mulS(zdX, b)) and is_zero(mulS(b, zdX))
    rays = []
    for i in range(1, 8):
        for k in range(1, 8):
            for s in [1, -1]:
                z = add(e(i), scal(F(s), e(8+k)))
                if rank(matrix_of(lambda y, z=z: mulS(z, y))) < 16:
                    rays.append((i, k, s))
    assert len(rays) == 84
    assert all(i != k for i, k, s in rays)
    assert len(set((i, k) for i, k, s in rays)) == 42
    import collections
    vec = {r: add(e(r[0]), scal(F(r[2]), e(8+r[1]))) for r in rays}
    adj = collections.defaultdict(set)
    for a in rays:
        for b in rays:
            if a != b and is_zero(mulS(vec[a], vec[b])):
                adj[a].add(b)
    assert all(len(adj[a]) == 4 for a in rays)
    assert all((b in adj[a]) == (a in adj[b]) for a in rays for b in rays if a != b)
    seen = set(); comps = []
    for a in rays:
        if a in seen: continue
        stack = [a]; comp = set()
        while stack:
            u = stack.pop()
            if u in comp: continue
            comp.add(u)
            stack.extend(v for v in adj[u] if v not in comp)
        seen |= comp; comps.append(comp)
    assert sorted(len(c) for c in comps) == [12]*7
    for c in comps:
        assert len(set(i ^ k for i, k, s in c)) == 1
    print("ALL RECON ASSERTIONS PASS: ker4 two-sided / 84 rays / 42 skeleton / 4-regular / 7x12 / XOR invariant")
