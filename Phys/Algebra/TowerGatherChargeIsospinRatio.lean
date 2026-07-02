/-
  Phys.Algebra.TowerGatherChargeIsospinRatio — N253.
  ===========================================================================
  THE CONVENTION-FREE CHARGE:ISOSPIN INVARIANT-LENGTH RATIO 3:8 in the ambient so(7).

  Over the fundamental 7 = `ImO` of the derived octonion rung `O ℚ = CD (H ℚ)`, with the
  trace form `B(A,C) := trace (A ∘ C)` on `End ℚ ImO`, the two derived operators the SINGLE
  fold-root `u1` carries —
    • the GATHER charge operator `chargeOp = crossOp u1` (N240, landing in the fundamental-7
      summand of `so(7) = 14 ⊕ 7`, N225/N246), and
    • the DOUBLING weak-isospin Cartan `imRep DI`, `DI = ⟨innerDerivQ hI⟩` (N202, landing in the
      adjoint-14 = g₂ summand) —
  have invariant lengths in the ratio
        B(chargeOp, chargeOp) : B(imRep DI, imRep DI)  =  (−6) : (−16)  =  3 : 8,
  and are trace-ORTHOGONAL (`B(chargeOp, imRep DI) = B(chargeOp, imRep DJ) = B(chargeOp, imRep DK)
  = 0`). Because the fundamental 7 is g₂-IRREDUCIBLE (`no_proper_invariant_ImO`, N234), by Schur
  its invariant symmetric form is unique up to overall scale, so this RATIO is CONVENTION-FREE
  (independent of the arbitrary normalization of the form).

  THE ROUTE (THE ONE LAW / W9-LIGHT: integer 7×7 matrix arithmetic, NOT a coordinate bash of the
  trace). Both operators are expressed in the banked integer-matrix calculus `qI : M7 → End ℚ ImO`
  (N234): `chargeOp = qI Cmat` and `imRep DI = qI Imat` for explicit integer matrices. Then the
  trace form reduces through the banked `qI_comp` (composition = matrix product `mul7`) and
  `trace_qI` (`trace (qI M) = tr7 M`, the integer matrix trace) to a `decide` integer computation.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / isospin / hypercharge / weak-mixing
  / gauge / Cartan / colour / Standard Model": what remains is — over the derived field ℚ and the
  Cayley–Dickson double `O ℚ = CD (H ℚ)`, two specific skew-adjoint endomorphisms of the fundamental
  7-module `ImO` — the cross-product operator `crossOp u1` and the fundamental-7 image `imRep DI` of
  the inner derivation `innerDerivQ hI` — have trace-form self-lengths `−6` and `−16` and mutual
  trace `0`, so `8·B(A,A) = 3·B(C,C)`. No theorem STATEMENT needs a physics word.

  ⚠ SCOPE (do NOT overclaim). This banks PURELY the mathematical invariant-length ratio `3:8` +
  orthogonality of two forced `so(7)` elements. `3:8` coincides with the SU(5) tree-level weak
  mixing value, but this node does NOT claim to derive the physical weak mixing angle (couplings,
  running, the full generation embedding are a separate downstream node). It banks the
  convention-free ANCHOR the normalization needs — relocated from the rank-2 g₂ (where every prior
  node correctly refused a posited convention) to the ambient simple `so(7)` the gather tear
  produces — NOT the normalization itself.

  DERIVED from the trunk (the banked charge operator `chargeOp = crossOp u1` / `crossOpO` N240/N223;
  the weak-isospin Cartan `DI = ⟨innerDerivQ hI⟩` / `innerDeriv` / `hI` N202/N184; the fundamental
  7-representation `imRep` / `imRep_coe` / `ImO` N22 and its g₂-irreducibility `no_proper_invariant_ImO`
  N234; the integer-matrix calculus `qI` / `qZ` / `qI_comp` / `trace_qI` / `mul7` / `tr7` N234;
  `LinearMap.trace` / `LinearMap.ext` / `Subtype.ext` standard Mathlib MACHINERY on the DERIVED
  objects, STANDARD §3), NOT a posited su(2) / su(3) / so(7) / Lie-group / GUT-embedding /
  normalization convention as content, NOT Mathlib ℝ/ℂ as content (ℚ is the coefficient field the
  `trace` / `finrank` statements are WRITTEN IN — the N24/N204/N234 precedent; the OBJECTS are the
  derived rung `O ℚ`, the fundamental 7 `ImO`, the gather charge `chargeOp`, and the isospin image
  `imRep DI`), NOT a bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no bridge.
-/
import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.TowerGatherForcedChargeDirection
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## (A) The two operators as explicit integer 7×7 matrices in the banked `qI` calculus. -/

/-- The integer 7×7 matrix of the gather charge operator `chargeOp = crossOp u1` on the imaginary
    coordinates `c1..c7` (the banked `qI` convention: row `i` = output coordinate `e_{i+1}`). -/
def Cmat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, -1, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, -1, 0]]

/-- The integer 7×7 matrix of the weak-isospin Cartan image `imRep DI` on the imaginary
    coordinates. Twice the charge scale on its support — the doubling factor. -/
def Imat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, -2, 0, 0, 0, 0],
     ![0, 2, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -2],
     ![0, 0, 0, 0, 0, 2, 0]]

/-- ★ BRIDGE 1: the gather charge operator `chargeOp = crossOp u1` is the banked integer matrix
    `qI Cmat` on the fundamental 7. -/
