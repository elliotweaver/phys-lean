/-
  Phys.Algebra.HermitianJordan.PieceBfinal — N5j: the CAP'S POSITIVE EDGE, ASSEMBLED.
  ===========================================================================
  This module closes the positive edge of N5's Hermitian Jordan cap: the order-3 Jordan
  identity holds for the GENERAL Hermitian pair over the terminal algebra `O ℚ`,

      ★★ jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0,

  pinning the cap value EXACTLY at 3 (together with the banked `jordan_fails_H4`, the n ≥ 4
  failure). It assembles the banked structural pieces — never a brute coordinate bash:

    pieceA (banked, `PieceA.lean`): `jdef (Hm) (Dg) = 0` — a central diagonal in the SECOND
      slot drops out (master identity + nuclear diagonal + off-diagonal-free cube-associator).
    pieceB (here, completing the degree split): `jdef (Hm) (Xz) = 0` — a zero-diagonal off-part
      in the second slot. By `jdef_Hm_Xz_polar` (banked) this collapses to the polarization
      cross `polarCross (Dg) (Xz) (Xz)`, which splits (`polarCross_split`, banked) into:
        • the degree-2 part `polarCross2 (Dg) (Xz) (Xz) = 0` (banked, `PieceBdeg2.lean`,
          by CENTRALITY of the diagonal — the scalar-module dissolution);
        • the degree-1 part `polarCross1 (Dg) (Xz) (Xz) = 0` — the genuine octonionic
          ALTERNATIVITY kernel, closed HERE by the UNIT-DIAGONAL dissolution.

  THE DEGREE-1 CLOSE (docs/STANDARD.md THE ONE LAW). `polarCross1` is ℚ-LINEAR in its diagonal
  argument (each of its six terms carries the diagonal exactly once): `pc1_add_left` (additive),
  `pc1_smul_left` (ℚ-homogeneous through the banked `qMod` scalar action). The real diagonal
  decomposes over the ground ring as `Dg d0 d1 d2 = d0 • Du0 + d1 • Du1 + d2 • Du2` (`Dg_eq_smul`,
  a ℚ-linear combination of the three UNIT diagonals). So the whole OPAQUE-`ocR` content — the
  measured instrument wall of the eight prior coordinate runs (64–78) — reduces by linearity to
  the diagonal's value at the three UNIT positions, where the banked `polarCross1_Du0/_Du1/_Du2`
  (`PieceBdeg1.lean`) close it concretely (no `ocR`, a literal Cayley–Dickson coordinate identity).

  Then `jdef_H3` reassembles by the banked second-argument additivity `jdef_add_right` along
  `Hm₂ = Dg + Xz` (`Hm_split`): pieceA kills the diagonal second-slot part, pieceB the off part.
  Finally `jordan_cap_pinned_at_three` packages the n = 3 success with the banked n = 4 failure
  `jordan_fails_H4` — the cap value 3 is forced, not posited.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "generation / Jordan-as-physics / Albert /
  exceptional": what remains is the theorem that the symmetrised-product defect of two general
  self-adjoint 3×3 matrices over the Cayley–Dickson double of a double vanishes, while it does NOT
  vanish at order 4 — a pure structural matrix identity. No physics name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.PieceBdeg1
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PieceA
import Phys.Algebra.JordanTower
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-! ### The ℚ-scalar action is a scalar tower over octonion multiplication.

    These two instances let the matrix smul commute with the matrix product — they are exactly
    the banked transport lemmas `tr_sl`/`tr_sr` (a left/right `ocR`-factor pulls out of a product
    because `ocR` is central and associates). -/

instance : IsScalarTower ℚ (O ℚ) (O ℚ) := ⟨fun r x y => tr_sl r x y⟩
instance : SMulCommClass ℚ (O ℚ) (O ℚ) := ⟨fun r x y => (tr_sr r x y).symm⟩

/-! ### `polarCross1` is ℚ-linear in its diagonal argument. -/

/-- The Jordan bracket is ℚ-homogeneous in its left argument (matrix smul pulls through the
    matrix product by the scalar tower). -/
theorem jb_smul_left {n : ℕ} (r : ℚ) (A B : Matrix (Fin n) (Fin n) (O ℚ)) :
    jb (r • A) B = r • jb A B := by
  unfold jb; rw [Matrix.smul_mul, Matrix.mul_smul, smul_add]

/-- The Jordan bracket is ℚ-homogeneous in its right argument. -/
theorem jb_smul_right {n : ℕ} (r : ℚ) (A B : Matrix (Fin n) (Fin n) (O ℚ)) :
    jb A (r • B) = r • jb A B := by
  unfold jb; rw [Matrix.mul_smul, Matrix.smul_mul, smul_add]

/-- ★ `polarCross1` is ℚ-HOMOGENEOUS in its first (diagonal) argument: each of its six terms
    carries the diagonal exactly once, so a scalar on the diagonal pulls all the way out. -/
theorem pc1_smul_left {n : ℕ} (r : ℚ) (D X Y : Matrix (Fin n) (Fin n) (O ℚ)) :
    polarCross1 (r • D) X Y = r • polarCross1 D X Y := by
  unfold polarCross1
  simp only [jb_smul_left, jb_smul_right, smul_add, smul_sub]

