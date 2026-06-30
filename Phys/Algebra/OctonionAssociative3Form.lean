/-
# N209 — THE ASSOCIATIVE CALIBRATION 3-FORM `φ(x,y,z) = ⟨x, y × z⟩`

Over the derived `ℚ` and the octonion rung `O ℚ = CD (H ℚ)`, the 7-dimensional cross product
`octCross` (banked N206) and the Born self-overlap form `gForm` (banked N24) assemble into the
totally-antisymmetric trilinear CALIBRATION 3-FORM on the imaginary subspace `ImO`:

      assoc3 x y z := gForm x (octCross y z).

For imaginary `x, y, z ∈ ImO` this equals `− reQ (x · (y · z))` — minus the real part of the
octonion triple product — and it is CYCLIC and ANTISYMMETRIC, hence totally antisymmetric: it is
the alternating 3-form whose stabilizer in `GL(7)` is exactly the exceptional structure group, the
calibration that recognizes the same `g₂ = Der(O)` carrying the gauge arc.

## Why this is a GENUINELY NEW joint (not a re-pin, not mechanical)
- DIFFERENT OBJECT/DEGREE: a degree-3 SCALAR totally-antisymmetric trilinear FORM
  `ImO × ImO × ImO → ℚ`. NOT `octCross` (bilinear VECTOR, N206); NOT the scalar Lagrange norm
  (degree-2 quadratic, N206); NOT the contraction `octCross_contraction` (degree-3 VECTOR identity,
  N208); NOT the full-algebra Jacobiator (N205); NOT the metric `gForm` alone (degree-2, N24).
- THE GENUINELY-NEW LEVER: the cyclic symmetry `assoc3 x y z = assoc3 y z x` is the real-part
  TRACE-ASSOCIATIVITY of the octonion product, `reQ ((a·b)·c) = reQ (a·(b·c))` (`reQ_mul_assoc3`) —
  a fact NEVER banked in the chain (reQ-associativity / trace cyclicity were not present). The
  antisymmetry is forced by the banked `octCross_antisymm` (N206) + `gForm` symmetry. Cyclic + one
  transposition ⟹ total antisymmetry — the calibration 3-form.

## STANDARD compliance (the words-removable test, §2)
There are NO physics words in any theorem STATEMENT. Delete every comment and the mathematics
stands: over `ℚ` and `CD (H ℚ)`, the trilinear form `(x,y,z) ↦ gForm x (octCross y z)` on
`ImO = ker(star + 1)` equals `− reQ (x·(y·z))`, is cyclic, antisymmetric under each transposition,
and nonzero on an explicit triple (value `−1`). `reQ`/`gForm`/`octCross` are the DERIVED objects;
ℚ is the coefficient field the statements are WRITTEN IN (the N6/N24/N206/N208 precedent).

DERIVED from the trunk (the cross product `octCross`/`octCross_mem_ImO`/`octCross_antisymm` N206;
the contraction witness `octCross_contraction_witness` N208; the Born form `gForm`/`gForm_symm` N24
+ `gForm_add_right`/`gForm_smul_right` N31; `reQ`/`reQ_neg`/`reQ_smul`/`reQ_add` N17;
`reQ_ImO_zero` N208; `ImO`/`mem_ImO` N26; `u1`/`u2`/`u1_mem_ImO`/`u2_mem_ImO` N18/N26;
`gForm_u2_u2` N206; `qsmul_mul_right` N19; `star_neg`/`mul_neg` Mathlib MACHINERY on the DERIVED
object, STANDARD §3), NO posited cross product / `G₂` / alternative algebra / composition algebra /
Lie group / calibration / 3-form as content, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.OctonionCrossProductContraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The trace levers: real-part cyclicity and associativity of the octonion product. -/

/-- TRACE CYCLICITY of the real part: `reQ (a·b) = reQ (b·a)` for ALL `a, b` — the real part of
    the octonion product is symmetric, a pure coordinate identity on the Cayley–Dickson product. -/
