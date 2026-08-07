# cage_cert_gen.py — THE CAGE INSTANTIATION GENERATOR (audit item ii):
# for a concrete deferring D, emit the kernel certificate firing
# deferring_h_bound on D's REAL box through its REAL two-family cage.
# The generator computes: the full reduced box (exact ledger), the
# 2-tower [1,2,4,...] ≤ gate, the band-touch list; asserts every box
# a-value lands in the cage (STRUCTURE THEOREM live: if it fails, the
# D isn't deferring or the theory is wrong — it never fails); emits
# explicit membership + filter routes (Z-eq undecidable: no decide on
# Z, norm_num per position). Certificate conclusion: h(D) = box length
# ≤ (T₂ + B)·K on D's real numbers — the H(m) statement instantiated.
import math, os, sys

def is_prime(n):
    if n < 2: return False
    d = 2
    while d * d <= n:
        if n % d == 0: return False
        d += 1
    return True

def reduced_box(A):
    # all reduced forms (a, b, c): b² − 4ac = −A, −a < b ≤ a ≤ c
    box = []
    for a in range(1, math.isqrt(A // 3) + 1):
        for b in range(-a + 1, a + 1):
            if (b * b + A) % (4 * a) == 0:
                c = (b * b + A) // (4 * a)
                if c >= a:
                    box.append((a, b, c))
    return box

def touches(p, c0):
    return any((x * x + x + c0) % p == 0 for x in range((p - 1) // 2 + 1))

def gen(A):
    assert A % 4 == 3
    c0 = (A + 1) // 4
    gate = math.isqrt(A // 3)
    half = math.isqrt(A) // 2
    box = reduced_box(A)
    h = len(box)
    two_tower = []
    t = 1
    while t <= gate:
        two_tower.append(t)
        t *= 2
    band = [p for p in range(half + 1, gate + 1)
            if is_prime(p) and touches(p, c0)]
    deep = [p for p in range(3, half + 1, 2)
            if 4 * p * p <= A and is_prime(p) and touches(p, c0)]
    # THE HONEST CAGE (N634 structure + N636 exactness): exactness
    # kills cofactors ≥ 2 only at SHALLOW (band) primes — DEEP touching
    # primes compose freely (towers 3², products 3·5, ...). Cage =
    # {2^j · deep-smooth · (1 or ONE band prime)} ≤ gate. Enumerate
    # deep-smooth numbers by BFS, then multiply in 2-powers and band.
    smooth = [1]
    i = 0
    while i < len(smooth):
        x = smooth[i]; i += 1
        for dp in deep:
            y = x * dp
            if y <= gate and y not in smooth: smooth.append(y)
    cage = []
    for sm in smooth:
        t = sm
        while t <= gate:
            if t not in cage: cage.append(t)
            for bp in band:
                z = t * bp
                if z <= gate and z not in cage: cage.append(z)
            t *= 2
    cage.sort()
    avals = sorted(set(a for a, _, _ in box))
    missing = [a for a in avals if a not in cage]
    assert not missing, f"A={A}: a-values {missing} outside cage — NOT deferring-shaped"
    K = max(sum(1 for f in box if f[0] == a) for a in cage)
    T = len(cage)
    assert h <= T * K
    L = []
    Ap = L.append
    Ap('/-')
    Ap(f'  Certificates.GaussCageCert{A} — THE CAGE INSTANTIATION at D = -{A}:')
    Ap(f'  the REAL box ({h} reduced forms) through the REAL cage')
    Ap(f'  (2-tower {two_tower} ++ deep {deep} ++ band {band}), K = {K}:')
    Ap(f'  h = {h} ≤ {T}·{K}. deferring_h_bound fired END-TO-END on real')
    Ap(f'  numbers; every membership/filter by explicit route. AUTO-GENERATED.')
    Ap('-/')
    Ap('import Phys.Algebra.GaussSignatureBound')
    Ap('')
    Ap('set_option maxRecDepth 8192')
    Ap('set_option maxHeartbeats 1600000')
    Ap('')
    Ap(f'namespace Certificates.CageCert{A}')
    Ap('open Phys.Foundation.GaussForms.BQF')
    Ap('open Phys.Foundation')
    Ap('')
    box_lit = ', '.join(f'⟨{a}, {b}, {c}⟩' for a, b, c in box)
    Ap(f'def theBox : List GaussForms.BQF := [{box_lit}]')
    Ap('')
    rest = [w for w in cage if w not in two_tower]
    tow_lit = ', '.join(map(str, two_tower))
    rest_lit = ', '.join(map(str, rest))
    Ap(f'def twoTower : List Z := [{tow_lit}]')
    Ap(f'def bandDeep : List Z := [{rest_lit}]' if rest_lit else 'def bandDeep : List Z := []')
    Ap('')
    Ap(f'/-- h(-{A}) = {h} ≤ ({len(two_tower)} + {T - len(two_tower)})·{K}: the H-bound on real numbers. -/')
    Ap(f'theorem cage_cert : theBox.length ≤ ({len(two_tower)} + {T - len(two_tower)}) * {K} := by')
    Ap(f'  refine deferring_h_bound (T₂ := {len(two_tower)}) (B := {T - len(two_tower)}) (K := {K})')
    Ap('    twoTower bandDeep theBox (by norm_num [twoTower]) (by norm_num [bandDeep]) ?_ ?_')
    Ap('  · intro f hf')
    Ap('    fin_cases hf')
    full = two_tower + [w for w in cage if w not in two_tower]
    for a, b, c in box:
        idx = full.index(a)
        route = 'List.mem_cons_self ..' if idx == 0 else \
            'List.mem_cons_of_mem _ (' * idx + 'List.mem_cons_self ..' + ')' * idx
        Ap(f'    · show ({a} : Z) ∈ twoTower ++ bandDeep')
        Ap(f'      exact {route}')
    Ap('  · intro p hp')
    Ap('    fin_cases hp')
    for pv in full:
        kept = [(a, b, c) for (a, b, c) in box if a == pv]
        kept_lit = ', '.join(f'⟨{a}, {b}, {c}⟩' for a, b, c in kept)
        Ap(f'    · -- p = {pv}: filter keeps exactly {len(kept)} form(s)')
        Ap(f'      show (theBox.filter (fun f => decide (f.a = ({pv} : Z)))).length ≤ {K}')
        Ap(f'      rw [show theBox.filter (fun f => decide (f.a = ({pv} : Z)))')
        Ap(f'            = [{kept_lit}] by')
        Ap('        simp only [theBox, List.filter]')
        Ap('        norm_num]')
        Ap('      norm_num')
    if h > K:
        # generic bound insufficient — need per-p filters; fall back:
        # use K = h (still a valid fired instance; sharp K via explicit
        # filter routes is the v2 refinement)
        pass
    Ap('')
    Ap('#print axioms cage_cert')
    Ap('')
    Ap(f'end Certificates.CageCert{A}')
    return '\n'.join(L) + '\n', h, T, K, two_tower, deep, band

if __name__ == '__main__':
    A = int(sys.argv[1]) if len(sys.argv) > 1 else 403
    txt, h, T, K, tw, dp, bd = gen(A)
    # v3: sharp K via explicit per-p filter routes — no override needed.
    out = os.path.expanduser(f'~/phys-lean/Certificates/GaussCageCert{A}.lean')
    open(out, 'w', encoding='utf-8').write(txt)
    print(f'A={A}: h={h}, cage={T} (tower {len(tw)} + deep {len(dp)} + band {len(bd)}), K={K} -> GaussCageCert{A}.lean')
