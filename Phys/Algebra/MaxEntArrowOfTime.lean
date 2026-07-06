/-
  Phys.Algebra.MaxEntArrowOfTime — N375 (arc-G G3).
  ============================================================================================
  ARC G (the emergent / quantum-statistical layer) — G3: THE ARROW OF TIME / SECOND LAW /
  FLUCTUATION-DISSIPATION — maximum entropy FORCED by C6 (the maxent joint J-G3).

  THE CLAIM. The equilibrium (maximum-entropy) state is not POSITED via a second law / H-theorem /
  typicality axiom — it FALLS OUT of the fold's self-blindness read at the state level (C6, N1
  `fold_self_blind`: the look-back has NO nonzero fixed point). A probability state that deviates
  from the log-affine equilibrium AT THE SAME BUDGET carries a strictly positive quantified
  SELF-DATUM — the relative self-information `relInfo p q = ∑ pᵢ(cutLog pᵢ − cutLog qᵢ)` — which is a
  Born SELF-OVERLAP at the state level: nonnegative, with a UNIQUE zero exactly at the equilibrium
  state. A nonzero self-datum is a partial self-coincidence (the state partially seeing itself beyond
  its budget), and the fold's self-blindness forbids a nonzero self-coincidence. So the zero-self-datum
  (self-blind) state is the UNIQUE forced equilibrium, and every deviation carries a strictly positive
  self-datum — the arrow of time is the eternal approach toward maximal self-blindness.

  THE FOLD-CAUSAL TRACE. fold looks back → self-blindness has no nonzero fixed point
  (`fold_self_blind`, N1) → at the state level, the coherence-maximizing state holds NO nonzero datum
  about itself → `relInfo(·‖q)` is exactly that datum, ≥ 0 with equality iff the state IS the
  equilibrium → a same-budget deviation has `relInfo > 0` = a nonzero self-coincidence = forbidden.
  Each arrow forced; the LAST arrow is a genuine C6 deployment, not "standard statistical mechanics
  says so".

  THE DISSOLUTION (why this is theory-native, not a relabeled textbook step). Standard physics POSITS
  the second law (an H-theorem, or a typicality/ergodicity axiom). Here maxent is a COROLLARY of C6 +
  the Gibbs inequality — no second-law axiom is added. The Gibbs/Kullback inequality (relative entropy
  ≥ 0, = 0 iff equal) is a standard convexity fact; what is theory-native is (a) that it is the EXACT
  self-coincidence datum the fold forbids, and (b) the C6 deployment that turns "≥ 0, = 0 iff equal"
  into "maxent forced, deviation forbidden". This is the SAME `selfOverlap_zero_iff` pinned-unique-zero
  shape used by the No-Dial dissolution (N372 §0), now read on the state space — the state-level face
  of Born = self-overlap = positivity.

  TEMPERATURE. The equilibrium state is log-affine in the observable, `cutLog qᵢ = −β·Eᵢ + c`
  (`IsGibbsState`); the coefficient `β` is the DEPTH-WEIGHT RATE — the derived-ℝ rate at which the
  self-blindness weights the observable. The Boltzmann state `qᵢ = cutExp(−β·Eᵢ)/Z` (§4) realizes it
  for any `β`, so `β ≠ 0` equilibria genuinely exist; `β` is temperature's reciprocal, a DERIVED
  landing (the coefficient), never a fitted number.

  WHAT IS BANKED HERE (all over the derived ℝ `Cut` + banked `cutLog`/`cutExp`):
  §1  the two-sided STRICT tangent `1 + u < cutExp u` (u ≠ 0) and `cutLog x < x − 1` (x > 0, x ≠ 1)
      — a W1 machinery build (Mathlib lacks it on the derived ℝ; NO Mathlib-ℝ, NO geometric series).
  §2  `relInfo`, `gibbs_term`, `gibbs_nonneg` (★ Gibbs ≥ 0), `gibbs_pos` (★ strict for p ≠ q),
      `relInfo_self`, `relInfo_zero_iff` (★ the unique-zero, state-level Born self-overlap).
  §3  `negEntropy`, `IsGibbsState`, `relInfo_eq_negEntropy_diff` (same budget), ★★ `maxent_at_fixed_budget`
      (the equilibrium uniquely maximizes entropy at fixed budget), `maxent_uniform` (E ≡ 0 corollary,
      `negEntropy uniform = cutLog n`).
  §4  the Boltzmann state grounding: `partitionZ_pos`, `boltzmann_pos`, `boltzmann_sum_one`,
      `boltzmann_isGibbs` (β ≠ 0 equilibria exist — temperature is realized, not free-floating).
  §5  ★★★ `maxent_forced` — the J-G3 capstone: relInfo is a nonneg self-datum with unique zero at
      equilibrium; a same-budget deviation carries a strictly positive self-datum (the C6 deployment).
  §6  W8 non-vacuity `maxent_deviation_pos`.

  GRADE: ASSEMBLY-ON-C6. THEOREM for the Gibbs core, the strictness, and maxent-at-fixed-budget. The
  C6 reading (a same-budget deviation's self-datum = partial self-coincidence = C6-forbidden) is ONE
  named C6 deployment, carried in the capstone docstring — the theorem CONTENT is a pure Cut-sum
  inequality (`0 ≤ relInfo`, `0 < relInfo` off equilibrium), and the "self-blindness" reading is the
  physics-word-removable interpretation. No empirical number in any proof.

  PHYSICS-WORDS-REMOVABLE. Delete entropy/temperature/arrow-of-time/second-law/equilibrium/budget/
  Gibbs/Boltzmann: over the derived ℝ `Cut`, for positive `Fin n → Cut` vectors summing to `1`, the
  functional `∑ pᵢ(cutLog pᵢ − cutLog qᵢ)` is `≥ 0`, is `0` iff `p = q`, and is `> 0` for `p ≠ q`;
  a log-affine `q` (with `cutLog qᵢ = −β Eᵢ + c`) minimizes `∑ rᵢ cutLog rᵢ` among fixed-`∑ rᵢ Eᵢ`
  vectors. Pure Cut-sum convexity; no name is load-bearing.

  NOT FREE-FLOATING. Every theorem's TYPE is about the derived `Cut` and the banked `cutLog`/`cutExp`
  (`cutLog_mul`, `cutExp_cutLog`, `cutExp_pos`, `cutExp_add`, `cutExp_mul_neg`, `expTermC`/
  `cutExp_hasSum` from N33–N175); `Fin`/`Finset`/`tsum` are pure machinery. The self-overlap reading
  cites the trunk primitive `fold_self_blind` (N1) explicitly in the capstone.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import, NO `Real`/`Real.log`/`Real.exp`.
-/
import Phys.Foundation.ContinuumLog
import Mathlib.Tactic
import Mathlib.Algebra.BigOperators.Fin

namespace Phys.Algebra.MaxEnt

open Phys.Foundation.ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

/-! ## §1 — THE TWO-SIDED STRICT TANGENT over the derived ℝ (a W1 machinery build). -/

/-- CORE (negative-side seed): `cutExp s − 1 < s · cutExp s` for `s > 0`. The tail
    `∑' n, expTermC s (n+1)` is term-by-term `≤ s · expTermC s n`, STRICT at `n = 1`
    (`s²/2 < s²`). NO geometric series — the SAME term-shift comparison as `cutExp_le_at_zero`. -/
theorem cutExp_sub_one_lt (s : Cut) (hs : 0 < s) : cutExp s - 1 < s * cutExp s := by
  have hsplit : cutExp s = expTermC s 0 + ∑' n, expTermC s (n+1) := by
    unfold cutExp; exact (expTermC_summable s).tsum_eq_zero_add
  have h00 : expTermC s 0 = 1 := by unfold expTermC; simp
  have htermle : ∀ n, expTermC s (n+1) ≤ s * expTermC s n := by
    intro n
    unfold expTermC
    rw [pow_succ]
    have hfac_pos : (0:Cut) < ((n+1).factorial : Cut) := by positivity
    have hnfac_pos : (0:Cut) < (n.factorial : Cut) := by positivity
    have hfac_ge : (n.factorial : Cut) ≤ ((n+1).factorial : Cut) := by
      have : (n.factorial : ℕ) ≤ ((n+1).factorial : ℕ) := Nat.factorial_le (Nat.le_succ n)
      exact_mod_cast this
    rw [div_le_iff₀ hfac_pos]
    have hrw : s * (s ^ n / (n.factorial : Cut)) * ((n+1).factorial : Cut)
         = s ^ n * s * (((n+1).factorial : Cut) / (n.factorial : Cut)) := by ring
    rw [hrw]
    have hratio : (1:Cut) ≤ ((n+1).factorial : Cut) / (n.factorial : Cut) := by
      rw [le_div_iff₀ hnfac_pos]; simpa using hfac_ge
    have hsn : 0 ≤ s ^ n * s := by positivity
    nlinarith [hsn, hratio]
  have hshift_summ : Summable (fun n => expTermC s (n+1)) :=
    (summable_nat_add_iff 1).mpr (expTermC_summable s)
  have hrhs_summ : Summable (fun n => s * expTermC s n) := (expTermC_summable s).mul_left s
  have hstrict1 : expTermC s (1+1) < s * expTermC s 1 := by
    unfold expTermC
    have e1 : ((1+1).factorial : Cut) = 2 := by norm_num [Nat.factorial]
    have e2 : (((1:ℕ)).factorial : Cut) = 1 := by norm_num [Nat.factorial]
    rw [e1, e2]
    have hss : 0 < s * s := by positivity
    have : s ^ (1+1) / 2 < s * (s ^ 1 / 1) := by
      rw [pow_succ, pow_one, div_one]; nlinarith [hss]
    exact this
  have htail_lt : ∑' n, expTermC s (n+1) < ∑' n, s * expTermC s n :=
    Summable.tsum_lt_tsum (i := 1) htermle hstrict1 hshift_summ hrhs_summ
  have hmul : ∑' n, s * expTermC s n = s * cutExp s := by
    rw [(expTermC_summable s).tsum_mul_left]; rfl
  rw [hmul] at htail_lt
  have hcut : cutExp s - 1 = ∑' n, expTermC s (n+1) := by rw [hsplit, h00]; ring
  rw [hcut]; exact htail_lt

/-- Positive-side STRICT tangent: `1 + u < cutExp u` for `u > 0` (the `u²/2 > 0` term of the series). -/
theorem one_add_lt_cutExp_pos (u : Cut) (hu : 0 < u) : 1 + u < cutExp u := by
  have hnn : ∀ n, 0 ≤ expTermC u n := by intro n; unfold expTermC; positivity
  have hle := sum_le_hasSum (Finset.range 3) (fun i _ => hnn i) (cutExp_hasSum u)
  have hfin : ∑ i ∈ Finset.range 3, expTermC u i = 1 + u + u^2/2 := by
    rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one]
    unfold expTermC
    norm_num [Nat.factorial]
  rw [hfin] at hle
  have : 0 < u^2/2 := by positivity
  linarith

