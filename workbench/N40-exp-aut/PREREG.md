# N40 — THE EXPONENTIAL ONE-PARAMETER SUBGROUP (run 169). PREREG — FROZEN before production.

## The arc
N39 banked `expTerm_summable` — the matrix exponential series `exp(D) = ∑ₙ (1/n!)·Dⁿ` of any
8×8 coordinate matrix over the derived ℝ `ContinuumQ.Cut` is ABSOLUTELY CONVERGENT. N40 was
ticketed as: (d) `exp(D) ∈ AutO` (derivation-flow preserves the product) + (e) `d/dt exp(tD)|₀ = D`.

## ★★ MEASURE-FIRST FINDING — THE LITERAL TICKET TARGET (d) IS TYPE-INCOHERENT (THE ONE LAW)
The banked `AutO` is `Subgroup (O ℚ ≃ₗ[ℚ] O ℚ)` — over the **RATIONALS** (DerivationAutGroup.lean:206).
`IsAlgAut`, `derivationLieQ`, `derivationQ`, `coordO`, `bO` are ALL over `O ℚ` / `ℚ`. But `expMap D`
produces `Matrix (Fin 8) (Fin 8) Cut` entries that are TRANSCENDENTAL over ℚ (exp of a nonzero
rational derivation: `e`, etc.). So `exp(D) ∈ AutO` is literally ill-typed — a `Cut`-matrix cannot be
an element of a group of `ℚ`-linear equivs. There is NO `O Cut` automorphism group banked (grep
confirms: only `autMatrix : AutO → (Fin 8 → Fin 8 → Cut)` casts the ℚ-aut's matrix INTO Cut; no
Cut-side `≃ₗ[Cut]` / `IsAlgAut`-over-Cut infrastructure exists).

★ THE ONE LAW (RUNBOOK W5 / STANDARD §4): when the literal framing fights you, you are drifting —
return to the trunk. The MATHEMATICAL CONTENT that "exp lands in the automorphism group" actually
asserts, over the derived ℝ, is the **one-parameter-subgroup homomorphism law**:
`exp(A+B) = exp(A)·exp(B)` for commuting A,B — whence `exp(D)·exp(-D) = exp(0) = 1`, i.e. exp lands
in the GROUP OF UNITS (GL): it is a STRUCTURE-PRESERVING INVERTIBLE map, which IS what "∈ the
automorphism group" means at the matrix-exponential level. This is Cut-native, reuses the banked
N39 convergence, and has teeth. The literal `IsAlgAut`-over-Cut (full algebra-automorphism of the
non-associative `O Cut`) and the `d/dt` tangent map are SEPARATE forward nodes (childed; see below).

## ★ THE W1 / CONTENT-TRAP REFRAME (MEASURED, CONFIRMED — NO ℝ-valued norm)
The Cauchy product is the engine. Mathlib's absolutely-summable Cauchy product
`tsum_mul_tsum_eq_tsum_sum_antidiagonal_of_summable_norm` is **ℝ-NORM bound** (CONTENT TRAP). But
the TRUNK-NATIVE one is NOT: `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal`
(Mathlib/Topology/Algebra/InfiniteSum/Ring.lean:224) needs only
`[T3Space α] [NonUnitalNonAssocSemiring α] [IsTopologicalSemiring α]` — all THREE synth on
`Matrix (Fin 8) (Fin 8) Cut` with NO norm (probe2 ✓). So the homomorphism law is the Cauchy product
+ a binomial identity, entirely over the derived ℝ.

