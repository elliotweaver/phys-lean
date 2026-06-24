/-
  Phys.Algebra.DerivationSkew — N17: the ℚ-MODULE STRUCTURE of the terminal algebra
  and the STRUCTURAL REDUCTION `Der(𝕆) ⊆ so(Born)` (the route to `dim = 14 = dim g₂`).
  ===========================================================================
  N6 (`Phys/Algebra/Derivation.lean`) banked `Der(𝕆)` — the Leibniz-derivations of the
  terminal algebra `𝕆 = CD (CD B)` form a Lie algebra under the commutator, with a
  concrete nonzero witness on `O ℚ`. N16 (`Phys/Algebra/DerivationDim.lean`) banked the
  first structural constraint: every derivation kills the unit (`deriv_one`, `D 1 = 0`),
  and CONFIRMED by faithful exact-rational numerics (workbench/N16-g2-dimension) that
  `dim_ℚ Der(O ℚ) = 14`, every derivation being SKEW for the Born self-overlap form
  (`Der ⊆ so(7)`), which cuts the algebra to `g₂` (dim 14).

  THIS MODULE banks the next forward structural layer N16 W3-scoped to the dissolution
  child: the ℚ-MODULE STRUCTURE on the terminal algebra (the linear-algebra machinery
  the dimension count is phrased in) and the SKEW-ADJOINTNESS `Der(O ℚ) ⊆ so(Born)` —
  derived FORWARD from the banked Leibniz predicate `IsDeriv`, with NO posited `G₂` /
  `LieAlgebra.g2` import that would ASSERT the count or the orthogonal containment.

  ★ THE TRUNK REFRAME (docs/STANDARD.md THE ONE LAW). The literature derives
  `Der ⊆ so(7)` by a coordinate skew-matrix computation over the 8 octonion coordinates
  — the W9 monolithic-brute-on-coordinates signature (docs/RUNBOOK.md W9). The TRUNK
  gives the SAME containment COORDINATE-FREE: the Born self-overlap `x · star x` is
  SELF-CONJUGATE (`star (x · star x) = x · star x`, from anti-multiplicative + involutive
  `star`), and a derivation KILLS every self-conjugate (real) element — because
  `D (star x) = − D x` and the carrier is 2-torsion-free (char 0 via the derived ℚ).
  So `D (x · star x) = 0`, which by the Leibniz law IS the skew-adjointness
  `D x · star x = x · D x`. Polarizing gives the bilinear skew. NO 8-coordinate
  expansion, NO 512×64 rank — the W9 monolith is entirely AVOIDED for the structural
  reduction. The Born self-overlap (the trunk's positivity) IS the inner product `g₂`
  is orthogonal to; the containment falls straight out of self-conjugacy.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0; N3/N4/N5/N6/N16 held it). The
  division-algebra-physics field POSITS `𝕆` and reads `dim G₂ = 14` / `Der(𝕆) = g₂` off
  by hand. Here the ℚ-module structure and the orthogonal containment are PROVED forward
  from `IsDeriv`. No Mathlib `LieAlgebra.g2` / `G₂` is imported to ASSERT anything.

  WHAT IS BANKED HERE (forward, foundations-only):
    cdSmulQ / cdModuleQ / dblModuleQ  — the ℚ-MODULE structure on the cascade carriers
                       `Dbl ℚ`, `H ℚ`, `O ℚ` (componentwise; machinery on the DERIVED
                       object, STANDARD §3 — like `Matrix`/`Module` at N3/N4, NOT a
                       posited number system).
    deriv_qsmul      — every ℤ-linear derivation is automatically ℚ-LINEAR.
    trace_id         — `x + star x = (2 reQ x) • 1` (the real trace lands on the unit).
    deriv_star       — ★ `D (star x) = − D x`: a derivation reflects conjugation.
    deriv_real_zero  — ★ a derivation KILLS every self-conjugate (real) element.
    selfMul_selfconj — `x · star x` is self-conjugate (the Born self-overlap is real).
    deriv_norm_preserve — ★★ `D x · star x = x · D x`: the skew-adjointness for the Born
                       self-overlap, i.e. the containment `Der(O ℚ) ⊆ so(Born) = so(7)`,
                       COORDINATE-FREE. The structural reduction the dimension count rests
                       on (so(7), dim ≤ 21, then the cut to g₂, dim 14).
    deriv_skew_polar — ★ the polarized bilinear form of the skew-adjointness.

  THE EXACT DIMENSION (`dim_ℚ Der(O ℚ) = 14`, the so(7)→g₂ cut 21→14 — a fully-expanded
  octonion-coordinate rank/span, the W9 instrument wall) and the explicit `g₂` basis +
  bracket structure constants + the `≅ g₂` Lie isomorphism are the dedicated downstream
  W1/W9 dissolution child (N18), NOT this node. The numerics + the explicit 14-element
  basis are recorded in workbench/N17-g2-dimension/FINDINGS.md as the child's start.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "gauge / g₂ / automorphism /
  orthogonal": what remains is the pure statement that every Leibniz-derivation of the
  Cayley–Dickson double of a double is skew-adjoint for the self-overlap form
  `(x,y) ↦ (x · star y).re…` — i.e. annihilates `x · star x`. No theorem STATEMENT needs
  a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationDim
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

