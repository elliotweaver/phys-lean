/-
  Phys.Algebra.OctonionCommutatorJacobiator — N205 THE TERMINAL ALGEBRA'S OWN COMMUTATOR
  BRACKET IS NOT A LIE BRACKET: the Jacobiator equals SIX TIMES the alternating associator,
  and it is genuinely NONZERO — over the DERIVED ℚ and the octonion rung `O ℚ = CD (H ℚ)`.
  ===========================================================================
  A genuinely DIFFERENT joint (W4.5 look WIDEST) from the N201–N204 colour/isospin arc, which
  worked the EXTERNAL derivation Lie algebra `g₂ = Der(O ℚ)` and its metric. THIS node is about
  the carrier `O ℚ` itself: equip it with its OWN internal commutator bracket
  `⁅x,y⁆ := x·y − y·x` and ask whether `(O ℚ, ⁅·,·⁆)` is a Lie algebra. It is NOT.

  THE STRUCTURAL PUNCHLINE (derived, not asserted):

  ── the commutator is anticommutative (one Lie axiom HOLDS) ──
    `octBracket_add_swap` : `⁅x,y⁆ + ⁅y,x⁆ = 0`  (so `⁅x,x⁆ = 0`, `octBracket_self`).
    Bilinearity + anticommutativity hold; the ONLY thing that can fail is the Jacobi identity.

  ── the Jacobiator IS six times the alternating associator (THE quantitative connection) ──
    `jacobiator x y z := ⁅⁅x,y⁆,z⁆ + ⁅⁅y,z⁆,x⁆ + ⁅⁅z,x⁆,y⁆`.
    `jacobiator_eq_assoc_sum` : the Jacobiator expands to the SIGNED SUM of the six associators
      `[x,y,z] − [y,x,z] + [y,z,x] − [z,y,x] + [z,x,y] − [x,z,y]` (pure additive-group algebra,
      `sub_mul`/`mul_sub`/`abel`, treating the products as atoms — no `CD` coordinate bash).
    ★ `jacobiator_eq_six_assoc` : THE HEADLINE — because the octonion associator is an ALTERNATING
      trilinear form (the banked `assoc_swap12`/`assoc_swap23`, Alternative.lean N5b), all six
      signed terms COLLAPSE to `6 • [x,y,z]`. The Jacobi DEFECT of the carrier's commutator is
      exactly six times the octonionic associator: `Jac = 6 • assoc`. (This is the Malcev identity:
      `(O, ⁅·,·⁆)` is a MALCEV algebra, the alternative-algebra commutator's non-Lie measure.)

  ── the defect is genuinely NONZERO (W8 teeth: Jacobi FAILS) ──
    `jacobiator_witness_coord` : at the cascade's own non-associating triple
      `(ι(ιJ), ι(e₂), e₂)` (the banked `not_associative` witness, `assoc_witness_coord = 2`), the
      Jacobiator's `im.im.im` coordinate is `12 = 6·2`.
    ★ `jacobiator_witness_ne_zero` : the Jacobiator is NONZERO there — so the Jacobi identity
      genuinely FAILS, and `(O ℚ, ⁅·,·⁆)` is NOT a Lie algebra.
    `not_lie_bracket` : `∃ x y z : O ℚ, jacobiator x y z ≠ 0` — the crisp non-Lie statement.

  THE MOAT (docs/STANDARD §0) and the ONE-CAUSE WEB. The SAME octonionic non-associativity that
  stops the cascade (`not_associative`, N2), caps the Hermitian-Jordan / generation tower at 3
  (N5), and breaks left-alternativity one rung up at the sedenions (N200) ALSO obstructs the
  carrier's commutator from being a Lie bracket. So the symmetry/gauge Lie algebra of the octonions
  cannot be the carrier's own internal bracket — it is FORCED to be the EXTERNAL derivation algebra
  `g₂ = Der(O ℚ)` (the genuine Lie algebra, N16–N21), the very object the colour/isospin gauge arc
  (N42, N184–N204) is built inside. One cause (non-associativity), another termination (the internal
  bracket is not Lie), and the structural reason the gauge algebra lives in the derivations, not the
  carrier. The literature treats the commutator-vs-derivation distinction by hand; here the Jacobi
  defect is FORCED and quantified (`= 6 • assoc`) from the banked alternating associator.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). There are NO physics words in any statement: each is
  a pure algebraic identity about the commutator `x·y − y·x` and the associator `(x·y)·z − x·(y·z)`
  of the Cayley–Dickson double of a double. Delete every comment and the mathematics stands: the
  commutator is anticommutative, its Jacobiator equals six times the (alternating) associator, and
  on the cascade's non-associating triple this is nonzero — so the commutator is not a Lie bracket.

  Foundations-only: no posited axiom, no posited Lie/Malcev structure as content, no Mathlib ℝ/ℂ as
  content (ℚ is the coefficient field; the OBJECT is the derived octonion rung `O ℚ = CD (H ℚ)` and
  its banked alternating associator, Alternative.lean N5b), no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE INTERNAL COMMUTATOR BRACKET and its Jacobiator on the octonion shape `CD (CD B)`. -/
section Alt
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- THE INTERNAL COMMUTATOR BRACKET `⁅x,y⁆ = x·y − y·x` on the octonion shape. -/
def octBracket (x y : CD (CD B)) : CD (CD B) := x * y - y * x

/-- THE JACOBIATOR of the commutator bracket: the cyclic sum that vanishes iff the Jacobi
    identity holds. -/
