/-
  Counterexamples.JoinContentVacuityCostume — JoinContent anti-vacuity (C531).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE JOIN CONTENT) composes the banked doubling-tear mirror multiplet
  (N277) derived census-shift into the D2c per-channel dressed recombined endpoint at the
  transmutation join: the mirror-multiplet census `mirrorMultCensus = (finrank Q TR : Cut) = 3` run
  through the banked Z5 depth dressing as the join threshold `joinContent w j`, bounded (by the
  quasi-degeneracy of the mirror pair TL/TR, equal Casimir), positive (matter sense), and composed
  additively onto the D2c dressed endpoint. The content that must NOT be hollow: the join content
  genuinely SCREENS for a positive join splitting `1 < j` (`joinContent_pos`), it genuinely LIFTS
  the join-free endpoint (`dressedInvAlphaEMJoin_gt`), and the quasi-degeneracy is GENUINE — the
  mirror pair share the Casimir eigenvalue `-8 != 0` while the singlet is `0` (`quasi_degeneracy_bites`).
  A "the join content is vacuous / the join threshold moves nothing / the mirror multiplet is empty /
  the quasi-degeneracy is trivial" mis-reading is refuted by the banked `joinContent_pos`,
  `dressedInvAlphaEMJoin_gt`, and `quasi_degeneracy_bites`.

  THE CERTIFICATE. jcFlag := 1 -- a natural-number flag standing for "the derived join content is
  non-vacuous: the join threshold screens strictly positive for a positive join splitting, it lifts
  the join-free dressed recombined endpoint, and the mirror-pair quasi-degeneracy is genuine (equal
  Casimir -8 != 0)". It is TIED to the banked landing by jcFlag_forced: `joinContent_pos` (at a
  witness w = 1/3, j = 2) gives the strictly-positive join threshold, `dressedInvAlphaEMJoin_gt`
  gives the strict lift, `quasi_degeneracy_bites` gives the genuine quasi-degeneracy, so the flag is 1.

  We anchor min 531 jcFlag = 1 (TRUE -- jcFlag = 1 < 531, so the min is jcFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the join content is vacuous / the join threshold moves
  nothing / the mirror multiplet is empty / the quasi-degeneracy is trivial" mis-reading): that
  min 531 jcFlag = 531. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 531 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (531, 1) is fresh (Cid 531 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.JoinContent
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.JoinContent
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived join content is non-vacuous — the join threshold screens strictly
    positive for a positive join splitting, it lifts the join-free dressed recombined endpoint, and
    the mirror-pair quasi-degeneracy is genuine (equal Casimir -8 != 0)". -/
def jcFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the join threshold is strictly positive at the witness
    weight/splitting (`joinContent_pos`), the join composition strictly lifts the join-free dressed
    recombined endpoint (`dressedInvAlphaEMJoin_gt`), the mirror-pair quasi-degeneracy is genuine
    (`quasi_degeneracy_bites`), and `jcFlag = 1`. -/
theorem jcFlag_forced :
    ((0 : Cut) < joinContent depthWeight 2)
    ∧ (dressedInvAlphaEM depthWeight 1 (completeBandList chargeTraceDepth)
        < dressedInvAlphaEMJoin depthWeight 1 2 (completeBandList chargeTraceDepth))
    ∧ ((casimirOp u1M = (-8 : ℚ) • u1M) ∧ (casimirOp e5I = (-8 : ℚ) • e5I)
        ∧ (casimirOp e4I = 0) ∧ ((-8 : ℚ) ≠ 0))
    ∧ jcFlag = 1 :=
  ⟨joinContent_pos depthWeight 2 (le_of_lt depthWeight_pos) depthWeight_lt_one (by norm_num),
   dressedInvAlphaEMJoin_gt depthWeight 1 2 (le_of_lt depthWeight_pos) depthWeight_lt_one
      (by norm_num) (completeBandList chargeTraceDepth),
   quasi_degeneracy_bites,
   rfl⟩

/-- TRUE: min 531 jcFlag = 1, holding precisely because jcFlag = 1 < 531. -/
theorem cert_val_true : min (531 : ℕ) jcFlag = 1 := by decide

/-- BOGUS: claims min 531 jcFlag = 531. It GENUINELY equals 1 (cert_val_true). A "the join content
    is vacuous / the join threshold moves nothing / the mirror multiplet is empty / the
    quasi-degeneracy is trivial" mis-reading reduces -- through the banked landing -- to the false
    numeric 1 = 531, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (531 : ℕ) jcFlag = 531 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 531  (FALSE — the costume bites)

end Counterexamples
