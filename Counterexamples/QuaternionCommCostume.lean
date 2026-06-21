/-
  Counterexamples.QuaternionCommCostume — N2 rung-2 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming the rung-2 algebra `H ℚ = CD (Dbl ℚ)` is
  COMMUTATIVE. The whole content of rung 2 is that doubling the complex algebra
  LOSES commutativity (`Phys/Cascade/Quaternion.lean` `not_commutative_witness`:
  `ι J · e₂ ≠ e₂ · ι J`). Claiming the canonical pair commutes is FALSE: the kernel
  must REJECT it. If it ever COMPILES, the loss of commutativity was doing no work —
  the doubling could have stayed commutative — exactly the failure the battery
  exists to catch (a wrong CONTINUATION of the cascade).

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Cascade.Quaternion
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

/-- WRONG CONTINUATION: claiming the rung-2 algebra is commutative on the canonical
    pair. False: `ι J · e₂ ≠ e₂ · ι J` in `H ℚ` — the new-dimension components are
    `J` and `J* = −J`. Reducing componentwise leaves the false core `1 = -1`, so this
    must FAIL to elaborate. -/
theorem quaternion_commutative_BOGUS : (ιJ ℚ) * CD.e2 = CD.e2 * (ιJ ℚ) := by
  ext <;> simp [ιJ, CD.iota, CD.e2, Dbl.J]
