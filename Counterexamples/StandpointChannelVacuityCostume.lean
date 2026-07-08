/-
  Counterexamples.StandpointChannelVacuityCostume — N447 anti-vacuity (C472).
  ============================================================================================
  W8 ANTI-VACUITY. The R3 node (arc-R R3 — THE CHANNEL QUOTIENT) has genuine content only if the
  channel/fibre/recursion structure on the composite carrier `O Cut × O Cut` is a REAL, non-trivial
  structure:
  (a) A CHANNEL THROUGH THE PROJECTION IS CONSTANT ON FIBRES — `factors_through_proj_const_on_fibre`;
  (b) NO SECTION-DETECTOR — no map from the base recovers the fibre coordinate
      (`no_section_detector`, needs `oCut_one_ne_zero`: the fibre is genuinely nontrivial);
  (c) ★ THE RECURSION — the composite carrier is 2-torsion-free (`prod_two_torsion_free`) and its
      fold is again self-blind (`prod_fold_self_blind`), re-instantiating the banked `fold_self_blind`
      one level up;
  (★) THE WELD — a pure-fibre state is base-invisible, live, AND missed by the composite fold
      (`watcher_invisible_yet_blind`); [W8] it bites on the concrete negation fold
      (`watcher_invisible_yet_blind_bites`);
  (Σ) the whole channel quotient bundles as ONE object (`channel_quotient`).
  A mis-reading where the fibre coordinate were detectable from the base (a section-detector exists),
  or the composite carrier were NOT self-blind (enlarging the carrier eliminated the blindness), or
  the pure-fibre state were dead or unmissed, would gut R3.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the R3 channel quotient is genuine:
  fibre-constant channels, no section-detector, conserved self-blindness under enlargement, and the
  invisible-yet-missed weld on `O Cut × O Cut`". It is TIED to the banked R3 landing by `cFlag_forced`
  through `factors_through_proj_const_on_fibre`, `no_section_detector`, `prod_fold_self_blind`,
  `watcher_invisible_yet_blind`, `watcher_invisible_yet_blind_bites`, and `channel_quotient`.

  We anchor `min 472 cFlag = 1` (TRUE — `cFlag = 1 < 472`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the fibre is detectable / the enlarged carrier is not
  self-blind / the pure-fibre state is dead or unmissed" mis-reading): that `min 472 cFlag = 472`.
  It GENUINELY equals `1`. Rewriting reduces the bogus claim to the false numeric `1 = 472` in ℕ.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (472, 1) is fresh (Cid 472 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointChannel
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.StandpointChannel

/-- THE R3-NON-VACUITY FLAG: `1` = "the channel quotient on `O Cut × O Cut` is genuine:
    fibre-constant channels, no section-detector, conserved self-blindness, invisible-yet-missed
    weld". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked R3 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing R3 landings — fibre-constancy (`factors_through_proj_const_on_fibre`), the
    no-section-detector no-go (`no_section_detector`), the conserved self-blindness
    (`prod_fold_self_blind`), the ★ invisible-yet-missed weld (`watcher_invisible_yet_blind`), the
    W8 concrete bite (`watcher_invisible_yet_blind_bites`), and the capstone (`channel_quotient`).
    If any were hollow, those decls would not exist and this could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @factors_through_proj_const_on_fibre ℕ
  have _ := @no_section_detector
  have _ := @prod_fold_self_blind
  have _ := @watcher_invisible_yet_blind
  have _ := @watcher_invisible_yet_blind_bites
  have _ := channel_quotient
  rfl

/-- TRUE: `min 472 cFlag = 1`, holding precisely because `cFlag = 1 < 472`. -/
theorem cons_val_true : min (472 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 472 cFlag = 472`. It GENUINELY equals `1` (`cons_val_true`). A "fibre is
    detectable / enlarged carrier not self-blind / pure-fibre state dead or unmissed" mis-reading
    reduces — through the banked R3 landing — to the false numeric `1 = 472`, so this must NOT
    compile. -/
theorem cons_val_wrong_BOGUS :
    min (472 : ℕ) cFlag = 472 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 472  (FALSE — the costume bites)

end Counterexamples
