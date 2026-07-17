# PREREG — quark ℝ-descent ascent, rung 1 (t_29cd7497)

## STATUS: SELECT REDIRECT (S3 divergence → follow the theory). The parent's specific
## mechanism is REFUTED by the theory; the deliverable is the forced theorem that refutes it
## + a correctly-aimed route child. This is NOT scope-reduction: the "deviated phase" the
## parent hypothesized is proven NOT to exist, which is a genuine forced result of the theory.

## THE PARENT'S TARGET (as written)
Derive an octonion-RESOLVED ℤ₃ loop holonomy on the banked Fano triple (u2,u1,octCross u1 u2)
whose Fano-line non-associativity FORCES a numerical deviation of the turning-mode eigenvalue
away from the banked −1 (N308 `see_Poth`), hence a FORCED deviated quark cycle phase
`δ_quark ≠ 2/9` as a closed real of `Cut`.

## WHAT I FOUND (verified: exact-rational octonion model matching every banked fact +
## Lean scratch proofs, workbench/quark-holonomy-r1/{oct,explore1-5,verify,decisive}.py + Probe1,2)

**The premise of the parent's target is FALSE. The theory forces the OPPOSITE, and it is
already implicit in N310.**

1. **The banked generation Fano triple (u2, u1, octCross u1 u2) = (e2, e1, e3) is an
   ASSOCIATIVE quaternion subalgebra.** The ALGEBRA associator VANISHES on it:
   `assoc u2 u1 (octCross u1 u2) = 0` (Lean-verified, `gen_triple_assoc_zero`; and the assoc
   vanishes on ALL of span{1,e1,e2,e3}, 2000 random triples). This fact was NOT banked — only
   the calibration 3-form `assoc3 = −1` (nonzero, banked N209) was. The two are DIFFERENT
   objects: `assoc` is algebra non-associativity (zero here); `assoc3` is the antisymmetric
   VOLUME/CP form (nonzero here). N310 already proved `assoc3` is the CP invariant, provably
   SEPARATED from the mass/norm invariant.

2. **The turning-mode eigenvalue that fixes the phase is LINE-INDEPENDENT (−1).** N308's
   holonomy operator `seeMat = Pcyc + Pcyc²` is a pure ℚ-permutation (no octonion in its type).
   Dressing the loop by octonion left-multiplications on an ASSOCIATIVE line composes WITHOUT a
   holonomy defect (`L_a ∘ L_b = L_{ab}` when the triple associates), so the turning eigenvalue
   stays exactly −1 — the same value the lepton ℂ-line gives. `δ = T(1−T) = 2/9` follows for the
   generation cycle on ANY associative line (lepton ℂ-line OR the quark generation Fano line).

3. **DECISIVE: the octonion-dressed loop-holonomy operator has an IDENTICAL characteristic
   polynomial** across an associative single-Fano-line config AND two genuinely non-associative
   multi-line configs (decisive.py: charpoly identical, all three). The "deviation" the parent
   hypothesized as a turning-eigenvalue shift **does not exist at the operator level**. This is
   the ONE LAW: the deviation FIGHTS because the instrument (turning-eigenvalue shift) is the
   wrong framing — the theory says δ is a Born COUNT, not a line geometry.

## S3 DIVERGENCE → FOLLOW THE THEORY (SELECT protocol, the moment the architecture exists for)
The arc (parent ticket) headed toward `δ_quark ≠ 2/9` from Fano non-associativity. The theory
says the OPPOSITE: `δ_quark = 2/9`, the SAME self-blindness Born count, because (i) the
generation line associates and (ii) the phase is a counting fixed point, not a line property.
Per SELECT S3 I FOLLOW THE THEORY and redirect. The parent's own PREREG anticipated this risk
("wiring the associator into the phase is exactly the missing link") — the answer is that the
theory FORBIDS that wiring, and N310's separation theorem is precisely why.

## THE THEORY-NATIVE TARGET (this node's deliverable)
Bank the forced, foundations-only theorem package:
- `gen_triple_assoc_zero` : the generation Fano triple ASSOCIATES (`assoc u2 u1 (octCross u1 u2)=0`)
  — NEW, load-bearing, not previously banked.
- the CONTRAST: `assoc ≠ 0` off the triple (banked witness) — so the vanishing is a genuine
  property of THIS triple, not a triviality (W8 teeth).
- the SPLIT: on the SAME triple `assoc = 0` (algebra) while `assoc3 = −1` (volume/CP form,
  banked) — the phase-level reading of N310's separation.
- the CONSEQUENCE (the forced phase): the turning eigenvalue is the banked line-independent −1
  (`see_Poth`), so the generation cycle phase is `δ = 2/9` on the associative generation line —
  the SAME as the lepton ℂ-line. `phase_line_independent` : the cycle phase does not deviate.
