/-
  Phys.Algebra.OctonionJordanInnerMultiplicationTriangle — N275.
  =============================================================================
  THE COMPLETE INNER-MULTIPLICATION A₂ TRIANGLE + THE FAMILY-ORBIT CEILING.

  Over the DERIVED octonion rung `O ℚ = CD (H ℚ)` and the maximal Hermitian octonionic Jordan
  arena `J₃(O ℚ) = H₃(O ℚ)` (N5/N267). N274 built the arena's OWN Jordan-multiplication operator
  `Lmul A := (X ↦ jb A X)` and its inner commutator `innerMul A B := Lmul A ∘ₗ Lmul B - Lmul B ∘ₗ
  Lmul A` (the canonical inner-derivation generator), and computed ONE of the three inner-
  multiplication couplings against the diagonal:

      `innerMul (slotA a) (slotB b) (Dg d0 d1 d2) = slotC ((d2 - d1) • (star a * b))`     (N274, leg 1)

  It NAMED `innerMul` "the inner-derivation generator" but computed only 1/3 of the triangle and
  left the STRUCTURE of the three couplings together unexamined.

  THIS node completes the triangle and PROVES its symmetry structure — the RUNBOOK repeated-deferral
  discipline's NAMED CEILING for the ≥9×-deferred ★2/★5 "distinguished direction" fronts.

  (1) THE FULL TRIANGLE. All three inner-multiplication couplings against the diagonal:
        · leg 1 (AB→C, N274): coefficient `(d2 - d1)`, value `star a * b`  [imported]
        · leg 2 (BC→A):       coefficient `(d1 - d0)`, value `b * star c`  (`innerMul_slot_diagBC`)
        · leg 3 (CA→B):       coefficient `(d0 - d2)`, value `a * c`       (`innerMul_slot_diagCA`)
      The three COEFFICIENTS are the trace-zero root functionals of the N213 charge-space; they
      SUM TO ZERO (`innerMul_root_sum_zero`, the A₂ / rank-2 root closure the weight diagram N213
      already carries as `weight_sum_eq_two_trace`).

  (2) ⭐⭐⭐ THE FAMILY-ORBIT CEILING. The inner commutator INTERTWINES with the family symmetry
      `framePerm` (N273): `framePerm σ (innerMul A B M) = innerMul (framePerm σ A) (framePerm σ B)
      (framePerm σ M)` (`framePerm_innerMul`) — because `innerMul` is built from the Jordan bracket
      `jb` and `framePerm` is a `jb`-automorphism (N273 `framePerm_jb`). The family 3-cycle `cyc`
      relabels the diagonal `Dg d0 d1 d2 ↦ Dg d1 d2 d0` (`cyc_Dg`) and the three slots cyclically
      (`cyc_slotA/B/C`), so it carries leg 1 → leg 2 (`innerMul_family_orbit`): the three couplings
      form ONE S₃-ORBIT. The three root functionals are cyclically permuted; NO root is fixed.

  THE MOAT / DISSOLUTION. The Standard Model POSITS a distinguished flavour direction (the Yukawa
  texture) to break the family symmetry into a mass/mixing texture. The ≥9×-deferred ★2/★5 fronts
  kept (correctly, THE ONE LAW) refusing to posit one. THIS node PROVES why: the three derived
  inner-multiplication couplings form a family-SYMMETRIC A₂ root system with NO fixed root — the
  fold's own self-blindness (no nonzero fixed point) reappearing at the family level. The "missing
  distinguished direction" is not a missing input to grind for; it is a THEOREM that the structure
  is transitively symmetric. NAMES THE CEILING: a family-symmetry-BREAKING derived object is the
  precise missing structure (childed N276 route-finder), NOT a lateral neighbour to bank.

  ONE CAUSE MANY TERMINATIONS. The SAME octonion product (cap-forced 3 slots + non-commutativity)
  gives the count (N267), universality (N268), the coupling (N272), the family S₃ (N273), the
  direction-mixing operator (N274), and NOW the A₂ root system + the proved family-orbit symmetry.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete flavour/generation/family/texture/root/arena:
  over ℚ and `O ℚ = CD (H ℚ)`, the inner-derivation commutator `innerMul` of the order-3 Hermitian
  Jordan matrix algebra, applied to the three off-diagonal slot-pairs against a diagonal `Dg`,
  yields three values whose ℚ-coefficients are the three trace-zero functionals
  `(d2-d1),(d1-d0),(d0-d2)` (sum zero), cyclically permuted by the submatrix-relabelling S₃; the
  map `σ ↦ framePerm σ` intertwines `innerMul`. No theorem STATEMENT needs a physics word.

  FREE-FLOATING check (SOUL rail). Every headline TYPE mentions the banked derived objects
  (`innerMul`, `slotA/B/C`, `Dg`, `framePerm`, `O ℚ`, `star`); the capstone carries the octonion cap
  `jordan_cap_pinned_at_three` — NOT carrier-agnostic (over a commutative rung the couplings
  `star a*b`/`b*star c`/`a*c` degenerate and the A₂ triangle collapses).

  Foundations-only: no posited axiom, no sorry-style hole, no compiled-kernel bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanInnerMultiplication
