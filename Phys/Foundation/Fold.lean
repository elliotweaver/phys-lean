/-
  Phys.Foundation.Fold — N1: THE FOLD (self-look-back) and its first forced property.
  ===========================================================================
  THE ROOT OF THE CHAIN. The fold is the project's ONE permitted posit
  (docs/STANDARD.md §3): it is DEFINED here, not derived from anything prior.
  Everything after N1 is DERIVED.

  THE HONEST FORMALIZATION (no pre-loaded answer).
  The fold is self-look-back as self-opposition: a state `x` and its look-back
  `look x` annihilate to the void `0`. On the minimal carrier that has a
  distinguished `0` and a notion of "nonzero" — an additive group — the fold is
  any self-map satisfying the LOOK-BACK LAW

        ∀ x,  look x + x = 0.

  This single law is the posit. From it, EVERYTHING below is a theorem:
    fold_eq_neg        — the law FORCES `look x = -x` (the look-back is unique);
    fold_unique        — any two folds coincide (it is not an arbitrary map);
    fold_void          — the void sees itself: `look 0 = 0`;
    fold_involutive    — the fold CLOSES: `look (look x) = x`, i.e. look² = id.
                         ★ This is `= id`, NOT `= -id`. The complex unit J² = −1
                           is N2's to DERIVE from the cascade; it is NOT posited
                           here. Forcing a quarter-turn `look² = -id` into N1
                           would be drift (see the predecessor repo's error).
    fold_self_blind    — ★ THE FORCED FIRST PROPERTY ★ on a 2-torsion-free
                         carrier the look-back has NO nonzero fixed point:
                         `look x = x → x = 0`. The unity that looks back cannot
                         find itself; self-blindness is forced. The proof
                         GENUINELY USES torsion-freeness, so the hypothesis is
                         load-bearing, not decorative.

  ANTI-VACUITY / TIGHTNESS (the hypothesis is essential, proved from inside):
    neg_isFold                 — negation is a fold (the structure is inhabited);
    fold_char2_has_nonzero_fixed — on the char-2 carrier `ZMod 2` the fold has a
                         NONZERO fixed point, so self-blindness FAILS there. This
                         is the positive complement of the costume and proves the
                         2-torsion-free hypothesis cannot be dropped.
    fold_nonzero_not_fixed     — on the 2-torsion-free carrier `ZMod 3` a nonzero
                         state is genuinely moved by the fold (`look 1 = -1 ≠ 1`),
                         so self-blindness is NON-vacuous: there really are nonzero
                         states the look-back fails to fix. (Carrier is machinery —
                         `ZMod`, like the `ZMod 2` companion — NOT a content number
                         system; the witness uses no `Int`/`Nat`/`Rat`/`Real`.)

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete every occurrence of
  "fold / look-back / self-blindness / void" from this file: what remains is a
  complete, true theory of the unique annihilating self-map on an additive group
  and its fixed-point behaviour under 2-torsion. No theorem STATEMENT needs a
  physics word to be true. The names are read OUT of the math; never INTO it.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Mathlib.Algebra.Group.Basic
import Mathlib.Data.ZMod.Basic

namespace Phys.Foundation

variable {V : Type*} [AddGroup V]

/-- THE FOLD (the one posit, as a property of a self-map). A self-map `look` is a
    *fold* on `V` when looking back at a state and the state itself annihilate to
    the void `0`: `look x + x = 0` for every `x`. -/
def IsFold (look : V → V) : Prop := ∀ x, look x + x = 0

/-- The look-back law FORCES the fold to be the unique annihilating reflection:
    `look x = -x`. (The fold is not an arbitrary map — its value is determined.) -/
theorem fold_eq_neg {look : V → V} (h : IsFold look) (x : V) : look x = -x :=
  add_eq_zero_iff_eq_neg.mp (h x)

/-- Uniqueness of the fold: any two folds on `V` coincide. -/
theorem fold_unique {l₁ l₂ : V → V} (h₁ : IsFold l₁) (h₂ : IsFold l₂) : l₁ = l₂ := by
  funext x; rw [fold_eq_neg h₁ x, fold_eq_neg h₂ x]

/-- The void sees itself: the neutral state is fixed by the fold, `look 0 = 0`. -/
theorem fold_void {look : V → V} (h : IsFold look) : look 0 = 0 := by
  rw [fold_eq_neg h 0, neg_zero]

/-- THE FOLD CLOSES: looking back twice returns the state, `look (look x) = x`
    — i.e. `look² = id`. (Pointedly NOT `look² = -id`: no complex unit here.) -/
theorem fold_involutive {look : V → V} (h : IsFold look) (x : V) :
    look (look x) = x := by
  rw [fold_eq_neg h (look x), fold_eq_neg h x, neg_neg]

/-- ★ SELF-BLINDNESS — the first property the fold FORCES. On a 2-torsion-free
    carrier (`∀ y, y + y = 0 → y = 0`) the look-back has NO nonzero fixed point:
    if `look x = x` then `x = 0`. The proof uses torsion-freeness essentially, so
    the hypothesis is load-bearing (it is false without it — see
    `fold_char2_has_nonzero_fixed`). -/
theorem fold_self_blind {look : V → V} (h : IsFold look)
    (tf : ∀ y : V, y + y = 0 → y = 0) (x : V) (hx : look x = x) : x = 0 := by
  have hneg : -x = x := by rw [← fold_eq_neg h x]; exact hx
  exact tf x (add_eq_zero_iff_eq_neg.mpr hneg.symm)

/-- The fold structure is inhabited: negation is a fold on any additive group. -/
theorem neg_isFold : IsFold (fun x : V => -x) := fun x => neg_add_cancel x

end Phys.Foundation

/-- TIGHTNESS (anti-vacuity): on the char-2 carrier `ZMod 2` the fold (`-·`) has a
    NONZERO fixed point — `look 1 = -1 = 1` — so SELF-BLINDNESS FAILS there. This
    proves, from inside the trust base, that the 2-torsion-free hypothesis of
    `fold_self_blind` is essential. It is the positive complement of the costume. -/
theorem fold_char2_has_nonzero_fixed :
    ∃ x : ZMod 2, (fun y : ZMod 2 => -y) x = x ∧ x ≠ 0 :=
  ⟨1, by decide, by decide⟩

/-- NON-VACUITY: on the 2-torsion-free carrier `ZMod 3` a nonzero state is genuinely
    moved by the fold (`look 1 = -1 ≠ 1`), so "no nonzero fixed point" is non-vacuously
    true — there really are nonzero states the look-back fails to fix. The carrier is
    MACHINERY (`ZMod`, the same kind used by the `ZMod 2` companion above), 2-torsion-free
    (char 3 ≠ 2, so `fold_self_blind` genuinely applies here), and uses NO content number
    system (`Int`/`Nat`/`Rat`/`Real`). -/
theorem fold_nonzero_not_fixed :
    ∃ x : ZMod 3, x ≠ 0 ∧ (fun y : ZMod 3 => -y) x ≠ x :=
  ⟨1, by decide, by decide⟩
