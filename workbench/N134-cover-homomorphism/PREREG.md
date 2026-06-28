# N134 PREREG — THE GLOBAL/EVEN COVER STRUCTURE the generator-level Clifford/Pin cover opens

FROZEN BEFORE COMPUTE. Run 325.

## Context (banked, N133)
- `CliffC = CliffordAlgebra QvCQuad` (Clifford algebra of the derived Minkowski form over derived Cut).
- `cliffSq`, `cliffAnticomm`, `cliffSandwich`, `cliff_unit_isUnit` (anisotropic `ι a` a UNIT).
- `reflection_clifford_conj`: `ι (houseHolderM a v) = -(QvC a)⁻¹ • (ι a · ι v · ι a)`
  — the generator-level lift (each REFLECTION = conjugation by the unit `ι a`, with a sign).
- N132 `reflection_closure_eq_bvIsomLinMonoid`: every linear BvC-isometry IS a finite reflection word
  = the full group SO⁺(1,9), the surjectivity at the group level.
- `houseHolderM_involutive`, `houseHolderM_isom`, `houseHolderM_apply`.

## MEASURED FRONT (W4.5: ADVANCE, do not re-pin the Lorentz sector)
The generator-level lift carries a SIGN `-(QvC a)⁻¹`. The forward structure it OPENS is the
**EVEN / Spin cover law**: conjugation by the EVEN product `ι a · ι b` (a sign-free Spin element,
even-length word) realizes the COMPOSITION of two reflections `houseHolderM a ∘ houseHolderM b`
on the spinor module `ι(STVC)` — the TWO single-generator signs `-(QvC a)⁻¹`, `-(QvC b)⁻¹` combine,
and the homomorphism property (cover of a PRODUCT = product of covers) is the joint. This is the
two-to-one cover's defining feature: the even subalgebra (Spin) covers SO⁺ without the reflection sign.

PRIMARY TARGET (Layer A — self-contained, "ours", derived from reflection_clifford_conj):
`cover_compose_two` : for `BvC a a ≠ 0`, `BvC b b ≠ 0`, all `v`:
  `ι (houseHolderM a (houseHolderM b v))
     = ((QvC a)⁻¹ * (QvC b)⁻¹) • (ι a · ι b · ι v · (ι b · ι a))`
  (the composition of two reflections = conjugation by the even element `ι a · ι b`, sign-free
  positive scalar `(QvC a)⁻¹·(QvC b)⁻¹` — the SPIN element conjugation; the homomorphism law).
Derivation: apply `reflection_clifford_conj` twice (inner b, then outer a), the two `-` signs
multiply to `+`, regroup the products by associativity. No new content; pure algebra over the lift.

SECONDARY (Layer B — connect to Mathlib's literature cover, OPTIONAL/child):
the anisotropic `ι a` as a `lipschitzGroup`/`pinGroup` element. Heavier (unitary/Units coercion).
Child if Layer A lands and turns remain; do NOT block.

## GO / NO-GO
- GO if `cover_compose_two` (the even/Spin sign-free composition law) compiles foundations-only,
  DERIVED from `reflection_clifford_conj` + Clifford associativity, costume C166 bites.
- NO-GO → decompose: bank whatever sub-lemma compiles (e.g. the sign-cancellation, the single
  regroup), child the remainder.

## KILL (W9 instrument budget)
- Each sub-obligation KILL = 1 bounded probe (`lake env lean`, default heartbeats). If any single
  `module`/`ring`/`simp` on the regrouped Clifford product does NOT close in a bounded probe
  (no inflated maxHeartbeats EVER), it is an INSTRUMENT failure → decompose into named
  associativity steps (`mul_assoc` rewrites), each banked separately. NO monolithic brute.
- The Clifford product is in a noncommutative algebra; regrouping is `mul_assoc`/`mul_smul`, NOT
  `ring` (ring is commutative). Expect a `calc` with explicit `mul_assoc`. Probe FIRST.

## COSTUME C166 (must BITE, W8)
A WRONG even/Spin cover-composition / homomorphism / Clifford-product claim reducing to a false
numeric `1 = 134`, DISTINCT from C165 `1=133`. Candidate: the Clifford form value / scalar
coefficient of the two-generator timelike composition reads a wrong constant. PASS_SIGNATURE ERE
matching a trailing `1 = 134`.

## Physics-words-removable
Delete cover/Spin/Pin/Clifford/spinor/reflection/Lorentz/Minkowski/homomorphism/even/generator →
pure algebra over derived Cut: `ι(houseHolderM a (houseHolderM b v)) = ((QvC a)⁻¹(QvC b)⁻¹)•(ιa·ιb·ιv·ιb·ιa)`.
