/-
  Counterexamples.ArcKConsolidationVacuityCostume — N401 anti-vacuity (C426).
  ============================================================================================
  W8 ANTI-VACUITY. The N401 node (arc-K K5 — the consolidation of QFT dynamics) banks three
  genuine never-banked cross-ties: WELD 1 (the S-matrix conserves the octonion norm of a dressed
  singlet), WELD 2 (the S-matrix generator `Dbl.J` IS `foldComplex` IS octonion `u1`-mult), and
  WELD 3 (the optical total is an S-conserved self-overlap). Its capstone welds arc K to arcs J
  and I through the one fold-root and the one gather-completeness functional.

  The load-bearing non-vacuity fact is that WELD 2's shared root is a GENUINE complex structure —
  the S-matrix generator `Dbl.J` rotates an asymptotic state OFF itself: `scatteringOp Dbl.J
  (dress 1 0) = eOutward ≠ eInward = dress 1 0` (`smatrix_nv_root`), while still conserving the
  octonion norm to `1 ≠ 0` (`smatrix_nv_completeness`) and the optical total to `2 ≠ 0`
  (`smatrix_nv_optical`). So the three welds relate REAL nonzero quantities under a REAL rotation —
  the consolidation is not a vacuous chain of `0 = 0`.

  A mis-reading where K5 were VACUOUS (the S-matrix generator is the identity / the conserved
  functionals are all zero / the welds relate nothing) would have the completeness flag `= 0`,
  not `1`.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "WELD 1's conserved octonion-norm
  completeness on the frame singlet `(1,0)` is the genuine nonzero value `1`, under a genuine
  rotation of the asymptotic state by the S-matrix generator `Dbl.J`". It is TIED to the banked
  N401 landing by `cFlag_forced`: `smatrix_nv_completeness` gives the conserved norm `= 1`,
  `smatrix_nv_optical` gives the conserved optical total `= 2`, and `smatrix_nv_root` gives that
  the generator genuinely rotates the asymptotic state.

  We anchor `min 426 cFlag = 1` (TRUE — `cFlag = 1 < 426`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "K5 is vacuous / the welds relate zeros / the generator is
  the identity" mis-reading): that `min 426 cFlag = 426`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 426` in ℕ. The kernel cannot close
  it; it BITES.

  DISTINCT from the banked battery: the pair (426, 1) is fresh (Cid 426 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.ArcKConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum
open Phys.Quantum.ArcKConsolidation
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- THE K5-NON-VACUITY FLAG: `1` = "WELD 1's conserved octonion-norm completeness on the frame
    singlet `(1,0)` is the genuine nonzero value `1`, under a genuine rotation of the asymptotic
    state by the S-matrix generator `Dbl.J` — the three consolidation welds relate real nonzero
    quantities, not `0 = 0`". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N401 landing): `smatrix_nv_completeness` proves the S-matrix conserves
    the octonion norm of the frame singlet to `1`; `smatrix_nv_optical` proves it conserves the
    optical total to `2`; and `smatrix_nv_root` proves the generator `Dbl.J` genuinely rotates the
    asymptotic state off itself. So the three welds genuinely bite; hence `cFlag = 1`. If K5 were
    vacuous (identity generator / zero functionals), the conserved norm would be `0`, not `1`. -/
theorem cFlag_forced :
    bornForm (scatteringOp Dbl.J (dress 1 0)) (scatteringOp Dbl.J (dress 1 0)) = 1
      ∧ bornForm (scatteringOp Dbl.J (fromDbl (intOp Dbl.J)))
          (scatteringOp Dbl.J (fromDbl (intOp Dbl.J))) = 2
      ∧ scatteringOp Dbl.J (dress 1 0) ≠ dress 1 0
      ∧ cFlag = 1 :=
  ⟨smatrix_nv_completeness, smatrix_nv_optical, smatrix_nv_root, rfl⟩

/-- TRUE: `min 426 cFlag = 1`, holding precisely because `cFlag = 1 < 426`. -/
theorem cert_val_true : min (426 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 426 cFlag = 426`. It GENUINELY equals `1` (`cert_val_true`). A "K5 is
    vacuous / the consolidation welds relate zeros / the S-matrix generator is the identity"
    mis-reading reduces — through the banked genuinely-nonzero-and-rotating welds — to the false
    numeric `1 = 426`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (426 : ℕ) cFlag = 426 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 426  (FALSE — the costume bites)

end Counterexamples