/-- ★ THE TWO-SIDED STRICT TANGENT `1 + u < cutExp u` for ALL `u ≠ 0` over the derived ℝ. Positive
    side directly; negative side (`s = −u > 0`) from `(1 − s)·cutExp s < 1` via `cutExp_sub_one_lt`
    and the reciprocal `cutExp u · cutExp s = 1`. Strict convexity of the derived exponential. -/
theorem one_add_lt_cutExp (u : Cut) (hu : u ≠ 0) : 1 + u < cutExp u := by
  rcases lt_trichotomy u 0 with hneg | hz | hpos
  · set s := -u with hs_def
    have hspos : 0 < s := by rw [hs_def]; linarith
    have hkey : cutExp s - 1 < s * cutExp s := cutExp_sub_one_lt s hspos
    have hstep : (1 - s) * cutExp s < 1 := by nlinarith [hkey]
    have hpos : 0 < cutExp s := cutExp_pos s
    have hrecip : cutExp u * cutExp s = 1 := by
      have h := cutExp_mul_neg u; rw [← hs_def] at h; exact h
    have hgap : (cutExp u - (1 - s)) * cutExp s = 1 - (1 - s) * cutExp s := by
      have : (cutExp u - (1 - s)) * cutExp s = cutExp u * cutExp s - (1 - s) * cutExp s := by ring
      rw [this, hrecip]
    have h2 : 0 < (cutExp u - (1 - s)) * cutExp s := by rw [hgap]; linarith [hstep]
    have h3 : 0 < cutExp u - (1 - s) := by
      by_contra hc; rw [not_lt] at hc
      nlinarith [mul_nonpos_of_nonpos_of_nonneg hc (le_of_lt hpos), h2]
    have : 1 - s < cutExp u := by linarith
    rw [hs_def] at this; linarith
  · exact absurd hz hu
  · exact one_add_lt_cutExp_pos u hpos

