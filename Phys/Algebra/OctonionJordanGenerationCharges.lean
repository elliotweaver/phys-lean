import Phys.Algebra.OctonionJordanFamilyMixingComplexification

/-!
# N304 — The generation fold-root charges of the family complex-structure generator

## What this node banks (the ★5/★2 refinement — the three generations are NOT identical)

N303 banked the family complex-structure generator `famMixJ := ⁅famC, kAB⁆` (the derived
`su(3)_flavour` Cartan element that phases the generation-mixing plane by the fold-root `√−1`), and
showed `famMixJ² = −16` on the mixing plane `span{slotC 1, slotC u1}`.

THIS node reads off the action of that SAME banked generator on the **three cap-forced generation
slots** `slotA 1, slotB 1, slotC 1` (the three matter copies, cap-forced at 3 by N5/N268). The
generator acts DIAGONALLY on each slot as the fold-root complex structure, with three DISTINCT
NONZERO integer charges:

* `famMixJ (slotA 1) = slotA (2 • u1)`   (charge `+2`),
* `famMixJ (slotB 1) = slotB ((−2) • u1)` (charge `−2`),
* `famMixJ (slotC 1) = slotC ((−4) • u1)` (charge `−4`, the banked N303 `famMixJ_slotC_one`).

So the three generations carry three **distinct** fold-root (`u1`) charges `+2, −2, −4` under the
derived family complex-structure generator. They are told apart by their fold-root phase.

## The dissolution / the moat

Standard flavour physics treats the three generations as three IDENTICAL copies of one matter
representation — the "generation puzzle" is exactly *why three, and why do they differ only in mass*.
N268 already derived the cap at three identical copies. This node REFINES that: the copies are
identical under the gauge structure but the derived family complex-structure generator
`⁅famC, kAB⁆ ∈ f₄ = derH3` assigns them three DISTINCT nonzero fold-root charges `+2, −2, −4`. The
generations are distinguished — not by a posited horizontal charge, but by the fold-root phase they
carry under the arena's own inner-multiplication bracket.

Yet (N302) the masses are the `f₄`-isospectral char-poly coefficients, and `famMixJ ∈ f₄` preserves
them: the fold-root charge is INVISIBLE to the spectrum in the `f₄`-symmetric limit. So the mass
SPLITTING of the three distinctly-charged generations is precisely localized as a phenomenon that
must be driven by a fold-derived element BEYOND the isospectral `f₄` — a Weyl-breaking element of the
spectrum-mover sector `L₀`. That is the named target of the single successor route-finder.

