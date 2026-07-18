# C2 — THE LEADING ANGLE EVALUATED (SEED_MIXING §C2) — PREREG

Node: ARC-C C2, task t_05a262b4. Directed successor of C1 (PhaseAlignmentDerivation).
Production target: Phys/Algebra/CabibboMixingNumeric.lean, namespace Phys.Algebra.CabibboMixing.

## THE FORCED OBJECT (C1-native, over the derived ℝ Cut)
The C1 survival-dressed misalignment through the banked normalized overlap, at the leading
(deep/shallow) Cabibbo edge (b0,b2) of the banked ℝ-descent amplitudes:
  up frame   u = (b0, b2)                         [banked N339/N340]
  down frame d = (b0, survivalCut·b2)             [C1: sub-leading amp damped by edgeSurvival=2/3]
  cabCross   = u∧d = b2·b0 − b0·(survivalCut·b2) = b0·b2·(1−survivalCut) = b0·b2·(1/3)   [C1 keystone]
  cabAligned = u·d = b0·b0 + b2·(survivalCut·b2)
  cabNu = b0²+b2²,  cabNd = b0²+(survivalCut·b2)²
  cabMix2 = cabCross²/(cabNu·cabNd)   [the leading Cabibbo mixing fraction |V_mix|², arctan-free]
  cabAln2 = cabAligned²/(cabNu·cabNd)

## LANDINGS (certified two-sided rational brackets over Cut, from banked b0,b2 brackets)
- cabCross ∈ [46018/1e5, 46020/1e5]  (≈0.46019)   [b0·b2/3]
- cabNu    ∈ [599831/1e5, 599840/1e5] (≈5.99834)
- cabNd    ∈ [581130/1e5, 581136/1e5] (≈5.81134)
- ★★ cabMix2 ∈ [60740/1e7, 60770/1e7] (≈0.0060753) — the leading Cabibbo mixing |V_mix|² as an ACTUAL number
  (safe-bracket check: cabMix2 ∈ [0.006075001, 0.006075604] ⊂ declared)
- FREE TOOTH (arctan-free unitarity): cabCross² + cabAligned² = cabNu·cabNd  (Brahmagupta–Fibonacci, ring)
  ⟹ cabMix2 + cabAln2 = 1  EXACTLY (needs cabNu·cabNd ≠ 0)

## GRADE (honest, seed §C2)
LEADING ORDER. |V_mix| ≈ 0.0779 (derived); measured sinθ_C ≈ 0.2252 (sin²≈0.0507) is the
arc-C LIVE-fight residual — REMOVABLE PROSE, in NO proof, NEVER fitted, NEVER chased.
The C1-forced object is the survival-dressed overlap fraction; the ≈0.2438 undressed ratio (b2/b0)
is the SEPARATE banked rung-3 object, not C2's. ONE-PEG LAW: cabMix2 is dimensionless (ratio of
amplitudes) — no new peg.

## PROOF PLAN (staged, W9-bounded — each bracket its own lemma)
1. cabCross_eq: = b0*b2*(1/3) via survivalCut_val + ring
2. b0*b2 product bracket via mul_le_mul (b0_lo/hi, b2_lo/hi, b0_pos, b2_pos) → cabCross_lo/hi
3. cabNu_lo/hi, cabNd_lo/hi via mass0/mass2 brackets (b0²=mass0, b2²=mass2 banked) + survivalCut_val
4. cabMix2_lo/hi via le_div_iff₀/div_le_iff₀ on cabDen_pos + hcross2 + hden (mul_le_mul), nlinarith
5. cab_brahmagupta: cabCross²+cabAligned² = cabNu*cabNd by ring (unfold defs)
6. cab_unitarity: cabMix2+cabAln2 = 1 via div_add_div_same + cab_brahmagupta + cabDen_pos
7. W8: cabMix2_pos, cabMix2 ≠ undressed-square (dressing bites), non-vacuity in (0,1)
8. C1 tie: cabCross = b0*b2*(1 - ((edgeSurvival:ℚ):Cut))  [the C1 sectorMisalign shape over Cut]

## IMPORTS
Phys.Algebra.GenerationDepthDressedMixingNumeric (survivalCut, b0, b2, brackets, mass0/mass2, survivalCut_val)
Phys.Algebra.PhaseAlignmentDerivation (edgeSurvival, sectorMisalign — C1 tie)
open Phys.Foundation.ContinuumQ, Phys.Algebra.GenerationMassRatios, Phys.Algebra.DepthDressedMixing, Phys.Algebra.HJ

## GATE: costume (bites cabMix2 numeral), AxiomAudit import+block, gate-fast D0-D6, LEDGER row, workbench.
## SUCCESSOR: exactly ONE directed child → SEED_MIXING §C3 (THE FULL ANGLE STRUCTURE).
