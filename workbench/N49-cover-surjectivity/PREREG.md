# N49 PREREG — THE CONTINUUM SURJECTIVITY onto SO⁺(1,9) (frozen before compute)

## THE TARGET (ticket framing)
The full surjectivity: every orientation/time-preserving isometry of the banked (1,9)
form is a finite product of boost+rotation generators — `spinorCoverMonoid` IS the WHOLE
connected component SO⁺(1,9). Over the DERIVED ℝ `Cut`, NOT Mathlib ℝ/ℂ, NOT a posited
Lorentz group.

## STRUCTURAL MEASUREMENT (banked-chain reconnaissance, done before compute)
- `O (R) [CommRing R] := CD (H R)`, `H R := CD (Dbl R)`, `Dbl R := CD R` — carriers are
  GENERIC over the base CommRing. `CD.narCD`/`CD.srCD` (NonAssocRing/StarRing on `CD A`)
  generic over `[NonAssocRing A] [StarRing A]`. `Nrm`, `Nrm_mul_of_doubled_base` generic.
- `Cut` (derived ℝ, N11–N13) is banked: `CommRing`, `Field`, `Archimedean`,
  `ConditionallyCompleteLinearOrder`, `CompleteSpace`, `IsStrictOrderedRing`. The genuine
  derived continuum. ⟹ `O Cut`, `STV_Cut = Cut × Cut × O Cut` are constructible IF a
  `StarRing Cut` + the `Cut`-module instances on the carriers exist.
- GATING RISKS measured-missing: (1) NO `StarRing Cut` instance (trivial star=id for a
  CommRing — cheap to add). (2) module instances `cdModuleQ`/`dblModuleQ` are ℚ-PINNED
  (`Module ℚ ...`); need `Cut`-analogs `Module Cut (O Cut)` etc. (3) `gForm`/`Qform`/`reQ`
  ℚ-PINNED (`reQ : O ℚ → ℚ`); need `Cut`-analogs.
- NO exp/cosh/sinh on `Cut` banked (only summability). ⟹ the cosh/sinh RAPIDITY
  parametrization is NOT available. THE ONE LAW / W1 REFRAME: the unit hyperbola over a
  field does NOT need cosh/sinh — a boost point is just any `(a,b)` with `a²−b²=1`. The
  rapidity coordinatization is a STANDARD-PHYSICS habit; the theory-native object is the
  algebraic hyperbola point. The boost-isometry proof (`linear_combination (t²−x²)·h`) is
  PURE FIELD ARITHMETIC and transfers to ANY field, incl. Cut, with no analysis.

## W3 DECOMPOSITION (forced — the full surjectivity is the heavy Lie-theoretic core)
The full surjectivity onto the continuous 45-dim SO⁺(1,9) is a deep Cartan/polar-
decomposition theorem; Mathlib has no SO⁺(1,9), no octonionic spinor cover, no Lie
machinery for it. That is the heavy core (b)/(c). The tractable, genuinely-FORWARD,
theory-native sub-node (a) the ticket names FIRST: re-ground the carrier + form + the
boost/rotation generators over the DERIVED ℝ `Cut`, and show the CONTINUUM hyperbola of
boosts (the irrational-rapidity boosts the rational cover CANNOT reach) acts by isometries
of the continuum (1,9) form — the continuum content that surjectivity REQUIRES. Child the
full Cartan-generation surjectivity (b)/(c) onto the chain tail.

## GO / NO-GO (frozen)
- GO target N49 = THE CONTINUUM RE-GROUNDING: bank, over the derived ℝ `Cut`:
  (i) `StarRing Cut` (star=id); the `Cut`-module structure on the carriers `O Cut`;
  (ii) the form `QvC` / `QformC` over `Cut` (analog of N43 `Qform`, generic where possible);
  (iii) the boost `boostC a b` (`a²−b²=1`) and rotation `rotC u` (`gFormC u u = 1`) as
       isometries of the continuum form (analogs of N45 `boost_isom`/`rot_isom`);
  (iv) NON-VACUITY (W8): a GENUINELY IRRATIONAL boost point on the Cut-hyperbola (built
       from the derived √2) that is NOT a rational boost — the continuum strictly extends
       the rational cover. THIS is the continuum content.
- If the module/carrier instances over `Cut` RESIST (a genuine infra wall), MEASURE the
  smallest failing obligation, and either BUILD the instance (W1) or, if it is itself a
  substantial sub-node, bank what compiles + child the remainder (W3). Failure / silent
  scope-reduction NOT on the menu.
- The full surjectivity onto SO⁺(1,9) is CHILDED as N50 (the heavy Cartan-generation core
  / honest W1 dissolution ticket), NOT attempted in this run.

## KILL BUDGET (W9 — instrument-failure thresholds, frozen)
- Any SINGLE obligation that does not close in a bounded probe within ~90s of `lake env
  lean` wall-time, OR drives RSS into many GB, OR needs `maxHeartbeats` raised above
  default = declared an INSTRUMENT failure ⟹ measure/decompose/reframe, NOT a longer grind.
- NEVER run an unbounded `lake build` inside the turn budget; measure in isolated
  `lake env lean Phys/<probe>.lean` probes first. Gate runs in BACKGROUND.
- ANTI-TIMEOUT: checkpoint (commit + wire) the instant a lemma compiles clean; do NOT
  hoard for a grand assembly. Finalize with turns to spare (D6 axiom audit cold ≈ 6 min).

## COSTUME C80 (must BITE a WRONG claim, W8)
The WRONG claim that the RATIONAL boost generators (over ℚ) ALONE surject onto / reach the
CONTINUUM hyperbola — i.e. that an irrational Cut-boost equals some rational boost. The
wrong claim must FAIL to compile. Reuse banked objects (derived √2, Cut, boostC).

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz / boost / spinor / rotation / SO⁺(1,9) / isometry / cover / surjectivity /
rapidity": what remains is pure math about `Cut`-linear self-maps of `Cut × Cut × O Cut`
preserving `t² − x² − gFormC v v`, the continuum hyperbola `{(a,b) : a²−b²=1}` over the
derived complete ordered field `Cut`, and that it strictly extends the rational points.
