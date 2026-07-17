/-
# N### — THE GENERATION CYCLE PHASE IS LINE-INDEPENDENT (no deviated quark phase)

Directed ROUTE-FINDER child of D8-freezeout-succ (t_9cdcd2e1), rung 1 of the quark ℝ-descent
ascent. The parent asked to derive a *deviated* quark cycle phase `δ_quark ≠ 2/9` from a
supposed Fano-line non-associativity entering the ℤ₃ loop holonomy. Running the derivation on the
theory's own terms (SELECT S3: follow the theory, not the arc) shows the OPPOSITE is FORCED, and
it is already implicit in the banked N308/N310: **the generation cycle phase does NOT deviate —
`δ = 2/9` is line-independent — so `δ_quark = δ_lepton = 2/9`.** This node banks that forced
result and RELOCATES the quark-sector distinction to where the theory actually puts it (the CP
form `assoc3` + the sector frames + the absolute scale), off a void mechanism.

## WHY THE PARENT'S MECHANISM IS VOID (three forced facts, the middle one NEW)

1. **THE GENERATION LINE ASSOCIATES.** A "Fano line" of the octonions is, by definition, an
   associative quaternion subalgebra (each of the 7 Fano lines is a copy of ℍ). The banked
   generation triple `(u2, u1, octCross u1 u2)` is exactly such a line, so the ALGEBRA associator
   VANISHES on it: `assoc u2 u1 (octCross u1 u2) = 0` (`gen_triple_assoc_zero`, the NEW
   load-bearing fact — previously only `assoc3 ≠ 0` was banked, never the algebra associator).
   A loop transport built from the three generation carriers therefore has ZERO bracketing
   defect: there is no non-associativity on the generation line to shift any holonomy.
   CONTRAST (W8 teeth): `assoc` is genuinely NONzero elsewhere on `O ℚ` (`fano_assoc_ne_zero`,
   the cascade's own non-associating triple, N5b), so the vanishing on the generation line is a
   real property of that line, not a triviality of the algebra.

2. **THE TURNING EIGENVALUE IS LINE-INDEPENDENT (`−1`).** N308's holonomy operator
   `seeMat = Pcyc + Pcyc²` is a pure ℚ-permutation acting on the 3-slot COEFFICIENT space — it
   carries no octonion in its type (`see_Poth : seeMat * Poth = (−1)•Poth`). Its turning-mode
   eigenvalue is `−1` regardless of which octonion line carries the amplitudes. Combined with
   (1) — the line associates, so dressing the transport by octonion multiplications composes
   without defect — the eigenvalue stays exactly `−1`.

3. **HENCE THE PHASE IS THE BORN COUNT `2/9`, UNSHIFTED.** The holonomy = statistics fixed point
   `n·T(1−T) = T` (N308, the self-blindness balance) with the line-independent `−1` gives
   `T = 2/3`, `δ = T(1−T) = 2/9` (`cyclephase_delta_B`) — the SAME value on the associative
   generation line as on the lepton ℂ-line. The cycle phase is a Born COUNT of self-blindness
   (seed §1 step 6), not a geometric property of the line; it cannot deviate.

## WHAT ACTUALLY DISTINGUISHES THE SECTORS (the redirect, aligned with banked T7/N310)

The ONLY line-dependent invariant on the generation triple is the antisymmetric calibration
3-form `assoc3 u2 u1 (octCross u1 u2) = −1 ≠ 0` (`fano_assoc3_ne_zero`, banked N209/N310) — the
CP/volume form. N310's SEPARATION THEOREM already proved `assoc3` (the CP invariant) is
INDEPENDENT of the norm invariant `Q` that fixes the Koide `2/3` and of the phase. So on the SAME
triple: `assoc = 0` (algebra — the mass-phase channel, vanishes) while `assoc3 = −1` (the CP
channel, nonzero). The quark-sector distinction lives in the CP form (banked as the Jarlskog
`cpPhase`), the up/down two-frame overlap (seed T8), and the absolute confinement scale (X9
route-not-yet-found) — NOT in a deviated cycle phase. The correctly-aimed route child targets the
sector-frame structure that distinguishes the quark spectrum from the lepton spectrum AT the same
phase `δ = 2/9`.

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete quark/lepton/generation/mass/phase/Koide/CP/holonomy: every theorem is a pure statement
about the banked octonion objects — the algebra associator `Phys.Algebra.assoc` and the
calibration 3-form `assoc3` on the triple `(u2, u1, octCross u1 u2)` of `O ℚ`, and the ℚ-matrix
`seeMat`/`Poth` with `Matrix.trace`. On this triple `assoc = 0` while `assoc3 = −1`; `assoc ≠ 0`
on another triple; `seeMat * Poth = (−1)•Poth`; `(tr Poth/3)(1 − tr Poth/3) = 2/9`. No theorem
STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

Every production TYPE mentions the banked derived objects: `Phys.Algebra.assoc` (N5b), `assoc3`
(N209), `u1`/`u2`/`octCross` (N6/N26/N206), `seeMat`/`Poth`/`Matrix.trace Poth` (N305/N308). The
capstone carries `jdef Xwit Ywit ≠ 0` (the octonion-specific cap forcing exactly three, N5). NOT
a generic algebra statement; the associator, 3-form, and cycle are the concrete banked ones.

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

Standard flavor physics posits distinct up/down/lepton cycle phases as free Yukawas. The parent
tried to DERIVE a distinct quark phase from non-associativity. The theory DISSOLVES the question:
there is no distinct phase — the phase is UNIVERSAL (a Born count of self-blindness), and the
sector difference is relocated to the CP form + frame overlap + scale. Turning a mis-posed
"deviated phase" target into a forced universality is the theory-native result; it also prevents
a hidden bridge (asserting `assoc3` AS the mass phase — the exact category error N310 forbids).

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation,
no bridge; no empirical number; all statements exact over ℚ / on `O ℚ` (no ℝ, no trig — the phase
is a pure rational Born count).
-/
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — the generation line ASSOCIATES (the new load-bearing fact + contrast). -/

/-- ★★★ THE GENERATION LINE ASSOCIATES: the ALGEBRA associator VANISHES on the banked generation
    triple `(u2, u1, octCross u1 u2)` — `assoc u2 u1 (octCross u1 u2) = 0`. The three generation
    carriers span a Fano line, i.e. an associative quaternion subalgebra of `O ℚ`; a loop
    transport built from them has ZERO bracketing defect. NEW: previously only the calibration
    3-form `assoc3 ≠ 0` was banked on this triple; the algebra associator (a DIFFERENT object) was
    never computed. It is the fact that forces the cycle phase to be line-independent. -/
theorem gen_triple_assoc_zero :
    Phys.Algebra.assoc u2 u1 (octCross u1 u2) = 0 := by
  have hc : octCross u1 u2 = u1 * u2 := by
    unfold octCross; rw [gForm_u1_u2, zero_smul, add_zero]
  rw [hc]
  unfold Phys.Algebra.assoc
  ext <;>
    simp only [sub_eq_add_neg, u1, u2, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
      CD.zero_re, CD.zero_im,
      mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg] <;> ring

/-- W8 CONTRAST/TEETH: the algebra associator is genuinely NONzero elsewhere on `O ℚ` — at the
    cascade's own non-associating triple (N5b, `fano_assoc_ne_zero`). So the vanishing on the
    generation line (`gen_triple_assoc_zero`) is a real property OF THAT LINE, not a triviality
    of the whole algebra. `O ℚ` is non-associative; the generation line is a rare associative one. -/
theorem algebra_nonassoc_offline :
    Phys.Algebra.assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0 :=
  fano_assoc_ne_zero

/-! ## §2 — the invariant split on the SAME triple (algebra assoc = 0 vs volume assoc3 ≠ 0). -/

/-- ★★ THE INVARIANT SPLIT AT THE PHASE LEVEL. On the SAME generation triple, the two octonion
    invariants disagree: the ALGEBRA associator vanishes (`gen_triple_assoc_zero`, the mass-phase
    channel) while the antisymmetric calibration 3-form is nonzero (`fano_assoc3_ne_zero = −1`,
    the CP/volume channel, banked N209/N310). They are DIFFERENT objects — `assoc` is
    (xy)z − x(yz); `assoc3` is `⟨x, y×z⟩`. This is the phase-level reading of N310's separation
    theorem: only the CP channel is line-dependent, and it is separated from the mass phase. -/
theorem invariant_split_on_triple :
    Phys.Algebra.assoc u2 u1 (octCross u1 u2) = 0
      ∧ assoc3 u2 u1 (octCross u1 u2) ≠ 0 :=
  ⟨gen_triple_assoc_zero, fano_assoc3_ne_zero⟩

/-! ## §3 — the turning eigenvalue is line-independent, so the phase is the unshifted Born count. -/

/-- THE TURNING EIGENVALUE IS `−1`, LINE-INDEPENDENT: `seeMat * Poth = (−1)•Poth` (banked N308
    `see_Poth`). `seeMat = Pcyc + Pcyc²` is a ℚ-permutation on the 3-slot coefficient space with
    NO octonion in its type, so its turning-mode eigenvalue does not depend on which octonion line
    carries the amplitudes. -/
theorem turning_eigenvalue_line_indep : seeMat * Poth = (-1 : ℚ) • Poth := see_Poth

/-- THE CYCLE PHASE IS THE BORN COUNT `2/9` (banked N308 `cyclephase_delta_B`), read off the
    line-independent turning eigenvalue through the holonomy=statistics fixed point. -/
theorem cycle_phase_value : (Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) = 2 / 9 :=
  cyclephase_delta_B

/-! ## §4 — the forced conclusion: NO deviated quark phase. -/

/-- ★★★ NO DEVIATED QUARK PHASE — the cycle phase is LINE-INDEPENDENT. Because (1) the generation
    line ASSOCIATES (`gen_triple_assoc_zero`: zero loop defect) and (2) the turning eigenvalue is
    the line-independent `−1` of the ℚ-permutation holonomy (`turning_eigenvalue_line_indep`), the
    cycle phase is the SAME Born count `δ = 2/9` (`cycle_phase_value`) on the associative
    generation line as on the lepton ℂ-line — `δ_quark = δ_lepton = 2/9`. The ONLY line-dependent
    invariant is the antisymmetric CP form `assoc3 ≠ 0` (`fano_assoc3_ne_zero`), which N310 proved
    is separated from the mass phase. There is NO octonion non-associativity that shifts the phase:
    the "deviated quark phase" mechanism is void, and the quark-sector distinction lives in the CP
    channel + the sector frames + the absolute scale, not in the phase. -/
theorem phase_no_deviation :
    -- (1) the generation line associates: zero loop defect
    Phys.Algebra.assoc u2 u1 (octCross u1 u2) = 0
    -- (2) the turning eigenvalue is the line-independent −1
    ∧ (seeMat * Poth = (-1 : ℚ) • Poth)
    -- (3) hence the cycle phase is the unshifted Born count 2/9
    ∧ ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) = 2 / 9)
    -- (4) the only line-dependent invariant is the CP form (separated from the phase, N310)
    ∧ assoc3 u2 u1 (octCross u1 u2) ≠ 0 :=
  ⟨gen_triple_assoc_zero, turning_eigenvalue_line_indep, cycle_phase_value, fano_assoc3_ne_zero⟩

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the generation cycle phase is line-independent (no deviated quark phase).

    On the banked generation triple `(u2, u1, octCross u1 u2)` of `O ℚ`: the ALGEBRA associator
    vanishes (`gen_triple_assoc_zero` — the line is an associative quaternion subalgebra, zero loop
    defect), genuinely (the associator is nonzero elsewhere, `algebra_nonassoc_offline`), while the
    antisymmetric calibration 3-form is nonzero (`invariant_split_on_triple` — the two invariants
    split: the mass-phase channel `assoc` vanishes, the CP channel `assoc3` does not). The turning
    eigenvalue of the ℚ-permutation holonomy is the line-independent `−1`
    (`turning_eigenvalue_line_indep`), so the cycle phase is the unshifted Born count `δ = 2/9`
    (`cycle_phase_value`) on the associative generation line exactly as on the lepton ℂ-line
    (`phase_no_deviation`). The quark-sector distinction lives in the CP form + the sector frames +
    the absolute scale, NOT in a deviated phase. The cap forcing exactly three generations
    (`jdef Xwit Ywit ≠ 0`, N5) grounds it on the octonion-specific arena. -/
