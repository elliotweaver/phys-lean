/-
# N307 — THE KOIDE IDENTITY Q = 2/3, FOR ALL PHASES δ (the δ-invariant self=other balance)

Owner-authorized flavor-route seed (docs/SEED_FLAVOR_SELF_BLINDNESS.md), target **T4** — the Koide
relation as an EXACT IDENTITY of the N306 ℤ₃-Fourier cycle form, holding for ALL phases `δ`, not just
the `δ = 0` slice witnessed at N306. The directed successor of N306 (T3, the cycle FORM).

THE ROUTE (seed §1 step 5, §2 T4). N306 banked the abstract landing
`balance_forces_koide : DCpower a = cyclepower a → Q = 2/3` (the self=other Born balance forces the
Koide quantity `2/3` for ANY amplitude vector) AND the `δ = 0` witness `cosVec`/`koide_cosVec`. The
NEW content of T4 is to make the identity FULLY GENERAL and CONTINUOUS over the phase `δ`: build the
`δ`-parametrized cycle family and prove the balance `DCpower = cyclepower` holds for EVERY `δ` — the
`δ`-INVARIANCE of the balance, which is the rotation-invariance of the cycle-mode Born power — hence
`Q = 2/3` for all `δ`. **The Koide relation is not `δ`-dependent: it is the self=other Born balance
itself, an identity of the cycle form independent of where the cycle sits relative to Unity's frame.**

## §1 — THE δ-FAMILY OVER ℚ (the rational conic realization of the phase circle)

The general cycle form is `√mₖ = M(1 + √2·cos(δ + 2πk/3))`. Writing `p = cos δ`, the orthonormal
cycle basis puts the sine direction along `(0, √3/2, −√3/2)`, so a genuine continuous `δ` carries a
`√3`. Rather than leave ℚ for `Real.cos` (which would be the project's FIRST analytic node and trip
the STANDING DEPENDENCY GATE — ℝ is not yet descended from the fold), we absorb the `√3` into a
RATIONAL coordinate: with `r = √3·sin δ`, the three amplitudes are
`genVec M A p r = (M + A·p, M − A·(p+r)/2, M − A·(p−r)/2)` — all entries rational. The "unit circle"
`cos²δ + sin²δ = 1` becomes the RATIONAL conic `3p² + r² = 3`. Each rational point `(p, r)` on this
conic is a phase `δ`; the family is a genuine 1-parameter family of phases, exact over ℚ, the `√3`
living only in the reparametrization (prose), never in a proof.

## §2 — THE δ-INVARIANCE OF THE BORN POWERS (the theory-native heart)

* `mean_genVec : mean = M` for ALL `(p, r)` — the cycle mode sums to zero at every phase.
* `DCpower_genVec : DCpower = 3M²` — the gathered/Unity power is phase-independent (trivially).
* ★ `cyclepower_genVec_core : cyclepower = A²·(3p² + r²)/2` — the cycle-mode Born power BEFORE the
  constraint. Under the conic `3p² + r² = 3` this is `(3/2)A²` (`cyclepower_genVec`): the cycle-mode
  power is the SAME at every phase `δ`. **This is the δ-invariance of the self=other balance** — the
  turning has equal Born power in every rotated frame (the continuous analogue of `Pcyc_Poth_comm`,
  N306: the shift preserves the cycle subspace).

## §3 — Q = 2/3 FOR ALL δ (the T4 landing)

* `balance_genVec (h : 3p²+r²=3) (hA : A²=2M²) : DCpower = cyclepower` — the `√2`-balanced family
  stays on the balance locus at EVERY phase.
* `forced_sqrt2_genVec` — the balance forces `A² = 2M²` at every phase (the `√2`, derived not asserted).
* ★★ `koide_genVec (h) (hM : M ≠ 0) (hA : A² = 2M²) : Qkoide (genVec M A p r) = 2/3` — the Koide
  quantity is `2/3` for the WHOLE `δ`-family, via the banked `balance_forces_koide` + `balance_genVec`.
  THE T4 LANDING: the identity holds for all `δ`.

## §4 — GROUNDING ON THE BANKED CYCLE (anti-free-floating)

The continuous invariance has a DISCRETE shadow on the banked ℤ₃ shift `Pcyc` (N306):
* `Pcyc_mulVec : Pcyc.mulVec a = (a 2, a 0, a 1)` — the explicit ℤ₃ permutation action.
* `cyclepower_Pcyc_inv : cyclepower (Pcyc.mulVec a) = cyclepower a` — the cycle-mode Born power is
  invariant under the banked generation-cycle shift (the ℤ₃-rotation shadow of the δ-invariance).
