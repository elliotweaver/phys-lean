/-
  Phys.Algebra.DerivationBracket — N21 (i): THE g₂ LIE STRUCTURE of Der(O ℚ),
  PART 1 — the commutator closure over ℚ, the 14-dimensional Lie algebra, and the
  explicit 14-element basis.
  ===========================================================================
  N20 (`DerivationUpperBound.lean`) CLOSED the EXACT dimension
  `finrank_derivationQ_eq_14`. N19 banked the 14 explicit derivations `D0E..D13E`
  (`Dvec_linearIndependent`, `Dvec_mem`) and N6 banked the bracket-closure source
  `isDeriv_bracket` (the commutator of two derivations is a derivation — proved from
  the Leibniz law + distributivity ALONE, never associativity, which is exactly why
  the structure survives on the non-associative terminal algebra).

  THIS MODULE assembles the g₂ LIE STRUCTURE FORWARD, part 1:

    isDerivQ_bracket  — ★ THE COMMUTATOR CLOSURE over ℚ: `⁅f,g⁆ = f∘g − g∘f` of two
                       ℚ-linear Leibniz-derivations is AGAIN a ℚ-linear derivation
                       (the ℚ-analog of N6 `isDeriv_bracket`; same trunk reframe —
                       cross-terms cancel by distributivity, no associator appears).
    derivationLieQ    — ★★ `Der(O ℚ)` as a `LieSubalgebra ℚ (Module.End ℚ (O ℚ))`,
                       carved by `IsDerivQ`. It inherits `LieRing` + `LieAlgebra ℚ`
                       from the ambient commutator structure on the (associative)
                       endomorphism ring — so it IS a Lie algebra. With the banked
                       `finrank_derivationQ_eq_14` (same carrier as `derivationQ`),
                       this is THE 14-DIMENSIONAL LIE ALGEBRA.
    derivLieQ_add_left/right, derivLieQ_self, derivLieQ_jacobi
                     — ★ the three defining Lie laws exposed explicitly (bilinear,
                       alternating, Jacobi).
    Dsub             — the 14 explicit derivations `D0E..D13E` as elements of the
                       submodule `derivationQ`.
    Dsub_indep       — ★ they are linearly independent INSIDE the submodule, lifted
                       from the banked End-level `Dvec_linearIndependent` via the
                       subtype embedding (`subtype ∘ Dsub = Dvec`, defeq) and
                       `LinearIndependent.of_comp`.
    derivBasis       — ★★ `Module.Basis (Fin 14) ℚ derivationQ`: the 14 explicit
                       derivations form a BASIS — independent (above) + spanning,
                       via `basisOfLinearIndependentOfCardEqFinrank` on the banked
                       exact dimension `finrank_derivationQ_eq_14`. The g₂ Cartan
                       structure read off an EXPLICIT basis, derived forward.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0; N3–N6/N16–N20 held it). No Mathlib
  `LieAlgebra.g2` / `G₂` is imported to ASSERT the Lie structure. The Lie bracket is
  NOT posited: the commutator closure is PROVED (`isDerivQ_bracket`), and the
  bilinear/alternating/Jacobi laws are read off the ambient endomorphism ring's
  commutator (Mathlib machinery operating on the DERIVED object `Module.End ℚ (O ℚ)`,
  exactly as N6 used `Module.End ℤ` for the integer Lie algebra). The basis is the
  banked explicit `D0E..D13E`, not a posited Cartan–Weyl frame.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "gauge / g₂ / automorphism":
  what remains is the pure statement that the Leibniz-derivation ℚ-submodule of the
  Cayley–Dickson double of a double of a double of ℚ is a 14-dimensional Lie algebra
  under the commutator bracket, with an exhibited explicit 14-element basis. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationUpperBound
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## THE COMMUTATOR CLOSURE over ℚ. -/

/-- ★ THE COMMUTATOR CLOSURE over ℚ. The Lie bracket `⁅f, g⁆ = f∘g − g∘f` of two
    ℚ-linear Leibniz-derivations is AGAIN a ℚ-linear Leibniz-derivation. THE TRUNK
    REFRAME (THE ONE LAW): the proof uses ONLY the Leibniz law, biadditivity, and the
    distributivity of the `CD` product — it NEVER uses associativity of the terminal
    algebra. The cross-terms cancel by distributivity alone; no associator appears.
    This is the ℚ-analog of N6 `isDeriv_bracket`, and it is what makes `derivationQ`
    closed under the bracket — i.e. a Lie subalgebra. -/
theorem isDerivQ_bracket (f g : Module.End ℚ (O ℚ))
    (hf : IsDerivQ f) (hg : IsDerivQ g) : IsDerivQ ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [hg x y, hf x y]
  simp only [map_add]
  rw [hf (g x) y, hf x (g y), hg (f x) y, hg x (f y)]
  simp only [sub_mul, mul_sub]; abel

/-! ## THE 14-DIMENSIONAL LIE ALGEBRA. -/

/-- ★★ `Der(O ℚ)` — THE DERIVATION LIE ALGEBRA over ℚ, as a `LieSubalgebra` of the
    (machinery) Lie algebra `Module.End ℚ (O ℚ)`. The closure conditions are the
    submodule laws (`derivationQ`) plus the commutator closure `isDerivQ_bracket`,
    which is what makes it a *Lie* subalgebra. It inherits `LieRing` + `LieAlgebra ℚ`
    from the ambient. Its carrier is exactly that of `derivationQ`, so the banked
    `finrank_derivationQ_eq_14` makes this THE 14-DIMENSIONAL LIE ALGEBRA. -/
def derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ)) where
  carrier := { D | IsDerivQ D }
  add_mem' := by
    intro f g hf hg x y
    simp only [LinearMap.add_apply]
    rw [hf x y, hg x y]; simp only [add_mul, mul_add]; abel
  zero_mem' := by intro x y; simp
  smul_mem' := by
    intro c f hf x y
    show (c • f) (x * y) = (c • f) x * y + x * (c • f) y
    simp only [LinearMap.smul_apply]
    rw [hf x y, smul_add, qsmul_mul_left, qsmul_mul_right]
  lie_mem' := by
    intro f g hf hg
    exact isDerivQ_bracket f g hf hg

@[simp] theorem mem_derivationLieQ {D : Module.End ℚ (O ℚ)} :
    D ∈ derivationLieQ ↔ IsDerivQ D := Iff.rfl

/-- The carrier of the Lie subalgebra is exactly that of the dimension submodule
    `derivationQ`: both are `{ D | IsDerivQ D }`. So `finrank_derivationQ_eq_14`
    is the dimension of this Lie algebra. -/
theorem derivationLieQ_carrier_eq :
    (derivationLieQ : Set (Module.End ℚ (O ℚ))) = (derivationQ : Set (Module.End ℚ (O ℚ))) := rfl

/-- `Der(O ℚ)` is a Lie ring (inherited from the commutator structure). -/
noncomputable instance : LieRing derivationLieQ := inferInstance
/-- `Der(O ℚ)` is a Lie algebra over ℚ. -/
noncomputable instance : LieAlgebra ℚ derivationLieQ := inferInstance

/-- ★ BILINEAR (left): the derivation bracket is additive in the left slot. -/
theorem derivLieQ_add_left (x y z : derivationLieQ) :
    ⁅x + y, z⁆ = ⁅x, z⁆ + ⁅y, z⁆ := add_lie x y z
/-- ★ BILINEAR (right): the derivation bracket is additive in the right slot. -/
theorem derivLieQ_add_right (x y z : derivationLieQ) :
    ⁅x, y + z⁆ = ⁅x, y⁆ + ⁅x, z⁆ := lie_add x y z
/-- ★ ALTERNATING: the derivation bracket of an element with itself vanishes. -/
theorem derivLieQ_self (x : derivationLieQ) : ⁅x, x⁆ = 0 := lie_self x
/-- ★ JACOBI: the derivation bracket satisfies the Jacobi identity. -/
theorem derivLieQ_jacobi (x y z : derivationLieQ) :
    ⁅x, ⁅y, z⁆⁆ + ⁅y, ⁅z, x⁆⁆ + ⁅z, ⁅x, y⁆⁆ = 0 := lie_jacobi x y z

/-! ## THE EXPLICIT 14-ELEMENT BASIS. -/

noncomputable section

/-- The 14 explicit derivations `D0E..D13E` (N19), as elements of the derivation
    submodule `derivationQ`. -/
def Dsub : Fin 14 → derivationQ := fun i =>
  ⟨![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] i,
   Dvec_mem i⟩

/-- The subtype embedding composed with `Dsub` recovers the End-level family
    (definitionally). -/
theorem subtype_comp_Dsub :
    (Submodule.subtype derivationQ) ∘ Dsub
      = ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] := rfl

/-- ★ THE 14 ARE INDEPENDENT INSIDE the submodule `derivationQ`. Lifted from the
    banked End-level `Dvec_linearIndependent` (N19) through the subtype embedding:
    `subtype ∘ Dsub` is the End-level family, independent, so `Dsub` is independent
    by `LinearIndependent.of_comp`. -/
theorem Dsub_indep : LinearIndependent ℚ Dsub := by
  have h : LinearIndependent ℚ ((Submodule.subtype derivationQ) ∘ Dsub) := by
    rw [subtype_comp_Dsub]; exact Dvec_linearIndependent
  exact h.of_comp _

/-- ★★ THE EXPLICIT BASIS: the 14 derivations `D0E..D13E` form a
    `Module.Basis (Fin 14) ℚ derivationQ`. Independent (`Dsub_indep`) and — because
    their count `14` equals the banked exact dimension `finrank_derivationQ_eq_14` —
    spanning, via `basisOfLinearIndependentOfCardEqFinrank`. The 14-dimensional Lie
    algebra of derivations is exhibited with an EXPLICIT basis, derived forward; no
    posited Cartan–Weyl frame. -/
def derivBasis : Module.Basis (Fin 14) ℚ derivationQ :=
  basisOfLinearIndependentOfCardEqFinrank Dsub_indep (by
    rw [finrank_derivationQ_eq_14]; rfl)

/-- The basis vectors ARE the explicit derivations `D0E..D13E` (as endomorphisms). -/
@[simp] theorem derivBasis_apply (i : Fin 14) :
    (derivBasis i : Module.End ℚ (O ℚ)) = Dsub i := by
  simp only [derivBasis, coe_basisOfLinearIndependentOfCardEqFinrank]

end

end Phys.Algebra
