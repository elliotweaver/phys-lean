import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationUpperBound

/-!
PROBE (N266 SELECT, candidate A'): the COLOUR-NEUTRAL CORE of the matter carrier O ℚ
is EXACTLY the fold's own complex line span{1, u1} (unit + root) — dim 2.
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem colour_kills_u1 (D : colourCentralizer) :
    ((D : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0 := by
  have h := colour_kills_sgl (D : derivationLieQ) D.2
  have hc : ((imRep (D : derivationLieQ) sgl : ImO) : O ℚ)
      = ((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((sgl : ImO) : O ℚ) := imRepFun_coe _ _
  rw [h] at hc
  simpa using hc.symm

noncomputable def matterColourNeutral : Submodule ℚ (O ℚ) :=
  ⨅ D : colourCentralizer, LinearMap.ker ((D : derivationLieQ) : Module.End ℚ (O ℚ))

theorem span_one_u1_le_matterColourNeutral :
    Submodule.span ℚ {(1 : O ℚ), u1} ≤ matterColourNeutral := by
  rw [Submodule.span_le]
  intro x hx
  rw [SetLike.mem_coe, matterColourNeutral, Submodule.mem_iInf]
  intro D
  rw [LinearMap.mem_ker]
  have hD : IsDerivQ ((D : derivationLieQ) : Module.End ℚ (O ℚ)) := (D : derivationLieQ).2
  rcases hx with h1 | hu1
  · rw [h1]; exact derivQ_one _ hD
  · rw [Set.mem_singleton_iff] at hu1; rw [hu1]; exact colour_kills_u1 D

/-- ⊆ direction. A colour-neutral x, split x = reQ x • 1 + w with w ∈ ImO, has
    D w = 0 for all colour D (since D(reQ x • 1) = 0), so w ∈ colourInvariants = span{sgl}
    (N252), hence x ∈ span{1, u1}. -/
theorem matterColourNeutral_le_span_one_u1 :
    matterColourNeutral ≤ Submodule.span ℚ {(1 : O ℚ), u1} := by
  intro x hx
  rw [matterColourNeutral, Submodule.mem_iInf] at hx
  -- w := x - reQ x • 1, in ImO
  set w : O ℚ := x - (reQ x) • (1 : O ℚ) with hw
  have hwIm : w ∈ ImO := by
    rw [mem_ImO]
    -- star w = star x - reQ x • 1; and x + star x = 2 reQ x • 1 (trace_id)
    have ht := trace_id x
    have : star x = (2 * reQ x) • (1 : O ℚ) - x := by linear_combination (norm := module) ht
    rw [hw]
    simp only [star_sub, this]
    have : star ((reQ x) • (1 : O ℚ)) = (reQ x) • (1 : O ℚ) := by
      rw [starL_apply.symm]; simp [map_smul]; rfl
    rw [this]
    linear_combination (norm := module) rfl
  sorry

#print axioms colour_kills_u1
#print axioms span_one_u1_le_matterColourNeutral

end Phys.Algebra
