/-
  Phys.Algebra.HermitianJordan.Core — N5f: the ZERO-DIAGONAL CORE of the order-3 Jordan
  identity assembled from the three multi-generator building blocks.
  ===========================================================================
  `Building.lean`/`Building2.lean`/`Building3.lean` closed the three single-second-generator
  building blocks of the order-3 Jordan defect on the zero-diagonal Hermitian core
  `Xz a b c` over `O ℚ = CD (CD B)`:
      bb1 : jdef (Xz a b c) (Xz p 0 0) = 0
      bb2 : jdef (Xz a b c) (Xz 0 q 0) = 0
      bb3 : jdef (Xz a b c) (Xz 0 0 r) = 0
  The banked `jdef_add_right` (`Linear.lean`) makes the defect ADDITIVE in its second
  argument, and the general off-part `Xz p q r` splits entrywise as
      Xz p q r = Xz p 0 0 + Xz 0 q 0 + Xz 0 0 r
  (each off-diagonal generator carried by exactly one summand; `star` is additive and
  `star 0 = 0`). Combining the split with `jdef_add_right` and the three building blocks
  closes the FULL zero-diagonal core:
      ★ jdef_Xz_core : jdef (Xz a b c) (Xz p q r) = 0    for ALL six off-diagonal generators.

  This is the cap's positive edge for the zero-diagonal Hermitian core, with NO restriction
  on the generators — the heavy multi-generator cross-terms (the alternating-form associator
  algebra) are discharged inside the three building blocks; this module only performs the
  structural additive reassembly (matrix distributivity + `abel`), no octonion-coordinate
  `ring`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Jordan / Albert / exceptional /
  generation": what remains is the theorem that, over the Cayley–Dickson double of a double,
  the order-3 symmetrized-product defect of two self-adjoint matrices with zero diagonal
  vanishes. No theorem STATEMENT carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.Building
import Phys.Algebra.HermitianJordan.Building2
import Phys.Algebra.HermitianJordan.Building3
import Phys.Algebra.HermitianJordan.Linear
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]

attribute [local instance] CD.narCD CD.srCD

/-- The zero-diagonal Hermitian core splits, entry by entry, into its three single-generator
    summands: `Xz p q r = Xz p 0 0 + Xz 0 q 0 + Xz 0 0 r`. Each off-diagonal generator (and its
    conjugate) is carried by exactly one summand; the proof is pure matrix arithmetic
    (`star` additive, `star 0 = 0`, `add_zero`/`zero_add`). -/
theorem Xz_split (p q r : CD (CD B)) :
    Xz p q r = Xz p 0 0 + Xz 0 q 0 + Xz 0 0 r := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.add_apply, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

/-- ★ THE ZERO-DIAGONAL CORE OF THE CAP'S POSITIVE EDGE: the order-3 Jordan identity holds
    for ALL Hermitian pairs with zero diagonal over `O ℚ = CD (CD B)`:
        `jdef (Xz a b c) (Xz p q r) = 0`.
    Assembled from the three banked building blocks `bb1`/`bb2`/`bb3` by the additive split
    of the defect in its second argument (`jdef_add_right`) along the entrywise decomposition
    `Xz_split`. No octonion-coordinate `ring`: the multi-generator cross-terms are discharged
    inside the building blocks; this is the structural reassembly. -/
theorem jdef_Xz_core (a b c p q r : CD (CD B)) :
    jdef (Xz a b c) (Xz p q r) = 0 := by
  rw [Xz_split p q r, jdef_add_right, jdef_add_right,
      bb1 a b c p, bb2 a b c q, bb3 a b c r]
  abel

end Phys.Algebra.HJ