ONE CAUSE MANY TERMINATIONS: the fold-root `u1` (the cascade's first `√−1`, N2) is the complex unit
of the first doubling, the colour-neutral core of matter (N266), the `su(3)_flavour → so(3)` breaker
(N292), the complex/CP-phase axis of mixing (N303), AND — here — the phase whose distinct integer
charges tell the three generations apart.

## Scope (honesty clause)

Banks the diagonal charge action of the SINGLE banked generator `famMixJ = ⁅famC, kAB⁆` on the three
generation slots, and their distinctness. Does NOT bank: the full 3×3 weight matrix of all three
`⁅famX,kXY⁆` (JA/JB rows need unbanked famA/famB/kBC/kCA slot actions — deferred, and note the rows
carry a `u(1)` trace so they are NOT the traceless `su(3)` Cartan, which would be an overclaim); the
full-arena commuting-Cartan brackets (generic Lie machinery, not fold-native content); the ★2/★5
mixing-angle / mass-ratio / CP-phase VALUE (route-not-yet-found — FORCED build target; N275 no fixed
root); the Weyl-breaking `L₀` element that lifts the degeneracy (the successor route-finder's job).

Physics-words-removable: delete generation/flavour/mass/charge/mixing/CP — the pure statement is that
for the operator `J := ⁅innerMul (slotA 1)(slotB 1), innerMul (slotA u1)(slotB 1)⁆` on
`Matrix (Fin 3)(Fin 3)(O ℚ)`:
`J (slotA 1) = slotA (2•u1)`, `J (slotB 1) = slotB ((−2)•u1)`, `J (slotC 1) = slotC ((−4)•u1)`, and
the three images `slotA (2•u1)`, `slotB ((−2)•u1)`, `slotC ((−4)•u1)` are pairwise distinct nonzero
matrices. Pure operator/matrix algebra over `ℚ` and `O ℚ`.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The generation charge action — `famMixJ = ⁅famC, kAB⁆` acts diagonally on the three slots. -/

/-- ★★ THE `slotA` CHARGE `+2`. The family complex-structure generator `famMixJ := ⁅famC, kAB⁆` acts
    on the first generation slot as the fold-root complex structure with charge `+2`:
    `⁅famC, kAB⁆ (slotA 1) = slotA (2 • u1)`.
    `= famC (kAB (slotA 1)) − kAB (famC (slotA 1)) = famC (slotB u1) − kAB (− slotB 1)
     = slotA u1 − (− slotA u1) = slotA (2 • u1)`. -/
theorem famMixJ_slotA_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotA 1)
      = slotA ((2 : ℚ) • (u1 : O ℚ)) := by
  rw [show (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
        : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = innerMul (slotA (1:O ℚ)) (slotB 1) * innerMul (slotA (u1:O ℚ)) (slotB 1)
          - innerMul (slotA (u1:O ℚ)) (slotB 1) * innerMul (slotA (1:O ℚ)) (slotB 1)
        from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [kAB_slotA_one, famC_slotB u1]
  rw [famC_slotA (1:O ℚ), map_neg, kAB_slotB_one]
  rw [sub_neg_eq_add, ← slotA_add]
  congr 1
  rw [two_smul]

/-- ★★ THE `slotB` CHARGE `−2`. The family complex-structure generator acts on the second generation
    slot with fold-root charge `−2`: `⁅famC, kAB⁆ (slotB 1) = slotB ((−2) • u1)`.
    `= famC (kAB (slotB 1)) − kAB (famC (slotB 1)) = famC (slotA u1) − kAB (slotA 1)
     = − slotB u1 − slotB u1 = slotB ((−2) • u1)`. -/
theorem famMixJ_slotB_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotB 1)
      = slotB ((-2 : ℚ) • (u1 : O ℚ)) := by
  rw [show (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
        : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = innerMul (slotA (1:O ℚ)) (slotB 1) * innerMul (slotA (u1:O ℚ)) (slotB 1)
          - innerMul (slotA (u1:O ℚ)) (slotB 1) * innerMul (slotA (1:O ℚ)) (slotB 1)
        from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [kAB_slotB_one, famC_slotA u1]
  rw [famC_slotB (1:O ℚ), kAB_slotA_one]
  rw [← slotB_neg, ← slotB_sub]
  congr 1
  rw [neg_smul, two_smul]; abel

/-- THE `slotC` CHARGE `−4` — the banked N303 complex-structure action, restated at the charge level:
    `⁅famC, kAB⁆ (slotC 1) = slotC ((−4) • u1)` (`famMixJ_slotC_one`). -/
theorem famMixJ_slotC_charge :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1)
      = slotC ((-4 : ℚ) • (u1 : O ℚ)) :=
  famMixJ_slotC_one

/-! ## The charges are distinct — the three generations are told apart by fold-root phase. -/

/-- A nonzero rational scalar times the fold-root is nonzero (`O ℚ` is a `ℚ`-vector space; multiply
    by the inverse scalar). -/
theorem smul_u1_ne_zero (r : ℚ) (hr : r ≠ 0) : r • (u1 : O ℚ) ≠ 0 := by
  intro h
  have hu : (u1 : O ℚ) = 0 := by
    have := congrArg (fun x => (r⁻¹ : ℚ) • x) h
    simp only [smul_smul, smul_zero] at this
    rwa [inv_mul_cancel₀ hr, one_smul] at this
  exact u1_ne_zero hu

/-- `slotA (2•u1) ≠ slotB ((−2)•u1)`: the first and second generation images live in different
    matrix slots (`(0,1)` vs `(1,2)` entry). -/
theorem slotA_charge_ne_slotB_charge :
    slotA ((2 : ℚ) • (u1 : O ℚ)) ≠ slotB ((-2 : ℚ) • (u1 : O ℚ)) := by
  intro h
  have hentry : (slotA ((2:ℚ) • (u1:O ℚ))) 0 1 = (slotB ((-2:ℚ) • (u1:O ℚ))) 0 1 := by rw [h]
  simp only [slotA, slotB, Xz] at hentry
  exact smul_u1_ne_zero 2 (by norm_num) (by simpa using hentry)

/-- `slotB ((−2)•u1) ≠ slotC ((−4)•u1)`: the second and third generation images live in different
    matrix slots (`(1,2)` vs `(0,2)` entry). -/
theorem slotB_charge_ne_slotC_charge :
    slotB ((-2 : ℚ) • (u1 : O ℚ)) ≠ slotC ((-4 : ℚ) • (u1 : O ℚ)) := by
  intro h
  have hentry : (slotB ((-2:ℚ) • (u1:O ℚ))) 1 2 = (slotC ((-4:ℚ) • (u1:O ℚ))) 1 2 := by rw [h]
  simp only [slotB, slotC, Xz] at hentry
  exact smul_u1_ne_zero (-2) (by norm_num) (by simpa using hentry)

/-- `slotA (2•u1) ≠ slotC ((−4)•u1)`: the first and third generation images live in different matrix
    slots (`(0,1)` vs `(0,2)` entry). -/
theorem slotA_charge_ne_slotC_charge :
    slotA ((2 : ℚ) • (u1 : O ℚ)) ≠ slotC ((-4 : ℚ) • (u1 : O ℚ)) := by
  intro h
  have hentry : (slotA ((2:ℚ) • (u1:O ℚ))) 0 1 = (slotC ((-4:ℚ) • (u1:O ℚ))) 0 1 := by rw [h]
  simp only [slotA, slotC, Xz] at hentry
  exact smul_u1_ne_zero 2 (by norm_num) (by simpa using hentry)

/-! ## The capstone — the three distinct generation fold-root charges. -/

/-- ★★★ THE GENERATION FOLD-ROOT CHARGES. The single banked family complex-structure generator
    `famMixJ := ⁅famC, kAB⁆` (N303, the derived `su(3)_flavour` Cartan element that phases mixing by
    the fold-root `√−1`) acts DIAGONALLY on the three cap-forced generation slots with three DISTINCT
    nonzero integer fold-root (`u1`) charges `+2, −2, −4`:
    · `famMixJ (slotA 1) = slotA (2 • u1)`,
    · `famMixJ (slotB 1) = slotB ((−2) • u1)`,
    · `famMixJ (slotC 1) = slotC ((−4) • u1)`,
    and the three images are pairwise distinct. The three generations — identical under the gauge
    structure (N268) — are told apart by the fold-root phase they carry under the arena's own
    inner-multiplication bracket. Cap-forced at the maximal Jordan order 3 (`jordan_fails_H4`, N5).
    Since `famMixJ ∈ f₄` (N303) and `f₄` is isospectral (N302), this fold-root charge is invisible to
    the spectrum in the `f₄`-symmetric limit — so the generation mass SPLITTING is precisely localized
    as a phenomenon that must be driven by a fold-derived element BEYOND the isospectral `f₄`. -/
theorem generation_foldroot_charges :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotA 1)
        = slotA ((2 : ℚ) • (u1 : O ℚ))
    ∧ ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotB 1)
        = slotB ((-2 : ℚ) • (u1 : O ℚ))
    ∧ ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1)
        = slotC ((-4 : ℚ) • (u1 : O ℚ))
    ∧ slotA ((2 : ℚ) • (u1 : O ℚ)) ≠ slotB ((-2 : ℚ) • (u1 : O ℚ))
    ∧ slotB ((-2 : ℚ) • (u1 : O ℚ)) ≠ slotC ((-4 : ℚ) • (u1 : O ℚ))
    ∧ slotA ((2 : ℚ) • (u1 : O ℚ)) ≠ slotC ((-4 : ℚ) • (u1 : O ℚ))
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨famMixJ_slotA_one, famMixJ_slotB_one, famMixJ_slotC_charge,
   slotA_charge_ne_slotB_charge, slotB_charge_ne_slotC_charge, slotA_charge_ne_slotC_charge,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
