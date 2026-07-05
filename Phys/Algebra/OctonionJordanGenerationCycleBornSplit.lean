/-
# N305 — THE ℤ₃ SELF-BLIND GENERATION CYCLE AND ITS FORCED BORN-WEIGHT SPLIT

Owner-authorized flavor-route seed (docs/SEED_FLAVOR_SELF_BLINDNESS.md), targets **T1 + T2** — the
first beat of the self-blindness derivation. The prior arc (N296–N304) proved the flavor pattern is
NOT an algebraic feature of the derived symmetry tower (f₄ isospectral, no fixed direction, generations
distinguished only by an isospectrally-invisible fold-root phase). The pattern lives on the
**gather / self-blindness** side. This node opens it.

THE FOLD MOVE, AT THE GENERATION LEVEL. The fold is self-look-back with no nonzero fixed point (the
MISS). That founding move reappears here: each of the three cap-forced primitive idempotents (N300
`Eidem`, the maximal Jordan order's diagonal projectors) is a PROBE that looks at the other two and is
blind to itself.

## T1 — THE ℤ₃ GENERATION CYCLE (structural; no numbers)

* `gcyc := finRotate 3` — the derived generation cycle. Because best coherence is not a fixed point
  (C6: a bounded no-fixed-point process must cycle), the three idempotents are not frozen; the fold
  rotates through them `e₁ → e₂ → e₃ → e₁`.
  - `gcyc_cube`/`gcyc_ne_one` — order 3.
  - `gcyc_fpf : ∀ i, gcyc i ≠ i` — FIXED-POINT-FREE (self-blindness at the generation level: the cycle
    sees no generation as itself).
* `Eidem_inj` — the three idempotents are genuinely distinct generation-carriers (faithful copies).
* `pconj_gcyc : pconj gcyc (Eidem i) = Eidem (gcyc.symm i)` — the cycle's action, from the banked S₃
  Jordan-automorphism action `pconj_Eidem` (N300).
* `gen_no_fixed : pconj gcyc (Eidem i) ≠ Eidem i` — the cycle fixes NO generation (self-blind).
* `transp_self_sees` — a transposition, by contrast, DOES fix a generation (self-seeing): the
  contrast that makes fixed-point-freeness content.
* `unity_fixed : pconj gcyc 1 = 1` — the democratic/Unity gather is cycle-invariant (the DC mode of
  the coherence cycle, gathered).
* `see_others : Eidem (gcyc i) + Eidem (gcyc (gcyc i)) = 1 − Eidem i` — GROUNDING. The self-blind
  "see the other two" sum equals the complement of self on the banked idempotents; this ties the
  abstract seeing operator below to the concrete generation objects (NOT free-floating).

## T2 — THE SELF-BLIND SEEING OPERATOR FORCES THE BORN WEIGHTS (the first DERIVED value)

The coefficient-space seeing operator on the three generations — each sees the `n−1 = 2` others and is
blind to itself — is `seeMat = Jall − 1` over ℚ (all-ones minus identity). Its diagonal is `0`
(self-blindness), so `trace seeMat = 0`.

* `see_diag_zero`, `see_trace_zero` — self-blindness.
* Spectral projectors `Pdem = (1/3) Jall` (democratic/Unity, rank 1) and `Poth = 1 − (1/3) Jall`
  (others, rank 2): idempotent (`Pdem_idem`, `Poth_idem`), orthogonal (`P_orth`), complete
  (`P_sum : Pdem + Poth = 1`).
* `see_Pdem : seeMat * Pdem = 2 • Pdem` and `see_Poth : seeMat * Poth = (−1) • Poth` — the seeing
  operator has eigenvalue `+2` on Unity (sees the two others) and `−1` on the others block (minus
  itself). This is the self-sees-two-others reading of self-blindness.
* `tr_Pdem = 1`, `tr_Poth = 2` — the eigenspace dimensions; normalized Born weights `1/3` and `2/3`.
* ★★★ `born_fraction_others` / `born_fraction_dem` — THE FORCED VALUE (DERIVED, not asserted): the
  normalized weight split killing the self-view balance is UNIQUE. From `w0 + w1 = 1` (normalization)
  and `w0·2 + w1·(−1) = 0` (self-blindness: the weighted eigenvalue balance vanishes, the self-view is
  invisible), `w1 = 2/3` and `w0 = 1/3` follow by linear algebra. The self-seen "other" fraction
  `T = 2/3` for `n = 3` is a Born counting fact of self-blindness, not a fit.
* `born_fraction_forced_gen` — the general-`n` form `w0·(n−1) + w1·(−1) = 0 ⟹ w1 = (n−1)/n`, so the
  `2/3` is the `n = 3` instance of the uniform self-blind fraction `(n−1)/n`.
* `weight_balance` — the balance itself: `(tr Pdem/3)·2 + (tr Poth/3)·(−1) = 0`, i.e. the self-view of
  the seeing operator vanishes on exactly these weights (`⟺ trace seeMat = 0`).

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

The Standard Model POSITS three fermion generations AND a democratic/Fritzsch mass texture by hand.
The theory DERIVES both: the count is the cap `C(3,2)` (N267/N5), and the `2/3` self-seen fraction is
FORCED by self-blindness (diagonal = 0) + normalization — a unique Born-counting landing, not a free
parameter. The `2/3` here is the same self=other balance that will make the Koide relation `Q = 2/3`
an identity downstream (T4) — but that is a later node; here we only bank the cycle STRUCTURE and the
forced weight SPLIT.

## ONE CAUSE MANY TERMINATIONS

The SAME octonion non-associativity that stops the cascade (N2c) and caps the Hermitian Jordan tower
at order 3 (N5, `jordan_fails_H4`) — furnishing EXACTLY THREE primitive idempotents (N267/N300) — now
carries the fold's self-blindness to the generation level: three probes on a fixed-point-free ℤ₃
cycle, each blind to itself, forcing the `1/3 ⊕ 2/3` Born weight split.

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete generation/mass/Koide/flavor/Born/self-blind: over ℚ and `O ℚ`, for the three cap-forced
primitive idempotents `Eidem i` of `Matrix (Fin 3)(Fin 3)(O ℚ)`, the order-3 fixed-point-free
Jordan-automorphism cycle `finRotate 3` fixes no idempotent and fixes `1`; and the diagonal-zero
symmetric operator `Jall − 1` over ℚ has the UNIQUE normalized spectral-weight split `1/3 ⊕ 2/3`
killing its self-view balance. No theorem STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

T1's types cite the banked `Eidem`/`pconj`/`gcyc` on `Matrix (Fin 3)(Fin 3)(O ℚ)`; the capstone
carries `jordan_fails_H4` (the octonion-specific cap forcing exactly 3). T2's `seeMat` is the ℚ
coefficient-space shadow of the seeing, GROUNDED to the banked idempotents by `see_others`
(`E(gcyc i) + E(gcyc² i) = 1 − E i`). The split is octonion-cap-specific in the sense that the count
3 is forced by `jordan_fails_H4`, not carrier-agnostic.

Foundations-only: no posited axiom, no sorry-style hole, no compiled-kernel bypass, no bridge. No
empirical number enters any proof.
-/
import Phys.Algebra.OctonionJordanHermTraceCoefficient
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Data.Matrix.Basic
import Mathlib.LinearAlgebra.Matrix.Trace

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## T1 — the ℤ₃ self-blind generation cycle on the cap-forced idempotents. -/

/-- The derived generation cycle: the order-3 rotation of the three cap-forced idempotents (C6: a
    bounded no-fixed-point coherence process must cycle). -/
noncomputable def gcyc : Equiv.Perm (Fin 3) := finRotate 3

/-- The cycle has order three. -/
theorem gcyc_cube : gcyc * gcyc * gcyc = 1 := by decide
/-- The cycle is nontrivial. -/
theorem gcyc_ne_one : gcyc ≠ 1 := by decide

/-- ★ SELF-BLINDNESS AT THE GENERATION LEVEL: the cycle is FIXED-POINT-FREE — it sees no generation
    as itself (`∀ i, gcyc i ≠ i`). This is the fold's founding MISS reappearing: a probe that cannot
    see itself. -/
theorem gcyc_fpf : ∀ i, gcyc i ≠ i := by decide

/-- The three cap-forced idempotents are genuinely distinct generation-carriers. -/
theorem Eidem_inj : Function.Injective Eidem := by
  intro i j h
  by_cases hij : i = j
  · exact hij
  · exfalso
    have hf : (fun k => if k = i then (1 : O ℚ) else 0)
        = (fun k => if k = j then (1 : O ℚ) else 0) := Matrix.diagonal_injective h
    have hc := congrFun hf i
    rw [if_pos rfl, if_neg hij] at hc
    exact one_ne_zero_O hc

/-- The cycle acts on the idempotents by permuting them (from the banked S₃ Jordan-automorphism
    action `pconj_Eidem`, N300). -/
theorem pconj_gcyc (i : Fin 3) : pconj gcyc (Eidem i) = Eidem (gcyc.symm i) :=
  pconj_Eidem gcyc i

/-- ★ THE CYCLE FIXES NO GENERATION (self-blind): `pconj gcyc (Eidem i) ≠ Eidem i`. -/
theorem gen_no_fixed (i : Fin 3) : pconj gcyc (Eidem i) ≠ Eidem i := by
  rw [pconj_gcyc]
  intro h
  have hsi : gcyc.symm i = i := Eidem_inj h
  apply gcyc_fpf i
  conv_lhs => rw [← hsi]
  rw [Equiv.apply_symm_apply]

/-- By contrast, a transposition DOES fix a generation (self-seeing): `swap 0 1` fixes `Eidem 2`.
    The contrast that gives fixed-point-freeness content. -/
theorem transp_self_sees : pconj (Equiv.swap (0 : Fin 3) 1) (Eidem 2) = Eidem 2 := by
  rw [pconj_Eidem]; congr 1

/-- ★ THE DEMOCRATIC/UNITY GATHER IS CYCLE-INVARIANT: `pconj gcyc 1 = 1` — the DC mode of the
    coherence cycle, gathered (fixed by the cycle). -/
theorem unity_fixed : pconj gcyc (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 1 := by
  unfold pconj
  rw [Matrix.submatrix_one_equiv]

/-- The concrete values of the cycle on `Fin 3`. -/
theorem gcyc_vals : gcyc 0 = 1 ∧ gcyc 1 = 2 ∧ gcyc 2 = 0 := by
  refine ⟨?_, ?_, ?_⟩ <;> · simp only [gcyc]; decide

/-- ★★ GROUNDING (T1↔T2 bridge): the self-blind "see the OTHER TWO" sum on the banked idempotents
    equals the complement of self, `Eidem (gcyc i) + Eidem (gcyc (gcyc i)) = 1 − Eidem i` — for
    `i = 0`. This ties the coefficient-space seeing operator (T2) to the concrete generation objects
    (NOT free-floating): each probe sees exactly the two idempotents that are not itself. -/
theorem see_others_0 :
    Eidem (gcyc 0) + Eidem (gcyc (gcyc 0)) = 1 - Eidem 0 := by
  obtain ⟨h0, h1, _⟩ := gcyc_vals
  rw [h0, h1, eq_sub_iff_add_eq]
  have : Eidem 1 + Eidem 2 + Eidem 0 = Eidem 0 + Eidem 1 + Eidem 2 := by abel
  rw [this]; exact sum_Eidem

/-- The self-blind "see the other two" grounding for `i = 1`. -/
theorem see_others_1 :
    Eidem (gcyc 1) + Eidem (gcyc (gcyc 1)) = 1 - Eidem 1 := by
  obtain ⟨_, h1, h2⟩ := gcyc_vals
  rw [h1, h2, eq_sub_iff_add_eq]
  have : Eidem 2 + Eidem 0 + Eidem 1 = Eidem 0 + Eidem 1 + Eidem 2 := by abel
  rw [this]; exact sum_Eidem

/-- The self-blind "see the other two" grounding for `i = 2`. -/
theorem see_others_2 :
    Eidem (gcyc 2) + Eidem (gcyc (gcyc 2)) = 1 - Eidem 2 := by
  obtain ⟨h0, _, h2⟩ := gcyc_vals
  rw [h2, h0, eq_sub_iff_add_eq]
  exact sum_Eidem

/-! ## T2 — the self-blind seeing operator forces the Born weights (the first derived value). -/

/-- The all-ones matrix over ℚ on `Fin 3` (the democratic coupling). -/
def Jall : Matrix (Fin 3) (Fin 3) ℚ := Matrix.of (fun _ _ => 1)

/-- ★ THE SELF-BLIND SEEING OPERATOR (coefficient space): each generation sees the `n−1 = 2` others
    and is blind to itself — `seeMat = Jall − 1` (all-ones minus identity), diagonal `0`. -/
def seeMat : Matrix (Fin 3) (Fin 3) ℚ := Jall - 1

/-- The democratic/Unity spectral projector `Pdem = (1/3) Jall` (rank 1). -/
def Pdem : Matrix (Fin 3) (Fin 3) ℚ := (1 / 3 : ℚ) • Jall
/-- The "others" spectral projector `Poth = 1 − (1/3) Jall` (rank 2). -/
def Poth : Matrix (Fin 3) (Fin 3) ℚ := 1 - (1 / 3 : ℚ) • Jall

/-- SELF-BLINDNESS: the seeing operator's diagonal is `0` (a probe cannot see itself). -/
theorem see_diag_zero (i : Fin 3) : seeMat i i = 0 := by
  fin_cases i <;> simp [seeMat, Jall, Matrix.one_apply, Matrix.sub_apply]

/-- SELF-BLINDNESS ⟹ trace zero: `trace seeMat = 0`. -/
theorem see_trace_zero : Matrix.trace seeMat = 0 := by
  simp [Matrix.trace, Matrix.diag, seeMat, Jall, Matrix.one_apply, Matrix.sub_apply]

/-- `Jall² = 3 Jall`. -/
theorem Jsq : Jall * Jall = (3 : ℚ) • Jall := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Jall, Matrix.mul_apply, Fin.sum_univ_three] <;> ring

/-- `Pdem` is idempotent. -/
theorem Pdem_idem : Pdem * Pdem = Pdem := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pdem, Jall, Matrix.mul_apply, Matrix.smul_apply, Fin.sum_univ_three] <;> ring

