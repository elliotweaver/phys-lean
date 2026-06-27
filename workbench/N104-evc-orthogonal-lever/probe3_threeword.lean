import Phys.Algebra.LorentzContinuumGenerationConverseCompactWord

namespace Phys.Algebra.N104Probe3

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- A three-half-turn word built ON the banked two-word `genTwoPlaneLin u w`:
    `triHalfTurnLin u w x = biMulLin x x * genTwoPlaneLin u w`
    = `biMulLin x x * (biMulLin w w * biMulLin u u)`. Reframing through the trunk (the
    already-banked two-word) keeps the nesting shallow. -/
def triHalfTurnLin (u w x : O Cut) : Module.End Cut STVC :=
  biMulLin x x * genTwoPlaneLin u w

/-- PROBE 3a: the three-word is a QvC-isometry — one half-turn composed with the banked two-word
    isometry `genTwoPlaneLin_isQvIsomC` (N103). -/
theorem triHalfTurnLin_isQvIsomC (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1) :
    IsQvIsomC (triHalfTurnLin u w x) := by
  intro p
  show QvC (triHalfTurnLin u w x p) = QvC p
  have hgp : triHalfTurnLin u w x p = biMulLin x x (genTwoPlaneLin u w p) := rfl
  rw [hgp, biMulLin_imag_isQvIsomC x hx (genTwoPlaneLin u w p),
      genTwoPlaneLin_isQvIsomC u w hu hw p]

/-- PROBE 3b: the EvC-adjoint of `C∘(B∘A)` is `(B∘A)*∘C* = genTwoPlaneLin w u ∘ biMulLin x x`,
    via `IsEvCAdjoint.comp` of the banked two-word adjoint (N103) and the N102 self-adjoint
    half-turn. -/
theorem triHalfTurnLin_isEvCAdjoint (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    IsEvCAdjoint (triHalfTurnLin u w x)
      (genTwoPlaneLin w u * biMulLin x x) := by
  have hC := biMulLin_imag_isEvCAdjoint_self x hx hxss hxL
  have hgen := genTwoPlaneLin_isEvCAdjoint u w hu hw huss huL hwss hwL
  exact hC.comp hgen

/-- PROBE 3c: THE EvC-ORTHOGONALITY of the three-word: adjoint∘word = id. The middle half-turn
    `C∘C = id` collapses, then the banked two-word orthogonality
    `genTwoPlaneLin_adjoint_comp_self` (N103) finishes. -/
theorem triHalfTurnLin_adjoint_comp_self (u w x : O Cut)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    (genTwoPlaneLin w u * biMulLin x x).comp (triHalfTurnLin u w x)
      = LinearMap.id := by
  show (genTwoPlaneLin w u * biMulLin x x) * (biMulLin x x * genTwoPlaneLin u w)
      = LinearMap.id
  have hCC : biMulLin x x * biMulLin x x = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive x hxss hxL
  have hgen : (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = LinearMap.id :=
    genTwoPlaneLin_adjoint_comp_self u w huss huL hwss hwL
  set P := genTwoPlaneLin w u
  set Q := genTwoPlaneLin u w
  set C := biMulLin x x
  calc (P * C) * (C * Q)
      = P * ((C * C) * Q) := by rw [mul_assoc, ← mul_assoc C C Q]
    _ = P * ((1 : Module.End Cut STVC) * Q) := by rw [hCC]
    _ = P * Q := by rw [one_mul]
    _ = LinearMap.id := hgen

/-- PROBE 3d: the three-word is in genIsomMonoidLin — the banked two-word
    `genTwoPlaneLin_mem_genLin` (N100) times one more generator. -/
theorem triHalfTurnLin_mem_genLin (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1) :
    triHalfTurnLin u w x ∈ genIsomMonoidLin := by
  have gC : biMulLin x x ∈ genIsomMonoidLin :=
    Submonoid.subset_closure ⟨x, x, hx, hx, rfl⟩
  have gQ : genTwoPlaneLin u w ∈ genIsomMonoidLin := genTwoPlaneLin_mem_genLin u w hu hw
  exact mul_mem gC gQ

end
end Phys.Algebra.N104Probe3
