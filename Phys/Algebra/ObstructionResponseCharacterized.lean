import Phys.Algebra.AlphaLandingFinal
import Phys.Algebra.ThresholdClosureSeamLaw
import Mathlib.Tactic

/-!
  # N699 — OBSTRUCTION RESPONSE CHARACTERIZED (the referee's task 4)

  THE OBJECTION (external referee): `AlphaLandingFinal` defines
  `obstructionFromCensus := |censusMeanObj| · kappaLeading` and proves it equals the
  banked obstruction — the census is welded, but the RESPONSE LAW (absolute value,
  linear, exactly one κ) is SELECTED, not derived.

  THE ANSWER (this node): the response law is CHARACTERIZED over an explicit class,
  the way N682 characterized the running law over cocycle+monotone flows. A
  CENSUS RESPONSE is any map `Resp : ℚ → Cut` (census-mean domain → screening
  codomain) satisfying:

  (A1) ADDITIVITY in the census: `Resp (m₁ + m₂) = Resp m₁ + Resp m₂`.
       Independently motivated: the banked screening law is LINEAR in census
       content — `bandScreen_census_additive` (ThresholdClosureSeamLaw, N693):
       a census-valued closure entering a band enters its screening additively
       with unit weight. The obstruction response inherits the same census-
       superposition principle: coherence deficits from disjoint census parts
       contribute independently.

  (A2) NORMALIZATION AT FULL ANTIPODALITY: `Resp (−1) = kappaLeading`.
       The referee's own proposed normalization: a FULLY antipodal census
       (mean −1, every triple anti-associating) responds with exactly ONE
       quantum of the banked loop coupling — one deficit unit through the one
       single-return loop factor that carries every one-return term of the
       grammar (the MirrorSelfInsertionLaw insertion template: census × κ,
       one κ).

  HONESTY: (A2) is THE physical input of this node — one coupling quantum per
  unit antipodal census, stated once, at full antipodality, and nowhere else.
  EVERYTHING ELSE IS DERIVED: ℚ-linearity is NOT assumed — it is PROVED from
  additivity alone by the rational ladder (`response_nat_ladder` /
  `response_int_ladder` / `response_div_ladder` / `response_additive_is_linear`,
  mirroring N682's ladder), the sign and the absolute value EMERGE from the
  banked negative census mean (`census_mean = −3/5`: the response of a negative
  mean under the forced law `m ↦ −m·κ` is `|m|·κ`), and the functional form has
  NO remaining freedom (`response_unique`). The teeth: a quadratic rival that
  MATCHES the normalization at −1 but is non-additive is DETECTED at the census
  mean; an additive rival normalized at 2κ is detected too — the axioms
  discriminate. The capstone welds the characterized response to the banked
  insertion theorem `obstruction_inserted_once`: what ANY response in the class
  inserts at the banked census mean IS the once-inserted obstruction of the
  final landing.

  Banked names consumed BY NAME: `censusMeanObj`, `censusMeanObj_eq`,
  `obstructionFromCensus`, `obstructionTerm_welded`, `obstruction_inserted_once`
  (AlphaLandingFinal N681); `census_mean` (GatherCoherenceCensus N585, via
  `censusMeanObj_eq`); `kappaLeading`, `kappaLeading_pos`, `kappaLeading_ne_zero`
  (FineStructureLoopNormalization); `obstructionTerm` (MirrorFixedPoint);
  `bandScreen_census_additive` (ThresholdClosureSeamLaw N693);
  `recomposedEndpointDressed` (D7DepthTwoComposed).

  NO sorry / NO admit / NO new axioms.
-/

namespace Phys.Algebra.ObstructionResponseCharacterized

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.MirrorFixedPoint
open Phys.Algebra.MirrorTermLanguage

noncomputable section

/-! ## (1) THE RESPONSE CLASS -/

/-- A census response is ADDITIVE: deficits from disjoint census parts contribute
    independently (the banked screening precedent: `bandScreen_census_additive`). -/
def IsAdditive (Resp : ℚ → Cut) : Prop :=
  ∀ a b : ℚ, Resp (a + b) = Resp a + Resp b

/-- A census response is NORMALIZED AT FULL ANTIPODALITY: the unit antipodal census
    (mean −1) responds with exactly one quantum of the banked loop coupling.
    THIS IS THE ONE PHYSICAL INPUT of the node. -/
def NormalizedAtFullAntipodality (Resp : ℚ → Cut) : Prop :=
  Resp (-1) = kappaLeading

/-! ## (2) THE LADDER — additivity alone forces ℚ-linearity.
    NOT an axiom: proved. Mirrors N682's rational ladder. -/

section Ladder

variable (Resp : ℚ → Cut) (hadd : IsAdditive Resp)
include hadd

/-- Ladder rung 0: an additive response sends the empty census to zero. -/
theorem response_zero : Resp 0 = 0 := by
  have h := hadd 0 0
  rw [add_zero] at h
  linarith

/-- Ladder rung 0′: an additive response is odd. -/
theorem response_neg (x : ℚ) : Resp (-x) = -Resp x := by
  have h := hadd x (-x)
  rw [add_neg_cancel, response_zero Resp hadd] at h
  linarith

/-- Ladder rung 1 (up, ℕ): `Resp (n • x) = n • Resp x` — repeated additivity. -/
theorem response_nat_ladder (n : ℕ) (x : ℚ) : Resp (n • x) = n • Resp x := by
  simpa using map_nsmul (AddMonoidHom.mk' Resp hadd) n x

/-- Ladder rung 2 (up, ℤ): `Resp (n • x) = n • Resp x` — rung 1 plus oddness. -/
theorem response_int_ladder (n : ℤ) (x : ℚ) : Resp (n • x) = n • Resp x := by
  simpa using map_zsmul (AddMonoidHom.mk' Resp hadd) n x

/-- Ladder rung 3 (DOWN): `(n : Cut) · Resp (x / n) = Resp x` — the descent rung:
    a census split into `n` equal parts responds with `1/n` of the whole, because
    reassembling the `n` parts (rung 1) must reproduce the whole. -/
theorem response_div_ladder (n : ℕ) (hn : n ≠ 0) (x : ℚ) :
    ((n : ℕ) : Cut) * Resp (x / (n : ℚ)) = Resp x := by
  have hnq : ((n : ℕ) : ℚ) ≠ 0 := Nat.cast_ne_zero.mpr hn
  have harg : (n : ℕ) • (x / (n : ℚ)) = x := by
    rw [nsmul_eq_mul]
    field_simp
  calc ((n : ℕ) : Cut) * Resp (x / (n : ℚ))
      = (n : ℕ) • Resp (x / (n : ℚ)) := (nsmul_eq_mul _ _).symm
    _ = Resp ((n : ℕ) • (x / (n : ℚ))) := (response_nat_ladder Resp hadd n _).symm
    _ = Resp x := by rw [harg]

/-- ★ THE LADDER ASSEMBLED — ADDITIVE ⇒ ℚ-LINEAR: every rational census mean
    `q = num/den` is reachable from the unit census by integer ascent (rung 2 on
    the numerator) and equal-split descent (rung 3 on the denominator), so
    `Resp q = (q : Cut) · Resp 1` for EVERY additive response. Linearity is
    DERIVED, not assumed. -/
theorem response_additive_is_linear (q : ℚ) : Resp q = (q : Cut) * Resp 1 := by
  have hden : ((q.den : ℕ) : Cut) ≠ 0 := Nat.cast_ne_zero.mpr q.den_nz
  -- the numerator ascent: Resp (num) = num • Resp 1
  have hnum : Resp ((q.num : ℚ)) = ((q.num : ℤ) : Cut) * Resp 1 := by
    have h := response_int_ladder Resp hadd q.num 1
    rw [zsmul_eq_mul, mul_one] at h
    rw [h, zsmul_eq_mul]
  -- the denominator descent: den · Resp (num/den) = Resp (num)
  have hdesc := response_div_ladder Resp hadd q.den q.den_nz ((q.num : ℚ))
  -- q IS num/den
  have hq : ((q.num : ℚ)) / ((q.den : ℕ) : ℚ) = q := Rat.num_div_den q
  rw [hq] at hdesc
  -- assemble: Resp q = (num/den : Cut) · Resp 1 = (q : Cut) · Resp 1
  rw [hnum] at hdesc
  rw [Rat.cast_def]
  field_simp at hdesc ⊢
  linarith [hdesc]

end Ladder

/-! ## (3) THE CHARACTERIZATION -/

section Characterization

variable (Resp : ℚ → Cut)

/-- The normalization transports down the ladder: `Resp 1 = −κ` (the unit
    ASSOCIATING census responds with minus one coupling quantum — the sign is
    forced by oddness from the antipodal normalization, not chosen). -/
theorem response_unit (hadd : IsAdditive Resp)
    (hnorm : NormalizedAtFullAntipodality Resp) : Resp 1 = -kappaLeading := by
  have h := response_additive_is_linear Resp hadd (-1)
  rw [hnorm] at h
  have hc : (((-1 : ℚ)) : Cut) = -1 := by push_cast; ring
  rw [hc] at h
  linarith

/-- ★ THE FORCED FORM: an additive response normalized at full antipodality is
    `m ↦ −m·κ` — NO freedom remains in the functional form. -/
theorem response_forced (hadd : IsAdditive Resp)
    (hnorm : NormalizedAtFullAntipodality Resp) (q : ℚ) :
    Resp q = -((q : Cut) * kappaLeading) := by
  rw [response_additive_is_linear Resp hadd q, response_unit Resp hadd hnorm]
  ring

/-- ★★ THE CHARACTERIZATION THEOREM (the referee's task 4): ANY census response
    satisfying (A1) additivity and (A2) full-antipodality normalization takes the
    banked census mean to EXACTLY the banked obstruction —
    `Resp censusMeanObj = obstructionFromCensus = |censusMeanObj| · κ`.
    The absolute value is not selected: it EMERGES because the banked census mean
    is NEGATIVE (`census_mean = −3/5`, consumed via `censusMeanObj_eq`), so the
    forced law `m ↦ −m·κ` evaluates to `(3/5)·κ = |−3/5|·κ`. -/
theorem response_characterized (hadd : IsAdditive Resp)
    (hnorm : NormalizedAtFullAntipodality Resp) :
    Resp censusMeanObj = obstructionFromCensus := by
  rw [response_forced Resp hadd hnorm censusMeanObj]
  unfold obstructionFromCensus
  rw [censusMeanObj_eq]
  rw [abs_of_neg (by norm_num : (-(3/5) : ℚ) < 0)]
  push_cast
  ring

/-- ★ UNIQUENESS: two responses in the class agree EVERYWHERE — not merely at the
    census mean. The class axioms pin the entire functional. -/
theorem response_unique (R₁ R₂ : ℚ → Cut)
    (h₁ : IsAdditive R₁) (h₁n : NormalizedAtFullAntipodality R₁)
    (h₂ : IsAdditive R₂) (h₂n : NormalizedAtFullAntipodality R₂) :
    ∀ q : ℚ, R₁ q = R₂ q := by
  intro q
  rw [response_forced R₁ h₁ h₁n q, response_forced R₂ h₂ h₂n q]

end Characterization

/-! ## (4) TEETH — the axioms discriminate. -/

/-- RIVAL 1: the quadratic response `m ↦ m²·κ`. It MATCHES the normalization at
    full antipodality (`(−1)² · κ = κ`) — so (A2) alone does NOT characterize. -/
def quadraticRival (q : ℚ) : Cut := ((q : Cut)) ^ 2 * kappaLeading

theorem quadraticRival_matches_normalization :
    NormalizedAtFullAntipodality quadraticRival := by
  unfold NormalizedAtFullAntipodality quadraticRival
  push_cast
  ring

/-- TOOTH 1a: the quadratic rival is NOT additive — (A1) rejects it. -/
theorem quadraticRival_not_additive : ¬ IsAdditive quadraticRival := by
  intro h
  have h2 := h 1 1
  unfold quadraticRival at h2
  push_cast at h2
  -- 4κ = 2κ ⇒ 2κ = 0 ⇒ κ = 0, contradicting the banked kappaLeading_pos
  have hk := kappaLeading_pos
  nlinarith [h2, hk]

/-- TOOTH 1b: the quadratic rival is DETECTED at the banked census mean — it
    disagrees with the banked obstruction there (`(9/25)·κ ≠ (3/5)·κ`). The
    discrimination is OBSERVABLE at the actual census, not just formal. -/
theorem quadraticRival_detected :
    quadraticRival censusMeanObj ≠ obstructionFromCensus := by
  unfold quadraticRival obstructionFromCensus
  rw [censusMeanObj_eq]
  rw [abs_of_neg (by norm_num : (-(3/5) : ℚ) < 0)]
  intro h
  push_cast at h
  have hk := kappaLeading_pos
  nlinarith [h, hk]

/-- RIVAL 2: the doubled-coupling response `m ↦ −m·(2κ)`. It IS additive — so
    (A1) alone does NOT characterize either. -/
def doubledRival (q : ℚ) : Cut := -((q : Cut) * (2 * kappaLeading))

theorem doubledRival_additive : IsAdditive doubledRival := by
  intro a b
  unfold doubledRival
  push_cast
  ring

/-- TOOTH 2a: the doubled rival FAILS the full-antipodality normalization
    (`2κ ≠ κ` since the banked κ is nonzero) — (A2) rejects it. -/
theorem doubledRival_not_normalized :
    ¬ NormalizedAtFullAntipodality doubledRival := by
  unfold NormalizedAtFullAntipodality doubledRival
  intro h
  push_cast at h
  have hk := kappaLeading_pos
  nlinarith [h, hk]

/-- TOOTH 2b: the doubled rival is DETECTED at the banked census mean —
    `(6/5)·κ ≠ (3/5)·κ`. A different normalization PROVABLY yields a different
    obstruction: the normalization axiom has observable consequences. -/
theorem doubledRival_detected :
    doubledRival censusMeanObj ≠ obstructionFromCensus := by
  unfold doubledRival obstructionFromCensus
  rw [censusMeanObj_eq]
  rw [abs_of_neg (by norm_num : (-(3/5) : ℚ) < 0)]
  intro h
  push_cast at h
  have hk := kappaLeading_pos
  nlinarith [h, hk]

/-! ## (5) THE CAPSTONE WELD -/

/-- ★★★ OBSTRUCTION RESPONSE CHARACTERIZED — the capstone. Over the explicit
    class {additive, normalized at full antipodality}:
    (i)   every response takes the banked census mean to the banked obstruction
          (`response_characterized`), and
    (ii)  what it inserts IS what the banked endpoint inserts ONCE:
          `F0 + Resp censusMeanObj = recomposedEndpointDressed` — the banked
          `obstruction_inserted_once` (AlphaLandingFinal), welded BY NAME;
    (iii) the insertion is a strictly positive deficit removed once, from a
          strictly negative census mean (the banked signs, re-exported);
    (iv)  the class is uniquely realized (`response_unique` — cited above), and
    (v)   the additivity axiom is the banked screening precedent:
          `bandScreen_census_additive` — census content enters banked screening
          ADDITIVELY with unit weight, re-proved here by the banked name.
    The response law `|censusMean| · κ` of `AlphaLandingFinal` is thereby DERIVED
    over the class, not selected: additivity + one normalization force it. -/
theorem obstruction_response_characterized :
    (∀ Resp : ℚ → Cut, IsAdditive Resp → NormalizedAtFullAntipodality Resp →
        Resp censusMeanObj = obstructionFromCensus
        ∧ F0 + Resp censusMeanObj = D7DepthTwoComposed.recomposedEndpointDressed
        ∧ 0 < Resp censusMeanObj)
    ∧ censusMeanObj < 0
    ∧ (∀ a b r : Cut, bandScreen (a + b) r = bandScreen a r + bandScreen b r) := by
  refine ⟨?_, ?_, ?_⟩
  · intro Resp hadd hnorm
    have hchar := response_characterized Resp hadd hnorm
    refine ⟨hchar, ?_, ?_⟩
    · rw [hchar]
      exact obstruction_inserted_once.1
    · rw [hchar]
      exact obstruction_inserted_once.2.1
  · exact obstruction_inserted_once.2.2
  · exact Phys.Algebra.ThresholdClosureSeamLaw.bandScreen_census_additive

end

end Phys.Algebra.ObstructionResponseCharacterized