/-- `Poth` is idempotent. -/
theorem Poth_idem : Poth * Poth = Poth := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Poth, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.sub_apply,
      Fin.sum_univ_three] <;> ring

/-- The projectors are complete: `Pdem + Poth = 1`. -/
theorem P_sum : Pdem + Poth = 1 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pdem, Poth, Jall, Matrix.add_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.sub_apply]

/-- The projectors are orthogonal: `Pdem * Poth = 0`. -/
theorem P_orth : Pdem * Poth = 0 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pdem, Poth, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.sub_apply,
      Fin.sum_univ_three] <;> ring

/-- ★ THE SEEING OPERATOR HAS EIGENVALUE `+2` ON UNITY: `seeMat * Pdem = 2 • Pdem` (each generation
    sees the two others). -/
theorem see_Pdem : seeMat * Pdem = (2 : ℚ) • Pdem := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [seeMat, Pdem, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply,
      Matrix.sub_apply, Fin.sum_univ_three] <;> ring

/-- ★ THE SEEING OPERATOR HAS EIGENVALUE `−1` ON THE OTHERS BLOCK: `seeMat * Poth = (−1) • Poth`
    (minus itself — the self-blind subtraction). -/
theorem see_Poth : seeMat * Poth = (-1 : ℚ) • Poth := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [seeMat, Poth, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply,
      Matrix.sub_apply, Fin.sum_univ_three] <;> ring