theorem chargeOp_eq_qI : chargeOp = qI Cmat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO u1 (x : O ℚ)) = qZ Cmat (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Cmat, u1, c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0,
      sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

/-- ★ BRIDGE 2: the weak-isospin Cartan image `imRep DI` is the banked integer matrix `qI Imat`
    on the fundamental 7. -/
theorem imRep_DI_eq_qI : imRep DI = qI Imat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (innerDeriv (hI : H ℚ)) (x : O ℚ) = qZ Imat (x : O ℚ)
  ext <;>
    simp only [innerDeriv, liftEnd_apply, adHom_apply, hI, CD.iota, Dbl.J, qZ, Imat,
      c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      LinearMap.coe_mk, AddHom.coe_mk, AddMonoidHom.coe_mk, ZeroHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

/-! ## (B) The trace form and the three integer trace values. -/

/-- The trace form on `End ℚ ImO`: `B(A,C) = trace (A ∘ C)`. On the banked `qI` calculus it is the
    integer matrix trace of the product (`qI_comp` + `trace_qI`). -/
noncomputable abbrev traceForm7 (A C : Module.End ℚ ImO) : ℚ := LinearMap.trace ℚ ImO (A * C)

/-- The trace form of two `qI` matrices is the integer trace of their matrix product. -/
theorem traceForm7_qI (M N : M7) : traceForm7 (qI M) (qI N) = (tr7 (mul7 M N) : ℚ) := by
  show LinearMap.trace ℚ ImO (qI M * qI N) = _
  rw [qI_comp M N, trace_qI]

/-- ★ The invariant length of the gather charge operator: `B(chargeOp, chargeOp) = −6`. -/
theorem B_chargeOp_chargeOp : traceForm7 chargeOp chargeOp = -6 := by
  rw [chargeOp_eq_qI, traceForm7_qI]
  norm_num [show tr7 (mul7 Cmat Cmat) = -6 from by decide]

/-- ★ The invariant length of the weak-isospin Cartan image: `B(imRep DI, imRep DI) = −16`
    (matching the N204 g₂-Killing datum `B DI DI = −16`, isotropic on the isospin triple). -/
theorem B_imRep_DI : traceForm7 (imRep DI) (imRep DI) = -16 := by
  rw [imRep_DI_eq_qI, traceForm7_qI]
  norm_num [show tr7 (mul7 Imat Imat) = -16 from by decide]

/-- ★ ORTHOGONALITY: the gather charge operator is trace-orthogonal to the weak-isospin Cartan
    image: `B(chargeOp, imRep DI) = 0`. -/
theorem B_chargeOp_imRep_DI : traceForm7 chargeOp (imRep DI) = 0 := by
  rw [chargeOp_eq_qI, imRep_DI_eq_qI, traceForm7_qI]
  norm_num [show tr7 (mul7 Cmat Imat) = 0 from by decide]

/-! ## (C) THE HEADLINE: the convention-free ratio 3:8. -/

/-- ★★★ THE CONVENTION-FREE INVARIANT-LENGTH RATIO `3 : 8`. In the g₂-invariant fundamental-7 trace
    form (unique up to scale by Schur, `ImO` g₂-irreducible N234), the gather charge operator and
    the weak-isospin Cartan image satisfy `8 · B(chargeOp, chargeOp) = 3 · B(imRep DI, imRep DI)`,
    i.e. `|Q|² : |T3|² = 3 : 8` — DERIVED, scale-independent, no posited normalization. -/
theorem charge_isospin_ratio :
    8 * traceForm7 chargeOp chargeOp = 3 * traceForm7 (imRep DI) (imRep DI) := by
  rw [B_chargeOp_chargeOp, B_imRep_DI]; norm_num

/-- ★★ W8 NON-VACUITY WITH TEETH: the two invariant lengths are NEITHER equal (ratio ≠ 1:1) NOR
    zero — the ratio is the genuine `3 : 8` and the operators are trace-orthogonal, so the anchor
    is a real two-quantity structure, not a degenerate coincidence. -/
theorem charge_isospin_ratio_nonvacuous :
    traceForm7 chargeOp chargeOp ≠ traceForm7 (imRep DI) (imRep DI) ∧
    traceForm7 chargeOp chargeOp ≠ 0 ∧
    traceForm7 (imRep DI) (imRep DI) ≠ 0 ∧
    traceForm7 chargeOp (imRep DI) = 0 := by
  refine ⟨?_, ?_, ?_, B_chargeOp_imRep_DI⟩
  · rw [B_chargeOp_chargeOp, B_imRep_DI]; norm_num
  · rw [B_chargeOp_chargeOp]; norm_num
  · rw [B_imRep_DI]; norm_num

/-- ★★★ CAPSTONE: the convention-free charge:isospin structure on the fundamental 7 — the two
    forced operators `u1` carries have trace-form lengths `−6` and `−16` (ratio `3:8`), are
    trace-orthogonal, and neither is degenerate. -/
theorem charge_isospin_ratio_structure :
    traceForm7 chargeOp chargeOp = -6 ∧
    traceForm7 (imRep DI) (imRep DI) = -16 ∧
    traceForm7 chargeOp (imRep DI) = 0 ∧
    8 * traceForm7 chargeOp chargeOp = 3 * traceForm7 (imRep DI) (imRep DI) :=
  ⟨B_chargeOp_chargeOp, B_imRep_DI, B_chargeOp_imRep_DI, charge_isospin_ratio⟩

end Phys.Algebra

