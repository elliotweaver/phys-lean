/-
  Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle — N107: THE NINTH-ROTATION CIRCLE
  SUBGROUP (the abelian `A`-factor / maximal torus of the `SO(9) = SO(8)·A·SO(8)` KAK
  decomposition). N106 banked the ENLARGED alphabet `genIsomMonoidLinPlus` (the `biMulLin`
  octonion-block words + the `planeRotLin` ninth-direction rotations), proved it SOUND and STRICTLY
  larger than the word submonoid, and exhibited ONE concrete `SO(8)·(ninth-rotation)` element
  (`enlargedTwoPlaneNinth`). The next forced node toward the full compact-`SO(9)` surjectivity is the
  CONVERSE structure of the ninth generators themselves: do they CLOSE under composition — i.e. is a
  product of two ninth-direction rotations again a ninth-direction rotation? THIS node proves they
  do: the `planeRotLin c s` rotations form a CLOSED 1-PARAMETER ABELIAN SUBGROUP `≅ SO(2)` inside the
  enlarged submonoid, via the angle-addition (matrix-product) composition law.

  ===========================================================================
  THE STRUCTURAL FACT (the ROADMAP §N107 priority (i) immediately-bankable piece — the multi-ninth
  factorization, NO operator topology, NO posited Lorentz group, NO Mathlib ℝ/ℂ as content).

  `planeRotLin c s` (N105) acts as the rotation matrix `[[c,-s],[s,c]]` on the 2-plane `(x, r)`
  where `r := reQC v` (the `x`-axis and the real octonion axis), and as the IDENTITY on the
  imaginary octonion block `v - r•1`:

      `planeRotLin c s (t,x,v) = (t,  c·x − s·r,  v + (s·x + (c−1)·r)•1)`,

  whose new real-octonion read-off is `r' = reQC(v') = c·r + s·x` — exactly the rotated `(x,r)`
  pair. Composing two such rotations therefore composes the two `2×2` rotation matrices, giving the
  angle-addition law (UNCONDITIONAL — pure matrix product, no circle constraint needed):

      `planeRotLin c₁ s₁ * planeRotLin c₂ s₂
          = planeRotLin (c₁·c₂ − s₁·s₂) (c₁·s₂ + s₁·c₂)`.

  On the unit circle (`c²+s²=1`, the genuine ninth-direction rotations) the composite stays on the
  circle (`circlePoint_mul`), so the ninth generators are CLOSED under composition: the `SO(2)`
  abelian subgroup structure, read directly out of the coordinate action — the maximal torus the
  full `SO(9)` KAK decomposition factors through.

  ── WHAT THIS NODE BANKS (the circle subgroup law — closure, identity, inverse, isometry) ──

  `reQC_one` — the real octonion unit reads off `reQC 1 = 1` (`= gFormC 1 1`, N-Rotation).

  ★ `planeRotLin_one` — the trivial rotation `planeRotLin 1 0` IS the identity operator: `c=1, s=0`
    gives `x' = x` and a zero `•1` increment. The neutral element of the circle subgroup.

  ★★ `planeRotLin_mul` — THE ANGLE-ADDITION / COMPOSITION LAW (unconditional): the product of two
    ninth-direction rotations is the ninth-direction rotation of the matrix-product circle point
    `(c₁c₂−s₁s₂, c₁s₂+s₁c₂)`. The `SO(2)` group law, proved by the coordinate `(x,r)`-rotation
    composition + the `•1` increment collection (one `reQC_add`/`reQC_smul`/`reQC_one` reduction of
    the inner real read-off, then field arithmetic over the derived ℝ `Cut`).

  ★ `circlePoint_mul` — the matrix-product circle point of two unit-circle points is again a unit
    circle point (`(c₁²+s₁²)(c₂²+s₂²) = 1`). Closure of the circle under the group law.

  ★ `planeRotLin_mul_inv` — the INVERSE rotation: `planeRotLin c s * planeRotLin c (−s) = 1` for a
    circle point (`c²+s²=1`). Every ninth-direction rotation has a two-sided inverse inside the
    family — the circle subgroup is a GROUP, not merely a monoid.

  ★ `ninthRot_mul_mem_ninthGenSetLin` — the product of two ninth generators is again a ninth
    generator (closure of `ninthGenSetLin` under `*`, via `planeRotLin_mul` + `circlePoint_mul`).

  ★ `planeRotLin_mul_mem_genIsomMonoidLinPlus` — the composite ninth rotation lies in the enlarged
    submonoid (the banked N106 `planeRotLin_mem_genIsomMonoidLinPlus` applied to the composite).

  ★ `planeRotLin_mul_isQvIsomC` — the composite ninth rotation is a `QvC`-isometry (`planeRotLin`
    on the composite circle point, N105 `planeRotLin_isQvIsomC` + `circlePoint_mul`).

  ★ `planeRotDouble_eq` / `planeRotDouble_moves_x` (W8 TEETH) — the concrete DOUBLE-ANGLE of the
    circle point `(3/5, 4/5)`: `planeRotLin (3/5)(4/5) * planeRotLin (3/5)(4/5)
    = planeRotLin (−7/25)(24/25)` (the cosine DOUBLES to `c²−s² = 9/25−16/25 = −7/25`, NOT the
    `c²+s² = 1` of a wrong `cos = c₁c₂+s₁s₂` law), moving the `x`-coordinate of `(0,1,0)` to `−7/25`.
    The genuine double-angle, distinguishing the correct subtraction law from a wrong addition law.

      reQC_one                              — the real octonion unit reads off `1`.
      planeRotLin_one                       — ★ the trivial rotation is the identity.
      planeRotLin_mul                       — ★★ the angle-addition / composition law (unconditional).
      circlePoint_mul                       — ★ the circle is closed under the group law.
      planeRotLin_mul_inv                   — ★ the inverse rotation (the family is a group).
      ninthRot_mul_mem_ninthGenSetLin       — ★ the ninth generators are closed under `*`.
      planeRotLin_mul_mem_genIsomMonoidLinPlus — ★ the composite is an enlarged member.
      planeRotLin_mul_isQvIsomC             — ★ the composite is a `QvC`-isometry.
      planeRotDouble_eq / planeRotDouble_moves_x — ★ W8 teeth: the concrete double-angle moves `x`.

  DERIVED from the trunk (`planeRotLin` / `planeRotLin_apply` / `planeRotLin_isQvIsomC` /
  `planeRotLin_moves_x` N105; `planeRotLin_mem_genIsomMonoidLinPlus` / `ninthGenSetLin` /
  `genIsomMonoidLinPlus` N106; `reQC_add` / `reQC_smul` N-LieAlgebra; `gFormC_one` /
  `gFormC_one_right` N-Rotation/N105; the `LinearMap.ext` / `Submonoid` MACHINERY on the DERIVED
  objects, STANDARD §3), NOT a posited Lorentz group / SO⁺(1,9), NOT a posited operator topology,
  NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature posits the full `Spin(9)` (or
  `SO⁺(1,9)`) and reads off its maximal torus. Here the `SO(2)` abelian factor is DERIVED: the
  ninth-direction generators were forced (N105/N106) by exactly what the `biMulLin` words proved
  missing, and THIS node proves — by composing their coordinate actions — that they already carry
  the closed circle-group structure (closure, identity, inverse, isometry-preservation). The
  abelian `A`-factor of the KAK decomposition is not assumed; it is read out of the generators the
  chain built. The contribution: the maximal torus of the compact group, derived, never posited.

  ── THE FORWARD REMAINDER (childed N108) ──
  The full compact-`SO(9)` surjectivity needs three legs: (a) the octonion-block `SO(8)` is
  generated by the `biMulLin` words (the Moufang/triality question — HEAVY); (b) the abelian
  `A`-torus — THIS node (the ninth-rotation circle subgroup); (c) the KAK assembly
  `SO(9) = SO(8)·A·SO(8)` + the operator topology over `Cut` (HEAVY — Mathlib has NO operator
  topology `TopologicalSpace (Module.End Cut STVC)` over the derived `Cut`). THIS node banks leg (b);
  legs (a) + (c) + the operator topology are the childed heavy group-manifold remainder.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / rotation / isometry / compact /
  orthogonal / Spin / SO(9) / SO(8) / SO(2) / 2-plane / ninth-direction / generator / alphabet /
  word / octonion-block / circle / torus / angle / KAK / maximal-torus": what remains is pure linear
  algebra over the derived complete ordered field `Cut` — the circular maps `planeRotLin c s` of
  `Module.End Cut (Cut × Cut × O Cut)` satisfy a composition law turning the matrix-product pair, the
  point `(1,0)` is their identity, `(c,−s)` inverts `(c,s)` on the unit circle, each composite
  preserves the quadratic form `QvC`, and a concrete iterated composite moves the second coordinate
  projection. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationEnlargedAlphabet

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The real octonion unit reads off `1`. -/

