# AUDIT MAP — the fine-structure (alpha-landing) derivation

A file-and-theorem map for auditing the certified landing
`137.0359990777677 ≤ 1/α ≤ 137.0359990778029` at repo head `89ba8ecb`.
Every path and line number below is verified against that head.

## How to reproduce everything

```
lake build Phys                          # full tree (Mathlib cache downloads on first build)
lake env lean Audits/AxiomAudit.lean     # every #print axioms line, kernel output
```

Expected axiom footprint for every audited declaration:
`[propext, Classical.choice, Quot.sound]` (or a subset). Anything else is a failure.

Costume files under `Counterexamples/` MUST FAIL to compile — the kernel rejecting a
planted false claim is the anti-vacuity test. The manifest of expected rejections is
`scripts/costume_manifest.tsv` (row: id, file, the false goal the kernel refuses).
Run the battery: `bash scripts/run_costumes.sh`.

---

## 0. The single entry point

**`Phys/Algebra/MirrorLegalityDerived.lean`** — start here (N678, the referee-finding repair).

| declaration | what it claims |
|---|---|
| `alpha_landing_capstone_derived` | THE ONE THEOREM: (∀ t, DerivedLegal t → t = mirrorParsed) ∧ (∃! a, ChainAdmissible a ∧ residualWelded a = 0 ∧ bracket) |
| `DerivedLegal` | legality whose conjuncts reference ONLY banked structural objects — NO slot value (16/9, 1, 1, 2) appears in the definition |
| `termMomentNorm_eq_weight_iff` | the ∀-n moment law: termMomentNorm n = depthWeight ↔ n = 2 — the bridge from the moment facts to the grammar's ends field |
| `termMomentNorm_{one..five}_weld` | the law welded to all five CONSTRUCTED fluxes (it is not a free-floating formula) |
| `derivedLegal_census/returns/log/ends` | the per-slot derivations — each consumes its forcing theorem BY NAME (census_no_edge_no_removal, foldCount, the moment law) and CONCLUDES the value |
| `mirror_term_universal_derived` | composes the four derivations; the values appear only as conclusions |
| `derivedLegal_iff_chainLegal` | the derived relation and the earlier value-form ChainLegal provably agree — the old form is retroactively the EVALUATION of this derivation |

Historical note, disclosed: the earlier `mirror_term_universal` over `ChainLegal`
(`MirrorTermLanguage.lean`) was substitution over a value-form definition — a referee
finding at head `89ba8ecb`, correct, repaired by this module. Both forms remain in the
tree with the agreement theorem between them.

**`Phys/Algebra/AlphaLandingCapstone.lean`** — the root-selection half (N677).

| line | declaration | what it claims |
|---|---|---|
| 29 | `ChainAdmissible` | the DERIVED domain: 0 < a ∧ invAlphaHigh ≤ 1/a — the bound is the chain's own 42, not a declared interval |
| 49 | `root_is_chainAdmissible` | the root EARNS admissibility from the certified brackets (1/a ≥ 136.8 > 42) |
| 66 | `mirror_root_unique_admissible` | uniqueness on the derived domain; `aL`/`aR` appear NOWHERE in this proof chain |
| 91 | `second_root_exists` | anti-vacuity: the cubic HAS a second positive root in [1,30] — global uniqueness was never assumed; admissibility does real selection work |
| 116 | `fourth_moment_not_banked_weight` | the normalized fourth moment is 1/5 ≠ 1/3 (see also the general ∀-n law above, which subsumes this) |
| 132 | `alpha_landing_capstone` | the value-form capstone (first conjunct via ChainLegal; the derived form above is the stronger statement) |

Audit move: `#print axioms Phys.Algebra.MirrorTermLanguage.alpha_landing_capstone_derived`,
then walk each named ingredient below.

---

## 1. The equation's FORM (why 1/α = F₀ − (16/9)κα² and nothing else)

### 1a. The term language and the universal selection
**`Phys/Algebra/MirrorTermLanguage.lean`**

