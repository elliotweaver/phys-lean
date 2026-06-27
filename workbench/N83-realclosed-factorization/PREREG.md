# N83 PREREG — THE REAL-CLOSED FACTORIZATION / EVEN-DIM REAL-EIGENVALUE SEED

Frozen before compute. Run 250 (fresh first run, clean tree).

## TARGET (priority order, MEASURE FIRST)
The HEAVY remaining core, using the banked N82 `cuti_isAlgClosed : IsAlgClosed Cuti`.

(0) THE REAL-CLOSED IRREDUCIBLE-DEGREE BOUND — the heart of the factorization:
    `cut_irreducible_natDegree_le_two : ∀ {p : Cut[X]}, Irreducible p → p.natDegree ≤ 2`.
    PROOF SKETCH: p irreducible over Cut, map to Cut[i][X]. Cut[i] is alg-closed (N82), so the
    mapped p has a root z ∈ Cut[i] (deg ≥ 1). minpoly Cut z ∣ p (p over Cut, aeval z p = 0),
    both monic irreducible ⟹ associate ⟹ p.natDegree = (minpoly Cut z).natDegree
    = finrank Cut Cut⟮z⟯, and Cut ⊆ Cut⟮z⟯ ⊆ Cut[i] forces finrank Cut Cut⟮z⟯ ∣ 2, so ≤ 2.

(0b) THE EVEN-DIM SEED (the deliverable that powers existence): for an EvC-self-adjoint g on a
     finite-dim Cut-space V with charpoly having no root in Cut, derive False — hence
     `∃ λ, HasEigenvalue g λ`. ROUTE: charpoly = product of monic irreducibles (UFM over field);
     each irreducible factor has degree ≤ 2 (by (0)) and ≠ 1 (a degree-1 monic factor X - λ ⟹ λ
     a root of charpoly), so degree EXACTLY 2 and neg-disc (N80 cut_monic_quad_irreducible_iff_negDisc);
     aeval g of each is a UNIT (N78 selfadj_negDisc_quad_isUnit); product of units = unit; but
     aeval g charpoly = 0 (Cayley-Hamilton) and 0 ≠ unit. Contradiction.

(i) THE FULL EXISTENCE `∀ g, ∃ c u, g = specOpN c u` — finrank-decreasing induction; deferred/childed
    if (0)+(0b) consume the budget.

## GO / NO-GO
- GO if (0) `cut_irreducible_natDegree_le_two` compiles foundations-only. That is the bankable crown
  of the real-closed factorization (the content Mathlib lacks: degree-≤2 factorization over abstract
  real-closed fields — confirmed N81: Analysis/Polynomial/Factorization is concrete-ℝ-only).
- STRETCH: (0b) the even-dim seed `∃ λ, HasEigenvalue g λ` for self-adjoint g.
- If (0) RESISTS after measure+reframe: bank the conjugation `AlgEquiv` / the splitting of p over
  Cut[i] / the root-in-Cut[i] existence as the structural piece, child the remainder (W1/W3).

## KILL (instrument-failure thresholds, W9)
- Any single obligation that does not close in **KILL = 180s** of wall compile is declared an
  INSTRUMENT failure → measure/decompose/reframe, NOT a longer grind.
- maxHeartbeats: DEFAULT only (200000). NEVER inflate. An inflated ceiling = W9 crime scene.
- If ≥2 probe routes blow up on (0), it becomes a W1 dissolution ticket, not another grind.

## BANK-AS-YOU-GO (W9.8) + ANTI-TIMEOUT
- The instant a lemma compiles clean → move to production `Phys/Algebra/LorentzContinuumIrredDeg.lean`
  (or LorentzContinuumEvenEigen.lean) + wire Phys.lean + AxiomAudit.lean (import AT END + #print axioms)
  + commit BEFORE chasing the next. Checkpoint ~50% turns; finalize (commit + child + complete) with
  turns to spare. Run gate in BACKGROUND.

## COSTUME (W8) — id C114, MUST BITE
A WRONG irreducible-degree bound / even-dim-seed claim reducing to a false numeric DISTINCT from the
banked battery (… C113 1=15). Candidate: a bogus claim that an irreducible Cut-poly can have degree 3
(or that finrank Cut Cut⟮z⟯ = 3 dividing 2), forcing a false numeric like 3=2 → pick a distinct value.

## WORDS-REMOVABLE
Delete Lorentz/spectral/eigen*/self-adjoint/characteristic/factorization/irreducible/real-closed/
Artin-Schreier/even-dim/seed/Spin/SO(9)/isometry → pure field/polynomial math: over the derived
complete ordered field Cut whose degree-2 extension Cut[i] is algebraically closed, every irreducible
p ∈ Cut[X] has natDegree ≤ 2; pure field theory.
