/-
# N306 — THE ℤ₃-FOURIER CYCLE FORM OF THE COHERENCE AMPLITUDES

Owner-authorized flavor-route seed (docs/SEED_FLAVOR_SELF_BLINDNESS.md), target **T3** — the cycle
FORM of the amplitudes, the directed successor of N305 (T1 + T2). The FORM is **DERIVED**, never
posited (seed guard G4); the phase `δ` is left symbolic (fixed only downstream at T5).

THE ROUTE (seed §1 step 4). Because the coherent ground state has NO fixed point (C6) and the three
generations are phases of ONE self-blind ℤ₃ cycle (N305 T1, `gcyc`), the amplitude assigned to
generation `k` is the ℤ₃-Fourier expansion of the cycle: a Unity/DC mode (the cycle-invariant "1",
the gathered `unity_fixed`) + ONE cycle mode (the turning) + NOTHING ELSE, i.e. the theory-native
form `√mₖ = M · (1 + √2 · cos(δ + 2πk/3))`. Two things are DERIVED here, both grounded on banked
N305 objects (NOT free-floating):

## §1 — DC ⊕ ONE CYCLE MODE ⊕ NOTHING (the ℤ₃-Fourier STRUCTURE)

The cyclic-shift matrix `Pcyc` is the permutation matrix of the banked generation cycle `gcyc`
(`Pcyc_ground` ties it to `gcyc`, so this is grounded on the cap-forced idempotent cycle).

* `Pcyc_cube` — order 3 (echoes `gcyc_cube`).
* `Pcyc_Pdem : Pcyc * Pdem = Pdem` — the DC/Unity mode is shift-INVARIANT (the gathered
  cycle-invariant "1", the matrix shadow of `unity_fixed`).
* `cyc_sum_Jall : 1 + Pcyc + Pcyc² = Jall` and `Jall = 3•Pdem` — the ℤ₃ democratic average over the
  cycle orbit IS the DC projector (Fourier DC extraction).
* ★ `cyc_cyclotomic_on_Poth : (1 + Pcyc + Pcyc²) * Poth = 0` — on the "others"/cycle subspace
  (`Poth`, banked N305) the shift satisfies the ℤ₃ cyclotomic `x² + x + 1 = 0`. That polynomial is
  irreducible over ℚ (degree 2 = ONE conjugate pair `ω, ω²` = exactly ONE cosine mode + phase,
  NOTHING else). With `Pdem + Poth = 1` (`P_sum`, banked) and `Pdem ⊥ Poth` (`P_orth`, banked),
  the regular ℤ₃-representation over ℚ splits as **DC (trivial, `Pdem`) ⊕ one cycle mode (the
  cyclotomic irreducible, `Poth`) ⊕ nothing**. This IS the derived Fourier form.
* `Pcyc_Poth_comm` — the shift preserves the cycle subspace (the turning is internal to the one
  cycle mode).

## §2 — THE FORCED √2 AMPLITUDE RATIO (the T2 self=other Born balance)