/-- ★ `polarCross1` is ADDITIVE in its first (diagonal) argument. -/
theorem pc1_add_left {n : ℕ} (D D' X Y : Matrix (Fin n) (Fin n) (O ℚ)) :
    polarCross1 (D + D') X Y = polarCross1 D X Y + polarCross1 D' X Y := by
  unfold polarCross1 jb
  simp only [Matrix.add_mul, Matrix.mul_add]
  abel

/-- ★ THE REAL DIAGONAL IS A ℚ-LINEAR COMBINATION OF THE THREE UNIT DIAGONALS:
    `Dg d0 d1 d2 = d0 • Du0 + d1 • Du1 + d2 • Du2`. Each entry: a diagonal scalar `ocR dᵢ`
    is `dᵢ • 1 = ocR dᵢ * 1` at its own position and `dᵢ • 0 = 0` elsewhere. This is the
    decomposition that eliminates the OPAQUE `ocR` from the degree-1 close — the linearity
    then carries the whole content to the unit-diagonal lemmas. -/
theorem Dg_eq_smul (d0 d1 d2 : ℚ) :
    Dg d0 d1 d2 = d0 • Du0 (B := Dbl ℚ) + d1 • Du1 (B := Dbl ℚ) + d2 • Du2 (B := Dbl ℚ) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.add_apply, Matrix.smul_apply, qsmul_def, Dg, Du0, Du1, Du2,
    Matrix.diagonal_apply]
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.cons_val_zero, Matrix.cons_val_one,
      mul_zero, mul_one, add_zero, zero_add]

/-! ### The degree-1 polarization cross vanishes for the REAL diagonal `Dg`. -/

/-- ★★ THE DEGREE-1 POLARIZATION CROSS VANISHES (the alternativity kernel, closed). For the
    real central diagonal `Dg` and any two zero-diagonal Hermitian off-parts,
    `polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r) = 0`. By linearity (`Dg_eq_smul`,
    `pc1_add_left`, `pc1_smul_left`) this reduces to the banked unit-diagonal vanishings
    `polarCross1_Du0/_Du1/_Du2`. The opaque `ocR` never enters a coordinate — the eight-run
    instrument wall is dissolved by the ℚ-linearity. -/
theorem polarCross1_Dg_Xz (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r) = 0 := by
  rw [Dg_eq_smul, pc1_add_left, pc1_add_left, pc1_smul_left, pc1_smul_left, pc1_smul_left,
      polarCross1_Du0, polarCross1_Du1, polarCross1_Du2,
      smul_zero, smul_zero, smul_zero, add_zero, add_zero]

/-! ### pieceB and the full cap assembly. -/

/-- ★★ pieceB: `jdef (Hm d0 d1 d2 a b c) (Xz p q r) = 0`. The order-3 Jordan defect of a general
    Hermitian matrix against a zero-diagonal Hermitian off-part vanishes. By `jdef_Hm_Xz_polar`
    (banked) it equals the polarization cross `polarCross (Dg) (Xz) (Xz)`, which splits
    (`polarCross_split`, banked) into the degree-1 part (`polarCross1_Dg_Xz`, here) and the
    degree-2 part (`polarCross2_Dg_Xz`, banked) — both zero. -/
theorem jdef_Hm_Xz (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    jdef (Hm d0 d1 d2 a b c) (Xz p q r) = 0 := by
  rw [jdef_Hm_Xz_polar, polarCross_split, polarCross1_Dg_Xz, polarCross2_Dg_Xz, add_zero]

/-- ★★ THE CAP'S POSITIVE EDGE. The order-3 Jordan identity holds for the GENERAL Hermitian
    pair over the terminal algebra `O ℚ`:

        `jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0`.

    By the banked second-argument additivity `jdef_add_right` along `Hm₂ = Dg + Xz` (`Hm_split`),
    the defect splits into the second-slot diagonal part (pieceA `jdef_Hm_Dg`, banked) and the
    second-slot off part (pieceB `jdef_Hm_Xz`, here) — both zero. Structural matrix arithmetic
    throughout; no octonion-coordinate `ring` on the full Hermitian defect. -/
theorem jdef_H3 (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ) :
    jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0 := by
  rw [Hm_split e0 e1 e2 p q r, jdef_add_right, jdef_Hm_Dg, jdef_Hm_Xz, add_zero]

/-- ★★★ THE CAP IS PINNED EXACTLY AT 3. The Hermitian Jordan tower over the terminal algebra
    `O ℚ` satisfies the order-3 Jordan identity for EVERY general Hermitian pair (`jdef_H3`),
    and FAILS at order 4 (`jordan_fails_H4`, banked). The cap value 3 is therefore forced — the
    exact gap between alternativity (which `O ℚ` has, so order 3 is Jordan) and associativity
    (which `O ℚ` lost at the cascade stop, so order 4 is not). The SAME octonionic
    non-associativity drives both: one cause, the cap. -/
theorem jordan_cap_pinned_at_three :
    (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
        jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨fun d0 d1 d2 a b c e0 e1 e2 p q r => jdef_H3 d0 d1 d2 a b c e0 e1 e2 p q r,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
