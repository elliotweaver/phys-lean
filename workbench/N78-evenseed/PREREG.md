# PREREG — N78: THE EVEN-RUNG OBSTRUCTION REMOVER — a negative-discriminant quadratic in an
# EvC-self-adjoint operator over the positive-definite reference form is INJECTIVE hence INVERTIBLE.
# (The companion to N77 `dim_odd_has_eigenvector`; the even-dimensional seed lever; over the
#  derived ℝ Cut + the terminal algebra O Cut.)

FROZEN BEFORE COMPUTE.

## THE NODE (specified against what the chain actually produced — ROADMAP §N78 FORWARD FRONTIER)
The FULL n-dim spectral existence ∀ g, ∃ c u, g = specOpN c u needs a guaranteed real eigenvalue to
SEED the N70 deflateC / N74 deflateList iterated descent. N77 banked `dim_odd_has_eigenvector` — a
real eigenvalue at every ODD dimension (odd-degree charpoly has a root over the real-closed Cut). The
deflation cascade descends 10 → 9 → 8 → … so the EVEN rungs (10, 8, 6, …) STILL need a guaranteed
eigenpair, and an even-degree charpoly need NOT have a root over a real-closed (non-alg-closed) field —
UNLESS the operator is SELF-ADJOINT w.r.t. a POSITIVE-DEFINITE form. That is the genuine even-rung
obstruction, and it is exactly what the trunk supplies: the reference form EvC (N58) is positive-
DEFINITE (N58 EvC_eq_zero_iff) and the deflated operators stay EvC-self-adjoint (N70 deflateC_isEvCSymm).

## THE ONE LAW / W1 REFRAME (theory right, instrument wrong — the standard hard path dissolves)
Mathlib has NO real-closed→alg-closed (Artin–Schreier), NO real-closed charpoly factorization, NO
self-adjoint spectral theorem over a general field (confirmed: FieldTheory/IsRealClosed/Basic.lean is
a 127-line stub with only `of_linearOrderedField` + square/odd-root API; no factorization). The classical
even-dim self-adjoint real-eigenvalue proof (maximize the Rayleigh quotient / compactness) needs analysis
unavailable over Cut. It DISSOLVES through the trunk instead:

  Over the real-closed Cut, a monic charpoly is a product of LINEAR factors (X − λ) and IRREDUCIBLE
  QUADRATIC factors (X² + bX + c with NEGATIVE discriminant b² − 4c < 0). For a SELF-ADJOINT g w.r.t.
  the POSITIVE-DEFINITE EvC, EVERY negative-discriminant quadratic factor `g² + b•g + c•1` is INJECTIVE:
  for v ≠ 0, with α := EvC(gv)(gv) ≥ 0, β := EvC(gv)v, γ := EvC v v > 0 (positive-definite),
    EvC((g²+bg+c)v, v) = α + bβ + cγ   (bilinearity + self-adjointness: EvC(g(gv))v = EvC(gv)(gv) = α),
  and the EvC-nonneg quadratic at t = −b/2,
    0 ≤ EvC(gv − t•v)(gv − t•v) = α − 2tβ + t²γ  ⟹  α + bβ + (b²/4)γ ≥ 0,
  hence  α + bβ + cγ ≥ (c − b²/4)γ = ((4c − b²)/4)·γ > 0 ≠ 0  — so (g²+bg+c)v ≠ 0.
  Injective on the FINITE-dim STVC (N76 Module.Finite Cut STVC) ⟹ BIJECTIVE (injective_iff_surjective)
  ⟹ a LINEAR-MAP unit / invertible.

  This is the even-rung obstruction remover. With Cayley–Hamilton (`aeval_self_charpoly`, banked Mathlib
  machinery) — a PRODUCT of injective maps is injective, but `aeval g charpoly = 0` is NOT injective on a
  nonzero space — the charpoly factorization CANNOT be all negative-discriminant quadratics, so it MUST
  contain a linear factor = a real eigenvalue. The ONLY remaining gap is the real-closed FACTORIZATION
  itself (the Artin–Schreier content Mathlib lacks), childed N79.

## GO / NO-GO
GO if, over the derived ℝ Cut + the banked EvC / IsEvCSymm / Module.Finite Cut STVC:
  1. `selfadj_negDisc_quad_apply_form` — EvC((g²+b•g+c•1)v, v) = EvC(gv)(gv) + b·EvC(gv)v + c·EvC v v
     for EvC-self-adjoint g (bilinearity + self-adjointness). [bankable]
  2. `selfadj_negDisc_quad_pos` — for b²<4c, EvC-self-adjoint g, v ≠ 0:  0 < EvC((g²+b•g+c•1)v, v).
     [the discriminant key — EvC_nonneg at t=−b/2 + positive-definiteness]   [bankable, HEADLINE core]
  3. `selfadj_negDisc_quad_injective` — for b²<4c, EvC-self-adjoint g: Function.Injective (g²+b•g+c•1).
     [HEADLINE: the even-rung obstruction remover]
  4. `selfadj_negDisc_quad_bijective` — same hypotheses: Function.Bijective (g²+b•g+c•1)  (finite dim).
  5. STRETCH (bank if it compiles cleanly, else child): the conditional existence — a self-adjoint g on
     STVC whose charpoly is a product of neg-disc quadratics is impossible on the nonzero STVC (CH +
     product-of-injectives), so a real eigenvalue exists GIVEN the factorization.
  6. NON-VACUITY (W8): a concrete instance — e.g. the rotation-type self-adjoint... or the simplest:
     `selfadj_negDisc_quad_bijective` instantiated. The costume (C109) asserts a WRONG specialization
     reducing to a FALSE numeric distinct from the battery (… C107 6=13, C108 7=12).

NO-GO / KILL = INSTRUMENT failure (NOT theory): any single obligation that does not elaborate within a
~45s/obligation bounded probe, OR any nlinarith that does not close the discriminant step in one shot →
decompose into smaller named steps (W9.3); do NOT inflate maxHeartbeats, do NOT brute. If the conditional
existence (5) resists the polynomial-factorization plumbing, BANK 1–4 (the obstruction remover) and CHILD
the conditional existence + the real-closed factorization + the full assembly + global polar/KAK +
connectedness + reverse surjectivity + Spin(9) exhaustion as N79.

## ANTI-DRIFT
Physics-words-removable: delete "Lorentz/boost/rotation/spectral/eigen*/self-adjoint/positive-definite/
discriminant/quadratic/seed/re-seed/even/odd/dimension/rank/Spin/SO(9)/isometry/obstruction" → pure math:
over the derived complete ordered field Cut and the symmetric positive-definite bilinear form EvC, for an
EvC-symmetric Cut-linear g and b,c with b²<4c, the map g²+b•g+c•1 is injective (hence bijective on the
finite-dim STVC). No statement needs a physics word. NO Mathlib ℝ/ℂ as content; the field IS the derived
Cut. NO posited Lorentz group. Mathlib (Module.End ring, injective_iff_surjective, aeval_self_charpoly) is
MACHINERY on the DERIVED objects.

KILL budget: 45s / obligation. Predecessors N43–N51 timed out on the gate ceremony; checkpoint EARLY,
bank-as-you-go, run the gate in BACKGROUND, child + complete with turns to spare.
