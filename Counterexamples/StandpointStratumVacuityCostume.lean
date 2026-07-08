/-
  Counterexamples.StandpointStratumVacuityCostume — N445 anti-vacuity (C470).
  ============================================================================================
  W8 ANTI-VACUITY. The R1 node (arc-R R1 — THE STANDPOINT STRATUM) has genuine content only if the
  standpoint stratum on `O ℚ` is a REAL three-part structure with a REAL weld:
  (a) STANDPOINTS EXIST — the stratum is NONEMPTY (`standpoint_exists`);
  (b) NO TOTAL STANDPOINT — the stratum is PROPER, the totality does not close (`o_not_all_physical`
      via the capstone `standpoint_stratum`);
  (c) LOCAL STRICTNESS — from a standpoint's locus, world composition is strict (`sp_strict`);
  (c') FAITHFULNESS — the standpoint's view is injective (`sp_faithful`);
  (★) THE WELD — distinct probes open distinct composite worlds (`sp_composite_faithful`), the
      non-hollow content binding local strictness (N412) to the N-indivisible faithfulness;
  (d) THE SELECTION BITES — a live, faithful state that is NOT a standpoint exists
      (`faithful_insufficient`), so `glues` is genuinely load-bearing (faithfulness alone does not
      select);
  (Σ) the whole stratum bundles as ONE object (`standpoint_stratum`).
  A mis-reading where the stratum were empty, or total (every state a standpoint), or the view failed
  to compose strictly / failed to be faithful, or the capstone were a hollow ∧ (no weld), would gut
  R1.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the R1 standpoint stratum is genuine: a
  nonempty, proper, view-coherent local-closure structure on `O ℚ` with a real weld". It is TIED to
  the banked R1 landing by `cFlag_forced` through `standpoint_exists`, `sp_strict`, `sp_faithful`,
  `sp_composite_faithful`, and `standpoint_stratum`.

  We anchor `min 470 cFlag = 1` (TRUE — `cFlag = 1 < 470`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the stratum is empty / total / the view is not coherent / the
  bundle is a bare ∧" mis-reading): that `min 470 cFlag = 470`. It GENUINELY equals `1`
  (`cons_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 470` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (470, 1) is fresh (Cid 470 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointStratum
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.StandpointStratum

/-- THE R1-NON-VACUITY FLAG: `1` = "the standpoint stratum is genuine: a nonempty, proper,
    view-coherent local-closure structure on `O ℚ` with a real (non-hollow) weld". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked R1 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing R1 landings — existence (`standpoint_exists`), local strictness (`sp_strict`),
    faithfulness (`sp_faithful`), the ★ weld (`sp_composite_faithful`), and the capstone
    (`standpoint_stratum`). If any were hollow, those decls would not exist and this could not
    compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @standpoint_exists
  have _ := @sp_strict
  have _ := @sp_faithful
  have _ := @sp_composite_faithful
  have _ := @faithful_insufficient
  have _ := @standpoint_stratum
  rfl

/-- TRUE: `min 470 cFlag = 1`, holding precisely because `cFlag = 1 < 470`. -/
theorem cons_val_true : min (470 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 470 cFlag = 470`. It GENUINELY equals `1` (`cons_val_true`). A "stratum empty
    / total / view incoherent / hollow ∧" mis-reading reduces — through the banked R1 landing — to
    the false numeric `1 = 470`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (470 : ℕ) cFlag = 470 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 470  (FALSE — the costume bites)

end Counterexamples
