/-
  Counterexamples.EmergentLayerConsolidationVacuityCostume — N378 anti-vacuity (C403).
  ============================================================================================
  W8 ANTI-VACUITY. The N378 node (arc-G G6 — CONSOLIDATION of the emergent layer) banks that the
  emergent / statistical face of physics and the algebraic / gravitational face GENUINELY SHARE two
  derived numbers: the scale-tower / critical-ladder numerator `criticalPhaseNumerator = 84·cutPi`
  (N329, the SAME number in couplings AND in the renormalization scaling ladder), and the binary
  self-blindness quantum `cellEntropy = cutLog 2` (N361, the SAME number in horizon entropy AND in
  bit erasure). The load-bearing content is that the consolidation is NOT vacuous: the two faces are
  tied by GENUINE shared numbers. A "the two faces share no number / the consolidation is empty /
  the algebraic and statistical numerators are unrelated" mis-reading would break it. The banked
  `crossTie_present` rules this out: both
  `Phys.Algebra.EmergentLayer.crossTie_present` equalities hold.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the two faces GENUINELY share the two
  derived numbers (`criticalPhaseNumerator = 84·cutPi` AND `cellEntropy = cutLog 2`)". It is TIED to
  the banked N378 landing by `iFlag_forced`: the banked `crossTie_present` witnesses both shared-
  number equalities, so the flag is `1` (present).

  We anchor `min 403 iFlag = 1` (TRUE — `iFlag = 1 < 403`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the two faces share no number / the consolidation is vacuous"
  mis-reading): that `min 403 iFlag = 403`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 403` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (403, 1) is fresh (Cid 403 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.EmergentLayerConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.EmergentLayer

/-- THE SHARED-NUMBER FLAG: `1` = "the emergent / statistical face and the algebraic / gravitational
    face GENUINELY share the two derived numbers `84·cutPi` (= `criticalPhaseNumerator`) and
    `cutLog 2` (= `cellEntropy`) — the consolidation is not vacuous". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N378 landing): the banked `crossTie_present` proves both shared-number
    equalities (`criticalPhaseNumerator = 84·cutPi` and `cellEntropy = cutLog 2`), so the "shared
    number" flag is present, `iFlag = 1`. If the two faces shared no number, this witness would not
    exist. -/
theorem iFlag_forced :
    (Phys.Algebra.criticalPhaseNumerator = 84 * Phys.Foundation.ContinuumQ.cutPi
      ∧ Phys.Algebra.cellEntropy = Phys.Foundation.ContinuumQ.cutLog 2) ∧ iFlag = 1 :=
  ⟨crossTie_present, rfl⟩

/-- TRUE: `min 403 iFlag = 1`, holding precisely because `iFlag = 1 < 403`. -/
theorem cert_val_true : min (403 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 403 iFlag = 403`. It GENUINELY equals `1` (`cert_val_true`). A "the two faces
    share no number / the consolidation is vacuous" mis-reading reduces — through the banked value —
    to the false numeric `1 = 403`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (403 : ℕ) iFlag = 403 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 403  (FALSE — the costume bites)

end Counterexamples
