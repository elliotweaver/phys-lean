/-
  Phys.Algebra.Derivation — N6: THE DERIVATION (infinitesimal automorphism) LIE
  ALGEBRA the terminal algebra forces.
  ===========================================================================
  THE FIRST NODE OF THE EMERGENT LAYER (depth 3). The algebra layer (N3–N5) and the
  full number tower ℕ→ℤ→ℚ→ℝ (N7–N14, ⚠ gate RESOLVED) are banked. This module reads
  off the FIRST physics-recognized structure that emerges: the **infinitesimal
  automorphisms — the DERIVATIONS — of the terminal algebra `𝕆 = CD (CD B)`** form a
  LIE ALGEBRA under the commutator bracket, non-trivially.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0, the project's deepest novelty). The
  division-algebra-physics field (Furey, Dixon, Günaydin–Gürsey, …) POSITS `𝕆` and
  *reads gauge groups off* its automorphism / derivation structure by hand. Here the
  structure is DERIVED FORWARD from the banked Cayley–Dickson product `CD` + the Leibniz
  law (no Mathlib `Derivation` / `LieAlgebra`-on-𝕆 / `G₂` import that would ASSERT `𝕆`'s
  derivations ARE a Lie algebra / are `g₂` — the same drift trap N3/N4/N5 avoided). The
  Lie bracket is NOT posited as a structure: the COMMUTATOR of two Leibniz-derivations is
  PROVED to satisfy the Leibniz law, and the bilinear/alternating/Jacobi laws are read off
  the ambient endomorphism ring's commutator (Mathlib machinery operating on the DERIVED
  object `Module.End ℤ 𝕆`, exactly as N3 used `AddMonoid.End` for `Lop` and N4 used
  `Subring`/`Module` — never a posit of the Lie structure ON `𝕆`).

  THE DERIVATION (forward; each step a theorem, foundations-only):

    IsDeriv          — the LEIBNIZ-DERIVATION predicate over the banked `CD` product:
                       `D (x · y) = D x · y + x · D y` for an additive ℤ-linear endo
                       `D : 𝕆 →ₗ[ℤ] 𝕆`. (Physics-words-removable: this is *just* the
                       Leibniz law for the derived product — no physics word in sight.)
    isDeriv_zero/add/neg/smul
                     — the derivations form a ℤ-submodule of `Module.End ℤ 𝕆`.
    isDeriv_bracket  — ★★ THE COMMUTATOR CLOSURE: `[D,E] = D∘E − E∘D` of two derivations
                       is AGAIN a derivation. THE TRUNK REFRAME (docs/STANDARD THE ONE LAW):
                       this uses ONLY the Leibniz law + biadditivity + distributivity of the
                       `CD` product — NOT associativity of `𝕆`. That is *exactly* why this
                       structure survives on the non-associative terminal algebra: the
                       cross-terms `E x · D y` and `D x · E y` cancel by distributivity, with
                       no associator ever appearing.
    derivation       — `Der(𝕆)` as a `LieSubalgebra ℤ (Module.End ℤ 𝕆)`, carved by `IsDeriv`.
                       It inherits `LieRing` + `LieAlgebra ℤ` from the ambient (the commutator
                       Lie structure on the associative endomorphism ring), so it IS a Lie
                       algebra. The three defining laws are exposed explicitly:
    deriv_lie_add_left / deriv_lie_add_right  — ★ BILINEAR (the bracket is additive each slot).
    deriv_lie_self                            — ★ ALTERNATING (`[D,D] = 0`).
    deriv_lie_jacobi                          — ★ JACOBI.

  NON-VACUITY (docs/RUNBOOK.md W8) — a CONCRETE NONZERO derivation on the cascade's terminal
  `O ℚ`, so `Der(O ℚ)` is NOT the zero algebra:
    liftEnd          — the componentwise LIFT of a base map `δ : CD B →+ CD B` to
                       `CD (CD B)`: `z ↦ ⟨δ z.re, δ z.im⟩`.
    liftEnd_isDeriv  — IF `δ` is a derivation of the (associative) base `CD B` AND commutes
                       with `star`, THEN its lift is a derivation of `CD (CD B)`.
    adHom            — the inner map `ad_q : x ↦ q · x − x · q` on the associative base.
    adHom_isDeriv    — `ad_q` is a derivation of the associative base `CD B`.
    adHom_star_comm  — `ad_q` commutes with `star` when `q` is IMAGINARY (`star q = −q`).
    innerDeriv q     — `liftEnd (ad_q)` as a derivation of `𝕆`, for imaginary `q`.
    witnessDeriv     — `innerDeriv e₂` on `O ℚ` (`e₂` the imaginary new generator).
    witnessDeriv_ne_zero
                     — it is NONZERO: `ad_{e₂}(ι J) ≠ 0` because `e₂` and `ι J` do NOT
                       commute (banked `iota_e2_comm_iff` + `J_ne_star_J`) — the theory-native
                       nonvanishing, not a coordinate computation.
    derivation_nontrivial / derivation_ne_bot
                     — ★★ a concrete `D` with `IsDeriv D ∧ D ≠ 0`; the Lie algebra of
                       derivations of the terminal algebra is non-trivial.

  NOT this node (downstream children): the DIMENSION of `Der(𝕆)` / that it is `g₂`, and the
  automorphism Lie GROUP (which exponentiates over the now-derived continuum). Per the
  ROADMAP N6 spec, those are specified after this node lands.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "gauge / symmetry / automorphism":
  what remains is the pure statement that the Leibniz-derivations of the Cayley–Dickson double
  of a double form a Lie algebra under the commutator bracket, with a concrete nonzero element.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.Operator
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

