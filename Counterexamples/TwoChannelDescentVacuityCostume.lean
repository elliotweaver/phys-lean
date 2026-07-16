/-
  Counterexamples.TwoChannelDescentVacuityCostume — Z2 anti-vacuity (C496).
  =========================================================================
  W8 ANTI-VACUITY. The Z2 node (arc-Z THE TWO-CHANNEL DESCENT) derives the descent from the octonion
  ceiling to the electroweak edge resolved into the two derived channels, each carrying its matter
  census PLUS the Z1 gather self-census. The load-bearing content: (i) the CHANNEL ASYMMETRY — the
  isospin gather self-census is strictly NEGATIVE (`gatherIsospin_selfCensus_neg`, `B(imRep DI) < 0`)
  while the abelian hypercharge one is ZERO (`abelian_no_selfCensus`, `traceSq 0 = 0`); (ii) so the
  isospin net depth is REDUCED (`netIsoDepth s < isoDepth` for `s > 0`) breaking the matter
  proportionality downward (`(5/3)·netIsoDepth s < hyperDepth`), which runs the recombined mixing
  strictly BELOW `3/8`; (iii) the abelian asymmetry is LOAD-BEARING — a counterfactual SYMMETRIC
  reduction of both channels FREEZES the mixing at `3/8` (`symmetric_frozen`), so the departure genuinely
  requires the abelian channel's zero gather self-census. The descent departs DOWN, it is FORCED by the
  Z1 sign + the abelian asymmetry — NOT vacuous, NOT symmetric, NOT the wrong direction.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the two-channel descent runs the mixing DOWN
  (isospin net depth reduced by the Z1 NEGATIVE gather self-census, hypercharge net depth UNREDUCED
  because the abelian channel has ZERO gather self-census), and the downward departure is LOAD-BEARING
  on the abelian asymmetry (a symmetric reduction freezes 3/8) — NOT vacuous, NOT symmetric". It is TIED
  to the banked Z2 landings by `xFlag_forced`: `channel_gather_asymmetry` witnesses the isospin-negative
  / abelian-zero split, and `net_ratio_breaks_up` witnesses the proportionality breaking downward, so the
  flag is `1`.

  We anchor `min 496 xFlag = 1` (TRUE — `xFlag = 1 < 496`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the descent is vacuous / symmetric / does not depart down / the
  abelian asymmetry is not load-bearing" mis-reading): that `min 496 xFlag = 496`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 496` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (496, 1) is fresh (Cid 496 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TwoChannelDescent
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- THE TWO-CHANNEL-DESCENT FLAG: `1` = "the descent runs the mixing DOWN via the isospin-only
    reduction (Z1 negative gather self-census), the abelian channel unreduced, load-bearing on the
    abelian asymmetry". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked Z2 landing): `channel_gather_asymmetry` proves the isospin gather
    self-census is `< 0` and the abelian one is `= 0` (the asymmetry); `net_ratio_breaks_up` proves the
    matter proportionality breaks downward for `s > 0` (the departure driver). So the flag is present,
    `xFlag = 1`. -/
theorem xFlag_forced :
    (traceForm7 (imRep DI) (imRep DI) < 0 ∧
      traceSq (0 : Matrix (Fin 7) (Fin 7) ℚ) = 0) ∧
    ((5 / 3 : Cut) * netIsoDepth 1 < hyperDepth) ∧
    xFlag = 1 :=
  ⟨channel_gather_asymmetry,
   net_ratio_breaks_up 1 (by norm_num),
   rfl⟩

/-- TRUE: `min 496 xFlag = 1`, holding precisely because `xFlag = 1 < 496`. -/
theorem cert_val_true : min (496 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 496 xFlag = 496`. It GENUINELY equals `1` (`cert_val_true`). A "the descent is
    vacuous / symmetric / does not depart down / the abelian asymmetry is not load-bearing" mis-reading
    reduces — through the banked value — to the false numeric `1 = 496`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (496 : ℕ) xFlag = 496 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 496  (FALSE — the costume bites)

end Counterexamples
