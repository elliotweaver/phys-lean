/-
  N172 — THE DET-OF-BOOST / DET-OF-DEFLATION / ANTIPODE / FINAL-ASSEMBLY UNCONDITIONAL CLOSURE
  of the full SO⁺(1,9) identity component.

  ── THE CHAIN POSITION ──
  N169 banked the boost peel `p = B·k` (`B = genBoostLin`, `k` time-fixing) + the reduction
  `joinedIdQvC_of_timeFixing_residual` (IF `k` is `JoinedIdQvC` THEN orthochronous `p` is).
  N170 banked the EvC-free time-fixing SO(9) closure `joinedIdQvC_of_timeFixing_SO9` (a time-fixing
  `QvC`-isometry whose `x`-axis MOVES, `v' ≠ 0`, and whose deflated stabilizer's octonion-`v`-block
  has `LinearMap.det = 1`, is `JoinedIdQvC`). N163 banked `joinedIdQvC_of_xtFixing_det_one` (the
  `x`-fixing det-`+1` case). N171 banked THE DETERMINANT-REDUCTION KEYSTONE
  `det_fixingTX_eq_vBlock` (a `(t,x)`-fixing `QvC`-isometry's 10-dim `LinearMap.det g` over `STVC`
  EQUALS its 8-dim `v`-block `LinearMap.det (vBlockEndC g)` over `O Cut`).

  ── THE ONE LAW / W1 REFRAME — what makes the determinant tractable ──
  The 10-dim determinants of the general-axis boost `genBoostLin` and the general-axis rotation
  `axisRotLin` are NOT computed by a `10×10` coordinate expansion (the W9 trap) NOR by det-continuity
  (the operator topology `endOpC` is pointwise, not a norm — MEASURED DEAD in N171). Both operators
  are `id + (rank-2 perturbation)` factoring through a 2-plane, so the SAME Sylvester
  (Weinstein–Aronszajn) flip that N162's `det_houseHolder` uses (`Matrix.det_one_sub_mul_comm`)
  reduces each 10-dim det to an explicit `2×2`:
    • `axisRotLin e c s = id − G∘F`, `F p = ![x, gFormC v e]`, and (unit axis) `1 − F∘G = !![c,-s;s,c]`,
      so `det = c² + s²` (`det_axisRotLin`).
    • `genBoostLin wx wv a b = id − G∘F`, `F p = ![t, σ]` (`σ = wx·x + gFormC v wv`), and (unit axis)
      `1 − F∘G = !![a,b;b,a]`, so `det = a² − b² = 1` (`det_genBoostLin`).

  ── WHAT THIS NODE BANKS ──
    ★ `det_axisRotLin`    — `gFormC e e = 1 → LinearMap.det (axisRotLin e c s) = c² + s²`.
    ★ `det_genBoostLin`   — unit axis + `a²−b²=1 → LinearMap.det (genBoostLin wx wv a b) = 1`.
    ★ `det_deflateNinth`  — `v'≠0` + circle `x'²+gFormC v' v'=1 → LinearMap.det (deflateNinth x' v') = 1`.
    ★ `joinedIdQvC_piRotE2` — the ANTIPODE `π`-rotation `axisRotLin e₂ (−1) 0` (NOT reachable by the
                              single-axis path — it IS the excluded antipode `1+c=0`) is `JoinedIdQvC`
                              as the SQUARE of the quarter-turn `axisRotLin e₂ 0 1` (`1+c=1≠0`).
    ★★ `joinedIdQvC_of_proper_orthochronous` — THE FULLY UNCONDITIONAL SO⁺(1,9) CLOSURE: every
                              proper (`det p = 1`) orthochronous (`0 ≤ (p e₀).1`) `QvC`-isometry `p`
                              is `JoinedIdQvC`. The boost peel `p = B·k` + `det B = 1` forces
                              `det k = 1`; the three time-fixing cases (`x`-axis moves `v'≠0`;
                              `x`-axis fixed `x'=+1`; antipode `x'=−1`) each close via the keystone
                              `det(vBlock) = det` and det-multiplicativity, feeding N170/N163.
    ★ W8 `joinedIdQvC_octReal_boost` — a CONCRETE non-identity proper orthochronous boost is JoinedIdQvC.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete every physics word (Lorentz / boost / rotation / deflation / orthochronous / proper / det /
  SO / octonion / time-fixing / antipode / Joined): the statements stand as pure linear algebra over
  the derived ℝ `Cut` — the determinant of an explicit `id + rank-2` endomorphism of `Cut × Cut × O Cut`
  equals an explicit `2×2` determinant; `LinearMap.det` is multiplicative; an explicit involutive
  endomorphism is the square of a path-reachable one; and a `QvC`-form-preserving endomorphism with
  `det = 1` and nonnegative leading entry lies in a preconnected set of such operators containing `1`.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `LinearMap.det` /
  `Matrix.det_one_sub_mul_comm` are MACHINERY on the derived modules), NO posited Lorentz group,
  NO posited topology/connectedness, NO det=1 hypothesis on a `v`-block (the properness `det p = 1`
  is the ONLY determinant hypothesis, and it is PROPAGATED, never assumed on a `v`-block).