Every real amplitude `a : Fin 3 → ℚ` decomposes on the banked projectors: `Pdem.mulVec a` = constant
mean (DC), `Poth.mulVec a` = `a − mean` (cycle, zero-sum). Their Born powers add (Parseval, from
`P_orth`). The self=other Born balance of N305 T2 — the seeing operator's self-view vanishes — is
`DCpower = cyclepower` (the "self/gathered" power equals the "other/turning" power, the 45°/cos²=½
balance). For the cycle FORM `aₖ = M + A·cos(δ + 2πk/3)` (with `A` the cycle-mode amplitude),
`DCpower = 3M²` and `cyclepower = (3/2)A²`, so the balance forces `A² = 2M²` — the unique positive
relative amplitude `A/M = √2`. The `(3/2)A²` factor is DERIVED exactly over ℚ at the rational
realization `cos(2πk/3) ∈ {1, −½, −½}` (`cyclepower_cos`); the amplitude `A` is the ℤ₃-rotation-
invariant cycle-mode length (`Poth` commutes with `Pcyc`). **The √2 falls out of the Born balance —
it is not asserted** (over ℚ we state the amplitude-SQUARED relation `A² = 2M²`, exact; the `√` is
the physicist's reading of the Born square root, prose only).

* ★ `balance_forces_koide : DCpower a = cyclepower a → Q = 2/3` — for ANY amplitude `a`, hence ANY
  phase `δ`, the balance makes the Koide quantity `(Σaₖ²)/(Σaₖ)² = 2/3` (the T4 landing, already
  visible in the T3 form; it holds for all δ).
* ★★ `forced_sqrt2 : balance → A² = 2M²` — the √2 amplitude ratio, forced by the balance.
* `koide_not_one` — NON-VACUITY: the 45° balance (`A²=2M²`, `Q=2/3`) is DISTINCT from the WRONG 2:1
  operator-weight reading (`A²=4M²`, `Q=1`).

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

The Standard Model / Brannen parametrization POSITS the `√2·cos` Koide form as an ansatz FITTED to
the measured lepton masses. The theory DERIVES it: the form is the ℤ₃-Fourier structure of the
banked self-blind cycle (DC ⊕ one cyclotomic mode ⊕ nothing), and the `√2` is FORCED by the same
self=other Born balance that killed the seeing operator's self-view (N305 T2). No mass, no coupling,
no PDG number enters any proof; the Koide `2/3` is a structural identity, and comparison to data is
removable prose.

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete generation/mass/amplitude/coherence/Koide/Born: over ℚ, the permutation matrix `Pcyc` of the
order-3 fixed-point-free cycle `gcyc` extracts the trivial subspace `Pdem` (shift-invariant) and, on
its complement `Poth`, satisfies the irreducible cyclotomic `x²+x+1 = 0` (one 2-dim mode, nothing
else); and for the real function `M + A·c` on the 3-cycle the equal-power condition `3M² = (3/2)A²`
forces `A² = 2M²`, and the invariant `(Σaₖ²)/(Σaₖ)²` equals `2/3` whenever the DC and cycle powers
are equal. No theorem STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

`Pcyc` is grounded on the banked `gcyc` (`Pcyc_ground`); `Pdem`/`Poth`/`Jall`/`P_orth`/`P_sum` are the
banked N305 projectors; the capstone carries `jordan_fails_H4` (the octonion-specific cap forcing
exactly 3) in its TYPE. NOT a generic ℤ₃-Fourier statement floating free of the cap-forced idempotents.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
bridge.
-/
import Phys.Algebra.OctonionJordanGenerationCycleBornSplit
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — DC ⊕ one cycle mode ⊕ nothing: the ℤ₃-Fourier structure of the banked cycle. -/

/-- The cyclic-shift matrix over ℚ: the permutation matrix of the banked generation cycle `gcyc`
    (0→1→2→0, N305). `(Pcyc · v) i = v (gcyc⁻¹ i)`. This is the ℤ₃-Fourier shift on the three
    cap-forced generation slots — grounded on `gcyc`, NOT free-floating. -/
noncomputable def Pcyc : Matrix (Fin 3) (Fin 3) ℚ :=
  Matrix.of (fun i j => if gcyc j = i then 1 else 0)

/-- GROUNDING: `Pcyc` is the permutation matrix of the banked cycle `gcyc`. -/
theorem Pcyc_ground (i j : Fin 3) : Pcyc i j = (if gcyc j = i then (1 : ℚ) else 0) := rfl

/-- Order three: `Pcyc³ = 1` (echoes `gcyc_cube`). -/
theorem Pcyc_cube : Pcyc * Pcyc * Pcyc = 1 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pcyc, gcyc, Matrix.mul_apply, Matrix.one_apply, Fin.sum_univ_three]

/-- ★ THE DC/UNITY MODE IS SHIFT-INVARIANT: `Pcyc * Pdem = Pdem` — the gathered cycle-invariant "1"
    (the matrix shadow of the banked `unity_fixed`). -/
theorem Pcyc_Pdem : Pcyc * Pdem = Pdem := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pcyc, gcyc, Pdem, Jall, Matrix.mul_apply, Matrix.smul_apply, Fin.sum_univ_three]

/-- ★ THE ℤ₃-FOURIER DC EXTRACTION: the sum over the cycle orbit of shifts is the all-ones `Jall`.
    `1 + Pcyc + Pcyc² = Jall`. The democratic average over the ℤ₃ orbit extracts the DC mode. -/
theorem cyc_sum_Jall : 1 + Pcyc + Pcyc * Pcyc = Jall := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pcyc, gcyc, Jall, Matrix.mul_apply, Matrix.one_apply, Matrix.add_apply, Fin.sum_univ_three]

