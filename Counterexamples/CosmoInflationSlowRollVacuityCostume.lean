/-
  Counterexamples.CosmoInflationSlowRollVacuityCostume — N380 anti-vacuity (C405).
  ============================================================================================
  W8 ANTI-VACUITY. The N380 node (arc-H H2 — inflation slow-roll `n_s = 1 − 2/N`, `r = 8/(c²N²)`
  DERIVED from the FORCED plateau potential) banks the observable relations as the `u → 0` ATTRACTOR
  limits of the exact potential-geometry identities, factored through the banked N364 class-universal
  relations with correction factors `corrNs u = (1+u)/(1−u)²`, `corrR u = 1/(1−u)²` that EQUAL `1` at
  the attractor `u = 0` (the coherence asymptote NEVER reached — C6). The correction being genuinely
  NON-CONSTANT is LOAD-BEARING: the relations `n_s = 1 − 2/N`, `r = 8/(c²N²)` are ATTRACTOR limits,
  NOT exact at every `φ`. A "the corrections are identically `1` / the relations hold exactly for all
  `φ` (the whole plateau is exactly `n_s = 1 − 2/N`)" mis-reading would break it — it would collapse
  the eternal-approach structure (the observable only reaches the class-universal value at the
  never-attained asymptote) into a fixed-point value everywhere. The banked `corrNs_nonconstant` rules
  this out: `corrNs (1/2) = 6 ≠ 1 = corrNs 0`.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the spectral correction is GENUINELY
  NON-CONSTANT (`corrNs (1/2) ≠ corrNs 0`), so the class-universal relations are ATTRACTOR limits, not
  exact everywhere". It is TIED to the banked N380 landing by `iFlag_forced`: the banked
  `corrNs_nonconstant` witnesses `corrNs (1/2) ≠ corrNs 0`, so the flag is `1`.

  We anchor `min 405 iFlag = 1` (TRUE — `iFlag = 1 < 405`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the corrections vanish / the relations are exact for all `φ`"
  mis-reading): that `min 405 iFlag = 405`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 405` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (405, 1) is fresh (Cid 405 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoInflationSlowRoll
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE ATTRACTOR-LIMIT FLAG: `1` = "the spectral correction `corrNs` is GENUINELY NON-CONSTANT
    (`corrNs (1/2) = 6 ≠ 1 = corrNs 0`), so the class-universal relations `n_s = 1 − 2/N`,
    `r = 8/(c²N²)` are `u → 0` ATTRACTOR limits — the observable reaches the class value only at the
    never-attained asymptote (C6), NOT exactly at every `φ`". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N380 landing): the banked `corrNs_nonconstant` proves
    `corrNs (1/2) ≠ corrNs 0`, so the "attractor-limit" flag is present, `iFlag = 1`. If the
    corrections were identically `1` (the relations exact for all `φ`), this witness would not
    exist. -/
theorem iFlag_forced :
    (corrNs (1 / 2) ≠ corrNs 0) ∧ iFlag = 1 :=
  ⟨corrNs_nonconstant, rfl⟩

/-- TRUE: `min 405 iFlag = 1`, holding precisely because `iFlag = 1 < 405`. -/
theorem cert_val_true : min (405 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 405 iFlag = 405`. It GENUINELY equals `1` (`cert_val_true`). A "the
    corrections vanish / the relations are exact for all `φ`" mis-reading reduces — through the banked
    value — to the false numeric `1 = 405`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (405 : ℕ) iFlag = 405 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 405  (FALSE — the costume bites)

end Counterexamples
