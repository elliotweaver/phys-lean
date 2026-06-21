/-
  Phys.Cascade.Double — the CASCADE's doubling operation (Cayley–Dickson).
  ===========================================================================
  THE OPERATION THAT BUILDS THE CASCADE. N2 rung 1 (Phys/Cascade/ComplexUnit.lean)
  derived the first rung by DOUBLING the base line 1 → 2 (the algebra `Dbl R`).
  The cascade advances by applying the SAME doubling again and again. This module
  isolates that one operation — the Cayley–Dickson double `CD A` of a `*`-ring `A`
  — so every higher rung (ℍ at N2b, 𝕆 and the stop at N2c) is literally the same
  construction iterated, never a fresh ad-hoc algebra (drift trap, docs/RUNBOOK.md
  W1/W5). Nothing here is imported from Mathlib's `Quaternion`/`Octonion`: a
  physicist READS those names out of `CD (CD …)`, never INTO it.

  THE CONSTRUCTION. Over a base `A` carrying an involutive anti-automorphism
  `star` (a `StarRing`), the double `CD A = A × A` has
    conjugation   `(a,b)* = (a*, −b)`            (negate the new dimension)
    product       `(a,b)(c,d) = (ac − d* b , d a + b c*)`.
  This is exactly the operation that produced rung 1: when `star = id` on the base
  (the ordered line, where every element is its own conjugate) the product
  collapses to `(ac − bd, ad + bc)` — the `Dbl` product. So `CD` GENERALIZES the
  rung-1 doubling to a base whose conjugation may be nontrivial; iterating it is
  the cascade.

  WHAT IS PROVED HERE (each a theorem, foundations-only):
    instance Ring (CD A)        — ★ if the base `A` is a COMMUTATIVE, ASSOCIATIVE
                                  `*`-ring, the double is an ASSOCIATIVE ring (the
                                  structure does not collapse). Associativity of
                                  the double is the nontrivial content; it survives
                                  exactly while the base stays commutative.
    instance StarRing (CD A)    — the conjugation propagates: `CD A` is itself a
                                  `*`-ring, so the doubling can be applied AGAIN
                                  (the operation feeds its own input — this is how
                                  the cascade iterates).
    iota_e2_comm_iff            — ★ THE ONE CAUSE. In `CD A` the embedded base
                                  element `ι a` and the new generator `e₂` commute
                                  IFF `a = a*`. So the double is non-commutative
                                  EXACTLY WHEN the base has an element ≠ its
                                  conjugate. (At N2b the base is rung 1's complex
                                  algebra, whose unit `J` satisfies `J* = −J ≠ J`:
                                  the rung-1 unit is the cause of the rung-2 loss.)

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). There are NO physics words to
  delete — this module is the pure Cayley–Dickson doubling of a `*`-ring and the
  algebraic fact that it commutes iff the base conjugation fixes the relevant
  element. Every theorem STATEMENT is pure algebra.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Mathlib.Algebra.Star.Basic
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic

namespace Phys.Cascade

/-- THE DOUBLE. One Cayley–Dickson doubling of a base carrier `A`: an element is a
    pair `(re, im)`, the `re` component on the base, the `im` component in the new
    dimension the doubling adds. -/
structure CD (A : Type*) where
  re : A
  im : A

namespace CD

@[ext] theorem ext {A : Type*} : ∀ {z w : CD A}, z.re = w.re → z.im = w.im → z = w
  | ⟨_, _⟩, ⟨_, _⟩, rfl, rfl => rfl

variable {A : Type*}

instance [Zero A] : Zero (CD A) := ⟨⟨0, 0⟩⟩
instance [Zero A] [One A] : One (CD A) := ⟨⟨1, 0⟩⟩
instance [Add A] : Add (CD A) := ⟨fun z w => ⟨z.re + w.re, z.im + w.im⟩⟩
instance [Neg A] : Neg (CD A) := ⟨fun z => ⟨-z.re, -z.im⟩⟩
/-- THE CONJUGATION the doubling carries: negate the new dimension, conjugate the
    base. This is what lets the double be doubled again (it propagates `star`). -/
instance [Star A] [Neg A] : Star (CD A) := ⟨fun z => ⟨star z.re, -z.im⟩⟩
/-- THE FORCED PRODUCT — the Cayley–Dickson double: `(a,b)(c,d) = (ac − d* b, d a + b c*)`.
    Specializes to rung 1's `Dbl` product when the base conjugation is trivial. -/
instance [Mul A] [Add A] [Neg A] [Star A] : Mul (CD A) :=
  ⟨fun z w => ⟨z.re * w.re + -(star w.im * z.im), w.im * z.re + z.im * star w.re⟩⟩

