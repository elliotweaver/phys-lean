# N80 PREREG — THE REAL-CLOSED QUADRATIC-IRREDUCIBILITY CLASSIFICATION over the derived ℝ `Cut`
*(frozen before compute — GO/NO-GO + KILL; the W1 dissolution decision is recorded in FINDINGS)*

## MEASURE-FIRST RESULT (recorded BEFORE building — the W1 / THE-ONE-LAW decision)

The node target as framed (the full real-closed Artin–Schreier FACTORIZATION → even-dim seed →
full n-dim existence → global polar/KAK) is a GENUINE W1 wall after measurement:

1. **Artin–Schreier route is the content Mathlib lacks (confirmed).** `IsRealClosed` occurs in
   EXACTLY ONE file across all of Mathlib — `FieldTheory/IsRealClosed/Basic.lean`, the 127-line
   stub (class + `of_linearOrderedField` + square helpers ONLY). There is NO real-closed → R[i]
   algebraically-closed theorem, NO polynomial factorization over abstract real-closed fields.
   Mathlib's OWN `Analysis/Polynomial/Factorization.lean` has the degree-≤2 factorization ONLY
   over the concrete `ℝ`, carrying the explicit comment
   `-- TODO: generalize to real closed fields when they are available.`
   ⟹ the full factorization is genuine BUILD-don't-posit content; the hard core is the single
   lemma "every monic `p` over `Cut` of degree ≥1 has a monic factor of degree 1 or 2"
   (⟺ `R[i]` algebraically closed — the Artin–Schreier theorem, Galois/Sylow heavy).

2. **Variational/Rayleigh route is algebraically clean but analytically blocked for one node.**
   The trunk-native dissolution (a self-adjoint operator over the positive-definite Born form
   `EvC` has a real eigenvalue because the Rayleigh-quotient maximizer `u` makes `λ·id − g`
   positive-semidefinite with `EvC((λid−g)u)u = 0`, then Cauchy–Schwarz on the semidefinite form
   + nondegeneracy `EvC_eq_zero_iff` forces `(λid−g)u = 0`) needs ONLY ONE analytic input:
   a maximizer of `v ↦ EvC(g v) v` on the sphere `{EvC v v = 1}`. `Cut` has `isCompact_Icc`
   (`ConditionallyCompleteLinearOrder` N33 + `OrderTopology` N34) and `IsTopologicalRing` N34, so
   the sphere is a closed subset of a compact box `[-1,1]^10` and `IsCompact.exists_isMaxOn`
   applies — BUT the topology plumbing (product `TopologicalSpace STVC`, continuity of the
   bilinear `EvC` and of the operator `g`, the sphere ⊆ box compactness) is a substantial,
   compile-risky analytic build NOT safely landable in one node under the W9 anti-timeout budget.
   ⟹ recorded as the ALTERNATIVE attack on the childed dissolution ticket.

## THE DECISION (W1 + W3 decomposition; THE ONE LAW — reframe through the trunk)

Bank the IMMEDIATELY-bankable trunk-native STRUCTURAL piece this run; child the hard half.

- **GO (this node banks):** the UNCONDITIONAL real-closed quadratic-irreducibility classification
  over `Cut` — a monic quadratic `X² + C b·X + C c` over `Cut` is `Irreducible` IFF `b² < 4c`
  (negative discriminant). This is the genuine trunk-native BRIDGE between Mathlib's "irreducible
  quadratic factor" language and N78 `selfadj_no_pure_quad_charpoly`'s `qs : List (Cut × Cut)`
  neg-disc form — it DISSOLVES the language mismatch that blocked feeding a factorization to N78.
  Derived from the REAL-CLOSED structure of `Cut` (every nonneg has a square root — banked `cutSqrt`
  N57) + `Monic.irreducible_iff_roots_eq_zero_of_degree_le_three` (Mathlib machinery on the DERIVED
  `Cut[X]`) + the `QuadraticDiscriminant` API. Plus: the root-extraction at nonneg discriminant
  (`cutSqrt`-built explicit root) and a NON-VACUITY witness.

- **STRETCH (bank if budget allows, else child):** the factorization DEGREE-STRONG-INDUCTION
  skeleton — CONDITIONAL on the local-factor hypothesis `hfac : ∀ monic p, 1 ≤ deg → ∃ monic factor
  of degree 1 or 2`, produce the full factorization into `(X−λ)` linear × neg-disc irreducible
  quadratic factors in the `qs` form — and the CONDITIONAL even-dim real-eigenvalue seed feeding
  `selfadj_no_pure_quad_charpoly`. An honest fully-proved IMPLICATION (NOT a bridge — STANDARD §1/§4),
  isolating the ENTIRE remaining difficulty to the one hard `hfac` input.

- **CHILD (N81, the W1 dissolution ticket + global remainder):** the one hard Artin–Schreier input
  `cut_has_factor_le_two` (every monic poly of degree ≥1 over `Cut` has a monic factor of degree
  ≤ 2 ⟺ `R[i]` algebraically closed) OR the variational-route dissolution as an alternative attack;
  then the full existence `∀ g, ∃ c u, g = specOpN c u` + the global polar/KAK assembly +
  connectedness + the global reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion.

## GO / NO-GO
- GO if: `cut_monic_quad_irreducible_iff_negDisc` (and its forward/backward halves + root-extraction
  + non-vacuity) compiles foundations-only `[propext, Classical.choice, Quot.sound]` over the derived
  `Cut`, costume C111 bites a WRONG classification, gate D0–D6 green.
- NO-GO / honest block if: even the unconditional quadratic classification resists after reframe
  (it should NOT — all inputs are banked; this is the cheap, safe piece).

## KILL BUDGET (W9 — classify a fight as INSTRUMENT failure, not theory)
- Per-obligation compile KILL: any single lemma whose `lake env lean` probe exceeds **90 s** wall
  is an instrument wall → MEASURE the smallest sub-obligation, decompose, do NOT raise heartbeats.
- These are degree-≤3 polynomial + `discrim` algebra over a field — NO coordinate brute, NO
  `decide`/`native_decide`, NO monolithic `ring` over expanded STVC. Default `maxHeartbeats`.
- Checkpoint at ~50% turns: the instant the classification compiles clean → production + costume +
  wiring + COMMIT, then gate in BACKGROUND, then child + complete with turns to spare.
- If the STRETCH induction skeleton turns heavy (>90 s any sub-lemma, or fiddly `Polynomial`
  manipulation eating >40% remaining turns) → COMMIT the unconditional classification, CHILD the
  skeleton + the hard input + global remainder, complete as DECOMPOSED. Failure NOT on the menu.

## COSTUME C111 (must BITE — W8)
A WRONG quadratic-irreducibility claim — e.g. asserting a CONCRETE negative-discriminant monic
quadratic over `Cut` is REDUCIBLE (has a root), or a wrong discriminant arithmetic — must fail to
compile, reducing to a false numeric DISTINCT from the banked battery (… C109 `9=13`, C110 `10−1=14`).
Planned false numeric: a wrong discriminant value, e.g. `1 = 5` or similar DISTINCT value.

## WORDS-REMOVABLE (STANDARD §2)
Delete "Lorentz/spectral/eigen*/self-adjoint/characteristic/factorization/irreducible/quadratic/
discriminant/real-closed/Artin-Schreier/seed/even-dim/algebraic-closure": what remains is the
theorem that over the derived complete ordered field `Cut` (in which every nonnegative element is a
square — `cutSqrt`), a monic quadratic `X² + C b·X + C c ∈ Cut[X]` is irreducible iff `b² < 4c`.
Pure field/polynomial math; no statement needs a physics word.
