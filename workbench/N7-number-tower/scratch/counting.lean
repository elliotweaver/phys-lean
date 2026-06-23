/-
  SCRATCH — N7 ℕ from the fold. Test the re-entry tower, Peano, universal
  property, and the fold binding in isolation before production.
-/
import Phys.Foundation.Fold

namespace Phys.Foundation

/-- THE RE-ENTRY TOWER (the carrier of counting): the distinction re-entering
    itself. `void` = the form not yet re-entered (zero re-entries); `step` = one
    further re-entry of the form into its own indicational space. -/
inductive Re : Type where
  | void : Re
  | step : Re → Re

namespace Re

/-- Re-entry is INJECTIVE (Peano): equal re-entries come from equal towers. -/
theorem step_inj {m n : Re} (h : step m = step n) : m = n := by injection h

/-- Re-entry never yields the void (Peano): the void is not a re-entry. -/
theorem step_ne_void (n : Re) : step n ≠ void := fun h => Re.noConfusion h

/-- Re-entry has NO fixed point — the re-entry act never rests (the
    self-blindness echo at the level of counting: just as the fold has no
    nonzero fixed point, re-entry has no fixed point at all). -/
theorem step_ne_self (n : Re) : step n ≠ n := by
  induction n with
  | void => exact step_ne_void void
  | step k ih => exact fun h => ih (step_inj h)

/-! ## The universal property — the intrinsic certificate that `Re` IS ℕ
    (the natural number object: initial point-and-endomap), import-free. -/

/-- ITERATE: fold the re-entry tower with a base point `z` and an endo-act `s`.
    The recursion principle: `void ↦ z`, `step n ↦ s (iterate n)`. -/
def iterate {X : Type*} (z : X) (s : X → X) : Re → X
  | void => z
  | step n => s (iterate z s n)

theorem iterate_void {X : Type*} (z : X) (s : X → X) :
    iterate z s void = z := rfl

theorem iterate_step {X : Type*} (z : X) (s : X → X) (n : Re) :
    iterate z s (step n) = s (iterate z s n) := rfl

/-- UNIQUENESS: any `f` that sends `void ↦ z` and intertwines `step` with `s`
    coincides with `iterate`. Together with existence, this is the natural
    number object's universal property — the intrinsic definition of ℕ, proved
    WITHOUT any reference to Mathlib's `Nat` as content. -/
theorem iterate_unique {X : Type*} (z : X) (s : X → X) (f : Re → X)
    (h0 : f void = z) (hs : ∀ n, f (step n) = s (f n)) :
    ∀ n, f n = iterate z s n := by
  intro n
  induction n with
  | void => rw [h0, iterate_void]
  | step k ih => rw [hs, iterate_step, ih]

/-- DEDEKIND-INFINITE: `step` is injective (`step_inj`) and not surjective
    (`step_ne_void` — the void is not in its range). An injective-but-not-onto
    self-map is exactly Dedekind's mark of a genuine (infinite) counting
    structure — the count is inexhaustible, never collapsing onto itself. -/
theorem step_not_surjective : ¬ Function.Surjective step :=
  fun hsurj => (step_ne_void _) (hsurj void).choose_spec

/-! ## The fold binding — the trunk made load-bearing (the look-back is the
    re-entry act; the count is OPEN precisely because the fold CLOSES). -/

/-- The look-orbit: apply the fold `look` along `n` re-entries of a state `x`.
    `iterate` instantiated with the base state and the fold as the endo-act —
    counting re-entries of the look-back. -/
def foldOrbit {V : Type*} (look : V → V) (x : V) : Re → V := iterate x look

/-- ★ THE FOLD CLOSES THE ORBIT AT PERIOD 2 (banked N1 `fold_involutive`): on a
    FIXED carrier, two re-entries of the look-back return the state — the
    look-orbit identifies re-entry-2 with re-entry-0. -/
theorem foldOrbit_period_two {V : Type*} [AddGroup V] {look : V → V}
    (h : IsFold look) (x : V) :
    foldOrbit look x (step (step void)) = foldOrbit look x void :=
  fold_involutive h x

/-- ★★ YET THE COUNT DOES NOT CLOSE: in the re-entry tower `Re` itself,
    re-entry-2 is NOT re-entry-0 (`step (step void) ≠ void`). So the count is
    strictly finer than the fold's closing look-orbit: counting is the OPEN
    re-entry tower, not the period-2 look-back — the same "the fold does not
    resolve on the base, so go up a new level" logic that drives the cascade,
    here generating the inexhaustible count instead of an algebra rung. -/
theorem count_transcends_fold_closure : step (step void) ≠ void :=
  step_ne_void _

end Re
end Phys.Foundation