-/
import Phys.Algebra.LorentzContinuumSO9DetReduction
import Phys.Algebra.LorentzContinuumBoostPeel
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators Matrix

/-! ## A — the determinant of the general-axis rotation via the Sylvester flip. -/

/-- The 2-plane READER for the axis rotation: `STVC → Fin 2 → Cut`, `p ↦ ![x, gFormC v e]`. -/
def axisRotF (e : O Cut) : STVC →ₗ[Cut] (Fin 2 → Cut) where
  toFun p := ![p.2.1, gFormC p.2.2 e]
  map_add' p q := by
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    funext i; fin_cases i <;>
      simp only [Prod.mk_add_mk, Fin.zero_eta, Fin.mk_one, Matrix.cons_val_zero,
        Matrix.cons_val_one, Pi.add_apply, gFormC_add_left]
  map_smul' r p := by
    obtain ⟨t, x, v⟩ := p
    funext i; fin_cases i <;>
      simp only [Prod.smul_mk, Fin.zero_eta, Fin.mk_one, Matrix.cons_val_zero,
        Matrix.cons_val_one, Pi.smul_apply, gFormC_smul_left, smul_eq_mul, RingHom.id_apply]

/-- The 2-plane WRITER (negated increment) for the axis rotation. -/
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

/-- `axisRotLin e c s = id − G ∘ F` — the rank-2 perturbation factorization. -/
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

/-- `F∘G` as an explicit `2×2` (uses the unit axis `gFormC e e = 1`):
    `(axisRotF e) ∘ (axisRotG e c s) = toLin' !![1-c, s; -s, 1-c]`. -/