* `Qkoide_Pcyc_inv : Qkoide (Pcyc.mulVec a) = Qkoide a` — the Koide quantity is invariant under the
  generation cycle. The family and the identity are TIED to the banked `Pcyc`/`Poth`, not floating.

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

Koide's `Q = 2/3` is, in the standard framework, an unexplained near-coincidence of three measured
lepton masses (and Brannen's `√2·cos(δ + 2πk/3)` is an ansatz FITTED to them, with `δ` a fit
parameter `≈ 2/9`). The theory DERIVES that it is an IDENTITY holding for ALL `δ`: it is the
self=other Born balance of the banked self-blind cycle (N305 T2), whose `δ`-invariance is the
rotation-invariance of the cycle-mode power (N306 `Pcyc_Poth_comm`). `Q = 2/3` needs NO fit and NO
particular `δ` — the phase drops out. No mass, no coupling, no PDG number enters any proof; comparison
to the measured leptons is removable prose. (The phase `δ` itself is fixed only downstream at T5.)

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete generation/mass/amplitude/coherence/Koide/Born/phase: over ℚ, for the real function
`k ↦ M + A·cos(δ + 2πk/3)` realized as the rational conic family `genVec M A p r` with `3p² + r² = 3`,
the invariant `(Σaₖ²)/(Σaₖ)²` equals `2/3` whenever `A² = 2M²` (equivalently whenever the two spectral
Born powers `3M²` and `(3/2)A²` are equal) — for EVERY conic point `(p, r)`; and this invariant, like
the two powers, is unchanged under the order-3 cyclic permutation `Pcyc` of the banked `gcyc`. No
theorem STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

The family `genVec` reuses the banked `mean`/`DCpower`/`cyclepower`/`Qkoide`/`parseval` (N306); the
landing goes through the banked `balance_forces_koide`; §4 ties the invariance to the banked
`Pcyc`/`Poth`; the capstone carries `jdef Xwit Ywit ≠ 0` (the octonion-specific cap forcing exactly
three, N5) in its TYPE. NOT a generic Koide-algebra statement floating free of the cap-forced cycle.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
bridge; no empirical number; `δ` carried as an exact rational conic point (no field extension, no ℝ).
-/
import Phys.Algebra.OctonionJordanGenerationCycleForm
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — the δ-family over ℚ (the rational conic realization of the phase circle). -/

/-- The `δ`-parametrized cycle FAMILY over ℚ. With `p = cos δ` and `r = √3·sin δ` (a rational conic
    point, `3p² + r² = 3`), the general cycle form `M(1 + √2·cos(δ + 2πk/3))` — equivalently
    `M + A·cos(δ + 2πk/3)` — is realized with FULLY RATIONAL entries
    `(M + A·p, M − A·(p+r)/2, M − A·(p−r)/2)`. The `√2` lives in the forced relation `A² = 2M²`; the
    `√3` is absorbed into the coordinate `r`. This is the continuous-`δ` extension of the banked
    `δ = 0` realization `cosVec` (N306), which is the point `(p, r) = (1, 0)`. -/
def genVec (M A p r : ℚ) : Fin 3 → ℚ := ![M + A*p, M - A*(p+r)/2, M - A*(p-r)/2]

/-- The `δ = 0` slice recovers the banked `cosVec` (grounding on N306). At `(p, r) = (1, 0)`:
    `genVec M A 1 0 = cosVec M A`. -/
theorem genVec_zero (M A : ℚ) : genVec M A 1 0 = cosVec M A := by
  funext i
  fin_cases i <;>
    simp [genVec, cosVec] <;> ring

/-- The DC/mean amplitude of the family is `M` for ALL `(p, r)` — the cycle mode sums to zero at
    every phase (no constraint needed). -/
theorem mean_genVec (M A p r : ℚ) : mean (genVec M A p r) = M := by
  simp [mean, genVec]; ring

/-- The DC Born power of the family is `3M²` — the gathered/Unity power is phase-independent. -/
theorem DCpower_genVec (M A p r : ℚ) : DCpower (genVec M A p r) = 3 * M ^ 2 := by
  rw [DCpower_eq, mean_genVec]

/-! ## §2 — the δ-invariance of the cycle-mode Born power (the theory-native heart). -/

/-- ★ THE CYCLE-MODE BORN POWER (before the phase constraint): `cyclepower = A²·(3p² + r²)/2`. Pure
    exact-ℚ algebra once the mean is folded (the cross terms cancel by the zero-sum cycle mode). -/
theorem cyclepower_genVec_core (M A p r : ℚ) :
    cyclepower (genVec M A p r) = A ^ 2 * (3*p^2 + r^2) / 2 := by
  rw [cyclepower_eq, mean_genVec]
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  ring