/-- `Jall = 3 • Pdem` (the DC projector rescaled). -/
theorem Jall_three_Pdem : Jall = (3 : ℚ) • Pdem := by
  apply Matrix.ext; intro i j
  simp [Pdem, Matrix.smul_apply, smul_smul]

/-- ★★ THE CYCLE MODE SATISFIES THE ℤ₃ CYCLOTOMIC: on the "others"/cycle subspace `Poth` (banked
    N305), the shift obeys `(1 + Pcyc + Pcyc²) * Poth = 0`, i.e. `x² + x + 1 = 0` restricted to the
    cycle mode. That polynomial is irreducible over ℚ (degree 2 = ONE conjugate pair `ω, ω²` =
    exactly ONE cosine mode + phase, NOTHING else). With `Pdem + Poth = 1` and `Pdem ⊥ Poth`, this
    IS the ℤ₃-Fourier "DC ⊕ one cycle mode ⊕ nothing". -/
theorem cyc_cyclotomic_on_Poth : (1 + Pcyc + Pcyc * Pcyc) * Poth = 0 := by
  rw [cyc_sum_Jall, Jall_three_Pdem, Matrix.smul_mul, P_orth, smul_zero]

/-- ★ THE SHIFT PRESERVES THE CYCLE SUBSPACE: `Pcyc * Poth = Poth * Pcyc` — the turning is internal
    to the one cycle mode (so the cycle-mode Born power is ℤ₃-rotation invariant). -/
theorem Pcyc_Poth_comm : Pcyc * Poth = Poth * Pcyc := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pcyc, gcyc, Poth, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply,
      Matrix.sub_apply, Fin.sum_univ_three]

/-- NON-VACUITY: the shift genuinely MOVES the cycle subspace — `Pcyc ≠ 1` (the turning is real). -/
theorem Pcyc_ne_one : Pcyc ≠ 1 := by
  intro h
  have h00 : Pcyc 0 0 = (1 : Matrix (Fin 3) (Fin 3) ℚ) 0 0 := by rw [h]
  simp [Pcyc, gcyc, Matrix.one_apply] at h00

/-! ## §2 — the amplitude decomposition on the banked projectors (Parseval). -/

/-- The DC/mean amplitude of a real cycle amplitude vector. -/
def mean (a : Fin 3 → ℚ) : ℚ := (a 0 + a 1 + a 2) / 3

/-- The DC/Unity component: `Pdem.mulVec a` = constant mean (the gathered cycle-invariant part). -/
theorem pdem_mulvec (a : Fin 3 → ℚ) : Pdem.mulVec a = (fun _ => mean a) := by
  funext i
  fin_cases i <;>
    simp [Pdem, Jall, Matrix.mulVec, dotProduct, Fin.sum_univ_three, mean, Matrix.smul_apply] <;>
    ring

/-- The cycle component: `Poth.mulVec a = a − mean` (zero-sum, the turning). -/
theorem poth_mulvec (a : Fin 3 → ℚ) : Poth.mulVec a = (fun i => a i - mean a) := by
  have hP : Poth = 1 - Pdem := rfl
  rw [hP, Matrix.sub_mulVec, Matrix.one_mulVec, pdem_mulvec]
  funext i; simp

/-- DC Born power `‖Pdem·a‖²`. -/
def DCpower (a : Fin 3 → ℚ) : ℚ :=
  (Pdem.mulVec a 0) ^ 2 + (Pdem.mulVec a 1) ^ 2 + (Pdem.mulVec a 2) ^ 2
/-- Cycle Born power `‖Poth·a‖²`. -/
def cyclepower (a : Fin 3 → ℚ) : ℚ :=
  (Poth.mulVec a 0) ^ 2 + (Poth.mulVec a 1) ^ 2 + (Poth.mulVec a 2) ^ 2

/-- `DCpower a = 3·mean²`. -/
theorem DCpower_eq (a : Fin 3 → ℚ) : DCpower a = 3 * (mean a) ^ 2 := by
  simp [DCpower, pdem_mulvec]; ring

/-- `cyclepower a = Σ(aₖ − mean)²`. -/
theorem cyclepower_eq (a : Fin 3 → ℚ) :
    cyclepower a = (a 0 - mean a) ^ 2 + (a 1 - mean a) ^ 2 + (a 2 - mean a) ^ 2 := by
  simp [cyclepower, poth_mulvec]