def jacobiator (x y z : CD (CD B)) : CD (CD B) :=
  octBracket (octBracket x y) z + octBracket (octBracket y z) x + octBracket (octBracket z x) y

/-- THE COMMUTATOR IS ANTICOMMUTATIVE (one Lie axiom holds): `⁅x,y⁆ + ⁅y,x⁆ = 0`. -/
theorem octBracket_add_swap (x y : CD (CD B)) : octBracket x y + octBracket y x = 0 := by
  simp only [octBracket]; abel

/-- THE COMMUTATOR IS ALTERNATING: `⁅x,x⁆ = 0`. -/
theorem octBracket_self (x : CD (CD B)) : octBracket x x = 0 := by
  simp only [octBracket]; abel

/-- THE EXPANSION IDENTITY: the Jacobiator equals the signed sum of the six associators.
    Pure additive-group algebra (`sub_mul`/`mul_sub`/`abel`), the products treated as atoms. -/
theorem jacobiator_eq_assoc_sum (x y z : CD (CD B)) :
    jacobiator x y z =
      assoc x y z - assoc y x z + assoc y z x - assoc z y x + assoc z x y - assoc x z y := by
  simp only [jacobiator, octBracket, assoc, sub_mul, mul_sub]
  abel

/-- ★ THE HEADLINE: the Jacobiator equals SIX TIMES the alternating associator
    (`jacobiator = 6 • assoc`). The six signed associators collapse to six equal copies of
    `[x,y,z]` because the octonion associator is an ALTERNATING trilinear form (the banked
    `assoc_swap12`/`assoc_swap23`, Alternative.lean N5b). This is the Malcev identity: the
    Jacobi DEFECT of the carrier's commutator is exactly `6·[x,y,z]`. -/
theorem jacobiator_eq_six_assoc (x y z : CD (CD B)) :
    jacobiator x y z =
      assoc x y z + assoc x y z + assoc x y z + assoc x y z + assoc x y z + assoc x y z := by
  rw [jacobiator_eq_assoc_sum]
  have h12 : assoc y x z = -assoc x y z := by
    linear_combination (norm := abel) assoc_swap12 x y z
  have h23 : assoc x z y = -assoc x y z := by
    linear_combination (norm := abel) assoc_swap23 x y z
  have hzxy : assoc z x y = assoc x y z := by
    linear_combination (norm := abel) assoc_swap12 x z y - assoc_swap23 x y z
  have hzyx : assoc z y x = -assoc x y z := by
    linear_combination (norm := abel)
      assoc_swap23 z x y - assoc_swap12 x z y + assoc_swap23 x y z
  have hyzx : assoc y z x = assoc x y z := by
    linear_combination (norm := abel) assoc_swap23 y x z - assoc_swap12 x y z
  rw [h12, h23, hzxy, hzyx, hyzx]
  abel

end Alt

/-! ## W8 NON-VACUITY on the cascade's terminal algebra `O ℚ` (docs/RUNBOOK.md W8).

    The Jacobiator = 6·assoc identity is only content if the associator is genuinely nonzero —
    i.e. if Jacobi actually FAILS. It does: on `O ℚ` the cascade's own non-associating triple
    has Jacobiator `12 = 6·2 ≠ 0`. So `(O ℚ, ⁅·,·⁆)` is NOT a Lie algebra. -/
section Concrete
attribute [local instance] CD.narCD CD.srCD

/-- the witness triple: the cascade's non-associating triple (banked Alternative.lean). -/
noncomputable def jacWx : O ℚ := CD.iota (ιJ ℚ)
noncomputable def jacWy : O ℚ := CD.iota (CD.e2 : H ℚ)
noncomputable def jacWz : O ℚ := (CD.e2 : O ℚ)

/-- The `im.im.im` coordinate of the witness Jacobiator equals `12 = 6·2`: six times the banked
    witness associator coordinate (`assoc_witness_coord = 2`). -/
theorem jacobiator_witness_coord :
    (jacobiator jacWx jacWy jacWz).im.im.im = 12 := by
  have hsix : (jacobiator jacWx jacWy jacWz).im.im.im
      = 6 * (assoc jacWx jacWy jacWz).im.im.im := by
    rw [jacobiator_eq_six_assoc]
    simp only [CD.add_im, Dbl.add_im]
    ring
  rw [hsix]
  show 6 * (assoc (CD.iota (ιJ ℚ)) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im = 12
  rw [assoc_witness_coord]
  norm_num

/-- ★ W8 TEETH: the Jacobiator is GENUINELY NONZERO at the witness triple — the Jacobi identity
    FAILS, so the carrier's commutator bracket is not a Lie bracket. -/
theorem jacobiator_witness_ne_zero : jacobiator jacWx jacWy jacWz ≠ 0 := by
  intro h
  have hz : (jacobiator jacWx jacWy jacWz).im.im.im = 12 := jacobiator_witness_coord
  rw [h] at hz
  norm_num [CD.zero_im] at hz

/-- THE CRISP NON-LIE STATEMENT: there is a triple on `O ℚ` whose Jacobiator is nonzero, so the
    commutator bracket `⁅·,·⁆ = x·y − y·x` does not satisfy the Jacobi identity — `(O ℚ, ⁅·,·⁆)`
    is NOT a Lie algebra. The octonionic symmetry algebra is forced to be the EXTERNAL derivation
    algebra `g₂ = Der(O ℚ)`, not the carrier's own bracket. -/
theorem not_lie_bracket : ∃ x y z : O ℚ, jacobiator x y z ≠ 0 :=
  ⟨jacWx, jacWy, jacWz, jacobiator_witness_ne_zero⟩

end Concrete

end Phys.Algebra
