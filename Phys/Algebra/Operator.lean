/-
  Phys.Algebra.Operator — N3: THE OPERATOR (CLIFFORD) STRUCTURE the terminal algebra forces.
  ===========================================================================
  THE FIRST NODE OF THE ALGEBRA LAYER (depth 2). N2 derived — not posited — the
  forced algebra cascade and its STOP at the octonion shape `𝕆 = CD (CD B)` (the last
  rung where the self-overlap / Born composition law `Nrm (x·y) = Nrm x · Nrm y`
  survives; `Phys/Cascade/ForcedStop.lean`, `Nrm_mul_on_O`). `𝕆`'s own multiplication
  is NON-associative (`Phys/Cascade/Octonion.lean`, `not_associative`). This module
  reads off the FIRST purely-algebraic structure that terminal algebra FORCES: its
  non-associative product reorganizes into an ASSOCIATIVE operator algebra, and the
  left-multiplication endomorphisms satisfy a quadratic relation governed by the
  ALREADY-BANKED self-overlap form `Nrm` / `bilin` (N2) — the relation a physicist
  recognizes as the Clifford / spinor relation.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0, the project's deepest novelty). The
  division-algebra-physics field (Furey, Dixon, Günaydin–Gürsey, …) POSITS `𝕆` and reads
  its Clifford structure off by hand. Here the structure is DERIVED FORWARD from the
  banked Cayley–Dickson product `CD` + conjugation `star` (no Mathlib `CliffordAlgebra` /
  `QuadraticForm` import — importing them and ASSERTING `𝕆`'s operators ARE a Clifford
  algebra would POSIT the very structure we derive; the same drift trap as the forbidden
  Hurwitz import, docs/ROADMAP.md N3). The quadratic form is NOT a freshly posited inner
  product: it is the banked Born self-overlap `Nrm` / `bilin` from N2.

  THE DERIVATION (forward; each step a theorem, foundations-only):

    scaling_law      — ★ THE LEFT SCALING LAW (= the left-alternative law), HYPOTHESIS-FREE
                       on the octonion shape `CD (CD B)`: `x · (star x · y) = ι (Nrm x) · y`
                       for ALL `x, y`. (On a base that is a DOUBLE of a commutative `*`-ring,
                       the double is an alternative algebra; via the banked `selfMul`
                       `x · star x = ι (Nrm x)`, this is `[x, star x, y] = 0`.) Proved by
                       expansion bottoming out in the commutative ground ring — never the
                       multiplicativity-conditioned `scaling_of_H` (that needed the
                       hypothesis `Nrm` multiplicative; here the octonion shape forces it
                       unconditionally).
    L_sq_imag        — on an IMAGINARY element (`star a = −a`), the scaling law reads
                       `a · (a · y) = − (ι (Nrm a) · y)` — the operator square law.
    clifford_imag    — POLARIZED: for imaginary `a, b`,
                       `a · (b · y) + b · (a · y) = − (ι (bilin a b) · y)`, via the banked
                       polarization `Nrm (a+b) = Nrm a + Nrm b + bilin a b`.
    Lop              — left multiplication `L a : y ↦ a · y` as an additive endomorphism
                       (`AddMonoid.End (CD (CD B))` — an ASSOCIATIVE ring even though the
                       underlying product is not: the reorganization into an associative
                       operator algebra is exactly what `End` is).
    L_sq_op          — ★ THE OPERATOR SQUARE in `End`: `L a * L a = − L (ι (Nrm a))`
                       for imaginary `a`. (`L ∘ ι` embeds the base "scalars" into the
                       operator ring; `L (ι t)` is the scalar action by `t`.)
    clifford_op      — ★★ THE CLIFFORD RELATION in `End`: for imaginary `a, b`,
                       `L a * L b + L b * L a = − L (ι (bilin a b))` — the polarized
                       quadratic relation governed by the self-overlap form.

  CONCRETE / ANTI-VACUITY (docs/RUNBOOK.md W8) on the cascade's terminal `O ℚ`:
    unit_imag, Nrm_unit   — `u = e₂ : O ℚ` is imaginary with `Nrm u = 1`.
    L_unit_sq             — `L u * L u = −1` in `End (O ℚ)`: a unit operator squares to
                            `−1` (the recognizable spinor relation), NON-VACUOUS.
    units_anticommute     — the orthogonal imaginary units `u = e₂`, `v = ι e₂` have
                            `bilin u v = 0`, so `L u * L v + L v * L u = 0` — they
                            ANTICOMMUTE in the operator ring.
    op_nonassoc           — the operator algebra is genuinely richer than the base: on
                            `O ℚ`, `a · (b · y) ≠ (a · b) · y` (the banked
                            `not_associative_witness`), so the Clifford relation's nested
                            products are NOT a vacuous restatement of base multiplication.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Clifford / spinor / gauge /
  operator": what remains is the theorem that the left-multiplication endomorphisms of the
  Cayley–Dickson double of a double satisfy a quadratic relation `L a · L a = − L (ι (Nrm a))`
  (polarized `L a · L b + L b · L a = − L (ι (bilin a b))`) governed by the self-overlap
  form, in the associative endomorphism ring. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Cascade.ForcedStop