theorem reQ_mul_comm (a b : O ℚ) : reQ (a * b) = reQ (b * a) := by
  simp only [reQ, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

/-- ★ TRACE ASSOCIATIVITY of the real part: `reQ ((a·b)·c) = reQ (a·(b·c))` for ALL `a, b, c` —
    the real part of the octonion product is associative even though the product itself is NOT.
    The genuinely-new lever the cyclic symmetry of the calibration 3-form rests on. -/
theorem reQ_mul_assoc3 (a b c : O ℚ) : reQ ((a * b) * c) = reQ (a * (b * c)) := by
  simp only [reQ, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

/-- `gForm v (−w) = − gForm v w` — the right-slot negation law. -/
theorem gForm_neg_right (v w : O ℚ) : gForm v (-w) = - gForm v w := by
  show reQ (v * star (-w)) = - reQ (v * star w)
  rw [star_neg, mul_neg, reQ_neg]

/-! ## The calibration 3-form. -/

/-- ★ THE CALIBRATION 3-FORM: `assoc3 x y z = ⟨x, y × z⟩` — the Born overlap of `x` with the
    cross product of `y` and `z`. -/
def assoc3 (x y z : O ℚ) : ℚ := gForm x (octCross y z)

/-- ★ THE BRIDGE TO TRACE-ASSOCIATIVITY: for imaginary `x, y, z`,
    `assoc3 x y z = − reQ (x · (y · z))`. The metric correction term `(gForm y z)•1` is killed by
    `reQ x = 0` (`x ∈ ImO`), so the 3-form IS minus the real part of the octonion triple product. -/
theorem assoc3_eq_neg_reQ {x y z : O ℚ} (hx : x ∈ ImO) (_hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - reQ (x * (y * z)) := by
  unfold assoc3
  have hwmem : octCross y z ∈ ImO := octCross_mem_ImO hz
  have hstar : star (octCross y z) = - (octCross y z) := (mem_ImO).mp hwmem
  show reQ (x * star (octCross y z)) = - reQ (x * (y * z))
  rw [hstar, mul_neg, reQ_neg]
  unfold octCross
  rw [mul_add, reQ_add]
  have hrx : reQ x = 0 := reQ_ImO_zero hx
  have hcorr : x * ((gForm y z) • (1 : O ℚ)) = (gForm y z) • x := by
    rw [qsmul_mul_right, mul_one]
  rw [hcorr, reQ_smul, hrx, mul_zero, add_zero]

/-- ★★ THE 3-FORM IS CYCLIC: `assoc3 x y z = assoc3 y z x` (imaginary `x, y, z`) — the real-part
    trace-associativity of the octonion product, the genuinely-new content of this node. -/
theorem assoc3_cyclic {x y z : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = assoc3 y z x := by
  rw [assoc3_eq_neg_reQ hx hy hz, assoc3_eq_neg_reQ hy hz hx]
  congr 1
  rw [reQ_mul_comm x (y * z), reQ_mul_assoc3 y z x]

/-- ★ THE 3-FORM IS ANTISYMMETRIC under swapping the last two arguments:
    `assoc3 x y z = − assoc3 x z y` (imaginary `y, z`) — from `octCross_antisymm` (N206). -/
theorem assoc3_swap_yz {x y z : O ℚ} (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - assoc3 x z y := by
  unfold assoc3
  rw [octCross_antisymm hy hz, gForm_neg_right]

/-- ★ THE 3-FORM IS ANTISYMMETRIC under swapping the first two arguments:
    `assoc3 x y z = − assoc3 y x z` (imaginary `x, y, z`) — derived from cyclic + the yz-swap. With
    `assoc3_swap_yz` this makes `assoc3` TOTALLY ANTISYMMETRIC: the calibration 3-form. -/
theorem assoc3_swap_xy {x y z : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - assoc3 y x z := by
  have h1 : assoc3 y x z = assoc3 x z y := assoc3_cyclic hy hx hz
  have h2 : assoc3 x z y = - assoc3 x y z := assoc3_swap_yz hz hy
  rw [h1, h2, neg_neg]

/-! ## W8 non-vacuity teeth. -/

/-- W8 NON-VACUITY: the 3-form on the orthonormal-derived triple `(u2, u1, u1 × u2)` equals `−1`
    — via the banked contraction witness `u1 × (u1 × u2) = −u2` (N208) and `⟨u2, u2⟩ = 1` (N206).
    The calibration is NON-DEGENERATE: it takes a genuine nonzero value on a real triple. -/
theorem assoc3_witness : assoc3 u2 u1 (octCross u1 u2) = -1 := by
  unfold assoc3
  rw [octCross_contraction_witness, gForm_neg_right, gForm_u2_u2]

/-- ★★ THE CALIBRATION IS NON-VACUOUS: `assoc3 u2 u1 (octCross u1 u2) ≠ 0` (it is `−1`). -/
theorem assoc3_witness_ne_zero : assoc3 u2 u1 (octCross u1 u2) ≠ 0 := by
  rw [assoc3_witness]; norm_num

/-- THE ANTISYMMETRY HAS TEETH: swapping the first two arguments flips the witness value to `+1`,
    genuinely DISTINCT from the `−1` of `assoc3_witness` — the form really is alternating, not
    symmetric. -/
theorem assoc3_witness_swapped : assoc3 u1 u2 (octCross u1 u2) = 1 := by
  have hz : octCross u1 u2 ∈ ImO := octCross_mem_ImO (x := u1) u2_mem_ImO
  have h := assoc3_swap_xy u2_mem_ImO u1_mem_ImO hz
  rw [assoc3_witness] at h
  linarith [h]

end

end Phys.Algebra