/-! ## THE DERIVATION LIE ALGEBRA over the octonion shape `CD (CD B)`.

    The carrier is the Cayley–Dickson double of a double `CD (CD B)` — the octonion rung
    over a commutative `*`-base `B` (N3's home). Its multiplication is in general
    non-associative; the local `narCD` / `srCD` instances carry the additive-ring + `*`-ring
    structure at this non-associative level. As an additive abelian group it is a `ℤ`-module,
    so `Module.End ℤ (CD (CD B))` is an associative ring — and Mathlib equips that ring with
    its commutator Lie structure. The derivations are the subset cut out by the Leibniz law. -/
section Carrier
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- THE LEIBNIZ-DERIVATION PREDICATE over the banked `CD` product: an additive ℤ-linear
    endomorphism `D` of the terminal algebra satisfying `D (x · y) = D x · y + x · D y`.
    Physics-words-removable: this is exactly the Leibniz law for the derived product. -/
def IsDeriv (D : Module.End ℤ (CD (CD B))) : Prop :=
  ∀ x y, D (x * y) = D x * y + x * D y

/-- The zero endomorphism is a derivation. -/
theorem isDeriv_zero : IsDeriv (0 : Module.End ℤ (CD (CD B))) := by
  intro x y; simp

/-- Derivations are closed under addition. -/
theorem isDeriv_add (f g : Module.End ℤ (CD (CD B))) (hf : IsDeriv f) (hg : IsDeriv g) :
    IsDeriv (f + g) := by
  intro x y
  simp only [LinearMap.add_apply]
  rw [hf x y, hg x y]; simp only [add_mul, mul_add]; abel

/-- Derivations are closed under negation. -/
theorem isDeriv_neg (f : Module.End ℤ (CD (CD B))) (hf : IsDeriv f) : IsDeriv (-f) := by
  intro x y
  simp only [LinearMap.neg_apply]
  rw [hf x y]; simp only [neg_mul, mul_neg]; abel

/-- Derivations are closed under the `ℤ`-action. -/
theorem isDeriv_smul (n : ℤ) (f : Module.End ℤ (CD (CD B))) (hf : IsDeriv f) :
    IsDeriv (n • f) := by
  intro x y
  simp only [LinearMap.smul_apply]
  rw [hf x y, smul_add, smul_mul_assoc, mul_smul_comm]

/-- ★★ THE COMMUTATOR CLOSURE — the headline. The Lie bracket `⁅f, g⁆ = f∘g − g∘f` of two
    Leibniz-derivations is AGAIN a Leibniz-derivation. THE TRUNK REFRAME (THE ONE LAW): the
    proof uses ONLY the Leibniz law, biadditivity, and the distributivity of the `CD` product —
    it NEVER uses associativity of the terminal algebra. The cross-terms `g x · f y` and
    `f x · g y` cancel by distributivity alone; no associator appears. This is exactly why the
    derivation Lie algebra survives on the NON-associative `𝕆`: the bracket closure is a
    bilinear fact about the product, not an associative one. -/
theorem isDeriv_bracket (f g : Module.End ℤ (CD (CD B)))
    (hf : IsDeriv f) (hg : IsDeriv g) : IsDeriv ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [hg x y, hf x y]
  simp only [map_add]
  rw [hf (g x) y, hf x (g y), hg (f x) y, hg x (f y)]
  simp only [sub_mul, mul_sub]; abel

/-- `Der(𝕆)` — THE DERIVATION LIE ALGEBRA, as a `LieSubalgebra` of the (machinery) Lie
    algebra `Module.End ℤ (CD (CD B))`. The closure conditions are the banked theorems above;
    the COMMUTATOR closure `isDeriv_bracket` is what makes it a *Lie* subalgebra (closed under
    the bracket). It inherits `LieRing` + `LieAlgebra ℤ` from the ambient. -/
def derivation : LieSubalgebra ℤ (Module.End ℤ (CD (CD B))) where
  carrier := { D | IsDeriv D }
  add_mem' := isDeriv_add _ _
  zero_mem' := isDeriv_zero
  smul_mem' := isDeriv_smul
  lie_mem' := isDeriv_bracket _ _

@[simp] theorem mem_derivation {D : Module.End ℤ (CD (CD B))} :
    D ∈ derivation (B := B) ↔ IsDeriv D := Iff.rfl

/-- `Der(𝕆)` is a Lie ring (inherited from the commutator structure on the endomorphism ring). -/
instance : LieRing (derivation (B := B)) := inferInstance
/-- `Der(𝕆)` is a Lie algebra over `ℤ`. -/
instance : LieAlgebra ℤ (derivation (B := B)) := inferInstance

/-- ★ BILINEAR (left): the derivation bracket is additive in the left slot. -/
theorem deriv_lie_add_left (x y z : derivation (B := B)) :
    ⁅x + y, z⁆ = ⁅x, z⁆ + ⁅y, z⁆ := add_lie x y z

/-- ★ BILINEAR (right): the derivation bracket is additive in the right slot. -/
theorem deriv_lie_add_right (x y z : derivation (B := B)) :
    ⁅x, y + z⁆ = ⁅x, y⁆ + ⁅x, z⁆ := lie_add x y z

/-- ★ ALTERNATING: the derivation bracket of an element with itself vanishes. -/
theorem deriv_lie_self (x : derivation (B := B)) : ⁅x, x⁆ = 0 := lie_self x

/-- ★ JACOBI: the derivation bracket satisfies the Jacobi identity. -/
theorem deriv_lie_jacobi (x y z : derivation (B := B)) :
    ⁅x, ⁅y, z⁆⁆ + ⁅y, ⁅z, x⁆⁆ + ⁅z, ⁅x, y⁆⁆ = 0 := lie_jacobi x y z

/-! ### THE LIFT — building concrete derivations from base derivations.

    A base map `δ : CD B →+ CD B` lifts componentwise to `CD (CD B)`. When `δ` is itself a
    derivation of the (associative) base `CD B` and commutes with `star`, the lift is a
    derivation of the terminal algebra. This is how a nonzero derivation is exhibited. -/

/-- THE COMPONENTWISE LIFT of a base additive map to the double: `z ↦ ⟨δ z.re, δ z.im⟩`,
    packaged as a `ℤ`-linear endomorphism of `CD (CD B)`. -/
def liftEnd (δ : CD B →+ CD B) : Module.End ℤ (CD (CD B)) :=
  (AddMonoidHom.mk' (fun z => (⟨δ z.re, δ z.im⟩ : CD (CD B)))
    (by intro a b; ext <;> simp [CD.add_re, CD.add_im, map_add])).toIntLinearMap

@[simp] theorem liftEnd_apply (δ : CD B →+ CD B) (z : CD (CD B)) :
    liftEnd δ z = (⟨δ z.re, δ z.im⟩ : CD (CD B)) := rfl

/-- ★ THE LIFT IS A DERIVATION. If `δ` is a derivation of the base `CD B` (Leibniz over the
    base product) AND commutes with `star`, then `liftEnd δ` is a Leibniz-derivation of the
    terminal algebra `CD (CD B)`. The proof expands the `CD` product on both components and
    uses `δ`'s two laws; the `star` in the product formula is exactly where `star`-commutation
    is needed. No base associativity is used for the lift itself. -/
theorem liftEnd_isDeriv (δ : CD B →+ CD B)
    (hder : ∀ a b : CD B, δ (a * b) = δ a * b + a * δ b)
    (hstar : ∀ a : CD B, δ (star a) = star (δ a)) :
    IsDeriv (liftEnd δ) := by
  intro x y
  refine CD.ext ?_ ?_
  · show δ ((x * y).re) = ((liftEnd δ x) * y + x * (liftEnd δ y)).re
    simp only [mul_re, liftEnd_apply, add_re]
    rw [map_add, hder, map_neg, hder, hstar]
    abel
  · show δ ((x * y).im) = ((liftEnd δ x) * y + x * (liftEnd δ y)).im
    simp only [mul_im, liftEnd_apply, add_im]
    rw [map_add, hder, hder, hstar]
    abel

/-- THE INNER MAP `ad_q : x ↦ q · x − x · q` on the base, as an additive homomorphism. -/
def adHom (q : CD B) : CD B →+ CD B :=
  AddMonoidHom.mk' (fun x => q * x - x * q) (by intro a b; simp [mul_add, add_mul]; abel)

@[simp] theorem adHom_apply (q x : CD B) : adHom q x = q * x - x * q := rfl

/-- ★ `ad_q` IS A DERIVATION of the associative base `CD B`. (The base `CD B` is the banked
    `Ring (CD B)` — associative because `B` is commutative — so the inner derivation law holds;
    `noncomm_ring` discharges the associative-ring identity.) -/
theorem adHom_isDeriv (q : CD B) (a b : CD B) :
    adHom q (a * b) = adHom q a * b + a * adHom q b := by
  simp only [adHom_apply]; noncomm_ring

/-- ★ `ad_q` COMMUTES WITH `star` when `q` is IMAGINARY (`star q = −q`). This is the
    hypothesis the lift needs, and it holds precisely on imaginary generators. -/
theorem adHom_star_comm (q : CD B) (hq : star q = -q) (x : CD B) :
    adHom q (star x) = star (adHom q x) := by
  simp only [adHom_apply, star_sub, star_mul, hq]
  noncomm_ring

/-- THE INNER DERIVATION of the terminal algebra from an imaginary base element `q`:
    the lift of `ad_q`. A genuine `IsDeriv` whenever `star q = −q`. -/
def innerDeriv (q : CD B) : Module.End ℤ (CD (CD B)) := liftEnd (adHom q)

/-- ★ `innerDeriv q` is a derivation of the terminal algebra for imaginary `q`. -/
theorem innerDeriv_isDeriv (q : CD B) (hq : star q = -q) : IsDeriv (innerDeriv q) :=
  liftEnd_isDeriv (adHom q) (adHom_isDeriv q) (adHom_star_comm q hq)

@[simp] theorem innerDeriv_apply (q : CD B) (z : CD (CD B)) :
    innerDeriv q z = (⟨adHom q z.re, adHom q z.im⟩ : CD (CD B)) := rfl

end Carrier

/-! ## CONCRETE + ANTI-VACUITY on the cascade's terminal algebra `O ℚ`.

    `O ℚ = CD (H ℚ) = CD (CD (Dbl ℚ))` is the octonion shape with `B := Dbl ℚ` (a commutative
    `*`-ring). The base `CD B = H ℚ` is the banked associative `Ring`. The genuine
    non-commutativity of `H ℚ` (banked `not_commutative`) is what makes the inner derivation
    `ad_{e₂}` NONZERO after lifting — so the derivation Lie algebra is non-trivial. -/
section Concrete
attribute [local instance] CD.narCD CD.srCD

/-- The new generator `e₂ : H ℚ` of the last-but-one doubling is IMAGINARY. -/
theorem e2_imag_H : star (CD.e2 : H ℚ) = -(CD.e2 : H ℚ) := by ext <;> simp [CD.e2]

/-- THE CONCRETE DERIVATION on `O ℚ`: the lift of `ad_{e₂}` (inner derivation by the imaginary
    generator `e₂` of `H ℚ`). -/
def witnessDeriv : Module.End ℤ (O ℚ) := innerDeriv (CD.e2 : H ℚ)

/-- ★ `witnessDeriv` IS A DERIVATION of the terminal algebra `O ℚ`. -/
theorem witnessDeriv_isDeriv : IsDeriv witnessDeriv :=
  innerDeriv_isDeriv (CD.e2 : H ℚ) e2_imag_H

/-- The inner map `ad_{e₂}` does NOT annihilate `ι J`: `e₂ · (ι J) − (ι J) · e₂ ≠ 0`. This is
    THE THEORY-NATIVE non-vanishing — `e₂` and `ι J` do NOT commute, by the banked
    `iota_e2_comm_iff` (they commute iff `J = star J`) together with the banked `J_ne_star_J`
    (`J ≠ star J` on `Dbl ℚ`, the same `2 ≠ 0` self-blindness the trunk rests on). NOT a
    coordinate computation. -/
theorem adHom_e2_iotaJ_ne_zero : adHom (CD.e2 : H ℚ) (ιJ ℚ) ≠ 0 := by
  rw [adHom_apply, ιJ, sub_ne_zero]
  intro h
  have hcomm : CD.iota (Dbl.J : Dbl ℚ) * (CD.e2 : H ℚ)
      = CD.e2 * CD.iota (Dbl.J : Dbl ℚ) := h.symm
  rw [CD.iota_e2_comm_iff] at hcomm
  exact Dbl.J_ne_star_J (by norm_num) hcomm

/-- `witnessDeriv` does NOT annihilate `ι (ι J) : O ℚ`: its real component is `ad_{e₂}(ι J) ≠ 0`. -/
theorem witnessDeriv_iotaiotaJ_ne_zero :
    witnessDeriv (CD.iota (ιJ ℚ) : O ℚ) ≠ 0 := by
  intro h
  apply adHom_e2_iotaJ_ne_zero
  have hre := congrArg CD.re h
  simpa [witnessDeriv, innerDeriv_apply, CD.iota] using hre

/-- ★★ `witnessDeriv` IS NONZERO — the derivation Lie algebra of the terminal algebra is
    NON-TRIVIAL (not the zero algebra). Anti-vacuity (docs/RUNBOOK.md W8). -/
theorem witnessDeriv_ne_zero : witnessDeriv ≠ 0 := by
  intro h
  apply witnessDeriv_iotaiotaJ_ne_zero
  rw [h]; rfl

/-- ★★ NON-VACUITY, packaged: a CONCRETE NONZERO derivation exists on the terminal algebra
    `O ℚ`. The Leibniz-derivations of `O ℚ` form a Lie algebra (the `Carrier` section) that is
    genuinely non-trivial. -/
theorem derivation_nontrivial :
    ∃ D : Module.End ℤ (O ℚ), IsDeriv D ∧ D ≠ 0 :=
  ⟨witnessDeriv, witnessDeriv_isDeriv, witnessDeriv_ne_zero⟩

/-- ★★ The derivation Lie algebra `Der(O ℚ)` is NOT the trivial (bottom) subalgebra. -/
theorem derivation_ne_bot : derivation (B := Dbl ℚ) ≠ ⊥ := by
  intro h
  apply witnessDeriv_ne_zero
  have hmem : witnessDeriv ∈ derivation (B := Dbl ℚ) := witnessDeriv_isDeriv
  rw [h] at hmem
  simpa using hmem

end Concrete

end Phys.Algebra
