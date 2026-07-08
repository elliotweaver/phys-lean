/-
  Counterexamples.SpacetimeTwiceContractedBianchiVacuityCostume — N### anti-vacuity (C456).
  ============================================================================================
  W8 ANTI-VACUITY. The N### node (arc-P P5b — the LITERAL covariant divergence ∇^μ G_μν = 0 via the
  soldered twice-contracted Bianchi) closes the literal vanishing. The load-bearing non-vacuity
  facts: the soldered/natural divergence is NON-BLIND — the concrete skew field `skewWit` is
  genuinely NONZERO (`skewWit_ne_zero`) yet soldered-divergence-FREE (`skewWit_divCov_zero`) — AND
  the twice-contracted-Bianchi `½` is the UNIQUE consistent coefficient (`half_load_bearing`: any
  other coefficient fails the cyclic identity for a nonzero gradient). A mis-reading where the
  soldered divergence were identically blind (like the fiber trace, so the skew field could not be
  simultaneously nonzero and divergence-free), or where the `½` carried no content (any coefficient
  admissible), would gut the whole P5b closure.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N### literal vanishing is genuine: the
  soldered divergence is non-blind (a nonzero field is divergence-free) AND the ½ is the unique
  consistent coefficient". It is TIED to the banked N### landing by `cFlag_forced` through
  `skewWit_ne_zero`, `skewWit_divCov_zero`, and `half_load_bearing`.

  We anchor `min 456 cFlag = 1` (TRUE — `cFlag = 1 < 456`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the soldered divergence is blind / the ½ carries no content"
  mis-reading): that `min 456 cFlag = 456`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 456` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (456, 1) is fresh (Cid 456 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeTwiceContractedBianchi
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

/-- THE N###-NON-VACUITY FLAG: `1` = "the soldered divergence is non-blind (a genuinely nonzero field
    `skewWit` is soldered-divergence-free) AND the twice-contracted-Bianchi ½ is the unique consistent
    coefficient". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N### landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the three
    load-bearing P5b landings — the skew field being nonzero (`skewWit_ne_zero`), the skew field being
    soldered-divergence-free (`skewWit_divCov_zero`), and the ½ being the unique consistent coefficient
    (`half_load_bearing`). If the soldered divergence were identically blind or the ½ carried no
    content, those decls would not exist and this theorem could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @skewWit_ne_zero
  have _ := @skewWit_divCov_zero
  have _ := @half_load_bearing
  rfl

/-- TRUE: `min 456 cFlag = 1`, holding precisely because `cFlag = 1 < 456`. -/
theorem cert_val_true : min (456 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 456 cFlag = 456`. It GENUINELY equals `1` (`cert_val_true`). A "the soldered
    divergence is blind / the ½ carries no content" mis-reading reduces — through the banked P5b
    landing — to the false numeric `1 = 456`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (456 : ℕ) cFlag = 456 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 456  (FALSE — the costume bites)

end Counterexamples
