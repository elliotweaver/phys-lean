import Mathlib.Tactic
import Phys.Quantum.TransitionAmplitude
import Phys.Algebra.ConfinementMassGap

namespace Phys.Quantum.Probe

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-! ## The S-matrix = the K1 transport (no posit). -/

noncomputable def scatteringOp (U : Dbl Cut) : StateFibre → StateFibre := evolve U

theorem scatteringOp_eq_evolve (U : Dbl Cut) : scatteringOp U = evolve U := rfl

/-! ## Unitary + amplitudes (re-export K1/K3). -/

theorem scatteringOp_unitary (U : Dbl Cut) (hU : dblNormSq U = 1) (p : StateFibre) :
    bornForm (scatteringOp U p) (scatteringOp U p) = bornForm p p :=
  unitary_conserves_born U hU p

theorem scatteringOp_conserves_gather (U : Dbl Cut) (hU : dblNormSq U = 1) (p : StateFibre) :
    bornForm (scatteringOp U p) (scatteringOp U p) = wIn p + wOut p :=
  unitary_conserves_gather_resolution U hU p

theorem scatteringOp_sheaf (U : Dbl Cut) (p : StateFibre) :
    totalGather (scatteringOp U p) = scatteringOp U p :=
  evolve_is_sheaf U p

theorem scatteringOp_closes_singlet (a b : ℚ) :
    scatteringOp Dbl.J (dress a b) = dress (-b) a :=
  evolve_J_dress a b

theorem scatteringOp_amplitude (U : Dbl Cut) (out inp : StateFibre) :
    transAmp U out inp = hInner (toDbl out) (toDbl (scatteringOp U inp)) := rfl

/-! ## THE CROSS-TIE: bornAction vanishes IFF the curvature vanishes. -/

theorem bornAction_eq_zero_iff (a b x : O ℚ) :
    bornAction a b x = 0 ↔ assoc a b x = 0 := by
  unfold bornAction
  rw [Rat.cast_eq_zero, gForm_self_eq_zero]

/-! ## THE WELD: the asymptotic (gluing) domain = the massless (zero-action) sector. -/

theorem asymptotic_iff_massless (a b : O ℚ) :
    WorldsGlue a b ↔ ∀ x, bornAction a b x = 0 := by
  rw [flat_iff_curvature_zero]
  constructor
  · intro h x; exact (bornAction_eq_zero_iff a b x).mpr (h x)
  · intro h x; exact (bornAction_eq_zero_iff a b x).mp (h x)

/-! ## The confined sector: excluded from the domain AND gapped (one associator). -/

theorem confined_excluded :
    ¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) :=
  coloured_witness_not_flat

theorem confined_gapped :
    (4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) :=
  bornAction_witness_floor

/-! ## The domain (singlet) sector: in the domain (glues) AND massless. -/

theorem domain_flat {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) :
    WorldsGlue a b :=
  singlet_flat ha hb

theorem domain_massless {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    bornAction a b x = 0 :=
  bornAction_singlet_zero ha hb x

end Phys.Quantum.Probe