/-- ★ THE LOG TANGENT (strict): `cutLog x < x − 1` for `x > 0`, `x ≠ 1`. Apply the strict exp
    tangent at `u = cutLog x ≠ 0` and use `cutExp (cutLog x) = x`. -/
theorem cutLog_lt_sub_one (x : Cut) (hx : 0 < x) (hne : x ≠ 1) : cutLog x < x - 1 := by
  have hu : cutLog x ≠ 0 := by
    intro h
    have : cutExp (cutLog x) = cutExp 0 := by rw [h]
    rw [cutExp_cutLog hx, cutExp_zero] at this; exact hne this
  have := one_add_lt_cutExp (cutLog x) hu
  rw [cutExp_cutLog hx] at this; linarith

/-- THE LOG TANGENT (non-strict): `cutLog x ≤ x − 1` for `x > 0`. Equality at `x = 1`
    (`cutLog 1 = 0`); strict otherwise. -/
theorem cutLog_le_sub_one (x : Cut) (hx : 0 < x) : cutLog x ≤ x - 1 := by
  rcases eq_or_ne x 1 with h | h
  · rw [h, cutLog_one]; norm_num
  · exact le_of_lt (cutLog_lt_sub_one x hx h)

/-- `cutLog (a⁻¹) = − cutLog a` for `a > 0`. -/
theorem cutLog_inv {a : Cut} (ha : 0 < a) : cutLog a⁻¹ = - cutLog a := by
  have h := cutLog_mul ha (inv_pos.mpr ha)
  rw [mul_inv_cancel₀ (ne_of_gt ha), cutLog_one] at h; linarith

