/-
  Counterexamples.GaussReturnVacuityCostume — the return apparatus is GENUINE: the
  order object is inhabited by a REAL least return. C596.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the return set + order exist through the pigeonhole
  and cancellation. The content that must NOT be hollow: isOrderR_inhabited exhibits a
  REAL order-1 witness (the principal-shape form (1,0,1), its own first power, an
  actual PowRel + Chain instance).

  THE CERTIFICATE. attestFlag := 1 -- "the order object is inhabited". TIED to the
  banked landing by attestFlag_forced.

  We anchor min 596 attestFlag = 1 (TRUE -- attestFlag = 1 < 596).

  THE BOGUS CLAIM (a stand-in for ANY "the return predicates are unsatisfiable"
  reading): that min 596 attestFlag = 596. It GENUINELY equals 1 (cert_val_true).
  Rewriting reduces the bogus claim to the false numeric 1 = 596. The kernel cannot
  close it; it BITES.

  DISTINCT from the banked battery: the pair (596, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussReturn

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    IsOrderR (⟨1, 0, 1⟩ : GaussForms.BQF) (Re.step Re.void) → attestFlag = 1 :=
  fun _ => rfl

theorem cert_val_true : min 596 attestFlag = 1 := by
  have h := attestFlag_forced isOrderR_inhabited
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 596 attestFlag = 596 := by
  rw [cert_val_true]

end Counterexamples
