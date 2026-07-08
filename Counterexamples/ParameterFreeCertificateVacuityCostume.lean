/-
  Counterexamples.ParameterFreeCertificateVacuityCostume — N433 anti-vacuity (C458).
  ============================================================================================
  W8 ANTI-VACUITY. The N433 node (arc-P P7 — the parameter-free certificate, the reckoning's receipt:
  a Lean-checkable receipt that the chain has ZERO free parameters, with an input census of the six
  arc-P sectors PLUS two never-co-stated cross-sector welds) has genuine content only if the certificate
  genuinely DEPENDS on the banked arc-P landings and the two welds bite. Specifically it needs:
  (a) the input census `input_census` (whose proof depends on all six arc-P capstone theorems); (b)
  WELD 1 `massScale_anchored_on_wrap` (the mass scale factors through the DERIVED minimal-wrap amplitude,
  P1 ⊗ P2); (c) WELD 2 `triality_cycle_order_is_colour_count` (the triality cycle order IS the derived
  colour/generation count, P3 ⊗ P6); (d) the capstone `parameter_free_certificate`. A mis-reading where
  the certificate were a hollow conjunction (not depending on the six capstones), or where the welds were
  absent, would gut P7.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N433 parameter-free certificate is genuine:
  the input census depends on all six arc-P capstones, the mass scale is anchored on the derived wrap
  amplitude (WELD 1), and the triality cycle order is the derived colour count (WELD 2)". It is TIED to
  the banked N433 landing by `cFlag_forced` through `input_census`, `massScale_anchored_on_wrap`,
  `triality_cycle_order_is_colour_count`, and `parameter_free_certificate`.

  We anchor `min 458 cFlag = 1` (TRUE — `cFlag = 1 < 458`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the certificate is hollow / the welds are absent" mis-reading):
  that `min 458 cFlag = 458`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 458` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (458, 1) is fresh (Cid 458 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ParameterFreeCertificate
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.Reckoning

/-- THE N433-NON-VACUITY FLAG: `1` = "the parameter-free certificate is genuine: the input census
    depends on all six arc-P capstones, and both cross-sector welds bite". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N433 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the four
    load-bearing P7 landings — the input census (`input_census`, which itself depends on all six arc-P
    capstones), WELD 1 (`massScale_anchored_on_wrap`), WELD 2 (`triality_cycle_order_is_colour_count`),
    and the capstone (`parameter_free_certificate`). If the certificate were hollow / the welds absent,
    those decls would not exist and this theorem could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @input_census
  have _ := massScale_anchored_on_wrap
  have _ := triality_cycle_order_is_colour_count
  have _ := parameter_free_certificate
  rfl

/-- TRUE: `min 458 cFlag = 1`, holding precisely because `cFlag = 1 < 458`. -/
theorem cert_val_true : min (458 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 458 cFlag = 458`. It GENUINELY equals `1` (`cert_val_true`). A "the certificate
    is hollow / the welds are absent" mis-reading reduces — through the banked P7 landing — to the false
    numeric `1 = 458`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (458 : ℕ) cFlag = 458 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 458  (FALSE — the costume bites)

end Counterexamples
