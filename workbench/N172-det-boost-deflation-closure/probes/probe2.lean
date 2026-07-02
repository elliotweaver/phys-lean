import Phys.Algebra.LorentzContinuumSO9DetReduction
import Phys.Algebra.LorentzContinuumGeneralAxisBoostPath
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators Matrix

/-- The 2-plane READER for the general-axis boost: STVC → Fin 2 → Cut,
    p ↦ ![t, σ] where σ = wx·x + gFormC v wv. -/
def genBoostF (wx : Cut) (wv : O Cut) : STVC →ₗ[Cut] (Fin 2 → Cut) where
  toFun p := ![p.1, wx * p.2.1 + gFormC p.2.2 wv]
  map_add' p q := by
    funext i; fin_cases i <;>
      simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Pi.add_apply,
        gFormC_add_left] <;> ring
  map_smul' r p := by
    funext i; fin_cases i <;>
      simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Pi.smul_apply,
        gFormC_smul_left, smul_eq_mul, RingHom.id_apply] <;> ring

/-- The 2-plane WRITER (negated increment) for the general-axis boost:
    (Fin 2 → Cut) → STVC, w ↦ (-((a-1)·w0 + b·w1), -((b·w0+(a-1)·w1))·wx, -((b·w0+(a-1)·w1))•wv). -/
def genBoostG (wx : Cut) (wv : O Cut) (a b : Cut) : (Fin 2 → Cut) →ₗ[Cut] STVC where
  toFun w := (-((a - 1) * w 0 + b * w 1),
              -((b * w 0 + (a - 1) * w 1)) * wx,
              (-((b * w 0 + (a - 1) * w 1))) • wv)
  map_add' w w' := by
    show ((-(_)), _, _) = ((-(_)), _, _) + ((-(_)), _, _)
    rw [Prod.mk_add_mk, Prod.mk_add_mk]
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show -((a - 1) * (w 0 + w' 0) + b * (w 1 + w' 1))
          = -((a - 1) * w 0 + b * w 1) + -((a - 1) * w' 0 + b * w' 1)
      ring
    · show -((b * (w 0 + w' 0) + (a - 1) * (w 1 + w' 1))) * wx
          = -((b * w 0 + (a - 1) * w 1)) * wx + -((b * w' 0 + (a - 1) * w' 1)) * wx
      ring
    · show (-((b * (w 0 + w' 0) + (a - 1) * (w 1 + w' 1)))) • wv
          = (-((b * w 0 + (a - 1) * w 1))) • wv + (-((b * w' 0 + (a - 1) * w' 1))) • wv
      rw [show (-((b * (w 0 + w' 0) + (a - 1) * (w 1 + w' 1))))
            = (-((b * w 0 + (a - 1) * w 1))) + (-((b * w' 0 + (a - 1) * w' 1))) by ring, add_smul]
  map_smul' r w := by
    show ((-(_)), _, _) = r • ((-(_)), _, _)
    rw [Prod.smul_mk, Prod.smul_mk]
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show -((a - 1) * (r • w 0) + b * (r • w 1)) = r • -((a - 1) * w 0 + b * w 1)
      simp only [smul_eq_mul]; ring
    · show -((b * (r • w 0) + (a - 1) * (r • w 1))) * wx = r • (-((b * w 0 + (a - 1) * w 1)) * wx)
      simp only [smul_eq_mul]; ring
    · show (-((b * (r • w 0) + (a - 1) * (r • w 1)))) • wv = r • ((-((b * w 0 + (a - 1) * w 1))) • wv)
      simp only [smul_eq_mul, smul_smul]
      rw [show -(b * (r * w 0) + (a - 1) * (r * w 1)) = r * (-(b * w 0 + (a - 1) * w 1)) by ring]