/-- The Unity eigenspace has dimension `1`: `trace Pdem = 1`. -/
theorem tr_Pdem : Matrix.trace Pdem = 1 := by
  simp [Matrix.trace, Matrix.diag, Pdem, Jall, Matrix.smul_apply, Fin.sum_univ_three]

/-- The others eigenspace has dimension `2`: `trace Poth = 2`. -/
theorem tr_Poth : Matrix.trace Poth = 2 := by
  simp [Matrix.trace, Matrix.diag, Poth, Jall, Matrix.one_apply, Matrix.sub_apply, Matrix.smul_apply,
    Fin.sum_univ_three]; ring

/-- ★★★ THE FORCED "OTHER" FRACTION `T = 2/3` (DERIVED, not asserted). The normalized weight split
    that kills the self-view balance is UNIQUE: from `w0 + w1 = 1` (normalization) and
    `w0·2 + w1·(−1) = 0` (self-blindness — the seeing operator's weighted eigenvalue balance
    vanishes, its self-view is invisible), the "others" weight is forced to `w1 = 2/3`. This is the
    self-seen "other" fraction of the three self-blind generations — a Born counting fact, not a fit. -/
theorem born_fraction_others (w0 w1 : ℚ)
    (hnorm : w0 + w1 = 1) (hblind : w0 * 2 + w1 * (-1) = 0) : w1 = 2 / 3 := by
  linarith

