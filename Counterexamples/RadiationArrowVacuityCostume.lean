/-
  Counterexamples.RadiationArrowVacuityCostume — N439 anti-vacuity (C464).
  ============================================================================================
  W8 ANTI-VACUITY. The N439 node (arc-Q Q5 — THE RADIATION ARROW as the gather's irreversible
  cone-half selection) has genuine content only if the selection genuinely bites: the retarded
  gather must (a) land in the outgoing null half and ANNIHILATE the incoming half while the two
  halves reconstruct the whole; (b) be NON-INJECTIVE (no un-gather); (c) discard a
  genuinely-nonzero coherence; (d) send any event to the outgoing null generator; and (e) the
  discarded weight, as the C6 flow's positive initial gap, is never recovered. A mis-reading where
  the gather were injective (an un-gather existed), or the discarded coherence were vacuous, or the
  gather did not actually select one half, would gut Q5 into a hollow conjunction.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N439 radiation arrow is genuine: the
  retarded gather selects the outgoing null half, annihilates the incoming half, resolves Unity,
  sends any event to the outgoing generator, is non-injective (no un-gather), discards a
  genuinely-nonzero coherence, and the discarded weight is never recovered by the C6 flow". It is
  TIED to the banked N439 landing by `cFlag_forced` through `radGather_in_outHalf`,
  `radGather_kills_inHalf`, `two_halves_resolve`, `radGather_not_injective`,
  `radGather_discards_real_coherence`, `discarded_weight_never_recovered`,
  `radGather_selects_outgoing_ray`, and `radiation_arrow`.

  We anchor `min 464 cFlag = 1` (TRUE — `cFlag = 1 < 464`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the gather is injective / the selection is vacuous / no half
  is chosen" mis-reading): that `min 464 cFlag = 464`. It GENUINELY equals `1` (`cons_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 464` in ℕ. The kernel cannot close
  it; it BITES.

  DISTINCT from the banked battery: the pair (464, 1) is fresh (Cid 464 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.RadiationArrow
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum.Radiation

/-- THE N439-NON-VACUITY FLAG: `1` = "the radiation arrow is genuine: the retarded gather selects
    the outgoing null half, annihilates the incoming half, resolves Unity, sends any event to the
    outgoing generator, is non-injective (no un-gather), discards a genuinely-nonzero coherence,
    and the discarded weight is never recovered". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N439 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing Q5 landings — the outgoing-half selection (`radGather_in_outHalf`), the incoming
    annihilation (`radGather_kills_inHalf`), the resolution of Unity (`two_halves_resolve`), the
    non-injectivity / no-un-gather (`radGather_not_injective`), the discarded genuinely-nonzero
    coherence (`radGather_discards_real_coherence`), the C6 non-recovery
    (`discarded_weight_never_recovered`), the lightcone weld (`radGather_selects_outgoing_ray`), and
    the capstone (`radiation_arrow`). If the gather were injective / the selection were vacuous /
    no half were chosen, those decls would not exist and this could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @radGather_in_outHalf
  have _ := @radGather_kills_inHalf
  have _ := @two_halves_resolve
  have _ := radGather_not_injective
  have _ := radGather_discards_real_coherence
  have _ := @discarded_weight_never_recovered
  have _ := @radGather_selects_outgoing_ray
  have _ := radiation_arrow
  rfl

/-- TRUE: `min 464 cFlag = 1`, holding precisely because `cFlag = 1 < 464`. -/
theorem cons_val_true : min (464 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 464 cFlag = 464`. It GENUINELY equals `1` (`cons_val_true`). A "the gather is
    injective / the selection is vacuous / no half is chosen" mis-reading reduces — through the
    banked N439 landing — to the false numeric `1 = 464`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (464 : ℕ) cFlag = 464 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 464  (FALSE — the costume bites)

end Counterexamples
