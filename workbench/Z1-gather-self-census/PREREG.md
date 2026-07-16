# Z1 PREREG — THE GATHER SELF-CENSUS (★★★ keystone, opens ARC Z)

## THE TARGET (seed §Z1)
Derive, from the banked connection/associator content, the per-band screening contribution of
the **gather resolving ITSELF** — its **census** (the count) AND its **sense** (which way it
enters the screening sum), both as THEOREMS, foundations-only, over ℚ and cast into the banked
derived ℝ `Cut`. W8 teeth: the wrong census and the wrong sense provably excluded.

## THE THEORY-NATIVE READING (the fold's own minus — the whole node)
The X2/X6 running census is the **matter** self-overlap: the charge `Q` is a *self-adjoint*
observable, so its trace-form self-overlap `Tr(Q²) = +16/3 > 0` — the matter census enters the
screening sum with the **POSITIVE** sense (`invAlpha` runs UP by matter alone).

The **gather** (the connection) resolves itself too. Its generators are the derived Lie-algebra
elements — the banked `chargeOp = crossOp u1` and the isospin Cartan `imRep DI` — which are
**SKEW-adjoint** (banked: they lie in `skewAdjointLieSubalgebra bornBil`,
`cross_seven_in_so7_structure` (i),(ii), N-TowerGatherObstructionAdjointSo7). Skew-adjointness is
`X* = -X` — the infinitesimal form of the fold law `look = -id` (`fold_eq_neg`, N1). Therefore the
gather's trace-form self-overlap is
      B(X,X) = trace(X∘X) = -Σ_{ij} (X_ij)² ≤ 0     (< 0 for X ≠ 0),
banked concretely as `B(chargeOp,chargeOp) = -6` and `B(imRep DI, imRep DI) = -16` (N253).
So the **gather self-census enters with the OPPOSITE (NEGATIVE) sense** — anti-screening. This is
the fold's own minus, COUNTED, not the field's measured β-coefficient put in by hand. It closes the
sign/amount that N342 (Weinberg running) left as an honest parameter (`d2 < isoDepth`).

ONE CAUSE: the same antisymmetry (`look = -id`) that is self-blindness at N1 is skew-adjointness at
the generator level and the negative sense of the gather self-census here.

## THE DERIVATION (production `Phys/Algebra/GatherSelfCensus.lean`, arc-Z)

**Part A — THE GENERAL SENSE LAW (the count + the sign), over a general ring/ordered field.**
For `M : Matrix (Fin n) (Fin n) 𝕜`, define the Hilbert–Schmidt census
`hsCensus M = ∑ i, ∑ j, (M i j)²` (≥ 0) and `traceSq M = (M*M).trace`.
- `traceSq_skew  : Mᵀ = -M → traceSq M = -hsCensus M`      (algebraic identity, CommRing)
- `traceSq_symm  : Mᵀ =  M → traceSq M =  hsCensus M`      (algebraic identity, CommRing)
- `hsCensus_nonneg`, `hsCensus_eq_zero_iff` (M = 0 ⟺ census 0), over ordered field.
- COROLLARIES (ordered field): skew ⟹ `traceSq ≤ 0`, and `< 0` for `M ≠ 0`; symm ⟹ `≥ 0`, `> 0`.
- `skew_is_negation : Mᵀ = -M ↔ ∀ i j, M j i = -(M i j)` — the transpose (look-back across the
  diagonal) IS the negation: the fold law `fold_eq_neg` shape at matrix level (the tie, formal).

**Part B — THE GATHER REALIZES THE NEGATIVE SENSE (banked instantiation).**
The gather generators are skew-adjoint (banked `cross_seven_in_so7_structure`), and their
trace-form self-census values are banked `B_chargeOp_chargeOp = -6`, `B_imRep_DI = -16` — both
`< 0`. State: `gatherCharge_selfCensus_neg : traceForm7 chargeOp chargeOp < 0` (and `= -6`);
`gatherIsospin_selfCensus_neg : traceForm7 (imRep DI) (imRep DI) < 0` (and `= -16`). Also exhibit
their matrices `Cmat`, `Imat` (banked `chargeOp = qI Cmat`, `imRep DI = qI Imat`) as skew via
`decide` — connecting the banked value to Part A's mechanism (skew ⟹ negative).

