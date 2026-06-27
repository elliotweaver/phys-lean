/-
  Phys.Algebra.LorentzContinuumGenerationExhaustionAssembly — N116: THE EXHAUSTION-ASSEMBLY
  FACTORIZATION (the inverse ninth rotation `inflateNinth` + THE FACTORIZATION). N115 banked the
  deflation STEP — the `SO(9) → SO(8)` PEEL: for a compact `QvC`-isometry `T` with
  `T (0,1,0) = (0, x', v')`, `v' ≠ 0`, the explicit general-axis ninth rotation
  `deflateNinth x' v' := axisRotLin (r⁻¹•v') x' (−r)` (`r := cutSqrt (gFormC v' v')`, N57) rotates
  the moved image BACK to the pole (`deflateNinth_apply_image`), so the composite
  `deflateNinth x' v' · T` FIXES `(0,1,0)` (`deflateNinth_step`) — the `x`-motion is peeled off,
  leaving an `x`-FIXING isometry.

  ===========================================================================
  THE MEASURE-FIRST BANKABLE PIECE (ROADMAP §N116 priority (ii), THE GLOBAL EXHAUSTION ASSEMBLY).
  N115 banked the PEEL but not the REASSEMBLY: the deflation step tells you the `x`-motion can be
  removed, but the exhaustion induction needs to FACTOR `T` itself as `(ninth rotation)·(x`-fixing
  part`)`. THIS node banks the reassembly — the explicit INVERSE rotation and the FACTORIZATION,
  as a concrete, light, DERIVED theorem, and keeps the inner `SO(8)`-generation completeness as
  the childed remainder.

  THE STRUCTURAL FACT (DERIVED from the trunk, NOT a posited Cartan/KAK decomposition). On a fixed
  2-plane `span{x, e}`, the general-axis rotations compose by ANGLE-ADDITION:

      `axisRotLin e c₁ s₁ · axisRotLin e c₂ s₂ = axisRotLin e (c₁c₂−s₁s₂) (c₁s₂+s₁c₂)`
                                                                  (★ `axisRotLin_comp_same_axis`)

  (for a UNIT axis `gFormC e e = 1`, pure `gFormC` bilinearity — the `SO(2)` rotation group law on
  the ninth-direction circle), and `axisRotLin e 1 0 = 1` (`axisRotLin_one_zero`, the identity
  rotation). Hence the INVERSE of `deflateNinth x' v' = axisRotLin (r⁻¹•v') x' (−r)` is the opposite
  angle

      `inflateNinth x' v' := axisRotLin (r⁻¹•v') x' (+r)`         (SAME `c = x'`, OPPOSITE `s = +r`)

  reading the UNIT axis `e = r⁻¹•v'` (`deflateNinth_axis_unit`, N115) and the circle point `(x', r)`
  (`inflateNinth_circle`: `x'² + r² = x'² + gFormC v' v' = 1` by `cutSqrt_sq`). The composed angle is
  `(c, s) = (x'·x' − r·(−r), x'·(−r) + r·x') = (x'² + r·r, 0) = (1, 0)`:

      `inflateNinth x' v' · deflateNinth x' v' = 1`               (★ `inflate_deflate_id`)

  — the ninth-direction circle is a genuine one-parameter group, and `deflateNinth` is invertible.
  `inflateNinth` is itself a SOUND general-axis ninth rotation (`inflateNinth_mem ∈
  genIsomMonoidLinFamily`, `inflateNinth_isQvIsomC`) that RE-MOVES the pole — the dual of N115's
  rotate-back:

      `inflateNinth x' v' (0,1,0) = (0, x', v')`                  (★★ `inflateNinth_apply_pole`)

  THE FACTORIZATION (★★ the assembly). For ANY compact `QvC`-isometry `T` with `T (0,1,0) =
  (0, x', v')`, `v' ≠ 0`:

      `T = inflateNinth x' v' · (deflateNinth x' v' · T)`         (★★ `deflate_factorization`)

  where the RIGHT factor `S := deflateNinth x' v' · T` is `x`-FIXING (`S (0,1,0) = (0,1,0)`,
  `deflateNinth_step` N115), and the LEFT factor `inflateNinth x' v'` is one explicit general-axis
  ninth rotation. So EVERY `x`-moving compact `QvC`-isometry is the product of one explicit
  general-axis ninth rotation and one `x`-FIXING isometry — the
  `SO(9) = (ninth rotation)·(SO(8) x`-fixing stabilizer`)` reassembly, the explicit realization of
  the exhaustion induction's reassembly step (`deflate_factorization_stabilizer` packages both: the
  right factor is `x`-fixing AND `T` is the inflate of it). The inner reduction (the `x`-fixing
  isometry → octonion-block word, the `SO(8)`-generation completeness) stays the childed remainder.

  ── WHAT THIS NODE BANKS ──
  ★ `axisRotLin_comp_same_axis` — the same-axis rotation ANGLE-ADDITION law (the `SO(2)` group law).
  `axisRotLin_one_zero` — the identity rotation `axisRotLin e 1 0 = 1`.
  `inflateNinth` — the INVERSE deflating rotation (opposite angle `+r`).
  `inflateNinth_circle` — the norm condition ⇒ `(x', r)` is a circle point.
  `inflateNinth_mem` — SOUND ∈ `genIsomMonoidLinFamily` (a general-axis ninth generator).
  `inflateNinth_isQvIsomC` — a `QvC`-isometry (family soundness).
  ★ `inflate_deflate_id` — `inflateNinth x' v' · deflateNinth x' v' = 1` (the inverse / group law).
  ★★ `inflateNinth_apply_pole` — `inflateNinth x' v' (0,1,0) = (0, x', v')` (the re-move, dual peel).
  ★★ `deflate_factorization` — `T = inflateNinth x' v' · (deflateNinth x' v' · T)`.
  ★★ `deflate_factorization_stabilizer` — the right factor is `x`-fixing AND `T` is its inflate.
  `inflate_witness_x_val` — W8 teeth: the concrete inflated pole `(0,1,0)` re-moved to `x`-slot `3/5`.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: `axisRotLin` / `axisRotLin_apply` /
  `axisRotLin_mem_genIsomMonoidLinFamily` / `genIsomMonoidLinFamily` /
  `genIsomMonoidLinFamily_isQvIsomC` (N113); `deflateNinth` / `deflateNinth_axis_unit` /
  `deflateNinth_step` / `deflate_r_ne` / `gFormC_pos_of_ne` / `isom_xaxis_image_norm` /
  `deflate_witness_norm` / `deflate_witness_v_ne` (N115); `cutSqrt` / `cutSqrt_sq` (N57); `gFormC` /
  `gFormC_add_left` / `gFormC_smul_left` / `gFormC_zero_left` (N-LieAlgebra); `IsQvIsomC` /
  `Module.End` / `Field Cut` MACHINERY on the DERIVED objects (STANDARD §3) — over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group /
  SO⁺(1,9), NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full `Spin(9)` /
  `SO(9)` and reads off its `SO(8)·A·SO(8)` polar/KAK decomposition as the standard structure
  theorem — including that the factors compose and invert as a Lie group. Here the reassembly is
  CONSTRUCTED forward from the trunk: the ninth-direction circle's group law
  (`axisRotLin_comp_same_axis`) is PROVED by `gFormC` bilinearity, the explicit inverse rotation is
  BUILT (opposite angle), PROVED to invert the deflation (`inflate_deflate_id`) and to re-move the
  pole (`inflateNinth_apply_pole`), and the factorization falls out by `mul_assoc` — not a posited
  group decomposition but a forced, witnessed factorization of every `x`-moving compact isometry
  into one explicit ninth rotation times one `x`-fixing isometry.

  ── THE FORWARD REMAINDER (childed N117) ──
  The GLOBAL `SO(8)`-generation completeness (whether the octonion-block words generate ALL of the
  `x`-fixing stabilizer — the Moufang/triality "every `SO(8)` rotation is a finite octonion-block
  word") + the literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` /
  `ContinuousLinearMap`) remain the HEAVY group-manifold core Mathlib lacks over the derived `Cut`.
  THIS node banks the reassembly STEP — the immediately-bankable structural piece of ROADMAP §N116
  priority (ii): every `x`-moving compact isometry factors as `(explicit ninth rotation)·(x`-fixing
  isometry`)`.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / axis / isometry / compact / orthogonal / SO(9) / SO(8) / SO(2) /
  sphere / circle / ninth-direction / inverse / factorization / assembly / stabilizer / pole / peel
  / deflation / inflation / Spin / KAK / Cartan / generator / group": what remains is pure linear
  algebra over the derived complete ordered field `Cut` — for a unit `gFormC e e = 1`,
  `axisRotLin e c₁ s₁ ∘ axisRotLin e c₂ s₂ = axisRotLin e (c₁c₂−s₁s₂) (c₁s₂+s₁c₂)` and
  `axisRotLin e 1 0 = id`; so for `v' ≠ 0` with `x'² + gFormC v' v' = 1`,
  `axisRotLin (r⁻¹•v') x' r ∘ axisRotLin (r⁻¹•v') x' (−r) = id` (`r = cutSqrt (gFormC v' v')`),
  `axisRotLin (r⁻¹•v') x' r (0,1,0) = (0,x',v')`, and consequently any `Cut`-linear `T` preserving
  `QvC` with `T (0,1,0) = (0,x',v')` equals `axisRotLin (r⁻¹•v') x' r ∘ (axisRotLin (r⁻¹•v') x' (−r)
  ∘ T)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The ninth-direction circle group law: same-axis rotations add their angles. -/

/-- ★ THE SAME-AXIS ANGLE-ADDITION LAW (the `SO(2)` rotation group law on the ninth-direction
    circle). For a UNIT octonion axis `e` (`gFormC e e = 1`), two general-axis rotations of the
    2-plane `span{x, e}` compose to the rotation by the SUM of their angles:
    `axisRotLin e c₁ s₁ · axisRotLin e c₂ s₂ = axisRotLin e (c₁c₂−s₁s₂) (c₁s₂+s₁c₂)`. Pure `gFormC`
    bilinearity (reading `gFormC (v + a•e) e = c₂·gFormC v e + s₂·x` through the unit axis) — the
    one-parameter group structure of the ninth-direction circle, DERIVED. -/
theorem axisRotLin_comp_same_axis (e : O Cut) (he : gFormC e e = 1) (c1 s1 c2 s2 : Cut) :
    axisRotLin e c1 s1 * axisRotLin e c2 s2
      = axisRotLin e (c1 * c2 - s1 * s2) (c1 * s2 + s1 * c2) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [Module.End.mul_apply, axisRotLin_apply, axisRotLin_apply, axisRotLin_apply]
  have hread : gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e
      = c2 * gFormC v e + s2 * x := by
    rw [gFormC_add_left, gFormC_smul_left, he]; ring
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show c1 * (c2 * x - s2 * gFormC v e) - s1 * gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e
        = (c1 * c2 - s1 * s2) * x - (c1 * s2 + s1 * c2) * gFormC v e
    rw [hread]; ring
  · show (v + (s2 * x + (c2 - 1) * gFormC v e) • e)
          + (s1 * (c2 * x - s2 * gFormC v e)
             + (c1 - 1) * gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e) • e
        = v + ((c1 * s2 + s1 * c2) * x + ((c1 * c2 - s1 * s2) - 1) * gFormC v e) • e
    rw [hread, add_assoc, ← add_smul]
    congr 2
    ring

/-- The identity rotation: `axisRotLin e 1 0 = 1` (angle zero). The unit of the ninth-direction
    circle group — a rotation by `(c, s) = (1, 0)` fixes every coordinate. -/
theorem axisRotLin_one_zero (e : O Cut) : axisRotLin e (1:Cut) (0:Cut) = 1 := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [axisRotLin_apply]
  show (t, (1:Cut) * x - (0:Cut) * gFormC v e, v + ((0:Cut) * x + ((1:Cut) - 1) * gFormC v e) • e)
      = (t, x, v)
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · ring
  · rw [show (0:Cut) * x + ((1:Cut) - 1) * gFormC v e = 0 by ring, zero_smul, add_zero]

/-! ## The inverse deflating rotation `inflateNinth` (opposite angle). -/

/-- THE INVERSE DEFLATING general-axis ninth rotation `inflateNinth x' v'`: the SAME unit axis
    `r⁻¹•v'` and cosine `x'` as `deflateNinth` (N115) but the OPPOSITE sine `+r` (`r := cutSqrt
    (gFormC v' v')`). The group-inverse of the deflation — it RE-MOVES the `x`-axis. -/
def inflateNinth (x' : Cut) (v' : O Cut) : Module.End Cut STVC :=
  axisRotLin ((cutSqrt (gFormC v' v'))⁻¹ • v') x' (cutSqrt (gFormC v' v'))

/-- The norm condition makes `(x', r)` a circle point: `x'² + r² = x'² + gFormC v' v' = 1`
    (`cutSqrt_sq`). The circle point the inverse rotation requires (opposite sine, same circle). -/
theorem inflateNinth_circle {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    x' ^ 2 + (cutSqrt (gFormC v' v')) ^ 2 = 1 := by
  have hrr : cutSqrt (gFormC v' v') * cutSqrt (gFormC v' v') = gFormC v' v' :=
    cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  nlinarith [hnorm, hrr]

/-- SOUNDNESS — the inverse rotation lies in the FULL ninth-direction family submonoid: it is a
    general-axis ninth generator `axisRotLin (r⁻¹•v') x' r` with a UNIT axis (`deflateNinth_axis_unit`,
    N115 — same axis as the deflation) and a circle point (`inflateNinth_circle`). -/
theorem inflateNinth_mem {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    inflateNinth x' v' ∈ genIsomMonoidLinFamily :=
  axisRotLin_mem_genIsomMonoidLinFamily _ _ _ (deflateNinth_axis_unit hv)
    (inflateNinth_circle hv hnorm)

/-- The inverse rotation is a `QvC`-isometry — directly from family soundness
    (`genIsomMonoidLinFamily_isQvIsomC`, N113), since it is an enlarged-family generator. -/
theorem inflateNinth_isQvIsomC {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    IsQvIsomC (inflateNinth x' v') :=
  genIsomMonoidLinFamily_isQvIsomC (inflateNinth_mem hv hnorm)

/-! ## The inverse / group law and the re-move. -/

/-- ★ THE INVERSE / GROUP LAW — the inverse rotation undoes the deflation: `inflateNinth x' v' ·
    deflateNinth x' v' = 1`. By the same-axis angle-addition law (`axisRotLin_comp_same_axis`, both
    factors share the unit axis `r⁻¹•v'`), the composed angle is `(c, s) = (x'·x' − r·(−r),
    x'·(−r) + r·x') = (x'² + r·r, 0) = (1, 0)` — using `r·r = gFormC v' v'` (`cutSqrt_sq`) and the
    unit-sphere law `x'² + gFormC v' v' = 1` — i.e. `axisRotLin (r⁻¹•v') 1 0 = 1`
    (`axisRotLin_one_zero`). The ninth-direction circle is a genuine one-parameter group, and the
    deflation is invertible. -/
theorem inflate_deflate_id {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    inflateNinth x' v' * deflateNinth x' v' = 1 := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have he : gFormC ((cutSqrt (gFormC v' v'))⁻¹ • v') ((cutSqrt (gFormC v' v'))⁻¹ • v') = 1 :=
    deflateNinth_axis_unit hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold inflateNinth deflateNinth
  rw [axisRotLin_comp_same_axis _ he x' r x' (-r)]
  rw [show x' * x' - r * (-r) = (1:Cut) by nlinarith [hnorm, hrr]]
  rw [show x' * (-r) + r * x' = (0:Cut) by ring]
  exact axisRotLin_one_zero _

/-- ★★ THE RE-MOVE — the inverse rotation sends the pole `(0,1,0)` to the moved image `(0, x', v')`,
    the DUAL of N115's rotate-back `deflateNinth_apply_image`. Reading `gFormC 0 (r⁻¹•v') = 0`: the
    `x`-slot becomes `x'·1 − r·0 = x'`, and the `v`-block becomes `0 + (r·1 + (x'−1)·0)•(r⁻¹•v') =
    (r·r⁻¹)•v' = v'`. Inflate re-moves what deflate peeled — the explicit inverse of the deflation. -/
theorem inflateNinth_apply_pole {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (_hnorm : x' ^ 2 + gFormC v' v' = 1) :
    inflateNinth x' v' ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v') := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have hr : r ≠ 0 := deflate_r_ne hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold inflateNinth
  rw [axisRotLin_apply]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show x' * 1 - r * gFormC (0:O Cut) ((r)⁻¹ • v') = x'
    rw [gFormC_zero_left]; ring
  · show (0:O Cut) + (r * 1 + (x' - 1) * gFormC (0:O Cut) ((r)⁻¹ • v')) • ((r)⁻¹ • v') = v'
    rw [gFormC_zero_left]
    rw [show r * 1 + (x' - 1) * 0 = r by ring]
    rw [smul_smul, zero_add]
    rw [show r * r⁻¹ = (1:Cut) by field_simp, one_smul]

/-! ## THE FACTORIZATION — every x-moving compact isometry = (ninth rotation)·(x-fixing isometry). -/

/-- ★★ THE FACTORIZATION — the reassembly the global exhaustion needs. For ANY compact `QvC`-isometry
    `T` whose `x`-axis image MOVES (`T (0,1,0) = (0, x', v')`, `v' ≠ 0`):

        `T = inflateNinth x' v' · (deflateNinth x' v' · T)`.

    The unit-sphere law (`isom_xaxis_image_norm`, N115) feeds the inverse law (`inflate_deflate_id`):
    `inflateNinth · (deflateNinth · T) = (inflateNinth · deflateNinth) · T = 1 · T = T` (`mul_assoc`).
    The RIGHT factor `deflateNinth x' v' · T` is `x`-FIXING (`deflateNinth_step`, N115); the LEFT
    factor `inflateNinth x' v'` is one explicit general-axis ninth rotation
    (`inflateNinth_isQvIsomC`). Every `x`-moving compact isometry is the product of one explicit
    ninth rotation and one `x`-fixing isometry — the `SO(9) = (ninth rotation)·(SO(8) x`-fixing
    stabilizer`)` reassembly, DERIVED. -/
theorem deflate_factorization {T : Module.End Cut STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut}
    (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0) :
    T = inflateNinth x' v' * (deflateNinth x' v' * T) := by
  have hnorm := isom_xaxis_image_norm hT hTimg
  rw [← mul_assoc, inflate_deflate_id hv hnorm, one_mul]

/-- ★★ THE FACTORIZATION PACKAGED — both halves of the reassembly step: the right factor
    `deflateNinth x' v' · T` is `x`-FIXING (lands in the `SO(8)` stabilizer), AND `T` is the inflate
    of it. This is the exhaustion induction's reassembly step in full: an arbitrary `x`-moving
    compact `QvC`-isometry `T` is `inflateNinth x' v'` (one explicit ninth rotation) composed with an
    `x`-fixing isometry, the inner reduction (`x`-fixing isometry → octonion-block word) being the
    childed `SO(8)`-generation remainder. -/
theorem deflate_factorization_stabilizer {T : Module.End Cut STVC} (hT : IsQvIsomC T)
    {x' : Cut} {v' : O Cut}
    (hTimg : T ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0) :
    (deflateNinth x' v' * T) ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut)) ∧
    T = inflateNinth x' v' * (deflateNinth x' v' * T) :=
  ⟨deflateNinth_step hT hTimg hv, deflate_factorization hT hTimg hv⟩

/-! ## W8 teeth — the concrete inflated pole re-moves the x-axis. -/

/-- ★ W8 — the inverse rotation `inflateNinth (3/5) ((4/5)•e₂)` RE-MOVES the pole `(0,1,0)`: its
    `x`-slot reads `3/5` (`inflateNinth_apply_pole`), the dual of N115's rotate-back. The reassembly
    made concrete — the pole rotated OUT to the `x`-moving image `(0, 3/5, (4/5)•e₂)` (`v'` nonzero,
    `deflate_witness_v_ne`), inverting the deflation that rotated it back. -/
theorem inflate_witness_x_val :
    (inflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))
        ((0:Cut), (1:Cut), (0:O Cut))).2.1 = (3:Cut)/5 := by
  rw [inflateNinth_apply_pole deflate_witness_v_ne deflate_witness_norm]

end

end Phys.Algebra
