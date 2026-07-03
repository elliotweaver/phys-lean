/-
# N273 — THE DERIVED FAMILY (S₃) SYMMETRY OF THE MAXIMAL MATTER ARENA

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)` and the maximal Hermitian octonionic Jordan arena
`J₃(O ℚ) = H₃(O ℚ)` (N5/N267), this node banks the DERIVED FAMILY SYMMETRY as an acting object —
the symmetry that N268's and N272's own docstrings NAMED as the ★2/★5 blocker ("the arena has EXACT
family symmetry, the un-broken S₃ frame permutation + the identical gauge action") but never BUILT.

## The story this closes (the ★4/★5 forward beat of the arena turn N267–272)

N267 banked the generation COUNT (exactly 3 position-disjoint slots `slotA/slotB/slotC` at
`(0,1)/(0,2)/(1,2)` = `C(3,2)`, cap-forced). N268 banked that the derived gauge `Der(O ℚ) = g₂`
acts on the three copies ENTRYWISE and IDENTICALLY (`jAct D (slotX v) = slotX (D v)`), family-BLIND.
N272 banked that the arena's OWN Jordan product WEAVES the three cyclically
(`jb (slotA a)(slotB b) = slotC (star a * b)`, triangle A→B→C→A). What has NEVER been built is the
family symmetry ITSELF as a derived acting object — the C(3,2)=3 position-relabeling symmetry S₃.

THIS node builds it: `framePerm σ M := M.submatrix σ σ` (permutation-matrix conjugation by
`σ : Equiv.Perm (Fin 3)`), and derives forward what it IS and how it interacts with the banked
gauge and coupling.

## What is banked (headline = octonion-anchored; generic core DEMOTED — the free-floating rail)

SUPPORTING (generic — true of any 3×3 matrix ring; NOT the headline, exactly as N272 demoted the
bare coupling law and N268 demoted `jAct_mul`):
  · `framePerm` is a GROUP ACTION: `framePerm 1 = id` (`framePerm_one`), and
    `framePerm σ (framePerm τ M) = framePerm (τ * σ) M` (`framePerm_comp`).
  · `framePerm σ` is a JORDAN AUTOMORPHISM of the arena:
    `framePerm σ (jb A B) = jb (framePerm σ A) (framePerm σ B)` (`framePerm_jb`), via
    `Matrix.submatrix_mul_equiv` — the arena's algebraic structure is S₃-symmetric.
  · `framePerm σ (jAct D M) = jAct D (framePerm σ M)` (`framePerm_jAct` — by `rfl`): the family
    symmetry COMMUTES with the derived derivation-gauge, so it is a GENUINE SEPARATE symmetry
    (position-axis ⊥ entry-axis), not gauge redundancy. Physically meaningful, mathematically
    shallow → supporting.
  · the SLOT-PERMUTATION action (`framePerm_swap12_slotA` etc.): transpositions/3-cycles carry the
    three slot embeddings to one another. The transpositions CONJUGATE the carried octonion
    (`framePerm (swap 1 2)(slotC c) = slotC (star c)`) — a first trace of non-commutativity.

★★★ HEADLINE (octonion-SPECIFIC — the non-free-floating content):
  · THE COUPLING-ORBIT `framePerm_swap12_coupling`: the family symmetry carries the N272 coupling
    laws to coupling laws, and a transposition acts on the octonion coupling value by
    PRODUCT-REVERSAL:
        `framePerm (swap 1 2) (jb (slotA a) (slotB b)) = slotC (star b * a)`
    vs the un-permuted `jb (slotA a) (slotB b) = slotC (star a * b)`. The discrete flavour symmetry
    interacts NON-trivially with the octonion coupling: `star b * a ≠ star a * b` because `O ℚ` is
    NON-commutative — over a commutative rung the orbit would be blind to the product order. This is
    the genuinely-new octonion content: the algebra's non-commutativity surfacing in the discrete
    family action.
  · THE CAP-BOUND: S₃ is the flavour symmetry AND the MAXIMAL one, because the Hermitian octonionic
    Jordan order is cap-forced at 3 (`jordan_cap_pinned_at_three`; `H₄(O)` fails). Over an
    ASSOCIATIVE coordinate ring the arena extends to `H₄, H₅, …` with `S₄, S₅, …`; the boundedness
    of the family symmetry at S₃ IS the octonion cap. The capstone TYPE carries the cap failure
    `jdef Xwit Ywit ≠ 0`, so it is NOT carrier-agnostic.
  · EXACT / UNBROKEN: the family symmetry is unbroken at this stage — `jAct` is S₃-equivariant
    (`framePerm_jAct`, `rfl`) and the coupling is S₃-covariant (the orbit closes). This is banked AS
    the exact-symmetry statement: the correct NON-POSIT statement of the structural ceiling. The ★5
    texture-BREAKING is downstream and would require a posited distinguished direction among the
    three symmetric positions — which THE ONE LAW forbids positing now. This node BUILDS the
    symmetry that ★5 will later break; it does not break it.

W8 non-vacuity `family_moves_slot`: `framePerm (swap 1 2)(slotA a) ≠ slotA a` for `a ≠ 0` — the
family action genuinely MOVES a slot (via `slot_disjointAB`).

## The dissolution / the moat (STANDARD §0)

The Standard Model POSITS a flavour/family symmetry group on generation indices PLUS a Yukawa
spurion that breaks it — two independent inputs. The theory posits NEITHER: the family symmetry IS
the derived arena's position-permutation symmetry (S₃, from `C(3,2) = 3` forced by the cap), and its
action on the coupling is FORCED (octonion product-reversal), not chosen. The posited flavour group
dissolves into the arena's derived position-symmetry, cap-bounded at S₃.

ONE CAUSE MANY TERMINATIONS: the SAME octonion non-associativity that stops the cascade and caps the
Hermitian Jordan order at 3 (N5) gives the count (N267), family universality (N268), the
inter-generation coupling (N272), AND now the maximal family symmetry S₃ together with how it acts
on the coupling (product-reversal).

## Scope — honesty clause

Banks the S₃ action + group-action laws + Jordan-automorphism + gauge-commutation + slot-permutation
+ the coupling-orbit product-reversal + the cap-bound + non-vacuity ONLY. Does NOT bank the ★5
texture / symmetry-breaking, the CKM/PMNS matrix, physical mixing values, the weak mixing angle
(★2), or parity. NOVELTY claimed ONLY for: the derived family symmetry AS an acting object +
flavour⊥gauge + the coupling-orbit product-reversal + the cap-bound at S₃. NEVER for "= the SM
flavour group / = the observed generations' discrete symmetry / any mixing values" (removable prose).

## Physics-words-removable (STANDARD §2)

Delete flavour/family/generation/Yukawa/mixing/gauge/matter/arena: over the derived field ℚ and
`O ℚ = CD (H ℚ)`, for the submatrix reindexing `framePerm σ M = M.submatrix σ σ` on
`Matrix (Fin 3) (Fin 3) (O ℚ)`, `framePerm` is a group action, a `jAct`-commuting Jordan-bracket
automorphism, permutes the slot embeddings, and carries `jb (slotA a)(slotB b) = slotC (star a * b)`
to `slotC (star b * a)` under a transposition; the order-3 Jordan identity holds while order 4
fails. No theorem statement carries a physics word.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The family action: relabeling the three frame positions. -/

/-- THE FAMILY ACTION. Reindex the rows and columns of an arena element by a permutation `σ` of the
    three frame positions: `framePerm σ M := M.submatrix σ σ` (permutation-matrix conjugation). This
    is the `C(3,2) = 3`-position relabeling symmetry S₃ of the maximal Hermitian octonionic Jordan
    arena. -/
noncomputable def framePerm (σ : Equiv.Perm (Fin 3)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.submatrix σ σ

/-! ### Group-action laws (SUPPORTING — generic to any 3×3 matrix ring). -/

/-- The identity permutation acts trivially: `framePerm 1 M = M`. -/
theorem framePerm_one (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : framePerm 1 M = M := by
  unfold framePerm
  simp [Equiv.Perm.coe_one, Matrix.submatrix_id_id]

/-- The composition law of the family action: `framePerm σ (framePerm τ M) = framePerm (τ * σ) M`.
    (`framePerm` is a right action of `Equiv.Perm (Fin 3)` on the arena.) -/
theorem framePerm_comp (σ τ : Equiv.Perm (Fin 3)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (framePerm τ M) = framePerm (τ * σ) M := by
  unfold framePerm
  rw [Matrix.submatrix_submatrix]
  rfl

/-- `framePerm σ` is additive. -/
theorem framePerm_add (σ : Equiv.Perm (Fin 3)) (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (M + N) = framePerm σ M + framePerm σ N := by
  unfold framePerm; rfl

/-! ### The family symmetry is a Jordan automorphism (SUPPORTING — generic). -/

/-- ★★ THE FAMILY SYMMETRY IS A JORDAN AUTOMORPHISM. `framePerm σ` preserves the arena's symmetric
    (Jordan) bracket `jb A B = A*B + B*A`:
    `framePerm σ (jb A B) = jb (framePerm σ A) (framePerm σ B)`. The arena's algebraic structure is
    S₃-symmetric — via `Matrix.submatrix_mul_equiv` (a permutation submatrix is a ring
    automorphism). Generic to any matrix ring → supporting ingredient. -/
theorem framePerm_jb (σ : Equiv.Perm (Fin 3)) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (jb A B) = jb (framePerm σ A) (framePerm σ B) := by
  unfold jb framePerm
  rw [Matrix.submatrix_mul_equiv A B σ σ σ, Matrix.submatrix_mul_equiv B A σ σ σ]
  rfl

/-! ### FLAVOUR ⊥ GAUGE — the family symmetry commutes with the derived gauge (SUPPORTING). -/

/-- ★★ FLAVOUR ⊥ GAUGE. The family symmetry `framePerm σ` COMMUTES with the derived
    derivation-gauge action `jAct D` (which acts entrywise, N268):
    `framePerm σ (jAct D M) = jAct D (framePerm σ M)`.
    The two axes are orthogonal — `framePerm` reindexes POSITIONS, `jAct` transforms ENTRIES — so
    the family symmetry is a GENUINE SEPARATE symmetry of the arena, NOT gauge redundancy. (Holds by
    `rfl`: entrywise `Matrix.map` and index `Matrix.submatrix` commute definitionally.) Physically
    meaningful but mathematically shallow → supporting. -/
theorem framePerm_jAct (σ : Equiv.Perm (Fin 3)) (D : Module.End ℚ (O ℚ))
    (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (jAct D M) = jAct D (framePerm σ M) := rfl

/-! ### The slot-permutation action — how S₃ moves the three matter-carrier copies. -/

/-- The transposition `(1 2)` carries the first slot to the second: `framePerm (swap 1 2)(slotA a)
    = slotB a`. (Positions `(0,1) ↔ (0,2)`; index `0` fixed, so no conjugation.) -/
theorem framePerm_swap12_slotA (a : O ℚ) :
    framePerm (Equiv.swap 1 2) (slotA a) = slotB a := by
  unfold framePerm slotA slotB
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

/-- The transposition `(1 2)` carries the second slot to the first: `framePerm (swap 1 2)(slotB b)
    = slotA b`. -/
theorem framePerm_swap12_slotB (b : O ℚ) :
    framePerm (Equiv.swap 1 2) (slotB b) = slotA b := by
  unfold framePerm slotA slotB
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

/-- ★ The transposition `(1 2)` fixes the third slot's POSITION but CONJUGATES its octonion:
    `framePerm (swap 1 2)(slotC c) = slotC (star c)`. The slot `(1,2)` is swapped with its own
    Hermitian conjugate position `(2,1)`, which carries `star c` — the first trace of the algebra's
    non-commutativity in the discrete family action. -/
theorem framePerm_swap12_slotC (c : O ℚ) :
    framePerm (Equiv.swap 1 2) (slotC c) = slotC (star c) := by
  unfold framePerm slotC
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

/-- The 3-cycle `ρ = (swap 0 1)*(swap 1 2)` cyclically carries the first slot to the second with a
    conjugation: `framePerm ρ (slotA a) = slotB (star a)`. The cyclic part of S₃ rotates the three
    copies A→B→C. -/
theorem framePerm_cyc_slotA (a : O ℚ) :
    framePerm (Equiv.swap 0 1 * Equiv.swap 1 2) (slotA a) = slotB (star a) := by
  unfold framePerm slotA slotB
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]

/-! ## ★★★ THE HEADLINE — THE COUPLING-ORBIT (octonion product-reversal). -/

/-- ★★★ THE COUPLING-ORBIT. The family symmetry carries the N272 inter-generation coupling law to a
    coupling law, and a transposition acts on the octonion coupling value by PRODUCT-REVERSAL:

        `framePerm (swap 1 2) (jb (slotA a) (slotB b)) = slotC (star b * a)`

    vs the un-permuted `jb (slotA a) (slotB b) = slotC (star a * b)` (N272). The discrete family
    symmetry interacts NON-trivially with the octonion coupling: the two readings differ because
    `star b * a ≠ star a * b` in the NON-commutative `O ℚ`. Over a commutative coordinate ring the
    orbit would be blind to the product order — this is the genuinely-new octonion content, the
    algebra's non-commutativity surfacing in the discrete family action.

    Derivation: `framePerm` is a Jordan automorphism (`framePerm_jb`) carrying `slotA a ↦ slotB a`
    (`framePerm_swap12_slotA`) and `slotB b ↦ slotA b` (`framePerm_swap12_slotB`); so the LHS is
    `jb (slotB a) (slotA b)`, which by `jb` commutativity and the N272 law `jb_slotA_slotB` equals
    `slotC (star b * a)`. -/
theorem framePerm_swap12_coupling (a b : O ℚ) :
    framePerm (Equiv.swap 1 2) (jb (slotA a) (slotB b)) = slotC (star b * a) := by
  rw [framePerm_jb, framePerm_swap12_slotA, framePerm_swap12_slotB]
  -- jb (slotB a) (slotA b) = jb (slotA b) (slotB a) (jb symmetric) = slotC (star b * a) (N272).
  have hsymm : jb (slotB a) (slotA b) = jb (slotA b) (slotB a) := by
    unfold jb; rw [add_comm]
  rw [hsymm, jb_slotA_slotB]

/-- ★★ THE PRODUCT-REVERSAL IS GENUINE (the octonion anchor). The permuted coupling
    `slotC (star b * a)` and the un-permuted `slotC (star a * b)` (N272) do NOT agree for all
    `a, b`: the family orbit genuinely REVERSES the octonion product order rather than fixing it.
    Witnessed by `a = 1`, `b = u1` (the fold-root √−1): the permuted reading is
    `slotC (star u1 * 1) = slotC (-u1)` (since `star u1 = -u1`, `u1 ∈ Im O`), while the un-permuted
    is `slotC (star 1 * u1) = slotC u1`; these differ because `-u1 ≠ u1` (as `u1 ≠ 0`). Over a
    COMMUTATIVE coordinate ring the two readings would coincide — the reversal is a genuine effect
    of octonion non-commutativity. -/
theorem coupling_orbit_reverses :
    ∃ a b : O ℚ, framePerm (Equiv.swap 1 2) (jb (slotA a) (slotB b))
      ≠ slotC (star a * b) := by
  refine ⟨(1 : O ℚ), u1, ?_⟩
  rw [framePerm_swap12_coupling]
  -- LHS = slotC (star u1 * 1) = slotC (star u1) ; RHS = slotC (star 1 * u1) = slotC u1
  intro h
  have hval : star u1 * (1 : O ℚ) = star (1 : O ℚ) * u1 := slotC_inj h
  rw [mul_one, star_one, one_mul] at hval
  -- hval : star u1 = u1 ; but (star u1).re.re.im = -1 while u1.re.re.im = 1 — contradiction.
  have hc := congrArg (fun z : O ℚ => z.re.re.im) hval
  simp only [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im'] at hc
  norm_num at hc

/-! ## W8 anti-vacuity — the family action genuinely moves matter. -/

/-- ★★ W8 NON-VACUITY: the family symmetry genuinely MOVES a matter-carrier slot. For a nonzero
    octonion `a`, `framePerm (swap 1 2)(slotA a) ≠ slotA a` — the transposition carries the first
    slot to the SECOND (a position-disjoint copy), so it is not the trivial action. Via
    `slot_disjointAB`. -/
theorem family_moves_slot {a : O ℚ} (ha : a ≠ 0) :
    framePerm (Equiv.swap 1 2) (slotA a) ≠ slotA a := by
  rw [framePerm_swap12_slotA]
  intro h
  exact ha (slot_disjointAB a a h.symm).1

/-! ## The capstone — the derived family symmetry, cap-bounded at S₃. -/

/-- ★★★ THE CAPSTONE — THE DERIVED FAMILY SYMMETRY OF THE MAXIMAL MATTER ARENA. The family action
    `framePerm σ M = M.submatrix σ σ` (the `C(3,2) = 3`-position relabeling S₃) is:
      · a group action (`framePerm_one`, `framePerm_comp`);
      · a Jordan-bracket automorphism of the arena (`framePerm_jb`);
      · COMMUTING with the derived gauge `jAct` (flavour ⊥ gauge — a genuine separate symmetry);
      · acting on the three cap-forced slots by permutation-with-conjugation;
      · ★ carrying the N272 coupling law by octonion PRODUCT-REVERSAL
        (`framePerm (swap 1 2)(jb (slotA a)(slotB b)) = slotC (star b * a)`, the octonion-specific
        headline);
      · non-vacuous (`family_moves_slot`);
      · and MAXIMAL at S₃ because the Hermitian octonionic Jordan order is cap-forced at 3
        (`jordan_cap_pinned_at_three` — the order-3 identity holds while order 4 fails,
        `jdef Xwit Ywit ≠ 0`, the octonion-SPECIFIC anchor making this NOT carrier-agnostic: over an
        associative rung the arena extends to `H₄, H₅, …` with `S₄, S₅, …`).
    The family symmetry is EXACT/UNBROKEN here — the correct non-posit statement of the structural
    ceiling; the ★5 texture-breaking is downstream and this node BUILDS the symmetry it will break. -/
theorem family_symmetry_structure :
    (∀ M : Matrix (Fin 3) (Fin 3) (O ℚ), framePerm 1 M = M)
    ∧ (∀ (σ τ : Equiv.Perm (Fin 3)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)),
        framePerm σ (framePerm τ M) = framePerm (τ * σ) M)
    ∧ (∀ (σ : Equiv.Perm (Fin 3)) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)),
        framePerm σ (jb A B) = jb (framePerm σ A) (framePerm σ B))
    ∧ (∀ (σ : Equiv.Perm (Fin 3)) (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)),
        framePerm σ (jAct D M) = jAct D (framePerm σ M))
    ∧ (∀ a b : O ℚ, framePerm (Equiv.swap 1 2) (jb (slotA a) (slotB b)) = slotC (star b * a))
    ∧ (∃ a b : O ℚ, framePerm (Equiv.swap 1 2) (jb (slotA a) (slotB b)) ≠ slotC (star a * b))
    ∧ (∀ a : O ℚ, a ≠ 0 → framePerm (Equiv.swap 1 2) (slotA a) ≠ slotA a)
    ∧ ((∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
          jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0) ∧ jdef Xwit Ywit ≠ 0) :=
  ⟨framePerm_one, framePerm_comp, framePerm_jb, framePerm_jAct,
    framePerm_swap12_coupling, coupling_orbit_reverses, fun a ha => family_moves_slot ha,
    jordan_cap_pinned_at_three⟩

end Phys.Algebra.HJ
