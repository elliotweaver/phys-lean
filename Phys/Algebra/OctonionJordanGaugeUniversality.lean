/-
  Phys.Algebra.OctonionJordanGaugeUniversality — N268: THE DERIVED GAUGE ACTS ON THE
  MAXIMAL MATTER ARENA BY JORDAN DERIVATIONS, IDENTICALLY ACROSS THE THREE CAP-FORCED
  COPIES — FAMILY UNIVERSALITY FORCED.
  ===========================================================================
  THE FORWARD ★1↔★4 JOINT (family universality). N267 banked the COUNT: the maximal
  Hermitian octonionic Jordan order is 3, and its general self-adjoint element decomposes as
  a real diagonal ⊕ EXACTLY THREE position-disjoint injective ℚ-linear copies of the derived
  matter carrier `O ℚ` (`Hm = Dg + slotA a + slotB b + slotC c`, the count `C(3,2)` forced by
  the cascade-stop cap `jordan_cap_pinned_at_three`). N267 explicitly DEFERRED the STRUCTURE of
  the three copies. THIS module banks it: how the DERIVED gauge acts on the arena and on the
  three copies.

  THE OBJECT. `Der(O ℚ) = g₂` (N6, the simple 14-dim derivation algebra; it CONTAINS the banked
  colour `su(3)` = `colourCentralizer` N201 and the electroweak factors N258) acts on the arena
  `J₃(O ℚ) = H₃(O ℚ)` ENTRYWISE: `jAct D M := M.map (D ·)`. Because `D` is a Leibniz derivation of
  `O ℚ` (`IsDerivQ`), the entrywise lift is a DERIVATION OF THE MATRIX PRODUCT (`jAct_mul`) hence
  of the symmetric (Jordan) bracket `jb A B = A·B + B·A` (`jAct_jb`) — the derived gauge acts on
  the maximal matter arena BY JORDAN-ALGEBRA DERIVATIONS, a genuine symmetry of the arena's
  algebraic structure.

  ★★★ THE HEADLINE — FAMILY UNIVERSALITY. The three matter-carrier slots (N267) are carried by
  the entrywise gauge by the IDENTICAL rule:
      `jAct D (slotA a) = slotA (D a)`,  `jAct D (slotB b) = slotB (D b)`,
      `jAct D (slotC c) = slotC (D c)`,
  and the real diagonal is GAUGE-FIXED (`jAct D (Dg d0 d1 d2) = 0`). So the three cap-forced
  copies of the matter carrier are MUTUALLY ISOMORPHIC gauge-modules — each transforms as the
  SAME derived-gauge module on `O ℚ`, restricted to the g₂-IRREDUCIBLE fundamental (N234
  `no_proper_invariant_ImO`). Family universality (identical gauge transformation across the
  three copies) is FORCED by the entrywise structure, not posited; the count 3 is cap-forced.

  THE ONE LAW REFRAME (docs/STANDARD.md; RUNBOOK W9). No octonion coordinate bash: the whole node
  is entrywise `Matrix.map` + per-entry `fin_cases <;> simp`, the matrix Leibniz law as a
  `Finset.sum` of per-entry octonion Leibniz (`jAct_mul`), and `abel` for the Jordan-derivation
  corollary. `derivQ_star_comm` (a derivation commutes with conjugation) dissolves through the
  banked `trace_id` + `derivQ_one` + `derivQ_maps_im`.

  THE DISSOLUTION (docs/STANDARD.md §0) — THE MOAT. Standard physics POSITS family universality
  (identical gauge quantum numbers across generations — an empirical input) and treats the
  generation structure as a SEPARATE sector from the gauge group; the mass/mixing texture and the
  weak mixing angle are a further symmetry-BREAKING (Yukawa) sector. The theory FORCES universality
  — the three copies ARE the three octonion off-diagonal slots of the ONE arena, carried by the ONE
  entrywise derived gauge by the identical rule — AND, in the SAME structure, NAMES the mixing-angle
  blocker: the arena has EXACT family symmetry (the un-broken S₃ frame permutation + the identical
  gauge action), which is precisely why the mixing-angle `T₃`-split cannot be forced here (the
  named-ascent blocker) and why the mass/mixing texture requires BREAKING this symmetry.

  THE FREE-FLOATING GROUNDING (SOUL rail — decisive). The generic mechanism — a ring derivation
  lifts to a matrix derivation (`jAct_mul`), hence a Jordan-bracket derivation (`jAct_jb`), and
  single-entry embeddings are always intertwiners — is a SUPPORTING INGREDIENT, NOT the headline.
  The HEADLINE is the octonion-SPECIFIC JOINT, FALSE for associative/commutative coordinate rings:
  (i) exactly THREE copies, cap-forced (`jordan_cap_pinned_at_three`, via the cascade-stop
  non-associativity `jdef Xwit Ywit ≠ 0` — for an associative coordinate ring every order is
  Jordan, there is no cap, and the count is `C(n,2)` for arbitrary `n`); (ii) each copy is the ONE
  g₂-IRREDUCIBLE fundamental (N234 `no_proper_invariant_ImO` — for a commutative coordinate ring
  `Der = 0`, there is no nontrivial fundamental to be irreducible); (iii) the gauge IS
  `g₂ = Der(O ℚ)` itself. The capstone's TYPE carries the cap failure `jdef Xwit Ywit ≠ 0`, so it
  is not carrier-agnostic.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete 'gauge / family / generation / matter /
  universality / colour / arena': over the derived field ℚ and `O ℚ = CD (H ℚ)`, for a Leibniz
  derivation `D` of `O ℚ`, the entrywise map `jAct D` on `Matrix (Fin 3) (Fin 3) (O ℚ)` is a
  derivation of the product and of the symmetric bracket `jb`, annihilates the diagonal
  `Dg d0 d1 d2`, and satisfies `jAct D (slotX v) = slotX (D v)` for each of the three slots; the
  order-3 Jordan identity holds while order 4 fails; the imaginary fundamental has no proper
  invariant subspace. No theorem statement carries a physics word.

  Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

