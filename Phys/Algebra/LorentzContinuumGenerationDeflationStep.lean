/-
  Phys.Algebra.LorentzContinuumGenerationDeflationStep — N115: THE x-MOVING → x-FIXING
  DEFLATION STEP (the `SO(9) → SO(8)` reduction). N114 banked the concrete NON-DEGENERATE
  higher-sector witness `enlargedAxisNinth e₂ u w c s` (a `QvC`-isometry in the enlarged
  family `genIsomMonoidLinFamily`) reaching a deep octonion slot strictly beyond every
  single-`A`-plane element. The forward generators for full compact `SO(9)` are now all in
  hand: the octonion-block words (the `SO(8)` sector, N108–N111), the `A`-torus single plane
  (N107), the general-axis ninth family (N113), and the non-degenerate enlarged elements
  (N114). What remains for full compact-`SO(9)` surjectivity is the GLOBAL EXHAUSTION — that
  the enlarged family generates ALL `QvC`-isometries of the compact `x ⊕ 𝕆` sector (the
  reverse / spanning direction), a HEAVY group-manifold core Mathlib lacks over the derived
  `Cut`.

  ===========================================================================
  THE MEASURE-FIRST BANKABLE PIECE (ROADMAP §N115 priority (ii)). The global exhaustion runs
  by an induction on the `x`-motion: an arbitrary compact `QvC`-isometry `T` either FIXES the
  `x`-axis unit vector `(0,1,0)` (and then reduces to the `SO(8)` octonion-block problem) or
  MOVES it (and then one general-axis ninth rotation peels the motion off, reducing to the
  `x`-fixing case). THIS node banks the inductive STEP — the `x`-moving → `x`-fixing reduction
  — as a concrete, light, DERIVED theorem, and childs the global remainder.

  THE STRUCTURAL FACT (DERIVED from the trunk, NOT a posited Cartan/KAK decomposition). Let
  `T` be ANY compact `QvC`-isometry with `T (0,1,0) = (0, x', v')`. `QvC`-preservation forces
  the unit-sphere condition

      `x'² + gFormC v' v' = 1`        (`isom_xaxis_image_norm`)

  (because `QvC (0,1,0) = −1 = QvC (0,x',v') = −(x'² + gFormC v' v')`). If `T` MOVES the
  `x`-axis (`v' ≠ 0`), there is an EXPLICIT general-axis ninth rotation that rotates the moved
  image `(0,x',v')` BACK to `(0,1,0)`:

      `deflateNinth x' v' := axisRotLin (r⁻¹ • v') x' (−r)`,   `r := cutSqrt (gFormC v' v')`

  reading the UNIT axis `e = r⁻¹•v'` (`deflateNinth_axis_unit`: `gFormC e e = gFormC v' v'/r²
  = 1`, since `r·r = gFormC v' v'` by `cutSqrt_sq` on the strictly-positive Born self-overlap
  `gFormC_pos_of_ne`) and the circle point `(x', −r)` (`deflateNinth_circle`: `x'² + r² = x'²
  + gFormC v' v' = 1`). The rotate-back computation (pure `gFormC` bilinearity + `cutSqrt_sq`,
  `gFormC v' (r⁻¹•v') = r`):

      `deflateNinth x' v' (0, x', v') = (0,1,0)`        (`deflateNinth_apply_image`)

      • `x`-slot:  `x'·x' − (−r)·r = x'² + r·r = x'² + gFormC v' v' = 1`.
      • `v`-block: `v' + (−r·x' + (x'−1)·r)•e = (r − r)•e = 0`   (since `v' = r•e`).

  Hence the composite `deflateNinth x' v' · T` FIXES the `x`-axis unit vector:

      `(deflateNinth x' v' · T) (0,1,0) = (0,1,0)`        (★★ `deflateNinth_step`)

  The `x`-motion is PEELED OFF by a single explicit general-axis ninth rotation drawn from the
  banked enlarged family (`deflateNinth_mem ∈ genIsomMonoidLinFamily`,
  `deflateNinth_isQvIsomC`) — the deflation STEP that reduces the full `SO(9)` problem to its
  `x`-fixing stabilizer (the `SO(8)` octonion-block generation, the childed global remainder).

  ── WHAT THIS NODE BANKS ──
  `deflateNinth` — the explicit deflating general-axis ninth rotation.
  `gFormC_pos_of_ne` — `v' ≠ 0 ⇒ 0 < gFormC v' v'` (Born self-overlap strictly positive off `0`).
  `deflate_r_ne` — `v' ≠ 0 ⇒ r = cutSqrt (gFormC v' v') ≠ 0`.
  `deflateNinth_axis_unit` — the normalized axis `r⁻¹•v'` is a UNIT (`gFormC = 1`).
  `deflateNinth_circle` — the norm condition ⇒ `(x', −r)` is a circle point.
  `deflateNinth_mem` — SOUND ∈ `genIsomMonoidLinFamily` (a general-axis ninth generator).
  `deflateNinth_isQvIsomC` — a `QvC`-isometry (family soundness).
  ★ `isom_xaxis_image_norm` — `QvC`-isometry ⇒ `x'² + gFormC v' v' = 1` (the unit-sphere law).
  ★★ `deflateNinth_apply_image` — `deflateNinth x' v' (0,x',v') = (0,1,0)` (the rotate-back).
  ★★ `deflateNinth_step` — THE DEFLATION STEP: `(deflateNinth x' v' · T)(0,1,0) = (0,1,0)`.
  `deflate_witness_norm` / `deflate_witness_v_ne` / `deflate_witness_x_val` — W8 teeth: the
    concrete `x`-moving image `(3/5, (4/5)•e₂)` (norm `1`, `v' ≠ 0`) deflated back, `x`-slot `1`.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: `axisRotLin` / `axisRotLin_apply` /
  `axisRotLin_mem_genIsomMonoidLinFamily` / `genIsomMonoidLinFamily` /
  `genIsomMonoidLinFamily_isQvIsomC` (N113); `cutSqrt` / `cutSqrt_sq` / `cutSqrt_pos` (N57);
  `gFormC` / `gFormC_smul_left` / `gFormC_smul_right` / `gFormC_zero_left` (N-LieAlgebra);
  `gFormC_nonneg` / `gFormC_eq_zero_iff` (the Born positivity, N56); `e2_gFormC_self` (N53);
  `QvC` / `QformC` / `IsQvIsomC` (N-LorentzContinuum); the `Module.End` / `Field Cut` MACHINERY
  on the DERIVED objects (STANDARD §3) — over the derived ℝ `ContinuumQ.Cut` and the terminal
  algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group / SO⁺(1,9), NOT a posited operator
  topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full `Spin(9)` /
  `SO(9)` and reads off its `SO(8)·A·SO(8)` decomposition as the standard polar/KAK structure
  theorem. Here the deflation step is CONSTRUCTED forward from the trunk: the explicit rotation
  that peels the `x`-motion off ANY compact isometry is BUILT from the banked general-axis
  ninth family and the derived square root, and PROVED to rotate the moved `x`-axis image back
  to the pole — not a posited decomposition but a forced, witnessed reduction. The unit-sphere
  law `x'² + gFormC v' v' = 1` falls out of the Born form preservation, and the rotate-back is
  the completing-the-square the general axis was built to perform.

  ── THE FORWARD REMAINDER (childed N116) ──
  The GLOBAL `SO(8)`-generation completeness (whether the octonion-block words generate ALL of
  the `x`-fixing stabilizer) + the GLOBAL exhaustion assembly (iterating this deflation step to
  full surjectivity) + the literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End
  Cut STVC)` / `ContinuousLinearMap` so the N96 affine path is CONTINUOUS) remain the HEAVY
  group-manifold core Mathlib lacks over the derived `Cut` — the W1 dissolution remainder. THIS
  node banks the deflation STEP — the immediately-bankable structural piece of ROADMAP §N115
  priority (ii): an `x`-moving isometry, post-composed with a general-axis ninth rotation,
  becomes `x`-fixing.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / axis / isometry / compact / orthogonal / SO(9) / SO(8) / sphere
  / circle / ninth-direction / deflation / peel / stabilizer / pole / Spin / KAK / Cartan /
  generator": what remains is pure linear algebra over the derived complete ordered field
  `Cut` — for `v' ≠ 0` with `x'² + gFormC v' v' = 1`, the operator `axisRotLin (r⁻¹•v') x' (−r)`
  of `Module.End Cut (Cut × Cut × O Cut)` (where `r = cutSqrt (gFormC v' v')`) sends `(0,x',v')`
  to `(0,1,0)`; consequently for any `Cut`-linear `T` preserving `QvC` with `T(0,1,0) =
  (0,x',v')` and `v' ≠ 0`, the composite sends `(0,1,0)` to `(0,1,0)`. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationFullSO9Assembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The explicit deflating general-axis ninth rotation. -/

/-- THE EXPLICIT DEFLATING general-axis ninth rotation `deflateNinth x' v'`: rotates the 2-plane
    `span{x, v'/|v'|}` by the circle point `(x', −r)` where `r := cutSqrt (gFormC v' v')`, with the
    unit axis `r⁻¹ • v'` (the normalized moved direction). Built to rotate a moved `x`-axis image
    `(0, x', v')` BACK to the pole `(0, 1, 0)` — the deflation that peels the `x`-motion off any
    compact `QvC`-isometry. The general-axis ninth rotation `axisRotLin` (N113) instantiated at the
    axis and circle point the moved image dictates. -/
def deflateNinth (x' : Cut) (v' : O Cut) : Module.End Cut STVC :=
  axisRotLin ((cutSqrt (gFormC v' v'))⁻¹ • v') x' (-(cutSqrt (gFormC v' v')))

/-- The Born self-overlap is STRICTLY POSITIVE off `0`: `v' ≠ 0 ⇒ 0 < gFormC v' v'` (the order
    structure of the derived ℝ + the Born positivity `gFormC_nonneg` and `gFormC_eq_zero_iff`, N56). -/
theorem gFormC_pos_of_ne {v' : O Cut} (hv : v' ≠ 0) : 0 < gFormC v' v' := by
  rcases lt_or_eq_of_le (gFormC_nonneg v') with h | h
  · exact h
  · exact absurd ((gFormC_eq_zero_iff v').mp h.symm) hv

/-- `v' ≠ 0 ⇒ r = cutSqrt (gFormC v' v') ≠ 0` (the square root of a strictly-positive element is
    strictly positive, `cutSqrt_pos`, N57). The deflation needs `r` invertible to normalize the axis. -/
theorem deflate_r_ne {v' : O Cut} (hv : v' ≠ 0) : cutSqrt (gFormC v' v') ≠ 0 :=
  ne_of_gt (cutSqrt_pos (gFormC_pos_of_ne hv))

/-! ## The deflating rotation is a sound general-axis ninth generator. -/

/-- The normalized axis `r⁻¹ • v'` is a UNIT: `gFormC (r⁻¹•v') (r⁻¹•v') = r⁻²·gFormC v' v' = 1`
    (`gFormC` bilinearity + `r·r = gFormC v' v'` by `cutSqrt_sq` on the strictly-positive overlap).
    The axis the general-axis rotation requires. -/
theorem deflateNinth_axis_unit {v' : O Cut} (hv : v' ≠ 0) :
    gFormC ((cutSqrt (gFormC v' v'))⁻¹ • v') ((cutSqrt (gFormC v' v'))⁻¹ • v') = 1 := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have hr : r ≠ 0 := deflate_r_ne hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  rw [gFormC_smul_left, gFormC_smul_right, ← hrr]
  field_simp

/-- The norm condition makes `(x', −r)` a circle point: `x'² + (−r)² = x'² + gFormC v' v' = 1`
    (`cutSqrt_sq`). The circle point the general-axis rotation requires. -/
theorem deflateNinth_circle {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    x' ^ 2 + (-(cutSqrt (gFormC v' v'))) ^ 2 = 1 := by
  have hrr : cutSqrt (gFormC v' v') * cutSqrt (gFormC v' v') = gFormC v' v' :=
    cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  nlinarith [hnorm, hrr]

/-- SOUNDNESS — the deflating rotation lies in the FULL ninth-direction family submonoid: it is a
    general-axis ninth generator `axisRotLin (r⁻¹•v') x' (−r)` with a UNIT axis
    (`deflateNinth_axis_unit`) and a circle point (`deflateNinth_circle`), so
    `axisRotLin_mem_genIsomMonoidLinFamily` (N113) applies. -/
theorem deflateNinth_mem {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    deflateNinth x' v' ∈ genIsomMonoidLinFamily :=
  axisRotLin_mem_genIsomMonoidLinFamily _ _ _ (deflateNinth_axis_unit hv)
    (deflateNinth_circle hv hnorm)

/-- The deflating rotation is a `QvC`-isometry — directly from family soundness
    (`genIsomMonoidLinFamily_isQvIsomC`, N113), since it is an enlarged-family generator. -/
theorem deflateNinth_isQvIsomC {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    IsQvIsomC (deflateNinth x' v') :=
  genIsomMonoidLinFamily_isQvIsomC (deflateNinth_mem hv hnorm)

/-! ## The unit-sphere law and the rotate-back. -/

/-- ★ THE UNIT-SPHERE LAW — a `QvC`-isometry sends the `x`-axis unit vector to a point on the unit
    sphere `x'² + gFormC v' v' = 1`. `QvC (0,1,0) = 0 − 1 − gFormC 0 0 = −1`, and `QvC`-preservation
    forces `QvC (0, x', v') = −(x'² + gFormC v' v') = −1`. The constraint every compact isometry's
    `x`-image obeys — the hypothesis of the deflation. -/
theorem isom_xaxis_image_norm {T : STVC → STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut} (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) :
    x' ^ 2 + gFormC v' v' = 1 := by
  have h := hT ((0:Cut), (1:Cut), (0:O Cut))
  rw [hTimg] at h
  unfold QvC QformC at h
  simp only at h
  rw [gFormC_zero_left] at h
  nlinarith [h]

/-- ★★ THE ROTATE-BACK — the deflating rotation sends the moved image `(0, x', v')` BACK to the pole
    `(0, 1, 0)`, given `v' ≠ 0` and the unit-sphere law. Reading `gFormC v' (r⁻¹•v') = r⁻¹·gFormC v'
    v' = r` (`cutSqrt_sq`): the `x`-slot becomes `x'·x' − (−r)·r = x'² + r·r = x'² + gFormC v' v' =
    1`, and the `v`-block becomes `v' + (−r·x' + (x'−1)·r)•(r⁻¹•v') = (1 + (−r·x'+(x'−1)·r)·r⁻¹)•v' =
    (1 + (−1))•v' = 0` (since `v' = r•(r⁻¹•v')`). The completing-the-square the general axis was
    constructed to perform — pure `gFormC` bilinearity + one `cutSqrt_sq`, NO brute. -/
theorem deflateNinth_apply_image {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    deflateNinth x' v' ((0:Cut), x', v') = ((0:Cut), (1:Cut), (0:O Cut)) := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have hr : r ≠ 0 := deflate_r_ne hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold deflateNinth
  rw [axisRotLin_apply]
  have hread : gFormC v' (r⁻¹ • v') = r := by
    rw [gFormC_smul_right, ← hrr]; field_simp
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show x' * x' - (-(r)) * gFormC v' (r⁻¹ • v') = 1
    rw [hread]
    have : x' * x' + r * r = 1 := by rw [hrr]; nlinarith [hnorm]
    ring_nf; ring_nf at this; linarith [this]
  · show v' + ((-(r)) * x' + (x' - 1) * gFormC v' (r⁻¹ • v')) • ((r⁻¹) • v') = 0
    rw [hread, smul_smul]
    rw [show ((-(r)) * x' + (x' - 1) * r) * r⁻¹ = (-(1:Cut)) by field_simp; ring]
    rw [neg_one_smul]; abel

/-- ★★ THE DEFLATION STEP — the `SO(9) → SO(8)` reduction. For ANY compact `QvC`-isometry `T` whose
    `x`-axis image MOVES (`T (0,1,0) = (0, x', v')` with `v' ≠ 0`), the composite `deflateNinth x' v'
    · T` FIXES the `x`-axis unit vector `(0,1,0)`. The unit-sphere law (`isom_xaxis_image_norm`)
    feeds the rotate-back (`deflateNinth_apply_image`): `(deflateNinth x' v' · T)(0,1,0) =
    deflateNinth x' v' (0, x', v') = (0,1,0)`. The `x`-motion is PEELED OFF by a single explicit
    general-axis ninth rotation drawn from the banked enlarged family (`deflateNinth_mem`,
    `deflateNinth_isQvIsomC`) — the inductive STEP that reduces the full `SO(9)` generation problem
    to its `x`-fixing stabilizer (the `SO(8)` octonion-block generation, the childed N116 remainder).
    THIS is the deflation engine of the global exhaustion, banked as a forced, DERIVED reduction. -/
theorem deflateNinth_step {T : Module.End Cut STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut}
    (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0) :
    (deflateNinth x' v' * T) ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut)) := by
  have hnorm := isom_xaxis_image_norm hT hTimg
  rw [Module.End.mul_apply, hTimg, deflateNinth_apply_image hv hnorm]

/-! ## W8 teeth — a concrete `x`-moving image `(3/5, (4/5)•e₂)` deflated back to `(0,1,0)`. -/

/-- The concrete moved image `(0, 3/5, (4/5)•e₂)` satisfies the unit-sphere law:
    `(3/5)² + gFormC ((4/5)•e₂) ((4/5)•e₂) = 9/25 + (4/5)²·1 = 1` (`gFormC` bilinearity +
    `e2_gFormC_self`). A genuine `x`-moving image (the `v`-block is a nonzero deep-`e₂` component). -/
theorem deflate_witness_norm :
    ((3:Cut)/5) ^ 2 + gFormC (((4:Cut)/5) • (CD.e2 : O Cut)) (((4:Cut)/5) • (CD.e2 : O Cut)) = 1 := by
  rw [gFormC_smul_left, gFormC_smul_right, e2_gFormC_self]; norm_num

/-- The witness `v`-block `(4/5)•e₂` is genuinely NONZERO (its Born self-overlap is `(4/5)² ≠ 0`), so
    the deflation step applies — a real `x`-moving isometry image, not the `x`-fixing degenerate one. -/
theorem deflate_witness_v_ne : (((4:Cut)/5) • (CD.e2 : O Cut)) ≠ 0 := by
  intro h
  have : gFormC (((4:Cut)/5) • (CD.e2 : O Cut)) (((4:Cut)/5) • (CD.e2 : O Cut)) = 0 := by
    rw [h, gFormC_zero_left]
  rw [gFormC_smul_left, gFormC_smul_right, e2_gFormC_self] at this
  norm_num at this

/-- ★ W8 — the concrete `x`-moving image `(3/5, (4/5)•e₂)` is deflated BACK to the pole `(0,1,0)`: its
    `x`-slot reads `1` (`deflateNinth_apply_image`). The deflation made concrete — a genuine
    `x`-moving image (`v'` nonzero, `deflate_witness_v_ne`) rotated to the `x`-fixing pole. -/
theorem deflate_witness_x_val :
    (deflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))
        ((0:Cut), (3:Cut)/5, ((4:Cut)/5) • (CD.e2 : O Cut))).2.1 = 1 := by
  rw [deflateNinth_apply_image deflate_witness_v_ne deflate_witness_norm]

end

end Phys.Algebra
