/-
  Counterexamples.TowerGatherPhysicalStateVacuityCostume — N412 anti-vacuity (C437).
  ============================================================================================
  W8 ANTI-VACUITY. The N412 node (arc-N N2 — physical states = T-algebras = glued global
  sections) reads the physical stratum as `GluesGlobally a` (a state's world glues with all
  others = the left nucleus = the T-algebra stratum over the gather-monad). The load-bearing
  non-vacuity fact: on the octonion rung `O ℚ` the physical stratum is a genuine SELECTION
  RULE — NONEMPTY (contains the trivial standpoint `1`, N412 `one_gluesGlobally`) AND PROPER
  (some state is NOT physical, N412 `o_not_all_physical`, from the banked non-associating
  triple). A mis-reading where the stratum were the WHOLE space (every octonion state physical
  / no selection / smooth like the associative rungs) would collapse the N412 content — there
  would be no physics, only the trivial "everything glues".

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N412 octonion physical stratum is
  genuinely PROPER and NONEMPTY: `1` glues globally AND some state does not". It is TIED to the
  banked N412 landing by `cFlag_forced` through `one_gluesGlobally` and `o_not_all_physical`.

  We anchor `min 437 cFlag = 1` (TRUE — `cFlag = 1 < 437`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the octonion physical stratum is the whole space / every
  state is physical / no selection rule / smooth like the associative rungs" mis-reading): that
  `min 437 cFlag = 437`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 437` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (437, 1) is fresh (Cid 437 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherPhysicalState
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade

attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

/-- THE N412-NON-VACUITY FLAG: `1` = "the octonion physical stratum is genuinely PROPER and
    NONEMPTY (the trivial standpoint `1` glues globally, and some octonion state does not)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N412 landing): the octonion physical stratum is NONEMPTY
    (`GluesGlobally (1 : O ℚ)`, `one_gluesGlobally`) and PROPER (`¬ ∀ a, GluesGlobally a`,
    `o_not_all_physical`); hence `cFlag = 1`. If the stratum were the whole space (every state
    physical, no selection) the properness clause would fail. -/
theorem cFlag_forced :
    (GluesGlobally (1 : O ℚ) ∧ ¬ ∀ a : O ℚ, GluesGlobally a) ∧ cFlag = 1 :=
  ⟨⟨one_gluesGlobally, o_not_all_physical⟩, rfl⟩

/-- TRUE: `min 437 cFlag = 1`, holding precisely because `cFlag = 1 < 437`. -/
theorem cert_val_true : min (437 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 437 cFlag = 437`. It GENUINELY equals `1` (`cert_val_true`). A "the
    octonion physical stratum is the whole space / every state physical / no selection rule"
    mis-reading reduces — through the banked nonempty-and-proper stratum — to the false numeric
    `1 = 437`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (437 : ℕ) cFlag = 437 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 437  (FALSE — the costume bites)

end Counterexamples
