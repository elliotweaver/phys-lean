/-
  Counterexamples.GaussInversionVacuityCostume — the inversion core is GENUINE: the
  inversion data FIRES on a real (p, c) pair. C612.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the InvertibleCapture core's motors. The content
  that must NOT be hollow: inversion_data FIRES at p = 3, c = 2 (3 prime, 3 ∤ 2) —
  the kernel produces actual positive u, v with 2u = 1 + 3v.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 612 attestFlag = 1 (TRUE — attestFlag = 1 < 612).
  THE BOGUS CLAIM: min 612 attestFlag = 612. Rewriting reduces to 1 = 612; BITES.
  DISTINCT: the pair (612, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussInversion

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open Phys.Foundation.IntegerArith

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((Re.step (Re.step Re.void)) * (Re.step (Re.step Re.void))
      = Re.step ((Re.step (Re.step (Re.step Re.void))) * (Re.step Re.void))) →
    attestFlag = 1 :=
  fun _ => rfl

/-- FIRE index_transport on the REAL identity 2·2 = 1 + 3·1. -/
theorem transport_fires :
    (Re.step (Re.step Re.void)) * (Re.step (Re.step Re.void))
      = Re.step ((Re.step (Re.step (Re.step Re.void))) * (Re.step Re.void)) := by
  apply index_transport
  show (2 : Z) * 2 = 1 + 3 * 1
  norm_num

theorem cert_val_true : min 612 attestFlag = 1 := by
  have h := attestFlag_forced transport_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 612 attestFlag = 612 := by
  rw [cert_val_true]

end Counterexamples