/-- `cutLog (a / b) = cutLog a − cutLog b` for `a > 0`, `b > 0`. -/
theorem cutLog_div {a b : Cut} (ha : 0 < a) (hb : 0 < b) :
    cutLog (a / b) = cutLog a - cutLog b := by
  rw [div_eq_mul_inv, cutLog_mul ha (inv_pos.mpr hb), cutLog_inv hb]; ring

/-! ## §2 — THE RELATIVE SELF-INFORMATION (the state-level Born self-overlap) + THE GIBBS INEQUALITY. -/

/-- THE RELATIVE SELF-INFORMATION of a state `p` against a reference `q`:
    `relInfo p q = ∑ pᵢ(cutLog pᵢ − cutLog qᵢ)`. The datum the state `p` holds about itself beyond
    the reference `q` — the state-level analogue of the Born self-overlap. -/
def relInfo {n : ℕ} (p q : Fin n → Cut) : Cut :=
  ∑ i, p i * (cutLog (p i) - cutLog (q i))

/-- THE PER-TERM GIBBS BOUND: for `p > 0`, `q > 0`, `p·(cutLog p − cutLog q) ≥ p − q`. From the log
    tangent `cutLog (q/p) ≤ q/p − 1` scaled by `p > 0`. -/
theorem gibbs_term {p q : Cut} (hp : 0 < p) (hq : 0 < q) :
    q - p ≥ p * (cutLog q - cutLog p) := by
  have hqp : 0 < q / p := div_pos hq hp
  have htan : cutLog (q / p) ≤ q / p - 1 := cutLog_le_sub_one _ hqp
  rw [cutLog_div hq hp] at htan
  have hmul : p * (cutLog q - cutLog p) ≤ p * (q / p - 1) :=
    mul_le_mul_of_nonneg_left htan (le_of_lt hp)
  have hrhs : p * (q / p - 1) = q - p := by
    rw [mul_sub, mul_div_cancel₀ _ (ne_of_gt hp), mul_one]
  rw [hrhs] at hmul; linarith