import Mathlib.Algebra.Group.Hom.End
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE OPERATOR STRUCTURE over the octonion shape `CD (CD B)`.

    The carrier is the Cayley–Dickson double of a double `CD (CD B)` — the structure two
    doublings produce, i.e. the octonion rung over a commutative `*`-base `B`. Its base
    `CD B` is associative (banked `Ring (CD B)`) but in general non-commutative, so the
    double `CD (CD B)` is in general non-associative (`Phys/Cascade/Octonion.lean`). The
    local `narCD` / `srCD` instances carry the additive-ring + `*`-ring structure at this
    non-associative level (distributivity holds; `mul_assoc` does NOT). -/
section Carrier
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 4000000 in
/-- ★ THE LEFT SCALING LAW (the left-alternative law), HYPOTHESIS-FREE on the octonion
    shape `CD (CD B)`: `x · (star x · y) = ι (Nrm x) · y` for all `x, y`. Because the base
    `CD B` is itself a double of a commutative `*`-ring, `CD (CD B)` is an alternative
    algebra, so the associator `[x, star x, y]` vanishes; via the banked `selfMul`
    (`x · star x = ι (Nrm x)`) this is exactly the displayed scaling law. Derived forward
    by expanding the `CD` product down to the commutative ground ring `B` — NOT the
    multiplicativity-conditioned `scaling_of_H`; the octonion shape forces it
    unconditionally. -/
theorem scaling_law (x y : CD (CD B)) :
    x * (star x * y) = iota (Nrm x) * y := by
  rw [Nrm_def]
  ext <;>
    simp only [iota, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, add_zero, neg_zero] <;>
    ring

/-- `ι` is additive on the doubled-double carrier: `ι (p + q) = ι p + ι q`. -/
theorem iota_add (p q : CD B) : (iota (p + q) : CD (CD B)) = iota p + iota q := by
  ext <;> simp [iota]

/-- Right distributivity of the `CD` product on the doubled-double carrier. -/
theorem add_mul_na (x y z : CD (CD B)) : (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, add_mul, mul_add, star_add] <;> abel

/-- ★ THE OPERATOR SQUARE LAW (pointwise). On an IMAGINARY element (`star a = −a`), the
    scaling law gives `a · (a · y) = − (ι (Nrm a) · y)`: left-multiplication by `a`,
    applied twice, is `−Nrm a` (embedded) times the argument. -/
theorem L_sq_imag (a : CD (CD B)) (ha : star a = -a) (y : CD (CD B)) :
    a * (a * y) = -(iota (Nrm a) * y) := by
  have h := scaling_law a y
  rw [ha, neg_mul, mul_neg, neg_eq_iff_eq_neg] at h
  exact h

/-- ★ THE POLARIZED CLIFFORD RELATION (pointwise). For IMAGINARY `a, b` (`star a = −a`,
    `star b = −b`), `a · (b · y) + b · (a · y) = − (ι (bilin a b) · y)` — the symmetric
    quadratic relation, with the banked Born bilinear form `bilin` as its governing form.
    Obtained by polarizing `L_sq_imag` through the banked norm polarization
    `Nrm (a+b) = Nrm a + Nrm b + bilin a b`. -/