/-- ★★★ THE FORCED DEMOCRATIC/UNITY FRACTION `1/3` (DERIVED). Same hypotheses force `w0 = 1/3`. -/
theorem born_fraction_dem (w0 w1 : ℚ)
    (hnorm : w0 + w1 = 1) (hblind : w0 * 2 + w1 * (-1) = 0) : w0 = 1 / 3 := by
  linarith

/-- ★★ THE GENERAL-`n` SELF-BLIND FRACTION `(n−1)/n`. Each probe sees `n−1` others; self-blindness
    `w0·(n−1) + w1·(−1) = 0` with normalization `w0 + w1 = 1` forces the "others" fraction
    `w1 = (n−1)/n`. The `2/3` is the `n = 3` instance. -/
theorem born_fraction_forced_gen (n : ℚ) (hn : n ≠ 0) (w0 w1 : ℚ)
    (hnorm : w0 + w1 = 1) (hblind : w0 * (n - 1) + w1 * (-1) = 0) : w1 = (n - 1) / n := by
  have hw0 : w0 = 1 - w1 := by linarith
  rw [hw0] at hblind
  have hkey : w1 * n = n - 1 := by ring_nf; ring_nf at hblind; linarith
  field_simp
  linarith [hkey]

/-- ★★ THE SELF-VIEW BALANCE itself: on the derived weights `tr Pdem/3 = 1/3` and `tr Poth/3 = 2/3`,
    the seeing operator's weighted eigenvalue sum vanishes — `(tr Pdem/3)·2 + (tr Poth/3)·(−1) = 0`
    (the self-view is invisible, `⟺ trace seeMat = 0`). -/
