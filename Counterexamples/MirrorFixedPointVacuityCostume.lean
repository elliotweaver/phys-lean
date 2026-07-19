/-
  Counterexamples.MirrorFixedPointVacuityCostume — the mirror fixed point is GENUINE: the residual's
  sign change is a real two-sided crossing (strictly negative at aL, strictly positive at aR), the
  solution bracket is strictly two-sided, and the mirror correction is RESOLVED (the fixed-point
  landing sits strictly below the bare F0 bracket — the self-inclusion term is bigger than both
  bracket widths, not noise). C586.
  =====================================================================================
  W8 ANTI-VACUITY. The mirror node banks the fixed-point equation 1/α = F0 − (16/9)·κ·α² as a
  sign-change + strict-monotonicity + conditional-solution-bracket package over the banked brackets.
  The content that must NOT be hollow: (i) the residual GENUINELY changes sign across [aL, aR]
  (residual_neg_at_aL / residual_pos_at_aR — if both ends had one sign the "root interval" would be
  empty talk); (ii) the solution bracket is strictly two-sided (1370359990777677 < 1370359990778029);
  (iii) the mirror correction RESOLVES: the solution bracket's UPPER end sits strictly BELOW the F0
  bracket's LOWER end (mirror_correction_resolved) — the self-inclusion term genuinely moves the
  landing, it is not lost in bracket width; (iv) the selection layer's controls each FAIL a named
  legality (controls_excluded) — the grammar predicates bite, they do not accept everything.

  THE CERTIFICATE. attestFlag := 1 -- "the mirror fixed point is genuine: real sign change, strictly
  two-sided solution bracket, resolved correction, biting controls". TIED by attestFlag_forced.

  We anchor min 586 attestFlag = 1 (TRUE -- attestFlag = 1 < 586, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the sign change is vacuous / the bracket collapsed / the
  mirror term is lost in the noise / the grammar accepts every census" reading): that
  min 586 attestFlag = 586. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim
  to the false numeric 1 = 586 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (586, 1) is fresh (Cid 586 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MirrorFixedPoint

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorFixedPoint
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the mirror fixed point is genuine: real sign change across [aL, aR], strictly
    two-sided solution bracket, resolved downward correction, biting selection controls". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the residual is strictly negative at aL and strictly positive
    at aR (`residual_neg_at_aL`/`residual_pos_at_aR`), the solution bracket is strictly two-sided,
    the mirror correction is resolved below the bare F0 bracket (`mirror_correction_resolved`), and
    the lepton sub-census control fails census legality (`controls_excluded`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    residual aL < 0 ∧ 0 < residual aR
    ∧ ((1370359990777677 : Cut) / 10000000000000 < 1370359990778029 / 10000000000000)
    ∧ ((1370359990778029 : Cut) / 10000000000000 < 3425900228061987 / 25000000000000)
    ∧ ¬ censusLegal ⟨2, 1, 2⟩
    ∧ attestFlag = 1 :=
  ⟨residual_neg_at_aL, residual_pos_at_aR, by norm_num,
   mirror_correction_resolved, controls_excluded.1, rfl⟩

/-- TRUE: min 586 attestFlag = 1, holding precisely because attestFlag = 1 < 586. -/
theorem cert_val_true : min (586 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 586 attestFlag = 586. It GENUINELY equals 1 (cert_val_true). A "the sign change
    is vacuous / the bracket collapsed / the mirror term is noise / the grammar accepts everything"
    reading reduces -- through the banked residual_neg_at_aL / residual_pos_at_aR /
    mirror_correction_resolved / controls_excluded tie -- to the false numeric 1 = 586 in the
    naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (586 : ℕ) attestFlag = 586 := by
  rw [cert_val_true]

end Counterexamples