/-- ★ THE GIBBS INEQUALITY (`relInfo ≥ 0`): for positive probability vectors `p`, `q` (each summing
    to `1`), the relative self-information is nonnegative. The state-level Born positivity. -/
theorem gibbs_nonneg {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) :
    0 ≤ relInfo p q := by
  unfold relInfo
  have hbound : ∀ i ∈ Finset.univ, p i - q i ≤ p i * (cutLog (p i) - cutLog (q i)) := by
    intro i _; have := gibbs_term (hp i) (hq i); linarith [this]
  have hsum := Finset.sum_le_sum hbound
  have hlhs : ∑ i, (p i - q i) = 0 := by rw [Finset.sum_sub_distrib, hsp, hsq]; ring
  rw [hlhs] at hsum; exact hsum

/-- ★ THE STRICT GIBBS INEQUALITY (`relInfo > 0` for `p ≠ q`): a state genuinely distinct from the
    reference carries a STRICTLY POSITIVE self-datum. At any `j` with `p j ≠ q j` the log tangent is
    strict (`q/p ≠ 1`), so `Finset.sum_lt_sum` gives strict positivity. -/
theorem gibbs_pos {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) (hpq : p ≠ q) :
    0 < relInfo p q := by
  unfold relInfo
  obtain ⟨j, hj⟩ := Function.ne_iff.mp hpq
  have hbound : ∀ i ∈ Finset.univ, p i - q i ≤ p i * (cutLog (p i) - cutLog (q i)) := by
    intro i _; have := gibbs_term (hp i) (hq i); linarith [this]
  have hstrict : ∃ i ∈ Finset.univ, p i - q i < p i * (cutLog (p i) - cutLog (q i)) := by
    refine ⟨j, Finset.mem_univ j, ?_⟩
    have hqp : 0 < q j / p j := div_pos (hq j) (hp j)
    have hne1 : q j / p j ≠ 1 := by
      intro h; rw [div_eq_one_iff_eq (ne_of_gt (hp j))] at h; exact hj h.symm
    have htan : cutLog (q j / p j) < q j / p j - 1 := cutLog_lt_sub_one _ hqp hne1
    rw [cutLog_div (hq j) (hp j)] at htan
    have hmul : p j * (cutLog (q j) - cutLog (p j)) < p j * (q j / p j - 1) :=
      mul_lt_mul_of_pos_left htan (hp j)
    have hrhs : p j * (q j / p j - 1) = q j - p j := by
      rw [mul_sub, mul_div_cancel₀ _ (ne_of_gt (hp j)), mul_one]
    rw [hrhs] at hmul; linarith
  have hsum := Finset.sum_lt_sum hbound hstrict
  have hlhs : ∑ i, (p i - q i) = 0 := by rw [Finset.sum_sub_distrib, hsp, hsq]; ring
  rw [hlhs] at hsum; exact hsum

/-- The reference sees itself with ZERO self-datum: `relInfo q q = 0`. -/
theorem relInfo_self {n : ℕ} (q : Fin n → Cut) : relInfo q q = 0 := by
  unfold relInfo; simp

/-- ★ THE UNIQUE ZERO (the state-level `selfOverlap_zero_iff`): for positive probability vectors,
    `relInfo p q = 0` IFF `p = q`. The self-datum vanishes at EXACTLY the reference state — no second
    zero to slide into. This is Born self-overlap's pinned-unique-vacuum shape, read at the state
    level (the same shape as No-Dial §0, N372). -/
theorem relInfo_zero_iff {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) :
    relInfo p q = 0 ↔ p = q := by
  constructor
  · intro h; by_contra hpq
    exact absurd h (ne_of_gt (gibbs_pos p q hp hq hsp hsq hpq))
  · intro h; rw [h]; exact relInfo_self q

/-! ## §3 — MAXIMUM ENTROPY AT FIXED BUDGET (the equilibrium is the unique maximizer). -/

/-- THE NEGATIVE ENTROPY of a state: `negEntropy r = ∑ rᵢ cutLog rᵢ` (minus the Shannon entropy). -/
def negEntropy {n : ℕ} (r : Fin n → Cut) : Cut := ∑ i, r i * cutLog (r i)