import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## Slot subtraction-additivity (twins of the banked `slotC_sub`). -/

/-- The first slot is subtraction-additive: `slotA (x - y) = slotA x - slotA y`. -/
theorem slotA_sub (x y : O ℚ) : slotA (x - y) = slotA x - slotA y := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, Xz, Matrix.sub_apply, star_sub]

/-- The second slot is subtraction-additive: `slotB (x - y) = slotB x - slotB y`. -/
theorem slotB_sub (x y : O ℚ) : slotB (x - y) = slotB x - slotB y := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotB, Xz, Matrix.sub_apply, star_sub]

/-! ## The N213 weight action at the third slot (weight `d1+d2`). -/

section QModLocal
attribute [local instance] qMod

/-- The diagonal Cartan `Dg` acts on the THIRD matter slot by the derived weight (`d1+d2`):
    `jb (Dg d0 d1 d2) (slotC c) = slotC (ocR (d1+d2) * c)` (N213 `jb_Dg_Xzabc` at `slotC`,
    the `(1,2)`-slot carrying weight `t1+t2`). Completes the slot-weight triple
    `t0+t1 / t0+t2 / t1+t2` (N274 banked `jb_Dg_slotA`/`jb_Dg_slotB`). -/
theorem jb_Dg_slotC (d0 d1 d2 : ℚ) (c : O ℚ) :
    jb (Dg d0 d1 d2) (slotC c) = slotC (ocR (d1 + d2) * c) := by
  unfold slotC; rw [jb_Dg_Xzabc]; simp only [qsmul_def, mul_zero]

end QModLocal

/-! ## ★★★ THE COMPLETE INNER-MULTIPLICATION TRIANGLE — the other two legs. -/

/-- ★★★ LEG 2 (BC→A). The inner-multiplication commutator of the second and third matter-slot
    multiplications, applied to the diagonal, reads the weight difference `d1 - d0` into the octonion
    coupling `b * star c`:

        `innerMul (slotB b) (slotC c) (Dg d0 d1 d2) = slotA ((d1 - d0) • (b * star c))`.

    The coefficient `d1 - d0` is the second trace-zero root functional (slot weights `d0+d2` on
    slotB, `d1+d2` on slotC, difference `d1 - d0`). The value `b * star c` is the N272 coupling
    `jb_slotB_slotC`. Dissolved through banked structural lemmas (THE ONE LAW reframe, no coordinate
    bash): flip each bracket to `Dg`-first (`jb_comm`), apply the N213 weights
    (`jb_Dg_slotB`/`jb_Dg_slotC`), apply the N272 coupling (`jb_slotB_slotC`) to land both terms in
    `slotA`, factor `slotA` out (`slotA_sub`), close the coefficient (`ocRmulL` + `star_qsmul` +
    `qsmul_mul_left/right` + `sub_smul` + `ring`). -/
theorem innerMul_slot_diagBC (b c : O ℚ) (d0 d1 d2 : ℚ) :
    innerMul (slotB b) (slotC c) (Dg d0 d1 d2) = slotA ((d1 - d0) • (b * star c)) := by
  rw [innerMul_apply,
      jb_comm (slotC c) (Dg d0 d1 d2), jb_Dg_slotC,
      jb_comm (slotB b) (Dg d0 d1 d2), jb_Dg_slotB,
      jb_slotB_slotC, jb_comm (slotC c) (slotB (ocR (d0 + d2) * b)),
      jb_slotB_slotC, ← slotA_sub]
  congr 1
  rw [ocRmulL, ocRmulL, star_qsmul, qsmul_mul_right, qsmul_mul_left, ← sub_smul]
  congr 1; ring