theorem axisRotFG_eq_toLin' (e : O Cut) (he : gFormC e e = 1) (c s : Cut) :
    (axisRotF e).comp (axisRotG e c s) = Matrix.toLin' !![1 - c, s; -s, 1 - c] := by
  apply LinearMap.ext; intro w
  rw [LinearMap.comp_apply, Matrix.toLin'_apply]
  simp only [axisRotF, axisRotG, LinearMap.coe_mk, AddHom.coe_mk]
  rw [gFormC_smul_left, he, mul_one]
  funext i
  fin_cases i <;>
    simp only [Fin.zero_eta, Fin.mk_one, Matrix.mulVec, dotProduct, Fin.sum_univ_two,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.of_apply,
      Matrix.cons_val', Matrix.empty_val', Matrix.cons_val_fin_one, Fin.isValue] <;> ring

/-- ★ THE DETERMINANT of the general-axis rotation `axisRotLin e c s` for a UNIT axis
    (`gFormC e e = 1`) is `c² + s²` — the Sylvester (Weinstein–Aronszajn) flip on the rank-2
    factorization `axisRotLin = id − G∘F` reduces the 10-dim det to the `2×2` `det !![c,-s;s,c]`. -/
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

/-! ## B — the determinant of the general-axis boost via the Sylvester flip. -/

/-- The 2-plane READER for the general-axis boost: `STVC → Fin 2 → Cut`, `p ↦ ![t, σ]`,
    `σ = wx·x + gFormC v wv`. -/
def genBoostF (wx : Cut) (wv : O Cut) : STVC →ₗ[Cut] (Fin 2 → Cut) where
  toFun p := ![p.1, wx * p.2.1 + gFormC p.2.2 wv]
  map_add' p q := by
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    funext i; fin_cases i <;>
      simp only [Prod.mk_add_mk, Fin.zero_eta, Fin.mk_one, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.head_cons, Pi.add_apply, gFormC_add_left] <;> ring
  map_smul' r p := by
    obtain ⟨t, x, v⟩ := p
    funext i; fin_cases i <;>
      simp only [Prod.smul_mk, Fin.zero_eta, Fin.mk_one, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.head_cons, Pi.smul_apply, gFormC_smul_left, smul_eq_mul,
        RingHom.id_apply] <;> ring

/-- The 2-plane WRITER (negated increment) for the general-axis boost. -/
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
    · show (-((b * (r • w 0) + (a - 1) * (r • w 1)))) • wv
          = r • ((-((b * w 0 + (a - 1) * w 1))) • wv)
      simp only [smul_eq_mul, smul_smul]
      rw [show -(b * (r * w 0) + (a - 1) * (r * w 1)) = r * (-(b * w 0 + (a - 1) * w 1)) by ring]

/-- `genBoostLin wx wv a b = id − G ∘ F` — the rank-2 perturbation factorization. -/
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

/-- `F∘G` as an explicit `2×2` (uses the unit axis `wx² + gFormC wv wv = 1`):
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
    factorization reduces the 10-dim det to the `2×2` `det !![a,b;b,a] = a²−b²`. -/
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

/-! ## C — the determinant of the deflating rotation (corollary of `det_axisRotLin`). -/

/-- ★ THE DETERMINANT of the deflating general-axis rotation `deflateNinth x' v'` is `1`. The
    deflation is `axisRotLin (r⁻¹•v') x' (−r)` with `r = cutSqrt (gFormC v' v')`; its axis is a UNIT
    (`deflateNinth_axis_unit`) and the circle condition `x'² + gFormC v' v' = 1` gives `x'² + r² = 1`
    (`cutSqrt_sq`), so `det = x'² + (−r)² = x'² + r² = 1`. -/
theorem det_deflateNinth {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    LinearMap.det (deflateNinth x' v') = 1 := by
  unfold deflateNinth
  rw [det_axisRotLin _ (deflateNinth_axis_unit hv) x' (-(cutSqrt (gFormC v' v')))]
  have hrr : cutSqrt (gFormC v' v') * cutSqrt (gFormC v' v') = gFormC v' v' :=
    cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  nlinarith [hnorm, hrr]

/-! ## D — det-multiplicativity (the propagation lever). -/

/-- `LinearMap.det` is multiplicative on `Module.End`: `det (f * g) = det f * det g`. The
    `Module.End` product is composition, and `LinearMap.det` is a `MonoidHom`. -/
theorem det_End_mul (f g : Module.End Cut STVC) :
    LinearMap.det (f * g) = LinearMap.det f * LinearMap.det g :=
  LinearMap.det_comp f g

/-! ## E — the antipode π-rotation is `JoinedIdQvC` (the quarter-turn squared). -/

/-- The quarter-turn `axisRotLin e₂ 0 1` squares to the antipode `π`-rotation `axisRotLin e₂ (−1) 0`
    via the same-axis angle addition `(0,1)·(0,1) = (0·0−1·1, 0·1+1·0) = (−1, 0)`. -/
theorem quarterTurnE2_sq :
    (axisRotLin (CD.e2 : O Cut) 0 1) * (axisRotLin (CD.e2 : O Cut) 0 1)
      = axisRotLin (CD.e2 : O Cut) (-1) 0 := by
  rw [axisRotLin_comp_same_axis _ e2_gFormC_self 0 1 0 1]
  congr 1 <;> ring

/-- ★ THE ANTIPODE `π`-ROTATION is `JoinedIdQvC`. The single `π`-rotation `axisRotLin e₂ (−1) 0`
    is the EXCLUDED antipode of the single-axis path (`1 + c = 0`), so `joinedIdQvC_axisRotLin` does
    NOT apply directly. But it is the SQUARE of the quarter-turn `axisRotLin e₂ 0 1` (`1 + c = 1 ≠ 0`,
    a genuine path-reachable rotation), so it is `JoinedIdQvC` by the engine `joinedIdQvC_mul`. -/
theorem joinedIdQvC_piRotE2 : JoinedIdQvC (axisRotLin (CD.e2 : O Cut) (-1) 0) := by
  rw [← quarterTurnE2_sq]
  have hq : JoinedIdQvC (axisRotLin (CD.e2 : O Cut) 0 1) :=
    joinedIdQvC_axisRotLin _ e2_gFormC_self 0 1 (by ring) (by norm_num)
  exact joinedIdQvC_mul hq hq

/-- The antipode `π`-rotation sends the `x`-axis `(0,1,0)` to `(0,−1,0)`. -/
theorem piRotE2_apply_xaxis :
    (axisRotLin (CD.e2 : O Cut) (-1) 0) ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (-1:Cut), (0:O Cut)) := by
  rw [axisRotLin_apply]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show (-1 : Cut) * 1 - 0 * gFormC (0:O Cut) (CD.e2 : O Cut) = -1
    rw [gFormC_zero_left]; ring
  · show (0:O Cut) + (0 * 1 + ((-1) - 1) * gFormC (0:O Cut) (CD.e2 : O Cut)) • (CD.e2 : O Cut) = 0
    rw [gFormC_zero_left]; simp

/-- The antipode `π`-rotation fixes the timelike axis. -/
theorem piRotE2_fixes_time :
    (axisRotLin (CD.e2 : O Cut) (-1) 0) ((1:Cut), (0:Cut), (0:O Cut))
      = ((1:Cut), (0:Cut), (0:O Cut)) := by
  rw [axisRotLin_apply]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show (-1 : Cut) * 0 - 0 * gFormC (0:O Cut) (CD.e2 : O Cut) = 0
    rw [gFormC_zero_left]; ring
  · show (0:O Cut) + (0 * 0 + ((-1) - 1) * gFormC (0:O Cut) (CD.e2 : O Cut)) • (CD.e2 : O Cut) = 0
    rw [gFormC_zero_left]; rw [mul_zero, mul_zero, add_zero, zero_smul, add_zero]

/-- The antipode `π`-rotation is a `QvC`-isometry (unit axis, circle point `(−1)²+0²=1`). -/
theorem piRotE2_isQvIsomC : IsQvIsomC (axisRotLin (CD.e2 : O Cut) (-1) 0) :=
  axisRotLin_isQvIsomC _ e2_gFormC_self (-1) 0 (by ring)

/-- The antipode `π`-rotation is involutive (`(−1,0)·(−1,0) = (1,0)`). -/
theorem piRotE2_involutive :
    (axisRotLin (CD.e2 : O Cut) (-1) 0) * (axisRotLin (CD.e2 : O Cut) (-1) 0) = 1 := by
  rw [axisRotLin_comp_same_axis _ e2_gFormC_self (-1) 0 (-1) 0,
      show (-1 : Cut) * (-1) - 0 * 0 = 1 by ring, show (-1 : Cut) * 0 + 0 * (-1) = 0 by ring,
      axisRotLin_one_zero]

/-- The antipode `π`-rotation has `LinearMap.det = 1`. -/
theorem det_piRotE2 : LinearMap.det (axisRotLin (CD.e2 : O Cut) (-1) 0) = 1 := by
  rw [det_axisRotLin _ e2_gFormC_self (-1) 0]; ring

/-- The antipode `π`-rotation sends `(0,−1,0)` back to the `x`-axis `(0,1,0)` (it is involutive). -/
theorem piRotE2_apply_negxaxis :
    (axisRotLin (CD.e2 : O Cut) (-1) 0) ((0:Cut), (-1:Cut), (0:O Cut))
      = ((0:Cut), (1:Cut), (0:O Cut)) := by
  rw [axisRotLin_apply]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show (-1 : Cut) * (-1) - 0 * gFormC (0:O Cut) (CD.e2 : O Cut) = 1
    rw [gFormC_zero_left]; ring
  · show (0:O Cut) + (0 * (-1) + ((-1) - 1) * gFormC (0:O Cut) (CD.e2 : O Cut)) • (CD.e2 : O Cut) = 0
    rw [gFormC_zero_left]; simp

/-! ## F — the keystone wrapper: a `(t,x)`-fixing det-`1` isometry is `JoinedIdQvC`. -/

/-- A `QvC`-isometry `g` fixing BOTH the timelike axis and the `x`-axis with `LinearMap.det g = 1`
    is `JoinedIdQvC`. The keystone `det_fixingTX_eq_vBlock` turns `det g = 1` into the `v`-block
    det-`1` hypothesis `joinedIdQvC_of_xtFixing_det_one` (N163) consumes — det-properness propagated,
    never assumed on the `v`-block. -/
theorem joinedIdQvC_of_xtFixing_det_one_via_keystone {g : Module.End Cut STVC}
    (hg : IsQvIsomC g)
    (ht : g ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hx : g ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut)))
    (hdet : LinearMap.det g = 1) :
    JoinedIdQvC g := by
  apply joinedIdQvC_of_xtFixing_det_one hg ht hx
  rw [← det_fixingTX_eq_vBlock hg ht hx]; exact hdet

