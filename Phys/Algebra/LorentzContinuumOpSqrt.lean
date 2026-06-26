/-
  Phys.Algebra.LorentzContinuumOpSqrt — N60: THE OPERATOR SQUARE ROOT (the structured/scalar
  case) over the DERIVED ℝ `Cut` — lifting the scalar positive-definite square root `cutSqrt`
  (N57) to the OPERATOR level and CONSUMING the N59 operator form-adjoint positivity
  (`IsEvCAdjoint.comp_nonneg`/`comp_isEvCSymm`). The operator-level existence of the polar/KAK
  boost part `exp(p) = √(g*g)` in the structured case where `g*g` acts as a scalar.
  ===========================================================================
  THE NEXT FORCED NODE after the operator-form-adjoint node (N59). N49–N59 banked, over the
  derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`:
    • the continuum Born form `QvC = t² − x² − gFormC v v`, the isometry monoid `qvIsomMonoidC`
      (N49), the Born composition law `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + the polarized Minkowski form `BvC` + the
      infinitesimal boost `boostGenC` and rotation `rotGenC a` generators + `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` (N52–N55), with the TWO-SIDED
      Moufang/`Spin(9)` generator `biMulFun u u'` (N55);
    • the BORN POSITIVITY foundation `gFormC_nonneg`/`gFormC_eq_zero_iff` + the (1,9) signature
      split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` over `Cut` with `cutSqrt_sq`/
      `cutSqrt_nonneg`/`cutSqrt_unique`/`cutSqrt_pos` (N57);
    • the INFINITESIMAL CARTAN DECOMPOSITION — the positive-definite Euclidean reference form
      `EvC`, `EvC_nonneg`/`EvC_eq_zero_iff`, the compact/noncompact split (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint g h := ∀ p q, EvC (g p) q = EvC p (h q)`, with the
      form-adjoint composite `h∘g` (= `g*g`) proved EvC-SELF-ADJOINT (`comp_isEvCSymm`) and
      EvC-POSITIVE-SEMIDEFINITE (`comp_nonneg`) — the existence-of-the-positive-root hypothesis
      the polar boost part consumes (N59).

  ── THE TARGET (N60) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the GLOBAL reverse KAK surjectivity at the operator level — that EVERY
  orientation/time-preserving continuum isometry IS a finite product of the banked generators
  (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`), via the polar/KAK
  `g = k·exp(p)`. The ROADMAP §N60 names the OPERATOR SQUARE ROOT as the immediate next
  prerequisite (MEASURE-FIRST priority (i)), with the explicit CAUTION that the FULL spectral
  square root of a general 10-dim EvC-self-adjoint EvC-positive-semidefinite operator is itself a
  sub-node (it needs diagonalization — no Mathlib spectral theory over `Cut`) and that the
  STRUCTURED/DIAGONAL case (where `g*g` acts as a scalar on a 1-dim/isotropic eigenspace) is
  bankable first. So — the W3 pattern — THIS node banks the immediately-available, theory-native
  STRUCTURAL piece: the operator square root of a SCALAR (homothety) operator `c·id`, the
  operator-level lift of `cutSqrt`, together with the abstract positive operator-square-root
  predicate and the N59 connection (`g*g` scalar ⟹ its positive root exists, consuming
  `comp_nonneg`); the FULL spectral square root is childed (N61).

  ── THE TRUNK REFRAME (THE ONE LAW): the operator root IS `cutSqrt` read at the operator level ──
  The polar/KAK `g = k·exp(p)` extracts the positive part `exp(p) = √(g*g)`. Where `g*g` acts as
  a scalar `c·id` (the structured/diagonal case — `c` is the squared boost rapidity on the
  isotropic line), its positive operator root is simply `(cutSqrt c)·id`: a homothety by the
  scalar root. Three trunk facts make it the genuine positive square root with NO spectral
  theory: (1) a scalar operator is EvC-symmetric (`cutSmul_isEvCSymm`, by the bilinearity of the
  reference form `EvC` — the N58 positive-definite form); (2) it is EvC-positive-semidefinite
  because `EvC ((cutSqrt c·id) p) p = cutSqrt c · EvC p p ≥ 0`, the product of `cutSqrt_nonneg`
  (N57, the order-completeness of the continuum) and `EvC_nonneg` (N58, the Born self-overlap
  positivity, itself N56) — THE TRUNK POSITIVITY; (3) it squares back, `(cutSqrt c·id)² =
  (cutSqrt c · cutSqrt c)·id = c·id`, by `cutSqrt_sq` (N57). The existence of the polar positive
  part dissolves into the scalar `cutSqrt` applied to the eigenvalue — NO Mathlib spectral
  theorem, NO posited operator calculus, NO analysis beyond the order completeness already banked.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    EvC_smul_left / EvC_smul_right — the reference form scales out of a slot
                          (`EvC (c•p) q = c · EvC p q`), the bilinearity the scalar operator needs.
    cutSmul_id_apply    — the scalar operator acts as the homothety `(c·id) p = c•p`.
    cutSmul_isEvCSymm   — the scalar operator `c·id` is EvC-SELF-ADJOINT (it is its own adjoint).
    cutSmul_comp        — scalar operators compose by multiplying: `(a·id)∘(b·id) = (a·b)·id`.
    cutSmul_id_inj      — `a·id = b·id ⟹ a = b` (read at the time coordinate of `(1,0,0)`).
    IsEvCOpSqrt s g     — THE POSITIVE OPERATOR SQUARE-ROOT predicate: `s` is EvC-self-adjoint,
                          EvC-positive-semidefinite, and `s∘s = g`.
    scalar_op_sqrt      — ★★ THE HEART: for `c ≥ 0`, `(cutSqrt c)·id` is a positive operator
                          square root of `c·id` — the operator-level lift of the scalar `cutSqrt`,
                          self-adjoint + positive-semidefinite + squaring to `c·id`. NO spectral
                          theory.
    comp_scalar_pos     — ★ N59 CONSUMPTION: if the form-adjoint composite `h∘g` (= `g*g`) is the
                          scalar `c·id`, then `0 ≤ c`, via the N59 `IsEvCAdjoint.comp_nonneg`
                          evaluated at the unit time vector (where `EvC = 1`). The eigenvalue of
                          `g*g` is nonnegative — the trunk positivity at the operator level.
    comp_scalar_op_sqrt — ★★ N59 CONSUMPTION / THE PAYOFF: in the structured case `h∘g = c·id`,
                          the polar positive part `√(g*g) = (cutSqrt c)·id` EXISTS as a positive
                          operator square root of `g*g` — the operator analogue of N57 `cutSqrt`,
                          consuming exactly the N59 `comp_nonneg`. The existence-of-the-positive-
                          root hypothesis the polar/KAK boost part needs, DISCHARGED in the
                          structured case.
    scalar_op_sqrt_unique — structured uniqueness: a nonnegative scalar operator square root of
                          `c·id` is `(cutSqrt c)·id` (via `cutSqrt_unique`). (Full spectral
                          uniqueness over the 10-dim space is childed N61.)
    cutSqrt_sixteen_eq_four — base value (`cutSqrt 16 = 4`).
    scalar_op_sqrt_witness  — ★ NON-VACUITY (W8): a concrete positive operator square root,
                          `(4·id)` is the positive root of `(16·id)` — the structured operator
                          root is non-vacuous, a genuine homothety, not a vacuous existence.
    not_scalar_op_sqrt_5_7 — ★ NON-VACUITY (W8 teeth): `5·id` is NOT an operator square root of
                          `7·id` (it would force `25 = 7`) — the predicate has genuine content;
                          a wrong root fails.

  ── THE W1 HEAVY REMAINDER (childed N61, an honest dissolution ticket, NOT closed here) ──
  The FULL spectral square root — a general EvC-self-adjoint EvC-positive-semidefinite operator
  over the 10-dim form space written as `s∘s = g` with `s` positive (where `g` is NOT a scalar) —
  needs simultaneous diagonalization / a spectral decomposition that has no Mathlib analogue over
  `Cut`. With it: the polar/KAK assembly `g = k·exp(p)` extracting `exp(p) = √(g*g)` and the
  compact `k = g·exp(p)⁻¹`; the compact part `k` via CONNECTEDNESS of the isometry group over
  `Cut`; and the full `Spin(9)→SO(9)` exhaustion (every spacelike rotation a finite product of
  `biMulFun`). Those are the genuine HEAVY group-manifold core, childed onto the chain tail as an
  honest W1 dissolution ticket. THIS node banks the structured/scalar operator square root and the
  N59 connection — the operator-level lift of `cutSqrt` and the discharge, in the structured case,
  of the existence-of-the-positive-root hypothesis.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a positive-semidefinite self-adjoint
  operator has a unique positive square root (the operator analogue of `√`) is standard spectral
  theory (the continuous functional calculus, Reed–Simon, the polar decomposition literature).
  Here the structured/scalar root, its self-adjointness, its positive-semidefiniteness, and its
  squaring-back DESCEND from the banked scalar `cutSqrt` (N57, the order-completeness of the
  derived ℝ `Cut`) + the positive-definite reference form `EvC` (N58) + the operator form-adjoint
  positivity (N59) over the DERIVED ℝ `Cut` — NO posited operator calculus, NO Mathlib spectral
  theory, NO posited inner product, NO Mathlib ℝ/ℂ as content. The W1 reframe (the operator root
  in the structured case IS the scalar `cutSqrt` applied to the eigenvalue, the positivity IS the
  trunk's Born self-overlap read through the reference form) is exactly what re-grounds the
  operator core of the polar direction over the continuum without any spectral analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / polar /
  KAK / Cartan / square-root / positive-definite / self-adjoint / isometry / Spin / SO(9) /
  eigenvalue / homothety-as-physics": what remains is the theorem that, over the derived complete
  ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for the symmetric positive-definite
  bilinear form `EvC` and every `c ≥ 0`, the scalar self-map `cutSqrt c • id` satisfies
  `∀ p q, EvC ((cutSqrt c • id) p) q = EvC p ((cutSqrt c • id) q)`, `0 ≤ EvC ((cutSqrt c • id) p) p`,
  and `(cutSqrt c • id) ∘ (cutSqrt c • id) = c • id`; that it is the unique nonnegative scalar with
  that square; that for `Cut`-linear `g, h` with `∀ p q, EvC (g p) q = EvC p (h q)`, if
  `h∘g = c • id` then `0 ≤ c` and `cutSqrt c • id` squares to `h∘g`; that `4 • id` squares to
  `16 • id`; and that `5 • id` does NOT square to `7 • id`. No theorem STATEMENT needs a physics
  word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumAdjoint

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The reference form scales out of either slot. -/

/-- `EvC` scales out of the left slot: `EvC (c•p) q = c · EvC p q` — the bilinearity the scalar
    operator's symmetry and positivity need. -/
theorem EvC_smul_left (c : Cut) (p q : STVC) : EvC (c • p) q = c * EvC p q := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show (c • t) * t' + (c • x) * x' + gFormC (c • v) v' = c * (t * t' + x * x' + gFormC v v')
  rw [gFormC_smul_left]
  show c * t * t' + c * x * x' + c * gFormC v v' = c * (t * t' + x * x' + gFormC v v')
  ring

/-- `EvC` scales out of the right slot: `EvC p (c•q) = c · EvC p q` (by symmetry of `EvC`). -/
theorem EvC_smul_right (c : Cut) (p q : STVC) : EvC p (c • q) = c * EvC p q := by
  rw [EvC_symm p (c • q), EvC_smul_left, EvC_symm q p]

/-! ## The scalar (homothety) operator `c·id` — the structured operator. -/

/-- The scalar operator acts as the homothety: `(c·id) p = c•p`. -/
theorem cutSmul_id_apply (c : Cut) (p : STVC) :
    (c • (LinearMap.id : Module.End Cut STVC)) p = c • p := by
  rw [LinearMap.smul_apply, LinearMap.id_apply]

/-- The scalar operator `c·id` is EvC-SELF-ADJOINT (it is its own EvC-adjoint), by the
    bilinearity of the reference form: `EvC ((c·id) p) q = c · EvC p q = EvC p ((c·id) q)`. -/
theorem cutSmul_isEvCSymm (c : Cut) : IsEvCSymm (c • (LinearMap.id : Module.End Cut STVC)) := by
  intro p q
  rw [cutSmul_id_apply, cutSmul_id_apply, EvC_smul_left, EvC_smul_right]

/-- Scalar operators compose by multiplying their scalars: `(a·id)∘(b·id) = (a·b)·id`. -/
theorem cutSmul_comp (a b : Cut) :
    (a • (LinearMap.id : Module.End Cut STVC)).comp (b • (LinearMap.id : Module.End Cut STVC))
      = (a * b) • (LinearMap.id : Module.End Cut STVC) := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, LinearMap.smul_apply, LinearMap.smul_apply, LinearMap.id_apply,
    LinearMap.smul_apply, LinearMap.id_apply, smul_smul]

/-- Scalar operators are determined by their scalar: `a·id = b·id ⟹ a = b` (read at the time
    coordinate of the unit time vector `(1,0,0)`, where `a•(1,0,0) = (a,0,0)`). -/
theorem cutSmul_id_inj {a b : Cut}
    (h : (a • (LinearMap.id : Module.End Cut STVC)) = b • (LinearMap.id : Module.End Cut STVC)) :
    a = b := by
  have := congrArg (fun T => (T ((1:Cut),(0:Cut),(0:O Cut))).1) h
  simpa [cutSmul_id_apply] using this

/-! ## The positive operator square-root predicate and the structured/scalar root. -/

/-- THE POSITIVE OPERATOR SQUARE-ROOT predicate: `s` is a positive operator square root of `g`
    iff `s` is EvC-self-adjoint, EvC-positive-semidefinite, and `s∘s = g`. The operator analogue
    of the scalar `0 ≤ b ∧ b·b = a` from N57 `cutSqrt`. -/
def IsEvCOpSqrt (s g : Module.End Cut STVC) : Prop :=
  IsEvCSymm s ∧ (∀ p, 0 ≤ EvC (s p) p) ∧ s.comp s = g

/-- ★★ THE HEART — THE STRUCTURED/SCALAR OPERATOR SQUARE ROOT: for `c ≥ 0`, `(cutSqrt c)·id` is a
    positive operator square root of the scalar operator `c·id`. The operator-level LIFT of the
    scalar `cutSqrt` (N57): it is EvC-self-adjoint (`cutSmul_isEvCSymm`), EvC-positive-
    semidefinite (`EvC ((cutSqrt c·id) p) p = cutSqrt c · EvC p p ≥ 0`, the product of N57
    `cutSqrt_nonneg` and N58 `EvC_nonneg` — THE TRUNK POSITIVITY), and squares back to `c·id`
    (`cutSqrt_sq`). NO Mathlib spectral theory; the operator root in the structured case is the
    scalar `cutSqrt` applied to the eigenvalue. -/
theorem scalar_op_sqrt (c : Cut) (hc : 0 ≤ c) :
    IsEvCOpSqrt (cutSqrt c • (LinearMap.id : Module.End Cut STVC))
      (c • (LinearMap.id : Module.End Cut STVC)) := by
  refine ⟨cutSmul_isEvCSymm (cutSqrt c), ?_, ?_⟩
  · intro p
    rw [cutSmul_id_apply, EvC_smul_left]
    exact mul_nonneg (cutSqrt_nonneg c) (EvC_nonneg p)
  · rw [cutSmul_comp, cutSqrt_sq hc]

/-! ## Consuming N59: the form-adjoint composite `g*g`, when scalar, has a nonneg eigenvalue and
    a positive operator square root. -/

/-- ★ N59 CONSUMPTION: if the form-adjoint composite `h∘g` (= `g*g`) acts as the scalar `c·id`,
    then `0 ≤ c`. Via the N59 `IsEvCAdjoint.comp_nonneg` (`0 ≤ EvC ((h∘g) p) p`) evaluated at the
    unit time vector `(1,0,0)`, where `EvC = 1`, so `0 ≤ c · 1 = c`. The eigenvalue of `g*g` is
    nonnegative — the trunk's Born self-overlap positivity read through the reference form, at the
    operator level. -/
theorem comp_scalar_pos {g h : Module.End Cut STVC} (H : IsEvCAdjoint g h) {c : Cut}
    (hsc : h.comp g = c • (LinearMap.id : Module.End Cut STVC)) : 0 ≤ c := by
  have hp := H.comp_nonneg ((1:Cut),(0:Cut),(0:O Cut))
  rw [hsc, cutSmul_id_apply, EvC_smul_left] at hp
  have he : EvC ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut)) = 1 := by
    rw [EvC_self]; show (1:Cut)^2 + 0^2 + gFormC 0 0 = 1; rw [gFormC_zero_left]; ring
  rw [he, mul_one] at hp
  exact hp

/-- ★★ N59 CONSUMPTION / THE PAYOFF: in the structured case where the form-adjoint composite
    `h∘g` (= `g*g`) is the scalar `c·id`, the polar/KAK positive part `√(g*g) = (cutSqrt c)·id`
    EXISTS as a positive operator square root of `g*g`. The operator analogue of the scalar
    N57 `cutSqrt`, consuming exactly the N59 `IsEvCAdjoint.comp_nonneg` (via `comp_scalar_pos`):
    the existence-of-the-positive-root hypothesis the polar boost part `exp(p) = √(g*g)` needs,
    DISCHARGED in the structured case. -/
theorem comp_scalar_op_sqrt {g h : Module.End Cut STVC} (H : IsEvCAdjoint g h) {c : Cut}
    (hsc : h.comp g = c • (LinearMap.id : Module.End Cut STVC)) :
    IsEvCOpSqrt (cutSqrt c • (LinearMap.id : Module.End Cut STVC)) (h.comp g) := by
  rw [hsc]
  exact scalar_op_sqrt c (comp_scalar_pos H hsc)

/-- Structured uniqueness: a NONNEGATIVE scalar operator square root of `c·id` is `(cutSqrt c)·id`.
    From `(b·id)∘(b·id) = c·id` we get `b·b = c` (`cutSmul_id_inj`), and `cutSqrt_unique` (N57)
    pins `b = cutSqrt c`. (The full spectral uniqueness over the 10-dim space is childed N61.) -/
theorem scalar_op_sqrt_unique {b c : Cut} (hb : 0 ≤ b)
    (hsqrt : IsEvCOpSqrt (b • (LinearMap.id : Module.End Cut STVC))
      (c • (LinearMap.id : Module.End Cut STVC))) : b = cutSqrt c := by
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [cutSmul_comp] at hcomp
  exact cutSqrt_unique hb (cutSmul_id_inj hcomp)

/-! ## Non-vacuity (W8). -/

/-- Base value: `cutSqrt 16 = 4` over the derived ℝ `Cut`. -/
theorem cutSqrt_sixteen_eq_four : cutSqrt (16 : Cut) = 4 :=
  (cutSqrt_unique (by norm_num) (by norm_num)).symm

/-- ★ NON-VACUITY (W8): a concrete positive operator square root — `4·id` is the positive
    operator square root of `16·id`. The structured operator root is non-vacuous: a genuine
    homothety squaring to a genuine scalar, not a vacuous existence statement. -/
theorem scalar_op_sqrt_witness :
    IsEvCOpSqrt ((4:Cut) • (LinearMap.id : Module.End Cut STVC))
      ((16:Cut) • (LinearMap.id : Module.End Cut STVC)) := by
  have h := scalar_op_sqrt (16 : Cut) (by norm_num)
  rwa [cutSqrt_sixteen_eq_four] at h

/-- ★ NON-VACUITY (W8 teeth): `5·id` is NOT an operator square root of `7·id` — it would force
    `5·5 = 25 = 7`. The operator-square-root predicate has genuine content: a WRONG root fails,
    reducing to the false numeric `25 = 7`. -/
theorem not_scalar_op_sqrt_5_7 :
    ¬ IsEvCOpSqrt ((5:Cut) • (LinearMap.id : Module.End Cut STVC))
      ((7:Cut) • (LinearMap.id : Module.End Cut STVC)) := by
  intro hsqrt
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [cutSmul_comp] at hcomp
  have : (5:Cut) * 5 = 7 := cutSmul_id_inj hcomp
  norm_num at this

end

end Phys.Algebra
