/-
  Phys.Algebra.HermitianJordan.PieceB — N5h: the FIRST-slot central-diagonal drop and the
  degree-1 polarization kernel of the order-3 Jordan identity.
  ===========================================================================
  The cap's positive edge `jdef (Hm …) (Hm …) = 0` splits (by `jdef_add_right` along
  `Hm₂ = Dg + Xz`) into pieceA `jdef (Hm) (Dg) = 0` (BANKED, `PieceA.lean`) and pieceB
  `jdef (Hm) (Xz) = 0` (THIS module). pieceA dropped the central diagonal from the SECOND
  slot via the master identity (a nuclear second argument). pieceB must drop it from the
  FIRST slot, where `jdef` is CUBIC — so the master identity does not apply directly.

  THE ABSTRACT NUCLEAR-FIRST-ARG SPINE (`jdef_nuc_first`). Over ANY `NonAssocRing`, if the
  FIRST argument `E` is nuclear (associates in all three matrix positions), then the entire
  order-3 defect vanishes: `jdef E B = 0`. This is the degree-3 (pure-diagonal) killer of the
  first-slot drop — `jdef (Dg) (Xz) = 0` — and a reusable structural lever. The proof keeps
  the square `E·E` opaque (`generalize`, the `jdef_master` confluence key) so the nuclearity
  rewrites cannot loop on `E·E·E`; the residual closes by the flexibility `E·(E·E)=(E·E)·E`
  (itself a nuclearity instance) and `abel`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Jordan / Albert / exceptional /
  generation": what remains is the theorem that, over a non-associative coordinate ring, the
  order-3 symmetrised-product defect of a NUCLEAR matrix against any matrix vanishes. No
  theorem STATEMENT carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.PieceA
import Phys.Algebra.HermitianJordan.Core
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ### THE ABSTRACT NUCLEAR-FIRST-ARG SPINE — abstract over any `NonAssocRing`. -/

section Master
variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 800000 in
/-- ★★ THE NUCLEAR FIRST ARGUMENT KILLS THE DEFECT. Over any non-associative coordinate
    ring, if the FIRST argument `E` associates in all three positions (is nuclear), the
    order-3 Jordan-identity defect `jdef E B` vanishes for EVERY `B`:

        `jdef E B = 0`.

    Where the master identity (`Reduction.jdef_master`) collapsed a nuclear SECOND argument to
    a commutator, a nuclear FIRST argument collapses the whole cubic defect to zero — a single
    associative element cannot witness the order-3 obstruction. Proof: unfold, keep the square
    `E·E` opaque (`generalize`, so the nuclearity rewrites cannot loop on `E·E·E`), distribute,
    push the three nuclearity rewrites, close the residual with flexibility (`E·(E·E)=(E·E)·E`,
    a nuclearity instance) and additive cancellation (`abel`). No alternativity, no coordinate
    expansion. -/
theorem jdef_nuc_first (E B : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    jdef E B = 0 := by
  unfold jdef jb
  have hflex : E * (E * E) = (E * E) * E := LA E E
  generalize hP : E * E = P at hflex ⊢
  simp only [mul_add, add_mul, LA, MA, RA]
  rw [hflex, MA]
  abel

end Master

/-! ### The degree-3 (pure-diagonal) part of the first-slot drop, over `O ℚ`. -/

/-- `jdef (Dg e) (Xz p q r) = 0`: the real central diagonal, as a FIRST argument, contributes
    nothing to the order-3 defect — it is nuclear (`Dg_assocL/M/R`), so `jdef_nuc_first`
    applies. This is the degree-3 (pure-`Dg`) summand of the first-slot central-diagonal drop;
    `ocR` is kept OPAQUE throughout. -/
theorem jdef_Dg_Xz (e0 e1 e2 : ℚ) (p q r : O ℚ) :
    jdef (Dg e0 e1 e2) (Xz p q r) = 0 :=
  jdef_nuc_first (Dg e0 e1 e2) (Xz p q r)
    (Dg_assocL e0 e1 e2) (Dg_assocM e0 e1 e2) (Dg_assocR e0 e1 e2)

end Phys.Algebra.HJ