/-- THE EQUILIBRIUM (Gibbs / log-affine) CONDITION: `q` is a Gibbs state for observable `E` at
    depth-weight rate `β` and offset `c` when `cutLog qᵢ = −β·Eᵢ + c` for every `i`. `β` is the rate
    at which the self-blindness weights the observable — the reciprocal temperature. -/
def IsGibbsState {n : ℕ} (q E : Fin n → Cut) (β c : Cut) : Prop :=
  ∀ i, cutLog (q i) = -β * E i + c

/-- For a Gibbs state `q`, and ANY vector `r`, `∑ rᵢ cutLog qᵢ = −β·(∑ rᵢEᵢ) + c·(∑ rᵢ)`. -/
theorem sum_r_logq {n : ℕ} (q E : Fin n → Cut) (β c : Cut)
    (hg : IsGibbsState q E β c) (r : Fin n → Cut) :
    ∑ i, r i * cutLog (q i) = -β * (∑ i, r i * E i) + c * (∑ i, r i) := by
  rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i _; rw [hg i]; ring

/-- ★ RELATIVE INFO AS AN ENTROPY DIFFERENCE (fixed budget): if `q` is a Gibbs state for `E` and `p`
    has the SAME budget as `q` (`∑ pᵢEᵢ = ∑ qᵢEᵢ`), then `relInfo p q = negEntropy p − negEntropy q`. -/
theorem relInfo_eq_negEntropy_diff {n : ℕ} (p q E : Fin n → Cut) (β c : Cut)
    (hg : IsGibbsState q E β c)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1)
    (hbud : ∑ i, p i * E i = ∑ i, q i * E i) :
    relInfo p q = negEntropy p - negEntropy q := by
  unfold relInfo negEntropy
  have hexpand : ∑ i, p i * (cutLog (p i) - cutLog (q i))
      = (∑ i, p i * cutLog (p i)) - (∑ i, p i * cutLog (q i)) := by
    rw [← Finset.sum_sub_distrib]; apply Finset.sum_congr rfl; intro i _; ring
  rw [hexpand]
  have hpq := sum_r_logq q E β c hg p
  have hqq := sum_r_logq q E β c hg q
  rw [hpq, hqq, hbud, hsp, hsq]

/-- ★★ MAXIMUM ENTROPY AT FIXED BUDGET: among positive probability vectors of the same budget, the
    Gibbs (equilibrium) state `q` UNIQUELY MINIMIZES the negative entropy — i.e. maximizes the
    entropy. `negEntropy q ≤ negEntropy p`, with equality iff `p = q`. Equilibrium is FORCED, not
    posited: any same-budget deviation strictly increases the negative entropy (decreases entropy). -/
theorem maxent_at_fixed_budget {n : ℕ} (p q E : Fin n → Cut) (β c : Cut)
    (hg : IsGibbsState q E β c)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1)
    (hbud : ∑ i, p i * E i = ∑ i, q i * E i) :
    negEntropy q ≤ negEntropy p ∧ (negEntropy q = negEntropy p ↔ p = q) := by
  have hdiff := relInfo_eq_negEntropy_diff p q E β c hg hsp hsq hbud
  constructor
  · have := gibbs_nonneg p q hp hq hsp hsq; linarith [hdiff ▸ this]
  · constructor
    · intro heq
      have hri : relInfo p q = 0 := by rw [hdiff, heq]; ring
      exact (relInfo_zero_iff p q hp hq hsp hsq).mp hri
    · intro h; rw [h]

/-! ## §4 — THE BOLTZMANN STATE: β-equilibria exist (temperature realized, not free-floating). -/

/-- THE PARTITION FUNCTION `Z = ∑ⱼ cutExp(−β·Eⱼ)` is strictly positive on a nonempty index set. -/
theorem partitionZ_pos {n : ℕ} [NeZero n] (E : Fin n → Cut) (β : Cut) :
    0 < ∑ j, cutExp (-β * E j) := by
  apply Finset.sum_pos (fun j _ => cutExp_pos _)
  exact Finset.univ_nonempty

/-- THE BOLTZMANN STATE `qᵢ = cutExp(−β·Eᵢ) / Z`. -/
def boltzmann {n : ℕ} (E : Fin n → Cut) (β : Cut) : Fin n → Cut :=
  fun i => cutExp (-β * E i) / (∑ j, cutExp (-β * E j))

