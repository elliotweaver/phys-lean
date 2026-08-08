# PREREG — PARALLEL LANES A/B/C (referee queue items 3, 5, 6) — FROZEN before worker dispatch
Date: 2026-08-08. Manager: phys-novelty-mgr. Head at freeze: 44b2902e.
N-numbers allocated: N682 (lane A), N683 (lane B), N684 (lane C), N685 (item 4, queued behind A).
C-numbers: C682/C683/C684/C685. Workers NEVER mint numbers.

## LANE A — N682 RunningLawCharacterized (referee item 3)
TARGET: the affine-log running law FORCED from flow structure, not defined.
Core theorem (the Cauchy characterization over the derived line):
  For f : Cut → Cut with
    (H1 additive-on-multiplicative) ∀ x y, 0 < x → 0 < y → f (x*y) = f x + f y
    (H2 monotone) Monotone f on positives (or StrictMono, worker's choice — weaker is better)
  then ∀ x, 0 < x → f x = f (cutExp 1) * cutLog x.
Route (suggested, not mandated): g := f ∘ cutExp is additive on Cut (cutExp_add, cutExp_pos,
cutLog_cutExp); ℚ-linearity of additive g by the standard nat/int/rat induction; monotone +
ℚ-density (exists_rat_btwn over Cut) sandwiches g x = x * g 1; pull back through cutLog.
Then the corollaries welding to the banked law:
  invAlphaRun_characterized : the banked invAlphaRun's log part satisfies H1+H2 in the ratio
  argument, and ANY flow with the banked cocycle + monotonicity + the same unit-rate IS it.
KILL: if ℚ-density tooling over Cut is missing/unworkable, STOP and report — do not weaken
H2 to differentiability silently, do not add axioms.
DELIVERABLE: workbench/wt-A/ScratchN682.lean compiling clean via the recipe below.

## LANE B — N683 HolonomyCircleRepresentation (referee item 5)
TARGET: the 2/9 holonomy is the parameter of the derived unit-circle representation whose
real coordinate is cutCos — the executable bridge δ_B = 2/9 ⟹ pB = cutCos δ_B.
Core objects/theorems:
  R : Cut → Matrix (Fin 2) (Fin 2) Cut,  R θ := !![cutCos θ, −cutSin θ; cutSin θ, cutCos θ]
  circle_rep_hom      : R (a+b) = R a * R b        (addition formulas)
  circle_rep_id       : R 0 = 1                     (cutCos_zero, cutSin_zero)
  circle_rep_orth     : (R θ)ᵀ * R θ = 1            (Pythagoras)
  circle_rep_det      : det (R θ) = 1
  holonomy_real_coord : (R δ) 0 0 = cutCos δ        (entry identification)
  pB_is_rep_coord     : GenerationMassRatios.pB = (R (2/9 : Cut)) 0 0
  (stretch, only if cheap) rep_unique: any 2×2 orthogonal-det-1 family with hom property and
  the same generator direction agrees with R — SKIP if it balloons; the hom+orth+entry weld
  is the deliverable.
KILL: if Matrix over Cut hits instance issues (DecidableEq etc.), fall back to explicit
pair-of-pairs structure with multiplication defined componentwise — the math is identical.
DELIVERABLE: workbench/wt-B/ScratchN683.lean compiling clean.

## LANE C — N684 FoldPhaseCharacterized (referee item 6)
TARGET: foldPhase = π/8 CHARACTERIZED (unique solution of a structural condition), not named.
Core theorems:
  (a) the cascade condition: x is a fold-phase iff cutCos (2*x) ^ 2 = (1 + cutCos (cutPi/2))/2
      i.e. the double angle closes the NEXT rung up (the ℂ-fold Born amplitude), with
      0 < x < cutPi/4 and 0 < cutCos (2*x)   (the positive Born branch).
  (b) foldPhase_unique : the UNIQUE x in Ioo 0 (cutPi/4) with (a) is cutPi/8.
      Route: cutCos (π/2) = 0 ⟹ condition reads cutCos(2x)² = 1/2 ⟹ cutCos(2x) = √2/2 = cutCos(π/4)
      (positive branch); injectivity of cutCos on [0, π/2] gives 2x = π/4.
      NEEDED: strict antitonicity/injectivity of cutCos on [0, cutPi/2]. GREP FIRST —
      the repo defined cutPi as the first cosine zero; monotonicity machinery may exist
      (search cutCos_strictAnti, cutCos_lt_cutCos, cos_injOn, ContinuumTrig*.lean,
      ContinuumPi*.lean). If genuinely absent, KILL and report exactly what's missing —
      do NOT attempt to build MVT machinery in this lane.
  (c) weld: CascadeFoldPhase.foldPhase satisfies the condition (foldPhase_amplitude exists);
      foldPhase_characterized : foldPhase = THE unique solution.
DELIVERABLE: workbench/wt-C/ScratchN684.lean compiling clean.

## SHARED WORKER RULES (all lanes)
COMPILE RECIPE (from your worktree root):
  LEAN_PATH="$(cat ~/leanpath.txt)" C:/Users/ellio/.elan/bin/lean <file> 2>&1 | grep -E "error" -A5
You import ONLY already-banked modules (they resolve from the main tree's cache). Your new
module CANNOT import another lane's work (no oleans exist — do not try).
FORBIDDEN: lake build (any form); editing Phys.lean, Audits/AxiomAudit.lean,
scripts/costume_manifest.tsv, docs/LEDGER.md, or ANY existing banked module; git commit/push;
sorry/admit/axiom; the D3 vocabulary (named bridge / asserted at grade / NOT proved here /
named residual / structural obligation / not yet closed / strategy note).
STATEMENTS carry NO physics words needing removal-test failures — theorem names may use the
arc vocabulary, the MATH must stand alone.
Style: follow the namespace/open pattern of Phys/Algebra/MirrorLegalityDerived.lean.
Known Lean pitfalls on this repo: div_le_div_iff wants ≠ 0 args (ne_of_gt); norm_num can't
close large-rational a/c ≤ b/c (use div_le_div_iff_of_pos_right or clear denominators);
`this` shadowing inside nested have-blocks — name hypotheses; exact_mod_cast for ℕ→Cut casts;
after rw chains check for already-closed goals (No goals error = drop the trailing tactic).
DONE = your scratch file compiles with ZERO errors + a 5-line summary: what each theorem
states, which banked theorems you consumed, anything you could NOT prove and why.
If blocked ≥30 min on one proof: leave that single theorem with a `-- BLOCKED: <reason>`
comment, comment it out, compile the rest clean, and report honestly. NEVER fake a proof.
