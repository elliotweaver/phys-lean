/-
  Phys.Cascade.Octonion — N2 rung 3: DOUBLING THE NON-COMMUTATIVE ALGEBRA LOSES
  ASSOCIATIVITY.
  ===========================================================================
  THE THIRD RUNG OF THE CASCADE. Rung 2 (Phys/Cascade/Quaternion.lean) doubled the
  complex algebra to `H R := CD (Dbl R)` and proved the double STAYS ASSOCIATIVE
  but LOSES COMMUTATIVITY, caused EXACTLY by the rung-1 complex unit `J ≠ J*`. This
  module applies the SAME doubling operation again (Phys/Cascade/Double.lean's `CD`,
  4 → 8) and proves the next honest loss: the double LOSES ASSOCIATIVITY, caused
  EXACTLY by the rung-2 non-commutativity. One cause, propagated one more rung up.
  Nothing is imported from Mathlib's `Octonion`: `O R := CD (H R)` is the double of
  the DERIVED non-commutative algebra; a physicist READS "𝕆" out of it, never INTO
  it (drift trap, ROADMAP N2).

  THE FORWARD DERIVATION (derived forward by DOUBLING; NOT assumed backward):

  ── the base is non-commutative ──
    `H R` is an ASSOCIATIVE, NON-commutative ring (rung 2). The rung-2 witness pair
    `ι J , e₂` does not commute (`not_commutative_witness`). Crucially the banked
    `instance Ring (CD A)` REQUIRES `CommRing A`; `H R` is NOT commutative, so `O R`
    does NOT inherit a `Ring` instance — and indeed it is NOT a ring: it is a
    non-associative algebra. We do not force a `Ring` onto it (that would be FALSE).

  ── doubling again loses associativity ──
    `O R := CD (H R)` — the SAME Cayley–Dickson double, now over the non-commutative
    rung-2 algebra. `CD.iota_iota_e2_assoc_iff` says the triple `(ι a, ι b, e₂)`
    associates in the double IFF the base pair `a, b` commutes — and the rung-2 pair
    `ι J , e₂` does NOT commute, so:
    not_associative           — ★ `O ℚ` is NOT associative: the triple
                                `(ι(ι J), ι(e₂), e₂)` does not reassociate. A THEOREM.
    associativity_cause       — ★ THE ONE CAUSE. The triple fails to associate
                                EXACTLY because the rung-2 base pair does not commute,
                                which (`commutativity_cause`) is EXACTLY because the
                                rung-1 complex unit is not self-conjugate (`J ≠ J*`).
                                The single algebraic seed, propagated up two rungs.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "octonion / quaternion /
  complex unit / fold": what remains is the theorem that the Cayley–Dickson double
  of an associative NON-commutative `*`-ring is NON-associative, the non-
  associativity caused exactly by a non-commuting base pair. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Cascade.Quaternion

namespace Phys.Cascade

/-! ## RUNG 3 — the double of the non-commutative algebra. -/

/-- THE RUNG-3 ALGEBRA: the Cayley–Dickson double of the rung-2 algebra
    (dimension 4 → 8). The SAME doubling operation, iterated a third time. Because
    the base `H R` is NON-commutative, this double does NOT get a `Ring` instance
    (the banked `Ring (CD A)` needs `CommRing A`) — and rightly so: it is a
    non-associative algebra. -/
abbrev O (R : Type*) [CommRing R] := CD (H R)

/-- The non-associating triple, written through the embeddings: the base pair is
    the rung-2 non-commuting pair `(ι J, e₂)` embedded into `O`, with the rung-3
    new generator `e₂`. -/
theorem assoc_triple_iff {R : Type*} [CommRing R] :
    (CD.iota (ιJ R) * CD.iota (CD.e2 : H R)) * (CD.e2 : O R)
      = CD.iota (ιJ R) * (CD.iota (CD.e2 : H R) * (CD.e2 : O R))
    ↔ (ιJ R) * (CD.e2 : H R) = (CD.e2 : H R) * (ιJ R) :=
  CD.iota_iota_e2_assoc_iff (ιJ R) (CD.e2 : H R)

/-- NON-VACUITY (anti-W8): over `ℚ` the triple genuinely fails to reassociate —
    `(ι(ι J)·ι(e₂))·e₂ ≠ ι(ι J)·(ι(e₂)·e₂)` — so the loss is not vacuous. -/
theorem not_associative_witness :
    (CD.iota (ιJ ℚ) * CD.iota (CD.e2 : H ℚ)) * (CD.e2 : O ℚ)
      ≠ CD.iota (ιJ ℚ) * (CD.iota (CD.e2 : H ℚ) * (CD.e2 : O ℚ)) := by
  intro h; rw [assoc_triple_iff] at h; exact not_commutative_witness h

/-- ★ THE LOSS OF ASSOCIATIVITY (the rung-3 content). The rung-3 algebra `O ℚ` is
    NOT associative: there is a triple whose two bracketings disagree. The doubling
    that preserved associativity at rung 2 (commutative base) destroys it here
    (non-commutative base). This is the genuinely NEW termination of the cascade —
    the next loss (the composition/Born norm law, at the stop) follows from it. -/
theorem not_associative : ¬ ∀ x y z : O ℚ, (x * y) * z = x * (y * z) := by
  intro h; exact not_associative_witness (h _ _ _)

/-- ★ THE ONE CAUSE. The rung-3 triple fails to associate EXACTLY because the
    rung-2 base pair `ι J , e₂` does not commute — which (rung 2's
    `commutativity_cause`) is EXACTLY because the rung-1 complex unit is not self-
    conjugate (`J ≠ J*`). The loss of associativity at rung 3 traces, through one
    intermediate rung, to the single seed laid at rung 1: the same algebraic fact,
    propagated up the cascade. -/
theorem associativity_cause {R : Type*} [CommRing R] :
    ((CD.iota (ιJ R) * CD.iota (CD.e2 : H R)) * (CD.e2 : O R)
      = CD.iota (ιJ R) * (CD.iota (CD.e2 : H R) * (CD.e2 : O R)))
    ↔ (Dbl.J : Dbl R) = star Dbl.J := by
  rw [assoc_triple_iff]; exact commutativity_cause

end Phys.Cascade