/-! ## THE ℚ-MODULE STRUCTURE on the cascade carriers.

    `O ℚ = CD (CD (Dbl ℚ))` carries (via the banked `narCD`) a `NonAssocRing`, hence an
    `AddCommGroup`, but `Module ℚ (O ℚ)` does NOT synthesize on its own (measured at
    N16). It is built here componentwise from `SMul ℚ` on the base — this is standard
    linear-algebra MACHINERY applied to the DERIVED octonion object (docs/STANDARD.md §3,
    exactly as N4 used `Module`/`Subring` on the derived endomorphisms), NOT a posited
    number system: the OBJECT is the derived `O ℚ`, ℚ is the coefficient field the
    `Module`/`finrank` statement is written in. -/

section ModuleStructure
variable {A : Type*}

/-- The componentwise ℚ-action on the Cayley–Dickson double. -/
instance cdSmulQ [SMul ℚ A] : SMul ℚ (CD A) := ⟨fun q z => ⟨q • z.re, q • z.im⟩⟩

@[simp] theorem cd_qsmul_re [SMul ℚ A] (q : ℚ) (z : CD A) : (q • z).re = q • z.re := rfl
@[simp] theorem cd_qsmul_im [SMul ℚ A] (q : ℚ) (z : CD A) : (q • z).im = q • z.im := rfl

/-- The ℚ-MODULE structure on the double, given one on the base. Machinery on the
    DERIVED object — built componentwise, the module axioms reduced to the base's. -/
@[reducible] def cdModuleQ [NonAssocRing A] [StarRing A] [Module ℚ A] :
    @Module ℚ (CD A) _ (by letI := CD.narCD (A := A); infer_instance) := by
  letI := CD.narCD (A := A)
  exact
    { one_smul := by intro z; ext <;> simp
      mul_smul := by intro a b z; ext <;> simp [mul_smul]
      smul_zero := by intro a; ext <;> simp
      smul_add := by intro a x y; ext <;> simp [smul_add]
      add_smul := by intro a b z; ext <;> simp [add_smul]
      zero_smul := by intro z; ext <;> simp }

end ModuleStructure

/-- The ℚ-MODULE structure on the cascade's rung-1 algebra `Dbl ℚ` (the base of the
    tower). Componentwise over the `SMul ℚ (Dbl ℚ)` the cascade already carries. -/
@[reducible] def dblModuleQ : Module ℚ (Dbl ℚ) := by
  exact
    { one_smul := by intro z; ext <;> simp
      mul_smul := by intro a b z; ext <;> simp [mul_assoc]
      smul_zero := by intro a; ext <;> simp
      smul_add := by intro a x y; ext <;> simp [mul_add]
      add_smul := by intro a b z; ext <;> simp [add_mul]
      zero_smul := by intro z; ext <;> simp }

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- `Module ℚ (H ℚ)` — the rung-2 algebra `H ℚ = CD (Dbl ℚ)` as a ℚ-vector space. -/
noncomputable instance instModuleQH : Module ℚ (H ℚ) := cdModuleQ (A := Dbl ℚ)

/-- ★ `Module ℚ (O ℚ)` — THE TERMINAL ALGEBRA as an 8-dimensional ℚ-vector space. The
    measured-missing infrastructure N16 W3-scoped to this node, built as machinery on
    the DERIVED object (NOT a posited number system, docs/STANDARD.md §3). -/
noncomputable instance instModuleQO : Module ℚ (O ℚ) := cdModuleQ (A := H ℚ)

/-! ## THE STRUCTURAL REDUCTION `Der(O ℚ) ⊆ so(Born)` — coordinate-free. -/

/-- The deep-real (scalar) component of an octonion: its coordinate on the unit. -/
def reQ (x : O ℚ) : ℚ := x.re.re.re

/-- THE TRACE IDENTITY: `x + star x = (2 reQ x) • 1`. The symmetric (real) part of an
    octonion lands on the unit line — `star` negates every imaginary coordinate, so only
    the deep-real coordinate survives the sum, doubled. -/
theorem trace_id (x : O ℚ) : x + star x = (2 * reQ x) • (1 : O ℚ) := by
  ext <;> simp [reQ] <;> ring

/-- ★ Every ℤ-linear derivation of the terminal algebra is ℚ-LINEAR. A ℤ-linear map
    between ℚ-vector spaces automatically respects the ℚ-action (Mathlib `map_rat_smul`),
    so derivations act ℚ-linearly — what the skew reduction needs to kill ℚ-scalars. -/
theorem deriv_qsmul (D : Module.End ℤ (O ℚ)) (q : ℚ) (x : O ℚ) :
    D (q • x) = q • D x := map_rat_smul D q x

