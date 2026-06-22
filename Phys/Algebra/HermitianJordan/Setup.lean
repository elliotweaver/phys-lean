/-
  Phys.Algebra.HermitianJordan.Setup — N5b shared carrier for the H₃ Jordan cap's
  POSITIVE edge.
  ===========================================================================
  The carrier for the positive direction of N5's cap: the general Hermitian 3×3
  matrices over the banked terminal algebra `O ℚ = CD (CD (Dbl ℚ))`, on which the
  symmetrized (Jordan) bracket `jb`/`jdef` (banked in `Phys/Algebra/JordanTower.lean`)
  is shown to satisfy the Jordan identity. NO new carrier is posited: the matrices are
  `Matrix (Fin 3) (Fin 3) (O ℚ)` over the cascade's own octonion shape, and the Jordan
  defect is the banked `Phys.Algebra.jdef`.

  A SELF-ADJOINT (Hermitian) matrix over a `*`-algebra is one with `A i j = star (A j i)`.
  Its diagonal entries are therefore self-conjugate; over the octonion shape the
  self-conjugate elements are exactly the embedded ground-ring scalars `ocR r` (every
  imaginary layer zero). So the general Hermitian 3×3 has REAL (central) diagonal and
  conjugate-transpose octonion off-diagonals — exactly the shape `Hm` below. (The
  workbench confirms the Jordan identity NEEDS this: it FAILS for a non-self-conjugate
  octonion diagonal, and — the moat — it FAILS one rung up on the sedenions where
  alternativity is lost; see workbench/N5-jordan-cap/decide_hermitian.py.)

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). No physics words: `Hm` is the pure
  self-adjoint 3×3 matrix over the Cayley–Dickson double of a double, and `ocR` is the
  ground-ring scalar embedding. Nothing to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The embedding of a ground-ring scalar `r : ℚ` as a REAL (self-conjugate, central)
    element of the octonion shape `O ℚ`: every imaginary layer is zero. These are
    exactly the self-adjoint elements, hence the only legal diagonal entries of a
    Hermitian matrix over `O ℚ`. -/
noncomputable def ocR (r : ℚ) : O ℚ := ⟨⟨⟨r, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩

/-- THE GENERAL HERMITIAN 3×3 MATRIX over the terminal algebra `O ℚ`: real (central)
    diagonal entries `ocR d₀, ocR d₁, ocR d₂` and arbitrary octonion off-diagonals
    `a, b, c` with their conjugates below the diagonal (so `A i j = star (A j i)`). This
    is the most general self-adjoint matrix over `O ℚ` up to the choice of the three
    independent off-diagonal octonions and three real diagonal scalars. -/
noncomputable def Hm (d0 d1 d2 : ℚ) (a b c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  !![ ocR d0,   a,       b;
      star a,   ocR d1,  c;
      star b,   star c,  ocR d2]

end Phys.Algebra.HJ
