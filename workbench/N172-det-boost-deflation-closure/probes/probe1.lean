import Phys.Algebra.LorentzContinuumSO9DetReduction
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators Matrix

/-- The 2-plane READER for the axis rotation: STVC → Fin 2 → Cut, p ↦ ![x, gFormC v e]. -/
def axisRotF (e : O Cut) : STVC →ₗ[Cut] (Fin 2 → Cut) where
  toFun p := ![p.2.1, gFormC p.2.2 e]
  map_add' p q := by
    funext i; fin_cases i <;>
      simp [Matrix.cons_val_zero, Matrix.cons_val_one, gFormC_add_left]
  map_smul' r p := by
    funext i; fin_cases i <;>
      simp [Matrix.cons_val_zero, Matrix.cons_val_one, gFormC_smul_left]

/-- The 2-plane WRITER (negated increment) for the axis rotation:
    (Fin 2 → Cut) → STVC, w ↦ (0, (1-c)·w0 + s·w1, (-(s·w0 + (c-1)·w1))•e). -/
def axisRotG (e : O Cut) (c s : Cut) : (Fin 2 → Cut) →ₗ[Cut] STVC where
  toFun w := ((0 : Cut), (1 - c) * w 0 + s * w 1, (-(s * w 0 + (c - 1) * w 1)) • e)
  map_add' w w' := by
    show ((0 : Cut), _, _) = ((0:Cut), _, _) + ((0:Cut), _, _)
    rw [Prod.mk_add_mk, Prod.mk_add_mk]
    refine Prod.ext (by ring) (Prod.ext ?_ ?_)
    · show (1 - c) * (w 0 + w' 0) + s * (w 1 + w' 1)
          = ((1 - c) * w 0 + s * w 1) + ((1 - c) * w' 0 + s * w' 1)
      ring
    · show (-(s * (w 0 + w' 0) + (c - 1) * (w 1 + w' 1))) • e
          = (-(s * w 0 + (c - 1) * w 1)) • e + (-(s * w' 0 + (c - 1) * w' 1)) • e
      rw [show (-(s * (w 0 + w' 0) + (c - 1) * (w 1 + w' 1)))
            = (-(s * w 0 + (c - 1) * w 1)) + (-(s * w' 0 + (c - 1) * w' 1)) by ring, add_smul]
  map_smul' r w := by
    show ((0 : Cut), _, _) = r • ((0:Cut), _, _)
    rw [Prod.smul_mk, Prod.smul_mk]
    refine Prod.ext (by simp) (Prod.ext ?_ ?_)
    · show (1 - c) * (r • w 0) + s * (r • w 1) = r • ((1 - c) * w 0 + s * w 1)
      simp only [smul_eq_mul]; ring
    · show (-(s * (r • w 0) + (c - 1) * (r • w 1))) • e = r • ((-(s * w 0 + (c - 1) * w 1)) • e)
      simp only [smul_eq_mul, smul_smul]
      rw [show -(s * (r * w 0) + (c - 1) * (r * w 1)) = r * (-(s * w 0 + (c - 1) * w 1)) by ring]

/-- axisRotLin e c s = id - G ∘ F (the rank-2 perturbation factorization). -/
theorem axisRotLin_eq_id_sub_comp (e : O Cut) (c s : Cut) :
    axisRotLin e c s = LinearMap.id - (axisRotG e c s).comp (axisRotF e) := by
  apply LinearMap.ext; intro p
  rw [axisRotLin_apply]
  simp only [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.comp_apply]
  show (p.1, c * p.2.1 - s * gFormC p.2.2 e, p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
      = p - ((0:Cut), (1 - c) * (axisRotF e p) 0 + s * (axisRotF e p) 1,
              (-(s * (axisRotF e p) 0 + (c - 1) * (axisRotF e p) 1)) • e)
  obtain ⟨t, x, v⟩ := p
  simp only [axisRotF, LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons]
  refine Prod.ext (by simp) (Prod.ext ?_ ?_)
  · show c * x - s * gFormC v e = x - ((1 - c) * x + s * gFormC v e)
    ring
  · show v + (s * x + (c - 1) * gFormC v e) • e = v - (-(s * x + (c - 1) * gFormC v e)) • e
    rw [neg_smul, sub_neg_eq_add]

/-- F∘G as an explicit 2×2 (uses the unit axis `gFormC e e = 1`):
    `(axisRotF e) ∘ (axisRotG e c s) = toLin' !![1-c, s; -s, 1-c]`. -/
theorem axisRotFG_eq_toLin' (e : O Cut) (he : gFormC e e = 1) (c s : Cut) :
    (axisRotF e).comp (axisRotG e c s) = Matrix.toLin' !![1 - c, s; -s, 1 - c] := by
  apply LinearMap.ext; intro w
  rw [LinearMap.comp_apply, Matrix.toLin'_apply]
  simp only [axisRotF, axisRotG, LinearMap.coe_mk, AddHom.coe_mk]
  rw [gFormC_smul_left, he, mul_one]
  funext i
  fin_cases i <;>
    simp only [Fin.zero_eta, Fin.mk_one, axisRotF, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.mulVec, dotProduct, Fin.sum_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.of_apply, Matrix.cons_val', Matrix.empty_val',
      Matrix.cons_val_fin_one, Fin.isValue] <;> ring

/-- ★ THE DETERMINANT of the general-axis rotation `axisRotLin e c s` for a UNIT axis
    (`gFormC e e = 1`) is `c² + s²` — the Sylvester (Weinstein–Aronszajn) flip on the rank-2
    factorization `axisRotLin = id − G∘F` reduces the 10-dim det to the 2×2 `det !![c,-s;s,c]`. -/
theorem det_axisRotLin (e : O Cut) (he : gFormC e e = 1) (c s : Cut) :
    LinearMap.det (axisRotLin e c s) = c ^ 2 + s ^ 2 := by
  classical
  set b := Module.Free.chooseBasis Cut STVC with hb
  set bs := Pi.basisFun Cut (Fin 2) with hbs
  rw [axisRotLin_eq_id_sub_comp, ← LinearMap.det_toMatrix b]
  rw [map_sub, LinearMap.toMatrix_id, LinearMap.toMatrix_comp b bs b]
  rw [Matrix.det_one_sub_mul_comm (LinearMap.toMatrix bs b (axisRotG e c s))
        (LinearMap.toMatrix b bs (axisRotF e))]
  rw [← LinearMap.toMatrix_comp bs b bs, axisRotFG_eq_toLin' e he,
      hbs, LinearMap.toMatrix_eq_toMatrix', LinearMap.toMatrix'_toLin']
  rw [show (1 : Matrix (Fin 2) (Fin 2) Cut) - !![1 - c, s; -s, 1 - c] = !![c, -s; s, c] by
        rw [Matrix.one_fin_two]; ext i j; fin_cases i <;> fin_cases j <;> simp]
  rw [Matrix.det_fin_two_of]
  ring

end

end Phys.Algebra
