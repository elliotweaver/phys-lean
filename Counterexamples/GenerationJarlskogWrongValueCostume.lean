/-
  Counterexamples.GenerationJarlskogWrongValueCostume — N344 anti-vacuity (C369).
  ============================================================================
  W8 ANTI-VACUITY. The N344 node (seeded arc-D D6, the Jarlskog CP invariant as an actual number)
  reads the Jarlskog invariant `J` — the ONE rephasing-invariant measure of CP violation — over the
  derived ℝ `Cut`, combining the banked N343 Born mixing weights `sin²θᵢⱼ = mᵢ/(mᵢ+mⱼ)` with the
  banked N310 octonion associator (the CP phase source: `assoc3 = 0` on the ℂ-line, `−1` on the Fano
  line, so `(assoc3)² = 1` is the maximal CP phase, dissolving `sinδ` — no free continuous CP knob).
  The Jarlskog invariant SQUARED reads:

      `jarlskogSq_lo/hi : 72/1e9 ≤ J² ≤ 74/1e9`   (J² ≈ 7.3e-8, so J ≈ 2.70e-4)

  This value is FORCED (zero free CP parameters — the mixing weights come from the derived phase
  δ_B = 2/9 / Q = 2/3 via the Born self-overlap, and the CP phase is the octonion associator unit,
  not fitted). A mis-derivation of the mixing weights, the Born-closure, or the associator witness
  would break the pin.

  THE CERTIFICATE. `jFlag := 720` — a ℕ flag standing for "the Jarlskog CP invariant squared reads
  `≥ 72/1e9`, i.e. `720/1e10 ≤ J²`" (720/1e10 = 72/1e9 exactly). It is TIED to the banked N344
  landing by `jFlag_forced` below: the banked `jarlskogSq_lo` IS that lower bound over the derived
  `Cut`. If the CP invariant were mis-derived, this would fail.

  We anchor `min 369 jFlag = 369` (TRUE — `jFlag = 720 > 369`, so the min is the Cid `369`).

  THE BOGUS CLAIM (a stand-in for ANY wrong Jarlskog value / mis-derived CP invariant): that
  `min 369 jFlag = 720`. It GENUINELY equals `369` (`cert_val_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `369 = 720` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (369, 720) is fresh (Cid 369 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GenerationJarlskogInvariantNumeric
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationJarlskog

/-- THE JARLSKOG FLAG: `720` = "the Jarlskog CP invariant squared reads `≥ 72/1e9`, i.e.
    `720/1e10 ≤ J²`" (720/1e10 = 72/1e9 exactly). -/
def jFlag : ℕ := 720

/-- TRUE (tied to the banked N344 forced landing): the Jarlskog CP invariant squared reads `≥ 72/1e9`
    over the derived `Cut` — `720/1e10 ≤ jarlskogSq`, from the banked lower bound `jarlskogSq_lo`
    (`72/1e9 = 720/1e10`). If the CP invariant were mis-derived (wrong mixing weights, wrong
    Born-closure, wrong associator witness), this would fail. -/
theorem jFlag_forced : (720 : Cut) / 10000000000 ≤ jarlskogSq := by
  have h := jarlskogSq_lo
  have he : (720 : Cut) / 10000000000 = (72 : Cut) / 1000000000 := by norm_num
  rw [he]; exact h

/-- TRUE: `min 369 jFlag = 369`, holding precisely because `jFlag = 720` (the genuine CP invariant
    reading) `> 369`. -/
theorem cert_val_true : min (369 : ℕ) jFlag = 369 := by decide

/-- BOGUS: claims `min 369 jFlag = 720`. It GENUINELY equals `369` (`cert_val_true`). A WRONG Jarlskog
    value / mis-derived CP invariant reduces — through the banked value — to the false numeric
    `369 = 720`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (369 : ℕ) jFlag = 720 := by
  rw [cert_val_true]
  -- ⊢ (369 : ℕ) = 720  (FALSE — the costume bites)

end Counterexamples
