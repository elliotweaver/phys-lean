/-
  N168 — THE GENERAL-AXIS BOOST FACTOR (the genuinely-new per-factor lever toward the eigenframe
  boost-product closure of the polar positive part).

  ── THE CHAIN POSITION ──
  N166 dissolved the N165 obstruction: the positive-part factor `p` of the converse polar
  decomposition of an arbitrary `BvC`-isometry is a positive self-adjoint `QvC`-isometry. N167
  banked the RECIPROCAL CHARACTERIZATION `p ∘ J ∘ p = J` / `J p J = p⁻¹` — the eigenvalue-
  reciprocal-pair pin distinguishing the positive part (a product of pure boosts) from a generic
  positive operator. The single residual closing the UNCONDITIONAL full `SO⁺(1,9)` identity
  component is `JoinedIdQvC p` for `p = specOpN (cutSqrt∘c) u`.

  ── MEASURE-FIRST VERDICT (W1/W9) — why the full closure is the genuinely-heavy remainder ──
  Three independent facts pin the full closure as a multi-run node:
    • N96 (`specPathOp`) already banked the AFFINE CONE path `id → p^{1/2}`, but it stays in the
      CONE OF POSITIVE OPERATORS, NOT the isometry group — the affine eigenvalue interpolation
      `(1−t)·1 + t·λ` does NOT preserve the reciprocal pair `(λ, 1/λ)`, so `γ(t)` is generically
      not a `QvC`-isometry. That is exactly why `JoinedIdQvC p` is still open: a path that stays
      IN the group is required.
    • `JoinedIdQvC` has NO inverse / conjugation closure banked (only RIGHT-multiplication
      continuity `endOpC_mul_right_cont`, N153), so the standard `R·B·R⁻¹` conjugation route is
      itself blocked — the same obstruction the rotation-path node (N156) recorded. THE ONE LAW
      (W5): do NOT grind the standard conjugation path; build the trunk-native general-axis lever.
    • The eigenframe extraction (reading the reciprocal-pair `(λ, 1/λ)` boost plane off the
      EvC-orthonormal eigenframe `u` of `p`, pairing the timelike axis with the extracted spatial
      direction) is a substantial spectral argument — the childed remainder (N169).

  ── THE TRUNK GEOMETRY ──
  `QvC (t, x, v) = t² − x² − gFormC v v` has signature `(1,9)`: exactly ONE timelike direction.
  A positive self-adjoint `QvC`-isometry is therefore a SINGLE boost in the plane spanned by the
  timelike axis and ONE spatial unit direction `ŵ = (wx, wv) ∈ Cut × O Cut` (the 9-dim spatial
  space), acting as the identity on `ŵ`'s orthogonal complement. N164 banked only the `t–x` boost
  (`boostEndC`, spatial direction = the `x`-coordinate). This node banks the genuinely-new lever
  the closure consumes: the boost in the `t–ŵ` plane for an ARBITRARY spatial unit direction `ŵ` —
  the hyperbolic mirror of N156's general-axis rotation `axisRotLin` (which generalized the
  real-axis rotation to any octonion axis, since the N114 separator showed the single real axis
  reaches only a proper sub-sector).

  ── WHAT THIS NODE BANKS ──
    `genBoostLin wx wv a b`        — the general-axis boost in the `t–ŵ` plane (`ŵ = (wx, wv)`):
                                     `σ := wx·x + gFormC v wv` (the `ŵ`-component of the spatial
                                     part), `δ := b·t + (a−1)·σ` (the boost increment along `ŵ`),
                                     `(t,x,v) ↦ (a·t + b·σ, x + δ·wx, v + δ•wv)`.
    `genBoostLin_apply`            — the action.
    `genBoostLin_eq_boostEndC`     — at `ŵ = (1, 0)` it IS the `t–x` boost `boostEndC a b` (the
                                     genuine generalization, mirroring `axisRotLin_one_eq_planeRotLin`).
    ★ `genBoostLin_isQvIsomC`      — a `QvC`-isometry for a UNIT spatial direction `ŵ`
                                     (`wx² + gFormC wv wv = 1`) and `a² − b² = 1` (completing the
                                     square via `gFormC_add_axis_self` + an explicit
                                     `linear_combination` of the two hypotheses over the derived ℝ).
    `genBoostPath`/`_iso`/`_zero`/`_isQvIsomC`/`_reaches`/`_cont`/`_image_preconnected`
                                   — the `cutSqrt`-steered hyperbolic path of general-axis boosts
                                     `m ↦ genBoostLin wx wv (cutSqrt(1+m²)) m`, continuous in the
                                     operator topology `endOpC`, starting at `1`, staying IN the
                                     isometry group (unit `ŵ`), reaching an arbitrary forward boost
                                     — WITHOUT a continuous power / `exp` / posited rapidity.
    ★★ `joinedIdQvC_genBoostLin`   — THE GENERAL-AXIS BOOST FACTOR is the NON-VACUOUS `JoinedIdQvC`
                                     (unit `ŵ`, `a² − b² = 1`, `0 < a`). The genuine generalization
                                     of N164's `joinedIdQvC_boostEndC` (`t–x` only) to ANY spatial
                                     unit direction. The mirror of N156's `joinedIdC_axisRotLin`.
    W8 `joinedIdQvC_genBoostLin_octReal_nonvac` — a CONCRETE general-axis boost in the
                                     octonion-real direction `ŵ = (0, 1)` (`gFormC 1 1 = 1`,
                                     `(5/3, 4/3)`): it is `JoinedIdQvC` AND, acting on the timelike
                                     axis `(1,0,0)`, it moves the OCTONION coordinate to `(4/3)•1`
                                     while leaving the `x`-coordinate `= 0` — a genuine boost NOT
                                     reachable by `boostEndC` (which moves `x`, not the octonion
                                     block). Non-vacuity with teeth: the lever genuinely extends
                                     reach beyond the single `t–x` plane.

  ── THE FORWARD REMAINDER (childed N169) ──
  Closing `JoinedIdQvC p` still needs the eigenframe extraction: read the reciprocal-pair
  structure off `p = specOpN (cutSqrt∘c) u` to identify the single spatial boost-direction `ŵ`
  and rapidity, so that `p = genBoostLin wx wv a b` (one general-axis boost), hence
  `JoinedIdQvC p` by `joinedIdQvC_genBoostLin`. The spectral extraction is the substantial
  remainder — the dedicated W1 dissolution childed N169.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete every physics word (Lorentz / boost / rotation / axis / signature / Minkowski / metric /
  isometry / self-adjoint / positive-part / polar / KAK / eigenframe / rapidity / hyperbola /
  path-connected / timelike / spatial): the statements stand as pure mathematics over the derived
  ℝ `Cut` and the terminal algebra `O Cut` — for a scalar `wx` and an octonion `wv` with
  `wx² + gFormC wv wv = 1`, and scalars `a, b` with `a² − b² = 1`, the linear endomorphism
  `genBoostLin wx wv a b` of `Cut × Cut × O Cut` preserves the form `QvC`; the `cutSqrt`-steered
  family lies in a preconnected subset of the operator topology `endOpC` containing `1`, every
  point of which preserves `QvC`. NO theorem STATEMENT needs a physics word.

  DERIVED from the banked chain: the `t–x` boost `boostEndC`/`boostEndC_apply` (N49) and the
  general-axis rotation template `axisRotLin` + the completing-the-square identity
  `gFormC_add_axis_self` (N113); the form machinery `QvC`/`QformC`/`gFormC` + `gFormC_add_left`/
  `_smul_left`/`_zero_right'`/`_one_left`/`reQC_one`; the square root `cutSqrt`/`cutSqrt_sq`/
  `cutSqrt_one`/`cutSqrt_unique`/`cutSqrt_one_add_sq_cont` (N57/N164); the operator topology
  `endOpC`/`endOpC_continuous_iff` (N152); the `JoinedIdQvC` engine `JoinedIdQvC`/
  `joinedIdQvC_isQvIsomC` (N157). `LinearMap.ext`, `IsPreconnected.image`, `isPreconnected_uIcc`,
  `Continuous.*`, `linear_combination` are MACHINERY on the DERIVED objects (STANDARD §3).
  Foundations-only `[propext, Classical.choice, Quot.sound]`.

  NO posited Lorentz / Pin / Spin / gauge / G₂ group, NO posited topology / connectedness, NO
  posited KAK / polar product, NO posited boost flow / rapidity, NO posited eigenframe, NO posited
  continuous power (`cutRpow` is NOT used — the path is the `cutSqrt`-steered hyperbola), NO
  regression to the vacuous `JoinedIdC`, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.LorentzContinuumPositivePartReciprocal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## (A) THE GENERAL-AXIS BOOST. -/