/-- `reQC (1 : O Cut) = 1`: the deep-real read-off of the real octonion unit equals
    `gFormC 1 1 = 1` (`gFormC_one_right` with `gFormC_one`). -/
theorem reQC_one : reQC (1 : O Cut) = 1 := by
  have h := gFormC_one_right (1 : O Cut)
  rw [gFormC_one] at h
  exact h.symm

/-! ## The trivial rotation is the identity. -/

/-- ★ THE NEUTRAL ELEMENT — `planeRotLin 1 0 = 1`. For the circle point `(c,s) = (1,0)` the
    `x`-coordinate is unchanged (`1·x − 0·r = x`) and the `•1` increment vanishes
    (`0·x + (1−1)·r = 0`), so the rotation IS the identity operator. -/
theorem planeRotLin_one : planeRotLin (1 : Cut) (0 : Cut) = 1 := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [planeRotLin_apply]
  show (t, (1:Cut) * x - (0:Cut) * reQC v,
        v + ((0:Cut) * x + ((1:Cut) - 1) * reQC v) • (1 : O Cut)) = (t, x, v)
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show (1:Cut) * x - (0:Cut) * reQC v = x; ring
  · show v + ((0:Cut) * x + ((1:Cut) - 1) * reQC v) • (1 : O Cut) = v
    rw [show (0:Cut) * x + ((1:Cut) - 1) * reQC v = 0 by ring, zero_smul, add_zero]

