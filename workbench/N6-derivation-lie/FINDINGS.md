
## ROUTE DECISIONS (post-probe, frozen — all scratch probes compiled clean ~6s each, well under KILL 90s)

REPRESENTATION = (A): `Module.End ℤ (CD (CD B))` is an associative ring; Mathlib gives `LieRing`
+ `LieAlgebra ℤ` on it FOR FREE (machinery on the DERIVED object, NOT a posited Lie structure).
The derivations are a `LieSubalgebra ℤ (Module.End ℤ (CD (CD B)))` carved by `IsDeriv`. The
bilinear/alternating/Jacobi properties are then the standard Lie-bracket facts (`add_lie`/`lie_add`,
`lie_self`, `lie_jacobi`) — exposed as explicit named theorems so the ticket's three properties are
unmissable. The ONLY thing WE prove for the subalgebra is membership closure: zero/add/neg/smul +
★ the COMMUTATOR closure `isDeriv_bracket`.

CONFIRMED (scratch, all foundations-likely, all ~6s):
- probe3/probe4: `isDeriv_bracket` closes by `LinearMap.sub_apply`+`Module.End.mul_apply`, expand
  Leibniz twice, `simp [sub_mul, mul_sub]`, `abel` — STRUCTURAL (biadditivity + distributivity over
  the AddCommGroup `CD (CD B)`), NO associativity of 𝕆. THE TRUNK REFRAME vindicated.
- probe4: the `LieSubalgebra` builds (drop `neg_mem'` — auto for a ℤ-submodule); `LieRing` +
  `LieAlgebra ℤ` on the subalgebra resolve by inferInstance; add_lie/lie_add/lie_self compile.
  Jacobi: use the `⁅⁅x,y⁆,z⁆ + ⁅⁅y,z⁆,x⁆ + ⁅⁅z,x⁆,y⁆ = 0` form via `lie_jacobi`-equivalent
  (Mathlib `lie_jacobi` is the `⁅x,⁅y,z⁆⁆+…` form; `leibniz_lie` is the other). Use whichever closes.
- probe5: smul-mul interchange = `smul_mul_assoc` / `mul_smul_comm`.
- probe_lift2: the componentwise LIFT `dlift δ z = ⟨δ z.re, δ z.im⟩` satisfies Leibniz on `CD A`
  GIVEN δ additive + δ-Leibniz + δ-star-commute. Proof: `ext`, CD product simp lemmas, rw δ's laws,
  `abel`. NO base associativity needed for the lift itself.
- probe_lift: `ad_q (x) = q*x - x*q` is a derivation of the ASSOCIATIVE `H ℚ` (`noncomm_ring`) and
  STAR-COMMUTES when `star q = -q` (q imaginary) — `rw [star_sub, star_mul, star_mul, hq]; noncomm_ring`.
- probe_wit: NONZERO is THEORY-NATIVE, not a coordinate bash (W5: the simp-coordinate route fought me
  → reframed): `ad_{e₂}(ιJ) ≠ 0` because `e₂` and `ιJ` do NOT commute — banked `CD.iota_e2_comm_iff`
  + `Dbl.J_ne_star_J`. Closes in 6s.

WITNESS (concrete nonzero derivation on O ℚ): generic over B, instantiated B := Dbl ℚ.
  base CD B = H ℚ (associative Ring, banked); q := e₂ : H ℚ (imaginary, star e₂ = -e₂);
  innerDeriv q := liftEnd (adHom q) : Module.End ℤ (O ℚ); IsDeriv via liftEnd_isDeriv; nonzero via
  witnessDeriv (CD.iota (ιJ ℚ)) having re-component ad_{e₂}(ιJ) ≠ 0.

COSTUME: `IsDeriv (1 : Module.End ℤ (O ℚ))` (the identity) — id(x*y)=x*y but id x*y + x*id y = 2(x*y),
  reduces to x*y = 0 at a witness with x*y ≠ 0. Identity is NOT a Leibniz-derivation. Fails to compile.

NUMERICS (numerics.py, exact rational, faithful to banked CD product/star) — ALL PASS:
  H ℚ associative; O ℚ non-associative; id FAILS Leibniz (costume bites); ad_{e₂} a derivation of
  H ℚ + star-commutes; lift to O ℚ a derivation + NONZERO; commutator-closure + alternating + Jacobi
  hold on genuine lifted derivations; the x↦x-star x projection is NOT a derivation (non-example).

COMPILE COST: every obligation measured ~5-9s in isolated scratch. NO W9 pressure, NO maxHeartbeats
inflation, NO monolithic ring on expanded O ℚ coordinates. The structure route keeps it bounded.
