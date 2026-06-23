/-
  Phys.Algebra.HermitianJordan.PolarFirst — N5i: the FIRST-ARGUMENT POLARIZATION of the
  order-3 Jordan-identity defect, and the pieceB reduction it powers.
  ===========================================================================
  The defect `jdef A B` is CUBIC in its first argument, so a split `A = D + X` does NOT
  distribute. The exact obstruction is the POLARIZATION cross-term: expanding the cube
  collects, beyond the two pure pieces, a 12-term biadditive cross expression `polarCross`.

      ★ jdef (D + X) Y = jdef X Y + jdef D Y + polarCross D X Y.

  This is a PURE biadditive identity — proved over ANY `NonAssocRing` from the bracket
  additivity laws (`jb_add_left`/`jb_add_right`) and additive cancellation (`abel`) alone,
  with every square (`A·A`) kept implicit inside the brackets. No coordinate expansion, no
  nuclearity, no alternativity.

  WHY THIS IS THE pieceB LEVER (docs/RUNBOOK.md W9.4). For the general Hermitian first
  argument `Hm = Dg + Xz` (its real central diagonal plus zero-diagonal off-part) against a
  zero-diagonal second argument `Xz …`, the two pure pieces are ALREADY banked zero:
      jdef (Xz …) (Xz …) = 0   (`jdef_Xz_core`, Core.lean)
      jdef (Dg …) (Xz …) = 0   (`jdef_Dg_Xz`, PieceB.lean — the nuclear first argument)
  so the whole of pieceB collapses to the polarization cross-term:
      ★ jdef (Hm …) (Xz …) = polarCross (Dg …) (Xz …) (Xz …).
  This isolates the genuine remaining octonionic content of the cap's first-slot drop as a
  single, sharply-named matrix — no coordinate `ocR` bash on the full Hermitian defect (the
  measured instrument wall of runs 62–71).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). No physics word appears in any statement:
  these are pure structural matrix identities for the symmetrised-product defect over a
  non-associative coordinate ring.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Core
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ### The first-argument polarization cross-term, abstract over any `NonAssocRing`. -/

section Polar
variable {S : Type*} [NonAssocRing S] {n : ℕ}

/-- The 12-term first-argument polarization cross of the order-3 defect: every monomial of
    `jdef (D + X) Y` that mixes `D` and `X` (i.e. is neither pure-`X` nor pure-`D`). Each term
    carries `D` linearly or quadratically; the pure-cube pieces are excluded. -/
def polarCross (D X Y : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jb (jb D Y) (jb D X) + jb (jb D Y) (jb X D) + jb (jb D Y) (jb X X)
  + jb (jb X Y) (jb D D) + jb (jb X Y) (jb D X) + jb (jb X Y) (jb X D)
  - jb D (jb Y (jb D X)) - jb D (jb Y (jb X D)) - jb D (jb Y (jb X X))
  - jb X (jb Y (jb D D)) - jb X (jb Y (jb D X)) - jb X (jb Y (jb X D))

/-- The Dg-DEGREE-1 part of the polarization cross: the six terms carrying `D` exactly once.
    This is the genuine octonionic residue — over `O ℚ` it vanishes by alternativity (the
    `asw_star`/`ka` associator kernel). -/
def polarCross1 (D X Y : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jb (jb D Y) (jb X X) + jb (jb X Y) (jb D X) + jb (jb X Y) (jb X D)
  - jb D (jb Y (jb X X)) - jb X (jb Y (jb D X)) - jb X (jb Y (jb X D))

/-- The Dg-DEGREE-2 part of the polarization cross: the six terms carrying `D` twice. Over a
    central, nuclear diagonal `D` this part vanishes by CENTRALITY and NUCLEARITY ALONE — no
    alternativity — so it admits a purely structural matrix-level proof. -/
def polarCross2 (D X Y : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jb (jb D Y) (jb D X) + jb (jb D Y) (jb X D) + jb (jb X Y) (jb D D)
  - jb D (jb Y (jb D X)) - jb D (jb Y (jb X D)) - jb X (jb Y (jb D D))

/-- The polarization cross splits, by the number of `D`-factors carried, into its degree-1 and
    degree-2 parts: `polarCross D X Y = polarCross1 D X Y + polarCross2 D X Y`. Pure regrouping
    (`abel`). This is the decisive structural decomposition (verified exact): the degree-2 part
    vanishes by centrality+nuclearity alone, the degree-1 part by alternativity, so the two close
    by entirely separate routes. -/
theorem polarCross_split (D X Y : Matrix (Fin n) (Fin n) S) :
    polarCross D X Y = polarCross1 D X Y + polarCross2 D X Y := by
  unfold polarCross polarCross1 polarCross2; abel

set_option maxHeartbeats 1600000 in
/-- ★★ THE FIRST-ARGUMENT POLARIZATION IDENTITY. The order-3 defect of a sum splits into the
    two pure-cube pieces plus the 12-term polarization cross:

        `jdef (D + X) Y = jdef X Y + jdef D Y + polarCross D X Y`.

    Pure biadditivity of the bracket (`jb_add_left`/`jb_add_right`) and additive cancellation
    (`abel`); the squares stay implicit inside the brackets, so there is no coordinate
    expansion and no nuclearity/alternativity. -/
theorem jdef_polar_first (D X Y : Matrix (Fin n) (Fin n) S) :
    jdef (D + X) Y = jdef X Y + jdef D Y + polarCross D X Y := by
  unfold jdef polarCross
  simp only [jb_add_left, jb_add_right]
  abel

end Polar

/-! ### The pieceB reduction over the octonion shape `O ℚ`. -/

/-- ★★ pieceB COLLAPSES TO THE POLARIZATION CROSS. Against a zero-diagonal Hermitian second
    argument `Xz p q r`, the order-3 defect of the general Hermitian first argument
    `Hm = Dg + Xz` equals the polarization cross of its diagonal and off-diagonal parts:

        `jdef (Hm d0 d1 d2 a b c) (Xz p q r) = polarCross (Dg d0 d1 d2) (Xz a b c) (Xz p q r)`.

    The two pure-cube pieces produced by the polarization identity are both BANKED zero:
    `jdef (Xz …) (Xz …) = 0` (`jdef_Xz_core`, the zero-diagonal core) and `jdef (Dg …) (Xz …) = 0`
    (`jdef_Dg_Xz`, the nuclear first argument). So pieceB's entire remaining octonionic content
    is the single matrix `polarCross (Dg) (Xz) (Xz)`. Structural; `ocR` never enters coordinates
    here. -/
theorem jdef_Hm_Xz_polar (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    jdef (Hm d0 d1 d2 a b c) (Xz p q r)
      = polarCross (Dg d0 d1 d2) (Xz a b c) (Xz p q r) := by
  rw [Hm_split, jdef_polar_first, jdef_Xz_core, jdef_Dg_Xz, zero_add, zero_add]

end Phys.Algebra.HJ
