# N18 — PREREG (frozen before compute). The W9-prime/W1 dissolution child of N17.

TARGET (ticket): close the EXACT `dim_ℚ Der(O ℚ) = 14` (the so(7)→g₂ cut 21→14)
FORWARD from the banked skew reduction, + the g₂ structure, NO posited G₂ import.

## What is already BANKED (the trunk to derive FROM — do NOT re-derive)
N6 Derivation.lean: `IsDeriv`, the Lie algebra, `witnessDeriv` (nonzero), `liftEnd`/
`innerDeriv` machinery. N16 DerivationDim.lean: `deriv_one` (D 1 = 0). N17
DerivationSkew.lean: `Module ℚ (O ℚ)` (the 8-dim ℚ-vector space, machinery on the
DERIVED object), `deriv_qsmul` (ℚ-linear), `trace_id` (x + star x = (2 reQ x)•1),
`deriv_star` (D(star x) = −D x), `deriv_real_zero` (kills self-conjugate),
`selfMul_selfconj`, ★ `deriv_norm_preserve` (D x·star x = x·D x = the MULTIPLICATIVE
skew = Der ⊆ so(Born) = so(7), coordinate-free), `deriv_skew_polar`, `witnessDeriv_skew`.

## NUMERICS (workbench/N16-g2-dimension, re-verified independently THIS RUN, W6)
EXACT rational: rank 50 / nullity 14 of the 512×64 Leibniz system ⟹ dim_ℚ Der(O ℚ) = 14.
EVERY basis derivation: kills the unit (col 0 = 0), is SKEW (M = −Mᵀ ⟹ so(7)),
maps INTO Im (row 0 = 0), commutes with star. Explicit 14 integer-sparse basis
(nnz=4 each, rank 14), pivots [10,11,12,13,14,15,19,20,21,22,23,37,38,39].

## ★ THE W9-PRIME HONEST ASSESSMENT (anti-circling, W9 item 5/7)
The EXACT finrank = 14 has TWO halves, BOTH coordinate computations the W9 FINDINGS
record as DEAD for Lean brute:
  (U) upper bound dim ≤ 14: needs finrank infra on O ℚ (a ℚ-basis + the ℚ-linear-map
      submodule) PLUS the rep-theoretic cut so(7)→g₂ (21→14) — the literature's
      representation computation, genuinely hard.
  (L) lower bound dim ≥ 14: exhibit 14 explicit independent derivations (each an
      IsDeriv coordinate identity + a 14×64 independence rank).
N16 and N17 BOTH childed this. N18 must NOT merely re-child: it must bank a genuine
NEW forward increment, then child a SHARPER remainder.

## GO TARGET (the genuinely-new, coordinate-FREE, count-relevant forward core)
Complete the explicit `Der(O ℚ) ⊆ so(7)` characterization in MULTIPLICATIVE form —
the two structural constraints the numerics check separately and N17 did NOT bank:
  ★ `deriv_jordan_anticomm` — for imaginary x (star x = −x): `D x * x + x * D x = 0`
     (the Jordan/Born anticommutation, straight from `deriv_norm_preserve` + star x=−x).
  ★ `deriv_maps_im` / `deriv_im_zero` — EVERY derivation is TRACE-FREE: `star (D x) =
     − D x`, i.e. `D` maps O into the 7-dim imaginary subspace (reQ (D x) = 0).
  ★ `deriv_comm_star` — `D (star x) = star (D x)`: a derivation COMMUTES with
     conjugation (corollary of deriv_maps_im + deriv_star).
THE FORWARD PROOF (coordinate-free, NO 512×64 brute — the THE-ONE-LAW reframe):
  for imaginary x, skew ⟹ {x,Dx}=0 (iii); star of (iii) ⟹ {x, star Dx}=0 (iv);
  (iii)+(iv) ⟹ (Dx + star Dx)·x + x·(Dx + star Dx) = 0; trace_id ⟹ Dx+star Dx =
  (2 reQ Dx)•1 central ⟹ 4·reQ(Dx)•x = 0; x imaginary nonzero ⟹ reQ(Dx)=0. General
  x reduces to its imaginary part (real part killed by deriv_real_zero). NO coordinates.
STRETCH (only if cheap, bank-as-you-go): `FiniteDimensional ℚ (O ℚ)` / finrank = 8
(prerequisite infra for ANY finrank statement); a concrete lower-bound seed reusing
banked `innerDeriv` (Der is genuinely multi-dimensional). NOT load-bearing for GO.

## NO-GO / KILL (compile-cost budget, frozen — W9)
- KILL per obligation: 90 s wall, DEFAULT maxHeartbeats (NEVER inflate). If any GO
  lemma fails to elaborate within 90 s → it is an INSTRUMENT signal: restructure
  (stage the rewrites / smaller named steps), do NOT re-run the same form, do NOT
  inflate the ceiling. Re-measuring a known-blowup form is the W9 item-5 violation.
- The GO core is coordinate-FREE (manipulates banked multiplicative identities + smul);
  if a step silently `ext`/`ring`-expands 8 coords and balloons → KILL, that is the
  brute path leaking in; reframe through the banked identities.
- MEASURE first (W9.2): probe each GO lemma in isolated scratch BEFORE production.
- BANK-AS-YOU-GO (W9.8): the instant a lemma elaborates clean (exit 0, #print axioms
  ⊆ {propext, Classical.choice, Quot.sound}), move to production + commit. Never hoard.
- DECOMPOSE WITH TURNS TO SPARE (W3): if the GO core does not fully land, bank what
  compiled and child the SHARPENED remainder (the finrank=14 cut + ≅g₂ + the explicit
  basis), linked on the chain tail. Never run an unbounded compile inside the turn budget.

## EXPECTED OUTCOME
GO core banked (the so(7) structural picture COMPLETE in multiplicative form) +
the EXACT finrank=14 (cut 21→14 upper + dim≥14 lower + ≅g₂) childed as N19 with the
explicit basis as starting data and finrank-infra-on-O-ℚ noted as its prerequisite.
This is forward progress (NEW theorems: trace-free + star-commute), NOT a re-child.

## COSTUME (W8, must bite)
A derivation asserted to have NONZERO real output (violate deriv_maps_im) on the banked
nonzero `witnessDeriv` at a concrete point → false core. (The WRONG-DIMENSION costume —
13/15 or a fake basis with a ℚ-linear dependence — ships with the finrank child N19,
where the dimension is actually stated; this run's costume bites the structural claim,
consistent with N16 C35 / N17 C36 which were structural.)

## STANDARD (the second gate)
UNBROKEN: only banked DerivationSkew/DerivationDim/Derivation + Mathlib machinery.
COMPLETE: foundations-only, verified by #print axioms myself. PHYSICS-WORDS-REMOVABLE:
delete gauge/g₂/automorphism/orthogonal → every Leibniz-derivation of the Cayley–Dickson
double of a double is trace-free (annihilates the real part) and commutes with the
involution — pure algebra, no statement needs a physics word.
