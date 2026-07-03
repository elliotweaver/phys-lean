/-
  Counterexamples.OctonionMatterJointNeutralCoreWrongValueCostume — N271 anti-vacuity (C302).
  ===========================================================================
  W8 ANTI-VACUITY. The N271 node banks THE JOINT COLOUR∧ISOSPIN NEUTRAL-CORE DECOMPOSITION OF THE
  MATTER CARRIER: over the derived octonion rung `O ℚ = CD (H ℚ)`, the colour-neutral core of the
  full carrier is `span{1, u1}` (N266), the isospin-neutral core is `span{1, κO1}` (the N266 twin),
  and their JOINT (the doubly-neutral core, invisible to BOTH derived symmetries) is EXACTLY the
  fold's scalar unit line `span{1}`. The two 2-dim cores are genuinely MISALIGNED (`u1 ∉` the
  isospin core, `κO1 ∉` the colour core), so the meet is EXACTLY 1-dimensional — NOT larger.

  The load-bearing QUANTITATIVE W8 fact anchored here is the DIMENSION of the doubly-neutral core:
  `finrank ℚ (matterColourNeutral ⊓ matterIsospinNeutral) = 1` (N271
  `finrank_matter_joint_neutral`). If the two cores COINCIDED (no misalignment), the meet would be
  2-dimensional; if the scalar unit were somehow charged, it would be 0. It is genuinely `1` — the
  fold's scalar unit is the unique doubly-neutral direction, and the grading misalignment is real.

  We anchor `finrank ℚ (matterColourNeutral ⊓ matterIsospinNeutral) = 1` (TRUE via
  `finrank_matter_joint_neutral`), packaged as `min 302 (…) = 1`, TIED to the node via
  `finrank_matter_joint_neutral`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the two neutral cores coincide / the
  misalignment is spurious / the doubly-neutral core is the whole 2-dim complex plane / there is no
  unique scalar doubly-neutral direction): that `min 302 (finrank …) = 302`. It GENUINELY equals
  `1` (`joint_dim_scale_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `1 = 302` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the meet of the colour- and isospin-neutral
  cores is genuinely the 1-dim scalar line `span{1}` (`finrank_matter_joint_neutral`), so claiming
  `min 302 1 = 302` is genuinely FALSE (1 ≠ 302).

  DISTINCT from the banked battery: the pair (302, 1) is fresh (RHS 302 distinct from every prior
  right-hand value: …, 298, 299, 300, 301). The LHS anchor is the N271 doubly-neutral-core dimension
  witness `1` — the fold's scalar unit as the unique direction invisible to both derived symmetries
  — tied to the node via `finrank_matter_joint_neutral`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionMatterJointNeutralCore

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- TRUE (tied to the node's non-vacuity): the doubly-neutral core of the matter carrier is EXACTLY
    1-dimensional — the fold's scalar unit line `span{1}` (N271 `finrank_matter_joint_neutral`). The
    two derived neutral cores are genuinely misaligned; only the scalar unit is invisible to both. -/
theorem joint_dim_true :
    Module.finrank ℚ ↥(matterColourNeutral ⊓ matterIsospinNeutral) = 1 :=
  finrank_matter_joint_neutral

/-- TRUE: `min 302 (finrank …) = 1`, holding precisely because the doubly-neutral core is the
    1-dim scalar line (the misalignment is real, the meet is not larger). -/
theorem joint_dim_scale_true :
    min (302 : ℚ) (Module.finrank ℚ ↥(matterColourNeutral ⊓ matterIsospinNeutral) : ℚ) = 1 := by
  rw [joint_dim_true]; norm_num

/-- BOGUS: claims `min 302 (finrank …) = 302`. It GENUINELY equals `1` (`joint_dim_scale_true`).
    The WRONG reading (the two neutral cores coincide / the misalignment is spurious / the
    doubly-neutral core is the whole 2-dim plane / no unique scalar doubly-neutral direction)
    reduces — through the banked value — to the false numeric `1 = 302`, so this must NOT compile. -/
theorem joint_dim_scale_wrong_BOGUS :
    min (302 : ℚ) (Module.finrank ℚ ↥(matterColourNeutral ⊓ matterIsospinNeutral) : ℚ) = 302 := by
  rw [joint_dim_scale_true]
  -- ⊢ (1 : ℚ) = 302  (FALSE — the costume bites)

end

end Counterexamples