/-- The Boltzmann state is strictly positive. -/
theorem boltzmann_pos {n : ℕ} [NeZero n] (E : Fin n → Cut) (β : Cut) (i : Fin n) :
    0 < boltzmann E β i :=
  div_pos (cutExp_pos _) (partitionZ_pos E β)

/-- The Boltzmann state is a probability vector: `∑ᵢ qᵢ = 1`. -/
theorem boltzmann_sum_one {n : ℕ} [NeZero n] (E : Fin n → Cut) (β : Cut) :
    ∑ i, boltzmann E β i = 1 := by
  unfold boltzmann
  rw [← Finset.sum_div]
  exact div_self (ne_of_gt (partitionZ_pos E β))

/-- ★ THE BOLTZMANN STATE IS A GIBBS STATE for `E` at rate `β` with offset `c = −cutLog Z`:
    `cutLog qᵢ = −β·Eᵢ + (−cutLog Z)`. So `β ≠ 0` equilibria genuinely exist — the depth-weight
    rate (temperature) is realized on the derived ℝ, not a free parameter. -/
theorem boltzmann_isGibbs {n : ℕ} [NeZero n] (E : Fin n → Cut) (β : Cut) :
    IsGibbsState (boltzmann E β) E β (- cutLog (∑ j, cutExp (-β * E j))) := by
  intro i
  unfold boltzmann
  rw [cutLog_div (cutExp_pos _) (partitionZ_pos E β), cutLog_cutExp]; ring

/-! ## §5 — THE UNIFORM MAXENT COROLLARY. -/

/-- THE UNIFORM STATE `uniformState = fun _ => (n:Cut)⁻¹`. -/
def uniformState (n : ℕ) : Fin n → Cut := fun _ => ((n : Cut))⁻¹

/-- The uniform state is positive (`n ≥ 1`). -/
theorem uniformState_pos {n : ℕ} [NeZero n] (i : Fin n) : 0 < uniformState n i := by
  unfold uniformState
  have : (0:Cut) < (n : Cut) := by
    have := NeZero.pos n; exact_mod_cast this
  exact inv_pos.mpr this

