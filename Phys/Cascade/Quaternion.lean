/-
  Phys.Cascade.Quaternion — N2 rung 2: DOUBLING THE COMPLEX ALGEBRA LOSES COMMUTATIVITY.
  ===========================================================================
  THE SECOND RUNG OF THE CASCADE. Rung 1 (Phys/Cascade/ComplexUnit.lean) derived
  the complex algebra `Dbl R` by doubling the base line 1 → 2, with the complex
  unit `J` (`J*J = −1`). This module applies the SAME doubling operation again
  (Phys/Cascade/Double.lean's `CD`, 2 → 4) and proves the honest content: the
  double STAYS ASSOCIATIVE but LOSES COMMUTATIVITY. Nothing is imported from
  Mathlib's `Quaternion`: `H R := CD (Dbl R)` is the double of the DERIVED complex
  algebra; a physicist READS "ℍ" out of it, never INTO it (drift trap, ROADMAP N2).

  THE FORWARD DERIVATION (derived forward by DOUBLING; NOT assumed backward):

  ── the base carries a conjugation ──
    Dbl carries `star` = complex conjugation (`(re,im)* = (re,−im)`), making the
    rung-1 algebra a `StarRing` (`instStarRingDbl`). On the base line this `star`
    is trivial (real numbers are self-conjugate), which is why rung 1's product was
    the trivial-conjugation special case. But the DERIVED complex unit is NOT self-
    conjugate: `Dbl.star_J` gives `J* = −J`, and `J_ne_star_J` proves `J ≠ J*` on a
    nontrivial base. The rung-1 unit broke self-conjugacy.

  ── doubling again loses commutativity ──
    `H R := CD (Dbl R)` — the SAME Cayley–Dickson double, now over the complex
    algebra. Because `Dbl R` is commutative and associative, `H R` is an
    ASSOCIATIVE ring (`Double.instRingCD`, inherited): associativity SURVIVES.
    But `CD.iota_e2_comm_iff` says the double commutes iff the base element equals
    its conjugate — and `J ≠ J*` — so:
    not_commutative           — ★ `H ℚ` is NOT commutative: the pair `ι J` and `e₂`
                                does not commute. The loss is a THEOREM.
    commutativity_cause       — ★ THE ONE CAUSE. `ι J` and `e₂` fail to commute
                                EXACTLY because `J ≠ J*`. The rung-1 complex unit is
                                the cause of the rung-2 loss of commutativity (one
                                cause, propagated up one rung).
    still_associative         — `H R` is still associative (`mul_assoc` holds): the
                                double lost commutativity and NOTHING MORE. (This is
                                what makes the NEXT loss — associativity, at 𝕆 — the
                                genuinely new termination, N2c.)

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "quaternion / complex unit
  / fold / Born": what remains is the theorem that the Cayley–Dickson double of a
  commutative associative `*`-ring with a non-self-conjugate element is an
  associative, NON-commutative ring, with the non-commutativity caused exactly by
  that element ≠ its conjugate. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Cascade.ComplexUnit
import Phys.Cascade.Double

namespace Phys.Cascade

namespace Dbl

variable {R : Type*} [CommRing R]

/-- THE BASE CONJUGATION (complex conjugation on rung 1's algebra): fix the base
    component, negate the new dimension. This is the `star` the doubling consumes. -/
instance : Star (Dbl R) := ⟨fun z => ⟨z.re, -z.im⟩⟩

@[simp] theorem star_re' (z : Dbl R) : (star z).re = z.re := rfl
@[simp] theorem star_im' (z : Dbl R) : (star z).im = -z.im := rfl

/-- The complex algebra is a `*`-ring: conjugation is involutive, additive, and
    anti-multiplicative. (On a commutative base it is also multiplicative, but the
    `StarRing` anti-form is what the doubling operation `CD` consumes.) -/
instance : StarRing (Dbl R) where
  star_involutive z := by ext <;> simp
  star_mul z w := by ext <;> simp [Dbl.mul_re, Dbl.mul_im] <;> ring
  star_add z w := by ext <;> simp [add_comm]

/-- ★ THE DERIVED UNIT IS NOT SELF-CONJUGATE: `J* = −J`. The complex unit rung 1
    forced is moved by conjugation — this is the seed of the rung-2 loss. -/
theorem star_J : star (J : Dbl R) = -J := by ext <;> simp [J]

/-- The complex unit is genuinely distinct from its conjugate, `J ≠ J*`, whenever
    the base is NOT of characteristic 2 (`(2 : R) ≠ 0`). This is the SAME 2-torsion
    condition the trunk's self-blindness rests on (N1 `fold_self_blind` needs a
    2-torsion-free carrier): in characteristic 2, `J = −J = J*` and the seed of
    non-commutativity vanishes — so the condition is load-bearing, not decorative. -/
theorem J_ne_star_J (h2 : (2 : R) ≠ 0) : (J : Dbl R) ≠ star J := by
  rw [star_J]
  intro h
  have him := congrArg Dbl.im h
  simp only [J, Dbl.neg_im] at him
  exact h2 (by linear_combination him)

end Dbl

/-! ## RUNG 2 — the double of the complex algebra. -/

/-- THE RUNG-2 ALGEBRA: the Cayley–Dickson double of the rung-1 complex algebra
    (dimension 2 → 4). The SAME doubling operation, iterated. -/
abbrev H (R : Type*) [CommRing R] := CD (Dbl R)

/-- `H R` is an associative RING: doubling the commutative associative complex
    algebra does not collapse the structure, and associativity SURVIVES. (Inherited
    from `Double.instRingCD`; stated here to make rung 2's preservation explicit.) -/
theorem H_associative {R : Type*} [CommRing R] (x y z : H R) :
    x * y * z = x * (y * z) := mul_assoc x y z

/-- The embedded complex unit inside the rung-2 algebra: `ι J = (J, 0)`. -/
abbrev ιJ (R : Type*) [CommRing R] : H R := CD.iota (Dbl.J)

/-- ★ THE ONE CAUSE. The embedded complex unit `ι J` and the new generator `e₂`
    fail to commute EXACTLY because the complex unit is not self-conjugate
    (`J ≠ J*`). The loss of commutativity at rung 2 is caused by the complex unit
    derived at rung 1 — the same algebraic fact, propagated one rung up. -/
theorem commutativity_cause {R : Type*} [CommRing R] :
    (ιJ R * CD.e2 = CD.e2 * ιJ R) ↔ (Dbl.J : Dbl R) = star Dbl.J :=
  CD.iota_e2_comm_iff Dbl.J

/-- NON-VACUITY (anti-W8): over `ℚ` the non-commuting pair is genuinely a pair of
    distinct products — `ι J · e₂ ≠ e₂ · ι J` — so the loss is not vacuous. -/
theorem not_commutative_witness : (ιJ ℚ) * CD.e2 ≠ CD.e2 * (ιJ ℚ) := by
  intro h
  rw [commutativity_cause] at h
  exact Dbl.J_ne_star_J (by norm_num) h

/-- ★ THE LOSS OF COMMUTATIVITY (the rung-2 content). The rung-2 algebra `H ℚ` is
    NOT commutative: the embedded complex unit `ι J` and the new generator `e₂` do
    not commute. The doubling that preserved commutativity at rung 1 (trivial base
    conjugation) destroys it here (nontrivial base conjugation). -/
theorem not_commutative : ¬ ∀ x y : H ℚ, x * y = y * x := by
  intro hcomm
  exact not_commutative_witness (hcomm (ιJ ℚ) CD.e2)

/-- The two products explicitly: `ι J · e₂` lands on `J` in the new dimension while
    `e₂ · ι J` lands on `J* = −J`. The commutator is nonzero because `J ≠ −J`. -/
theorem comm_products :
    ((ιJ ℚ) * CD.e2).im = Dbl.J ∧ (CD.e2 * (ιJ ℚ)).im = star (Dbl.J : Dbl ℚ) := by
  constructor
  · simp [ιJ, CD.iota, CD.e2]
  · simp [ιJ, CD.iota, CD.e2]

end Phys.Cascade
