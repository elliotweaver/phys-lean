/-
  Phys.Cascade.Sedenion — N2 THE PROVED STOP: doubling past 𝕆 loses the
  composition / Born self-overlap law (and division).
  ===========================================================================
  THE TERMINAL THEOREM OF THE CASCADE. Rung 3 (Phys/Cascade/Octonion.lean) doubled
  the non-commutative algebra to `O R := CD (H R)` and proved the double LOSES
  ASSOCIATIVITY, caused EXACTLY by the rung-2 non-commutativity. This module applies
  the SAME doubling operation ONE more time (Phys/Cascade/Double.lean's `CD`, 8 → 16)
  and proves the cascade STOPS: the next double `S R := CD (O R)` is no longer a
  division algebra (it has ZERO DIVISORS) and no longer satisfies the
  composition / Born = self-overlap law `N(xy) = N(x) N(y)`. Nothing is imported
  from Mathlib's `Octonion`/`Zorn`/classification: `S R := CD (O R)` is the double
  of the DERIVED non-associative algebra; the stop is a PROVED loss, never an
  asserted halt and never a hardcoded step count.

  THE FORWARD DERIVATION (derived forward by DOUBLING; the stop is FORCED):

  ── the base is non-associative ──
    `O R` is NON-associative (rung 3). The Cayley–Dickson doubling can still be
    APPLIED — `CD` only needs a `Star`/`Mul`/`Add`/`Neg` carrier, which `O R` has —
    but the resulting algebra inherits no division and no composition law.

  ── doubling again breaks the Born self-overlap law and division ──
    `S R := CD (O R)` — the SAME doubling, a fourth time. We exhibit CONCRETE
    witnesses (verified by exact rational arithmetic in
    workbench/N2c-octonion/probe.py) and PROVE the stop two equivalent ways:
    zero_divisor                 — ★ DIVISION FAILS. Two NONZERO elements `x, y`
                                   of `S ℚ` with `x * y = 0`. The product of two
                                   nonzero elements vanishes: `S` is not a division
                                   algebra. (`x = e₁+e₁₀`, `y = e₅+e₁₄`.)
    born_law_fails               — ★ THE BORN / COMPOSITION LAW FAILS. The self-
                                   overlap norm `N z := (z · z*)` (the base scalar of
                                   the Born form) is NOT multiplicative:
                                   `N(x y) ≠ N x · N y` (here `0 ≠ 2·2`).
    zero_divisor_breaks_composition
                                 — ★ ONE FACT, BOTH TERMINATIONS. A single
                                   structural fact — a zero divisor whose factors
                                   have nonzero self-overlap — forces BOTH the loss
                                   of division AND the loss of the composition law:
                                   `N(xy)=N(0)=0` while `N x · N y ≠ 0`. The two
                                   terminations are the same cause.

  WHY THIS IS THE STOP (and not a step that could be continued): the cascade's
  required property at each rung is that the doubling preserve the Born self-overlap
  law (`N(xy)=N(x)N(y)`) — the positivity/self-overlap of the trunk. Rungs 1–3
  preserve it (probe-verified, workbench/N2c-octonion); the double of the
  NON-associative `O` is the first that does NOT — proved here CONCRETELY, by
  exhibiting witnesses in `S = CD (O ℚ)` that break both division and the law.

  The structural cause-chain is, rung by rung, a chain of PROVED theorems up to the
  octonions: `H`'s non-commutativity is caused by the complex unit `J ≠ J*`
  (`commutativity_cause`, rung 2); `O`'s non-associativity is caused by `H`'s
  non-commutativity (`associativity_cause`, rung 3); and at the stop, the loss of
  division and the loss of the composition law are ONE fact
  (`zero_divisor_breaks_composition`). The remaining link — that the base being
  non-associative is what GENERICALLY forces the double to lose the law (the forced
  "iff", `N`-multiplicative on `CD A` ⟹ `A` associative), for EVERY base past `O`
  and not only the witnessed one — is the natural strengthening enqueued as the next
  node; it upgrades this concrete proved stop to a generic impossibility. Nothing
  here is asserted: the stop is a PROVED loss, the cause-chain to rung 3 is proved,
  and the generic iff is honestly deferred (not claimed), never bridged.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Born / composition / norm /
  sedenion / octonion": what remains is the theorem that the Cayley–Dickson double
  of a NON-associative `*`-algebra has a zero divisor with non-degenerate self-
  overlap, hence its self-overlap quadratic form is not multiplicative. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Cascade.Octonion
import Mathlib.Tactic

namespace Phys.Cascade

/-! ## THE STOP — the double of the non-associative algebra. -/

/-- THE NEXT (TERMINAL) ALGEBRA: the Cayley–Dickson double of the rung-3 algebra
    (dimension 8 → 16). The SAME doubling operation, applied a fourth time. The
    doubling still applies (the carrier has `Star`/`Mul`/`Add`/`Neg`), but the
    Born self-overlap law and division are now LOST — this is where the cascade
    stops. -/
abbrev S (R : Type*) [CommRing R] := CD (O R)

/-- A nonzero element of the terminal algebra `S ℚ`, the sum of two basis
    directions (`e₁ + e₁₀` in flat coordinates). Transcribed from the exact-
    arithmetic witness in workbench/N2c-octonion/probe.py. -/
def zdX : S ℚ := ⟨⟨⟨⟨0, 1⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨1, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩

/-- A second nonzero element of `S ℚ` (`e₅ + e₁₄` in flat coordinates). -/
def zdY : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 1⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨1, 0⟩⟩⟩⟩

set_option maxHeartbeats 1000000 in
/-- ★ DIVISION FAILS — A ZERO DIVISOR. The product of the two NONZERO elements
    `zdX`, `zdY` of `S ℚ` is `0`. The terminal algebra is not a division algebra:
    the property the cascade required (no zero divisors) is LOST. This is the proved
    stop, route (a). -/
theorem zero_divisor_prod : zdX * zdY = 0 := by
  ext <;> simp [zdX, zdY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

/-- `zdX ≠ 0` (anti-vacuity): the first factor is genuinely nonzero (its `e₁`
    coordinate is `1`). -/
theorem zdX_ne_zero : zdX ≠ (0 : S ℚ) := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S ℚ => z.re.re.re.im) h; simpa [zdX] using this
  exact one_ne_zero h2

/-- `zdY ≠ 0` (anti-vacuity): the second factor is genuinely nonzero (its `e₅`
    coordinate is `1`). -/
theorem zdY_ne_zero : zdY ≠ (0 : S ℚ) := by
  intro h
  have h2 : (1 : ℚ) = 0 := by
    have := congrArg (fun z : S ℚ => z.re.im.re.im) h; simpa [zdY] using this
  exact one_ne_zero h2

/-- ★ THE ZERO DIVISOR IS GENUINE: two NONZERO elements with vanishing product. The
    terminal algebra has zero divisors — division has been lost. -/
theorem has_zero_divisor :
    ∃ x y : S ℚ, x ≠ 0 ∧ y ≠ 0 ∧ x * y = 0 :=
  ⟨zdX, zdY, zdX_ne_zero, zdY_ne_zero, zero_divisor_prod⟩

/-! ## THE BORN = SELF-OVERLAP NORM and its failure of multiplicativity. -/

/-- THE BORN SELF-OVERLAP FORM `N z := (z · z*)` read off as the base scalar. On
    every rung up to and including `O` this quadratic form is MULTIPLICATIVE
    (`N(xy)=N(x)N(y)`) — the composition law, the trunk's self-overlap positivity.
    At the stop it is not. -/
noncomputable def N (z : S ℚ) : ℚ := (z * star z).re.re.re.re

/-- The self-overlap of the void is `0`. -/
theorem N_zero : N (0 : S ℚ) = 0 := by simp [N]

set_option maxHeartbeats 1000000 in
/-- The self-overlap of `zdX` is `2` (two unit coordinates): non-degenerate. -/
theorem N_zdX : N zdX = 2 := by
  simp only [N]
  simp [zdX, CD.mul_re, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.star_re', Dbl.star_im']
  norm_num

set_option maxHeartbeats 1000000 in
/-- The self-overlap of `zdY` is `2`: non-degenerate. -/
theorem N_zdY : N zdY = 2 := by
  simp only [N]
  simp [zdY, CD.mul_re, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.star_re', Dbl.star_im']
  norm_num

/-- ★ THE BORN / COMPOSITION LAW FAILS (the proved stop, route (b)). The self-
    overlap norm is NOT multiplicative at the terminal algebra: for the witnesses
    `N(zdX · zdY) = N 0 = 0`, but `N zdX · N zdY = 2 · 2 = 4 ≠ 0`. The composition
    law `‖xy‖ = ‖x‖‖y‖` — the cascade's required self-overlap property — is broken.
    THIS is what stops the cascade. -/
theorem born_law_fails : N (zdX * zdY) ≠ N zdX * N zdY := by
  rw [zero_divisor_prod, N_zero, N_zdX, N_zdY]; norm_num

/-- ★ ONE FACT, BOTH TERMINATIONS ("one cause, many terminations"). A SINGLE
    structural fact at the stop — a zero divisor whose two factors have NONZERO
    self-overlap — forces BOTH terminations at once: the loss of division (the
    product is `0` though neither factor is) AND the loss of the composition / Born
    law (`N(xy) = N 0 = 0` while `N x · N y ≠ 0`). The two losses are not
    independent; they are the same cause read two ways. -/
theorem zero_divisor_breaks_composition {x y : S ℚ}
    (hx : N x ≠ 0) (hy : N y ≠ 0) (hxy : x * y = 0) :
    N (x * y) ≠ N x * N y := by
  rw [hxy, N_zero]
  exact fun h => (mul_ne_zero hx hy) h.symm

end Phys.Cascade