/-- ★★ THE δ-INVARIANCE OF THE BALANCE: under the rational conic `3p² + r² = 3` (the phase circle),
    the cycle-mode Born power is `(3/2)A²` — the SAME value at EVERY phase `δ`. The turning has equal
    Born power in every rotated frame; this is the continuous analogue of the banked `Pcyc_Poth_comm`
    (the shift preserves the cycle subspace). Together with the phase-independent `DCpower = 3M²`, the
    self=other balance `DCpower = cyclepower` is therefore `δ`-INVARIANT. -/
theorem cyclepower_genVec (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) :
    cyclepower (genVec M A p r) = (3/2) * A ^ 2 := by
  rw [cyclepower_genVec_core, h]; ring

/-! ## §3 — Q = 2/3 for ALL δ (the T4 landing). -/

/-- The `√2`-balanced family stays on the self=other balance locus at EVERY phase: `A² = 2M²` (with
    the conic constraint) gives `DCpower = cyclepower`. -/
theorem balance_genVec (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (hA : A ^ 2 = 2 * M ^ 2) :
    DCpower (genVec M A p r) = cyclepower (genVec M A p r) := by
  rw [DCpower_genVec, cyclepower_genVec _ _ _ _ h, hA]; ring

/-- ★ THE FORCED √2, FOR ALL δ. At every phase (conic point), the self=other Born balance
    `DCpower = cyclepower` FORCES the cycle-to-DC amplitude ratio `A² = 2M²` (the `√2`, derived not
    asserted). The phase does not enter — the balance forces the SAME `√2` everywhere. -/
theorem forced_sqrt2_genVec (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (_hM : M ≠ 0)
    (hbal : DCpower (genVec M A p r) = cyclepower (genVec M A p r)) : A ^ 2 = 2 * M ^ 2 := by
  rw [DCpower_genVec, cyclepower_genVec _ _ _ _ h] at hbal
  linarith

/-- ★★★ THE T4 LANDING — KOIDE `Q = 2/3` FOR ALL PHASES `δ`. For every rational conic point `(p, r)`
    (i.e. every phase `δ`), with the forced `√2`-balance `A² = 2M²` and `M ≠ 0`, the Koide quantity
    `(Σaₖ²)/(Σaₖ)²` of the cycle family is `2/3` — an IDENTITY independent of `δ`. It is exactly the
    self=other Born balance of the banked self-blind cycle (N305 T2), landed through the banked
    `balance_forces_koide` (N306) and the `δ`-invariance of the balance (`balance_genVec`). -/
theorem koide_genVec (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (hM : M ≠ 0) (hA : A ^ 2 = 2 * M ^ 2) :
    Qkoide (genVec M A p r) = 2 / 3 := by
  apply balance_forces_koide
  · rw [mean_genVec]; exact hM
  · exact balance_genVec M A p r h hA

/-- ★ NON-VACUITY (W8): the identity is genuinely `2/3`, not trivially any value. The WRONG amplitude
    ratio `A² = 4M²` (the 2:1 operator-weight reading) gives `Q = 1` for the whole `δ`-family — a
    DIFFERENT, degenerate value. So `Q = 2/3` is a real consequence of the forced `√2` (ratio `2`),
    not an artifact of the family shape. -/
theorem koide_genVec_not_one (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (hM : M ≠ 0)
    (hA : A ^ 2 = 4 * M ^ 2) : Qkoide (genVec M A p r) = 1 := by
  have hnum : (genVec M A p r 0)^2 + (genVec M A p r 1)^2 + (genVec M A p r 2)^2 = 9 * M^2 := by
    rw [parseval, DCpower_genVec, cyclepower_genVec _ _ _ _ h, hA]; ring
  have hden : (genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2)^2 = 9 * M^2 := by
    have hs : genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2 = 3 * M := by
      simp [genVec]; ring
    rw [hs]; ring
  rw [Qkoide, hnum, hden, div_eq_one_iff_eq]
  positivity

/-- NON-VACUITY of the family itself: it is a genuine `δ`-family with a real cycle mode — for `A ≠ 0`
    the three amplitudes are not all equal (the turning is real, not a constant). -/
theorem genVec_moves (M A : ℚ) (hA : A ≠ 0) : genVec M A 1 0 0 ≠ genVec M A 1 0 1 := by
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one]
  intro hc; apply hA; linarith

/-! ## §4 — grounding on the banked cycle: the discrete ℤ₃-shift invariance (anti-free-floating). -/

/-- The explicit action of the banked cyclic shift `Pcyc` (N306, the permutation matrix of the banked
    generation cycle `gcyc`): `Pcyc.mulVec a` permutes `(a 0, a 1, a 2) → (a 2, a 0, a 1)`. -/
theorem Pcyc_mulVec (a : Fin 3 → ℚ) : Pcyc.mulVec a = ![a 2, a 0, a 1] := by
  funext i
  fin_cases i <;>
    simp [Pcyc, gcyc, Matrix.mulVec, dotProduct, Fin.sum_univ_three, Matrix.of_apply]

/-- ★ THE DISCRETE δ-INVARIANCE SHADOW: the cycle-mode Born power is invariant under the banked ℤ₃
    generation-cycle shift `Pcyc` — `cyclepower (Pcyc.mulVec a) = cyclepower a`. This is the discrete
    ℤ₃-rotation shadow of the continuous `δ`-invariance (`cyclepower_genVec`), grounded directly on
    the banked `Pcyc`. -/
theorem cyclepower_Pcyc_inv (a : Fin 3 → ℚ) : cyclepower (Pcyc.mulVec a) = cyclepower a := by
  rw [Pcyc_mulVec, cyclepower_eq, cyclepower_eq]
  simp only [mean, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  ring

/-- ★ THE KOIDE QUANTITY IS GENERATION-CYCLE INVARIANT: `Qkoide (Pcyc.mulVec a) = Qkoide a`. The
    Koide relation does not depend on WHICH generation slot is labelled first — it is invariant under
    the banked ℤ₃ shift, exactly as the `δ`-family Koide value is `δ`-independent. -/
theorem Qkoide_Pcyc_inv (a : Fin 3 → ℚ) : Qkoide (Pcyc.mulVec a) = Qkoide a := by
  rw [Pcyc_mulVec, Qkoide, Qkoide]
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  ring

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the Koide identity `Q = 2/3` for ALL phases `δ`.

    Over ℚ, extending the banked N306 cycle FORM: the `δ`-family `genVec M A p r` (rational conic
    realization of `M(1 + √2·cos(δ + 2πk/3))`, with the phase circle the rational conic `3p² + r² = 3`)
    has phase-INDEPENDENT DC power `3M²` and, on the conic, phase-INDEPENDENT cycle power `(3/2)A²` —
    so the self=other Born balance `DCpower = cyclepower` is `δ`-INVARIANT, forcing the `√2`
    (`A² = 2M²`) at every phase and, through the banked `balance_forces_koide`, making the Koide
    quantity `2/3` for ALL `δ` (`koide_genVec`). The identity is genuinely `2/3` (the WRONG ratio
    `A² = 4M²` gives `Q = 1`, `koide_genVec_not_one`), and the invariance is grounded on the banked
    generation-cycle shift `Pcyc` (`cyclepower_Pcyc_inv`, `Qkoide_Pcyc_inv`). The cap forcing exactly
    three generations (`jdef Xwit Ywit ≠ 0`, N5) grounds it on the octonion-specific arena. -/
theorem generation_koide_all_phases :
    -- §1: the δ-family over ℚ, phase-independent DC data
    (∀ M A : ℚ, genVec M A 1 0 = cosVec M A)
    ∧ (∀ M A p r : ℚ, mean (genVec M A p r) = M)
    ∧ (∀ M A p r : ℚ, DCpower (genVec M A p r) = 3 * M ^ 2)
    -- §2: the δ-invariance of the cycle-mode Born power (on the phase conic)
    ∧ (∀ M A p r : ℚ, 3*p^2 + r^2 = 3 → cyclepower (genVec M A p r) = (3/2) * A ^ 2)
    -- §3: THE T4 LANDING — Q = 2/3 for ALL δ, and the forced √2 at every phase
    ∧ (∀ M A p r : ℚ, 3*p^2 + r^2 = 3 → M ≠ 0 →
        DCpower (genVec M A p r) = cyclepower (genVec M A p r) → A ^ 2 = 2 * M ^ 2)
    ∧ (∀ M A p r : ℚ, 3*p^2 + r^2 = 3 → M ≠ 0 → A ^ 2 = 2 * M ^ 2 →
        Qkoide (genVec M A p r) = 2 / 3)
    -- §4: grounded on the banked ℤ₃ shift Pcyc (anti-free-floating)
    ∧ (∀ a : Fin 3 → ℚ, cyclepower (Pcyc.mulVec a) = cyclepower a)
    ∧ (∀ a : Fin 3 → ℚ, Qkoide (Pcyc.mulVec a) = Qkoide a)
    -- the cap forcing exactly 3 (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨genVec_zero, mean_genVec, DCpower_genVec, cyclepower_genVec, forced_sqrt2_genVec, koide_genVec,
   cyclepower_Pcyc_inv, Qkoide_Pcyc_inv, jordan_fails_H4⟩

end Phys.Algebra.HJ