/-- ★ THE GENERAL-AXIS BOOST in the `t–ŵ` plane, `ŵ = (wx, wv)` a spatial direction in
    `Cut × O Cut`. With `σ := wx·x + gFormC v wv` (the `ŵ`-component of the spatial part) and
    `δ := b·t + (a−1)·σ` (the boost increment along `ŵ`):
    `(t,x,v) ↦ (a·t + b·σ, x + δ·wx, v + δ•wv)`. The hyperbolic mirror of N113's general-axis
    rotation `axisRotLin`; N49's `t–x` boost `boostEndC` is the case `ŵ = (1, 0)`. -/
def genBoostLin (wx : Cut) (wv : O Cut) (a b : Cut) : Module.End Cut STVC where
  toFun p := (a * p.1 + b * (wx * p.2.1 + gFormC p.2.2 wv),
              p.2.1 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx,
              p.2.2 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv)
  map_add' p q := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (p.1 + q.1) + b * (wx * (p.2.1 + q.2.1) + gFormC (p.2.2 + q.2.2) wv)
          = (a * p.1 + b * (wx * p.2.1 + gFormC p.2.2 wv))
            + (a * q.1 + b * (wx * q.2.1 + gFormC q.2.2 wv))
      rw [gFormC_add_left]; ring
    · show (p.2.1 + q.2.1)
            + (b * (p.1 + q.1) + (a - 1) * (wx * (p.2.1 + q.2.1) + gFormC (p.2.2 + q.2.2) wv)) * wx
          = (p.2.1 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx)
            + (q.2.1 + (b * q.1 + (a - 1) * (wx * q.2.1 + gFormC q.2.2 wv)) * wx)
      rw [gFormC_add_left]; ring
    · show (p.2.2 + q.2.2)
            + (b * (p.1 + q.1) + (a - 1) * (wx * (p.2.1 + q.2.1) + gFormC (p.2.2 + q.2.2) wv)) • wv
          = (p.2.2 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv)
            + (q.2.2 + (b * q.1 + (a - 1) * (wx * q.2.1 + gFormC q.2.2 wv)) • wv)
      rw [gFormC_add_left]
      rw [show (b * (p.1 + q.1) + (a - 1) * (wx * (p.2.1 + q.2.1) + (gFormC p.2.2 wv + gFormC q.2.2 wv)))
            = (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv))
              + (b * q.1 + (a - 1) * (wx * q.2.1 + gFormC q.2.2 wv)) by ring]
      rw [add_smul]; abel
  map_smul' r p := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (r • p.1) + b * (wx * (r • p.2.1) + gFormC (r • p.2.2) wv)
          = r • (a * p.1 + b * (wx * p.2.1 + gFormC p.2.2 wv))
      rw [gFormC_smul_left]; simp only [smul_eq_mul]; ring
    · show (r • p.2.1) + (b * (r • p.1) + (a - 1) * (wx * (r • p.2.1) + gFormC (r • p.2.2) wv)) * wx
          = r • (p.2.1 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx)
      rw [gFormC_smul_left]; simp only [smul_eq_mul]; ring
    · show (r • p.2.2) + (b * (r • p.1) + (a - 1) * (wx * (r • p.2.1) + gFormC (r • p.2.2) wv)) • wv
          = r • (p.2.2 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv)
      rw [gFormC_smul_left, smul_add, smul_smul]
      rw [show b * (r • p.1) + (a - 1) * (wx * (r • p.2.1) + r * gFormC p.2.2 wv)
            = r * (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) by
              simp only [smul_eq_mul]; ring]

