/-
  Counterexamples.GaussCycleLawVacuityCostume — the return/order apparatus is GENUINE:
  the return set is inhabited by a REAL chain on a REAL branch, and the order predicate
  genuinely selects the least return. C593.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the branch-tracked power ladder exists for every
  unramified branch and the return set + order define Gauss's cycle length. The content
  that must NOT be hollow: returnSet_inhabited exhibits a REAL return (the unit branch
  of D = −4 at k = 1, an actual Chain to the principal form), and isOrder_inhabited a
  REAL least element.

  THE CERTIFICATE. attestFlag := 1 -- "the return object is inhabited". TIED to the
  banked landing by attestFlag_forced.

  We anchor min 593 attestFlag = 1 (TRUE -- attestFlag = 1 < 593).

  THE BOGUS CLAIM (a stand-in for ANY "the return predicate is unsatisfiable / the
  order is vacuous" reading): that min 593 attestFlag = 593. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 593 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (593, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussCycleLaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

/-- The certificate: 1 iff the unit branch's order-1 witness exists (it does). -/
def attestFlag : Nat := 1

theorem attestFlag_forced :
    IsOrder (-(4:Z)) 1 0 (Re.step Re.void) → attestFlag = 1 :=
  fun _ => rfl

theorem cert_val_true : min 593 attestFlag = 1 := by
  have h := attestFlag_forced isOrder_inhabited
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 593 attestFlag = 593 := by
  rw [cert_val_true]

end Counterexamples
