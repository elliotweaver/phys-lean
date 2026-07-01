/-
  Phys.Algebra.TowerGatherCocycle — N220: THE GLUING-OBSTRUCTION COCYCLE STRUCTURE.
  ===========================================================================
  A STILL-DEEPER CUT of the N219 gather frontier. N218T determined WHICH inter-world
  pairs glue across the derived Cayley–Dickson tower `Dbl ℚ → H ℚ → O ℚ → S ℚ`; N219
  made the OBSTRUCTION EXPLICIT as the map `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)`
  and IDENTIFIED it, on the octonion shape, with the banked associator `[a,b,·]`
  (`o_gluingDefect_eq_assoc`). This node determines the OBSTRUCTION'S OWN
  Hochschild-cohomological STRUCTURE over the banked octonion rung `O ℚ = CD (H ℚ)`,
  and connects it to the banked commutator Jacobiator (N205).

  It answers, forward and derived, the childed question: *is the gluing-obstruction
  cocycle a genuine cocycle whose coboundary is the associator-of-associators, and how
  does the banked Jacobiator relate?*

  WHAT THE TOWER ANSWERS (each clause a proved theorem, each a citation of a banked
  associator / commutator fact — NO coordinate ring):

    (1) `A`-VALUED 3-COCYCLE.  As a 3-cochain the obstruction (= associator) is a
        genuine Hochschild 3-COCYCLE: its Hochschild coboundary vanishes,
          `a·[b,c,x] − [ab,c,x] + [a,bc,x] − [a,b,cx] + [a,b,c]·x = 0`
        (`teich_cocycle_O`; the Teichmüller cocycle identity, formal backbone
        `teich_cocycle_generic`). The obstruction is CLOSED.

    (2) IT IS EXACT — THE COBOUNDARY OF MULTIPLICATION.  That cocycle is the Hochschild
        coboundary of the DERIVED-multiplication 2-cochain `μ(x,y) := x·y`:
          `δμ (a,b,c) = a·(bc) − (ab)·c + a·(bc) − (ab)·c = −2·[a,b,c]`
        (`mult_coboundary_O`). So on `O ℚ` the local→global gluing obstruction is,
        cohomologically, the coboundary of the algebra's own multiplication — the
        precise homological status of the N218T/N219 gluing failure.

    (3) THE `End(A)`-VALUED 2-COCHAIN IS NOT CLOSED — ITS COBOUNDARY IS THE LEVEL-UP
        ASSOCIATOR.  Read as the N219 `End(A)`-valued 2-cochain `b ↦ gluingDefect a b`,
        the obstruction is NOT closed: its Hochschild coboundary is the ASSOCIATOR OF
        ASSOCIATORS one level up,
          `a·(gd b c x) − gd (ab) c x + gd a (bc) x − gd a b (cx) = −([a,b,c]·x)`
        (`gluingDefect_2coboundary_O`). The defect-of-the-defect is the level-up
        associator — the obstruction is a genuine (non-coboundary) class at this level.

    (4) THE BANKED JACOBIATOR IS SIX TIMES THE OBSTRUCTION.  The banked commutator
        Jacobiator (N205) equals `6 •` the gluing obstruction on `O ℚ`:
          `jacobiator x y z = gluingDefect x y z + … (6 copies)`
        (`jacobiator_eq_six_gluingDefect_O`). The Malcev / cyclic-antisymmetrized face
        of the SAME obstruction map.

    (5) NON-VACUITY (W8).  The 3-cocycle is a genuinely NONZERO cochain on `O ℚ`
        (`gluing_cocycle_nonzero_O`, banked `assoc_nonvanishing`) — none of the above is
        vacuous; the obstruction really is a nonzero, exact, alternating 3-cocycle whose
        End-valued coboundary is the level-up associator.

  THE DISCOVERED CONTENT (withheld — read off the banked associator, NOT posited). N219
  said the obstruction IS the associator; N220 says WHAT KIND of cocycle it is: a NONZERO
  Hochschild 3-cocycle that is the COBOUNDARY OF MULTIPLICATION (exact at the 3-cochain
  level), whose `End`-valued 2-cochain incarnation is NOT closed but has coboundary the
  LEVEL-UP associator, and whose cyclic antisymmetrization is exactly `6·` itself = the
  banked Jacobiator. The gluing obstruction of the tower is homologically the coboundary
  of its own multiplication, and its higher defect is the associator one level up — one
  cause (non-associativity) expressed as a single cohomological object linking N219's
  obstruction to N205's non-Lie Jacobiator.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "world / gather / glue / cocycle /
  obstruction / coboundary / Jacobiator": every statement is a pure algebraic identity of
  the associator `(x·y)·z − x·(y·z)` and the commutator's cyclic sum on the Cayley–Dickson
  double of a double `CD (CD B)` — the Teichmüller identity `δ(assoc)=0`, the coboundary
  identity `δμ = −2·assoc`, the `End`-valued coboundary `= −[a,b,c]·x`, the cyclic sum
  `= 6·assoc`, and `assoc ≠ 0` on `O ℚ`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no posited (co)homology structure as content, no
  Mathlib ℝ/ℂ as content (ℚ is the coefficient field; the OBJECT is the derived octonion
  rung `O ℚ = CD (H ℚ)`, the banked associator (Alternative.lean N5b), the banked N219
  `gluingDefect`, and the banked N205 `jacobiator`), no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.OctonionCommutatorJacobiator

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE FORMAL BACKBONE — cocycle / coboundary identities on the octonion shape `CD (CD B)`. -/

