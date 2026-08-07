# silence_cert_gen.py — THE SILENCE CATALOGUE, kernel-certified: for the
# odd-disc members of the honest E_1 roster (the fold's total-deferral
# catalogue, ends at 403), certify per-D that EVERY deep odd prime is
# totally blocked — deferral_law with the explicit finite checks, every
# non-divisibility a concrete integer argument. FOLD-PURE: the checks
# ARE the catalogue; nothing modeled, nothing asymptotic.
#
# Scope (honest): odd-disc members with a nonempty deep gate:
#   43, 67, 91 (p=3), 163 (p=3,5), 187 (p=3,5), 403 (p=3,5,7).
# Members with empty gate (|D| < 36) are gate-empty (vacuously silent);
# the 2-channel (parity) certificate is the named next artifact.
import math, os, sys

def is_prime(n):
    if n < 2: return False
    d = 2
    while d * d <= n:
        if n % d == 0: return False
        d += 1
    return True

def zcases(mv):
    # theorem zcases<mv>: 0 ≤ x ≤ mv ⟹ x = 0 ∨ ... ∨ x = mv
    # properly NESTED: each continuation branch opens deeper indentation.
    L = []
    A = L.append
    disj = ' ∨ '.join(f'x = {i}' for i in range(mv + 1))
    A(f'theorem zcases{mv} (x : Z) (h0 : 0 ≤ x) (hm : x ≤ {mv}) : {disj} := by')
    for i in range(mv):
        ind = '  ' * (i + 1)
        A(f'{ind}rcases lt_trichotomy x {i} with ha{i} | hb{i} | hc{i}')
        A(f'{ind}· linarith')
        term = f'Or.inl hb{i}'
        for _ in range(i):
            term = f'Or.inr ({term})'
        A(f'{ind}· exact {term}')
        A(f'{ind}· have hge{i+1} : ({i+1} : Z) ≤ x := by')
        A(f'{ind}    have := z_pos_ge_one (show (0:Z) < x - {i} by linarith)')
        A(f'{ind}    linarith')
    ind = '  ' * (mv + 1)
    term = '(by linarith : x = ' + str(mv) + ')'
    for _ in range(mv):
        term = f'Or.inr ({term})'
    A(f'{ind}exact {term}')
    return L

def nondvd(p, v, k='k'):
    # emit tactic block proving v = p*k → False (p ∤ v, concrete)
    q, r = divmod(v, p)
    assert r != 0
    L = []
    A = L.append
    A(f'    have h2 : {p} * ({k} - {q}) = {r} := by linarith')
    A(f'    rcases lt_trichotomy ({k} - {q}) 0 with hc | hc | hc')
    A(f'    · nlinarith [z_pos_ge_one (show (0:Z) < -({k} - {q}) by linarith)]')
    A(f'    · rw [hc] at h2; norm_num at h2')
    A(f'    · nlinarith [z_pos_ge_one hc]')
    return L

def gen(absD):
    assert absD % 4 == 3
    c0 = (absD + 1) // 4
    deep = [p for p in range(3, math.isqrt(absD) // 2 + 1, 2)
            if is_prime(p) and 4 * p * p <= absD]
    assert deep, "gate-empty member: no certificate needed"
    for p in deep:
        for x in range((p - 1) // 2 + 1):
            assert (x * x + x + c0) % p != 0, f"p={p} touches at x={x}!"
    L = []
    A = L.append
    A('/-')
    A(f'  Certificates.GaussSilence{absD} — THE SILENCE of D = -{absD}: every')
    A(f'  deep odd prime ({", ".join(map(str, deep))}) is TOTALLY BLOCKED on the')
    A(f'  principal branch x² + x + {c0} — deferral_law from the finite checks.')
    A(f'  A kernel-certified member of the total-deferral catalogue (E_1,')
    A(f'  honest 2-channel roster; catalogue ends at 403). AUTO-GENERATED.')
    A('-/')
    A('import Phys.Algebra.GaussDeferral')
    A('import Phys.Algebra.GaussCompose')
    A('')
    A(f'namespace Certificates.Silence{absD}')
    A('open Phys.Foundation.GaussForms.BQF')
    A('open Phys.Foundation')
    A('')
    mvs = sorted(set((p - 1) // 2 for p in deep if (p - 1) // 2 >= 2))
    for mv in mvs:
        L += zcases(mv)
        A('')
    for p in deep:
        m = (p - 1) // 2
        A(f'/-- {p} never divides x² + x + {c0} — from {m + 1} checks. -/')
        A(f"theorem blocked_{p} : ∀ x : Z, ¬ ZDvd' {p} (x * x + x + {c0}) := by")
        A(f'  apply deferral_law (m := {m}) (by norm_num) (by norm_num)')
        A("  intro x' h0 h1 hdvd")
        A('  obtain ⟨k, hk⟩ := hdvd')
        if m == 1:
            A("  have hx : x' = 0 ∨ x' = 1 := z_zero_or_one (by linarith) h1")
        else:
            disj = " ∨ ".join(f"x' = {i}" for i in range(m + 1))
            A(f"  have hx : {disj} := zcases{m} x' h0 h1")
        pats = ' | '.join(['rfl'] * (m + 1))
        A(f'  rcases hx with {pats}')
        for x in range(m + 1):
            v = x * x + x + c0
            A(f'  · -- P({x}) = {v}: {p} ∤ {v}')
            L += nondvd(p, v)
        A('')
    A(f'/-- THE SILENCE: every deep odd prime of D = -{absD} is blocked. -/')
    A(f'theorem silence : ∀ p : Z, (p = ' +
      ' ∨ p = '.join(map(str, deep)) + ') →')
    A(f"    ∀ x : Z, ¬ ZDvd' p (x * x + x + {c0}) := by")
    A('  intro p hp x')
    A('  rcases hp with ' + ' | '.join(['rfl'] * len(deep)))
    A('  ' + '\n  '.join(f'· exact blocked_{p} x' for p in deep))
    A('')
    A('#print axioms silence')
    A('')
    A(f'end Certificates.Silence{absD}')
    return '\n'.join(L) + '\n'

if __name__ == '__main__':
    targets = [int(a) for a in sys.argv[1:]] or [43, 67, 91, 163, 187, 403]
    for absD in targets:
        txt = gen(absD)
        out = os.path.expanduser(f'~/phys-lean/Certificates/GaussSilence{absD}.lean')
        open(out, 'w', encoding='utf-8').write(txt)
        print(f'D=-{absD}: silence certificate -> GaussSilence{absD}.lean')
