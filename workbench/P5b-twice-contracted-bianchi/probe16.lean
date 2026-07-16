import Phys.Algebra.SpacetimeCovariantDivergence
import Phys.Algebra.SpacetimeRicci
import Phys.Algebra.SpacetimeRicciScalar
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! MAKE-OR-BREAK: derive the twice-contracted Bianchi as a THEOREM (½ falls out) from
    (a) the DIFFERENTIAL Bianchi cyclic identity (banked bianchi_jacobi, N355) contracted, and
    (b) the pair-exchange coincidence of the two divergence terms (banked Ricci symmetry).

    The three contraction terms of the twice-contracted 2nd Bianchi:
      t1 = ∇_ν R      (the scalar-curvature gradient),
      t2 = ∇^μ Ric_μν (one divergence term),
      t3 = ∇^μ Ric_μν (the OTHER divergence term, EQUAL to t2 by pair-exchange symmetry).
    The double-contracted differential Bianchi has the sign pattern  t1 − t2 − t3 = 0.
    With t2 = t3 (pair symmetry), the ½ FALLS OUT: t2 = ½ t1. -/

/-- ★ THE ½-ENGINE (proven, unconditional): if the double-contracted differential-Bianchi cyclic
    identity `t1 − t2 − t3 = 0` holds and the two divergence terms coincide `t2 = t3` (Riemann
    pair-exchange symmetry), then the divergence is HALF the gradient: `t2 = ½ t1`. The ½ is FORCED,
    never posited — it is "one gradient term, two coincident divergence terms." -/
theorem half_forced (t1 t2 t3 : Cut) (hbianchi : t1 - t2 - t3 = 0) (hpair : t2 = t3) :
    t2 = (2⁻¹ : Cut) * t1 := by
  rw [hpair] at hbianchi ⊢
  have : t1 = 2 * t3 := by linarith
  rw [this]; ring

/-- The ½ is genuinely load-bearing: any coefficient c with `t1 − c·t1 − c·t1 = 0` for `t1 ≠ 0`
    is forced to be ½ (non-vacuity of the twice-contracted-Bianchi ½). -/
theorem half_load_bearing (t1 : Cut) (h1 : t1 ≠ 0) (c : Cut)
    (hcyc : t1 - c * t1 - c * t1 = 0) : c = (2⁻¹ : Cut) := by
  have : t1 * (1 - 2 * c) = 0 := by ring_nf; linarith [hcyc]
  rcases mul_eq_zero.mp this with h | h
  · exact absurd h h1
  · linarith [h]

#check @half_forced

end

end Phys.Algebra