/-- genBoostLin wx wv a b = id - G ∘ F (the rank-2 perturbation factorization). -/
theorem genBoostLin_eq_id_sub_comp (wx : Cut) (wv : O Cut) (a b : Cut) :
    genBoostLin wx wv a b = LinearMap.id - (genBoostG wx wv a b).comp (genBoostF wx wv) := by
  apply LinearMap.ext; intro p
  rw [genBoostLin_apply]
  simp only [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.comp_apply]
  obtain ⟨t, x, v⟩ := p
  simp only [genBoostF, genBoostG, LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * t + b * (wx * x + gFormC v wv)
        = t - -((a - 1) * t + b * (wx * x + gFormC v wv))
    ring
  · show x + (b * t + (a - 1) * (wx * x + gFormC v wv)) * wx
        = x - -((b * t + (a - 1) * (wx * x + gFormC v wv))) * wx
    ring
  · show v + (b * t + (a - 1) * (wx * x + gFormC v wv)) • wv
        = v - (-((b * t + (a - 1) * (wx * x + gFormC v wv)))) • wv
    rw [neg_smul, sub_neg_eq_add]

/-- F∘G as an explicit 2×2 (uses the unit axis `wx² + gFormC wv wv = 1`):
    `(genBoostF) ∘ (genBoostG) = toLin' !![-(a-1), -b; -b, -(a-1)]`. -/
theorem genBoostFG_eq_toLin' (wx : Cut) (wv : O Cut) (hw : wx ^ 2 + gFormC wv wv = 1) (a b : Cut) :
    (genBoostF wx wv).comp (genBoostG wx wv a b)
      = Matrix.toLin' !![-(a - 1), -b; -b, -(a - 1)] := by
  apply LinearMap.ext; intro w
  rw [LinearMap.comp_apply, Matrix.toLin'_apply]
  simp only [genBoostF, genBoostG, LinearMap.coe_mk, AddHom.coe_mk]
  rw [gFormC_smul_left]
  funext i
  fin_cases i <;>
    simp only [Fin.zero_eta, Fin.mk_one, Matrix.mulVec, dotProduct, Fin.sum_univ_two,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.of_apply,
      Matrix.cons_val', Matrix.empty_val', Matrix.cons_val_fin_one, Fin.isValue]
  · ring
  · linear_combination (-(b * w 0 + (a - 1) * w 1)) * hw

/-- ★ THE DETERMINANT of the general-axis boost `genBoostLin wx wv a b` for a UNIT axis
    (`wx² + gFormC wv wv = 1`) and `a² − b² = 1` is `1` — the Sylvester flip on the rank-2
    factorization reduces the 10-dim det to the 2×2 `det !![a,b;b,a] = a²−b²`. -/
theorem det_genBoostLin (wx : Cut) (wv : O Cut) (hw : wx ^ 2 + gFormC wv wv = 1)
    {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    LinearMap.det (genBoostLin wx wv a b) = 1 := by
  classical
  set B := Module.Free.chooseBasis Cut STVC with hB
  set bs := Pi.basisFun Cut (Fin 2) with hbs
  rw [genBoostLin_eq_id_sub_comp, ← LinearMap.det_toMatrix B]
  rw [map_sub, LinearMap.toMatrix_id, LinearMap.toMatrix_comp B bs B]
  rw [Matrix.det_one_sub_mul_comm (LinearMap.toMatrix bs B (genBoostG wx wv a b))
        (LinearMap.toMatrix B bs (genBoostF wx wv))]
  rw [← LinearMap.toMatrix_comp bs B bs, genBoostFG_eq_toLin' wx wv hw,
      hbs, LinearMap.toMatrix_eq_toMatrix', LinearMap.toMatrix'_toLin']
  rw [show (1 : Matrix (Fin 2) (Fin 2) Cut) - !![-(a - 1), -b; -b, -(a - 1)] = !![a, b; b, a] by
        rw [Matrix.one_fin_two]; ext i j; fin_cases i <;> fin_cases j <;> simp]
  rw [Matrix.det_fin_two_of]
  nlinarith [hab]

end

end Phys.Algebra
