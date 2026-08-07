# xm_boundary_gen.py — THE BOUNDARY-FORM E_m CERTIFICATE (the
# contrapositive direction, the artifact that emits X_m):
# For (m, D) with D above the crossing: the window [0, W) with
# W = B_cert + (m−1)·2(W/3+1) + 1 CANNOT be paid by < m touching
# primes — so seedcount(D) ≥ m, KERNEL-CHECKED per-D. The certificate
# does NOT assume the tags: it proves, for the CLAIMED touching set
# ps (|ps| = m−1... the certificate takes the REAL touching set and
# shows it already has ≥ m members — the direct route):
#
# HONEST DESIGN DECISION (fold-native, BS-meter): the cleanest kernel
# artifact is DIRECT, not contrapositive — for concrete D, exhibit m
# distinct deep touching primes with their (p, x_p, m_p) witnesses and
# fire seeds_force_h/floor machinery (N618-N624 chain, already
# production!). The em_skeleton contrapositive is the UNIFORM tool
# (for the ∀D>X_m theorem); per-D, direct witnesses are strictly
# stronger and already have their production consumer. So THIS
# generator emits DIRECT seedcount certificates:
#   theorem seedcount_ge : ∃ (list of m primes, pairwise distinct,
#     each deep + touching) — i.e. seedcount(D) ≥ m as a witness list.
# X_m then = max(E^2_m) + 1 with E^2_m certified empty above by the
# per-D sweep... the UNIFORM statement stays with the return-law
# route; per-D certificates are the bricks.
import math, os, sys

def is_prime(n):
    if n < 2: return False
    d = 2
    while d * d <= n:
        if n % d == 0: return False
        d += 1
    return True

def gen(absD, m):
    assert absD % 4 == 3
    c0 = (absD + 1) // 4
    ws = []
    p = 3
    while len(ws) < m:
        if 4 * p * p > absD:
            raise SystemExit(f'D=-{absD}: only {len(ws)} deep touching primes < m={m}')
        if is_prime(p):
            x = next((x for x in range(0, (p - 1) // 2 + 1)
                      if (x * x + x + c0) % p == 0), None)
            if x is not None:
                ws.append((p, x, (x * x + x + c0) // p))
        p += 2
    L = []
    A = L.append
    A('/-')
    A(f'  Certificates.GaussSeedcount{absD}_{m} — seedcount(-{absD}) ≥ {m}:')
    A(f'  {m} distinct deep touching primes with explicit witnesses, each')
    A(f'  4p² ≤ {absD} and p | P(x_p) kernel-checked. Feeds the banked floor')
    A(f'  machinery (seeds_force_h, N624): h(-{absD}) ≥ {m + 1}. AUTO-GENERATED.')
    A('-/')
    A('import Phys.Algebra.GaussCertificate')
    A('')
    A(f'namespace Certificates.Seedcount{absD}_{m}')
    A('open Phys.Foundation.GaussForms.BQF')
    A('open Phys.Foundation')
    A('')
    A(f'/-- The witness list: {m} deep touching primes of D = -{absD}. -/')
    A(f'theorem seedcount_ge :')
    A(f'    ∃ ps : List Z, ps.length = {m} ∧ List.Pairwise (· ≠ ·) ps ∧')
    A(f'    (∀ p ∈ ps, (2 : Z) ≤ p ∧ 4 * (p * p) ≤ ({absD} : Z) ∧')
    A(f'      ∃ x mm : Z, x * x + x + {c0} = p * mm) := by')
    A(f'  refine ⟨[{", ".join(str(p) for p, _, _ in ws)}], rfl, ?_, ?_⟩')
    A('  · -- pairwise distinct (strictly increasing)')
    for i in range(m - 1):
        A('    refine List.pairwise_cons.mpr ⟨?_, ?_⟩')
        A('    · intro b hb; fin_cases hb <;> norm_num')
    A('    exact List.pairwise_singleton _ _')
    A('  · intro p hp')
    A('    fin_cases hp')
    for p_, x_, m_ in ws:
        A(f'    · exact ⟨by norm_num, by norm_num, {x_}, {m_}, by norm_num⟩')
    A('')
    A('#print axioms seedcount_ge')
    A('')
    A(f'end Certificates.Seedcount{absD}_{m}')
    return '\n'.join(L) + '\n', ws

if __name__ == '__main__':
    absD = int(sys.argv[1]) if len(sys.argv) > 1 else 407
    m = int(sys.argv[2]) if len(sys.argv) > 2 else 2
    txt, ws = gen(absD, m)
    out = os.path.expanduser(
        f'~/phys-lean/Certificates/GaussSeedcount{absD}_{m}.lean')
    open(out, 'w', encoding='utf-8').write(txt)
    print(f'D=-{absD} m={m}: witnesses {ws} -> GaussSeedcount{absD}_{m}.lean')