/-- ★ A DERIVATION REFLECTS CONJUGATION: `D (star x) = − D x`. From the trace identity
    `star x = (2 reQ x) • 1 − x`, the ℚ-linearity of `D`, and `D 1 = 0` (banked
    `deriv_one`): the real part is killed and only `−x` survives. -/
theorem deriv_star (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    D (star x) = - D x := by
  have hstar : star x = (2 * reQ x) • (1 : O ℚ) - x := by
    have h := trace_id x; rw [eq_sub_iff_add_eq, add_comm]; exact h
  rw [hstar, map_sub, deriv_qsmul, deriv_one D hD, smul_zero, zero_sub]

/-- ★ A DERIVATION KILLS EVERY SELF-CONJUGATE (REAL) ELEMENT: `star x = x → D x = 0`.
    Strengthens `deriv_one` from the unit to the whole real axis: from `D (star x) =
    − D x` and `star x = x` we get `D x = − D x`, so `(2 : ℚ) • D x = 0`; scaling by
    `1/2` in the ℚ-module gives `D x = 0` (the 2-torsion-freeness of the derived ℚ
    made load-bearing — the same self-blindness 2≠0 the trunk rests on). -/
theorem deriv_real_zero (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = x) : D x = 0 := by
  have h := deriv_star D hD x
  rw [hx] at h
  have hsum : D x + D x = 0 := add_eq_zero_iff_eq_neg.mpr h
  have h2 : (2 : ℚ) • D x = 0 := by rw [two_smul]; exact hsum
  have h3 : ((1 / 2 : ℚ) * 2) • D x = (1 / 2 : ℚ) • ((2 : ℚ) • D x) := by rw [mul_smul]
  rw [h2, smul_zero] at h3
  simpa using h3

/-- THE BORN SELF-OVERLAP IS SELF-CONJUGATE: `star (x · star x) = x · star x`. From the
    anti-multiplicative + involutive `star` of the `*`-ring — the trunk's positivity
    (`x · star x` is the self-overlap form, lands real). NO coordinates. -/
theorem selfMul_selfconj (x : O ℚ) : star (x * star x) = x * star x := by
  rw [star_mul, star_star]

/-- ★★ THE SKEW-ADJOINTNESS `Der(O ℚ) ⊆ so(Born) = so(7)`, COORDINATE-FREE. For every
    derivation, `D x · star x = x · D x`. PROOF (THE TRUNK REFRAME): the Born self-overlap
    `x · star x` is self-conjugate (`selfMul_selfconj`), so a derivation kills it
    (`deriv_real_zero`); expanding `D (x · star x) = 0` by Leibniz and `D (star x) = − D x`
    gives `D x · star x − x · D x = 0`. This is skew-adjointness for the self-overlap
    form: the structural reduction placing `Der` inside the orthogonal Lie algebra of the
    Born form (so(7), dim ≤ 21), the route the dimension count (= 14 = dim g₂) descends.
    NO 8-coordinate expansion — the W9 monolith is avoided by attacking from the trunk. -/
theorem deriv_norm_preserve (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    D x * star x = x * D x := by
  have hzero : D (x * star x) = 0 := deriv_real_zero D hD _ (selfMul_selfconj x)
  rw [hD x (star x), deriv_star D hD x, mul_neg] at hzero
  linear_combination (norm := abel) hzero

/-- ★ THE POLARIZED SKEW-ADJOINTNESS (the bilinear form of `deriv_norm_preserve`):
    `D x · star y + D y · star x = x · D y + y · D x`. Polarizing the diagonal identity
    in `x + y` and subtracting the two diagonal terms. The symmetric bilinear statement
    of `Der ⊆ so(Born)`, valid for all pairs. -/
theorem deriv_skew_polar (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x y : O ℚ) :
    D x * star y + D y * star x = x * D y + y * D x := by
  have hxy := deriv_norm_preserve D hD (x + y)
  have hx := deriv_norm_preserve D hD x
  have hy := deriv_norm_preserve D hD y
  simp only [map_add, star_add, mul_add, add_mul] at hxy
  linear_combination (norm := abel) hxy - hx - hy

/-! ## ANTI-VACUITY on the cascade's terminal algebra `O ℚ` (docs/RUNBOOK.md W8).

    The skew-adjointness is non-vacuous: the banked NONZERO witness derivation `witnessDeriv`
    (N6) satisfies it while being a genuinely nonzero map. -/

/-- ★★ THE BANKED NONZERO DERIVATION IS SKEW-ADJOINT: `witnessDeriv x · star x =
    x · witnessDeriv x` for all `x`. The structural reduction holds for the concrete
    nonzero witness (banked `witnessDeriv_ne_zero`), so `Der(O ℚ) ⊆ so(Born)` has teeth —
    it is not the statement "the zero map is skew". -/
theorem witnessDeriv_skew (x : O ℚ) :
    witnessDeriv x * star x = x * witnessDeriv x :=
  deriv_norm_preserve witnessDeriv witnessDeriv_isDeriv x

end Phys.Algebra
