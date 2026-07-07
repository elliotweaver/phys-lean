/-
  Phys.Quantum.ComplexStructure — N392 (arc-J J2): THE COMPLEX STRUCTURE FORCED
  BY SELF-BLINDNESS.  (★ THE DEEPEST JOINT OF ARC J.)
  ===========================================================================
  THE SECOND NODE OF ARC J — the foundations of quantum mechanics. Arc J derives
  the Born rule as a THEOREM. J1 (N391, Phys/Quantum/PrimitiveFibre.lean) banked
  the RAW 2D real fibre `StateFibre = Cut × Cut` (the two look-back directions
  `eInward = (1,0)`, `eOutward = (0,1)`), the forced carrier prior to any complex
  structure. THIS node (J2) equips that carrier with its complex structure `J`
  (`J² = −1`) — and derives that the complex unit's SIGN is FORCED by the fold's
  own self-blindness. `i` is not posited; it is the fold's own chirality.

  ── THE FORWARD DERIVATION (fold → the forced complex unit; nothing posited) ──
  Recursive self-blindness — the look-back applied to itself — is the search for a
  SQUARE ROOT of the look-back, a *fold-root* `J` with `J ∘ J = look = -id`
  (`IsFoldRoot`, N2). On the banked 2D fibre the natural candidate exchanges the
  two look-back directions with a return sign `σ`: `Jexch σ (a,b) = (σ·b, a)`, so
  `Jexch σ (eInward) = eOutward` and `Jexch σ (eOutward) = σ·eInward`. Exactly one
  sign is consistent with the fold, and it is forced two ways by the SAME C6
  (self-blindness, N1):

    · THE `+eInward` COMPLETION IS FORBIDDEN (the seed's headline). With `σ = +1`
      the exchange is the plain swap `(a,b) ↦ (b,a)`, which FIXES the nonzero state
      `eInward + eOutward = (1,1)` — a nonzero fixed point of the look-back. This
      contradicts C6 / self-blindness (`fold_self_blind`, N1: the look-back has NO
      nonzero fixed point). So `J(eOutward) = +eInward` is forbidden.
      (`plus_completion_has_lookback_fixed_point`, `self_blind_forbids_plus`.)
    · THE FOLD-ROOT PINS `σ = −1` UNIQUELY. Being a square root of the fold
      (`J ∘ J = -id`, the recursion of self-blindness) holds for `Jexch σ` IFF
      `σ = −1` (`Jexch_isFoldRoot_iff`): `Jexch σ (Jexch σ p) = σ • p`, which is
      `-p` for all `p` exactly when `σ = -1`.

  ⇒ the complex structure is FORCED: `J := Jexch (-1)`, with
        `J(eInward) = eOutward`,  `J(eOutward) = −eInward`  (★ `J(e₂) = −e₁`),
        `J ∘ J = −id`            (★ `J² = −1`),
    and it IS the banked cascade complex unit `J₂` (N2) — the chain is unbroken.
    `i` is the fold's own chirality: the unique fixed-point-free sign of the
    look-back's square root.

  WHAT IS BANKED HERE (forward, foundations-only):
    Jexch σ            — the axis-exchange with return sign `σ` on the banked fibre.
    Jexch_sq           — `Jexch σ ∘ Jexch σ = σ • id`.
    foldComplex        — ★ THE COMPLEX STRUCTURE `J := Jexch (-1)`.
    foldComplex_eInward— `J(eInward) = eOutward`  (`J(e₁) = e₂`).
    foldComplex_eOutward— ★ `J(eOutward) = −eInward`  (`J(e₂) = −e₁`, the seed's joint).
    eInwOut_ne_zero    — the state `eInward + eOutward` is nonzero (W8).
    plus_completion_has_lookback_fixed_point — the `+eInward` swap FIXES `(1,1)`.
    self_blind_forbids_plus — a self-blind axis-exchange must have `σ ≠ 1` (C6 rules
                         out `+eInward` — the seed's headline).
    Jexch_isFoldRoot_iff — ★ `IsFoldRoot (Jexch σ) ↔ σ = −1` (the fold-root pins the
                         sign uniquely; recursive self-blindness = square root of fold).
    foldComplex_sq     — ★ `J ∘ J = −id`, i.e. `J² = −1` (the complex-unit law, DERIVED).
    foldComplex_isFoldRoot — `J` is a genuine square root of the fold.
    foldComplex_self_blind — `J` inherits the fold's self-blindness (no nonzero fixed pt).
    foldComplex_eq_J₂  — ★ `J` IS the banked cascade complex unit `J₂` (N2) — unbroken.
    complex_structure_forced — ★★ THE CRUX: the sign is UNIQUELY forced — `J(e₁)=e₂`,
                         `J(e₂)=−e₁`, `J²=−1`, `J` a self-blind fold-root, AND the
                         `+e₁` alternative carries a nonzero look-back fixed point (so
                         the complex unit is forced, not chosen).

  SCOPE (docs/RUNBOOK.md W4.5). This node derives EXACTLY the complex structure `J`
  (`J² = −1`) and the forced-ness of its sign. It does NOT derive J3's Kähler
  compatibility / the Born-square `|⟨φ|ψ⟩|²` (the metric–`J` coherence and the
  probability rule are J3's target). The self-overlap `bornForm` (N391) is not used
  in the forcing — the sign is forced by self-blindness alone, not by any metric.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "quantum / complex structure
  / chirality / look-back / self-blindness": what remains is the pure statement that,
  on the banked 2-dimensional carrier with its distinguished 2-frame, the unique
  return sign for which the axis-exchange squares to `-id` is `σ = −1` (the `+1`
  exchange fixes the nonzero diagonal state and is therefore not fixed-point-free),
  and that this operator equals the banked doubling operator `J₂`. No theorem
  STATEMENT needs a physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
  Built on the BANKED derived ℝ `Cut`, the banked fold self-blindness (N1), the
  banked fold-root `IsFoldRoot`/`J₂` (N2), and the banked 2D fibre (N391) — NO
  Mathlib `Real` / `Complex` as content, NO posited `i`.
-/
import Mathlib.LinearAlgebra.Prod
import Mathlib.Algebra.Ring.Commute
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

/-! ## The axis-exchange with a return sign — the candidate complex structure. -/

/-- THE AXIS-EXCHANGE with return sign `σ` on the banked 2D fibre: `(a,b) ↦ (σ·b, a)`.
    It sends the first look-back direction to the second and the second back to `σ`
    times the first — the candidate square root of the look-back on the fibre. -/
noncomputable def Jexch (σ : ContinuumQ.Cut) : StateFibre →ₗ[ContinuumQ.Cut] StateFibre where
  toFun p := (σ * p.2, p.1)
  map_add' p q := Prod.ext (by simp; ring) (by simp)
  map_smul' r p := Prod.ext (by simp; ring) (by simp)

@[simp] theorem Jexch_apply (σ : ContinuumQ.Cut) (p : StateFibre) :
    Jexch σ p = (σ * p.2, p.1) := rfl

/-- The exchange squares to scaling by the return sign: `Jexch σ ∘ Jexch σ = σ • id`. -/
theorem Jexch_sq (σ : ContinuumQ.Cut) (p : StateFibre) :
    Jexch σ (Jexch σ p) = σ • p := by
  refine Prod.ext ?_ ?_ <;> simp [Prod.smul_fst, Prod.smul_snd, smul_eq_mul]

/-! ## The forced complex structure `J := Jexch (-1)` and its action on the frame. -/

/-- ★ THE COMPLEX STRUCTURE. The look-back's square root on the banked fibre, with the
    sign `−1` forced by self-blindness (see `Jexch_isFoldRoot_iff`,
    `self_blind_forbids_plus`). This is `i` as the fold's own chirality. -/
noncomputable def foldComplex : StateFibre →ₗ[ContinuumQ.Cut] StateFibre := Jexch (-1)

@[simp] theorem foldComplex_apply (p : StateFibre) : foldComplex p = (-p.2, p.1) := by
  simp [foldComplex]

/-- `J(eInward) = eOutward`  (`J(e₁) = e₂`): the complex unit rotates the first
    look-back direction into the second. -/
theorem foldComplex_eInward : foldComplex eInward = eOutward := by
  simp [eInward, eOutward]

/-- ★ THE JOINT `J(eOutward) = −eInward`  (`J(e₂) = −e₁`). The look-back's square root
    rotates the second direction back to MINUS the first — the sign forced by the
    fold's self-blindness (the `+eInward` alternative is forbidden below). -/
theorem foldComplex_eOutward : foldComplex eOutward = -eInward := by
  refine Prod.ext ?_ ?_ <;> simp [eInward, eOutward]

/-! ## The `+eInward` completion is forbidden — it is a look-back fixed point (C6). -/

/-- The diagonal state `eInward + eOutward = (1,1)` is nonzero. -/
theorem eInwOut_ne_zero : eInward + eOutward ≠ (0 : StateFibre) := by
  intro h
  have : (1 : ContinuumQ.Cut) = 0 := by
    have := congrArg Prod.fst h; simpa [eInward, eOutward] using this
  exact one_ne_zero this

/-- THE `+eInward` COMPLETION IS A LOOK-BACK FIXED POINT. With return sign `+1` the
    exchange is the plain swap `(a,b) ↦ (b,a)`, which FIXES the nonzero diagonal state
    `eInward + eOutward`. This is a nonzero fixed point of the look-back — forbidden by
    C6 / self-blindness (the seed's headline: `J(e₂) = +e₁` gives a fixed point). -/
theorem plus_completion_has_lookback_fixed_point :
    Jexch 1 (eInward + eOutward) = eInward + eOutward := by
  refine Prod.ext ?_ ?_ <;> simp [eInward, eOutward]

/-- SELF-BLINDNESS FORBIDS THE `+eInward` SIGN. If the axis-exchange is fixed-point-free
    on nonzero states (self-blind, as C6 demands of the look-back), its return sign
    cannot be `+1` — because the `+1` exchange fixes the nonzero diagonal state. This is
    C6 (N1 `fold_self_blind`) at the state-space level, ruling out `+eInward`. -/
theorem self_blind_forbids_plus (σ : ContinuumQ.Cut)
    (hsb : ∀ p, Jexch σ p = p → p = 0) : σ ≠ 1 := by
  intro hσ; subst hσ
  exact eInwOut_ne_zero (hsb (eInward + eOutward) plus_completion_has_lookback_fixed_point)

/-! ## The fold-root pins the sign to `−1` uniquely — recursive self-blindness. -/

/-- ★ THE FOLD-ROOT PINS THE SIGN. The axis-exchange is a square root of the fold
    (`Jexch σ ∘ Jexch σ = -id`, the recursion of self-blindness, N2 `IsFoldRoot`) IF
    AND ONLY IF its return sign is `−1`. So the complex unit's sign is uniquely forced:
    `i` is the fold's chirality, not a choice. -/
theorem Jexch_isFoldRoot_iff (σ : ContinuumQ.Cut) :
    IsFoldRoot (fun p => Jexch σ p) ↔ σ = -1 := by
  rw [isFoldRoot_iff]
  constructor
  · intro h
    have he := h eInward
    rw [Jexch_sq] at he
    have hfst : σ * (1 : ContinuumQ.Cut) = -1 := by
      have := congrArg Prod.fst he
      simpa [eInward, Prod.smul_fst, smul_eq_mul] using this
    simpa using hfst
  · intro h p
    rw [Jexch_sq, h, neg_one_smul]

/-! ## The forced complex unit — `J² = −1`, self-blind, and IS the banked `J₂`. -/

/-- ★ THE COMPLEX-UNIT LAW, DERIVED: `J ∘ J = −id`, i.e. `J² = −1`. The unit N1
    deferred and N391 left un-equipped — now a theorem on the forced fibre with the
    forced sign. -/
theorem foldComplex_sq (p : StateFibre) : foldComplex (foldComplex p) = -p := by
  rw [foldComplex, Jexch_sq, neg_one_smul]

/-- `J` is a genuine square root of the fold (a fold-root, N2): the recursion of
    self-blindness is solved on the fibre. -/
theorem foldComplex_isFoldRoot : IsFoldRoot (fun p => foldComplex p) := by
  rw [foldComplex]; exact (Jexch_isFoldRoot_iff (-1)).mpr rfl

/-- `J` INHERITS THE FOLD'S SELF-BLINDNESS (N1 `fold_self_blind`): its only fixed point
    is the void. The complex unit is itself fixed-point-free — as C6 demands. -/
theorem foldComplex_self_blind (p : StateFibre) (hp : foldComplex p = p) : p = 0 := by
  refine fold_self_blind foldComplex_isFoldRoot ?_ p ?_
  · intro y hy
    have : (2 : ContinuumQ.Cut) • y = 0 := by rw [two_smul]; exact hy
    simpa using this
  · show foldComplex (foldComplex p) = p; rw [hp, hp]

/-- ★ `J` IS THE BANKED CASCADE COMPLEX UNIT `J₂` (N2). The complex structure of the
    quantum fibre and the complex unit of the algebra cascade are the SAME operator —
    the chain is unbroken from the fibre (N391) back through the cascade root (N2). -/
theorem foldComplex_eq_J₂ : foldComplex = J₂ := by
  apply LinearMap.ext; intro p; simp [foldComplex, J₂]

/-! ## THE CRUX — the complex structure's sign is uniquely forced. -/

/-- ★★ THE CRUX — THE COMPLEX STRUCTURE IS FORCED, not chosen. On the banked 2D fibre:
    `J(e₁) = e₂`, `J(e₂) = −e₁`, `J² = −1`, `J` is a self-blind fold-root, AND the
    alternative `+e₁` completion carries a nonzero look-back fixed point. Together these
    say the complex unit's sign is UNIQUELY forced by the fold's self-blindness (C6):
    `i` is the fold's own chirality, derived — never posited. -/
theorem complex_structure_forced :
    foldComplex eInward = eOutward ∧
    foldComplex eOutward = -eInward ∧
    (∀ p, foldComplex (foldComplex p) = -p) ∧
    IsFoldRoot (fun p => foldComplex p) ∧
    (∀ p, foldComplex p = p → p = 0) ∧
    (Jexch 1 (eInward + eOutward) = eInward + eOutward ∧ eInward + eOutward ≠ 0) := by
  exact ⟨foldComplex_eInward, foldComplex_eOutward, foldComplex_sq, foldComplex_isFoldRoot,
    foldComplex_self_blind, plus_completion_has_lookback_fixed_point, eInwOut_ne_zero⟩

end Phys.Quantum
