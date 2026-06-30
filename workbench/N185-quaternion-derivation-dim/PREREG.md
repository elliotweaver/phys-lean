# N185 PREREG — DIM of the quaternion inner-derivation Lie algebra = 3 (the so(3)≅su(2) dimension)

## Frozen target (chosen front, W4.5/W9 measure-first)
N184 banked the WEAK-ISOSPIN su(2)≅so(3) BRACKET structure constants
`⁅ad_i,ad_j⁆ = 2·ad_k` (cyclic) + non-vacuity on the inner derivations `adM q = ad_q`
of the ASSOCIATIVE quaternion algebra `H ℚ = CD (Dbl ℚ)`. The bracket is banked; the
**exact DIMENSION 3** of that Lie algebra is NOT. A classification-sufficient
identification of so(3)≅su(2) needs **dim 3 + the non-abelian bracket** (W4.5: the FIRST
sufficient characterization is mandatory; the bracket is already banked, dim=3 completes it).

TARGET: bank `dim_ℚ (inner-derivation Lie algebra of H ℚ) = 3`, i.e. the ℚ-linear inner
derivation map `adL : H ℚ →ₗ[ℚ] Module.End ℚ (H ℚ)`, `q ↦ (x ↦ q·x − x·q)`, has
`finrank ℚ (range adL) = 3`, via rank–nullity:
  finrank(range adL) + finrank(ker adL) = finrank ℚ (H ℚ) = 4   (banked `finrank_H_eq_four`)
  ker adL = the CENTRE of H ℚ = ℚ·1  ⟹  finrank(ker adL) = 1
  ⟹ finrank(range adL) = 3.

The range of `adL` IS the inner-derivation Lie algebra (N184's `adM` are exactly these maps,
ℤ-restricted); so dim = 3 is the so(3)/su(2) dimension. STRETCH (only if light): the EXHAUSTION
`Der(H ℚ) = Inn(H ℚ)` (every Leibniz derivation is inner) giving `dim Der(H ℚ) = 3` exactly —
deferred to a child if heavy (W4.5 do not gold-plate).

## Why this is genuinely-new (not a re-pin, W4.5)
N184 banked the BRACKET (structure constants) + non-vacuity; it did NOT bank any DIMENSION.
The exact dim=3 is the defining-signature fact that, with the banked non-abelian bracket,
pins so(3)≅su(2) the way `dim Der(O)=14` (N20) + semisimple/simple pinned g₂. NO posited
su(2)/so(3)/SU(2)/Lie group; the OBJECT is the derived quaternions H ℚ = CD (Dbl ℚ); ℚ is the
coefficient field the finrank statement is written in (the N6/N16/N42/N184 precedent).

## GO / NO-GO
GO if a bounded probe shows: (a) the centre computation `adQ q = 0 ↔ q ∈ ℚ·1` closes by
coordinate `simp`/`ext` over H ℚ commuting with hI, hJ (4-coordinate check); (b) the
rank–nullity assembly compiles; (c) total probe `lake env lean` clean under the KILL budget.
NO-GO (reframe / decompose) if the centre computation or the ℚ-linear adL setup blows up.

## KILL budget (W9 — instrument wall)
Per-obligation KILL = 90s (`lake env lean` on the isolated obligation). The whole node is
COORDINATE-LIGHT (H ℚ is 4-dimensional; finrank H=4 banked; rank–nullity is a one-line Mathlib
lemma). If ANY single obligation exceeds 90s, it is an INSTRUMENT failure → MEASURE smallest
sub-obligation, decompose, never inflate maxHeartbeats. Expected: whole probe < 30s.

## Anti-vacuity (W8)
Costume C217 (next id), DISTINCT false numeric `3 = 185` (battery uses C214 1=182, C215 1=183,
C216 2=184). The W8 teeth: the dim is a GENUINE 3 (not 0/1/4): centre is exactly 1-dim (ad_1=0
but ad_i≠0), range is exactly 3-dim (3 independent inner derivations ad_i,ad_j,ad_k). A wrong
dim claim (dim=4 / centre=0 / abelian) collapses `3=185` in char-0 ℚ.

## Physics-words-removable
Delete "isospin / weak / gauge / su(2) / so(3)": what remains is the pure statement that the
inner-derivation map of the associative ring `CD (Dbl ℚ)` has 3-dimensional range over ℚ
(kernel = the 1-dim centre), via rank–nullity. No theorem STATEMENT needs a physics word.

## Production / wiring / costume / gate (finalize)
- Production: `Phys/Algebra/DerivationHDim.lean`, namespace `Phys.Algebra`.
- Wire: `Phys.lean` + `Audits/AxiomAudit.lean` (import at END of import list + #print axioms lines).
- Costume: ONE row in `scripts/costume_manifest.tsv`, id C217, `3 = 185`.
- Gate: `scripts/gate.sh` background; poll log with short bounded reads (do NOT block).
- STANDARD check (unbroken/complete/words-removable) before complete.
- Child the next node onto the chain tail; kanban_complete.
