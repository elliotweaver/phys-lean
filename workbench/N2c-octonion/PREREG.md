# N2c — PREREG (frozen before production Lean)

Node: rung 3 (𝕆 = CD(ℍ), lose associativity) + THE PROVED STOP (S = CD(𝕆) loses the
composition / Born self-overlap law; zero divisors appear). Derived FORWARD by the one
banked doubling operation `CD` (Phys/Cascade/Double.lean). No Mathlib Octonion/Zorn import.

## The forced claims (each must become a foundations-only theorem)

### Rung 3 — 𝕆 = CD(ℍ): associativity LOST, caused EXACTLY by ℍ non-commutativity
THE ONE CAUSE (generic, to add to Double.lean):
  CD.iota_iota_e2_assoc_iff : (ι a · ι b) · e₂ = ι a · (ι b · e₂)  ↔  a · b = b · a
  (the associator of (ι a, ι b, e₂) vanishes IFF the base elements a,b commute)
Hand-derivation (Lean CD product (z.re·w.re − star(w.im)·z.im , w.im·z.re + z.im·star(w.re))):
  ι a · ι b = ι(ab);   (ι a · ι b)·e₂ = (0, ab);   ι a·(ι b·e₂) = ι a·(0,b) = (0, ba).
  ⇒ equal iff ab = ba.   [VERIFY numerically below]
Application: base ℍ, witness a = ιJ, b = e₂ (the rung-2 NON-commuting pair). Since
  (ιJ)·e₂ ≠ e₂·(ιJ)  (banked not_commutative_witness), the triple does NOT associate in 𝕆.
  ⇒ not_associative : ¬ ∀ x y z : O ℚ, (x*y)*z = x*(y*z).

### THE STOP — S = CD(𝕆): division fails (zero divisor) ⇒ composition/Born law fails
Witness (banked FINDINGS, exact rational, Lean convention): (e₁+e₁₀)(e₅+e₁₄) = 0 in S = CD(O ℚ).
  x = e₁ + e₁₀  (nonzero),  y = e₅ + e₁₄  (nonzero),  x·y = 0.   [VERIFY nested literal below]
Born = self-overlap positivity form Q(z) = Σ (16 coords)²:
  Q x = 2,  Q y = 2,  Q(x·y) = Q 0 = 0  ⇒  Q(x·y) = 0 ≠ 4 = Q x · Q y.
  The composition / Born self-overlap law N(zw)=N(z)N(w) FAILS at S = the PROVED STOP.

## GO / NO-GO
GO iff the probe confirms (exact arithmetic, Lean convention):
  G1. assoc-iff: (ιa·ιb)·e₂ == ιa·(ιb·e₂)  ⟺  ab==ba  (test commuting + non-commuting a,b).
  G2. 𝕆 non-assoc witness: with a=ιJ, b=e₂ in H, the O-triple (ιa,ιb,e₂_O) does NOT associate.
  G3. zero divisor: the EXACT nested literal for x=e₁+e₁₀, y=e₅+e₁₄ gives x·y == 0 in S.
  G4. anti-vacuity: x ≠ 0, y ≠ 0, and Q x = Q y = 2, Q(x·y) = 0.

## KILL (a fight is an INSTRUMENT failure, NOT a theory failure — return to trunk, never patch)
  K1. If the assoc-iff does NOT come out ⟺ ab==ba, my hand-derivation/convention is wrong —
      re-derive from the banked CD product; do NOT add a hypothesis to force it.
  K2. If x·y ≠ 0 for the transcribed literal, the index→nesting map is wrong — re-map from
      numerics.py's unflatten; do NOT pick a different "easier" witness to make it close.
  K3. The stop is a PROVED loss (zero divisor / Born-law failure), NEVER an asserted halt and
      NEVER "stops after 3 doublings". Step count is NOT hardcoded anywhere.

## Decomposition policy (W3)
Rung 3 (clean, mirrors Quaternion.lean) banks first as a self-contained commit. The STOP banks
second. If the STOP fights or turns run low: commit rung 3, child the STOP, link onto the tail,
complete-as-decomposed. Board STRICTLY single-flight.
