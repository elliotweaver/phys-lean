# C1 — THE PHASE-ALIGNMENT DERIVATION (SEED_MIXING §C1) — LANDED

Node: ARC-C C1, task t_749ad73f. Production: Phys/Algebra/PhaseAlignmentDerivation.lean
Costume: Counterexamples/PhaseAlignmentDerivationVacuityCostume.lean (C555, bites 1=555)

## THE DERIVED OBJECT
`sectorMisalign a₀ a₁ = (mixV a₀ a₁ a₀ (edgeSurvival·a₁)) 1 0 = a₀·a₁·(1 − edgeSurvival)`
The two-sector frame misalignment = the amplitude product × the self-blind survival DEFICIT (1−2/3)=1/3.
Down frame = up frame with sub-leading amplitude damped by ONE banked survival factor edgeSurvival=tr Poth/3=2/3
(the down-type sector sits one cascade-doubling rung deeper — banked EdgeBornSurvival depth asymmetry).

## KEY THEOREMS (13, all foundations-only ⊆ {propext,Classical.choice,Quot.sound})
- sectorMisalign_eq_deficit (★★★ the keystone: misalignment = a₀·a₁·(1−edgeSurvival))
- deficit_val (1−edgeSurvival=1/3), sectorMisalign_val
- sectorMisalign_nonzero (★★★ W8(a): mixing≠0 re-emerges as CONSEQUENCE of the deficit≠0)
- flat_survival_no_mixing (★★ W8: survival=1 → 0, mixing forced by deficit), deficit_ne_zero
- dressed_cp_fano (★★★ W8(b): CP=−misalignment on Fano line)
- dressed_cp_cline (★★★ W8(b): CP=0 on ℂ-line, same machinery), dressed_cp_dichotomy
- misalign_deficit_times_survival_is_cyclephase (★★★ ONE CAUSE: edgeSurvival·(1−edgeSurvival)=2/9=δ_B)
- sectorMisalign_ground, sectorMisalign_witness (★ nonzero −2/3 at (1,3,1,0))
- phase_alignment_derivation (★★★ CAPSTONE, welded)

## GRADE: THEOREM-EXACT over ℚ for the structure. Numeric Cabibbo angle = C2 (deferred, leading order, NEVER fitted).
## ONE SUCCESSOR: C2 (SEED_MIXING §C2 — the leading angle evaluated as a certified bracket).

## RESUME (if requeued): production + costume + Phys.lean + manifest + AxiomAudit import/block + LEDGER row
   all committed; gate-fast launched. Verify gate log green, then kanban_complete + child C2.
