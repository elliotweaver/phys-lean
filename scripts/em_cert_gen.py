# em_cert_gen.py — THE E_m INSTANTIATION GENERATOR (cert_gen pattern):
# for a concrete odd-disc fundamental D, read the window's REAL
# arithmetic (factor every P(x)), tag each position by channel, assign
# seeded positions to their touching primes' root classes, and emit a
# Lean certificate firing em_skeleton end-to-end — every hypothesis
# discharged by norm_num on explicit numbers. FOLD-PURE: the tags ARE
# the factorizations; nothing modeled.
import math, os, sys

def is_prime(n):
    if n < 2: return False
    d = 2
    while d * d <= n:
        if n % d == 0: return False
        d += 1
    return True

def gen(absD, W):
    assert absD % 4 == 3
    c0 = (absD + 1) // 4
    xs = list(range(W))
    tags, assign, ps = {}, {}, []
    roots = {}   # p -> (r1, r2)
    B = 0
    for x in xs:
        v = x * x + x + c0
        if is_prime(v):
            tags[x] = 0; B += 1
            continue
        # find an ODD prime factor with a root class containing x
        n, f = v, []
        d = 2
        while d * d <= n:
            while n % d == 0: f.append(d); n //= d
            d += 1
        if n > 1: f.append(n)
        odd = sorted(set(p for p in f if p % 2 == 1))
        pick = None
        for p in odd:
            r = x % p
            rm = (p - 1 - x) % p
            if p not in roots:
                roots[p] = (r, rm if rm != r else (r + 0))
                pick = p; break
            else:
                r1, r2 = roots[p]
                if r == r1 or r == r2:
                    pick = p; break
        if pick is None:
            tags[x] = 0; B += 1   # 2-only or class-mismatch: allotment side
            continue
        tags[x] = 1
        assign[x] = pick
        if pick not in ps: ps.append(pick)
    m = len(ps) + 1
    cap = B + (m - 1) * (2 * (W // 3 + 1))
    assert W <= cap, "window exceeds cap — increase B accounting"
    # emit Lean
    tag_expr = ' else '.join(
        [f'if x = {x} then ({tags[x]} : Fin 3)' for x in xs[:-1]]
    ) + f' else ({tags[xs[-1]]} : Fin 3)'
    assign_expr = ' else '.join(
        [f'if x = {x} then {assign.get(x, 3)}' for x in xs[:-1]]
    ) + f' else {assign.get(xs[-1], 3)}'
    r1_expr = ' else '.join(
        [f'if p = {p} then {roots[p][0]}' for p in ps[:-1]]
    ) + (f' else {roots[ps[-1]][0]}' if ps else '0')
    r2_expr = ' else '.join(
        [f'if p = {p} then {roots[p][1]}' for p in ps[:-1]]
    ) + (f' else {roots[ps[-1]][1]}' if ps else '0')
    L = []
    A = L.append
    A('/-')
    A(f'  Certificates.GaussEmCert{absD} — E_m instantiation at D = -{absD}:')
    A(f'  window [0, {W}), every position tagged by its REAL factorization,')
    A(f'  em_skeleton fired end-to-end: {W} <= {B} + {m-1}*2*({W}/3+1) = {cap}.')
    A(f'  Channels: {B} prime/allotment, {W-B} seeded into ps = {ps}')
    A(f'  (root classes {dict((p, roots[p]) for p in ps)}). AUTO-GENERATED.')
    A('-/')
    A('import Phys.Algebra.GaussEmSkeleton')
    A('')
    A(f'namespace Certificates.EmCert{absD}')
    A('open Phys.Foundation.GaussForms.BQF')
    A('')
    A(f'theorem cert : ([{", ".join(str(x) for x in xs)}] : List Nat).length ≤')
    A(f'    {B} + ({m} - 1) * (2 * ({W} / 3 + 1)) := by')
    A(f'  refine em_skeleton (W := {W}) (B := {B}) (m := {m})')
    A(f'    [{", ".join(str(x) for x in xs)}]')
    A(f'    (fun x => {tag_expr})')
    A(f'    [{", ".join(str(p) for p in ps)}]')
    A(f'    (fun x => {assign_expr})')
    A(f'    (fun p => {r1_expr})')
    A(f'    (fun p => {r2_expr}) ?_ ?_ ?_ ?_ ?_ ?_')
    A('  · -- pairwise distinct')
    for i in range(W - 1):
        A('    refine List.pairwise_cons.mpr ⟨?_, ?_⟩')
        A('    · intro b hb; fin_cases hb <;> norm_num')
    A('    exact List.pairwise_singleton _ _')
    A('  · intro x hx htag')
    A('    fin_cases hx')
    for x in xs:
        if tags[x] == 1:
            A('    · exact ⟨by norm_num, by decide, by decide⟩')
        else:
            A('    · exact absurd htag (by decide)')
    A('  · intro p hp')
    A('    fin_cases hp <;> exact ⟨by norm_num, by decide, by decide⟩')
    A('  · decide')
    A('  · norm_num')
    A('  · intro p hp')
    A('    fin_cases hp <;> norm_num')
    A('')
    A('#print axioms cert')
    A('')
    A(f'end Certificates.EmCert{absD}')
    return '\n'.join(L) + '\n', B, m, ps

if __name__ == '__main__':
    absD = int(sys.argv[1]) if len(sys.argv) > 1 else 59
    W = int(sys.argv[2]) if len(sys.argv) > 2 else 6
    txt, B, m, ps = gen(absD, W)
    out = os.path.expanduser(f'~/phys-lean/Certificates/GaussEmCert{absD}.lean')
    open(out, 'w', encoding='utf-8').write(txt)
    print(f'D=-{absD} W={W}: B={B}, m={m}, ps={ps} -> {out}')