theorem clifford_imag (a b : CD (CD B)) (ha : star a = -a) (hb : star b = -b)
    (y : CD (CD B)) :
    a * (b * y) + b * (a * y) = -(iota (bilin a b) * y) := by
  have hab : star (a + b) = -(a + b) := by rw [star_add, ha, hb]; abel
  have hsum := L_sq_imag (a + b) hab y
  have hsa := L_sq_imag a ha y
  have hsb := L_sq_imag b hb y
  have hexp : (a + b) * ((a + b) * y)
      = a * (a * y) + (a * (b * y) + b * (a * y)) + b * (b * y) := by
    simp only [add_mul_na, CD.mul_add_na]; abel
  rw [hexp, hsa, hsb, CD.Nrm_add_na] at hsum
  have hiotaexp : iota (Nrm a + Nrm b + bilin a b) * y
      = iota (Nrm a) * y + iota (Nrm b) * y + iota (bilin a b) * y := by
    rw [iota_add, iota_add, add_mul_na, add_mul_na]
  rw [hiotaexp] at hsum
  have hcancel :
      (a * (b * y) + b * (a * y)) - (-(iota (bilin a b) * y))
        = (-(iota (Nrm a) * y) + (a * (b * y) + b * (a * y)) + -(iota (Nrm b) * y))
          - (-(iota (Nrm a) * y + iota (Nrm b) * y + iota (bilin a b) * y)) := by abel
  rw [hsum, sub_self] at hcancel
  exact sub_eq_zero.mp hcancel

/-- LEFT MULTIPLICATION as an additive endomorphism `L a : y ↦ a · y`. It lands in
    `AddMonoid.End (CD (CD B))` — the ASSOCIATIVE ring of additive endomorphisms — so the
    non-associative product of the terminal algebra is reorganized into an associative
    operator algebra (multiplication = composition). Additivity is the banked left
    distributivity `mul_add_na`. -/
def Lop (a : CD (CD B)) : AddMonoid.End (CD (CD B)) :=
  AddMonoidHom.mk' (fun y => a * y) (CD.mul_add_na a)

@[simp] theorem Lop_apply (a y : CD (CD B)) : Lop a y = a * y := rfl

/-- ★ THE OPERATOR SQUARE LAW in the associative endomorphism ring: for imaginary `a`,
    `L a * L a = − L (ι (Nrm a))`. The product on the left is COMPOSITION in `End`; the
    right embeds the base self-overlap `Nrm a` into the operator ring via `L ∘ ι`. This
    is the quadratic (Clifford) relation in its undpolarized form. -/
theorem L_sq_op (a : CD (CD B)) (ha : star a = -a) :
    Lop a * Lop a = - Lop (iota (Nrm a)) := by
  apply AddMonoidHom.ext; intro y
  show a * (a * y) = -(iota (Nrm a) * y)
  exact L_sq_imag a ha y

/-- ★★ THE CLIFFORD RELATION in the associative endomorphism ring: for imaginary `a, b`,
    `L a * L b + L b * L a = − L (ι (bilin a b))`. The polarized quadratic relation — the
    anticommutator of two left-multiplication operators is `−bilin(a,b)` (embedded) times
    the identity. This is the algebraic seed a physicist recognizes as the Clifford /
    spinor relation, DERIVED from the cascade with the self-overlap form `bilin` banked
    from N2, no posited inner product and no Mathlib Clifford machinery. -/
theorem clifford_op (a b : CD (CD B)) (ha : star a = -a) (hb : star b = -b) :
    Lop a * Lop b + Lop b * Lop a = - Lop (iota (bilin a b)) := by
  apply AddMonoidHom.ext; intro y
  show a * (b * y) + b * (a * y) = -(iota (bilin a b) * y)
  exact clifford_imag a b ha hb y

end Carrier

/-! ## CONCRETE + ANTI-VACUITY on the cascade's terminal algebra `O ℚ`.

    `O ℚ = CD (H ℚ) = CD (CD (Dbl ℚ))` is exactly the octonion shape with `B := Dbl ℚ`
    (a commutative `*`-ring). The genuine non-associativity of `O ℚ` (banked
    `not_associative`) is what makes the operator relation non-vacuous content. -/

section Concrete
attribute [local instance] CD.narCD CD.srCD

/-- The new generator `u = e₂` of the last doubling is IMAGINARY in `O ℚ`. -/
theorem unit_imag : star (CD.e2 : O ℚ) = -(CD.e2 : O ℚ) := by
  ext <;> simp [CD.e2]

/-- The self-overlap of the unit generator is `1`: `Nrm e₂ = 1`. -/
theorem Nrm_unit : CD.Nrm (CD.e2 : O ℚ) = (1 : H ℚ) := by
  rw [CD.Nrm_def]; simp [CD.e2]