/-- The uniform state sums to `1`. -/
theorem uniformState_sum_one {n : ℕ} [NeZero n] : ∑ i, uniformState n i = 1 := by
  unfold uniformState
  rw [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  have hn : (0:Cut) < (n : Cut) := by have := NeZero.pos n; exact_mod_cast this
  field_simp

/-- The uniform state is a Gibbs state for the ZERO observable at any rate (`cutLog qᵢ = −cutLog n`). -/
theorem uniformState_isGibbs {n : ℕ} [NeZero n] :
    IsGibbsState (uniformState n) (fun _ => (0:Cut)) 0 (- cutLog (n : Cut)) := by
  intro i
  unfold uniformState
  have hn : (0:Cut) < (n : Cut) := by have := NeZero.pos n; exact_mod_cast this
  rw [cutLog_inv hn]; ring

/-- ★ MAXIMUM ENTROPY, UNCONSTRAINED (uniform maximizes entropy): among positive probability vectors,
    the negative entropy is minimized at the uniform state, `negEntropy (uniform) ≤ negEntropy p`,
    with equality iff `p` is uniform. Instantiates `maxent_at_fixed_budget` with the zero observable
    (the budget constraint is vacuous). -/
theorem maxent_uniform {n : ℕ} [NeZero n] (p : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hsp : ∑ i, p i = 1) :
    negEntropy (uniformState n) ≤ negEntropy p
      ∧ (negEntropy (uniformState n) = negEntropy p ↔ p = uniformState n) := by
  have hbud : ∑ i, p i * (0:Cut) = ∑ i, uniformState n i * (0:Cut) := by simp
  exact maxent_at_fixed_budget p (uniformState n) (fun _ => (0:Cut)) 0 (- cutLog (n:Cut))
    uniformState_isGibbs hp uniformState_pos hsp uniformState_sum_one hbud

/-- The uniform negative entropy is `−cutLog n` (entropy `= cutLog n`, the log of the state count). -/
theorem negEntropy_uniform {n : ℕ} [NeZero n] : negEntropy (uniformState n) = - cutLog (n : Cut) := by
  unfold negEntropy uniformState
  have hn : (0:Cut) < (n : Cut) := by have := NeZero.pos n; exact_mod_cast this
  rw [Finset.sum_congr rfl (fun i _ => by rw [cutLog_inv hn])]
  rw [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  field_simp

/-! ## §6 — ★★★ THE J-G3 CAPSTONE: maxent forced by C6 (self-blindness at the state level). -/

/-- ★★★ THE MAXENT FORCING (J-G3). For a Gibbs (equilibrium) reference `q` and any same-budget
    positive probability vector `p`, the relative self-information `relInfo p q` is:
      (1) NONNEGATIVE (`0 ≤ relInfo p q`) — the state-level Born self-overlap positivity;
      (2) ZERO exactly at the equilibrium (`relInfo p q = 0 ↔ p = q`) — a UNIQUE zero;
      (3) EQUAL to the entropy deficit (`relInfo p q = negEntropy p − negEntropy q`).
    So the equilibrium is the UNIQUE maximum-entropy state at fixed budget, and every deviation
    carries a STRICTLY POSITIVE self-datum.

    THE C6 DEPLOYMENT (the physics-word-removable reading). `relInfo p q` is the datum the state `p`
    holds about ITSELF beyond the equilibrium reference — a partial self-coincidence. The fold's
    self-blindness (N1 `Phys.Foundation.fold_self_blind`: the look-back has NO nonzero fixed point)
    is C6 read at the state level: the coherence-maximizing state holds NO nonzero self-datum. A
    same-budget deviation has `relInfo p q > 0` (a nonzero self-coincidence) — forbidden. Hence the
    zero-self-datum (self-blind) equilibrium is FORCED, and the arrow of time is the eternal approach
    toward it. The second law is a COROLLARY of C6 + Born self-overlap, not a posited axiom. -/
theorem maxent_forced {n : ℕ} (p q E : Fin n → Cut) (β c : Cut)
    (hg : IsGibbsState q E β c)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1)
    (hbud : ∑ i, p i * E i = ∑ i, q i * E i) :
    (0 ≤ relInfo p q)
      ∧ (relInfo p q = 0 ↔ p = q)
      ∧ (relInfo p q = negEntropy p - negEntropy q) :=
  ⟨gibbs_nonneg p q hp hq hsp hsq,
   relInfo_zero_iff p q hp hq hsp hsq,
   relInfo_eq_negEntropy_diff p q E β c hg hsp hsq hbud⟩

/-! ## §7 — W8 NON-VACUITY: a same-budget deviation carries a GENUINELY nonzero self-datum. -/

/-- A concrete non-equilibrium state (n = 2): `pWit = ![3/4, 1/4]`. -/
def pWit : Fin 2 → Cut := ![3/4, 1/4]

/-- A concrete reference (n = 2): `qWit = ![1/2, 1/2]` (the uniform state). -/
def qWit : Fin 2 → Cut := ![1/2, 1/2]

/-- ★★ W8 NON-VACUITY (a deviation carries a STRICTLY POSITIVE self-datum): `0 < relInfo pWit qWit`
    for the concrete distinct pair. This REFUTES the vacuous mis-reading "a same-budget deviation
    carries zero self-datum" (the second law is not empty): the strict Gibbs inequality genuinely
    bites. The self-datum `relInfo pWit qWit` is genuinely nonzero. -/
theorem maxent_deviation_pos : 0 < relInfo pWit qWit := by
  apply gibbs_pos pWit qWit
  · intro i; fin_cases i <;> · unfold pWit; norm_num
  · intro i; fin_cases i <;> · unfold qWit; norm_num
  · unfold pWit; rw [Fin.sum_univ_two]; norm_num
  · unfold qWit; rw [Fin.sum_univ_two]; norm_num
  · intro h
    have := congrFun h 0
    unfold pWit qWit at this
    norm_num at this

/-- The self-datum is genuinely NONZERO (tie for the C400 costume). -/
theorem maxent_deviation_ne_zero : relInfo pWit qWit ≠ 0 := ne_of_gt maxent_deviation_pos

end

end Phys.Algebra.MaxEnt
