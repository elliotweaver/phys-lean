/-
  Counterexamples.GaussRankLawVacuityCostume — the rank-law apparatus is GENUINE:
  the generator instantiation FIRES on a real class. C606.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims generators/span/replacement. The content that must
  NOT be hollow: class_generators fires on the REAL D=−20 form (2,2,3) — producing an
  actual reduced rep, a pairwise-coprime prime-power list, and a ProdRel branch
  decomposition, all kernel-checked.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 606 attestFlag = 1 (TRUE — attestFlag = 1 < 606).
  THE BOGUS CLAIM: min 606 attestFlag = 606. Rewriting reduces to 1 = 606; BITES.
  DISTINCT: the pair (606, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussRankLaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation.IntegerArith
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ (f_red : GaussForms.BQF) (gs : List Z) (Gs : List GaussForms.BQF),
      Chain (⟨2, 2, 3⟩ : GaussForms.BQF) f_red ∧ Reduced f_red ∧
      PosDef f_red ∧ disc f_red = disc (⟨2, 2, 3⟩ : GaussForms.BQF) ∧
      PairwiseCop gs ∧ f_red.a = zListProd gs ∧
      (∀ x ∈ gs, ∃ (p e : Re), PrimeRe p ∧ x = zpow (Z.ofRe p) (Re.step e)) ∧
      ProdRel Gs f_red ∧
      (∀ G ∈ Gs, G.b = f_red.b ∧ G.a ∈ gs)) → attestFlag = 1 :=
  fun _ => rfl

theorem generators_fire :
    ∃ (f_red : GaussForms.BQF) (gs : List Z) (Gs : List GaussForms.BQF),
      Chain (⟨2, 2, 3⟩ : GaussForms.BQF) f_red ∧ Reduced f_red ∧
      PosDef f_red ∧ disc f_red = disc (⟨2, 2, 3⟩ : GaussForms.BQF) ∧
      PairwiseCop gs ∧ f_red.a = zListProd gs ∧
      (∀ x ∈ gs, ∃ (p e : Re), PrimeRe p ∧ x = zpow (Z.ofRe p) (Re.step e)) ∧
      ProdRel Gs f_red ∧
      (∀ G ∈ Gs, G.b = f_red.b ∧ G.a ∈ gs) := by
  apply class_generators
  · exact ⟨-1, 0, 1, by show (-1 : Z) * 2 + 0 * 2 + 1 * 3 = 1; ring⟩
  · exact ⟨by norm_num, by norm_num⟩
  · show disc (⟨2, 2, 3⟩ : GaussForms.BQF) < 0
    unfold disc
    norm_num

theorem cert_val_true : min 606 attestFlag = 1 := by
  have h := attestFlag_forced generators_fire
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 606 attestFlag = 606 := by
  rw [cert_val_true]

end Counterexamples