/-- ★★★ LEG 3 (CA→B). The inner-multiplication commutator of the third and first matter-slot
    multiplications, applied to the diagonal, reads the weight difference `d0 - d2` into the octonion
    coupling `a * c`:

        `innerMul (slotC c) (slotA a) (Dg d0 d1 d2) = slotB ((d0 - d2) • (a * c))`.

    The coefficient `d0 - d2` is the third trace-zero root functional (slot weights `d1+d2` on
    slotC, `d0+d1` on slotA, difference `d0 - d2`). The value `a * c` is the N272 coupling
    `jb_slotC_slotA`. Same dissolution as leg 2. The three coupling laws CLOSE the cyclic triangle. -/
theorem innerMul_slot_diagCA (a c : O ℚ) (d0 d1 d2 : ℚ) :
    innerMul (slotC c) (slotA a) (Dg d0 d1 d2) = slotB ((d0 - d2) • (a * c)) := by
  rw [innerMul_apply,
      jb_comm (slotA a) (Dg d0 d1 d2), jb_Dg_slotA,
      jb_comm (slotC c) (Dg d0 d1 d2), jb_Dg_slotC,
      jb_slotC_slotA, jb_comm (slotA a) (slotC (ocR (d1 + d2) * c)),
      jb_slotC_slotA, ← slotB_sub]
  congr 1
  rw [ocRmulL, ocRmulL, qsmul_mul_right, qsmul_mul_left, ← sub_smul]
  congr 1; ring

/-! ## The A₂ root closure — the three coefficients sum to zero. -/

/-- ★★ THE A₂ ROOT CLOSURE. The three inner-multiplication coupling coefficients — the trace-zero
    root functionals `(d2-d1)`, `(d1-d0)`, `(d0-d2)` — SUM TO ZERO:

        `(d2 - d1) + (d1 - d0) + (d0 - d2) = 0`.

    They are NOT independent: two span the rank-2 trace-zero Cartan (the N213 weight lattice,
    `weight_sum_eq_two_trace`), the third is forced — the A₂ root-system closure. -/
theorem innerMul_root_sum_zero (d0 d1 d2 : ℚ) :
    (d2 - d1) + (d1 - d0) + (d0 - d2) = 0 := by ring

/-! ## ★★★ THE FAMILY-ORBIT CEILING — innerMul intertwines with the family symmetry. -/

/-- The family 3-cycle on the three positions: `cyc = (swap 0 1)(swap 1 2)`, the even permutation
    realizing the cyclic relabel `0 ↦ 1 ↦ 2 ↦ 0` of the frame (N273 `framePerm_cyc_slotA`). -/
noncomputable def cyc : Equiv.Perm (Fin 3) := Equiv.swap 0 1 * Equiv.swap 1 2

/-- The family 3-cycle carries the first slot to the second (with conjugation): `slotA a ↦ slotB
    (star a)` (N273 `framePerm_cyc_slotA`, re-exported here for the orbit). -/
theorem cyc_slotA (a : O ℚ) : framePerm cyc (slotA a) = slotB (star a) := by
  unfold framePerm cyc slotA slotB; apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

/-- The family 3-cycle carries the second slot to the third (with conjugation): `slotB b ↦ slotC
    (star b)`. -/
theorem cyc_slotB (b : O ℚ) : framePerm cyc (slotB b) = slotC (star b) := by
  unfold framePerm cyc slotB slotC; apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

/-- The family 3-cycle carries the third slot back to the first: `slotC c ↦ slotA c`
    (no conjugation — the `(1,2)` entry lands directly at `(0,1)`). Closes the slot 3-cycle. -/
theorem cyc_slotC (c : O ℚ) : framePerm cyc (slotC c) = slotA c := by
  unfold framePerm cyc slotC slotA; apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

/-- The family 3-cycle cyclically relabels the diagonal: `Dg d0 d1 d2 ↦ Dg d1 d2 d0`. So it
    permutes the three trace-zero root functionals cyclically — no root is fixed. -/
theorem cyc_Dg (d0 d1 d2 : ℚ) : framePerm cyc (Dg d0 d1 d2) = Dg d1 d2 d0 := by
  unfold framePerm cyc Dg; apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def, Matrix.diagonal]

