/- N234 probe 4 — the action bridge:
   Dk as derivationLieQ elements, imRep (DkL k) = qI (dkm k),
   adEnd (DkL k) (qI M) = qI (adm k M),
   invariant-subspace stability under the chain,
   tracelessSym membership of qI of symmetric-traceless integer matrices. -/
import Phys.Algebra.TowerGatherFFTPeirceReduction
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationStabilizerSplit

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

abbrev M7 := Fin 7 → Fin 7 → ℤ

-- (minimal copies from probe3; production will have these once)
def qZ (M : M7) : Module.End ℚ (O ℚ) where
  toFun z :=
    ⟨⟨⟨0, (M 0 0 : ℚ) * c1 z + (M 0 1 : ℚ) * c2 z + (M 0 2 : ℚ) * c3 z + (M 0 3 : ℚ) * c4 z + (M 0 4 : ℚ) * c5 z + (M 0 5 : ℚ) * c6 z + (M 0 6 : ℚ) * c7 z⟩,
      ⟨(M 1 0 : ℚ) * c1 z + (M 1 1 : ℚ) * c2 z + (M 1 2 : ℚ) * c3 z + (M 1 3 : ℚ) * c4 z + (M 1 4 : ℚ) * c5 z + (M 1 5 : ℚ) * c6 z + (M 1 6 : ℚ) * c7 z,
       (M 2 0 : ℚ) * c1 z + (M 2 1 : ℚ) * c2 z + (M 2 2 : ℚ) * c3 z + (M 2 3 : ℚ) * c4 z + (M 2 4 : ℚ) * c5 z + (M 2 5 : ℚ) * c6 z + (M 2 6 : ℚ) * c7 z⟩⟩,
     ⟨⟨(M 3 0 : ℚ) * c1 z + (M 3 1 : ℚ) * c2 z + (M 3 2 : ℚ) * c3 z + (M 3 3 : ℚ) * c4 z + (M 3 4 : ℚ) * c5 z + (M 3 5 : ℚ) * c6 z + (M 3 6 : ℚ) * c7 z,
       (M 4 0 : ℚ) * c1 z + (M 4 1 : ℚ) * c2 z + (M 4 2 : ℚ) * c3 z + (M 4 3 : ℚ) * c4 z + (M 4 4 : ℚ) * c5 z + (M 4 5 : ℚ) * c6 z + (M 4 6 : ℚ) * c7 z⟩,
      ⟨(M 5 0 : ℚ) * c1 z + (M 5 1 : ℚ) * c2 z + (M 5 2 : ℚ) * c3 z + (M 5 3 : ℚ) * c4 z + (M 5 4 : ℚ) * c5 z + (M 5 5 : ℚ) * c6 z + (M 5 6 : ℚ) * c7 z,
       (M 6 0 : ℚ) * c1 z + (M 6 1 : ℚ) * c2 z + (M 6 2 : ℚ) * c3 z + (M 6 3 : ℚ) * c4 z + (M 6 4 : ℚ) * c5 z + (M 6 5 : ℚ) * c6 z + (M 6 6 : ℚ) * c7 z⟩⟩⟩
  map_add' a b := by
    ext <;>
      simp only [c1, c2, c3, c4, c5, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;>
      ring
  map_smul' r z := by
    ext <;>
      simp only [c1, c2, c3, c4, c5, c6, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re,
        Dbl.smul_im, RingHom.id_apply] <;>
      ring

theorem qZ_mem_ImO (M : M7) (z : O ℚ) : qZ M z ∈ ImO :=
  mem_ImO_of_reQ_zero rfl

def qI (M : M7) : Module.End ℚ ImO :=
  (qZ M).restrict (fun z _ => qZ_mem_ImO M z)

@[simp] theorem qI_coe (M : M7) (x : ImO) : (qI M x : O ℚ) = qZ M (x : O ℚ) := rfl

def sub7 (A B : M7) : M7 := fun i j => A i j - B i j

def mul7 (A B : M7) : M7 := fun i k =>
  A i 0 * B 0 k + A i 1 * B 1 k + A i 2 * B 2 k + A i 3 * B 3 k +
  A i 4 * B 4 k + A i 5 * B 5 k + A i 6 * B 6 k

/-- matrix bracket. -/
def adm (d m : M7) : M7 := sub7 (mul7 d m) (mul7 m d)

/-- The d0 matrix (of banked D0E on ImO). -/
def d0m : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, -1, 0, 0],
    ![0, 0, 0, 1, 0, 0, 0],
    ![0, 0, -1, 0, 0, 0, 0],
    ![0, 1, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0]]

/-- D0E as an element of the banked Lie algebra. -/
def D0L : derivationLieQ := ⟨D0E, D0E_isDerivQ⟩

/-- ★ THE ACTION BRIDGE, single instance: `imRep D0L = qI d0m`. -/
theorem imRep_D0L : imRep D0L = qI d0m := by
  apply LinearMap.ext; intro x
  apply Subtype.ext
  show D0E (x : O ℚ) = qZ d0m (x : O ℚ)
  ext <;>
    simp [D0E, qZ, d0m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

/-- ★ adEnd transports to the matrix bracket. -/
theorem adEnd_qI (M : M7) : adEnd D0L (qI M) = qI (adm d0m M) := by
  rw [adEnd_apply, imRep_D0L]
  show qI d0m * qI M - qI M * qI d0m = qI (adm d0m M)
  have hc : ∀ A B : M7, qI A * qI B = qI (mul7 A B) := by
    intro A B
    apply LinearMap.ext; intro x
    apply Subtype.ext
    show qZ A (qZ B (x : O ℚ)) = qZ (mul7 A B) (x : O ℚ)
    ext <;> simp only [qZ, mul7, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
      AddHom.coe_mk, Int.cast_add, Int.cast_mul] <;> ring
  have hs : ∀ A B : M7, qI (sub7 A B) = qI A - qI B := by
    intro A B
    apply LinearMap.ext; intro x; apply Subtype.ext
    show qZ (sub7 A B) (x : O ℚ) = qZ A (x : O ℚ) - qZ B (x : O ℚ)
    rw [sub_eq_add_neg]
    ext <;> simp only [qZ, sub7, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
      AddHom.coe_mk, Int.cast_sub, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring
  rw [hc, hc, ← hs]
  rfl

end

end Phys.Algebra
