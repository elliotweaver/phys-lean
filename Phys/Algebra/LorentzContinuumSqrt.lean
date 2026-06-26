/-
  Phys.Algebra.LorentzContinuumSqrt — THE POSITIVE-DEFINITE SQUARE ROOT over the
  DERIVED ℝ `Cut` (the first true prerequisite of the polar/KAK boost part).
  ============================================================================
  N49–N56 banked, over the derived ℝ `ContinuumQ.Cut` and the terminal algebra
  `O Cut := CD (H Cut)`: the continuum Born form `gFormC`, the Minkowski form `QvC`,
  the boost/rotation/two-sided-Moufang generators, the generated isometry submonoid
  `genIsomMonoidC2` with FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` (N55),
  and (N56) the BORN POSITIVITY foundation — `gFormC` is positive-definite
  (`gFormC_nonneg`/`gFormC_eq_zero_iff`) and `QvC` has the (1,9) signature.

  THE REVERSE inclusion (every form-isometry IS a finite product of the generators)
  goes through the polar/KAK decomposition `g = k·exp(p)`: the positive-definite
  "boost part" `exp(p)` is the SQUARE ROOT of the form-adjoint composite `g*g`. That
  square root needs, as its FIRST true prerequisite, a general positive-definite
  square root over the scalar field `Cut` — and Mathlib has NO general `sqrt` over
  `Cut` (only the specific derived `√2`, `DerivedSqrtTwo`).

  ── THE W1 REFRAME (THE ONE LAW: attack from the trunk, not the classical path) ──
  The square root does NOT need a bespoke Dedekind-lub construction. It DISSOLVES
  through THE COMPLETENESS THE CONTINUUM WAS BUILT WITH. `Cut` carries, all banked:
    • `ConditionallyCompleteLinearOrder Cut`         (N33, ContinuumCCLO)
    • `OrderTopology Cut` + `IsTopologicalRing Cut`  (N34, ContinuumTopology)
    • `Archimedean Cut` (N35), `CompleteSpace Cut`   (N37)
  The intermediate value theorem `intermediate_value_Icc` consumes exactly
  (conditional order-completeness + order topology) on a closed interval together
  with a continuous map. Squaring `fun x => x*x` is continuous because the derived ℝ
  is a topological ring. For `a ≥ 0`, take `c = max 1 a` (so `0² = 0 ≤ a ≤ c²`); IVT
  on `[0,c]` produces `b ∈ [0,c]` with `b·b = a`. The SAME order-completeness engine
  that built the cut delivers the root — this is the trunk, not a grind.

  ── WHAT THIS BANKS ──
    cutSqrt_exists        — ★ ∀ a ≥ 0, ∃ b ≥ 0, b·b = a (the IVT existence).
    sq_nonneg_inj         — ★ uniqueness on the nonneg branch (b·b = b'·b' ⟹ b = b').
    cutSqrt               — the named nonnegative square-root witness.
    cutSqrt_nonneg        — 0 ≤ cutSqrt a.
    cutSqrt_sq            — ★ (cutSqrt a)·(cutSqrt a) = a   (for a ≥ 0).
    cutSqrt_unique        — cutSqrt is THE nonneg root: 0 ≤ b → b·b = a → b = cutSqrt a.
    cutSqrt_pos           — ★ 0 < a ⟹ 0 < cutSqrt a (the strict positivity the polar
                            boost part needs to invert the positive factor).
    cutSqrt_zero / cutSqrt_one — base values (non-vacuity).
    cutSqrt_four_eq_two   — ★ NON-VACUITY witness: cutSqrt (4) = 2 over the derived ℝ.

  ── CONTENT vs. METALANGUAGE (STANDARD §3) ──
  Every object is the DERIVED `Cut` and its DERIVED order/topology/completeness
  (N11–N37). `intermediate_value_Icc`, `Continuous`, `mul_self_eq_mul_self_iff`,
  `le_antisymm`, `linarith` are standard MACHINERY operating on the derived objects.
  NO `import Mathlib.Data.Real`/`Complex` as content; NO posited ℝ; NO bridge.

  ── PHYSICS-WORDS-REMOVABLE (STANDARD §2) ──
  Delete "Lorentz / boost / KAK / polar / isometry / positive-definite / Spin / SO(9)
  / square-root-as-physics": what remains is pure mathematics — over the derived
  complete ordered field `Cut`, every nonnegative element has a unique nonnegative
  element whose square is it, the root is strictly positive off zero, and `cutSqrt 4
  = 2`. No theorem STATEMENT needs a physics or trunk word to be true.

  Foundations-only: no posited axiom, no sorry, no native_decide, no inflated
  maxHeartbeats, no kernel-trust bypass, no bridge, NO Mathlib number-system content.
-/
import Phys.Algebra.LorentzContinuumPolar

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

/-! ## Continuity of squaring on the derived ℝ. -/

/-- Squaring is continuous on the derived ℝ `Cut` (the field is a topological ring,
    banked N34 `IsTopologicalRing Cut`). -/
theorem continuous_cut_sq : Continuous (fun x : Cut => x * x) :=
  continuous_id.mul continuous_id

/-! ## The square-root existence over `Cut` via the intermediate value theorem. -/

/-- ★ THE POSITIVE-DEFINITE SQUARE ROOT EXISTS over the derived ℝ `Cut`: every
    nonnegative element is the square of a nonnegative element.

    THE W1 REFRAME — this is the intermediate value theorem riding the SAME
    order-completeness (N33) + order topology (N34) the continuum was built with.
    With `c = max 1 a` we have `0·0 = 0 ≤ a ≤ c·c`, so `a` lies in the image-interval
    of the continuous map `x ↦ x·x` on `[0,c]`; `intermediate_value_Icc` returns a
    preimage `b ∈ [0,c]`. NO Mathlib `Real.sqrt`, NO posited ℝ. -/
theorem cutSqrt_exists (a : Cut) (ha : 0 ≤ a) : ∃ b : Cut, 0 ≤ b ∧ b * b = a := by
  set c : Cut := max 1 a with hc
  have h0c : (0 : Cut) ≤ c := le_trans zero_le_one (le_max_left _ _)
  have h1c : (1 : Cut) ≤ c := le_max_left _ _
  have hac : a ≤ c * c := by
    rcases le_total a 1 with h | h
    · calc a ≤ 1 := h
        _ = (1 : Cut) * 1 := (one_mul 1).symm
        _ ≤ c * c := mul_le_mul h1c h1c zero_le_one h0c
    · have hca : a ≤ c := le_max_right _ _
      calc a ≤ c := hca
        _ = 1 * c := (one_mul c).symm
        _ ≤ c * c := mul_le_mul_of_nonneg_right h1c h0c
  have hcont : ContinuousOn (fun x : Cut => x * x) (Set.Icc 0 c) :=
    continuous_cut_sq.continuousOn
  have hmem : a ∈ Set.Icc ((fun x : Cut => x * x) 0) ((fun x : Cut => x * x) c) := by
    refine ⟨?_, ?_⟩
    · simpa using ha
    · simpa using hac
  obtain ⟨b, hb_mem, hb_eq⟩ := intermediate_value_Icc h0c hcont hmem
  exact ⟨b, hb_mem.1, hb_eq⟩

/-- ★ UNIQUENESS on the nonnegative branch: a nonnegative element is determined by
    its square. (Squaring is injective on the nonnegatives of an ordered field.) -/
theorem sq_nonneg_inj {b b' : Cut} (hb : 0 ≤ b) (hb' : 0 ≤ b')
    (h : b * b = b' * b') : b = b' := by
  rcases (mul_self_eq_mul_self_iff (a := b) (b := b')).mp h with h1 | h1
  · exact h1
  · have hble : b' ≤ 0 := by rw [h1] at hb; linarith
    have hb'0 : b' = 0 := le_antisymm hble hb'
    rw [hb'0] at h1 ⊢; simpa using h1

/-! ## The named nonnegative square-root witness and its properties. -/

/-- The nonnegative square root of `a : Cut`. For `a ≥ 0` it satisfies `cutSqrt a ·
    cutSqrt a = a` (`cutSqrt_sq`) and `0 ≤ cutSqrt a` (`cutSqrt_nonneg`); for `a < 0`
    it is the junk value `0`. Noncomputable: chosen from `cutSqrt_exists`. -/
noncomputable def cutSqrt (a : Cut) : Cut :=
  if ha : 0 ≤ a then Classical.choose (cutSqrt_exists a ha) else 0

theorem cutSqrt_nonneg (a : Cut) : 0 ≤ cutSqrt a := by
  unfold cutSqrt
  split
  · exact (Classical.choose_spec (cutSqrt_exists a ‹_›)).1
  · exact le_refl 0

/-- ★ THE DEFINING PROPERTY: for `a ≥ 0`, `(cutSqrt a)·(cutSqrt a) = a`. -/
theorem cutSqrt_sq {a : Cut} (ha : 0 ≤ a) : cutSqrt a * cutSqrt a = a := by
  unfold cutSqrt
  rw [dif_pos ha]
  exact (Classical.choose_spec (cutSqrt_exists a ha)).2

/-- `cutSqrt` is THE nonnegative root: any nonnegative `b` with `b·b = a` equals it. -/
theorem cutSqrt_unique {a b : Cut} (hb : 0 ≤ b) (hba : b * b = a) :
    b = cutSqrt a := by
  have ha : 0 ≤ a := by rw [← hba]; exact mul_nonneg hb hb
  exact sq_nonneg_inj hb (cutSqrt_nonneg a) (by rw [hba, cutSqrt_sq ha])

/-- ★ STRICT POSITIVITY: the nonnegative square root of a strictly positive element
    is strictly positive — the invertibility the polar "boost part" rests on. -/
theorem cutSqrt_pos {a : Cut} (ha : 0 < a) : 0 < cutSqrt a := by
  rcases lt_or_eq_of_le (cutSqrt_nonneg a) with h | h
  · exact h
  · exfalso
    have : cutSqrt a * cutSqrt a = a := cutSqrt_sq (le_of_lt ha)
    rw [← h, mul_zero] at this
    exact (ne_of_gt ha) this.symm

/-! ## Base values and the non-vacuity witness. -/

theorem cutSqrt_zero : cutSqrt 0 = 0 :=
  (cutSqrt_unique (le_refl 0) (mul_zero 0)).symm

theorem cutSqrt_one : cutSqrt 1 = 1 :=
  (cutSqrt_unique zero_le_one (mul_one 1)).symm

/-- ★ NON-VACUITY (W8): the nonnegative square root of `4` is `2` over the derived ℝ
    `Cut` — `2·2 = 4` and `0 ≤ 2`, so by uniqueness `cutSqrt 4 = 2`. A concrete,
    bitable value (not a vacuous existence statement). -/
theorem cutSqrt_four_eq_two : cutSqrt (4 : Cut) = 2 :=
  (cutSqrt_unique (by norm_num) (by norm_num)).symm

end Phys.Algebra
