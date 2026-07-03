# N274 PREREG — THE ARENA'S INNER-MULTIPLICATION COMMUTATOR

## Target
Production: Phys/Algebra/OctonionJordanInnerMultiplication.lean, namespace Phys.Algebra.HJ.

The arena's Jordan-multiplication operator Lmul A := (X ↦ jb A X) as ℚ-linear map (forced by jb, N5),
its inner commutator innerMul A B := Lmul A ∘ₗ Lmul B − Lmul B ∘ₗ Lmul A, and:

HEADLINE innerMul_diag:
  innerMul (slotA a)(slotB b)(Dg d0 d1 d2) = slotC ((d2−d1)•(star a·b))
  — couples N213 weight-difference (d2−d1) to N272 octonion coupling (star a·b).

W8 innerMul_moves_diagonal: nonzero; moves matter jAct(fixes)+framePerm(permutes) cannot.
Capstone inner_multiplication_structure with jordan_cap_pinned_at_three in TYPE.

## De-risk status (DONE, before production)
- probe3_entry.lean EXIT 0 ~12s: germ_entry12 (the (1,2)-entry identity) + germ_entry12_ne PROVEN.
- Core reduction: simp only [jb,slotA,slotB,Dg,Xz,mul_apply,Fin.sum_univ_three,...,diagonal_apply]
  ; norm_num ; rw [ocRmulR,ocRmulL,ocRmulR,ocRmulL] ; rw [mul_add,add_mul,qsmul_mul_right×2,
  qsmul_mul_left×2,sub_smul] ; abel.
- ocRmulL/ocRmulR (ocR d central = d•): rw [ocR = d•1, qsmul_mul_left/right, one/mul_one].
- star_smul works via rw [star_smul]; rfl (StarModule reachable through PieceBfinal import).
- slotC_sub / jb_slotB_Dg / jb_slotA_Dg (jb symmetric + jb_Dg_Xzabc N213) confirmed reducible.

## Imports needed
Phys.Algebra.OctonionJordanFamilySymmetry (slotA/B/C, jb_slotA_slotB N272, framePerm, jAct, cap)
Phys.Algebra.OctonionJordanWeightDiagram (jb_Dg_Xzabc N213, Dg, Xz)
Phys.Algebra.DerivationFinrank (qsmul_mul_left/right)
Phys.Algebra.HermitianJordan.PieceBfinal (IsScalarTower/SMulCommClass ℚ (O ℚ)(O ℚ))
Mathlib.Tactic

## Instances
attribute [local instance] CD.narCD CD.srCD  (qMod NOT needed if I avoid Xz-level smul_zero;
  use entry-level (1,2) computation like N213 for the headline OR the full slotC form via star_smul).

## Cost budget / KILL
Each theorem measured < 15s in probe. KILL: if any single obligation > 90s or needs maxHeartbeats
> 800000, STOP — decompose to entry-level lemmas (N213 style) or child. NO octonion coordinate
decide, NO native_decide. Whole-module target < 30s.

## Scope guard (honesty)
Bank operator + inner commutator + coupling identity + non-vacuity + cap ONLY. Do NOT claim mass
texture (★5 values), mixing angle (★2), full f₄=Der(J₃(O)). If full Leibniz/f₄-membership fights →
child it (THE ONE LAW). Costume C305 bites the coupling value.

## Physics-words-removable
Delete flavour/family/generation/mixing/texture/gauge/mass/charge/weight → pure statement about
Lmul/innerMul/jb/slotA-C/Dg/star on O ℚ. Load-bearing content in theorem statements only.
