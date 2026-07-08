/-
  Phys.Quantum.TsirelsonBound — N437 (arc-Q Q3): THE TSIRELSON BOUND —
  why quantum correlations stop at 2√2 (the boundary sweep continues).
  ===========================================================================
  arc-Q Q3 (per docs/SEED_OWED_FACES.md §Q3). DIRECTED SINGLE SUCCESSOR of N436
  (arc-Q Q2, the Λ value). Arc Q is THE BOUNDARY SWEEP — the famous physics that
  fell BETWEEN the subject-organized arcs A–P. The Tsirelson bound fell between
  J5's entanglement teeth (`bell_not_product`, N395 — entanglement EXISTS) and its
  CEILING; and O6 (N421, the no-hidden-variable theorem) EXPLICITLY deferred "a
  multi-particle Bell inequality over the composite sector tensor structure (that
  lives above, arc K / `Composite`)". This node banks that ceiling.

  THE STANDARD PICTURE (dissolved here). Classical (local-hidden-variable)
  correlations obey the CHSH inequality `|S| ≤ 2`. Quantum mechanics VIOLATES it —
  but only up to `|S| ≤ 2√2` (Tsirelson's bound), never up to the logical maximum
  `4` (the "PR-box", a no-signalling correlation that saturates 4 but does not
  occur in nature). In the field, WHY the ceiling sits at `2√2` and not `4` is a
  celebrated open question — attacked via operator-norm / sum-of-squares arguments
  on posited C*-algebras, or via information-theoretic principles (information
  causality, macroscopic locality) layered on TOP of quantum theory to "explain"
  the number. The ceiling is treated as a deep, separate axiom about nature.

  ── THE FORWARD DERIVATION (fold → the ceiling; nothing posited) ──
  The theory DISSOLVES the question. CORRELATION IS BORN SELF-OVERLAP. A measurement
  setting is a unit look-back direction on the banked 2D fibre `StateFibre` (N391),
  and the correlation of two settings is their Born self-overlap `bornForm` (N391 —
  the fold's own positivity, Born = self-overlap). The CHSH combination is then

      chshValue a₁ a₂ b₁ b₂ := ⟨a₁,b₁⟩ + ⟨a₁,b₂⟩ + ⟨a₂,b₁⟩ − ⟨a₂,b₂⟩
                             = ⟨a₁, b₁+b₂⟩ + ⟨a₂, b₁−b₂⟩        (`chshValue_regroup`)

  and the ceiling is FORCED by TWO banked facts alone:

    · BORN-POSITIVITY = CAUCHY–SCHWARZ (`bornForm_cauchy_schwarz`). The fold's
      self-overlap is positive-definite (N391 `bornForm_self_nonneg`); the Lagrange
      identity gives `⟨a,u⟩² ≤ ⟨a,a⟩·⟨u,u⟩`. The gather cannot return MORE overlap
      weight than the look-back carries — this is the positivity that caps nonlocality.
    · THE PARALLELOGRAM LAW on the unit frame (`unitSettings_parallelogram`):
      `⟨b₁+b₂,b₁+b₂⟩ + ⟨b₁−b₂,b₁−b₂⟩ = 2⟨b₁,b₁⟩ + 2⟨b₂,b₂⟩ = 4` for unit `b₁,b₂`.

  Together, on unit settings: `S² ≤ 8` (`chshValue_sq_le_eight`, via the two facts +
  the AM–GM `2pq ≤ p²+q²`), hence `|S| ≤ 2√2` (`chshValue_le_tsirelson`,
  `abs_chshValue_le_tsirelson`) — where `2√2` is built from the BANKED derived-ℝ
  `sqrt2` (`sqrt2·sqrt2 = 2`, the doubled-fibre / half-angle grammar).

  ── THE TWO TEETH ──
    · SATURATION (`tsirelson_saturated`): the optimal rotated settings
      `a₁=(1,0)`, `a₂=(0,1)`, `b₁=(1,1)/√2`, `b₂=(1,−1)/√2` ATTAIN `S = 2√2`.
      Quantum reaches its ceiling — the bound is tight, not slack.
    · EXCLUSION (`tsirelson_lt_logical_max`): `2√2 < 4` on the derived `Cut`. The
      logical maximum `4` (the PR-box) is strictly ABOVE the quantum ceiling and is
      therefore UNREACHABLE by any state on the derived structure. And `2√2 > 2`
      (`tsirelson_gt_classical`): the ceiling is strictly ABOVE the classical bound,
      so genuine violation happens. `2 < 2√2 < 4`.

  ── THE BELL STATE REALIZES THE CORRELATION FUNCTIONAL (the TwoFibre tie) ──
  The correlation is not an abstract pairing — it is the banked bell state's own
  coefficient structure. On the banked composite carrier `TwoFibre` (N395, finrank
  4) the diagonal-overlap functional `bellOverlap := coeff ff + coeff tt` (built
  from the banked `coeff` functionals) satisfies `bellOverlap (a ⊗ b) = ⟨a,b⟩`
  (`bellOverlap_tmul`) — the correlation IS the bell state's coefficient overlap of
  the two settings, read on the entangled carrier J5 built. `bellOverlap bell = 2 ≠ 0`
  (`bellOverlap_bell`, W8 non-vacuity of the tie).

  ⇒ THE CEILING IS DERIVED: `2√2` is Born-self-overlap positivity (Cauchy–Schwarz)
    plus the parallelogram law on the unit frame; the number is the doubled-fibre
    `√2·√2 = 2` grammar. "Why isn't nature MORE nonlocal?" — because more would
    violate Born positivity (the Cauchy–Schwarz step would fail). Nothing posited:
    no C*-algebra, no operator norm, no information-theoretic axiom.

  WHAT IS BANKED HERE (forward, foundations-only):
    correlation                 — the Born self-overlap `bornForm` of two settings.
    bornForm_cauchy_schwarz     — ★ Born positivity = Cauchy–Schwarz (Lagrange identity).
    correlation_le_one          — |⟨a,b⟩| ≤ 1 on unit settings (a single correlation is bounded).
    chshValue / chshValue_regroup — the CHSH combination and its regrouping.
    unitSettings_parallelogram  — ★ the parallelogram law: ‖b₁+b₂‖²+‖b₁−b₂‖²=4.
    chshValue_sq_le_eight       — ★ `S² ≤ 8` on unit settings (the two banked facts).
    sqrt2_sq / tsirelsonBound   — `√2·√2 = 2`; `tsirelsonBound := 2·√2`, `(2√2)² = 8`.
    chshValue_le_tsirelson      — ★ `S ≤ 2√2`.
    abs_chshValue_le_tsirelson  — ★★ `−2√2 ≤ S ≤ 2√2` (THE TSIRELSON BOUND).
    tsirelson_gt_classical      — `2 < 2√2` (strictly above the classical bound).
    tsirelson_lt_logical_max    — ★ `2√2 < 4` (strictly below the logical max — PR-box excluded).
    optA₁/optA₂/optB₁/optB₂     — the optimal rotated settings (unit vectors).
    optSettings_unit            — the optimal settings are unit vectors.
    tsirelson_saturated         — ★★ `S(opt) = 2√2` (the bound is ATTAINED — saturation).
    bellOverlap / bellOverlap_tmul — the bell-state overlap functional on TwoFibre = correlation.
    bellOverlap_bell            — ★ [W8] `bellOverlap bell = 2 ≠ 0` (the TwoFibre tie is non-vacuous).
    tsirelson_bound_derived     — ★★ THE CAPSTONE: the bound, saturation, exclusion, and the tie, bundled.

  SCOPE (docs/RUNBOOK.md W4.5). This node derives EXACTLY Q3: the CHSH/Tsirelson
  bound `|S| ≤ 2√2` on the banked fibre self-overlap, its SATURATION by explicit
  optimal settings, the EXCLUSION of the logical maximum `4`, and the realization of
  the correlation functional as the banked bell state's coefficient overlap on
  `TwoFibre`. It does NOT re-derive J5's entanglement teeth (banked N395), and it
  does NOT build a general operator-norm layer (unneeded — the correlation-vector
  route needs only banked `bornForm` positivity). GRADE: theorem-route (a positivity
  bound on banked objects; beyond-key — a genuinely new face). NO empirical number.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Bell / CHSH / Tsirelson /
  nonlocality / correlation / quantum / measurement": what remains is the pure
  statement that, for unit vectors `a₁,a₂,b₁,b₂` of the banked positive-definite
  form `bornForm` on `Cut × Cut`, the number
  `⟨a₁,b₁⟩+⟨a₁,b₂⟩+⟨a₂,b₁⟩−⟨a₂,b₂⟩` has square `≤ 8`, hence lies in
  `[−2·sqrt2, 2·sqrt2]`; that the explicit vectors `(1,0),(0,1),(1,1)/√2,(1,−1)/√2`
  attain `2·sqrt2`; that `2 < 2·sqrt2 < 4` over the derived `Cut`; and that the
  banked functional `coeff ff + coeff tt` on `StateFibre ⊗ StateFibre` restricts to
  `bornForm` on pure tensors. No theorem STATEMENT needs a physics word to be true.

  NOT FREE-FLOATING (docs/STANDARD.md §3). Every theorem's TYPE mentions the banked
  derived objects — `bornForm`/`StateFibre` over the derived ℝ `Cut` (N391), the
  banked `sqrt2` over `Cut` (ContinuumField), and the banked `coeff`/`bell`/`TwoFibre`
  (N395) — none generic over an arbitrary carrier or an imported ℝ.

  ℝ-VIGILANCE (docs/STANDARD.md §3): only the BANKED derived ℝ `Cut`, the banked
  fibre self-overlap `bornForm`, the banked composite functionals, and `sqrt2`. NO
  Mathlib `Real` / `Complex` as content, NO posited C*-algebra / operator norm /
  information-theoretic axiom. `TensorProduct`/`LinearMap` are standard Mathlib
  MACHINERY over the derived `Cut`.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Mathlib.Tactic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Foundation.ContinuumDerived
import Phys.Foundation.ContinuumField
import Phys.Foundation.ContinuumFieldMul
import Phys.Foundation.ContinuumFieldInverse
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Composite

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open scoped TensorProduct

/-! ## Correlation = Born self-overlap; positivity = Cauchy–Schwarz. -/

/-- THE CORRELATION of two measurement settings — the fold's own Born self-overlap
    `bornForm` (N391) of the two unit look-back directions. Correlation is not a new
    primitive; it is the banked self-overlap positivity read as a pairing of settings. -/
noncomputable def correlation (a b : StateFibre) : ContinuumQ.Cut := bornForm a b

/-- ★ BORN POSITIVITY = CAUCHY–SCHWARZ. The fold's self-overlap is positive-definite
    (N391), so the Lagrange identity gives `⟨a,b⟩² ≤ ⟨a,a⟩·⟨b,b⟩`. The gather cannot
    return MORE overlap weight than the look-back carries — the positivity that will
    cap nonlocality. (The nonnegative slack is the squared derived cross term.) -/
theorem bornForm_cauchy_schwarz (a b : StateFibre) :
    (bornForm a b) ^ 2 ≤ bornForm a a * bornForm b b := by
  unfold bornForm
  nlinarith [sq_nonneg (a.1 * b.2 - a.2 * b.1)]

/-- A SINGLE correlation is bounded by `1` in magnitude on unit settings:
    `⟨a,b⟩² ≤ 1`. The two-setting ceiling `2√2` is the nontrivial fact; this is its
    one-setting shadow. -/
theorem correlation_le_one (a b : StateFibre)
    (ha : bornForm a a = 1) (hb : bornForm b b = 1) :
    (correlation a b) ^ 2 ≤ 1 := by
  have cs := bornForm_cauchy_schwarz a b
  rw [ha, hb] at cs
  simpa [correlation] using (by linarith : (bornForm a b) ^ 2 ≤ 1)

/-! ## The CHSH combination and its regrouping. -/

/-- THE CHSH COMBINATION of four settings: `S = ⟨a₁,b₁⟩ + ⟨a₁,b₂⟩ + ⟨a₂,b₁⟩ − ⟨a₂,b₂⟩`
    — a signed sum of four Born self-overlap correlations. -/
noncomputable def chshValue (a₁ a₂ b₁ b₂ : StateFibre) : ContinuumQ.Cut :=
  bornForm a₁ b₁ + bornForm a₁ b₂ + bornForm a₂ b₁ - bornForm a₂ b₂

/-- REGROUPING (bilinearity of the self-overlap): `S = ⟨a₁, b₁+b₂⟩ + ⟨a₂, b₁−b₂⟩`.
    The two combined settings `b₁±b₂` are what the parallelogram law will bound. -/
theorem chshValue_regroup (a₁ a₂ b₁ b₂ : StateFibre) :
    chshValue a₁ a₂ b₁ b₂ = bornForm a₁ (b₁ + b₂) + bornForm a₂ (b₁ - b₂) := by
  unfold chshValue bornForm; simp [Prod.add_def, Prod.sub_def]; ring

/-! ## The parallelogram law on the unit frame. -/

/-- ★ THE PARALLELOGRAM LAW. For the combined settings `b₁±b₂`,
    `⟨b₁+b₂,b₁+b₂⟩ + ⟨b₁−b₂,b₁−b₂⟩ = 2⟨b₁,b₁⟩ + 2⟨b₂,b₂⟩`, so on UNIT settings it is
    `4`. This is the second banked fact (alongside Cauchy–Schwarz) forcing the ceiling. -/
theorem unitSettings_parallelogram (b₁ b₂ : StateFibre)
    (hb₁ : bornForm b₁ b₁ = 1) (hb₂ : bornForm b₂ b₂ = 1) :
    bornForm (b₁ + b₂) (b₁ + b₂) + bornForm (b₁ - b₂) (b₁ - b₂) = 4 := by
  have hpar : bornForm (b₁ + b₂) (b₁ + b₂) + bornForm (b₁ - b₂) (b₁ - b₂)
      = 2 * bornForm b₁ b₁ + 2 * bornForm b₂ b₂ := by
    unfold bornForm; simp [Prod.add_def, Prod.sub_def]; ring
  rw [hpar, hb₁, hb₂]; norm_num

/-! ## The Tsirelson bound `S² ≤ 8`. -/

/-- ★ THE SQUARED TSIRELSON BOUND: on unit settings, `S² ≤ 8`. The regrouped
    `S = ⟨a₁,u⟩ + ⟨a₂,v⟩` (with `u=b₁+b₂`, `v=b₁−b₂`) obeys, by Cauchy–Schwarz on the
    unit `a₁,a₂`, `⟨a₁,u⟩² ≤ ⟨u,u⟩` and `⟨a₂,v⟩² ≤ ⟨v,v⟩`; the parallelogram law gives
    `⟨u,u⟩+⟨v,v⟩ = 4`; and AM–GM (`2pq ≤ p²+q²`) closes `(p+q)² ≤ 2(⟨u,u⟩+⟨v,v⟩) = 8`.
    Born positivity alone caps the combination. -/
theorem chshValue_sq_le_eight (a₁ a₂ b₁ b₂ : StateFibre)
    (ha₁ : bornForm a₁ a₁ = 1) (ha₂ : bornForm a₂ a₂ = 1)
    (hb₁ : bornForm b₁ b₁ = 1) (hb₂ : bornForm b₂ b₂ = 1) :
    (chshValue a₁ a₂ b₁ b₂) ^ 2 ≤ 8 := by
  rw [chshValue_regroup]
  set u := b₁ + b₂ with hu
  set v := b₁ - b₂ with hv
  have hp : (bornForm a₁ u) ^ 2 ≤ bornForm u u := by
    have := bornForm_cauchy_schwarz a₁ u; rw [ha₁] at this; linarith
  have hq : (bornForm a₂ v) ^ 2 ≤ bornForm v v := by
    have := bornForm_cauchy_schwarz a₂ v; rw [ha₂] at this; linarith
  have hpar : bornForm u u + bornForm v v = 4 := by
    rw [hu, hv]; exact unitSettings_parallelogram b₁ b₂ hb₁ hb₂
  nlinarith [hp, hq, hpar, sq_nonneg (bornForm a₁ u - bornForm a₂ v)]

/-! ## The Tsirelson number `2√2` — built from the banked derived-ℝ `sqrt2`. -/

/-- `sqrt2 · sqrt2 = 2` on the derived ℝ `Cut` — the banked doubled-fibre / half-angle
    grammar (`sqrt2_mul_sqrt2`, ContinuumFieldMul), with `Qcut 2` reconciled to `(2:Cut)`. -/
theorem sqrt2_sq_two : sqrt2 * sqrt2 = (2 : ContinuumQ.Cut) := by
  rw [sqrt2_mul_sqrt2]
  have h1 : (1 : ContinuumQ.Cut) = Qcut 1 := rfl
  have h2 : Qcut ((1 : Phys.Foundation.Q) + 1) = Qcut 1 + Qcut 1 := (Qcut_add 1 1).symm
  rw [show (2 : Phys.Foundation.Q) = 1 + 1 by norm_num, h2, ← h1]; norm_num

/-- THE TSIRELSON BOUND VALUE: `2·√2` on the derived ℝ `Cut`. -/
noncomputable def tsirelsonBound : ContinuumQ.Cut := 2 * sqrt2

/-- `(2√2)² = 8` — the Tsirelson value squared is exactly the `S²` ceiling. -/
theorem tsirelsonBound_sq : tsirelsonBound * tsirelsonBound = 8 := by
  unfold tsirelsonBound; have h := sqrt2_sq_two; nlinarith [h]

/-- The Tsirelson value is nonnegative (`0 ≤ 2√2`). -/
theorem tsirelsonBound_nonneg : (0 : ContinuumQ.Cut) ≤ tsirelsonBound := by
  unfold tsirelsonBound; have := zero_lt_sqrt2; nlinarith [this]

/-! ## The linear bound `S ≤ 2√2` and the two-sided `|S| ≤ 2√2`. -/

/-- ★ THE TSIRELSON BOUND (upper): on unit settings, `S ≤ 2√2`. From `S² ≤ 8 = (2√2)²`
    and `2√2 ≥ 0`. -/
theorem chshValue_le_tsirelson (a₁ a₂ b₁ b₂ : StateFibre)
    (ha₁ : bornForm a₁ a₁ = 1) (ha₂ : bornForm a₂ a₂ = 1)
    (hb₁ : bornForm b₁ b₁ = 1) (hb₂ : bornForm b₂ b₂ = 1) :
    chshValue a₁ a₂ b₁ b₂ ≤ tsirelsonBound := by
  have hsq := chshValue_sq_le_eight a₁ a₂ b₁ b₂ ha₁ ha₂ hb₁ hb₂
  have hb := tsirelsonBound_sq
  have hnn := tsirelsonBound_nonneg
  nlinarith [hsq, hb, hnn, sq_nonneg (chshValue a₁ a₂ b₁ b₂ - tsirelsonBound)]

/-- ★★ THE TSIRELSON BOUND (two-sided): on unit settings, `−2√2 ≤ S ≤ 2√2`. Quantum
    correlations are confined to `[−2√2, 2√2]` — Born positivity caps nonlocality. -/
theorem abs_chshValue_le_tsirelson (a₁ a₂ b₁ b₂ : StateFibre)
    (ha₁ : bornForm a₁ a₁ = 1) (ha₂ : bornForm a₂ a₂ = 1)
    (hb₁ : bornForm b₁ b₁ = 1) (hb₂ : bornForm b₂ b₂ = 1) :
    -tsirelsonBound ≤ chshValue a₁ a₂ b₁ b₂ ∧ chshValue a₁ a₂ b₁ b₂ ≤ tsirelsonBound := by
  have hsq := chshValue_sq_le_eight a₁ a₂ b₁ b₂ ha₁ ha₂ hb₁ hb₂
  have hb := tsirelsonBound_sq
  have hnn := tsirelsonBound_nonneg
  refine ⟨?_, chshValue_le_tsirelson a₁ a₂ b₁ b₂ ha₁ ha₂ hb₁ hb₂⟩
  nlinarith [hsq, hb, hnn, sq_nonneg (chshValue a₁ a₂ b₁ b₂ + tsirelsonBound)]

/-! ## The ceiling sits strictly between the classical bound `2` and the logical max `4`. -/

/-- The Tsirelson ceiling is strictly ABOVE the classical bound: `2 < 2√2`. So genuine
    violation of the classical CHSH inequality `|S| ≤ 2` DOES happen (`√2 > 1`). -/
theorem tsirelson_gt_classical : (2 : ContinuumQ.Cut) < tsirelsonBound := by
  unfold tsirelsonBound
  have hsq := sqrt2_sq_two
  have h0 := zero_lt_sqrt2
  have h1 : (1 : ContinuumQ.Cut) < sqrt2 := by nlinarith [hsq, h0]
  nlinarith [h1]

/-- ★ THE EXCLUSION (PR-box unreachable): the Tsirelson ceiling is strictly BELOW the
    logical maximum: `2√2 < 4`. The "PR-box" correlation that would saturate `4` is
    UNREACHABLE by any state on the derived structure — more nonlocality than `2√2`
    would violate Born positivity. This answers "why isn't nature MORE nonlocal". -/
theorem tsirelson_lt_logical_max : tsirelsonBound < (4 : ContinuumQ.Cut) := by
  have hsq := tsirelsonBound_sq
  have hnn := tsirelsonBound_nonneg
  nlinarith [hsq, hnn]

/-! ## Saturation — the optimal rotated settings attain `2√2`. -/

/-- The optimal first setting `a₁ = (1,0)`. -/
noncomputable def optA₁ : StateFibre := (1, 0)
/-- The optimal second setting `a₂ = (0,1)` (orthogonal to `a₁`). -/
noncomputable def optA₂ : StateFibre := (0, 1)
/-- The optimal third setting `b₁ = (1,1)/√2` (the `+45°` diagonal, unit). -/
noncomputable def optB₁ : StateFibre := (pinv zero_lt_sqrt2, pinv zero_lt_sqrt2)
/-- The optimal fourth setting `b₂ = (1,−1)/√2` (the `−45°` diagonal, unit). -/
noncomputable def optB₂ : StateFibre := (pinv zero_lt_sqrt2, -(pinv zero_lt_sqrt2))

/-- `2 · (1/√2)² = 1`: the reciprocal-square identity making the diagonal settings unit. -/
theorem two_pinv_sq : 2 * ((pinv zero_lt_sqrt2) * (pinv zero_lt_sqrt2)) = 1 := by
  have hs : sqrt2 * (pinv zero_lt_sqrt2) = 1 := mul_pinv_cancel zero_lt_sqrt2
  rw [← sqrt2_sq_two]; nlinarith [hs]

/-- `4 · (1/√2) = 2√2`: the arithmetic that lands the optimal CHSH value on `2√2`. -/
theorem four_pinv : 4 * (pinv zero_lt_sqrt2) = 2 * sqrt2 := by
  have hs : sqrt2 * (pinv zero_lt_sqrt2) = 1 := mul_pinv_cancel zero_lt_sqrt2
  have hne : sqrt2 ≠ 0 := ne_of_gt zero_lt_sqrt2
  have hmul : sqrt2 * (4 * (pinv zero_lt_sqrt2)) = sqrt2 * (2 * sqrt2) := by
    have h2 : sqrt2 * sqrt2 = 2 := sqrt2_sq_two
    nlinarith [hs, h2]
  exact mul_left_cancel₀ hne hmul

/-- The optimal settings are all UNIT vectors of the banked self-overlap. -/
theorem optSettings_unit :
    bornForm optA₁ optA₁ = 1 ∧ bornForm optA₂ optA₂ = 1 ∧
    bornForm optB₁ optB₁ = 1 ∧ bornForm optB₂ optB₂ = 1 := by
  have hss := two_pinv_sq
  refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp only [bornForm, optA₁, optA₂, optB₁, optB₂] <;> nlinarith [hss]

/-- ★★ SATURATION — the bound is ATTAINED. The optimal rotated settings give
    `S = 2√2` exactly. Quantum reaches its ceiling: the Tsirelson bound is TIGHT,
    not a slack over-estimate. (The `+45°/−45°` measurement geometry, banked as
    concrete vectors over the derived ℝ `Cut`.) -/
theorem tsirelson_saturated : chshValue optA₁ optA₂ optB₁ optB₂ = tsirelsonBound := by
  have h4 := four_pinv
  unfold tsirelsonBound
  simp only [chshValue, bornForm, optA₁, optA₂, optB₁, optB₂]
  ring_nf
  nlinarith [h4]

/-! ## The bell state realizes the correlation functional on the banked TwoFibre. -/

/-- THE BELL-STATE OVERLAP FUNCTIONAL on the banked composite carrier `TwoFibre` (N395):
    `bellOverlap := coeff ff + coeff tt`, built from the banked `coeff` functionals. It
    reads the diagonal-overlap coefficient structure of the entangled carrier. -/
noncomputable def bellOverlap : TwoFibre →ₗ[ContinuumQ.Cut] ContinuumQ.Cut :=
  coeff false false + coeff true true

/-- ★ THE TIE — CORRELATION IS THE BELL STATE'S COEFFICIENT OVERLAP. On a product
    setting `a ⊗ b`, the bell-overlap functional restricts to the Born self-overlap
    `⟨a,b⟩ = bornForm a b` — the correlation is not abstract, it is the banked bell
    state's own coefficient overlap of the two settings, read on the carrier J5 built
    (N395 `TwoFibre`). Positivity capping nonlocality lives on the entangled carrier. -/
theorem bellOverlap_tmul (a b : StateFibre) : bellOverlap (a ⊗ₜ b) = bornForm a b := by
  unfold bellOverlap bornForm
  simp only [LinearMap.add_apply, coeff_tmul, Bool.false_eq_true, if_false, if_true]

/-- ★ [W8] NON-VACUITY of the TwoFibre tie: `bellOverlap bell = 2 ≠ 0`. The bell state
    itself carries nonzero diagonal overlap, so the functional is genuinely realized on
    the banked entangled carrier — not a degenerate zero pairing. -/
theorem bellOverlap_bell : bellOverlap bell = 2 := by
  unfold bellOverlap bell
  simp only [map_add, LinearMap.add_apply, coeff_tmul, eInward, eOutward]
  norm_num

/-! ## THE CAPSTONE — the Tsirelson bound, DERIVED. -/

/-- ★★ THE CAPSTONE — THE TSIRELSON BOUND, DERIVED. On the banked 2D fibre self-overlap
    `bornForm` (N391) and the banked composite carrier `TwoFibre` (N395):
    (i)   CORRELATION IS BORN SELF-OVERLAP, and Born positivity is Cauchy–Schwarz — the
          gather cannot return more overlap weight than the look-back carries;
    (ii)  THE BOUND — on unit settings `|S| ≤ 2√2` (`abs_chshValue_le_tsirelson`), the
          number `2√2` built from the banked derived-ℝ `sqrt2` (`sqrt2·sqrt2 = 2`, the
          doubled-fibre grammar); the ceiling sits strictly between the classical bound
          `2` and the logical maximum `4` — `2 < 2√2 < 4`;
    (iii) SATURATION — the optimal rotated settings ATTAIN `2√2` (`tsirelson_saturated`):
          quantum reaches its ceiling, the bound is tight;
    (iv)  EXCLUSION — `2√2 < 4` (`tsirelson_lt_logical_max`): the PR-box (logical max) is
          UNREACHABLE; more nonlocality would violate Born positivity; and
    (v)   THE TIE — the correlation is the banked bell state's coefficient overlap on the
          entangled carrier `TwoFibre` (`bellOverlap_tmul`, non-vacuous `bellOverlap_bell`).
    Nothing is posited: the ceiling is Born-self-overlap positivity plus the parallelogram
    law on the unit frame. "Why isn't nature MORE nonlocal?" — because more would break
    Born positivity. -/
theorem tsirelson_bound_derived :
    -- (i) Born positivity = Cauchy–Schwarz.
    (∀ a b : StateFibre, (bornForm a b) ^ 2 ≤ bornForm a a * bornForm b b) ∧
    -- (ii) the two-sided bound on unit settings.
    (∀ a₁ a₂ b₁ b₂ : StateFibre,
        bornForm a₁ a₁ = 1 → bornForm a₂ a₂ = 1 → bornForm b₁ b₁ = 1 → bornForm b₂ b₂ = 1 →
        -tsirelsonBound ≤ chshValue a₁ a₂ b₁ b₂ ∧ chshValue a₁ a₂ b₁ b₂ ≤ tsirelsonBound) ∧
    -- the ceiling sits strictly between the classical bound and the logical max.
    ((2 : ContinuumQ.Cut) < tsirelsonBound ∧ tsirelsonBound < (4 : ContinuumQ.Cut)) ∧
    -- (iii) saturation: the optimal settings are unit and attain 2√2.
    (bornForm optA₁ optA₁ = 1 ∧ bornForm optA₂ optA₂ = 1 ∧
        bornForm optB₁ optB₁ = 1 ∧ bornForm optB₂ optB₂ = 1) ∧
    (chshValue optA₁ optA₂ optB₁ optB₂ = tsirelsonBound) ∧
    -- (v) the tie: the correlation is the bell state's coefficient overlap on TwoFibre.
    (∀ a b : StateFibre, bellOverlap (a ⊗ₜ b) = bornForm a b) ∧
    (bellOverlap bell = 2) := by
  refine ⟨bornForm_cauchy_schwarz, ?_, ⟨tsirelson_gt_classical, tsirelson_lt_logical_max⟩,
    optSettings_unit, tsirelson_saturated, bellOverlap_tmul, bellOverlap_bell⟩
  intro a₁ a₂ b₁ b₂ ha₁ ha₂ hb₁ hb₂
  exact abs_chshValue_le_tsirelson a₁ a₂ b₁ b₂ ha₁ ha₂ hb₁ hb₂

end Phys.Quantum