## MEASUREMENT RESULT (bounded probes, all green ≤ ~3 s user CPU each — W9 measure-first)
  - probe1: `expMap D := ∑' n, expTerm D n`, `expMap_hasSum` (the tsum exists by N37+N39). ✓ 2.8s
  - probe2: `expMap_zero` (`exp 0 = 1`) + all 4 Cauchy-product typeclasses synth on `Matrix…Cut`
    WITHOUT a norm (`NonUnitalNonAssocSemiring`, `TopologicalSpace`, `IsTopologicalSemiring`,
    `T3Space`). ✓ 2.4s
  - probe3: L7 general-index summability levers (`cut_summable_of_nonneg_of_bddAbove'`,
    `cut_summable_of_nonneg_of_le'`) — the N39 proofs are index-agnostic, generalize free. ✓
  - probe4: ★ L8 `cut_summable_prod_of_nonneg` — Cut-native nonneg ℕ×ℕ product summability
    (Mathlib's `summable_prod_of_nonneg` is ℝ-ONLY — content trap; built from L7 +
    `Finset.sum_mul_sum` over `s.image fst ×ˢ s.image snd`). ✓ 1.7s
  - probe8b: L7-`cut_summable_of_abs'` (general index, free generalization). ✓
  - probe6: ★ `expTerm_antidiagonal` — THE BINOMIAL CRUX:
    `∑ antidiagonal n, expTerm A k · expTerm B l = expTerm (A+B) n` for `Commute A B`, via
    `Commute.add_pow'` + `Nat.choose_mul_factorial_mul_factorial` + the scalar identity
    `1/k!·1/l! = 1/n!·choose(n,k)` (field_simp + linarith on the cast). ✓ 2.2s
  - probe9: `expTerm_entry_abs_summable` (entrywise ABSOLUTE summability — the N39 internal fact
    re-exposed; needed to feed the Cauchy product). ✓
  - probe11/t12: ★ `matrix_prod_summable` — `Summable fun x:ℕ×ℕ ↦ expTerm A x.1 * expTerm B x.2`,
    via entrywise reduction (`matrix_summable_prod_of_entrywise`) + `Matrix.mul_apply` +
    `summable_sum` + `cut_summable_mul_of_abs` (= L8 on the abs + `cut_summable_of_abs'`). ✓ 1.7s
  - probe10: ★★ `expMap_mul_of_commute` — THE HOMOMORPHISM LAW
    `expMap A * expMap B = expMap (A+B)` for `Commute A B`, via
    `(expTerm_summable A).tsum_mul_tsum_eq_tsum_sum_antidiagonal (expTerm_summable B)
    (matrix_prod_summable A B)` + `tsum_congr` + `expTerm_antidiagonal`. ✓
  - t13: ★ `expMap_mul_neg` / `expMap_neg_mul` (`exp(D)·exp(-D)=1`, exp(-D)·exp(D)=1) — THE
    GL-LANDING: exp is invertible, inverse `exp(-D)`, via the homomorphism law + `add_neg_cancel`
    + `expMap_zero`. ✓ 1.9s

## ★ THE W9 INSTRUMENT FINDING (measured, RESOLVED — NOT a theory failure)
First assembly of `matrix_prod_summable` + `cut_summable_mul_of_abs` hit the default heartbeat
ceiling at `whnf`/`isDefEq`. MEASURED the cause: HIGHER-ORDER UNIFICATION of `f`/`g`/`s` through
the `|·|` and product patterns over `Cut`. FIX (no maxHeartbeats inflation — RUNBOOK W9): pass
`f`/`g` to `cut_summable_prod_of_nonneg`/`cut_summable_mul_of_abs` and `s := Finset.univ` +`f` to
`summable_sum` EXPLICITLY. With explicit args every piece drops from timeout to ≤ 1.9s. The
`{ι κ : Type*}`-generic `cut_summable_mul_of_abs` is the costly one; SPECIALIZE it to `ℕ` (matrix
entry sequences are ℕ-indexed). NO ceiling raised anywhere.