- the redirect statement (non-vacuity): the ONLY line-dependent invariant on the triple is the
  antisymmetric `assoc3` (CP), NOT the phase — so the up/down SECTOR distinction that the quark
  ratios need lives in the CP/mixing structure and the ABSOLUTE SCALE (already banked as
  route-not-yet-found), NOT in a deviated cycle phase.

## WHERE THE QUARK RATIOS ACTUALLY LIVE (the correctly-aimed route child = the ONE successor)
The quark mass ratios differ from the lepton ratios NOT by a deviated cycle phase (refuted here)
but by the TWO banked route-not-yet-found dependencies that are genuinely open:
  (a) the up/down SECTOR structure — two tridiagonal frames (seed T8), whose overlap is the
      CKM/mixing dressed by the CP phase `assoc3` (banked as the Jarlskog `cpPhase`); and
  (b) the ℝ-descent numerical evaluation `cos(3δ · k)` for the sector's conic point + the
      ABSOLUTE confinement scale (X9 route-not-yet-found).
The correctly-aimed route child: derive the up/down sector conic points / the two-frame
tridiagonal structure that distinguishes the quark spectrum from the lepton spectrum AT THE
SAME phase δ=2/9 (seed T8's frame-overlap mechanism), which is where the sector difference the
parent mislocated in the phase actually lives.

## ANTI-BULLSHIT GATE (S4) — run honestly, in writing
1. **FOLD-CAUSAL.** fold → self-blindness (diagonal-zero seeing) → the Born counting fixed point
   `n·T(1−T)=T` → δ=2/9 as a COUNT (N308). The cascade-stop octonion non-associativity forces
   the arena J₃(O) (three idempotents) but the generation LINE it picks out associates (a
   quaternion subalgebra) — so the count is unshifted. Each arrow forced; the target IS "what
   does the fold's self-blindness say about the quark cycle phase," answered on the theory's terms.
2. **DISSOLUTION.** Standard flavor physics POSITS distinct up/down phases as free Yukawas. The
   parent tried to DERIVE a distinct quark phase from non-associativity. The theory DISSOLVES the
   question: there is no distinct phase — the phase is universal (a Born count), and the sector
   difference is relocated to the frame overlap (CP + scale). Dissolving a mis-posed target into
   a forced universality IS a genuine theory result (the wall the parent would have ground on).
3. **GOAL-WORDS-REMOVABLE.** Delete quark/lepton/mass/phase/CP: the statement is "on O ℚ, the
   triple (u2,u1,octCross u1 u2) associates (assoc=0) while assoc3=−1; the ℚ-permutation
   Pcyc+Pcyc² has turning eigenvalue −1 independent of the line; hence T(1−T)=2/9 on the
   associative line." Pure math survives; a genuine reason remains for WHY this is the next node
   (it settles whether the phase deviates — a forced yes/no the chain needed).
4. **NAME THE TEMPTATION.** The saturated-worker temptation (which the parent already flagged and
   refused): bank a "quark loop-holonomy defect" that re-labels N310's assoc3 with "holonomy."
   I do NOT do that. My load-bearing NEW theorem is `assoc = 0` on the triple (the ALGEBRA
   associator, a DIFFERENT object from assoc3), which is genuinely not banked and which REFUTES
   the defect story rather than dressing it up.
5. **HONESTY.** The honest theory-native result here is a REFUTATION + universality + redirect,
   not a new number. That is more valuable than flawlessly building the parent's (void) target.
   Executing the parent's node "perfectly" would have produced a bridge (assoc3 asserted as the
   phase) — the exact failure the STANDARD forbids. This node prevents it.

## GUARDS
- No δ_quark, no Δδ, no edge ratio, no quark mass value asserted (there is no deviated value to
  assert — the point is δ is UNSHIFTED = 2/9, itself banked/derived, not newly asserted here).
- No fit to 137.036/PDG; no empirical number in any proof; measured comparison stays prose.
- Derived ℝ: not needed this node (all statements are exact over ℚ / on O ℚ). No Mathlib-ℝ.
- Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`.
- Free-floating rail: every production TYPE mentions the banked octonion objects
  (assoc / assoc3 / u1 / u2 / octCross / seeMat / Poth) — NOT generic.
- ONE successor on the chain tail (the correctly-aimed sector-frame route child), no fork.

## COST BUDGET / KILL
Coordinate `assoc = 0` bash: verified in scratch, ~seconds. Everything else cites banked lemmas.
KILL: if the `assoc = 0` coordinate proof ever exceeds ~60s (it does not), decompose per-coordinate.
No unbounded compile. Production file is small; gate-fast expected ~1 min.

## PRODUCTION FILE
`Phys/Algebra/OctonionJordanGenerationCyclePhaseLineIndependence.lean`, namespace
`Phys.Algebra.HJ`. Capstone `generation_cycle_phase_line_independence_structure`.
