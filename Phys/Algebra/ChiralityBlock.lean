/-
  N44 — THE CHIRALITY BLOCK: the left/right (chirality) multiplication families on the
  terminal algebra `O ℚ` do NOT all commute, DERIVED from the chain's non-associativity,
  NOT a posited chirality, NOT Mathlib `ℝ`/`ℂ` as content, NOT a bridge.

  WHAT THIS FILE BANKS (N44 — the third termination of the "one cause, many terminations"
  claim, beside the cascade-stop and the generation-cap):

    LeftMul a   — ★ the LEFT regular representation `x ↦ a · x` as a ℚ-linear map (the
                  "left-handed" multiplication action), linear via the banked distributivity
                  `mul_add_na` and scalar law `qsmul_mul_right`.
    RightMul b  — ★ the RIGHT regular representation `x ↦ x · b` as a ℚ-linear map (the
                  "right-handed" multiplication action), linear via `add_mul_na` /`qsmul_mul_left`.
    chirality_commute_iff_assoc — ★★ THE ONE-CAUSE BICONDITIONAL: the left- and right-action
                  families commute for ALL `a,b` IF AND ONLY IF the algebra ASSOCIATES. The
                  commutator `L_a R_b x − R_b L_a x = a·(x·b) − (a·x)·b` is the associator's
                  middle-slot, so commutation of the two chiralities is literally associativity.
    chirality_block — ★★★ THE HEADLINE: the two chirality families do NOT all commute, because
                  `O ℚ` is NON-associative (the banked `not_associative`, the cascade's own stop).
                  One chirality cannot be promoted to a second independent commuting action —
                  BLOCKED by the same octonionic non-associativity that stopped the cascade.
    chirality_block_iff_jordan_cap — ★★★ THE ONE-CAUSE LINK (candidate genuine novelty, PROVED):
                  the chirality block is EQUIVALENT to the order-4 Hermitian-Jordan generation-cap
                  failure (`jdef Xwit Ywit ≠ 0`). Both terminations are the SAME non-associativity,
                  composed as an honest `Iff`, never asserted.
    chirality_block_witness — ★ the SHARPEST non-vacuity: the SAME explicit cascade-stop witness
                  triple `(ι(ιJ), ι(e₂), e₂)` realizes a concrete pair whose left/right actions
                  disagree — the block is witnessed, not merely a `∀`-failure.

  THE ROUTE (reframe through the trunk — W1). The would-be question "is the right-handed action
  forced to agree with the left-handed action?" is NOT attacked by a coordinate computation on the
  non-associative product; it DISSOLVES through the trunk: the commutator of `L_a` and `R_b` is
  exactly the associator `[a, x, b]`, so the two chiralities commute everywhere IFF the associator
  vanishes everywhere IFF the algebra associates — and the cascade ALREADY lost associativity at
  this rung (`not_associative`). The same banked fact that (a) stopped the doubling cascade and
  (b) capped the generation tower at 3 now (c) blocks the chirality commutation: one cause, three
  terminations, the deepest connection of the program, here a proved theorem.

  ★ THE MOAT: that left/right octonion multiplications generate the full structure precisely
  because the algebra is non-associative is classical lore (Schafer; the regular representations);
  the novelty is that this block DESCENDS from the banked cascade-stop `not_associative` and is
  PROVED equivalent to the banked Jordan-tower cap, NOT a posited chirality asymmetry.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "chirality/handedness/left-handed/
  right-handed/Weyl/spin" → the left-multiplication and right-multiplication operator families on
  the Cayley–Dickson double of a double of a double of ℚ do not all commute, equivalently that
  algebra is non-associative, equivalently the order-4 Hermitian matrix Jordan defect is nonzero.
  The names do zero logical work.

  Everything is over ℚ (pure algebra — NO continuum, NO Mathlib ℝ/ℂ as content). `LinearMap`/
  `LinearMap.comp` are MACHINERY on the DERIVED `O ℚ`. NO posited chirality, NO bridge.

  Foundations-only: `[propext, Classical.choice, Quot.sound]`. No sorry, no posited axiom, no
  kernel-trust bypass.
-/
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.Operator
import Phys.Algebra.JordanTower
import Phys.Cascade.Octonion
import Phys.Cascade.ForcedStop

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The two chiralities: the left and right regular representations of `O ℚ`. -/

/-- ★ THE LEFT (regular) representation: `x ↦ a · x`, the left-multiplication action of the
    terminal algebra on itself as a ℚ-linear map. Additive by the banked left-distributivity
    `mul_add_na`; ℚ-linear by the banked scalar law `qsmul_mul_right`. -/
def LeftMul (a : O ℚ) : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := a * x
  map_add' x y := CD.mul_add_na a x y
  map_smul' c x := qsmul_mul_right c a x

/-- ★ THE RIGHT (regular) representation: `x ↦ x · b`, the right-multiplication action. Additive
    by the banked right-distributivity `add_mul_na`; ℚ-linear by `qsmul_mul_left`. -/
def RightMul (b : O ℚ) : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := x * b
  map_add' x y := add_mul_na x y b
  map_smul' c x := qsmul_mul_left c x b

@[simp] theorem LeftMul_apply (a x : O ℚ) : LeftMul a x = a * x := rfl
@[simp] theorem RightMul_apply (b x : O ℚ) : RightMul b x = x * b := rfl

/-! ## The one-cause biconditional, the block, the link, and the concrete witness. -/

/-- ★★ THE ONE-CAUSE BICONDITIONAL: the left- and right-multiplication families commute for ALL
    `a, b` IF AND ONLY IF the algebra associates. The commutator `L_a (R_b x) − R_b (L_a x)
    = a·(x·b) − (a·x)·b` is the associator's middle slot, so commutation of the two chiralities is
    LITERALLY associativity — no coordinate computation, the trunk identity carries it (W1). -/
theorem chirality_commute_iff_assoc :
    (∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
      ↔ (∀ x y z : O ℚ, (x * y) * z = x * (y * z)) := by
  constructor
  · intro h x y z
    have := congrArg (fun f => f y) (h x z)
    simpa [LinearMap.comp_apply, LeftMul_apply, RightMul_apply] using this.symm
  · intro h a b
    refine LinearMap.ext (fun x => ?_)
    simp only [LinearMap.comp_apply, LeftMul_apply, RightMul_apply]
    exact (h a x b).symm

/-- ★★★ THE CHIRALITY BLOCK: the left- and right-multiplication families do NOT all commute,
    because `O ℚ` is NON-associative (the banked cascade-stop `not_associative`). The right-handed
    action cannot be a second independent action commuting with the left-handed one — BLOCKED by
    the same octonionic non-associativity that stopped the doubling cascade. -/
theorem chirality_block :
    ¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a) := by
  intro h
  exact not_associative (chirality_commute_iff_assoc.mp h)

/-- ★★★ THE ONE-CAUSE LINK (candidate genuine novelty, a PROVED theorem, never asserted): the
    chirality block is EQUIVALENT to the generation-cap failure of the order-4 Hermitian-Jordan
    tower (`jdef Xwit Ywit ≠ 0`, banked `jordan_cap_iff_nonassoc`). Both terminations are the
    SAME octonionic non-associativity, composed here as an honest `Iff`. One cause, two
    terminations — and with `not_associative` (the cascade stop), three. -/
theorem chirality_block_iff_jordan_cap :
    (¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
      ↔ (jdef Xwit Ywit ≠ 0) :=
  chirality_commute_iff_assoc.not.trans jordan_cap_iff_nonassoc.symm

/-- ★ THE CONCRETE WITNESS (sharpest non-vacuity, W8): the SAME explicit non-associating triple
    that stops the cascade (`not_associative_witness`, the embedded base pair `(ιJ, e₂)`) realizes
    an EXPLICIT pair `a = ι(ιJ), b = e₂` whose left- and right-multiplication operators DISAGREE
    already at `x = ι(e₂)`. The block is not a vacuous `∀`-failure; it is realized by the cascade's
    own witness. -/
theorem chirality_block_witness :
    (LeftMul (CD.iota (ιJ ℚ))).comp (RightMul (CD.e2 : O ℚ))
      ≠ (RightMul (CD.e2 : O ℚ)).comp (LeftMul (CD.iota (ιJ ℚ))) := by
  intro h
  have hx := congrArg (fun f => f (CD.iota (CD.e2 : H ℚ))) h
  simp only [LinearMap.comp_apply, LeftMul_apply, RightMul_apply] at hx
  exact not_associative_witness hx.symm

end

end Phys.Algebra
