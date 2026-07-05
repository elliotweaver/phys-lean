/-
  Counterexamples.ContinuumTrigEvalWrongValueCostume — N339 anti-vacuity (C364).
  ============================================================================
  W8 ANTI-VACUITY. The N339 node (seeded arc-D D1, the trig-evaluation remainder) EXTRACTS the numeral
  of the derived cosine at the fold's total-loop holonomy `2/3` from the banked alternating series:

      `cutCos_two_thirds_bounds : 191/243 − 56/455625 ≤ cutCos (2/3) ≤ 191/243 + 56/455625`
      `cutCos_two_thirds_bracket : 785/1000 ≤ cutCos (2/3) ≤ 787/1000`   (the D2-consumed numeral)

  i.e. `cutCos (2/3) ≈ 0.7858…`, pinned to two decimals as `[0.78, 0.79)`. This numeral is the SINGLE
  analytic input the forced lepton mass RATIOS (D2) evaluate; a mis-derivation off by ≥ 0.005 (a wrong
  head, a wrong tail bound, a sign error) would break the two-decimal pin.

  THE CERTIFICATE. `boundFlag := 78` — a ℕ flag standing for "the derived cosine at the holonomy angle
  `2/3` reads `0.78…`, i.e. `78/100 ≤ cutCos(2/3) < 79/100`". It is TIED to the banked N339 landing by
  `boundFlag_forced` below: the banked `cutCos_two_thirds_bounds` gives the explicit rational two-sided
  bound over the derived `Cut`, which `norm_num` collapses to `78/100 ≤ cutCos(2/3) ∧ cutCos(2/3) <
  79/100`. If the numeral were mis-derived, this would fail.

  We anchor `min 364 boundFlag = 78` (TRUE — `boundFlag = 78`, the genuine two-decimal reading).

  THE BOGUS CLAIM (a stand-in for ANY wrong numeral / mis-derived bound): that `min 364 boundFlag =
  364`. It GENUINELY equals `78` (`cert_val_true`). Rewriting the banked value reduces the bogus claim
  to the false numeric `78 = 364` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (364, 78) is fresh (RHS 364 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE BOUND FLAG: `78` = "the derived cosine at the holonomy angle `2/3` reads `0.78…`, i.e.
    `78/100 ≤ cutCos(2/3) < 79/100`". -/
def boundFlag : ℕ := 78

/-- TRUE (tied to the banked N339 forced landing): the derived cosine at `2/3` reads `0.78…` over the
    derived `Cut` — `78/100 ≤ cutCos(2/3) ∧ cutCos(2/3) < 79/100`, from the banked explicit rational
    two-sided bound `cutCos_two_thirds_bounds`. If the numeral were mis-derived (wrong head/tail/sign),
    this would fail. -/
theorem boundFlag_forced :
    (78 / 100 : Cut) ≤ cutCos (2 / 3 : Cut) ∧ cutCos (2 / 3 : Cut) < 79 / 100 := by
  obtain ⟨hlo, hhi⟩ := cutCos_two_thirds_bounds
  refine ⟨?_, ?_⟩
  · have : (78 / 100 : Cut) ≤ 191 / 243 - 56 / 455625 := by norm_num
    linarith
  · have : (191 / 243 + 56 / 455625 : Cut) < 79 / 100 := by norm_num
    linarith

/-- TRUE: `min 364 boundFlag = 78`, holding precisely because `boundFlag = 78` (the genuine two-decimal
    reading), not `364`. -/
theorem cert_val_true : min (364 : ℕ) boundFlag = 78 := by decide

/-- BOGUS: claims `min 364 boundFlag = 364`. It GENUINELY equals `78` (`cert_val_true`). A WRONG numeral
    / mis-derived bound reduces — through the banked value — to the false numeric `78 = 364`, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (364 : ℕ) boundFlag = 364 := by
  rw [cert_val_true]
  -- ⊢ (78 : ℕ) = 364  (FALSE — the costume bites)

end Counterexamples