/-- The action of the general-axis boost endomorphism. -/
theorem genBoostLin_apply (wx : Cut) (wv : O Cut) (a b : Cut) (p : STVC) :
    genBoostLin wx wv a b p
      = (a * p.1 + b * (wx * p.2.1 + gFormC p.2.2 wv),
         p.2.1 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx,
         p.2.2 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv) := rfl

/-- At `ŵ = (1, 0)` the general-axis boost IS the `t–x` boost `boostEndC a b` (`gFormC v 0 = 0`).
    The genuine generalization, mirroring N113's `axisRotLin_one_eq_planeRotLin`. -/
theorem genBoostLin_eq_boostEndC (a b : Cut) :
    genBoostLin (1 : Cut) (0 : O Cut) a b = boostEndC a b := by
  apply LinearMap.ext; intro p
  rw [genBoostLin_apply, boostEndC_apply]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * p.1 + b * (1 * p.2.1 + gFormC p.2.2 0) = a * p.1 + b * p.2.1
    rw [gFormC_zero_right']; ring
  · show p.2.1 + (b * p.1 + (a - 1) * (1 * p.2.1 + gFormC p.2.2 0)) * 1 = b * p.1 + a * p.2.1
    rw [gFormC_zero_right']; ring
  · show p.2.2 + (b * p.1 + (a - 1) * (1 * p.2.1 + gFormC p.2.2 0)) • (0 : O Cut) = p.2.2
    rw [smul_zero, add_zero]

/-- ★ THE GENERAL-AXIS BOOST IS A `QvC`-ISOMETRY for a UNIT spatial direction `ŵ`
    (`wx² + gFormC wv wv = 1`) and `a² − b² = 1`. The negative-definite spatial block of `QvC` is
    preserved by the hyperbolic boost in the `t–ŵ` plane; the `ŵ`-complement rides along unchanged.
    Pure field arithmetic over the derived ℝ via the completing-the-square identity
    `gFormC_add_axis_self` (N113), closed by an explicit `linear_combination` of the two
    hypotheses — the discrepancy is `(t² − σ²)·(a²−b²−1) − δ²·(wx²+gFormC wv wv − 1)`, which both
    hypotheses annihilate. The general-axis generalization of N49's `boostEndC_isQvIsomC`. -/
theorem genBoostLin_isQvIsomC (wx : Cut) (wv : O Cut)
    (hw : wx ^ 2 + gFormC wv wv = 1) {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    IsQvIsomC (genBoostLin wx wv a b) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [genBoostLin_apply]
  show QvC (a * t + b * (wx * x + gFormC v wv),
            x + (b * t + (a - 1) * (wx * x + gFormC v wv)) * wx,
            v + (b * t + (a - 1) * (wx * x + gFormC v wv)) • wv) = QvC (t, x, v)
  unfold QvC QformC
  simp only
  rw [gFormC_add_axis_self wv v (b * t + (a - 1) * (wx * x + gFormC v wv))]
  linear_combination (t ^ 2 - (wx * x + gFormC v wv) ^ 2) * hab
    - (b * t + (a - 1) * (wx * x + gFormC v wv)) ^ 2 * hw

/-! ## (B) THE `cutSqrt`-STEERED HYPERBOLIC PATH OF GENERAL-AXIS BOOSTS. -/

/-- THE GENERAL-AXIS HYPERBOLIC BOOST PATH `genBoostPath wx wv m := genBoostLin wx wv (cutSqrt(1+m²)) m`
    — the `cutSqrt`-steered family riding the hyperbola `a² − b² = 1`, the general-axis analogue of
    N164's `boostPath`. NO continuous power, NO `exp`. -/
def genBoostPath (wx : Cut) (wv : O Cut) (m : Cut) : Module.End Cut STVC :=
  genBoostLin wx wv (cutSqrt (1 + m ^ 2)) m

/-- THE ISOMETRY CONDITION: every parameter lands on the unit hyperbola
    `cutSqrt(1+m²)² − m² = 1` (`cutSqrt_sq` on `1 + m² ≥ 0`). -/
theorem genBoostPath_iso (m : Cut) : (cutSqrt (1 + m ^ 2)) ^ 2 - m ^ 2 = 1 := by
  nlinarith [cutSqrt_sq (show (0:Cut) ≤ 1 + m^2 by positivity)]

/-- `genBoostPath wx wv 0 = 1`: the path starts at the identity (`cutSqrt 1 = 1`,
    `genBoostLin wx wv 1 0 = id`). -/
theorem genBoostPath_zero (wx : Cut) (wv : O Cut) : genBoostPath wx wv 0 = 1 := by
  rw [genBoostPath, show (1:Cut) + (0:Cut)^2 = 1 by ring, cutSqrt_one]
  apply LinearMap.ext; intro p
  rw [genBoostLin_apply]
  show ((1:Cut) * p.1 + (0:Cut) * (wx * p.2.1 + gFormC p.2.2 wv),
        p.2.1 + ((0:Cut) * p.1 + ((1:Cut) - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx,
        p.2.2 + ((0:Cut) * p.1 + ((1:Cut) - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv) = p
  simp only [one_mul, zero_mul, sub_self, add_zero, zero_smul]

/-- ★ EVERY POINT of the general-axis boost path is a genuine `QvC`-isometry for a UNIT `ŵ`
    (`genBoostPath_iso` + `genBoostLin_isQvIsomC`). The path lies entirely IN the isometry group —
    the non-vacuity ingredient. -/
theorem genBoostPath_isQvIsomC (wx : Cut) (wv : O Cut)
    (hw : wx ^ 2 + gFormC wv wv = 1) (m : Cut) :
    IsQvIsomC (genBoostPath wx wv m) :=
  genBoostLin_isQvIsomC wx wv hw (genBoostPath_iso m)

/-- ★ THE PATH REACHES AN ARBITRARY FORWARD GENERAL-AXIS BOOST: for `a² − b² = 1` with `0 < a`,
    `genBoostPath wx wv b = genBoostLin wx wv a b` (since `cutSqrt(1+b²) = cutSqrt(a²) = a`). -/
theorem genBoostPath_reaches (wx : Cut) (wv : O Cut) {a b : Cut}
    (hab : a ^ 2 - b ^ 2 = 1) (ha : 0 < a) :
    genBoostPath wx wv b = genBoostLin wx wv a b := by
  rw [genBoostPath]
  have hr : cutSqrt (1 + b ^ 2) = a := by
    have h1b : (1:Cut) + b ^ 2 = a ^ 2 := by nlinarith [hab]
    rw [h1b]
    exact (cutSqrt_unique (le_of_lt ha) (by ring)).symm
  rw [hr]

/-- ★ THE GENERAL-AXIS BOOST PATH IS CONTINUOUS in the operator topology `endOpC`. By
    `endOpC_continuous_iff` each coordinate evaluation `m ↦ (genBoostPath wx wv m) v` is a finite
    combination of the continuous cosh-analogue `cutSqrt(1+m²)` (`cutSqrt_one_add_sq_cont`), the
    identity `m`, the fixed scalars `wx`/`gFormC v.2.2 wv`/`v`/`wv`, and constants — WITHOUT a
    continuous `cosh`/`exp`, WITHOUT a posited rapidity. -/
theorem genBoostPath_cont (wx : Cut) (wv : O Cut) : Continuous (genBoostPath wx wv) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun m => (genBoostPath wx wv m) v)
      = (fun m => ((cutSqrt (1 + m ^ 2) * v.1 + m * (wx * v.2.1 + gFormC v.2.2 wv),
          v.2.1 + (m * v.1 + (cutSqrt (1 + m ^ 2) - 1) * (wx * v.2.1 + gFormC v.2.2 wv)) * wx,
          v.2.2 + (m * v.1 + (cutSqrt (1 + m ^ 2) - 1) * (wx * v.2.1 + gFormC v.2.2 wv)) • wv) : STVC)) := by
    funext m
    rw [genBoostPath, genBoostLin_apply]
  rw [hrw]
  have hcs : Continuous (fun m : Cut => cutSqrt (1 + m ^ 2)) := cutSqrt_one_add_sq_cont
  apply Continuous.prodMk
  · exact (hcs.mul continuous_const).add (continuous_id.mul continuous_const)
  apply Continuous.prodMk
  · exact continuous_const.add
      (((continuous_id.mul continuous_const).add
        ((hcs.sub continuous_const).mul continuous_const)).mul continuous_const)
  · apply Continuous.add continuous_const
    apply Continuous.smul _ continuous_const
    exact (continuous_id.mul continuous_const).add
      ((hcs.sub continuous_const).mul continuous_const)

/-- The image of the general-axis boost path on a closed (unordered) interval is preconnected in
    the operator topology — the continuous image of a preconnected interval of the derived `Cut`. -/
theorem genBoostPath_image_preconnected (wx : Cut) (wv : O Cut) (m : Cut) :
    IsPreconnected (genBoostPath wx wv '' (Set.uIcc 0 m)) :=
  (isPreconnected_uIcc).image _ (genBoostPath_cont wx wv).continuousOn

/-! ## (C) THE GENERAL-AXIS BOOST FACTOR IS THE NON-VACUOUS `JoinedIdQvC`. -/

/-- ★★ THE GENERAL-AXIS BOOST FACTOR — a forward general-axis boost `genBoostLin wx wv a b`
    (UNIT `ŵ`, `a² − b² = 1`, `0 < a`) is the NON-VACUOUS `JoinedIdQvC`. The general-axis boost
    path supplies the preconnected witness set OF ISOMETRIES (`genBoostPath_isQvIsomC` — every
    point preserves `QvC`, the non-vacuity): it is continuous (`genBoostPath_cont`), starts at `1`
    (`genBoostPath_zero`), and reaches the boost at `m = b` (`genBoostPath_reaches`). The genuine
    generalization of N164's `joinedIdQvC_boostEndC` (`t–x` only) to ANY spatial unit direction;
    the hyperbolic mirror of N156's `joinedIdC_axisRotLin`. The `0 < a` states the FORWARD
    (orthochronous) branch — the single connected component THROUGH the identity. -/
theorem joinedIdQvC_genBoostLin (wx : Cut) (wv : O Cut)
    (hw : wx ^ 2 + gFormC wv wv = 1) {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) (ha : 0 < a) :
    JoinedIdQvC (genBoostLin wx wv a b) := by
  refine ⟨genBoostPath wx wv '' (Set.uIcc 0 b), ?_,
    genBoostPath_image_preconnected wx wv b, ?_, ?_⟩
  · rintro x ⟨m, _, rfl⟩
    exact genBoostPath_isQvIsomC wx wv hw m
  · exact ⟨0, Set.left_mem_uIcc, genBoostPath_zero wx wv⟩
  · exact ⟨b, Set.right_mem_uIcc, genBoostPath_reaches wx wv hab ha⟩

/-! ## (D) W8 NON-VACUITY — a concrete OCTONION-direction boost not reachable by `boostEndC`. -/

/-- ★ W8 NON-VACUITY / TEETH — the CONCRETE general-axis boost in the OCTONION-REAL direction
    `ŵ = (0, 1)` (`gFormC 1 1 = 1`) with parameters `(5/3, 4/3)` is `JoinedIdQvC` AND, acting on
    the timelike axis `(1, 0, 0)`, moves the OCTONION coordinate to `(4/3)•1` while leaving the
    `x`-coordinate `= 0`. This is a genuine boost NOT reachable by `boostEndC` (which moves the
    `x`-coordinate, never the octonion block) — the lever genuinely extends reach beyond the single
    `t–x` plane to the 8 octonion spatial directions. The non-vacuity has teeth: the moved
    coordinate `(4/3)•1 ≠ 0` and the unchanged `x = 0` together distinguish this from every `t–x`
    boost. -/
theorem joinedIdQvC_genBoostLin_octReal_nonvac :
    JoinedIdQvC (genBoostLin (0:Cut) (1:O Cut) ((5:Cut)/3) ((4:Cut)/3)) ∧
      genBoostLin (0:Cut) (1:O Cut) ((5:Cut)/3) ((4:Cut)/3) ((1:Cut), (0:Cut), (0:O Cut))
        = ((5:Cut)/3, (0:Cut), ((4:Cut)/3) • (1:O Cut)) := by
  have hw : (0:Cut) ^ 2 + gFormC (1:O Cut) (1:O Cut) = 1 := by
    rw [gFormC_one_left, reQC_one]; ring
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by norm_num
  refine ⟨joinedIdQvC_genBoostLin (0:Cut) (1:O Cut) hw hab (by norm_num), ?_⟩
  rw [genBoostLin_apply]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show (5:Cut)/3 * 1 + (4:Cut)/3 * (0 * 0 + gFormC 0 1) = (5:Cut)/3
    rw [gFormC_zero_left]; ring
  · show (0:Cut) + ((4:Cut)/3 * 1 + ((5:Cut)/3 - 1) * (0 * 0 + gFormC (0:O Cut) 1)) * 0 = 0
    ring
  · show (0:O Cut) + ((4:Cut)/3 * 1 + ((5:Cut)/3 - 1) * (0 * 0 + gFormC (0:O Cut) 1)) • (1:O Cut)
        = ((4:Cut)/3) • (1:O Cut)
    rw [gFormC_zero_left, zero_add]
    rw [show (4:Cut)/3 * 1 + ((5:Cut)/3 - 1) * (0 * 0 + 0) = (4:Cut)/3 by ring]

end

end Phys.Algebra
