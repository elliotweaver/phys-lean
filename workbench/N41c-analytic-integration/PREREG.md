# N41c — PREREG (frozen before compute)

## TARGET (the ticket)
Over the DERIVED ℝ `ContinuumQ.Cut`, complete the LITERAL `O Cut` algebra-automorphism:
1. THE VECTOR EXP `expO D x := ∑' n, (1/n!)•(Dⁿ x)` on `O Cut`, SUMMABLE.
2. THE CAUCHY PRODUCT: `expO D (x·y) = expO D x · expO D y` (pass N41a `iter_leibniz_antidiag`
   to the tsum limit by `tsum_mul_tsum_eq_tsum_sum_antidiagonal` over the banked N41b
   `oCut_isTopologicalSemiring`/`oCut_t3Space`/`oCut_completeSpace`/`oCut_continuousMul`).
3. THE BIJECTION: `expO D` invertible with inverse `expO (-D)`.
4. `d/dt exp(tD)|₀ = D` — trunk-native `Tendsto` over the N36 uniform structure.

## STANDING DEPENDENCY GATE (STANDARD §3)
NEVER `import Mathlib.Data.Real` as content. exp = the Cut-valued/O-Cut-valued series. tsum/
HasSum/Finset/Matrix/Module = MACHINERY on the DERIVED objects. Derivative = trunk-native
`Tendsto`, NOT Mathlib `HasDerivAt`/`NormedField` (a content trap). NO ℝ-valued Norm.

## THE THREE HARD CORES (W9 risks to MEASURE)
- (A) SUMMABILITY of `n ↦ (1/n!)•(Dⁿ x)` in `O Cut`. The bound fundamentally comes from N38's
  MATRIX operator norm → needs a Cut-side coordinatization `O Cut ≃ₗ[Cut] (Fin 8 → Cut)` +
  matrix representation of the derivation `D` (only ℚ-side `coordO` is banked — Cut-side is
  NOT). This is the gating dependency for BOTH (B) and (C).
- (B) THE CAUCHY-PRODUCT preservation. GIVEN summability, the per-`n` algebraic rewrite
  `(1/n!)•(∑ C(n,k)•(Dᵏx·Dˡy)) = ∑ ((1/k!)•Dᵏx)·((1/l!)•Dˡy)` needs the SMUL-CENTRAL
  compatibility `(c•a)*b = c•(a*b)`, `a*(c•b) = c•(a*b)` on `O Cut` for `c : Cut`.
- (C) THE DERIVATIVE. Also depends on (A) (the vector exp defined+summable).

## GO / NO-GO (scope decided by the MEASUREMENT below)
- GO scope = the largest COMPLETE (foundations-only, no sorry) increment the probes show
  elaborates cheaply (≤ KILL each). Candidates, in dependency order:
  * the SMUL-CENTRAL compatibility on `O Cut` (pure algebra, no topology) — likely cheap.
  * the per-`n` ALGEBRAIC rewrite lemma (pure algebra) — likely cheap.
  * the Cut-side COORDINATIZATION + summability (the genuine hard core) — likely its OWN node.
  * the Cauchy-product preservation CONDITIONAL on summability hyps — bankable building block.
- Bank-as-you-go (W9.8): the instant any lemma compiles clean → production + wire + commit
  BEFORE chasing the full theorem. DECOMPOSE aggressively; child the summability/coordinatization
  and the derivative if they prove the hard core.

## KILL BUDGET (W9)
- KILL = 60s wall for ANY single proof obligation. If a probe obligation exceeds 60s →
  INSTRUMENT failure: stop, measure smaller, decompose / reframe. NEVER inflate maxHeartbeats.
- NEVER an unbounded compile inside the turn budget — bounded probes only.

## TURN CHECKPOINT (anti-timeout — N28–N41b ALL timed out AFTER leaving the derivation)
- At ~55% of turn budget: STOP exploring, FINALIZE (commit what compiled + child the rest +
  complete THIS task as decomposed). Finalize EARLY with turns to spare.

## ANTI-VACUITY (W8)
New costume C65 MUST bite a WRONG O-Cut-automorphism/product-preservation/derivative claim
(e.g. product-preservation WITHOUT the `IsDeriv D` hypothesis, or `expO 0 ≠ 1`, or a wrong
smul-central sign). Reuse banked iter_leibniz_antidiag/IsDeriv/ContinuumQ.Cut/oCut_* — never a
fresh table. Physics-words-removable: delete exp/gauge/G₂/colour/derivation/automorphism → the
theorem stands as pure math.

## STATUS: ✅ LANDED (DECOMPOSED, childed N41d). Run 175 banked DerivationOExp.lean (14 decls,
foundations-only) + C65 then timed out before finalizing; run 176 (W6/W9.8) verified-then-finalized
(built clean, axiom-audited all 14 ⊆ {propext,Classical.choice,Quot.sound}, C65 bites, gate green,
committed + LEDGER/ROADMAP). The unconditional summability (Cut-side coordinatization) + bijection +
d/dt childed N41d.