@[simp] theorem zero_re [Zero A] : (0 : CD A).re = 0 := rfl
@[simp] theorem zero_im [Zero A] : (0 : CD A).im = 0 := rfl
@[simp] theorem one_re [Zero A] [One A] : (1 : CD A).re = 1 := rfl
@[simp] theorem one_im [Zero A] [One A] : (1 : CD A).im = 0 := rfl
@[simp] theorem add_re [Add A] (z w : CD A) : (z + w).re = z.re + w.re := rfl
@[simp] theorem add_im [Add A] (z w : CD A) : (z + w).im = z.im + w.im := rfl
@[simp] theorem neg_re [Neg A] (z : CD A) : (-z).re = -z.re := rfl
@[simp] theorem neg_im [Neg A] (z : CD A) : (-z).im = -z.im := rfl
@[simp] theorem star_re [Star A] [Neg A] (z : CD A) : (star z).re = star z.re := rfl
@[simp] theorem star_im [Star A] [Neg A] (z : CD A) : (star z).im = -z.im := rfl
@[simp] theorem mul_re [Mul A] [Add A] [Neg A] [Star A] (z w : CD A) :
    (z * w).re = z.re * w.re + -(star w.im * z.im) := rfl
@[simp] theorem mul_im [Mul A] [Add A] [Neg A] [Star A] (z w : CD A) :
    (z * w).im = w.im * z.re + z.im * star w.re := rfl

/-- ★ THE DOUBLE OF A COMMUTATIVE ASSOCIATIVE `*`-RING IS AN ASSOCIATIVE RING.
    Associativity of the doubled product is the nontrivial content: it holds
    because the base is commutative and associative. (When the base loses
    commutativity — at the next rung — this proof breaks and associativity is
    lost; that is N2c's content.) -/
instance [CommRing A] [StarRing A] : Ring (CD A) where
  add_assoc a b c := by ext <;> simp <;> ring
  zero_add a := by ext <;> simp
  add_zero a := by ext <;> simp
  add_comm a b := by ext <;> simp <;> ring
  left_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> ring
  right_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> ring
  zero_mul a := by ext <;> simp
  mul_zero a := by ext <;> simp
  mul_assoc a b c := by
    ext <;> simp [star_mul', star_add, star_star, mul_add, add_mul] <;> ring
  one_mul a := by ext <;> simp
  mul_one a := by ext <;> simp
  neg_add_cancel a := by ext <;> simp
  nsmul := nsmulRec
  zsmul := zsmulRec

/-- THE CONJUGATION PROPAGATES: the double is itself a `*`-ring (involutive,
    additive, anti-multiplicative `star`). This is what lets the cascade iterate —
    `CD A` is a valid base for the NEXT `CD`. -/
instance [CommRing A] [StarRing A] : StarRing (CD A) where
  star_involutive z := by ext <;> simp
  star_mul z w := by ext <;> simp [star_mul', star_add, star_star] <;> ring
  star_add z w := by ext <;> simp [add_comm]

/-- The embedding of the base into the double as the `im = 0` slice. -/
def iota [Zero A] (a : A) : CD A := ⟨a, 0⟩

/-- The new generator the doubling adds: `e₂ = (0, 1)`. -/
def e2 [Zero A] [One A] : CD A := ⟨0, 1⟩

@[simp] theorem iota_re [Zero A] (a : A) : (iota a : CD A).re = a := rfl
@[simp] theorem iota_im [Zero A] (a : A) : (iota a : CD A).im = 0 := rfl
@[simp] theorem e2_re [Zero A] [One A] : (e2 : CD A).re = 0 := rfl
@[simp] theorem e2_im [Zero A] [One A] : (e2 : CD A).im = 1 := rfl

/-- The base embedding is injective: the double genuinely contains its base. -/
theorem iota_injective [Zero A] : Function.Injective (iota : A → CD A) := by
  intro a b h; have := congrArg CD.re h; simpa using this

/-- ★ THE ONE CAUSE OF NON-COMMUTATIVITY. In the double, the embedded base element
    `ι a` commutes with the new generator `e₂` IF AND ONLY IF `a` is self-conjugate
    (`a = a*`). Hence the double is non-commutative EXACTLY WHEN the base carries an
    element distinct from its conjugate. The single algebraic fact behind the loss
    of commutativity one rung up. -/
theorem iota_e2_comm_iff [CommRing A] [StarRing A] (a : A) :
    iota a * (e2 : CD A) = e2 * iota a ↔ a = star a := by
  constructor
  · intro h
    have hi := congrArg CD.im h
    simp only [iota, e2, mul_im, mul_zero, add_zero, zero_add,
      star_zero, one_mul] at hi
    exact hi
  · intro h
    ext
    · simp only [iota, e2, mul_re, mul_zero, zero_mul, add_zero, neg_zero,
        star_zero, mul_one]
    · simp only [iota, e2, mul_im, mul_zero, add_zero, zero_add,
        star_zero, one_mul]
      exact h

end CD

end Phys.Cascade