/-! ## The angle-addition / composition law (unconditional). -/

/-- ★★ THE COMPOSITION LAW — the product of two ninth-direction rotations is the ninth-direction
    rotation of the matrix-product circle point (UNCONDITIONAL, no circle constraint):

      `planeRotLin c₁ s₁ * planeRotLin c₂ s₂
          = planeRotLin (c₁·c₂ − s₁·s₂) (c₁·s₂ + s₁·c₂)`.

    `planeRotLin c s` acts as `[[c,-s],[s,c]]` on the `(x, reQC v)` plane and as the identity on the
    imaginary octonion block, so composing two of them composes the two `2×2` rotation matrices —
    the `SO(2)` angle-addition law. Proof: reduce the inner real read-off
    `reQC(v + (s₂x+(c₂−1)r)•1) = c₂·r + s₂·x` (`reQC_add`/`reQC_smul`/`reQC_one`), then the
    `x`-coordinate composes as the matrix product and the `•1` increments collect (`add_smul`) to the
    composite increment — pure field arithmetic over the derived ℝ `Cut`. -/
theorem planeRotLin_mul (c1 s1 c2 s2 : Cut) :
    planeRotLin c1 s1 * planeRotLin c2 s2
      = planeRotLin (c1 * c2 - s1 * s2) (c1 * s2 + s1 * c2) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  show planeRotLin c1 s1 (planeRotLin c2 s2 (t, x, v))
      = planeRotLin (c1 * c2 - s1 * s2) (c1 * s2 + s1 * c2) (t, x, v)
  rw [planeRotLin_apply c2 s2, planeRotLin_apply c1 s1, planeRotLin_apply]
  have hrr : reQC (v + (s2 * x + (c2 - 1) * reQC v) • (1 : O Cut))
              = c2 * reQC v + s2 * x := by
    rw [reQC_add, reQC_smul, reQC_one]; ring
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show c1 * (c2 * x - s2 * reQC v)
          - s1 * reQC (v + (s2 * x + (c2 - 1) * reQC v) • (1 : O Cut))
        = (c1 * c2 - s1 * s2) * x - (c1 * s2 + s1 * c2) * reQC v
    rw [hrr]; ring
  · show (v + (s2 * x + (c2 - 1) * reQC v) • (1 : O Cut))
          + (s1 * (c2 * x - s2 * reQC v)
             + (c1 - 1) * reQC (v + (s2 * x + (c2 - 1) * reQC v) • (1 : O Cut))) • (1 : O Cut)
        = v + ((c1 * s2 + s1 * c2) * x + ((c1 * c2 - s1 * s2) - 1) * reQC v) • (1 : O Cut)
    rw [hrr, add_assoc, ← add_smul]
    rw [show (s2 * x + (c2 - 1) * reQC v)
            + (s1 * (c2 * x - s2 * reQC v) + (c1 - 1) * (c2 * reQC v + s2 * x))
          = (c1 * s2 + s1 * c2) * x + ((c1 * c2 - s1 * s2) - 1) * reQC v by ring]

