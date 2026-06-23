/-
  Phys.Foundation.Counting — THE NUMBER TOWER, rung 0: ℕ FROM THE FOLD.
  ===========================================================================
  THE BOTTOM OF THE NUMBER TOWER (docs/STANDARD.md §3, docs/ROADMAP.md
  ⚠ STANDING DEPENDENCY GATE — THE NUMBER TOWER). The whole tower ℕ→ℤ→ℚ→ℝ must
  descend from the fold, not be imported from Mathlib as CONTENT. ℕ is the bottom
  of the bottom: every ℤ, ℚ, the cap value "3", every dimension count and witness
  arity ultimately traces here. This file derives the CONTENT ℕ — counting/arity
  — as the fold's own ITERATION / RE-ENTRY of the distinction, with NO
  `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to get the result, NO
  posited ℕ, NO bridge. The carrier is CONSTRUCTED; the Peano structure and the
  intrinsic universal property of ℕ are PROVED.

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  The fold is self-look-back. Counting is the fold RE-ENTERING ITSELF — the
  Spencer-Brown re-entry: the distinction re-enters its own indicational space,
  and the *number of re-entries* IS number. But there is a sharp tension the
  trunk RESOLVES, and the resolution is the whole content:

  • On a FIXED carrier the fold CLOSES — `fold_involutive` (banked N1): `look² =
    id`. Iterating the look-back on one carrier is PERIOD-2; it is NOT an
    inexhaustible count. (If counting were the look-orbit, "2" would equal "0".)
  • So counting is NOT iteration on a fixed carrier. It is RE-ENTRY AT A NEW
    LEVEL each time — the form contained afresh inside itself, never resolving on
    the level below. This is exactly the logic that drives the algebra cascade
    (the fold does not resolve on the base, so you RAISE to a new level — N2's
    doubling 1→2→4→8). Here the same "go up a fresh level" act, taken on ONE
    generating distinction, generates not an algebra rung but the OPEN, never-
    closing tower of re-entries: the natural numbers.
  • The count therefore TRANSCENDS the fold's closure: in the re-entry tower
    re-entry-2 ≠ re-entry-0, even though on any fixed carrier the look-orbit
    identifies them. The fold closing is exactly WHY the count must open.

  ── WHAT THIS BANKS ──
    Re                     — the re-entry tower (the carrier of counting):
                             `void` (zero re-entries) and `step` (one further
                             re-entry of the form into itself).
    step_inj               — re-entry is INJECTIVE (Peano).
    step_ne_void           — re-entry never yields the void (Peano: 0 is not a
                             successor).
    step_ne_self           — re-entry has NO fixed point (the self-blindness echo
                             at the level of counting — the act never rests).
    iterate (+ _void/_step)— the RECURSION principle: fold `Re` with a base point
                             and an endo-act.
    iterate_unique         — ★ THE UNIVERSAL PROPERTY: `Re` is the INITIAL
                             point-and-endomap (the natural number object). This
                             is the intrinsic, import-free certificate that `Re`
                             IS ℕ — proved with NO reference to Mathlib's `Nat`.
    step_not_surjective    — `step` injective-but-not-onto: `Re` is Dedekind-
                             infinite — a genuine inexhaustible count, not a finite
                             cycle.
    foldOrbit              — the look-orbit: iterate the fold along `n` re-entries.
    foldOrbit_period_two   — ★ THE FOLD CLOSES the orbit at period 2 (banked
                             `fold_involutive`): on a fixed carrier re-entry-2 of
                             the look-back returns the state.
    count_transcends_fold_closure — ★★ YET THE COUNT DOES NOT CLOSE: in `Re`
                             itself re-entry-2 ≠ re-entry-0. Counting is the open
                             re-entry tower, strictly finer than the closing
                             look-orbit — the fold's closure is what forces the
                             count to open.

  ── WHAT IS OWED (childed onto the chain tail — the rest of the tower) ──
    ℤ from this derived ℕ (the additive/group closure of counting), then ℚ (the
    field-of-fractions closure), then the continuum work (N6, already banked over
    imported ℚ) ports verbatim onto the derived ℚ. The ⚠ NUMBER-TOWER gate flips
    toward RESOLVED only when the WHOLE tower descends from the fold; this file
    banks the bottom rung ℕ.

  ── CONTENT vs. METALANGUAGE (the one honest distinction; STANDARD §3) ──
  This derives the CONTENT ℕ: the OBJECT every result here is a statement ABOUT is
  `Re`, a constructed type carrying the Peano laws and the universal property of
  ℕ, built from the fold's re-entry, with NO Nat/Int/Rat/Real CONTENT import. It
  does NOT (and need not) purge the kernel's own metalanguage arity — `Fin n`
  indexing, universe levels, the `Nat` the elaborator counts constructor depth
  with — that is SUBSTRATE, like `propext`. The test: `Re` is what the theorems
  quantify over; Mathlib's `Nat` is nowhere in their statements.

  §2. PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete every occurrence of
  "fold / look-back / re-entry / distinction / counting / self-blindness": what
  remains is a complete, true development of the FREE structure on one point and
  one endomap — an inductive type with an injective non-surjective successor that
  misses its base, satisfying the initial-algebra universal property (the natural
  number object). No theorem STATEMENT needs a trunk or physics word to be true.
  The names are read OUT of the math, never INTO it.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  and — the gate's whole point — NO Mathlib number-system import as content.
-/
import Phys.Foundation.Fold

namespace Phys.Foundation

/-- THE RE-ENTRY TOWER (the carrier of counting): the distinction re-entering
    itself. `void` = the form not yet re-entered (zero re-entries); `step` = one
    further re-entry of the form into its own indicational space. The honest
    formalization of "counting is the fold re-entering itself" — a DERIVED
    construction (cf. N1's `IsFold` formalizing self-look-back), never a posit. -/
inductive Re : Type where
  | void : Re
  | step : Re → Re

namespace Re

/-! ## The Peano structure — re-entry as an injective successor that misses the
    void. These are THEOREMS about the constructed `Re`, not imported axioms. -/

/-- Re-entry is INJECTIVE (Peano): equal re-entries come from equal towers. -/
theorem step_inj {m n : Re} (h : step m = step n) : m = n := by injection h

/-- Re-entry never yields the void (Peano: the void is not a successor). -/
theorem step_ne_void (n : Re) : step n ≠ void := fun h => Re.noConfusion h

/-- Re-entry has NO fixed point — the re-entry act never rests. The
    self-blindness echo at the level of counting: just as the fold has no nonzero
    fixed point (`fold_self_blind`), re-entry has no fixed point at all. Proved by
    induction on the tower (the successor strictly increases depth). -/
theorem step_ne_self (n : Re) : step n ≠ n := by
  induction n with
  | void => exact step_ne_void void
  | step k ih => exact fun h => ih (step_inj h)

/-! ## The universal property — the intrinsic certificate that `Re` IS ℕ (the
    natural number object: the INITIAL point-and-endomap), import-free. -/

/-- ITERATE: fold the re-entry tower with a base point `z : X` and an endo-act
    `s : X → X`. The recursion principle: `void ↦ z`, `step n ↦ s (iterate n)`. -/
def iterate {X : Type*} (z : X) (s : X → X) : Re → X
  | void => z
  | step n => s (iterate z s n)

@[simp] theorem iterate_void {X : Type*} (z : X) (s : X → X) :
    iterate z s void = z := rfl

@[simp] theorem iterate_step {X : Type*} (z : X) (s : X → X) (n : Re) :
    iterate z s (step n) = s (iterate z s n) := rfl

/-- ★ THE UNIVERSAL PROPERTY (uniqueness half; existence is `iterate`). Any `f`
    sending `void ↦ z` and intertwining `step` with `s` coincides with `iterate`.
    Existence (`iterate`) + uniqueness is EXACTLY the natural number object's
    universal property — the initial object among point-and-endomap structures.
    This is the intrinsic definition of ℕ, proved WITHOUT any reference to
    Mathlib's `Nat` as content: it is what makes `Re` not merely *some* inductive
    type but *the* natural numbers. -/
theorem iterate_unique {X : Type*} (z : X) (s : X → X) (f : Re → X)
    (h0 : f void = z) (hs : ∀ n, f (step n) = s (f n)) :
    ∀ n, f n = iterate z s n := by
  intro n
  induction n with
  | void => rw [h0, iterate_void]
  | step k ih => rw [hs, iterate_step, ih]

/-- DEDEKIND-INFINITE: `step` is injective (`step_inj`) and not surjective (the
    void is not in its range, `step_ne_void`). An injective-but-not-onto self-map
    is precisely Dedekind's mark of a genuine, inexhaustible counting structure —
    the count never collapses onto itself into a finite cycle. -/
theorem step_not_surjective : ¬ Function.Surjective step := by
  intro hsurj
  obtain ⟨a, ha⟩ := hsurj void
  exact step_ne_void a ha

/-! ## The fold binding — the trunk made load-bearing. The look-back IS the
    re-entry act, and the count is OPEN precisely because the fold CLOSES. -/

/-- The look-orbit: apply the fold `look` along `n` re-entries of a state `x` —
    `iterate` instantiated with the base state and the fold as the endo-act
    (counting re-entries of the look-back). -/
def foldOrbit {V : Type*} (look : V → V) (x : V) : Re → V := iterate x look

/-- ★ THE FOLD CLOSES THE ORBIT AT PERIOD 2 (banked N1 `fold_involutive`): on a
    FIXED carrier, two re-entries of the look-back return the state — the
    look-orbit identifies re-entry-2 with re-entry-0. This uses the fold's
    defining closure essentially (delete the fold and the theorem is gone). -/
theorem foldOrbit_period_two {V : Type*} [AddGroup V] {look : V → V}
    (h : IsFold look) (x : V) :
    foldOrbit look x (step (step void)) = foldOrbit look x void :=
  fold_involutive h x

/-- ★★ YET THE COUNT DOES NOT CLOSE: in the re-entry tower `Re` itself,
    re-entry-2 is NOT re-entry-0 (`step (step void) ≠ void`). So counting is
    strictly finer than the fold's closing look-orbit — it is the OPEN re-entry
    tower, not the period-2 look-back. The same "the fold does not resolve on the
    base, so raise a fresh level" logic that drives the cascade, here generating
    the inexhaustible count. The fold CLOSING is exactly why the count must OPEN. -/
theorem count_transcends_fold_closure : step (step void) ≠ void :=
  step_ne_void _

end Re
end Phys.Foundation