/-- `ι (Nrm e₂) = 1` in `O ℚ` (the embedded unit self-overlap is the operator identity's
    source). -/
theorem iota_Nrm_unit : (CD.iota (CD.Nrm (CD.e2 : O ℚ)) : O ℚ) = 1 := by
  rw [Nrm_unit]; ext <;> simp [CD.iota]

/-- `L 1 = 1`: left multiplication by the unit is the identity endomorphism. -/
theorem Lop_one : Lop (1 : O ℚ) = 1 := by
  apply AddMonoidHom.ext; intro y
  show (1 : O ℚ) * y = y
  exact one_mul y

/-- ★ A UNIT OPERATOR SQUARES TO `−1`. In the associative endomorphism ring `End (O ℚ)`,
    the left-multiplication by the imaginary generator `e₂` satisfies `L e₂ * L e₂ = −1` —
    the recognizable relation `J² = −1` realized at the OPERATOR level on the terminal
    algebra. NON-VACUOUS (docs/RUNBOOK.md W8): a concrete nonzero operator with a genuine
    `−1` square. -/
theorem L_unit_sq : Lop (CD.e2 : O ℚ) * Lop (CD.e2 : O ℚ) = -1 := by
  rw [L_sq_op (CD.e2 : O ℚ) unit_imag, iota_Nrm_unit, Lop_one]

/-- The second orthogonal imaginary unit `v = ι e₂` in `O ℚ`. -/
theorem unit_imag' : star (CD.iota (CD.e2 : H ℚ) : O ℚ) = -(CD.iota (CD.e2 : H ℚ) : O ℚ) := by
  ext <;> simp [CD.iota, CD.e2]

/-- The two imaginary units `e₂` and `ι e₂` are ORTHOGONAL: their banked Born bilinear
    self-overlap vanishes, `bilin e₂ (ι e₂) = 0`. -/
theorem bilin_units : CD.bilin (CD.e2 : O ℚ) (CD.iota (CD.e2 : H ℚ)) = (0 : H ℚ) := by
  simp only [CD.bilin]
  ext <;> simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

/-- ★ ORTHOGONAL IMAGINARY UNITS ANTICOMMUTE in the operator ring. The Clifford relation
    at the orthogonal pair `e₂`, `ι e₂` (`bilin = 0`) reads
    `L e₂ * L (ι e₂) + L (ι e₂) * L e₂ = 0` — anticommutation, the polarized companion of
    `L_unit_sq`. -/
theorem units_anticommute :
    Lop (CD.e2 : O ℚ) * Lop (CD.iota (CD.e2 : H ℚ))
      + Lop (CD.iota (CD.e2 : H ℚ)) * Lop (CD.e2 : O ℚ) = 0 := by
  rw [clifford_op (CD.e2 : O ℚ) (CD.iota (CD.e2 : H ℚ)) unit_imag unit_imag',
    bilin_units]
  apply AddMonoidHom.ext; intro y
  show -(CD.iota (0 : H ℚ) * y) = 0
  have : (CD.iota (0 : H ℚ) : O ℚ) = 0 := by ext <;> simp [CD.iota]
  rw [this]
  show -((0 : O ℚ) * y) = 0
  ext <;> simp [CD.mul_re, CD.mul_im]

/-- ★ THE OPERATOR ALGEBRA IS GENUINELY RICHER THAN THE BASE PRODUCT (anti-vacuity, W8).
    On the terminal algebra `O ℚ`, composition of left-multiplications is NOT
    left-multiplication by the product: `a · (b · y) ≠ (a · b) · y` at the banked
    non-associating witness. So the Clifford relation's NESTED products `a · (b · y)`
    carry content the base multiplication alone does not — the relation is not a vacuous
    restatement. This is the same octonionic non-associativity that stopped the cascade
    (`not_associative`). -/
theorem op_nonassoc :
    (CD.iota (ιJ ℚ) : O ℚ) * ((CD.iota (CD.e2 : H ℚ)) * (CD.e2 : O ℚ))
      ≠ ((CD.iota (ιJ ℚ) : O ℚ) * (CD.iota (CD.e2 : H ℚ))) * (CD.e2 : O ℚ) := by
  intro h
  exact not_associative_witness h.symm

end Concrete

end Phys.Algebra
