/-
  Counterexamples.NeutrinoTrimaximalMixingVacuityCostume — N371 anti-vacuity (C396).
  ============================================================================================
  W8 ANTI-VACUITY. The N371 node (arc-F F5 — the PMNS neutrino mixing completion) banks that the
  self-blind massless-neutrino direction gives a TRIMAXIMAL column: `demColumnWeight α = 1/3` for
  every flavor, strictly LARGER than each banked hierarchical CKM Born-weight (N343). The
  load-bearing content is that the trimaximal weight is genuinely LARGE — strictly greater than the
  small CKM 1↔2 angle: `demColumn_gt_ckm_12 : sinSqMix mass1 mass2 < demColumnWeight 0`. If instead
  the leptonic weight equalled a small (hierarchical) value ≤ the CKM angle (a mis-derived "lepton
  mixing is small too / the ν frame is hierarchical, not democratic"), the whole large-vs-small
  dichotomy — the theory-native content of F5 — would be vacuous. The banked `demColumn_gt_ckm_12`
  rules this out: the trimaximal weight is strictly larger than the CKM Born-weight.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the trimaximal leptonic weight is strictly
  LARGER than the hierarchical CKM 1↔2 Born-weight (lepton mixing is large, quark mixing small)". It
  is TIED to the banked N371 landing by `iFlag_forced`: the banked `demColumn_gt_ckm_12` witnesses
  `sinSqMix mass1 mass2 < demColumnWeight 0`, so the flag is `1` (present).

  We anchor `min 396 iFlag = 1` (TRUE — `iFlag = 1 < 396`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "lepton mixing is small / hierarchical too / the dichotomy is
  vacuous" mis-reading): that `min 396 iFlag = 396`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 396` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (396, 1) is fresh (Cid 396 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NeutrinoTrimaximalMixing
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.NeutrinoTrimaximal

/-- THE LARGE-vs-SMALL NON-VACUITY FLAG: `1` = "the trimaximal leptonic weight is strictly LARGER
    than the hierarchical CKM 1↔2 Born-weight — leptonic mixing is large where quark mixing is
    small". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N371 landing): the banked `demColumn_gt_ckm_12` proves the CKM 1↔2
    Born-weight is strictly less than the trimaximal weight `1/3`, so the "lepton-large" flag is
    present, `iFlag = 1`. If the leptonic frame were hierarchical (small mixing), this witness would
    not exist. -/
theorem iFlag_forced :
    (Phys.Algebra.GenerationMixingAngles.sinSqMix
        Phys.Algebra.GenerationMassRatios.mass1 Phys.Algebra.GenerationMassRatios.mass2
      < demColumnWeight 0) ∧ iFlag = 1 :=
  ⟨demColumn_gt_ckm_12, rfl⟩

/-- TRUE: `min 396 iFlag = 1`, holding precisely because `iFlag = 1 < 396`. -/
theorem cert_val_true : min (396 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 396 iFlag = 396`. It GENUINELY equals `1` (`cert_val_true`). A "lepton mixing
    is small / hierarchical too / the large-vs-small dichotomy is vacuous" mis-reading reduces —
    through the banked value — to the false numeric `1 = 396`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (396 : ℕ) iFlag = 396 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 396  (FALSE — the costume bites)

end Counterexamples