/-! ## G — THE FULLY UNCONDITIONAL SO⁺(1,9) IDENTITY-COMPONENT CLOSURE. -/

/-- ★★ THE FULLY UNCONDITIONAL CLOSURE. EVERY proper (`LinearMap.det p = 1`) orthochronous
    (`0 ≤ (p e₀).1`) `QvC`-isometry `p` is the NON-VACUOUS `JoinedIdQvC`.

    The boost peel (N169 `joinedIdQvC_of_timeFixing_residual`) reduces `p` to its TIME-FIXING residual
    `k` of the factorization `p = B · k` (`B = genBoostLin`); det-multiplicativity then PROPAGATES the
    properness: `det B = 1` (`det_genBoostLin`) forces `det k = det p = 1`. The time-fixing det-`1`
    residual `k` closes by a trichotomy on its `x`-axis image `k(0,1,0) = (0, x', v')`
    (time-zero by `timeFixing_xaxis_spatial_form`, unit-norm `x'² + gFormC v' v' = 1` by
    `isom_xaxis_image_norm`):
      • `v' ≠ 0` (the `x`-axis moves into the octonion block): the deflated stabilizer
        `deflateNinth x' v' · k` fixes both axes, so by the keystone `det_fixingTX_eq_vBlock` its
        `v`-block det equals `det(deflateNinth x' v') · det k = 1 · 1 = 1` (`det_deflateNinth`); feed
        the EvC-free time-fixing SO(9) closure `joinedIdQvC_of_timeFixing_evCOrth_SO9_aux` (N170).
      • `v' = 0`, `x' = +1` (`x`-axis FIXED): `joinedIdQvC_of_xtFixing_det_one_via_keystone`.
      • `v' = 0`, `x' = −1` (the ANTIPODE `(0,1,0) ↦ (0,−1,0)`): the antipode `π`-rotation
        `R = axisRotLin e₂ (−1) 0` (`joinedIdQvC_piRotE2`, `det_piRotE2 = 1`, involutive) sends the
        moved axis back, so `R · k` FIXES both axes with `det = 1` and is `JoinedIdQvC` by the keystone
        wrapper; then `k = R · (R · k)` is `JoinedIdQvC` by `joinedIdQvC_mul`.
    The ONLY determinant hypothesis is the properness `det p = 1`; it is propagated through the
    factorization, never assumed as a `v`-block input. -/
