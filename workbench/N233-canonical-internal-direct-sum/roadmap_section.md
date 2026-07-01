## ✅ N233 LANDED — THE CANONICAL INTERNAL g₂-EQUIVARIANT DIRECT SUM `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` — package the whole N219–N232 ambient-projector arc into a single Mathlib `DirectSum.IsInternal` object over `End ℚ ImO`, proved via the four banked idempotents (still-deeper cut of N219–N232, under the OVERNIGHT LOCK)

Over the derived `ℚ` and `O ℚ = CD (H ℚ)`, on `End ℚ ImO` (the `7 ⊗ 7 = 49` arena). N232 banked the
FOUR ambient mutually-orthogonal g₂-equivariant idempotents `projTrivial`/`proj7`/`proj14`/`proj27`
resolving the identity, but the decomposition lived ONLY as a projector identity — the four
g₂-submodules were NOT yet packaged as a canonical Mathlib internal direct sum. N233 banks that object.
- ⭐ `fourSummands := ![trivialLine, range crossEmb, range imRepL, tracelessSym] : Fin 4 → Submodule ℚ (End ℚ ImO)`
  (the 1, 7, 14, 27 g₂-submodules) and `fourProj := ![projTrivial, proj7, proj14, proj27]` (matched projectors).
- `proj_fix` — each `fourProj i` FIXES its own summand (`projTrivial_apply_triv`/`proj7_apply_fun`/
  `proj14_apply_adj`/`proj27_apply_tracefree`); `proj_kill` — each `fourProj i` KILLS every other summand
  `fourSummands j ≤ ker (fourProj i)` (the twelve banked cross-annihilations, per-case `fin_cases i <;> fin_cases j`).
- ⭐⭐ `fourSummands_iSup_eq_top`: `iSup fourSummands = ⊤` (from N232's four-way resolution
  `projTrivial_add_proj27_add_proj7_add_proj14`, each projector-image in a summand).
- ⭐⭐ `fourSummands_iSupIndep`: `iSupIndep fourSummands` (a vector in `fourSummands i ⊓ (⨆ j≠i, fourSummands j)`
  is FIXED by `fourProj i` via `proj_fix` AND KILLED via `proj_kill` ⟹ 0, using `Submodule.disjoint_def`+`iSup₂_le`).
- ⭐⭐⭐ THE CANONICAL INTERNAL DIRECT SUM `fourSummands_isInternal : DirectSum.IsInternal fourSummands`
  (Mathlib `isInternal_submodule_of_iSupIndep_of_iSup_eq_top`).
- ⭐⭐ THE DIMENSION IDENTITY `fourSummands_finrank_sum`: `1 + 7 + 14 + 27 = 49 = finrank (End ℚ ImO)`
  (banked `finrank_trivialLine`/`finrank_crossEmb_range`/`finrank_imRep_range`/`finrank_tracelessSym_eq_27`/
  `finrank_end_eq_49`), an independent CONSISTENCY witness + `fourSummands_finrank_values` (the four dims 1/7/14/27).
- ⭐⭐ EACH SUMMAND g₂-STABLE `fourSummands_adEnd_inv`: `X ∈ fourSummands i ⟹ adEnd D X ∈ fourSummands i`
  (banked `trivialLine_adEnd_inv`/`crossEmb_range_g2_invariant`/`imRep_range_g2_invariant`/`tracelessSym_adEnd_inv`)
  — the direct sum is one of g₂-MODULES, not merely of subspaces. Capstone `canonical_internal_direct_sum_structure`
  bundles IsInternal + the four dims + the dimension identity + each summand g₂-stable.

INSTRUMENT NOTE (W9 / tactic-family). The FIRST `proj_kill` probe used a `first | …` combinator over 12
alternatives × 12 real goals — a `(deterministic) timeout at whnf` (expensive failed-unification over the
combinator). DISSOLVED by explicit per-case `fin_cases i <;> fin_cases j` dispatch (each leaf a single banked
`exact`), 54s → 16s. A tactic-SELECTION fix, not a ceiling raise — the SOUL "switch tactic family, don't
re-try variants" rail.

ONE CAUSE, THE PACKAGED FACE. The whole N219–N232 projector arc — born of the same octonionic Born
positivity (so(7) the skew half) and non-associativity (so(7)=14⊕7) and metric trace (ℚ·id inside the
symmetric side) — now stands as ONE Mathlib `IsInternal` object; "one object" in the most literal sense: the
internal direct sum. 17 declarations foundations-only `[propext, Classical.choice, Quot.sound]` (INDEPENDENTLY
axiom-audited 9 headline decls vs the built olean at `.lake/build/lib/lean/Phys/Algebra/TowerGatherCanonicalDirectSum.olean`
+ gate D6-fast 17 newly-banked decls). Four probes compiled standalone 14–16s BEFORE promotion; production
whole-module olean build 20s; gate-fast D0–D6 GREEN (costumes 264/264, C265 = 49=265 biting at the math field).
Under the OVERNIGHT LOCK (gather side). RESUME: workbench empty, derived from scratch.

**§N233-superseded forward frontier — next (DECIDED: N234, single-flight tail).** UNDER THE OVERNIGHT LOCK
the chain STAYS ON THE GATHER. The four g₂-submodules of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` are now ONE canonical
`IsInternal` object, but the summands are proved only as g₂-SUBMODULES, not as IRREDUCIBLE g₂-modules. THE
DECIDED N234 TARGET (worker-body STEP 5, ONE target, no menu): prove `tracelessSym` (the 27) is an IRREDUCIBLE
g₂-module — no proper nonzero `adEnd`-invariant ℚ-subspace (a `no_proper_invariant_tracelessSym`-style statement
mirroring the banked `no_proper_invariant_ImO`). This is the SINGLE remaining atom that upgrades the N233
direct sum from a decomposition into g₂-SUBMODULES to a decomposition into IRREDUCIBLE g₂-MODULES — the genuine
Clebsch–Gordan `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`. The other three atoms are ALREADY settled: the 1 (`trivialLine`,
finrank 1) trivially irreducible; the 7 (`range crossEmb ≅ ImO`) via banked `no_proper_invariant_ImO`
(DerivationIrreducibleFull.lean); the 14 (`range imRepL ≅ adjoint g₂`) via banked `ImLie_isIrreducible` /
g₂-simplicity. MEASURE the smallest obligation FIRST (W9); reframe through the theory (a cyclic-generator /
highest-weight route may dissolve it where the orthogonal-complement route only yields semisimplicity); if
genuinely hard after the reframe, NAME the exact missing structural fact and CHILD a dedicated dissolution node
TOWARD THE GATHER (do NOT weaken to "semisimple" and call it irreducible; do NOT fall back to a gauge/hypercharge
node). This advances ★3 (the irreducible content — completing `7 ⊗ 7` into IRREDUCIBLE g₂-modules is exactly
"the complete set of representations, derived"). ⛔ Hypercharge/Freudenthal/gauge fronts FORBIDDEN while the lock stands.