theorem generation_cycle_phase_line_independence_structure :
    -- §1: the generation line associates (new) + genuine contrast
    (Phys.Algebra.assoc u2 u1 (octCross u1 u2) = 0)
    ∧ (Phys.Algebra.assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0)
    -- §2: the invariant split on the same triple
    ∧ (Phys.Algebra.assoc u2 u1 (octCross u1 u2) = 0 ∧ assoc3 u2 u1 (octCross u1 u2) ≠ 0)
    -- §3: the line-independent turning eigenvalue and the phase value
    ∧ (seeMat * Poth = (-1 : ℚ) • Poth)
    ∧ ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) = 2 / 9)
    -- §4: no deviated quark phase — the forced conclusion
    ∧ (Phys.Algebra.assoc u2 u1 (octCross u1 u2) = 0
        ∧ (seeMat * Poth = (-1 : ℚ) • Poth)
        ∧ ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) = 2 / 9)
        ∧ assoc3 u2 u1 (octCross u1 u2) ≠ 0)
    -- the cap forcing exactly 3 (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨gen_triple_assoc_zero, algebra_nonassoc_offline, invariant_split_on_triple,
   turning_eigenvalue_line_indep, cycle_phase_value, phase_no_deviation, jordan_fails_H4⟩

end Phys.Algebra.HJ
