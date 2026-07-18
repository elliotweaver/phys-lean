import Phys.Algebra.UpDownRelativeScaleFoldPhase
import Phys.Algebra.QuarkHadronTower
import Mathlib.Tactic

namespace Probe2

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

noncomputable section

/-- THE DERIVED DOWN/CONFINEMENT RELATIVE MASS SCALE: `(Md/Mλ)² = mbRatioDerived / confBundle`.
    The up/down leg (parent, fold-phase Born weight) DIVIDED by the confinement bundle Λ/v (X9). -/
def downConfBundle : Cut := mbRatioDerived / confBundle

theorem downConfBundle_pos : 0 < downConfBundle := by
  unfold downConfBundle
  exact div_pos mbRatioDerived_pos confBundle_pos

/-- THE ALGEBRAIC WELD to the grandparent's edgeLight: with the confinement floor as a Born-square
    mass `Mλ²`, `edgeLight Md (Mλ²) = (Md/Mλ)² · bMass 2`. Pure sectorMass_eq arithmetic. -/
theorem edgeLight_weld (Md Mlam : Cut) (hl : Mlam ≠ 0) :
    edgeLight Md (Mlam ^ 2) = (Md / Mlam) ^ 2 * bMass 2 := by
  unfold edgeLight
  rw [sectorMass_eq]
  have hl2 : (Mlam : Cut) ^ 2 ≠ 0 := pow_ne_zero 2 hl
  field_simp

/-- THE PINNING: given the parent's up/down leg `(Md/Mu)² = mbRatioDerived` and the top-at-anchor +
    confinement identification `(Mu/Mλ)² = 1/confBundle`, the light-band edge is the DETERMINED
    derived value `downConfBundle · bMass 2`. -/
theorem edgeLight_pinned (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    edgeLight Md (Mlam ^ 2) = downConfBundle * bMass 2 := by
  rw [edgeLight_weld Md Mlam hl]
  have hsplit : (Md / Mlam) ^ 2 = (Md / Mu) ^ 2 * (Mu / Mlam) ^ 2 := by
    field_simp
  rw [hsplit, hud, huc]
  unfold downConfBundle
  ring

/-- The up/down leg pins edgeBottom to a determined value `mbRatioDerived · (bMass 0 / bMass 2)`. -/
theorem edgeBottom_pinned (Mu Md : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) :
    edgeBottom Mu Md = mbRatioDerived * (bMass 0 / bMass 2) := by
  unfold edgeBottom
  rw [sectorMass_eq, sectorMass_eq]
  have hb2 : bMass 2 = mass2 := rfl
  have hm2 : (mass2 : Cut) ≠ 0 := ne_of_gt mass2_pos
  have hu2 : (Mu : Cut) ^ 2 ≠ 0 := pow_ne_zero 2 hu
  rw [← hud]
  rw [hb2]
  field_simp

/-- The up/down leg pins edgeCharm to `1/mbRatioDerived`. -/
theorem edgeCharm_pinned (Mu Md : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) :
    edgeCharm Mu Md = 1 / mbRatioDerived := by
  unfold edgeCharm
  rw [sectorMass_eq, sectorMass_eq]
  have hb2 : bMass 2 = mass2 := rfl
  have hm2 : (mass2 : Cut) ≠ 0 := ne_of_gt mass2_pos
  have hd2 : (Md : Cut) ^ 2 ≠ 0 := pow_ne_zero 2 hd
  have hmb : mbRatioDerived ≠ 0 := ne_of_gt mbRatioDerived_pos
  rw [← hud, hb2]
  field_simp

end

end Probe2