theorem joinedIdQvC_of_proper_orthochronous {p : Module.End Cut STVC}
    (hp : IsQvIsomC (p : STVC → STVC))
    (hproper : LinearMap.det p = 1)
    (hortho : 0 ≤ (p ((1:Cut), (0:Cut), (0:O Cut))).1) :
    JoinedIdQvC p := by
  apply joinedIdQvC_of_timeFixing_residual hp hortho
  intro wx wv a b k hunit hab _ha hkisom hktime hfac
  -- (1) propagate the properness `det p = 1` through `p = B · k`, `det B = 1`, to `det k = 1`.
  have hdetk : LinearMap.det k = 1 := by
    have hmul : LinearMap.det p
        = LinearMap.det (genBoostLin wx wv a b) * LinearMap.det k := by
      rw [← hfac]; exact det_End_mul (genBoostLin wx wv a b) k
    rw [hproper, det_genBoostLin wx wv hunit hab, one_mul] at hmul
    exact hmul.symm
  -- (2) the time-fixing residual `k` maps the `x`-axis to a spatial point of unit norm.
  have himg : k ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (k ((0:Cut), (1:Cut), (0:O Cut))).2.1,
          (k ((0:Cut), (1:Cut), (0:O Cut))).2.2) :=
    timeFixing_xaxis_spatial_form hkisom hktime
  set x' := (k ((0:Cut), (1:Cut), (0:O Cut))).2.1 with hx'def
  set v' := (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 with hv'def
  have hnorm : x' ^ 2 + gFormC v' v' = 1 := isom_xaxis_image_norm hkisom himg
  by_cases hv : v' = 0
  · -- (B) `v' = 0`: the `x`-axis stays in the `x`-line; `x'² = 1`.
    have hx2 : x' = 1 ∨ x' = -1 := by
      have hn : x' ^ 2 = 1 := by
        have h := hnorm; rw [hv, gFormC_zero_left, add_zero] at h; exact h
      have hmm : x' * x' = 1 := by rw [← pow_two]; exact hn
      exact mul_self_eq_one_iff.mp hmm
    rcases hx2 with hx1 | hxm1
    · -- (B1) `x' = +1`: `k` fixes the `x`-axis.
      have hx : k ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut)) := by
        rw [himg, hx1, hv]
      exact joinedIdQvC_of_xtFixing_det_one_via_keystone hkisom hktime hx hdetk
    · -- (B2) `x' = −1`: the ANTIPODE. `R · k` fixes both axes; `k = R · (R · k)`.
      have hkx : k ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (-1:Cut), (0:O Cut)) := by
        rw [himg, hxm1, hv]
      have hRkisom : IsQvIsomC
          ((axisRotLin (CD.e2 : O Cut) (-1) 0 * k : Module.End Cut STVC) : STVC → STVC) := by
        intro q
        show QvC ((axisRotLin (CD.e2 : O Cut) (-1) 0 * k) q) = QvC q
        rw [Module.End.mul_apply, piRotE2_isQvIsomC (k q), hkisom q]
      have hRktime : (axisRotLin (CD.e2 : O Cut) (-1) 0 * k) ((1:Cut), (0:Cut), (0:O Cut))
          = ((1:Cut), (0:Cut), (0:O Cut)) := by
        rw [Module.End.mul_apply, hktime, piRotE2_fixes_time]
      have hRkx : (axisRotLin (CD.e2 : O Cut) (-1) 0 * k) ((0:Cut), (1:Cut), (0:O Cut))
          = ((0:Cut), (1:Cut), (0:O Cut)) := by
        rw [Module.End.mul_apply, hkx, piRotE2_apply_negxaxis]
      have hdetRk : LinearMap.det (axisRotLin (CD.e2 : O Cut) (-1) 0 * k) = 1 := by
        rw [det_End_mul, det_piRotE2, hdetk, one_mul]
      have hRkJoined : JoinedIdQvC (axisRotLin (CD.e2 : O Cut) (-1) 0 * k) :=
        joinedIdQvC_of_xtFixing_det_one_via_keystone hRkisom hRktime hRkx hdetRk
      have hk_eq : axisRotLin (CD.e2 : O Cut) (-1) 0
          * (axisRotLin (CD.e2 : O Cut) (-1) 0 * k) = k := by
        rw [← mul_assoc, piRotE2_involutive, one_mul]
      rw [← hk_eq]
      exact joinedIdQvC_mul joinedIdQvC_piRotE2 hRkJoined
  · -- (A) `v' ≠ 0`: the `x`-axis moves into the octonion block; deflate + keystone.
    have hSisom : IsQvIsomC
        ((deflateNinth x' v' * k : Module.End Cut STVC) : STVC → STVC) := by
      intro q
      show QvC ((deflateNinth x' v' * k) q) = QvC q
      rw [Module.End.mul_apply, deflateNinth_isQvIsomC hv hnorm (k q), hkisom q]
    have hStime : (deflateNinth x' v' * k) ((1:Cut), (0:Cut), (0:O Cut))
        = ((1:Cut), (0:Cut), (0:O Cut)) := by
      rw [Module.End.mul_apply, hktime, deflateNinth_fixes_time]
    have hSx : (deflateNinth x' v' * k) ((0:Cut), (1:Cut), (0:O Cut))
        = ((0:Cut), (1:Cut), (0:O Cut)) :=
      deflateNinth_step hkisom himg hv
    have hdetVB : LinearMap.det (vBlockEndC (deflateNinth x' v' * k)) = 1 := by
      rw [← det_fixingTX_eq_vBlock hSisom hStime hSx, det_End_mul,
          det_deflateNinth hv hnorm, hdetk, one_mul]
    exact joinedIdQvC_of_timeFixing_evCOrth_SO9_aux hkisom hktime himg hv hdetVB

