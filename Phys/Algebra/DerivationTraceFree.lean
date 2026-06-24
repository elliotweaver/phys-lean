/-
  Phys.Algebra.DerivationTraceFree — N18: the TRACE-FREE / Im-PRESERVING refinement
  of the structural reduction `Der(O ℚ) ⊆ so(Born)`, derived COORDINATE-FREE.
  ===========================================================================
  N17 (`Phys/Algebra/DerivationSkew.lean`) banked the SKEW-ADJOINTNESS
  `deriv_norm_preserve : D x · star x = x · D x` — the containment
  `Der(O ℚ) ⊆ so(Born) = so(7)` (dim ≤ 21), derived COORDINATE-FREE from the trunk
  (the Born self-overlap `x · star x` is self-conjugate, so a derivation kills it;
  Leibniz turns that into skew-adjointness). That is the FIRST of the structural
  constraints the faithful exact-rational numerics (workbench/N16-g2-dimension)
  record for EVERY derivation of the terminal algebra. The numerics record FOUR:
    (1) D 1 = 0                        — banked N16 (`deriv_one`).
    (2) skew (M = −Mᵀ ⟹ Der ⊆ so(7))  — banked N17 (`deriv_norm_preserve`).
    (3) D maps INTO the imaginary subspace (row 0 of M is zero — TRACE-FREE).
    (4) D commutes with conjugation (`D (star x) = star (D x)`).
  THIS MODULE banks the two N17 did NOT — (3) and (4) — derived FORWARD from the
  banked skew reduction, with NO posited `G₂`/`LieAlgebra.g2` import and NO
  fully-expanded-octonion-coordinate rank (the W9 monolith). Together with N16/N17
  the QUALITATIVE so(7) picture is now COMPLETE in Lean: every derivation is
  skew, trace-free, and conjugation-commuting — exactly the four structural
  constraints that, in the literature, cut so(7) (dim 21) toward g₂ (dim 14).

  ★ THE TRUNK REFRAME (docs/STANDARD.md THE ONE LAW). The literature reads
  trace-freeness off the 8-octonion-coordinate skew matrix (`M = −Mᵀ` ⟹ row 0 = 0)
  — the W9 monolithic-brute-on-coordinates signature (docs/RUNBOOK.md W9). The
  TRUNK gives it COORDINATE-FREE. For imaginary `x` (`star x = −x`), the banked
  skew-adjointness gives the JORDAN/BORN ANTICOMMUTATION `D x · x + x · D x = 0`
  (`deriv_jordan_anticomm`); conjugating it (a derivation reflects `star`, N17
  `deriv_star`) gives the same anticommutation for `star (D x)`; adding the two and
  using the trace identity `D x + star (D x) = (2 reQ (D x)) • 1` (N17 `trace_id`,
  the symmetric part lands on the unit line) collapses everything to
  `(4 reQ (D x)) • x = 0`; for `x` imaginary nonzero, the derived ℚ (a field, no
  zero-smul-divisors via the inverse) forces `reQ (D x) = 0`. The general case
  reduces to the imaginary part (the real part is killed by N16 `deriv_one` +
  ℚ-linearity). NO 8-coordinate expansion, NO 512×64 rank — the W9 monolith is
  entirely AVOIDED by attacking from the trunk, exactly as at N17.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0; N3/N4/N5/N6/N16/N17 held it). The
  division-algebra-physics field POSITS `𝕆` and reads `Der(𝕆) = g₂` (and its
  trace-free/orthogonal structure) off by hand. Here every constraint is PROVED
  FORWARD from `IsDeriv` + the banked skew reduction. No Mathlib `LieAlgebra.g2` /
  `G₂` is imported to ASSERT anything.

  WHAT IS BANKED HERE (forward, foundations-only):
    smul_one_mul / mul_smul_one / star_smul_one
                       — the scalar-on-the-unit machinery (`(c•1)·x = c•x`, etc.),
                         the componentwise linear-algebra the trace identity needs.
    deriv_jordan_anticomm — ★ for imaginary `x`: `D x · x + x · D x = 0` (the
                         Jordan/Born ANTICOMMUTATION — the skew-adjointness in its
                         diagonal form on the imaginary axis).
    deriv_reflect      — `D x · x = star x · D x` (the reflected skew form).
    deriv_re_smul_zero — for imaginary `x`: `(4 reQ (D x)) • x = 0`.
    deriv_reQ_zero_imag / deriv_reQ_zero
                       — ★★ TRACE-FREE: `reQ (D x) = 0` for every `x` (the real
                         part of every derivation output vanishes — `D` maps `O`
                         into the 7-dim imaginary subspace).
    deriv_maps_im      — ★★ `star (D x) = − D x`: every derivation output is purely
                         imaginary (the involution-form of trace-freeness).
    deriv_comm_star    — ★ `D (star x) = star (D x)`: a derivation COMMUTES with
                         conjugation (numerics check 4).

  THE EXACT DIMENSION (`dim_ℚ Der(O ℚ) = 14`, the so(7)→g₂ cut 21→14 — a finrank
  statement needing finite-dimensionality infra on `O ℚ` + the representation cut,
  the W9 instrument wall) and the explicit `g₂` basis + bracket structure constants
  + the `≅ g₂` Lie isomorphism remain the dedicated downstream W1/W9 dissolution
  child (N19), NOT this node. The numerics + the explicit 14-element basis are in
  workbench/N16-g2-dimension/ (re-verified N18) as the child's start.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "gauge / g₂ / automorphism
  / orthogonal / trace": what remains is the pure statement that every
  Leibniz-derivation of the Cayley–Dickson double of a double annihilates the real
  part of every output (`reQ (D x) = 0`) and commutes with the involution. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationSkew
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## THE SCALAR-ON-THE-UNIT MACHINERY.

    The trace identity `D x + star (D x) = (2 reQ (D x)) • 1` puts the symmetric
    part of a derivation output on the unit line; turning the anticommutation into
    a scalar multiple of `x` needs `(c • 1) · x = c • x` and `x · (c • 1) = c • x`
    (the ℚ-scalar on the unit acts as the ℚ-action). Proved componentwise on the
    DERIVED `Module ℚ (O ℚ)` — standard linear-algebra machinery, not a posit. -/