## GO / NO-GO (frozen)
GO (the exponential one-parameter subgroup — THE genuine Cut-native content of (d)). Bank in TWO files:
  • `Phys/Foundation/ContinuumSummable.lean` — APPEND the general-index + product summability levers:
    `cut_summable_of_nonneg_of_bddAbove'`, `cut_summable_of_nonneg_of_le'`, `cut_summable_of_abs'`
    (general index), `cut_summable_prod_of_nonneg`, `cut_summable_mul_of_abs` (ℕ-specialized).
    [Foundation: these are pure properties OF the derived ℝ.]
  • `Phys/Algebra/DerivationAutExpHom.lean` (NEW, Algebra) — `expMap`, `expMap_hasSum`, `expMap_zero`,
    `expTerm_entry_abs_summable`, `matrix_summable_prod_of_entrywise`, `matrix_prod_summable`,
    ★ `expTerm_antidiagonal` (binomial crux), ★★ `expMap_mul_of_commute` (homomorphism law),
    ★ `expMap_mul_neg` + `expMap_neg_mul` (GL-landing / invertibility), + non-vacuity
    `expMap_one_mul_neg_one` or similar on a concrete nonzero matrix.
NO-GO / escalate (W1 child + block) only if an assembled file fails to elaborate after the probes
proved each piece (NOT expected — every piece compiled green standalone with explicit args).

## CHILDED FORWARD (onto the chain tail, single-flight W4)
  (1) `d/dt exp(tD)|₀ = D` — the tangent map / Der→Aut half. RISK: `HasDerivAt` needs a
      `NormedField`-valued derivative; over `Cut` that is an ℝ-content-trap UNLESS reframed (the
      derivative is the `n=1` term, rest `o(t)` — likely a trunk-native `Tendsto` of the difference
      quotient over the N36 uniform structure, NOT Mathlib `HasDerivAt`). A genuine measure-first node.
  (2) the FULL algebra-automorphism of `O Cut`: build `O Cut`'s `≃ₗ[Cut]` automorphism predicate
      + show the exponential of a (base-changed) derivation matrix preserves the `O Cut` product
      (the Leibniz→homomorphism integration on the non-associative algebra itself, not just the
      matrix GL). Prereq: a Cut-side derivation/automorphism infrastructure (currently ℚ-only).
  These two complete the literal Der(𝕆)→Aut(𝕆); N40 banks the GL one-parameter subgroup that is
  their backbone.

## KILL / compile-cost budget (W9)
  - KILL any single obligation that exceeds ~30 s user CPU OR the DEFAULT heartbeat ceiling (200000).
    Every measured piece is ≤ 3 s. If an assembled file blows up: it is the higher-order-unification
    cost — pass `f`/`g`/`s` explicitly (the MEASURED fix), do NOT raise maxHeartbeats.
  - TURN CHECKPOINT ~55%: by then the two files must compile + be committed (bank-as-you-go, W9.8).
    FINALIZE (gate/audit/LEDGER/ROADMAP/child) with turns to spare. N28–N39 ALL timed out AFTER
    committing — checkpoint EARLY, commit each file the instant it elaborates.

## Physics-words-removable (STANDARD §2)
Delete "exp / derivation / gauge / G₂ / automorphism": the files are a complete proof that the
matrix power series `∑ₙ (1/n!)·Mⁿ` over the completion-of-the-gather-of-closures of the derived
rationals satisfies `E(M+N)=E(M)·E(N)` for commuting M,N and `E(M)·E(-M)=1` (a one-parameter
subgroup of the matrix units), via the Cauchy product + the binomial identity. NO physics name is
load-bearing.

## Anti-vacuity (W8) — the costume MUST bite (C62)
A WRONG homomorphism / invertibility / binomial claim must FAIL to compile. Candidate: assert
`expMap A * expMap B = expMap (A + B)` WITHOUT the `Commute A B` hypothesis (FALSE for
non-commuting matrices — the Cauchy product needs commutativity for the binomial), or assert
`expTerm_antidiagonal` collapses without `Commute`, or `expMap D * expMap (-D) = 0`. The bite is the
dropped `Commute` hypothesis / wrong RHS.