theorem weight_balance :
    (Matrix.trace Pdem / 3) * 2 + (Matrix.trace Poth / 3) * (-1) = 0 := by
  rw [tr_Pdem, tr_Poth]; ring

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the ℤ₃ self-blind generation cycle and its forced Born-weight split.

    At the maximal Hermitian octonionic Jordan order (3, forced by the cascade-stop non-associativity
    `jordan_fails_H4`, N5), the three cap-forced primitive idempotents carry a fixed-point-free
    order-3 Jordan-automorphism cycle (self-blindness: the cycle fixes NO idempotent, but fixes the
    democratic Unity `1`); and the diagonal-zero symmetric seeing operator `seeMat = Jall − 1` over ℚ
    has the UNIQUE normalized spectral-weight split `1/3 ⊕ 2/3` killing its self-view balance
    (`tr Pdem = 1`, `tr Poth = 2`; the "others" fraction `2/3` FORCED by self-blindness +
    normalization, DERIVED not asserted). One cause (octonion non-associativity) with the cascade
    stop, the Jordan cap, the three-fold multiplicity, and now the generation self-blindness. -/
theorem generation_cycle_born_split_structure :
    -- T1: the ℤ₃ self-blind cycle on the cap-forced idempotents
    (gcyc * gcyc * gcyc = 1) ∧ gcyc ≠ 1
    ∧ (∀ i, gcyc i ≠ i)
    ∧ Function.Injective Eidem
    ∧ (∀ i, pconj gcyc (Eidem i) ≠ Eidem i)
    ∧ pconj gcyc (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 1
    ∧ (Eidem (gcyc 0) + Eidem (gcyc (gcyc 0)) = 1 - Eidem 0)
    -- T2: the forced Born-weight split (derived values)
    ∧ Matrix.trace Pdem = 1 ∧ Matrix.trace Poth = 2
    ∧ (∀ w0 w1 : ℚ, w0 + w1 = 1 → w0 * 2 + w1 * (-1) = 0 → w1 = 2 / 3)
    ∧ (∀ w0 w1 : ℚ, w0 + w1 = 1 → w0 * 2 + w1 * (-1) = 0 → w0 = 1 / 3)
    -- the cap forcing exactly 3 (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨gcyc_cube, gcyc_ne_one, gcyc_fpf, Eidem_inj, gen_no_fixed, unity_fixed, see_others_0,
   tr_Pdem, tr_Poth, born_fraction_others, born_fraction_dem, jordan_fails_H4⟩

end Phys.Algebra.HJ