/-! ## The circle is closed under the group law; the inverse rotation. -/

/-- ★ The matrix-product circle point of two unit-circle points is a unit-circle point:
    `(c₁c₂−s₁s₂)² + (c₁s₂+s₁c₂)² = (c₁²+s₁²)(c₂²+s₂²) = 1`. -/
theorem circlePoint_mul (c1 s1 c2 s2 : Cut)
    (h1 : c1 ^ 2 + s1 ^ 2 = 1) (h2 : c2 ^ 2 + s2 ^ 2 = 1) :
    (c1 * c2 - s1 * s2) ^ 2 + (c1 * s2 + s1 * c2) ^ 2 = 1 := by
  have hprod : (c1 * c2 - s1 * s2) ^ 2 + (c1 * s2 + s1 * c2) ^ 2
        = (c1 ^ 2 + s1 ^ 2) * (c2 ^ 2 + s2 ^ 2) := by ring
  rw [hprod, h1, h2]; ring

/-- ★ THE INVERSE ROTATION — for a circle point (`c²+s²=1`),
    `planeRotLin c s * planeRotLin c (−s) = 1`. The matrix-product circle point is
    `(c·c − s·(−s), c·(−s) + s·c) = (c²+s², 0) = (1, 0)`, the identity. Every ninth-direction
    rotation has a two-sided inverse inside the family — the circle subgroup is a GROUP. -/
theorem planeRotLin_mul_inv (c s : Cut) (h : c ^ 2 + s ^ 2 = 1) :
    planeRotLin c s * planeRotLin c (-s) = 1 := by
  rw [planeRotLin_mul]
  rw [show c * c - s * (-s) = (1:Cut) by nlinarith [h],
      show c * (-s) + s * c = (0:Cut) by ring]
  exact planeRotLin_one

/-! ## The ninth generators are closed under composition; soundness of the composite. -/

/-- ★ The product of two ninth-direction generators is again a ninth-direction generator
    (`planeRotLin_mul` rewrites the product to a single `planeRotLin`; `circlePoint_mul` certifies
    its circle point). The generating set `ninthGenSetLin` is closed under `*`. -/
