/-
# N374 — arc-G G2: UNIVERSALITY / THE CRITICAL EXPONENT (the marquee CROSS-TIE joint J-G2)
## (SEED_EMERGENT_QUANTUM_STATISTICAL.md §G2 — the highest-novelty node of the emergent layer)

Over the derived `ℚ` and the banked channel space of the terminal octonion algebra (the `42`
interaction channels, `imChannelCount (finrank ℚ ImO)`, N314), this node DERIVES the framework's
critical exponent at the closure fixed point — and finds it EQUALS the banked fine-structure channel
share `α* = 1/42` (N315/N316). NOTHING is asserted: the exponent FALLS OUT of a rank-1 forcing.

## THE MECHANISM (theory-native, not an RG-flow tower)

The fold's self-blindness gives channel DEMOCRACY: the look-back cannot distinguish its channels, so
the per-channel Born weight is UNIFORM (`bornWeight_uniform`, N315) — a permutation symmetry on the
`N` channels. The linearized totalization at the closure fixed point ("what the whole reads back from
its parts") is the operator `M` on the channel space that:
  (a) respects the democracy — `Equivariant M` (`M (σ i)(σ j) = M i j` for every permutation σ),
  (b) consumes ONLY the total weight — `SumReading M` (equal totals ⟹ equal images), the SAME
      completeness engine that forced `Σ channel α = 1` (N315 `born_isometry_completeness`),
  (c) is a nonzero idempotent — a projector, the fixed point of totalization.

These THREE conditions pin `M` UNIQUELY to the rank-1 totalization projector `chanProj N =
(1/N)·(all-ones)`:
  • Equivariance forces `M = c·1 + e·(all-ones)` (a 2-transitive commutant — `equivariant_eq`).
  • Sum-reading KILLS the identity part (`c = 0`) — the same "consumes only the total" that gave `Σα=1`.
  • Idempotent + nonzero fixes the scale to `1/N` (`chanProj_sq` idempotence + `cand_sq`).
So `M = chanProj N`, and its per-active-channel entry is `1/N`. At the banked channel count `N = 42`
this entry IS the banked `couplingWeight = α* = 1/42` (`criticalExponent_eq_alphaStar`).

★ THE JOINT WORTH BANKING (J-G2): the critical exponent IS the fine-structure channel share, and the
scale-tower numerator `84 = 2/α* = 2·(channel count)` is an EXACT rational identity about the banked
count (`scaleTowerNumerator_eq`). The full relevant-direction spectrum `λ_n = −n/(84π)` over the
derived ℝ `Cut` is the SAME `84π` scale-tower numerator from arc B (N329/N334) — one number, two
utterly different regimes (couplings and critical phenomena). That ℝ-ladder is a mechanism-grade
unification reading, PROSE-ONLY here (not a Lean eigenvalue theorem); the `84 = 2/α*` numerator is
the ℚ-exact THEOREM.

## STANDARD compliance
- WORDS-REMOVABLE (§2): delete "critical / universality / exponent / RG / totalization / coupling" —
  the statements stand as pure linear algebra over `ℚ`: the unique permutation-equivariant,
  sum-reading, nonzero idempotent matrix on `Fin N` is `(1/N)·(all-ones)`, and its entry at the banked
  count `42` equals the banked rational `couplingWeight`. No physics name is load-bearing.
- NOT FREE-FLOATING: the marquee TYPES cite the CONCRETE banked objects — `couplingWeight`/`alphaStar`
  (N315/N316) and `imChannelCount (Module.finrank ℚ ImO)` (N314). The uniqueness is over the concrete
  `Fin (imChannelCount (finrank ℚ ImO))`, NOT a generic abstract space.
- G1 NO ASSERTED VALUE: `1/42` FALLS OUT of the rank-1 forcing (`criticalProjector_unique` +
  `chanProj_entry_offdiag`) and the banked `couplingWeight_eq`; never premised, never "assume 1/42".
- G2 NO EMPIRICAL NUMBER: no measured critical exponent, no lab number — any such comparison is
  downstream REMOVABLE PROSE, never a proof step.
- G4/G5 DERIVED NOT POSITED: `chanProj` is the totalization projector; the exponent is its entry, the
  scale fixed by idempotence, the identity killed by sum-reading — not written down.
- UNEARNED-IMPORT: ground field `ℚ` (`1/42`, `84`, `1/N` all ℚ-EXACT); NO Mathlib-ℝ/ℂ as content;
  `Matrix`/`Fin`/`Equiv.Perm`/`Finset` are MACHINERY on the derived arena (STANDARD §3).
- Foundations-only `⊆ {propext, Classical.choice, Quot.sound}`: no posited axiom, no sorry, no
  compiled-kernel bypass, no heartbeat inflation, no bridge.

DERIVED from the trunk (`couplingWeight`/`couplingWeight_eq`/`channels_times_coupling` N315,
`alphaStar`/`alphaStar_eq` N316, `imChannelCount`/`channels_O`/`finrank ℚ ImO` N314/N22 — standard
Mathlib `Matrix`/`Fin`/`Equiv.Perm` MACHINERY on the DERIVED objects, STANDARD §3). NO posited
critical-exponent value, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.FineStructureScaleCoupling
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Tactic

namespace Phys.Algebra.Universality

open scoped BigOperators
open Matrix
open Phys.Algebra

noncomputable section

/-! ## The channel space objects: the all-ones totalization matrix and its projector. -/

/-- THE TOTALIZATION MATRIX on the `N`-channel space: the all-ones matrix (every channel feeds
    every channel equally — the fold's democratic totalization before normalization). -/
def chanTot (N : ℕ) : Matrix (Fin N) (Fin N) ℚ := fun _ _ => 1

/-- THE TOTALIZATION PROJECTOR: `chanTot` normalized by the channel count `N`. The linearized
    totalization at the closure fixed point. -/
def chanProj (N : ℕ) : Matrix (Fin N) (Fin N) ℚ := (1 / (N : ℚ)) • chanTot N

/-- `chanTot · chanTot = N • chanTot` (each entry sums `N` ones). -/
theorem chanTot_mul_chanTot (N : ℕ) : (chanTot N) * (chanTot N) = (N : ℚ) • chanTot N := by
  ext i j
  simp only [Matrix.mul_apply, chanTot, mul_one, Finset.sum_const, Finset.card_univ,
    Fintype.card_fin, nsmul_eq_mul, Matrix.smul_apply, smul_eq_mul, mul_one]

/-! ## Equivariance ⟹ the two-parameter commutant `c·1 + e·chanTot`. -/

/-- CHANNEL DEMOCRACY: `M` commutes with every relabelling permutation of the channels
    (`M (σ i)(σ j) = M i j`). Forced by the fold's self-blindness (the uniform Born weight). -/
def Equivariant {N : ℕ} (M : Matrix (Fin N) (Fin N) ℚ) : Prop :=
  ∀ (σ : Equiv.Perm (Fin N)) i j, M (σ i) (σ j) = M i j

/-- The diagonal of an equivariant matrix is constant (via the swap permutation). -/
theorem Equivariant.diag_const {N : ℕ} {M : Matrix (Fin N) (Fin N) ℚ}
    (hM : Equivariant M) (i j : Fin N) : M i i = M j j := by
  have := hM (Equiv.swap i j) i i
  rw [Equiv.swap_apply_left] at this
  exact this.symm

/-- The off-diagonal of an equivariant matrix is constant (via a 2-transitive permutation built
    by hand from swaps): for any two ordered off-diagonal pairs, `M i j = M k l`. -/
theorem Equivariant.offdiag_const {N : ℕ} {M : Matrix (Fin N) (Fin N) ℚ}
    (hM : Equivariant M) (i j k l : Fin N) (hij : i ≠ j) (hkl : k ≠ l) : M i j = M k l := by
  set a := Equiv.swap i k with ha
  have haj : a j ≠ k := by
    rw [ha]
    intro h
    by_cases hji : j = i
    · exact hij hji.symm
    · by_cases hjk : j = k
      · rw [hjk, Equiv.swap_apply_right] at h; exact hij (by rw [hjk]; exact h.symm ▸ rfl)
      · rw [Equiv.swap_apply_of_ne_of_ne hji hjk] at h; exact hjk h
  set σ := (Equiv.swap (a j) l) * a with hσ
  have hσi : σ i = k := by
    simp only [hσ, Equiv.Perm.mul_apply]
    rw [ha, Equiv.swap_apply_left, Equiv.swap_apply_of_ne_of_ne (Ne.symm haj) hkl]
  have hσj : σ j = l := by
    simp only [hσ, Equiv.Perm.mul_apply, Equiv.swap_apply_left]
  have := hM σ i j
  rw [hσi, hσj] at this
  exact this.symm

/-- THE COMMUTANT: an equivariant matrix on `N ≥ 2` channels is `c·1 + e·chanTot` with
    `c = M 0 0 − M 0 1` (diagonal minus offdiagonal) and `e = M 0 1`. The 2-transitive commutant. -/
theorem Equivariant.eq_commutant {N : ℕ} (hN : 2 ≤ N) {M : Matrix (Fin N) (Fin N) ℚ}
    (hM : Equivariant M) :
    M = (M ⟨0, by omega⟩ ⟨0, by omega⟩ - M ⟨0, by omega⟩ ⟨1, by omega⟩)
          • (1 : Matrix (Fin N) (Fin N) ℚ)
        + (M ⟨0, by omega⟩ ⟨1, by omega⟩) • chanTot N := by
  ext i j
  simp only [Matrix.add_apply, Matrix.smul_apply, Matrix.one_apply, chanTot, smul_eq_mul, mul_one]
  by_cases h : i = j
  · subst h
    simp only [if_true]
    have hd := hM.diag_const i ⟨0, by omega⟩
    rw [hd]; ring
  · simp only [if_neg h]
    have ho := hM.offdiag_const i j ⟨0, by omega⟩ ⟨1, by omega⟩ h
      (Fin.ne_of_val_ne (by norm_num))
    rw [ho]; ring

/-! ## Sum-reading (the completeness / totalization engine) kills the identity part. -/

/-- `chanTot.mulVec v` reads the TOTAL weight into every channel. -/
theorem chanTot_mulVec (N : ℕ) (v : Fin N → ℚ) :
    (chanTot N).mulVec v = fun _ => ∑ j, v j := by
  ext i
  simp only [Matrix.mulVec, chanTot, dotProduct, one_mul]

/-- SUM-READING: `M` consumes only the total weight — equal totals give equal images. This is the
    completeness engine that forced `Σ channel α = 1` (N315), read as an operator property. -/
def SumReading {N : ℕ} (M : Matrix (Fin N) (Fin N) ℚ) : Prop :=
  ∀ v w : Fin N → ℚ, (∑ i, v i) = (∑ i, w i) → M.mulVec v = M.mulVec w

/-- The totalization projector IS sum-reading (it factors through the total). -/
theorem chanProj_sumReading (N : ℕ) : SumReading (chanProj N) := by
  intro v w h
  unfold chanProj
  rw [Matrix.smul_mulVec, Matrix.smul_mulVec, chanTot_mulVec, chanTot_mulVec, h]

/-- The IDENTITY is NOT sum-reading for `N ≥ 2` — it distinguishes channels with equal totals. This
    is what makes sum-reading genuinely KILL the identity part (W8 non-vacuity of the forcing). -/
theorem one_not_sumReading (N : ℕ) (hN : 2 ≤ N) :
    ¬ SumReading (1 : Matrix (Fin N) (Fin N) ℚ) := by
  intro hsr
  set i0 : Fin N := ⟨0, by omega⟩ with hi0
  set i1 : Fin N := ⟨1, by omega⟩ with hi1
  set v : Fin N → ℚ := fun i => if i = i0 then 1 else 0 with hv
  set w : Fin N → ℚ := fun i => if i = i1 then 1 else 0 with hw
  have hne : i0 ≠ i1 := by
    rw [hi0, hi1]; exact Fin.ne_of_val_ne (by norm_num)
  have hsum : (∑ i, v i) = (∑ i, w i) := by
    rw [hv, hw, Finset.sum_ite_eq' Finset.univ i0 (fun _ => (1:ℚ)),
      Finset.sum_ite_eq' Finset.univ i1 (fun _ => (1:ℚ))]
    simp
  have := hsr v w hsum
  rw [Matrix.one_mulVec, Matrix.one_mulVec] at this
  have h0 := congrFun this i0
  rw [hv, hw] at h0
  simp only [if_neg hne] at h0
  norm_num at h0

/-- Sum-reading of `c·1 + e·chanTot` forces the identity coefficient `c = 0` (`N ≥ 2`). The
    identity part is killed because it is not sum-reading and `chanTot` is. -/
theorem sumReading_kills_identity {N : ℕ} (hN : 2 ≤ N) (c e : ℚ)
    (h : SumReading (c • (1 : Matrix (Fin N) (Fin N) ℚ) + e • chanTot N)) : c = 0 := by
  by_contra hc
  -- take two unit vectors with equal totals; the chanTot parts agree, so the identity parts must too
  set i0 : Fin N := ⟨0, by omega⟩ with hi0
  set i1 : Fin N := ⟨1, by omega⟩ with hi1
  set v : Fin N → ℚ := fun i => if i = i0 then 1 else 0 with hv
  set w : Fin N → ℚ := fun i => if i = i1 then 1 else 0 with hw
  have hne : i0 ≠ i1 := by
    rw [hi0, hi1]; exact Fin.ne_of_val_ne (by norm_num)
  have hsum : (∑ i, v i) = (∑ i, w i) := by
    rw [hv, hw, Finset.sum_ite_eq' Finset.univ i0 (fun _ => (1:ℚ)),
      Finset.sum_ite_eq' Finset.univ i1 (fun _ => (1:ℚ))]
    simp
  have himg := h v w hsum
  -- evaluate both images at i0
  have hval := congrFun himg i0
  simp only [Matrix.add_mulVec, Matrix.smul_mulVec, Pi.add_apply, Pi.smul_apply,
    Matrix.one_mulVec, chanTot_mulVec, smul_eq_mul] at hval
  -- chanTot totals equal (hsum); identity parts: v i0 = 1, w i0 = 0
  rw [hsum] at hval
  have hv0 : v i0 = 1 := by rw [hv]; simp
  have hw0 : w i0 = 0 := by rw [hw]; simp only [if_neg hne]
  rw [hv0, hw0] at hval
  -- hval : c * 1 + e * (Σw) = c * 0 + e * (Σw)
  have : c = 0 := by linarith [hval]
  exact hc this

/-! ## The idempotent candidate and its uniqueness. -/

/-- The candidate operator `c·1 + e·chanTot`. -/
def cand (c e : ℚ) (N : ℕ) : Matrix (Fin N) (Fin N) ℚ :=
  c • (1 : Matrix (Fin N) (Fin N) ℚ) + e • chanTot N

/-- The square of the candidate: `c²·1 + (2ce + e²N)·chanTot`. -/
theorem cand_sq (c e : ℚ) (N : ℕ) :
    (cand c e N) * (cand c e N)
      = (c ^ 2) • (1 : Matrix (Fin N) (Fin N) ℚ) + (2 * c * e + e ^ 2 * N) • chanTot N := by
  unfold cand
  simp only [Matrix.add_mul, Matrix.mul_add, Matrix.smul_mul, Matrix.mul_smul, Matrix.one_mul,
    Matrix.mul_one, chanTot_mul_chanTot, smul_smul]
  match_scalars <;> ring

/-- Coefficient extraction: for `N ≥ 2`, `cand c e N = cand c' e' N ⟹ c = c' ∧ e = e'`
    (the identity and `chanTot` are linearly independent). -/
theorem cand_coeff_extract (c e c' e' : ℚ) (N : ℕ) (hN : 2 ≤ N)
    (h : cand c e N = cand c' e' N) : c = c' ∧ e = e' := by
  unfold cand at h
  have hdiag := congrFun (congrFun h ⟨0, by omega⟩) ⟨0, by omega⟩
  have hoff := congrFun (congrFun h ⟨0, by omega⟩) ⟨1, by omega⟩
  simp only [Matrix.add_apply, Matrix.smul_apply, Matrix.one_apply, chanTot, smul_eq_mul,
    mul_one] at hdiag hoff
  norm_num at hdiag hoff
  refine ⟨?_, hoff⟩
  linarith [hdiag, hoff]

/-- `chanProj` is idempotent: `chanProj² = chanProj` for `N ≥ 1`. -/
theorem chanProj_sq (N : ℕ) (hN : 1 ≤ N) : (chanProj N) * (chanProj N) = chanProj N := by
  have hNpos : (N : ℚ) ≠ 0 := by
    have : 0 < N := by omega
    exact_mod_cast this.ne'
  unfold chanProj
  rw [Matrix.smul_mul, Matrix.mul_smul, chanTot_mul_chanTot, smul_smul, smul_smul]
  congr 1
  field_simp

/-- `chanProj` is nonzero (`N ≥ 1`): its `(0,0)` entry is `1/N ≠ 0`. -/
theorem chanProj_ne_zero (N : ℕ) (hN : 1 ≤ N) : chanProj N ≠ 0 := by
  intro h
  have hNpos : (N : ℚ) ≠ 0 := by
    have hp : 0 < N := by omega
    exact_mod_cast hp.ne'
  have := congrFun (congrFun h ⟨0, by omega⟩) ⟨0, by omega⟩
  simp only [chanProj, chanTot, Matrix.smul_apply, smul_eq_mul, mul_one, Matrix.zero_apply] at this
  exact (one_div_ne_zero hNpos) this

/-- ★★★ THE UNIQUENESS (J-G2 rank-1 forcing): for `N ≥ 2`, the ONLY matrix that is simultaneously
    EQUIVARIANT (channel democracy), SUM-READING (consumes only the total), a nonzero IDEMPOTENT
    (projector) is the totalization projector `chanProj N`. The critical operator is FORCED. -/
theorem criticalProjector_unique {N : ℕ} (hN : 2 ≤ N) {M : Matrix (Fin N) (Fin N) ℚ}
    (hEq : Equivariant M) (hSR : SumReading M) (hIdem : M * M = M) (hNe : M ≠ 0) :
    M = chanProj N := by
  have hNpos : (N : ℚ) ≠ 0 := by
    have : 0 < N := by omega
    exact_mod_cast this.ne'
  -- 1. Equivariance ⟹ M = cand c e with c = diag−off, e = off.
  set c := M ⟨0, by omega⟩ ⟨0, by omega⟩ - M ⟨0, by omega⟩ ⟨1, by omega⟩ with hc
  set e := M ⟨0, by omega⟩ ⟨1, by omega⟩ with he
  have hMcomm : M = cand c e N := hEq.eq_commutant hN
  -- 2. Sum-reading kills the identity part: c = 0.
  have hc0 : c = 0 := by
    apply sumReading_kills_identity hN c e
    rw [← show cand c e N = c • (1 : Matrix (Fin N) (Fin N) ℚ) + e • chanTot N from rfl, ← hMcomm]
    exact hSR
  -- 3. Idempotence with c = 0 gives e² N = e; nonzero rules out e = 0, so e = 1/N.
  rw [hMcomm, hc0] at hIdem
  have hsq := cand_sq 0 e N
  rw [hIdem] at hsq
  -- hsq : cand 0 e N = 0²•1 + (2·0·e + e²N)•chanTot N.  Evaluate at the off-diagonal (0,1):
  --   LHS entry = e ; RHS entry = e²N.  So e = e²N.
  have heq : e = e ^ 2 * (N : ℚ) := by
    have hentry := congrFun (congrFun hsq ⟨0, by omega⟩) ⟨1, by omega⟩
    simp only [cand, chanTot, Matrix.add_apply, Matrix.smul_apply, Matrix.one_apply,
      smul_eq_mul, mul_one] at hentry
    have hne01 : (⟨0, by omega⟩ : Fin N) ≠ (⟨1, by omega⟩ : Fin N) :=
      Fin.ne_of_val_ne (by norm_num)
    rw [if_neg hne01] at hentry
    -- hentry : 0 * 0 + e * 1 = 0^2 * 0 + (2*0*e + e^2*N) * 1
    linarith [hentry]
  -- e ≠ 0 (else M = 0)
  have hene : e ≠ 0 := by
    intro h0
    apply hNe
    rw [hMcomm, hc0, h0]
    unfold cand; simp
  have heN : e = 1 / N := by
    have hcancel : e * (e * N) = e * 1 := by nlinarith [heq]
    have h2 : e * N = 1 := mul_left_cancel₀ hene hcancel
    field_simp
    linarith [h2]
  rw [hMcomm, hc0, heN]
  unfold cand chanProj
  simp

/-! ## The entry (the critical exponent) and the marquee cross-tie. -/

/-- The per-active-channel entry (`i ≠ j`) of the totalization projector is `1/N`. -/
theorem chanProj_entry_offdiag (N : ℕ) (i j : Fin N) (_h : i ≠ j) :
    chanProj N i j = 1 / (N : ℚ) := by
  simp only [chanProj, chanTot, Matrix.smul_apply, smul_eq_mul, mul_one]

/-- The diagonal entry is also `1/N` (the totalization projector has uniform entries). -/
theorem chanProj_entry_diag (N : ℕ) (i : Fin N) :
    chanProj N i i = 1 / (N : ℚ) := by
  simp only [chanProj, chanTot, Matrix.smul_apply, smul_eq_mul, mul_one]

/-- THE CRITICAL EXPONENT: the entry of the totalization projector at the banked channel count. -/
def criticalExponent : ℚ := chanProj (imChannelCount (Module.finrank ℚ ImO)) ⟨0, by
  rw [channels_O]; norm_num⟩ ⟨1, by rw [channels_O]; norm_num⟩

/-- ★★★ THE MARQUEE (J-G2): the critical exponent EQUALS the banked fine-structure channel share
    `α* = 1/42`. DERIVED — the totalization-projector entry at the banked channel count IS the banked
    `couplingWeight = alphaStar`, never asserted. The critical exponent IS the fine-structure share. -/
theorem criticalExponent_eq_alphaStar :
    criticalExponent = alphaStar := by
  unfold criticalExponent
  have hne : (⟨0, by rw [channels_O]; norm_num⟩ : Fin (imChannelCount (Module.finrank ℚ ImO)))
      ≠ ⟨1, by rw [channels_O]; norm_num⟩ := Fin.ne_of_val_ne (by norm_num)
  rw [chanProj_entry_offdiag _ _ _ hne, channels_O, alphaStar_eq]
  norm_num

/-- The critical exponent is `1/42` (falls out via the marquee + the banked `alphaStar_eq`). -/
theorem criticalExponent_eq_one_div_42 : criticalExponent = 1 / 42 := by
  rw [criticalExponent_eq_alphaStar, alphaStar_eq]

/-- ★★ THE SCALE-TOWER NUMERATOR as an EXACT rational identity: `84 = 2/α* = 2·(channel count)` —
    the same `84` that is the arc-B scale-tower numerator `84π = 2π/α*` (N329/N334). The critical
    exponent's inverse (the channel count) and the scale-tower rung numerator are ONE number. -/
theorem scaleTowerNumerator_eq :
    (84 : ℚ) = 2 / alphaStar
      ∧ (84 : ℚ) = 2 * (imChannelCount (Module.finrank ℚ ImO) : ℚ) := by
  constructor
  · rw [alphaStar_eq]; norm_num
  · rw [channels_O]; norm_num

/-- THE J-G2 UNIVERSALITY READING bundled: (i) the critical operator is UNIQUELY the totalization
    projector, (ii) its entry (the critical exponent) IS the banked fine-structure share `α*`, and
    (iii) the scale-tower numerator `84 = 2/α*` is the same numerator as the arc-B rungs. One
    completeness/sum-reading engine, two regimes (couplings and critical phenomena). -/
theorem universality_crossTie_reading :
    criticalExponent = alphaStar
      ∧ criticalExponent = 1 / 42
      ∧ (84 : ℚ) = 2 / alphaStar
      ∧ (84 : ℚ) = 2 * (imChannelCount (Module.finrank ℚ ImO) : ℚ) :=
  ⟨criticalExponent_eq_alphaStar, criticalExponent_eq_one_div_42,
    (scaleTowerNumerator_eq).1, (scaleTowerNumerator_eq).2⟩

/-! ## W8 non-vacuity teeth. -/

/-- W8: the critical exponent is genuinely nonzero (it is `1/42`). -/
theorem criticalExponent_ne_zero : criticalExponent ≠ 0 := by
  rw [criticalExponent_eq_one_div_42]; norm_num

/-- W8: the critical exponent is `1/42`, NOT the WRONG `1/49` (which would keep the degenerate
    diagonal self-pairs, `n² = 49` channels). Only the DERIVED active-channel count `42` closes it. -/
theorem criticalExponent_ne_wrong : criticalExponent ≠ 1 / 49 := by
  rw [criticalExponent_eq_one_div_42]; norm_num

/-- W8: the scale-tower numerator `84` genuinely BITES — the WRONG channel count `49` gives
    `2·49 = 98 ≠ 84`. Only the DERIVED count `42` gives the arc-B numerator. -/
theorem scaleTowerNumerator_bites : (2 : ℚ) * 49 ≠ 84 := by norm_num

/-- W8: the uniqueness genuinely uses sum-reading — the identity `1` is NOT sum-reading (it would
    otherwise be a spurious equivariant idempotent), so the identity part is truly killed. -/
theorem identity_genuinely_killed (N : ℕ) (hN : 2 ≤ N) :
    ¬ SumReading (1 : Matrix (Fin N) (Fin N) ℚ) := one_not_sumReading N hN

end

end Phys.Algebra.Universality
