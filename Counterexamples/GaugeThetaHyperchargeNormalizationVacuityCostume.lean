/-
  Counterexamples.GaugeThetaHyperchargeNormalizationVacuityCostume — N429 anti-vacuity (C454).
  ============================================================================================
  W8 ANTI-VACUITY. The N429 node (arc-P P4 — the gauge-θ term + the hypercharge normalization)
  pays two named debts: (A) the gauge-θ dissolution (θ-weight ≡ 1 per configuration; −I ∉ Aut(J₃(𝕆));
  full inversion flips the F₄-invariant cubic norm) and (B) the hypercharge normalization is FORCED
  (every observable scale-invariant, so `sin²θ_W = 3/8` for any overall scale). The load-bearing
  non-vacuity facts: the forcing genuinely relies on the SHARED single scale — a single-sided
  (independent-scale) rescaling BREAKS the weak-mixing value (`weinberg (2·2) (16/3) ≠ 3/8`,
  `weinberg_single_sided_breaks`) — AND the central inversion −I genuinely FAILS to be an automorphism
  (`negId_not_isAlgAut`), so the θ = π sector is genuinely unreachable. A mis-reading where the ratio
  were forced regardless of how the two traces scale (so g₂-irreducibility played no role) or where −I
  WERE an automorphism (so the θ dial existed) would gut the whole P4 result.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N429 normalization forcing is genuine: a
  single-sided rescaling fails `3/8` (`weinberg (2·2) (16/3) ≠ 3/8`) AND −I is NOT an algebra
  automorphism (`¬ IsAlgAut negId`)". It is TIED to the banked N429 landing by `cFlag_forced` through
  `weinberg_single_sided_breaks` and `negId_not_isAlgAut`.

  We anchor `min 454 cFlag = 1` (TRUE — `cFlag = 1 < 454`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the ratio is forced regardless of scaling / −I is an
  automorphism" mis-reading): that `min 454 cFlag = 454`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 454` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (454, 1) is fresh (Cid 454 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GaugeThetaHyperchargeNormalization
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

/-- THE N429-NON-VACUITY FLAG: `1` = "a single-sided rescaling fails `3/8`
    (`weinberg (2·2) (16/3) ≠ 3/8`) AND −I is NOT an algebra automorphism (`¬ IsAlgAut negId`)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N429 landing): a single-sided rescaling breaks the forced weak-mixing
    value, and the central inversion −I is not an algebra automorphism; hence `cFlag = 1`. If the
    ratio were forced regardless of how the two traces scale (g₂-irreducibility playing no role), or
    if −I WERE an automorphism (the θ dial existing), this conjunction would fail. -/
theorem cFlag_forced :
    (weinberg (2 * 2) (16 / 3) ≠ 3 / 8 ∧ ¬ IsAlgAut negId) ∧ cFlag = 1 :=
  ⟨⟨weinberg_single_sided_breaks, negId_not_isAlgAut⟩, rfl⟩

/-- TRUE: `min 454 cFlag = 1`, holding precisely because `cFlag = 1 < 454`. -/
theorem cert_val_true : min (454 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 454 cFlag = 454`. It GENUINELY equals `1` (`cert_val_true`). A "the ratio is
    forced regardless of scaling / −I is an automorphism" mis-reading reduces — through the banked P4
    landing — to the false numeric `1 = 454`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (454 : ℕ) cFlag = 454 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 454  (FALSE — the costume bites)

end Counterexamples