| line | declaration | content |
|---|---|---|
| 199 | `ChainLegal` | legality over the full `ParsedTerm` language (any ℚ census, any ℕ returns, any ℕ α-ends, any Cut log content — nearby competitors are all expressible) |
| 213 | `mirror_term_universal` | ∀ t, ChainLegal t → t = mirrorParsed — the unique legal term, quantified over the language |
| 228 | `language_controls_excluded` | six concrete illegal terms rejected, each failing a NAMED conjunct; the log-carrier is killed by the certified bound runningLogContent ≥ 22.4 > 1 (from banked edge-log brackets), not by definition |
| 177 | `fifthMomentFlux_vanishes` | cos⁵ moment = 0 EXACTLY — the odd annihilation is not an accident of n ∈ {1,3} |
| 185 | `fourthEvenMoment_eq` | cos⁴ moment = 2/5 — even moments survive, but see capstone line 116: 1/5 equals NO banked object |

The referee test for each `ChainLegal` conjunct — "derived, or definitionally the
answer?" — is discharged by the forcing theorems in 1b–1d.

### 1b. α-ends = 2, CONSTRUCTED (not selected)
**`Phys/Algebra/TwoEndsConstructed.lean`**

| line | declaration | content |
|---|---|---|
| 186 | `firstMomentFlux_vanishes` | ∫₀^π cos·sin = 0 EXACTLY (termwise FTC on the derived line) |
| 211 | `twoEnds_constructed` | capstone weld: odd moments 0, the two-ended flux 2/3 strictly positive, and its normalization IS the banked depthWeight — the α-power and the w-slot are ONE object |

### 1c. returns = 1, from the unary law
**`Phys/Algebra/FineStructureAllOrdersNormalization.lean`**

| line | declaration | content |
|---|---|---|
| 173 | `foldCount` | `fun _ => 1` — the unary multiplicity |
| 203 | `dressedOverlap_selfref` | D = κ₀ + w·D — the all-orders tower contains itself ONCE; a hand-written extra w double-counts |

**`Phys/Algebra/MirrorSelfInsertionLaw.lean`**

| line | declaration | content |
|---|---|---|
| 86 | `insertion_coefficient_forced` | 16/9 ASSEMBLED = chargeTraceDepth · depthWeight (two prior theorems, no numeral chosen) |
| 121 | `w_slot_bites` | w⁰ (16/3) strictly negative, w² (16/27) strictly positive at the root — three depths, three different equations |

### 1d. census 16/3 + no log — ONE fact (no scale gap)
**`Phys/Algebra/MirrorSelfInsertionLaw.lean`** line 163 `census_no_edge_no_removal`:
`bandScreen c 1 = κ·c·cutLog 1 = 0` for EVERY census — nothing decouples without a
gap, so the insertion census is the undiminished cap, and the same fact is the no-log
fact. Sub-census alternatives strictly miss (`census_slot_bites`, line 139).

Upstream: **`Phys/Algebra/DecouplingCensusRemoval.lean`** (line 173 `census_split`
16/3 = 10/3 + 2; line 192 `decoupling_removal` — how sub-censuses arise at genuine
edges), **`Phys/Algebra/CensusCompletenessClosure.lean`** (line 207).

### 1e. The grammar's parse layer (the four banked terms)
**`Phys/Algebra/ChainTermGrammar.lean`** — line 149 `endpoint_parses`: F₀ − mirror =
base + running − obstruction − mirror EXACTLY; separation theorems (the running term
is the ONLY log carrier, the mirror the ONLY α carrier).

---

## 2. Every numeral in the final equation, traced

| numeral | is | theorem | file:line |
|---|---|---|---|
| 16/9 | `mirrorCoeff` = (16/3)·(1/3) | `mirrorCoeff_eq` | `Phys/Algebra/MirrorFixedPoint.lean:117` |
| 16/3 | the charge census | `chargeTraceDepth_eq` | `Phys/Algebra/FineStructureRunningCoupling.lean:135` |
| 1/3 | the re-entry weight (2/3 flux over measure 2) | `depthWeight_eq` | `Phys/Algebra/DepthWeight.lean:146` |
| κ = 1/(3π) | flux per phase-wrap | `kappaLeading_eq` | `Phys/Algebra/FineStructureLoopNormalization.lean:210` |
| 3/5 | the octonion coherence deficit (210 per-triple theorems) | `census_mean` | `Phys/Algebra/GatherCoherenceCensus.lean:398` |
| (3/5)·κ = 1/(5π) | the obstruction | `obstructionTerm_eq` | `Phys/Algebra/MirrorFixedPoint.lean:125` |
| 42 | the undressed intercept 1/α* | `invAlphaHigh_eq` / `couplingWeight_eq` | `FineStructureRunningCoupling.lean:124` / `BornIsometryCompleteness.lean:150` |
| F₀ bracket | dressed endpoint − obstruction, worst-case rational arithmetic | `F0_bracket` ← `recomposedEndpointDressed_restated_r4` | `MirrorFixedPoint.lean:163` ← `D7NarrowingRung4.lean:625` |