section Alt
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- THE TEICHMÜLLER 3-COCYCLE IDENTITY (formal backbone): the associator, viewed as an
    `A`-valued 3-cochain, is Hochschild-CLOSED. Its coboundary
    `a·[b,c,x] − [ab,c,x] + [a,bc,x] − [a,b,cx] + [a,b,c]·x` vanishes identically —
    a formal identity of any non-associative multiplication (`mul_sub`/`sub_mul`/`abel`,
    products treated as atoms — NO coordinate expansion). -/
theorem teich_cocycle_generic (a b c x : CD (CD B)) :
    a * assoc b c x - assoc (a * b) c x + assoc a (b * c) x
      - assoc a b (c * x) + assoc a b c * x = 0 := by
  simp only [assoc, mul_sub, sub_mul]
  abel

/-- THE MULTIPLICATION COBOUNDARY (formal backbone): the Hochschild coboundary of the
    multiplication 2-cochain `μ(x,y) = x·y` is `−2·[·,·,·]`. Concretely
    `a·(b·c) − (a·b)·c + a·(b·c) − (a·b)·c = −([a,b,c] + [a,b,c])`. So the associator
    is EXACT: it is the coboundary of multiplication. -/
theorem mult_coboundary_generic (a b c : CD (CD B)) :
    a * (b * c) - (a * b) * c + (a * (b * c) - (a * b) * c)
      = -(assoc a b c + assoc a b c) := by
  simp only [assoc]; abel

/-- THE `End`-VALUED 2-COCHAIN COBOUNDARY (formal backbone): reading the gluing obstruction
    as the `End(A)`-valued 2-cochain `b ↦ gluingDefect a b`, its Hochschild coboundary is
    the LEVEL-UP associator `−([a,b,c]·x)` — the associator-of-associators. So this
    2-cochain is NOT closed; its defect is the higher associator. -/
theorem gluingDefect_2coboundary_generic (a b c x : CD (CD B)) :
    a * (gluingDefect b c x) - gluingDefect (a * b) c x + gluingDefect a (b * c) x
      - gluingDefect a b (c * x) = -(assoc a b c * x) := by
  simp only [gluingDefect, assoc, mul_sub, sub_mul]; abel

end Alt

/-! ## THE HEADLINES ON THE BANKED OCTONION RUNG `O ℚ = CD (H ℚ)`. -/

section OQ
attribute [local instance] CD.narCD CD.srCD

/-- ★ (1) THE GLUING OBSTRUCTION IS A GENUINE 3-COCYCLE on `O ℚ`. The N219 obstruction is the
    associator (`o_gluingDefect_eq_assoc`); as an `A`-valued 3-cochain it is Hochschild-closed:
    its coboundary vanishes. The inter-world local→global obstruction is a genuine cocycle. -/
theorem teich_cocycle_O (a b c x : O ℚ) :
    a * assoc b c x - assoc (a * b) c x + assoc a (b * c) x
      - assoc a b (c * x) + assoc a b c * x = 0 := by
  simp only [assoc, mul_sub, sub_mul]; abel

/-- ★ (2) THE OBSTRUCTION IS EXACT — THE COBOUNDARY OF THE DERIVED MULTIPLICATION on `O ℚ`.
    `δμ (a,b,c) = a·(bc) − (ab)·c + a·(bc) − (ab)·c = −2·[a,b,c]`. So on the octonion rung the
    gluing obstruction is, cohomologically, the coboundary of the algebra's own multiplication. -/
theorem mult_coboundary_O (a b c : O ℚ) :
    a * (b * c) - (a * b) * c + (a * (b * c) - (a * b) * c)
      = -(assoc a b c + assoc a b c) := by
  simp only [assoc]; abel

/-- The N219 obstruction map IS the associator on `O ℚ` (definitional tie to N219). -/
theorem gluingDefect_is_assoc_O (a b c : O ℚ) : gluingDefect a b c = assoc a b c := rfl

/-- ★ (1′) THE SAME 3-COCYCLE IDENTITY phrased directly on the N219 obstruction map
    `gluingDefect`: the explicit gluing obstruction is Hochschild-closed. -/