/-- `framePerm` distributes over subtraction (the submatrix relabel is ℚ-linear). -/
theorem framePerm_sub (σ : Equiv.Perm (Fin 3)) (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (M - N) = framePerm σ M - framePerm σ N := by
  unfold framePerm; apply Matrix.ext; intro i j; simp [Matrix.submatrix_apply, Matrix.sub_apply]

/-- ★★★ THE CEILING KEY. The inner-multiplication commutator INTERTWINES with the family symmetry:

        `framePerm σ (innerMul A B M) = innerMul (framePerm σ A) (framePerm σ B) (framePerm σ M)`.

    `innerMul A B M = jb A (jb B M) - jb B (jb A M)` is built entirely from the Jordan bracket `jb`,
    and `framePerm σ` is a `jb`-AUTOMORPHISM (N273 `framePerm_jb`) that is additive (`framePerm_sub`).
    So the family symmetry conjugates the inner-derivation generator into the inner-derivation
    generator of the relabelled multipliers. This is the structural fact that makes the three
    inner-multiplication couplings ONE family-orbit. -/
theorem framePerm_innerMul (σ : Equiv.Perm (Fin 3)) (A B M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (innerMul A B M)
      = innerMul (framePerm σ A) (framePerm σ B) (framePerm σ M) := by
  rw [innerMul_apply, innerMul_apply, framePerm_sub, framePerm_jb, framePerm_jb,
      framePerm_jb, framePerm_jb]

/-- ★★★ THE FAMILY ORBIT (transitivity). The family 3-cycle carries LEG 1 (AB→C) to LEG 2 (BC→A):
    applying `framePerm cyc` to the inner-multiplication coupling `innerMul (slotA a)(slotB b)(Dg …)`
    reproduces the leg-2 coupling `innerMul (slotB …)(slotC …)(Dg …)`. So the three inner-
    multiplication couplings form ONE S₃-ORBIT — the discrete family symmetry acts TRANSITIVELY on
    them. Combined with `cyc_Dg` (the diagonal 3-cycle) this exhibits the three trace-zero root
    functionals as a single orbit with no fixed root. -/
theorem innerMul_family_orbit (a b : O ℚ) (d0 d1 d2 : ℚ) :
    framePerm cyc (innerMul (slotA a) (slotB b) (Dg d0 d1 d2))
      = innerMul (slotB (star a)) (slotC (star b)) (Dg d1 d2 d0) := by
  rw [framePerm_innerMul, cyc_slotA, cyc_slotB, cyc_Dg]

/-! ## W8 anti-vacuity — no root is fixed (the family action has no invariant direction). -/

/-- ★★ W8 NON-VACUITY / THE CEILING TEETH. The three trace-zero root functionals are genuinely a
    NON-TRIVIAL orbit: if all three coincided (a fixed direction) they would all vanish — the
    S₃-standard representation has NO nonzero fixed vector. Concretely, from `(d2-d1) = (d1-d0)` and
    `(d1-d0) = (d0-d2)` one forces `d2-d1 = 0`. So a family-symmetry-INVARIANT (fixed) coupling
    direction is necessarily the ZERO direction — there is NO derived distinguished non-zero root to
    break the family symmetry along. This is the precise structural ceiling: the ★5 texture-breaking
    needs a family-symmetry-BREAKING derived object, which this arena does not supply. -/
theorem inner_root_no_fixed_direction :
    ∀ d0 d1 d2 : ℚ, ((d2 - d1) = (d1 - d0)) → ((d1 - d0) = (d0 - d2)) → (d2 - d1) = 0 := by
  intro d0 d1 d2 h1 h2; linarith

/-- ★★ W8 the orbit is genuinely NON-vacuous: at a concrete diagonal split the leg-2 coupling value
    is NONZERO — the family orbit moves genuine matter. At `b = 1, c = u1, d0 = 0, d1 = 1, d2 = 0`
    (root `d1 - d0 = 1`, value `1 * star u1 = -u1`): `innerMul (slotB 1)(slotC u1)(Dg 0 1 0) ≠ 0`. -/
theorem innerMul_diagBC_nonvacuous :
    innerMul (slotB (1 : O ℚ)) (slotC u1) (Dg 0 1 0) ≠ 0 := by
  intro h
  have hentry : (innerMul (slotB (1 : O ℚ)) (slotC u1) (Dg 0 1 0)) 0 1
      = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 1 := by rw [h]
  rw [innerMul_slot_diagBC] at hentry
  simp only [one_mul, sub_zero, one_smul, slotA_entry, Matrix.zero_apply] at hentry
  -- hentry : star u1 = 0, but (star u1).re.re.im = -1 ≠ 0
  have hc := congrArg (fun z : O ℚ => z.re.re.im) hentry
  simp only [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im'] at hc
  norm_num at hc

/-! ## The capstone — the complete inner-multiplication A₂ triangle, cap-bounded at order 3. -/

/-- ★★★ THE CAPSTONE — THE COMPLETE INNER-MULTIPLICATION A₂ TRIANGLE + THE FAMILY-ORBIT CEILING.
    Over the derived octonion rung `O ℚ` and the maximal Hermitian octonionic Jordan arena
    `J₃(O ℚ)`, the arena's OWN inner-multiplication commutator `innerMul` (N274) produces, against
    the diagonal Cartan, THREE couplings closing a cyclic triangle:
      · leg 2 `innerMul (slotB b)(slotC c)(Dg d0 d1 d2) = slotA ((d1-d0) • (b * star c))`;
      · leg 3 `innerMul (slotC c)(slotA a)(Dg d0 d1 d2) = slotB ((d0-d2) • (a * c))`;
      (with N274's leg 1 `= slotC ((d2-d1) • (star a * b))`) whose three coefficients — the
      trace-zero root functionals — SUM TO ZERO (`innerMul_root_sum_zero`, the A₂ closure);
      · the family symmetry INTERTWINES `innerMul` (`framePerm_innerMul`) and its 3-cycle carries
        leg 1 → leg 2 (`innerMul_family_orbit`) while cyclically relabelling the diagonal
        (`cyc_Dg`), so the three couplings form ONE S₃-ORBIT;
      · with NO fixed non-zero root direction (`inner_root_no_fixed_direction`) — the precise
        ceiling: no derived distinguished direction to break the family symmetry along;
      · genuinely non-vacuous (`innerMul_diagBC_nonvacuous`);
      · MAXIMAL at order 3 because the Hermitian octonionic Jordan order is cap-forced at 3
        (`jordan_cap_pinned_at_three`) — NOT carrier-agnostic (over a commutative rung the couplings
        `star a*b`/`b*star c`/`a*c` degenerate).
    The three derived inner-multiplication couplings form a family-SYMMETRIC A₂ root system with no
    fixed root — the fold's self-blindness (no nonzero fixed point) at the family level; the ★5
    texture-breaking needs a family-symmetry-BREAKING derived object this arena does not supply. -/
theorem inner_multiplication_triangle_structure :
    (∀ (b c : O ℚ) (d0 d1 d2 : ℚ),
        innerMul (slotB b) (slotC c) (Dg d0 d1 d2) = slotA ((d1 - d0) • (b * star c)))
    ∧ (∀ (a c : O ℚ) (d0 d1 d2 : ℚ),
        innerMul (slotC c) (slotA a) (Dg d0 d1 d2) = slotB ((d0 - d2) • (a * c)))
    ∧ (∀ d0 d1 d2 : ℚ, (d2 - d1) + (d1 - d0) + (d0 - d2) = 0)
    ∧ (∀ (σ : Equiv.Perm (Fin 3)) (A B M : Matrix (Fin 3) (Fin 3) (O ℚ)),
        framePerm σ (innerMul A B M)
          = innerMul (framePerm σ A) (framePerm σ B) (framePerm σ M))
    ∧ (∀ (a b : O ℚ) (d0 d1 d2 : ℚ),
        framePerm cyc (innerMul (slotA a) (slotB b) (Dg d0 d1 d2))
          = innerMul (slotB (star a)) (slotC (star b)) (Dg d1 d2 d0))
    ∧ (∀ d0 d1 d2 : ℚ, ((d2 - d1) = (d1 - d0)) → ((d1 - d0) = (d0 - d2)) → (d2 - d1) = 0)
    ∧ (innerMul (slotB (1 : O ℚ)) (slotC u1) (Dg 0 1 0) ≠ 0)
    ∧ ((∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
          jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0) ∧ jdef Xwit Ywit ≠ 0) :=
  ⟨fun b c d0 d1 d2 => innerMul_slot_diagBC b c d0 d1 d2,
   fun a c d0 d1 d2 => innerMul_slot_diagCA a c d0 d1 d2,
   innerMul_root_sum_zero,
   framePerm_innerMul,
   fun a b d0 d1 d2 => innerMul_family_orbit a b d0 d1 d2,
   inner_root_no_fixed_direction,
   innerMul_diagBC_nonvacuous,
   jordan_cap_pinned_at_three⟩

end Phys.Algebra.HJ
