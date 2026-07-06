# N375 — arc-G G3: THE ARROW OF TIME / SECOND LAW / FLUCTUATION-DISSIPATION — maxent forced by C6

## TARGET (theory-native, SELECT'd; see kanban comment 281 for full S1–S4)
DERIVE, over the derived ℝ `Cut`, that the equilibrium (maximum-entropy) state is FORCED and that a
same-budget deviation carries a strictly positive self-datum = partial self-coincidence = C6-forbidden
(J-G3). NOT a posited second law.

## MACHINERY DE-RISKED (both probes compile EXIT=0)
- probe_tangent.lean: two-sided STRICT tangent `1 + u < cutExp u` (u≠0) on Cut [Mathlib lacks it on
  the derived ℝ — legitimate W1 build; negative side via a tsum term-shift comparison, NO geometric
  series], and `cutLog x < x−1` (x>0, x≠1). COMPILES CLEAN.
- probe_gibbs.lean: `gibbs_term`, `gibbs_nonneg` (relInfo ≥ 0), `gibbs_pos` (relInfo > 0 for p≠q).
  COMPILES CLEAN (given the tangent axioms, which are now the banked lemmas).

## PRODUCTION PLAN — ONE new module Phys/Algebra/MaxEntArrowOfTime.lean (ns Phys.Algebra.MaxEnt)
§1 TANGENT MACHINERY: cutExp_sub_one_lt, one_add_lt_cutExp_pos, one_add_lt_cutExp, cutLog_lt_sub_one,
   cutLog_le_sub_one.
§2 THE SELF-DATUM: relInfo p q = ∑ pᵢ(cutLog pᵢ − cutLog qᵢ); gibbs_term; gibbs_nonneg; gibbs_pos;
   relInfo_self (=0 at p=q); relInfo_zero_iff (unique zero — the state-level selfOverlap_zero_iff).
§3 MAXENT AT FIXED BUDGET: negEntropy r = ∑ rᵢ cutLog rᵢ; IsGibbsState q E β c := ∀i, cutLog qᵢ = −βEᵢ+c
   (the log-affine equilibrium; β = the depth-weight rate = temperature); sum_p_logq; 
   relInfo_eq_negEntropy_diff (same budget ⟹ relInfo = negEntropy p − negEntropy q);
   maxent_at_fixed_budget (negEntropy q ≤ negEntropy p, i.e. H(p) ≤ H(q_eq), strict off equilibrium);
   maxent_uniform corollary (E≡0 ⟹ H(p) ≤ cutLog n, unique max at uniform).
§4 GROUNDING (non-free-floating / temperature non-vacuity): the Boltzmann state
   qᵢ = cutExp(−βEᵢ)/Z is a positive prob-vector Gibbs state for any β (boltzmann_isGibbs) — such
   β≠0 equilibria exist. [If it fights: drop to uniform witness + NAMED remainder.]
§5 J-G3 CAPSTONE maxent_forced: relInfo is a Born self-overlap at the state level — ≥0, unique zero at
   equilibrium; a same-budget deviation carries a strictly positive self-datum = partial
   self-coincidence, the state-level shadow of self-blindness (C6, fold_self_blind N1): the look-back
   has NO nonzero self-coincidence, so the zero-self-datum (self-blind) state is the UNIQUE forced
   equilibrium. ONE named C6 deployment (docstring); theorem content pure Cut inequalities.
§6 W8 NON-VACUITY: maxent_deviation_pos : 0 < relInfo pWit qWit (n=2, pWit=![3/4,1/4]≠qWit=![1/2,1/2]).
   Costume C400 ties iFlag=1 to relInfo pWit qWit ≠ 0 (refutes "a deviation carries zero self-datum").

## GRADE (honest): assembly-on-C6. Gibbs core + strictness + maxent-at-budget = THEOREM. The C6 reading
   (self-datum = partial self-coincidence, C6-forbidden) = ONE named deployment. Temperature = the
   depth-weight rate β (the coefficient in IsGibbsState) — a DERIVED landing, grounded by Boltzmann.

## GUARDS: over the derived ℝ Cut + banked cutLog/cutExp (NEVER Mathlib-ℝ as content; Fin/Finset/tsum
   pure machinery). No empirical number in any proof (any measured entropy/temperature = removable
   prose). physics-words-removable: delete entropy/temperature/arrow/second-law/equilibrium/budget →
   pure Cut-sum inequalities. foundations-only ⊆ {propext,Classical.choice,Quot.sound}.
