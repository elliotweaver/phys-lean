# C2 — THE LEADING ANGLE EVALUATED (SEED_MIXING §C2) — LANDED

Node: ARC-C C2, task t_05a262b4. Production: Phys/Algebra/CabibboMixingNumeric.lean (namespace Phys.Algebra.CabibboMixing)
Costume: Counterexamples/CabibboMixingNumericVacuityCostume.lean (C556, bites 1=556)

## THE DERIVED OBJECT (C1-native, over the derived ℝ Cut)
The C1 survival-dressed misalignment evaluated through the banked normalized overlap (N312) at the
leading Cabibbo (deep/shallow) edge (b0,b2) of the banked ℝ-descent amplitudes (N339/N340, δ_B=2/9):
  up frame u=(b0,b2), down frame d=(b0, survivalCut·b2), survivalCut=2/3
  cabCross = b0·b2·(1−survivalCut) = b0·b2·(1/3)   [C1 sectorMisalign shape, cabCross_eq_edgeSurvival]
  cabMix2  = cabCross²/(cabNu·cabNd) ∈ [60740/1e7, 60770/1e7]  ≈ 0.0060753

## KEY THEOREMS (17, all foundations-only ⊆ {propext,Classical.choice,Quot.sound})
- cabCross_eq_deficit / cabCross_eq_val / cabCross_eq_edgeSurvival (C1 tie)
- b0b2_lo/hi, cabCross_lo/hi
- b0sq_lo/hi (=mass0), b2sq_lo/hi (=mass2), cabNu_lo/hi, cabNd_eq, cabNd_lo/hi
- ★★ cabMix2_lo / cabMix2_hi (the leading Cabibbo mixing fraction bracket)
- ★ cab_brahmagupta (ring identity) + cab_unitarity (cabMix2+cabAln2=1 EXACT, arctan-free)
- W8: cabMix2_pos, cabMix2_mem (in (0,1)), cabMix2_lt_cabAln2 (dressing bites)
- cabibbo_mixing_numeric (★★★ CAPSTONE, welded)

## GRADE: LEADING ORDER (seed §C2). |V_mix|≈0.0779 derived; measured sinθ_C≈0.2252 REMOVABLE PROSE,
## NEVER fitted. The C1-forced object is the survival-dressed overlap fraction (NOT the ≈0.2438
## undressed b2/b0, which is the separate banked rung-3 object) — SELECT (kanban 481) resolved this
## WITHOUT reaching for the measured value.

## ONE SUCCESSOR: C3 (SEED_MIXING §C3 — THE FULL ANGLE STRUCTURE, the 1-3/2-3 couplings + hierarchy order).

## RESUME (if requeued): production + costume + Phys.lean + manifest C556 + AxiomAudit import/block +
##   LEDGER row (C2) all committed; gate-fast launched. Verify gate log green, then kanban_complete + child C3.
