/-
  Counterexamples.OctonionJordanGenerationChargesWrongValueCostume — N304 anti-vacuity (C333).
  ===========================================================================
  W8 ANTI-VACUITY. The N304 node banks the GENERATION FOLD-ROOT CHARGES: the single banked family
  complex-structure generator `famMixJ = ⁅famC, kAB⁆ ∈ f₄ = derH3` (N303) acts DIAGONALLY on the
  three cap-forced generation slots `slotA 1, slotB 1, slotC 1` with three DISTINCT NONZERO integer
  fold-root (`u1`) charges `+2, −2, −4`. The load-bearing NON-TRIVIALITY is that the first-slot charge
  is a genuine NONZERO fold-root phase — `famMixJ (slotA 1) = slotA (2 • u1) ≠ 0`, whose deep-IMAGINARY
  coordinate (the fold-root axis `.re.re.im`) is `2` — NOT the trivial zero. If the generator acted
  trivially on the generations (charge `0`), the three generations would be indistinguishable and the
  whole "the generations are told apart by fold-root phase" statement would be vacuous.

  The certificate is the magnitude of the first generation's fold-root charge. `famMixJ (slotA 1)`
  equals `slotA (2 • u1)` (`famMixJ_slotA_one`), whose `(0,1)` entry is `2 • u1` (`slotA_entry`),
  fold-root (deep-imaginary) coordinate `2`:

      `certVal := ((famMixJ (slotA 1)) 0 1).re.re.im   (= 2)`.

  We anchor `certVal.num.natAbs = 2` (TRUE), packaged as `min 333 (certVal.num.natAbs) = 2`, TIED to
  the node's charge non-vacuity via `famMixJ_slotA_one` (the generator genuinely charges the first
  generation by fold-root `+2`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the generator acts trivially on the generations /
  the charge is zero / the generations are indistinguishable / the charge distinction is vacuous):
  that `min 333 (…) = 333`. It GENUINELY equals `2` (`cert_val_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `2 = 333` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (333, 2) is fresh (RHS 333 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationCharges
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE GENERATION-CHARGE CERTIFICATE: the fold-root (deep-imaginary `.re.re.im`) coordinate of the
    `(0,1)` entry of `famMixJ = ⁅famC, kAB⁆` applied to `slotA 1`. By `famMixJ_slotA_one` this is
    `slotA (2 • u1)`, whose `(0,1)` entry is `2 • u1`, fold-root coordinate `2`. -/
noncomputable def certVal : ℚ :=
  ((⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotA 1)) 0 1).re.re.im

/-- TRUE (tied to the banked N304 generation charge via `famMixJ_slotA_one`): the generator charges
    the first generation by fold-root `+2`, so the moved `(0,1)` fold-root coordinate is `2`. -/
theorem certVal_eq : certVal = 2 := by
  unfold certVal
  rw [famMixJ_slotA_one, slotA_entry]
  simp [u1, cd_qsmul_re]

/-- TRUE: the magnitude of the first generation's fold-root charge is `2`. -/
theorem certNum_true : certVal.num.natAbs = 2 := by rw [certVal_eq]; decide

/-- TRUE: `min 333 (magnitude of the certificate) = 2`, holding precisely because the generator
    genuinely charges the first generation by fold-root `+2` — the charge distinction is non-vacuous. -/
theorem cert_val_true : min (333 : ℕ) certVal.num.natAbs = 2 := by
  rw [certNum_true]; decide

/-- BOGUS: claims `min 333 (magnitude of the certificate) = 333`. It GENUINELY equals `2`
    (`cert_val_true`). The WRONG reading (the generator acts trivially / the charge is zero / the
    generations are indistinguishable) reduces — through the banked value — to the false numeric
    `2 = 333`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (333 : ℕ) certVal.num.natAbs = 333 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 333  (FALSE — the costume bites)

end Counterexamples