/-- `(c • 1) · x = c • x`: a ℚ-scalar multiple of the unit left-multiplies as the
    ℚ-action. -/
theorem smul_one_mul (c : ℚ) (x : O ℚ) : (c • (1 : O ℚ)) * x = c • x := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im]

/-- `x · (c • 1) = c • x`: a ℚ-scalar multiple of the unit right-multiplies as the
    ℚ-action. -/
theorem mul_smul_one (c : ℚ) (x : O ℚ) : x * (c • (1 : O ℚ)) = c • x := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im]

/-- `star (c • 1) = c • 1`: the unit line is fixed by conjugation. -/
theorem star_smul_one (c : ℚ) : star ((c • (1 : O ℚ))) = c • (1 : O ℚ) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im]

/-! ## THE TRACE-FREE / Im-PRESERVING REDUCTION — coordinate-free. -/

/-- ★ THE JORDAN/BORN ANTICOMMUTATION. For an IMAGINARY element (`star x = −x`),
    every derivation satisfies `D x · x + x · D x = 0`. This is the banked
    skew-adjointness `deriv_norm_preserve` (`D x · star x = x · D x`) read on the
    imaginary axis (`star x = −x`): the diagonal/Jordan form of `Der ⊆ so(Born)`. -/
theorem deriv_jordan_anticomm (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : D x * x + x * D x = 0 := by
  have h := deriv_norm_preserve D hD x
  rw [hx, mul_neg] at h
  linear_combination (norm := abel) -h

/-- THE REFLECTED SKEW FORM: `D x · x = star x · D x`. From `deriv_norm_preserve`
    at `star x` together with `star (star x) = x` and `D (star x) = − D x`. -/
theorem deriv_reflect (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    D x * x = star x * D x := by
  have h := deriv_norm_preserve D hD (star x)
  rw [star_star, deriv_star D hD x, neg_mul, mul_neg] at h
  linear_combination (norm := abel) -h

/-- For IMAGINARY `x`, the symmetric part of the derivation output `reQ (D x)`
    multiplies `x` to zero: `(4 reQ (D x)) • x = 0`. The Jordan anticommutation
    (`deriv_jordan_anticomm`) plus its conjugate, summed and collapsed by the trace
    identity (the symmetric part lands on the central unit line). -/
theorem deriv_re_smul_zero (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : (4 * reQ (D x)) • x = 0 := by
  have hiii := deriv_jordan_anticomm D hD x hx
  -- conjugate of (iii): `x · star (D x) + star (D x) · x = 0`.
  have hiv : x * star (D x) + star (D x) * x = 0 := by
    have hs : star (D x * x + x * D x) = 0 := by rw [hiii]; exact star_zero _
    rw [star_add, star_mul, star_mul, hx, neg_mul, mul_neg] at hs
    linear_combination (norm := abel) -hs
  -- sum: `(D x + star (D x)) · x + x · (D x + star (D x)) = 0`.
  have hsum : (D x + star (D x)) * x + x * (D x + star (D x)) = 0 := by
    rw [add_mul, mul_add]
    linear_combination (norm := abel) hiii + hiv
  -- trace identity: `D x + star (D x) = (2 reQ (D x)) • 1` collapses to `(4 reQ (D x)) • x`.
  rw [trace_id (D x), smul_one_mul, mul_smul_one, ← add_smul] at hsum
  have h4 : (2 * reQ (D x) + 2 * reQ (D x)) = 4 * reQ (D x) := by ring
  rwa [h4] at hsum

/-- ★★ TRACE-FREE on IMAGINARIES: for `x` with `star x = −x`, `reQ (D x) = 0`. If
    `reQ (D x) ≠ 0`, then `(4 reQ (D x))` is an invertible ℚ-scalar, so
    `(4 reQ (D x)) • x = 0` forces `x = 0` (the derived ℚ is a field), whence
    `D x = 0` and `reQ (D x) = 0` — contradiction. The 2-torsion-freeness/field
    structure of the derived ℚ made load-bearing, as at N17 `deriv_real_zero`. -/
theorem deriv_reQ_zero_imag (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = -x) : reQ (D x) = 0 := by
  have h := deriv_re_smul_zero D hD x hx
  by_contra hc
  have hc4 : (4 * reQ (D x)) ≠ 0 := by
    intro h0
    rcases mul_eq_zero.mp h0 with h1 | h1
    · norm_num at h1
    · exact hc h1
  have hx0 : x = 0 := by
    have hcong := congrArg (fun z => (4 * reQ (D x))⁻¹ • z) h
    simp only [smul_smul, inv_mul_cancel₀ hc4, one_smul, smul_zero] at hcong
    exact hcong
  apply hc
  rw [hx0, map_zero]
  simp [reQ]

/-- ★★ TRACE-FREE (general): `reQ (D x) = 0` for EVERY `x`. The real part of every
    derivation output vanishes — `D` maps the terminal algebra INTO its 7-dimensional
    imaginary subspace (numerics check 3, `M`'s row 0 is zero). The general element
    reduces to its imaginary part `x − (reQ x) • 1`: the real part is killed by
    `deriv_one` + ℚ-linearity (`D ((reQ x) • 1) = (reQ x) • D 1 = 0`), and the
    imaginary part is handled by `deriv_reQ_zero_imag`. -/
theorem deriv_reQ_zero (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    reQ (D x) = 0 := by
  set c : ℚ := reQ x with hc
  set xi : O ℚ := x - c • (1 : O ℚ) with hxi
  have himag : star xi = -xi := by
    have htr : x + star x = (2 * c) • (1 : O ℚ) := trace_id x
    have hsx : star x = (2 * c) • (1 : O ℚ) - x := by linear_combination (norm := abel) htr
    rw [hxi, star_sub, star_smul_one, hsx, two_mul, add_smul]
    abel
  have hDeq : D x = D xi := by
    rw [hxi, map_sub, deriv_qsmul, deriv_one D hD, smul_zero, sub_zero]
  rw [hDeq]
  exact deriv_reQ_zero_imag D hD xi himag

/-- ★★ EVERY DERIVATION OUTPUT IS PURELY IMAGINARY: `star (D x) = − D x`. The
    involution-form of trace-freeness — the symmetric part `D x + star (D x) =
    (2 reQ (D x)) • 1` vanishes because `reQ (D x) = 0` (`deriv_reQ_zero`). So `D`
    maps `O ℚ` into the `star`-anti-fixed (imaginary) subspace `so(7)` acts on. -/
theorem deriv_maps_im (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    star (D x) = - D x := by
  have h := trace_id (D x)
  rw [deriv_reQ_zero D hD x] at h
  simp only [mul_zero, zero_smul] at h
  linear_combination (norm := abel) h

/-- ★ A DERIVATION COMMUTES WITH CONJUGATION: `D (star x) = star (D x)` (numerics
    check 4). Combines `deriv_star` (`D (star x) = − D x`) with `deriv_maps_im`
    (`star (D x) = − D x`): both equal `− D x`. -/
theorem deriv_comm_star (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    D (star x) = star (D x) := by
  rw [deriv_star D hD x, deriv_maps_im D hD x]

/-! ## ANTI-VACUITY on the cascade's terminal algebra `O ℚ` (docs/RUNBOOK.md W8).

    The trace-free / conjugation-commuting constraints are non-vacuous: the banked
    NONZERO witness derivation `witnessDeriv` (N6) satisfies them while being a
    genuinely nonzero map. -/

/-- ★ THE BANKED NONZERO DERIVATION IS TRACE-FREE: `reQ (witnessDeriv x) = 0` for
    all `x`. The constraint has teeth — it is not the statement "the zero map is
    trace-free" (banked `witnessDeriv_ne_zero`). -/
theorem witnessDeriv_reQ_zero (x : O ℚ) : reQ (witnessDeriv x) = 0 :=
  deriv_reQ_zero witnessDeriv witnessDeriv_isDeriv x

/-- ★ THE BANKED NONZERO DERIVATION MAPS INTO Im: `star (witnessDeriv x) =
    − witnessDeriv x`. -/
theorem witnessDeriv_maps_im (x : O ℚ) :
    star (witnessDeriv x) = - witnessDeriv x :=
  deriv_maps_im witnessDeriv witnessDeriv_isDeriv x

/-- ★ THE BANKED NONZERO DERIVATION COMMUTES WITH CONJUGATION. -/
theorem witnessDeriv_comm_star (x : O ℚ) :
    witnessDeriv (star x) = star (witnessDeriv x) :=
  deriv_comm_star witnessDeriv witnessDeriv_isDeriv x

end Phys.Algebra