/-! ## H — W8 NON-VACUITY: a concrete non-identity proper orthochronous boost is `JoinedIdQvC`. -/

/-- ★ W8 NON-VACUITY / TEETH — the CONCRETE octonion-direction boost
    `B₀ := genBoostLin 0 1 (5/3) (4/3)` (a genuine non-identity `QvC`-isometry that MOVES the octonion
    coordinate: `B₀ e₀ = (5/3, 0, (4/3)•1) ≠ e₀`) is proper (`det B₀ = 1`, `det_genBoostLin`) and
    orthochronous (`(B₀ e₀).1 = 5/3 ≥ 0`), hence `JoinedIdQvC` by the unconditional closure
    `joinedIdQvC_of_proper_orthochronous`. NON-vacuous: the closure is exercised on a real
    non-identity element of `SO⁺(1,9)`, not the trivial identity. -/
theorem joinedIdQvC_octReal_boost :
    JoinedIdQvC (genBoostLin (0:Cut) (1:O Cut) ((5:Cut)/3) ((4:Cut)/3)) := by
  have hw : (0:Cut) ^ 2 + gFormC (1:O Cut) (1:O Cut) = 1 := by
    rw [gFormC_one_left, reQC_one]; ring
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by norm_num
  apply joinedIdQvC_of_proper_orthochronous
  · exact genBoostLin_isQvIsomC 0 1 hw hab
  · exact det_genBoostLin 0 1 hw hab
  · rw [(boost_peel_octReal_nonvac).2]
    show (0:Cut) ≤ (5:Cut)/3
    norm_num

end

end Phys.Algebra
