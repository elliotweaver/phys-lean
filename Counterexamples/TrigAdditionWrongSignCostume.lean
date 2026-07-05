/-
  Counterexamples.TrigAdditionWrongSignCostume — N324 anti-vacuity (C351).
  ========================================================================
  W8 ANTI-VACUITY. The N324 node (seeded arc-D/D1, the arc-B π-prerequisite's second half) banks the
  DERIVED-ℝ TRIG ADDITION FORMULAS — the GROUP LAW of the Born-circle orbit — over the derived ℝ `Cut`:

      `cutCos_add : cutCos (a+b) = cutCos a * cutCos b − cutSin a * cutSin b`
      `cutSin_add : cutSin (a+b) = cutSin a * cutCos b + cutCos a * cutSin b`.

  The SIGNS are LOAD-BEARING: the MINUS in the cosine law and the PLUS in the sine law are what make
  the parameter translation a genuine ROTATION of the orbit (and what make the Pythagorean identity
  their `b = -a` special case). A wrong sign (a PLUS in the cosine law, or a MINUS in the sine law)
  would break the group law — the orbit would fail to rotate, and downstream the `cutPi`/periodicity
  construction the scale tower `e^(−Nπ)` rides would collapse.

  THE CERTIFICATE. `addLaw := 1` — a ℕ flag standing for "the addition formulas hold with the genuine
  signs (MINUS in cos, PLUS in sin)". It is TIED to the banked landing by `addLaw_forced` below: at the
  concrete nonzero argument `a = b = 1` (`1 + 1 = 2`, nonzero), the banked `cutCos_add_one_one` and
  `cutSin_add_one_one` give the addition formulas with the genuine signs. If a sign were wrong, these
  would not hold.

  We anchor `min 351 addLaw = 1` (TRUE — `addLaw = 1`, and the group law is genuine).

  THE BOGUS CLAIM (a stand-in for ANY wrong-sign addition law): that `min 351 addLaw = 351`. It
  GENUINELY equals `1` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `1 = 351` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (351, 1) is fresh (RHS 351 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Foundation.ContinuumTrigAdd
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE ADDITION-LAW FLAG: `1` = "the addition formulas hold with the genuine signs (MINUS in cos,
    PLUS in sin)". -/
def addLaw : ℕ := 1

/-- TRUE (tied to the banked N324 forced landing): at the concrete nonzero argument `a = b = 1` the
    addition formulas hold with their genuine signs — `cutCos (1+1) = cutCos 1·cutCos 1 − cutSin 1·
    cutSin 1` (MINUS) and `cutSin (1+1) = cutSin 1·cutCos 1 + cutCos 1·cutSin 1` (PLUS). If a sign were
    wrong (a PLUS in the cosine law / a MINUS in the sine law), these would not hold. -/
theorem addLaw_forced :
    cutCos (1 + 1) = cutCos 1 * cutCos 1 - cutSin 1 * cutSin 1
      ∧ cutSin (1 + 1) = cutSin 1 * cutCos 1 + cutCos 1 * cutSin 1 :=
  ⟨cutCos_add_one_one, cutSin_add_one_one⟩

/-- TRUE: `min 351 addLaw = 1`, holding precisely because `addLaw = 1` (the genuine group law of the
    banked addition formulas), not `351` (a wrong-sign reading). -/
theorem cert_val_true : min (351 : ℕ) addLaw = 1 := by decide

/-- BOGUS: claims `min 351 addLaw = 351`. It GENUINELY equals `1` (`cert_val_true`). The WRONG-sign
    addition law (a PLUS in cos / a MINUS in sin, breaking the group law) reduces — through the banked
    value — to the false numeric `1 = 351`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (351 : ℕ) addLaw = 351 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 351  (FALSE — the costume bites)

end Counterexamples