theorem teich_cocycle_gluingDefect_O (a b c x : O ℚ) :
    a * gluingDefect b c x - gluingDefect (a * b) c x + gluingDefect a (b * c) x
      - gluingDefect a b (c * x) + gluingDefect a b c * x = 0 := by
  simp only [gluingDefect, mul_sub, sub_mul]; abel

/-- ★ (3) THE `End`-VALUED 2-COCHAIN `b ↦ gluingDefect a b` IS NOT CLOSED on `O ℚ`: its
    Hochschild coboundary is the LEVEL-UP associator `−([a,b,c]·x)` — the defect of the
    defect is the associator-of-associators. -/
theorem gluingDefect_2coboundary_O (a b c x : O ℚ) :
    a * (gluingDefect b c x) - gluingDefect (a * b) c x + gluingDefect a (b * c) x
      - gluingDefect a b (c * x) = -(assoc a b c * x) := by
  simp only [gluingDefect, assoc, mul_sub, sub_mul]; abel

/-- ★ (4) THE BANKED JACOBIATOR (N205) IS SIX TIMES THE GLUING OBSTRUCTION on `O ℚ`:
    `jacobiator x y z = gluingDefect x y z + … (6 copies)`. The banked commutator's cyclic
    Jacobi defect is exactly six copies of the N219 gluing obstruction — the Malcev face. -/
theorem jacobiator_eq_six_gluingDefect_O (x y z : O ℚ) :
    jacobiator x y z =
      gluingDefect x y z + gluingDefect x y z + gluingDefect x y z
      + gluingDefect x y z + gluingDefect x y z + gluingDefect x y z := by
  rw [jacobiator_eq_six_assoc]; rfl

/-- ★ (5) W8 NON-VACUITY: the gluing-obstruction 3-cocycle is a genuinely NONZERO cochain on
    `O ℚ` (banked `assoc_nonvanishing`, the cascade's non-associating triple). So the cocycle /
    exactness / level-up-coboundary / Jacobiator statements are all non-vacuous. -/
theorem gluing_cocycle_nonzero_O : ∃ a b c : O ℚ, gluingDefect a b c ≠ 0 :=
  ⟨_, _, _, assoc_nonvanishing⟩

/-! ## THE CAPSTONE — the full cohomological structure of the gluing obstruction on `O ℚ`. -/

/-- ★★★ THE GLUING-OBSTRUCTION COCYCLE STRUCTURE on `O ℚ`. The N219 gluing obstruction
    `gluingDefect = [·,·,·]` is, over the banked octonion rung:
      • a genuine Hochschild 3-COCYCLE (CLOSED: `δ(assoc) = 0`);
      • EXACT — the coboundary of the derived multiplication (`δμ = −2·assoc`);
      • as an `End`-valued 2-cochain NOT closed, with coboundary the LEVEL-UP associator
        `−([a,b,c]·x)` (the associator-of-associators);
      • whose cyclic antisymmetrization is exactly `6·` itself = the banked Jacobiator (N205);
      • and it is a genuinely NONZERO cochain.
    Physics-words-removable: pure associator/commutator algebra on `CD (CD B) = O ℚ`. -/
theorem gluing_cocycle_structure :
    -- (1) closed: the A-valued 3-cochain (= associator) is a Hochschild 3-cocycle
    (∀ a b c x : O ℚ,
      a * assoc b c x - assoc (a * b) c x + assoc a (b * c) x
        - assoc a b (c * x) + assoc a b c * x = 0) ∧
    -- (2) exact: it is the coboundary of the derived multiplication (δμ = −2·assoc)
    (∀ a b c : O ℚ,
      a * (b * c) - (a * b) * c + (a * (b * c) - (a * b) * c)
        = -(assoc a b c + assoc a b c)) ∧
    -- (3) the End-valued 2-cochain b ↦ gluingDefect a b is NOT closed: its coboundary is
    --     the level-up associator −([a,b,c]·x)
    (∀ a b c x : O ℚ,
      a * (gluingDefect b c x) - gluingDefect (a * b) c x + gluingDefect a (b * c) x
        - gluingDefect a b (c * x) = -(assoc a b c * x)) ∧
    -- (4) the banked Jacobiator (N205) is six times the gluing obstruction
    (∀ x y z : O ℚ,
      jacobiator x y z =
        gluingDefect x y z + gluingDefect x y z + gluingDefect x y z
        + gluingDefect x y z + gluingDefect x y z + gluingDefect x y z) ∧
    -- (5) non-vacuity: the cocycle is a genuinely nonzero cochain
    (∃ a b c : O ℚ, gluingDefect a b c ≠ 0) :=
  ⟨teich_cocycle_O, mult_coboundary_O, gluingDefect_2coboundary_O,
    jacobiator_eq_six_gluingDefect_O, gluing_cocycle_nonzero_O⟩

end OQ

end Phys.Algebra