**Part C — THE MATTER CENSUS IS THE POSITIVE SENSE.**
`chargeTraceDepth = Tr(Q²) = 16/3 > 0` (banked `chargeTraceDepth_pos`). Opposite sign to the gather.

**Part D — THE OPPOSITE-SENSE THEOREM (the count + sense, welded, over `Cut`).**
`gather_matter_opposite_sense`: `traceForm7 chargeOp chargeOp < 0 < chargeTraceDepth`
and cast into `Cut`: the gather self-census enters the running sum with the sign opposite to the
matter census. The census (the counts −6, −16, +16/3) AND the sense (the signs) welded.

**Part E — W8 TEETH.**
- Wrong sense excluded: `traceForm7 chargeOp chargeOp ≠ 6` and `< 0` (not the matter-style positive).
- Opposite to matter: `< 0 < chargeTraceDepth` (genuinely different signs).
- Abelian tooth: a ZERO generator has zero self-census (`traceSq 0 = 0`) — an abelian (self-
  coupling-free) connection contributes NO gather anti-screening; the negative sense needs a
  genuinely nonzero skew generator (why U(1) has no gather self-census / pure matter screening).
- Garbage witness fails: a NON-skew, NON-symmetric matrix (`!![1,1;0,0]`) has `traceSq = 1 > 0`
  despite being "gather-shaped" — the skew hypothesis is LOAD-BEARING for the negative sense.
- Census non-vacuity: `hsCensus` of a nonzero skew matrix is `> 0` (the count is genuine).

## WORDS-REMOVABLE (STANDARD §2)
Delete "gather / connection / screening / anti-screening / charge / isospin / matter / coupling":
what remains is — for `M : Matrix (Fin n) (Fin n) 𝕜`, `traceSq M = -hsCensus M` when `Mᵀ = -M`
and `= +hsCensus M` when `Mᵀ = M`, so the trace-of-square has sign opposite between the
antisymmetric and symmetric cases; and for the banked concrete endomorphisms `crossOp u1`,
`imRep DI` on `ImO` (skew-adjoint, banked), the trace-form self-overlaps are `-6`, `-16` (negative),
while the banked `chargeTraceDepth = 16/3` is positive. Pure linear algebra over the banked objects.

## NOT FREE-FLOATING
Part A is the general law (machinery, polymorphic over the ring). Parts B–E instantiate it on the
BANKED derived objects: `chargeOp`/`imRep DI`/`traceForm7`/`Cmat`/`Imat` on `ImO = 7` of `O ℚ`
(N253), the banked skew-adjointness `cross_seven_in_so7_structure` (N-AdjointSo7), the banked
census `chargeTraceDepth` over `Cut` (N317/N461), and the fold law `fold_eq_neg` (N1). The gather
self-census is a READ of these banked objects, not a new posit.

## HARD GUARDS
G1 the signs/counts FALL OUT of skew/symm; no value premised. G2 no empirical number. G3 the
census is a count, the sense a sign — both exact ℚ, cast to `Cut`. G4 derived (the skew-adjointness
is banked; the negative sense is `-Σ(M_ij)²`). G5 words-removable (above). G6 foundations-only,
ground ℚ/`Cut`, NO Mathlib ℝ. G7 one law — the negative sense IS the fold's minus, no fight. G8
teeth (above): wrong sense, garbage witness, abelian, non-vacuity.

## COMPILE-COST BUDGET / KILL
Part A: elementary `Finset.sum` manipulation + `Matrix.trace`/`Matrix.mul_apply` — bounded, small.
Part B: cite banked `-6`/`-16` (already `decide`'d in N253) + `decide` on 7×7 skew (concrete, done
before in N253). Part C/D/E: `norm_num`/`decide` on the banked values + tiny 2×2 garbage witness.
KILL: if the 7×7 `decide` skew-check or any single obligation exceeds ~60s, isolate/decompose; do
NOT inflate heartbeats. Prefer citing banked N253 values over re-deriving the 7×7 trace.