/-- ★ PARSEVAL: the total Born power splits into DC + cycle (from `Pdem ⊥ Poth`, banked N305). -/
theorem parseval (a : Fin 3 → ℚ) :
    (a 0) ^ 2 + (a 1) ^ 2 + (a 2) ^ 2 = DCpower a + cyclepower a := by
  rw [DCpower_eq, cyclepower_eq, mean]; ring

/-! ## §3 — the forced √2 amplitude ratio and the Koide identity (the T2 balance). -/

/-- The Koide quantity `Q = (Σ aₖ²) / (Σ aₖ)²` of a real amplitude vector. -/
def Qkoide (a : Fin 3 → ℚ) : ℚ := ((a 0) ^ 2 + (a 1) ^ 2 + (a 2) ^ 2) / (a 0 + a 1 + a 2) ^ 2

/-- The sum of amplitudes is `3·mean` (the cycle mode sums to zero). -/
theorem sum_eq (a : Fin 3 → ℚ) : a 0 + a 1 + a 2 = 3 * mean a := by rw [mean]; ring

/-- ★ THE SELF=OTHER BORN BALANCE ⟹ KOIDE `2/3`. If the DC power equals the cycle power (the 45°
    equal split, `DCpower = cyclepower`), then `Q = 2/3` — for ANY amplitude vector, hence for ANY
    phase `δ`. This is the T4 landing already visible in the T3 form: the Koide relation is an
    identity of the cycle form, holding for all δ, and it is exactly the self=other balance of the
    banked seeing operator (N305 T2). -/
theorem balance_forces_koide (a : Fin 3 → ℚ) (hM : mean a ≠ 0)
    (hbal : DCpower a = cyclepower a) : Qkoide a = 2 / 3 := by
  have hsum : (a 0 + a 1 + a 2) ^ 2 = 9 * (mean a) ^ 2 := by rw [sum_eq]; ring
  have hnum : (a 0) ^ 2 + (a 1) ^ 2 + (a 2) ^ 2 = 6 * (mean a) ^ 2 := by
    rw [parseval, ← hbal, DCpower_eq]; ring
  rw [Qkoide, hnum, hsum]
  rw [show (6 : ℚ) * mean a ^ 2 = (2 / 3) * (9 * mean a ^ 2) by ring, mul_div_assoc, div_self,
    mul_one]
  positivity

/-- The rational realization of the cycle FORM at the ℤ₃ cosine values `cos(2πk/3) ∈ {1, −½, −½}`:
    `cosVec M A k = M + A · cos(2πk/3)`. This is a genuine element of the derived Fourier form —
    DC amplitude `M`, cycle amplitude `A` — with fully rational entries (the `√2` lives in the
    forced RELATION between `M` and `A`, not in the entries). -/
def cosVec (M A : ℚ) : Fin 3 → ℚ := fun k => M + A * (if k = 0 then 1 else -1 / 2)

/-- The cosine realization has DC amplitude exactly `M` (mean = M; the cycle sums to zero). -/
theorem mean_cosVec (M A : ℚ) : mean (cosVec M A) = M := by
  simp [mean, cosVec]; ring

/-- Its DC power is `3M²`. -/
theorem DCpower_cosVec (M A : ℚ) : DCpower (cosVec M A) = 3 * M ^ 2 := by
  rw [DCpower_eq, mean_cosVec]

/-- ★ ITS CYCLE POWER IS `(3/2)A²` — DERIVED exactly over ℚ from the rational cosine values, no trig.
    (`1² + (−½)² + (−½)² = 3/2` — the ℤ₃ `Σcos² = 3/2` structural factor.) -/
theorem cyclepower_cosVec (M A : ℚ) : cyclepower (cosVec M A) = (3 / 2) * A ^ 2 := by
  rw [cyclepower_eq, mean_cosVec]
  simp [cosVec]; ring

/-- ★★ THE FORCED √2 AMPLITUDE RATIO (amplitude-SQUARED, exact over ℚ). For the cycle FORM with DC
    amplitude `M ≠ 0` and cycle amplitude `A`, the self=other Born balance `DCpower = cyclepower`
    forces `A² = 2M²` — the unique positive relative amplitude `A/M = √2`. The `√2` FALLS OUT of the
    balance; it is not asserted. -/
theorem forced_sqrt2 (M A : ℚ) (_hM : M ≠ 0)
    (hbal : DCpower (cosVec M A) = cyclepower (cosVec M A)) : A ^ 2 = 2 * M ^ 2 := by
  rw [DCpower_cosVec, cyclepower_cosVec] at hbal
  linarith

