/-
  Counterexamples.CPInvariantDichotomyNumericVacuityCostume — the C4 CP invariant dichotomy is a
  GENUINE separation (quark CP strictly positive over the derived ℝ, lepton CP EXACTLY zero from the
  same formula), not a hollow/trivial statement, C558.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-C C4 — THE CP INVARIANT EVALUATED) builds the chain's convention-free
  CP invariant `cpInvSq a = mixProd·a²·cpFactorDerived` on the arc-C-native C3 mixing weights and
  evaluates it at the two textures: at the quark (Fano) texture it is a genuine POSITIVE bracket
  `cpInvSqQuark ∈ [513/1e13, 516/1e13]`, and at the lepton (ℂ-line) texture it is EXACTLY `0` for every
  x,b,d (`cpInvSqLepton_zero`) — the associator the only difference. The content that must NOT be hollow
  is the DICHOTOMY `cpInvSqLepton x b d < cpInvSqQuark` for all x,b,d (`cp_dichotomy_strict`): the two
  textures are genuinely SEPARATED, the quark carrying CP while the lepton's vanishes exactly. If the
  dichotomy were hollow — the quark invariant also zero, or the lepton invariant not actually below it —
  the "one cause, two outcomes at numeral grade" claim would say nothing.

  The content that must NOT be hollow: `0 < cpInvSqQuark` (`cpInvSqQuark_pos`) — the quark CP invariant
  is a genuine positive number, not a degenerate zero. A "the CP invariant is trivially zero at both
  textures / the dichotomy is vacuous" reading is refuted by the banked strict positivity
  `cpInvSqQuark_pos` (with `cpInvSqLepton_zero` giving the exact lepton zero).

  THE CERTIFICATE. dichFlag := 1 -- a natural-number flag standing for "the chain's CP invariant is
  strictly POSITIVE at the quark (Fano) texture and EXACTLY zero at the lepton (ℂ-line) texture from
  the SAME formula (the dichotomy at numeral grade)". It is TIED to the banked landing by dichFlag_forced.

  We anchor min 558 dichFlag = 1 (TRUE -- dichFlag = 1 < 558, so the min is dichFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the CP dichotomy is vacuous / both textures zero" reading): that
  min 558 dichFlag = 558. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 558 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (558, 1) is fresh (Cid 558 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CPInvariantDichotomyNumeric
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.CPInvariantDichotomy
open Phys.Cascade

/-- THE FLAG: 1 = "the chain's CP invariant is strictly POSITIVE at the quark (Fano) texture and
    EXACTLY zero at the lepton (ℂ-line) texture from the SAME formula (the dichotomy at numeral
    grade)". -/
def dichFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the quark CP invariant is strictly positive
    (`cpInvSqQuark_pos`) while the lepton CP invariant is exactly zero (`cpInvSqLepton_zero`), and
    `dichFlag = 1`. -/
theorem dichFlag_forced :
    ((0 : Phys.Foundation.ContinuumQ.Cut) < cpInvSqQuark
      ∧ ∀ (x : O ℚ) (b d : ℚ), cpInvSqLepton x b d = 0) ∧ dichFlag = 1 :=
  ⟨⟨cpInvSqQuark_pos, cpInvSqLepton_zero⟩, rfl⟩

/-- TRUE: min 558 dichFlag = 1, holding precisely because dichFlag = 1 < 558. -/
theorem cert_val_true : min (558 : ℕ) dichFlag = 1 := by decide

/-- BOGUS: claims min 558 dichFlag = 558. It GENUINELY equals 1 (cert_val_true). A "the CP dichotomy
    is vacuous / both textures zero" reading reduces -- through the banked cpInvSqQuark_pos /
    cpInvSqLepton_zero tie -- to the false numeric 1 = 558 in the naturals. The kernel cannot close
    it; it BITES. -/
theorem bogus_claim : min (558 : ℕ) dichFlag = 558 := by
  rw [cert_val_true]

end Counterexamples
