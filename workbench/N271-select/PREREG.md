# PREREG — N271 (frozen BEFORE production compute)

## TARGET (locked, S4-passed, comments 139–141)
THE JOINT COLOUR∧ISOSPIN NEUTRAL-CORE DECOMPOSITION OF THE MATTER CARRIER `O ℚ`.
The ★3 climax of the matter turn (N261–270): put isospin onto the FULL carrier (the N266 twin,
never done — N256 was only on the vector-7 `ImO`), then take the joint with colour (N266).

## CLAIMS (headline decls, in Phys/Algebra/OctonionMatterJointNeutralCore.lean, ns Phys.Algebra.HJ)
1. `matterIsospinNeutral` := joint kernel of {DI,DJ,DK} on `O ℚ`  (the isospin twin of N266).
2. `matterIsospinNeutral_eq_span_one_kap` : `= span{1, κO1}`  (the fold's real unit + isospin singlet).
3. `matter_joint_neutral_eq_span_one` : `matterColourNeutral ⊓ matterIsospinNeutral = span{1}`
   (the DOUBLY-neutral core = the fold's SCALAR UNIT — the headline).
4. W8 non-vacuity: the two 2-dim cores are DISTINCT (`u1 ∉ span{1,κO1}`, `κO1 ∉ span{1,u1}`),
   so the meet is EXACTLY `span{1}` (dim 1), not larger — the grading MISALIGNMENT on the full
   carrier (lift of N254's `ImO`-level misalignment).
   Costume C302 candidate: the joint-core dimension `finrank = 1` (or a coordinate witness).

## GO / NO-GO
GO if the probe (probe_isospin_twin.lean) compiles EXIT 0, foundations-only
[propext, Classical.choice, Quot.sound], for #2 and #3.
NO-GO / reframe if the isospin twin crux fights (it should not — exact template of N266).

## KILL (W9 cost budget)
Whole probe/module olean net-of-import must be < 30s. If any single obligation > 30s or needs a
maxHeartbeats raise, STOP and decompose — but expected LIGHT (no coordinate bash; `linarith` on
banked integer rows via N256, span/inf/ker Mathlib machinery, `abel`/`module`).

## FREE-FLOATING RAIL
Every headline TYPE mentions banked tower objects: `matterColourNeutral` (N266), the new
`matterIsospinNeutral`, `kappaO 1`, `u1`, `span{1}` on the derived `O ℚ`. NOT carrier-agnostic:
the meet = span{1} requires `u1 ∉ span{1,κO1}` (octonion/doubling-specific).
NOVELTY only for the forced neutral-core decomposition + misalignment joint; NEVER for
"= specific SM multiplets" (removable prose).

## DEPS (all banked, confirmed present)
matterColourNeutral, matterColourNeutral_eq_span_one_u1 (N266); isospinInvariants,
isospinInvariants_eq_span_kap (N256); DI/DJ/DK, D_kappaO_one_zero; derivQ_one; imRep_coe;
trace_id, starL; kappaO, kappaO_apply, u1.