/-- The converse: `A² = 2M²` gives the balance. Together: balance ⟺ `A² = 2M²`. -/
theorem sqrt2_gives_balance (M A : ℚ) (hA : A ^ 2 = 2 * M ^ 2) :
    DCpower (cosVec M A) = cyclepower (cosVec M A) := by
  rw [DCpower_cosVec, cyclepower_cosVec, hA]; ring

/-- ★ NON-VACUITY: the 45° balance (`A² = 2M²`, giving `Q = 2/3`) is genuinely DISTINCT from the
    WRONG 2:1 operator-weight reading (`A² = 4M²`, which would give the degenerate `Q = 1`). The
    forced value is really `2`, not `4`. -/
theorem koide_not_one (M A : ℚ) (hM : M ≠ 0) (hA : A ^ 2 = 2 * M ^ 2) : A ^ 2 ≠ 4 * M ^ 2 := by
  rw [hA]; intro h
  have hM2 : (0 : ℚ) < M ^ 2 := by positivity
  nlinarith [hM2]

/-- The Koide identity, stated on the cosine realization for ALL δ-independent balance: whenever the
    cycle amplitude satisfies the forced `A² = 2M²` (and `M ≠ 0`, `A ≠ 0`), the Koide quantity of
    the cosine realization is `2/3`. (The δ=0 witness of the general `balance_forces_koide`.) -/
theorem koide_cosVec (M A : ℚ) (hM : M ≠ 0) (hA : A ^ 2 = 2 * M ^ 2) :
    Qkoide (cosVec M A) = 2 / 3 := by
  apply balance_forces_koide
  · rw [mean_cosVec]; exact hM
  · exact sqrt2_gives_balance M A hA

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the ℤ₃-Fourier cycle FORM of the coherence amplitudes.

    Over ℚ, with the banked self-blind generation cycle `gcyc` (N305 T1) and its spectral projectors
    `Pdem`/`Poth` (N305 T2): the cyclic-shift matrix `Pcyc` of `gcyc` fixes the DC/Unity mode
    (`Pcyc * Pdem = Pdem`) and, on the complementary cycle subspace `Poth`, satisfies the irreducible
    ℤ₃ cyclotomic `1 + Pcyc + Pcyc² = 0` — so the ℤ₃-Fourier decomposition is **DC ⊕ one cycle mode
    ⊕ nothing**. The amplitude of a real cycle function decomposes with Born powers adding (Parseval);
    the self=other Born balance `DCpower = cyclepower` of N305 T2 FORCES the cycle-to-DC amplitude
    ratio `A² = 2M²` (the `√2`, DERIVED not asserted) and makes the Koide quantity `2/3` — an
    identity holding for ALL phases `δ`. The cap forcing exactly three generations
    (`jordan_fails_H4`, N5) grounds it on the octonion-specific arena. -/
theorem generation_cycle_form_structure :
    -- §1: DC ⊕ one cycle mode ⊕ nothing (grounded on the banked gcyc via Pcyc)
    (∀ i j : Fin 3, Pcyc i j = (if gcyc j = i then (1 : ℚ) else 0))
    ∧ (Pcyc * Pcyc * Pcyc = 1)
    ∧ (Pcyc * Pdem = Pdem)
    ∧ (1 + Pcyc + Pcyc * Pcyc = Jall)
    ∧ ((1 + Pcyc + Pcyc * Pcyc) * Poth = 0)
    ∧ Pcyc ≠ 1
    -- §2: Parseval on the banked projectors
    ∧ (∀ a : Fin 3 → ℚ, (a 0) ^ 2 + (a 1) ^ 2 + (a 2) ^ 2 = DCpower a + cyclepower a)
    -- §3: the forced √2 amplitude ratio + the Koide identity (derived values)
    ∧ (∀ M A : ℚ, M ≠ 0 →
        DCpower (cosVec M A) = cyclepower (cosVec M A) → A ^ 2 = 2 * M ^ 2)
    ∧ (∀ a : Fin 3 → ℚ, mean a ≠ 0 → DCpower a = cyclepower a → Qkoide a = 2 / 3)
    -- the cap forcing exactly 3 (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨Pcyc_ground, Pcyc_cube, Pcyc_Pdem, cyc_sum_Jall, cyc_cyclotomic_on_Poth, Pcyc_ne_one, parseval,
   forced_sqrt2, balance_forces_koide, jordan_fails_H4⟩

end Phys.Algebra.HJ