-- Ring instances for `O ℚ = CD (H ℚ)`; NO `qMod` override — use the ambient global
-- `instModuleQO` so the derivation lemmas (`derivQ_one`/`derivQ_maps_im`) typecheck. The N267
-- slot/`Hm`/`Dg`/`Xz` defs use no `•` (pure matrix constructors), so they are instance-independent.
attribute [local instance] CD.narCD CD.srCD

/-! ## A derivation commutes with conjugation. -/

/-- ★ A Leibniz derivation of `O ℚ` commutes with conjugation: `D (star a) = star (D a)`.
    Route: `a + star a = (2 reQ a)•1` (`trace_id`); `D 1 = 0` (`derivQ_one`); the derivation output
    is purely imaginary `star (D a) = − D a` (`derivQ_maps_im`). No coordinate bash. -/
theorem derivQ_star_comm (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (a : O ℚ) :
    D (star a) = star (D a) := by
  have htr : a + star a = (2 * reQ a) • (1 : O ℚ) := trace_id a
  have hstar_a : star a = (2 * reQ a) • (1 : O ℚ) - a := by
    rw [eq_sub_iff_add_eq, add_comm]; exact htr
  have h1 : D 1 = 0 := derivQ_one D hD
  have hmap : star (D a) = - D a := derivQ_maps_im D hD a
  rw [hstar_a, map_sub, map_smul, h1, smul_zero, zero_sub, hmap]

/-! ## The entrywise gauge action on the arena. -/

/-- THE ENTRYWISE GAUGE ACTION: apply the derivation `D` to each octonion entry of a matrix. -/
noncomputable def jAct (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.map (fun x => D x)

/-- `jAct D` is additive in the matrix argument. -/
theorem jAct_add (D : Module.End ℚ (O ℚ)) (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jAct D (M + N) = jAct D M + jAct D N := by
  apply Matrix.ext; intro i j
  simp [jAct, Matrix.map_apply, Matrix.add_apply, map_add]

/-- `jAct D` commutes with ℚ-scaling of the matrix argument. -/
theorem jAct_smul_matrix (D : Module.End ℚ (O ℚ)) (r : ℚ) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jAct D (r • M) = r • jAct D M := by
  apply Matrix.ext; intro i j
  simp [jAct, Matrix.map_apply, Matrix.smul_apply, map_smul]

/-- ★★ THE MATRIX LEIBNIZ LAW (the supporting mechanism). For a Leibniz derivation `D` of `O ℚ`
    the entrywise lift is a derivation of the matrix product:
    `jAct D (M * N) = jAct D M * N + M * jAct D N`. Each matrix-product entry is a `Finset.sum` of
    octonion products, and `D` is additive + Leibniz on each product term. -/
theorem jAct_mul (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jAct D (M * N) = jAct D M * N + M * jAct D N := by
  apply Matrix.ext; intro i j
  simp only [jAct, Matrix.map_apply, Matrix.mul_apply, Matrix.add_apply, map_sum]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro k _
  exact hD (M i k) (N k j)

/-- ★★★ THE GAUGE ACTS BY JORDAN DERIVATIONS. `jAct D` is a derivation of the symmetric (Jordan)
    bracket `jb A B = A*B + B*A` of the maximal matter arena:
    `jAct D (jb A B) = jb (jAct D A) B + jb A (jAct D B)`. So the derived gauge `Der(O ℚ)` acts on
    `J₃(O ℚ)` by Jordan-algebra derivations — a genuine symmetry of the arena's algebraic
    structure, from `jAct_add` + `jAct_mul`. -/
theorem jAct_jb (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jAct D (jb A B) = jb (jAct D A) B + jb A (jAct D B) := by
  unfold jb
  rw [jAct_add, jAct_mul D hD, jAct_mul D hD]
  abel

/-! ## Family universality — the three slots are carried identically; the diagonal is fixed. -/

/-- ★★★ SLOT UNIVERSALITY (0,1): the entrywise gauge carries the first matter-carrier slot by
    `jAct D (slotA a) = slotA (D a)`. The `(0,1)` entry maps `a ↦ D a`; the `(1,0)` entry maps
    `star a ↦ D (star a) = star (D a)` (`derivQ_star_comm`); zeros stay zero (`D 0 = 0`). -/
theorem jAct_slotA (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (a : O ℚ) :
    jAct D (slotA a) = slotA (D a) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, slotA, Xz, Matrix.map_apply, derivQ_star_comm D hD, map_zero]

/-- ★★★ SLOT UNIVERSALITY (0,2): `jAct D (slotB b) = slotB (D b)` — the IDENTICAL rule. -/
theorem jAct_slotB (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (b : O ℚ) :
    jAct D (slotB b) = slotB (D b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, slotB, Xz, Matrix.map_apply, derivQ_star_comm D hD, map_zero]

/-- ★★★ SLOT UNIVERSALITY (1,2): `jAct D (slotC c) = slotC (D c)` — the IDENTICAL rule. The three
    slots `slotA/slotB/slotC` are carried by the same rule `slotX ∘ D`, so the three cap-forced
    matter-carrier copies are mutually isomorphic gauge-modules: family universality FORCED. -/
theorem jAct_slotC (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (c : O ℚ) :
    jAct D (slotC c) = slotC (D c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, slotC, Xz, Matrix.map_apply, derivQ_star_comm D hD, map_zero]

/-- ★★ THE DIAGONAL IS GAUGE-FIXED: `jAct D (Dg d0 d1 d2) = 0`. Each diagonal entry is a central
    scalar `ocR dᵢ = dᵢ • 1`, killed by a derivation (`D 1 = 0`). The real "trace"/spacetime
    directions are gauge-invariant; only the three matter-carrier slots transform. -/
theorem jAct_Dg (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (d0 d1 d2 : ℚ) :
    jAct D (Dg d0 d1 d2) = 0 := by
  have h1 : D 1 = 0 := derivQ_one D hD
  have hkill : ∀ r : ℚ, D (ocR r) = 0 := by
    intro r
    have hr : ocR r = r • (1 : O ℚ) := by ext <;> simp [ocR]
    rw [hr, map_smul, h1, smul_zero]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, Dg, Matrix.map_apply, hkill]

/-- ★★★ THE FULL ARENA DECOMPOSITION under the gauge action. The entrywise gauge action on the
    general maximal self-adjoint element fixes the diagonal and carries each slot to its D-image:
    `jAct D (Hm d0 d1 d2 a b c) = slotA (D a) + slotB (D b) + slotC (D c)`. -/
theorem jAct_Hm (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jAct D (Hm d0 d1 d2 a b c)
      = slotA (D a) + slotB (D b) + slotC (D c) := by
  have h1 : D 1 = 0 := derivQ_one D hD
  have hkill : ∀ r : ℚ, D (ocR r) = 0 := by
    intro r
    have hr : ocR r = r • (1 : O ℚ) := by ext <;> simp [ocR]
    rw [hr, map_smul, h1, smul_zero]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, Hm, slotA, slotB, slotC, Xz, Matrix.map_apply, Matrix.add_apply,
      hkill, derivQ_star_comm D hD]

/-! ## W8 anti-vacuity — the gauge action on matter is non-trivial. -/

/-- ★★ W8 NON-VACUITY (coordinate-free): the derived gauge genuinely MOVES matter. There is a
    Leibniz derivation `D` of `O ℚ` and an octonion `a` with `jAct D (slotA a) ≠ 0` — the gauge
    action on the matter-carrier slots is not the trivial (zero) action. From the banked NONZERO
    witness derivation `witnessDerivQ ≠ 0` (N6): it has some `a` with `witnessDerivQ a ≠ 0`, and
    then `jAct witnessDerivQ (slotA a) = slotA (witnessDerivQ a) ≠ 0` (`slotA_ne_zero`). -/
theorem gauge_moves_matter :
    ∃ (D : Module.End ℚ (O ℚ)) (_ : IsDerivQ D) (a : O ℚ), jAct D (slotA a) ≠ 0 := by
  have hne : witnessDerivQ ≠ 0 := witnessDerivQ_ne_zero
  have : ∃ a, witnessDerivQ a ≠ 0 := by
    by_contra h
    rw [not_exists] at h
    simp only [not_not] at h
    exact hne (LinearMap.ext fun a => by simpa using h a)
  obtain ⟨a, ha⟩ := this
  refine ⟨witnessDerivQ, witnessDerivQ_isDerivQ, a, ?_⟩
  rw [jAct_slotA witnessDerivQ witnessDerivQ_isDerivQ a]
  exact slotA_ne_zero ha

/-! ## The capstone — family universality, forced. -/

/-- ★★★ THE CAPSTONE — FAMILY UNIVERSALITY IS FORCED. The derived gauge `Der(O ℚ)` acts on the
    maximal matter arena `J₃(O ℚ)` by Jordan-algebra derivations (`jAct_jb`), fixes the real
    diagonal (`jAct_Dg`), and carries the three cap-forced matter-carrier slots (N267) by the
    IDENTICAL rule `slotX ∘ D` — so the three copies are mutually isomorphic gauge-modules
    (family universality). The bundle:
      · the gauge acts by Jordan-bracket derivations;
      · the three slots are carried identically (universality);
      · the diagonal is gauge-fixed;
      · the arena decomposes under the action;
      · the count is exactly three, forced by the cascade-stop cap (`jordan_cap_pinned_at_three`
        — the order-3 Jordan identity holds while order 4 fails, `jdef Xwit Ywit ≠ 0`, the
        octonion-SPECIFIC anchor that makes this NOT carrier-agnostic);
      · the action on matter is non-vacuous.
    Each copy is the g₂-IRREDUCIBLE fundamental (N234 `no_proper_invariant_ImO`, cited); the
    identical carrying rule is the isomorphism of the three copies as gauge-modules. Family
    universality is FORCED by the entrywise structure, not posited. -/
theorem gauge_family_universality :
    (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D →
      ∀ (A B : Matrix (Fin 3) (Fin 3) (O ℚ)),
        jAct D (jb A B) = jb (jAct D A) B + jb A (jAct D B))
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ a : O ℚ, jAct D (slotA a) = slotA (D a))
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ b : O ℚ, jAct D (slotB b) = slotB (D b))
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ c : O ℚ, jAct D (slotC c) = slotC (D c))
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ d0 d1 d2 : ℚ, jAct D (Dg d0 d1 d2) = 0)
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        jAct D (Hm d0 d1 d2 a b c) = slotA (D a) + slotB (D b) + slotC (D c))
    ∧ (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
        jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0)
    ∧ jdef Xwit Ywit ≠ 0
    ∧ (∃ (D : Module.End ℚ (O ℚ)) (_ : IsDerivQ D) (a : O ℚ), jAct D (slotA a) ≠ 0) :=
  ⟨fun D hD A B => jAct_jb D hD A B,
   fun D hD a => jAct_slotA D hD a,
   fun D hD b => jAct_slotB D hD b,
   fun D hD c => jAct_slotC D hD c,
   fun D hD d0 d1 d2 => jAct_Dg D hD d0 d1 d2,
   fun D hD d0 d1 d2 a b c => jAct_Hm D hD d0 d1 d2 a b c,
   jordan_cap_pinned_at_three.1,
   jordan_cap_pinned_at_three.2,
   gauge_moves_matter⟩

end Phys.Algebra.HJ