The welded form: **`Phys/Algebra/MirrorResidualWelded.lean`** line 25 `residualWelded`
(coefficient = the assembled `mirrorCoeff` object, no literal), line 30
`residualWelded_eq` (pointwise equal to the banked residual), line 46
`invAlpha_certified_welded`.

---

## 3. The root: existence, uniqueness, enclosure — three separated notions

| notion | theorem | file:line | note |
|---|---|---|---|
| unique legal TERM | `mirror_term_universal` | `MirrorTermLanguage.lean:213` | grammar level |
| unique admissible ROOT | `mirror_root_unique_admissible` | `AlphaLandingCapstone.lean:66` | derived domain; no `aL`/`aR` in the proof |
| unique root in (0,1) | `invAlpha_certified_global` | `MirrorRootGlobal.lean:122` | band monotonicity on [−1,1] |
| numerical ENCLOSURE | `invAlpha_certified` / `solution_bracket` | `MirrorRootExistence.lean:79` / `MirrorFixedPoint.lean:236` | the ONLY place [aL,aR] does work |
| existence (IVT) | `mirror_root_exists` | `MirrorRootExistence.lean` | over the derived Cut; Classical.choice enters here only |

`aL`/`aR` are defined at `MirrorFixedPoint.lean:177-178`; grep the selection-chain
files above to confirm they never appear outside the enclosure statements.

---

## 4. Dependency direction (the one-way check)

The forcing modules — `FineStructureAllOrdersNormalization`, `DepthWeight`,
`DecouplingCensusRemoval`, `FineStructureLoopNormalization`,
`FineStructureRunningCoupling`, `CensusCompletenessClosure` — import NONE of
`MirrorFixedPoint`, `MirrorRootExistence`, or any landing module. Verify:

```
grep -l "MirrorFixedPoint\|MirrorRootExistence" Phys/Algebra/FineStructure*.lean \
  Phys/Algebra/DepthWeight.lean Phys/Algebra/DecouplingCensusRemoval.lean \
  Phys/Algebra/CensusCompletenessClosure.lean
# expected: no output
```

## 5. Empirical-leakage check (symbol search, not prose)

```
grep -rn "137\.035999\|0\.0072973\|72973525" Phys/ --include="*.lean" | grep -v -- "--"
```

Expected: hits ONLY inside the bracket-certification statements/docstrings of the
Mirror* modules themselves (the certified rationals 1370359990777677/10^13 etc. are
the CONCLUSIONS, derived by worst-case arithmetic from the F₀/κ brackets). No CODATA,
Cs, or Rb constant exists anywhere in executable code; the measured value appears only
in removable orientation prose.

## 6. The carrier (what ℝ these theorems live on)

Every statement is over `Cut` — the repo's own Dedekind-cut completion of its derived
ℚ (`Phys/Foundation/Continuum*.lean`, ~18 files: completeness, exp/log, π as the
cosine's first zero, derivatives). No `Mathlib.Data.Real` content import anywhere in
the chain; Mathlib supplies interfaces and tactics only. The root posit is
`Phys/Foundation/Fold.lean:63` — `IsFold (look) : Prop := ∀ x, look x + x = 0` — and
`docs/LEDGER.md` records every node from there to N677 with its gate verdict.

## 7. Provenance discipline (how these results were produced)

`workbench/mirror-closure/` holds the frozen preregistrations (`PREREG.md`,
`DERISK-PREREG.md`, `PREREG-AIRTIGHT.md`): candidate laws enumerated and killed
target-independently BEFORE landing computations, exact-rational recon before any
Lean. The de-risk history — including the killed rival coefficient laws and the
retracted near-misses — is preserved there and in the LEDGER entries (N585–N590,
N674–N677), not sanitized.