theorem ninthRot_mul_mem_ninthGenSetLin (c1 s1 c2 s2 : Cut)
    (h1 : c1 ^ 2 + s1 ^ 2 = 1) (h2 : c2 ^ 2 + s2 ^ 2 = 1) :
    planeRotLin c1 s1 * planeRotLin c2 s2 ∈ ninthGenSetLin := by
  rw [planeRotLin_mul]
  exact ⟨c1 * c2 - s1 * s2, c1 * s2 + s1 * c2, circlePoint_mul c1 s1 c2 s2 h1 h2, rfl⟩

/-- ★ The composite ninth rotation lies in the enlarged submonoid (rewrite to the single
    `planeRotLin` of the composite circle point, then the banked N106
    `planeRotLin_mem_genIsomMonoidLinPlus`). -/
theorem planeRotLin_mul_mem_genIsomMonoidLinPlus (c1 s1 c2 s2 : Cut)
    (h1 : c1 ^ 2 + s1 ^ 2 = 1) (h2 : c2 ^ 2 + s2 ^ 2 = 1) :
    planeRotLin c1 s1 * planeRotLin c2 s2 ∈ genIsomMonoidLinPlus := by
  rw [planeRotLin_mul]
  exact planeRotLin_mem_genIsomMonoidLinPlus _ _ (circlePoint_mul c1 s1 c2 s2 h1 h2)

/-- ★ The composite ninth rotation is a `QvC`-isometry (rewrite to the single `planeRotLin` of the
    composite circle point, then the N105 base `planeRotLin_isQvIsomC` + `circlePoint_mul`). -/
theorem planeRotLin_mul_isQvIsomC (c1 s1 c2 s2 : Cut)
    (h1 : c1 ^ 2 + s1 ^ 2 = 1) (h2 : c2 ^ 2 + s2 ^ 2 = 1) :
    IsQvIsomC ((planeRotLin c1 s1 * planeRotLin c2 s2 : Module.End Cut STVC) : STVC → STVC) := by
  rw [planeRotLin_mul]
  exact planeRotLin_isQvIsomC _ _ (circlePoint_mul c1 s1 c2 s2 h1 h2)

/-! ## W8 TEETH — the concrete double-angle distinguishes the true subtraction law. -/

/-- ★ W8 — THE CONCRETE DOUBLE-ANGLE of the circle point `(3/5, 4/5)`:
    `planeRotLin (3/5)(4/5) * planeRotLin (3/5)(4/5) = planeRotLin (−7/25)(24/25)`. The cosine
    DOUBLES to `c² − s² = 9/25 − 16/25 = −7/25` (the genuine subtraction law of `planeRotLin_mul`),
    NOT the `c² + s² = 1` a wrong addition law `cos = c₁c₂ + s₁s₂` would give. -/
theorem planeRotDouble_eq :
    planeRotLin ((3:Cut)/5) ((4:Cut)/5) * planeRotLin ((3:Cut)/5) ((4:Cut)/5)
      = planeRotLin (-(7:Cut)/25) ((24:Cut)/25) := by
  rw [planeRotLin_mul]
  rw [show (3:Cut)/5 * (3/5) - 4/5 * (4/5) = -(7:Cut)/25 by norm_num,
      show (3:Cut)/5 * (4/5) + 4/5 * (3/5) = (24:Cut)/25 by norm_num]

/-- ★ W8 TEETH — the concrete double-angle MOVES `x`: applied to `(0,1,0)`, the doubled rotation
    `planeRotLin (−7/25)(24/25)` sends the `x`-coordinate `1 ↦ −7/25` (`planeRotLin_moves_x`). The
    genuine double-angle `x`-image, distinguishing the correct composition law from any wrong one. -/
theorem planeRotDouble_moves_x :
    ((planeRotLin ((3:Cut)/5) ((4:Cut)/5) * planeRotLin ((3:Cut)/5) ((4:Cut)/5))
        ((0:Cut), (1:Cut), (0:O Cut))).2.1 = -(7:Cut)/25 := by
  rw [planeRotDouble_eq, planeRotLin_moves_x]

end

end Phys.Algebra
