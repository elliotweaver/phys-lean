/-
  Phys.Algebra.OctonionJordanTrialityGroup — arc-P P6 (SEED_FINAL_RECKONING §P6).
  ============================================================================================
  THE TRIALITY AUTOMORPHISM GROUP — S₃ as a FAITHFUL, NONABELIAN group of Jordan automorphisms
  of the derived exceptional Jordan arena J₃(𝕆) = `Matrix (Fin 3) (Fin 3) (O ℚ)`, acting on the
  three cap-forced generation idempotents `Eidem 0/1/2` and permuting the three 8-dimensional
  matter-carrier slots `slotA/slotB/slotC`. This PAYS the childed group-manifold debt of the
  Lorentz-completion arc (N131–N132): triality is the BANKED generation-permutation, not an import.

  WHAT WAS BANKED (single-element level, in OctonionJordanGenerationCycleBornSplit /
  OctonionJordanHermTraceCoefficient):
    • `pconj σ X := X.submatrix σ σ` — submatrix conjugation by a permutation.
    • `pconj_jb` — EACH `pconj σ` is a Jordan automorphism (needs NO associativity).
    • `pconj_Eidem σ i : pconj σ (Eidem i) = Eidem (σ⁻¹ i)` — the action on the idempotents.
    • `Eidem_inj` — the three idempotents are distinct (faithful generation carriers).
    • `gcyc := finRotate 3` — the C6-forced fixed-point-free generation cycle, `gcyc_cube` (order 3),
      `gcyc_ne_one`, `gcyc_fpf` (self-blind: fixes no generation).

  WHAT THIS NODE BANKS (the S₃ AS A GROUP — the owed triality content):
    • `pconjL_one` / `pconjL_mul` — `pconjL` is an anti-homomorphism of the composition monoid.
    • ★ `trialityHom : Equiv.Perm (Fin 3) →* Module.End ℚ Arena` — THE TRIALITY GROUP HOMOMORPHISM
      (`σ ↦ pconjL σ⁻¹`, fixing the anti-hom into a genuine hom).
    • ★ `trialityHom_Eidem σ i : trialityHom σ (Eidem i) = Eidem (σ i)` — the clean LEFT action.
    • ★★ `trialityHom_injective` — FAITHFULNESS: the triality group is a genuine copy of S₃,
      distinguished on the derived idempotents (via `Eidem_inj`).
    • ★ `trialityHom_jordan` / `trialityHom_one` — every triality element is a Jordan automorphism
      fixing the Jordan unit.
    • ★★ `trialityHom_nonabelian` — the triality group is GENUINELY NONABELIAN (full S₃, NOT just the
      ℤ₃ cycle): a transposition and the 3-cycle do not commute.
    • ★★ `trialityHom_gcyc_order3` / `trialityHom_gcyc_ne_one` — the C6-forced generation cycle `gcyc`
      is precisely the distinguished ℤ₃ subgroup of the triality group.
    • ★★ slot permutation: `triality_swap01_slotBC` (`swap 0 1` exchanges `slotB ↔ slotC`),
      `triality_swap12_slotAB` (`swap 1 2` exchanges `slotA ↔ slotB`) — the triality group permutes
      the three 8-dim matter slots (the Spin(8)-triality vector ↔ spinor exchanges).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). Spin(8) triality (the outer S₃ automorphism of
  the D₄ Dynkin diagram permuting the vector 8_v and the two spinor 8_s, 8_c) is standard structure
  (Baez, Yokota, the Freudenthal magic-square literature). Here the triality group is CONSTRUCTED
  forward as the submatrix-conjugation symmetry of the DERIVED exceptional Jordan arena over the
  cascade ground ring ℚ: the homomorphism, its faithfulness, its nonabelian-ness, the ℤ₃ generation
  cycle, and the matter-slot permutation all DESCEND from the banked `pconj_jb`/`pconj_Eidem`/
  `Eidem_inj`/`gcyc` — NOT a posited outer automorphism, NOT an imported group-theory fact, NOT a
  posited Lie/Spin group, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "triality / generation / matter / slot /
  Spin(8) / vector / spinor / cap-forced / self-blind": what remains is the theorem that the map
  `σ ↦ (X ↦ X.submatrix σ⁻¹ σ⁻¹)` is a faithful monoid homomorphism `Equiv.Perm (Fin 3) →* Module.End
  ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))` that distributes over `jb C X := C*X + X*C`, fixes `1`, sends the
  diagonal idempotent `Eidem i` to `Eidem (σ i)`, is nonabelian, contains an order-3 element, and
  exchanges the off-diagonal embeddings `slotB ↔ slotC` (under `swap 0 1`) and `slotA ↔ slotB` (under
  `swap 1 2`). No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no proof-hole, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the arena is over the DERIVED `O ℚ`), NO posited group.
-/
import Phys.Algebra.OctonionJordanGenerationCycleBornSplit
import Phys.Algebra.OctonionJordanThreeMatterSlots

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The exceptional Jordan arena `J₃(𝕆) = Matrix (Fin 3) (Fin 3) (O ℚ)`. -/
abbrev TrialityArena := Matrix (Fin 3) (Fin 3) (O ℚ)

/-! ## `pconjL` is an anti-homomorphism of the composition monoid. -/

/-- Composition of two permutation conjugations: `pconj a ∘ pconj b = pconj (b * a)` (submatrix
    composes contravariantly). -/
theorem pconj_comp (a b : Equiv.Perm (Fin 3)) (X : TrialityArena) :
    pconj a (pconj b X) = pconj (b * a) X := by
  unfold pconj; rw [Matrix.submatrix_submatrix]; rfl

/-- `pconjL 1 = 1` (the identity permutation gives the identity endomorphism). -/
theorem pconjL_one : (pconjL (1 : Equiv.Perm (Fin 3))) = (1 : Module.End ℚ TrialityArena) := by
  apply LinearMap.ext; intro X
  simp only [pconjL_apply, Module.End.one_apply]
  unfold pconj; rw [Equiv.Perm.coe_one, Matrix.submatrix_id_id]

/-- `pconjL a * pconjL b = pconjL (b * a)` — the anti-homomorphism law. -/
theorem pconjL_mul (a b : Equiv.Perm (Fin 3)) :
    pconjL a * pconjL b = pconjL (b * a) := by
  apply LinearMap.ext; intro X
  simp only [Module.End.mul_apply, pconjL_apply]; exact pconj_comp a b X

/-! ## The triality group homomorphism `S₃ →* Aut(J₃(𝕆))`. -/

/-- ★ THE TRIALITY GROUP HOMOMORPHISM. Since `pconjL` is an anti-homomorphism, precomposing with the
    group inverse turns it into a genuine monoid homomorphism `Equiv.Perm (Fin 3) →* Module.End ℚ`
    of the derived exceptional Jordan arena — the triality group of `J₃(𝕆)`. -/
noncomputable def trialityHom : Equiv.Perm (Fin 3) →* Module.End ℚ TrialityArena where
  toFun σ := pconjL σ⁻¹
  map_one' := by rw [inv_one]; exact pconjL_one
  map_mul' σ τ := by
    show pconjL (σ * τ)⁻¹ = pconjL σ⁻¹ * pconjL τ⁻¹
    rw [pconjL_mul, ← _root_.mul_inv_rev]

theorem trialityHom_apply (σ : Equiv.Perm (Fin 3)) : trialityHom σ = pconjL σ⁻¹ := rfl

/-- ★ THE CLEAN LEFT ACTION on the cap-forced generation idempotents:
    `trialityHom σ (Eidem i) = Eidem (σ i)`. -/
theorem trialityHom_Eidem (σ : Equiv.Perm (Fin 3)) (i : Fin 3) :
    trialityHom σ (Eidem i) = Eidem (σ i) := by
  rw [trialityHom_apply, pconjL_apply, pconj_Eidem, Equiv.Perm.inv_def, Equiv.symm_symm]

/-- ★★ FAITHFULNESS: the triality group is a genuine copy of the full permutation group `S₃`,
    distinguished on the DERIVED idempotents. -/
theorem trialityHom_injective : Function.Injective trialityHom := by
  intro σ τ h
  apply Equiv.Perm.ext; intro i
  have hh := congrArg (fun (f : Module.End ℚ TrialityArena) => f (Eidem i)) h
  simp only [trialityHom_Eidem] at hh
  exact Eidem_inj hh

/-! ## Every triality element is a Jordan automorphism. -/

/-- ★ Each triality element distributes over the Jordan product `jb C X := C*X + X*C` — it is a
    JORDAN AUTOMORPHISM (via the banked `pconj_jb`, needing NO associativity). -/
theorem trialityHom_jordan (σ : Equiv.Perm (Fin 3)) (C X : TrialityArena) :
    trialityHom σ (jb C X) = jb (trialityHom σ C) (trialityHom σ X) := by
  rw [trialityHom_apply, pconjL_apply, pconjL_apply, pconjL_apply, pconj_jb]

/-- ★ Each triality element fixes the Jordan unit `1`. -/
theorem trialityHom_one (σ : Equiv.Perm (Fin 3)) : trialityHom σ (1 : TrialityArena) = 1 := by
  rw [trialityHom_apply, pconjL_apply]; unfold pconj; rw [Matrix.submatrix_one_equiv]

/-! ## The triality group is genuinely S₃ (nonabelian), with the C6 cycle as its ℤ₃. -/

/-- ★★ THE TRIALITY GROUP IS NONABELIAN — a genuine S₃, not merely the ℤ₃ generation cycle: a
    transposition and the 3-cycle do NOT commute. -/
theorem trialityHom_nonabelian :
    trialityHom (Equiv.swap 0 1) * trialityHom gcyc
      ≠ trialityHom gcyc * trialityHom (Equiv.swap 0 1) := by
  rw [← trialityHom.map_mul, ← trialityHom.map_mul]
  intro h
  have := trialityHom_injective h
  revert this; decide

/-- ★★ THE C6-FORCED GENERATION CYCLE `gcyc` IS THE DISTINGUISHED ℤ₃ SUBGROUP of the triality group:
    `trialityHom gcyc` has order 3. -/
theorem trialityHom_gcyc_order3 : trialityHom gcyc ^ 3 = 1 := by
  rw [← trialityHom.map_pow]
  have : gcyc ^ 3 = 1 := by decide
  rw [this, trialityHom.map_one]

/-- ★★ ... and is nontrivial (the ℤ₃ is a genuine order-3 subgroup, not the identity). -/
theorem trialityHom_gcyc_ne_one : trialityHom gcyc ≠ 1 := by
  rw [← trialityHom.map_one]
  intro h
  exact gcyc_ne_one (trialityHom_injective h)

/-! ## The triality group permutes the three 8-dimensional matter slots. -/

/-- ★★ THE VECTOR ↔ SPINOR TRIALITY EXCHANGE (i): the transposition `swap 0 1` exchanges the matter
    slots `slotB ↔ slotC` — the triality group acts on the three 8-dim matter carriers, not just the
    idempotents. -/
theorem triality_swap01_slotBC (u : O ℚ) :
    trialityHom (Equiv.swap 0 1) (slotB u) = slotC u := by
  rw [trialityHom_apply, pconjL_apply]
  unfold pconj slotB slotC Xz
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def]

/-- ★★ ... and back: `swap 0 1` sends `slotC ↦ slotB` (the exchange is an involution on the pair). -/
theorem triality_swap01_slotCB (u : O ℚ) :
    trialityHom (Equiv.swap 0 1) (slotC u) = slotB u := by
  rw [trialityHom_apply, pconjL_apply]
  unfold pconj slotB slotC Xz
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def]

/-- ★★ THE VECTOR ↔ SPINOR TRIALITY EXCHANGE (ii): the transposition `swap 1 2` exchanges the matter
    slots `slotA ↔ slotB` — a second independent exchange, confirming the full S₃ permutation of the
    three 8-dim slots (two independent transpositions generate S₃). -/
theorem triality_swap12_slotAB (u : O ℚ) :
    trialityHom (Equiv.swap 1 2) (slotA u) = slotB u := by
  rw [trialityHom_apply, pconjL_apply]
  unfold pconj slotA slotB Xz
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def]

/-! ## W8 non-vacuity witness: a concrete nonabelian bite read off the idempotents. -/

/-- ★ W8: the triality nonabelian-ness has concrete content — `swap 0 1` and `gcyc`, applied in the
    two orders to the idempotent `Eidem 0`, give DIFFERENT results (`Eidem 1 ≠ Eidem 2`), so the
    triality group genuinely does not commute (a witnessed, not merely abstract, nonabelian-ness). -/
theorem triality_noncomm_witness :
    (trialityHom (Equiv.swap 0 1) * trialityHom gcyc) (Eidem 0)
      ≠ (trialityHom gcyc * trialityHom (Equiv.swap 0 1)) (Eidem 0) := by
  rw [← trialityHom.map_mul, ← trialityHom.map_mul, trialityHom_Eidem, trialityHom_Eidem]
  have hne : (Equiv.swap (0 : Fin 3) 1 * gcyc) 0 ≠ (gcyc * Equiv.swap (0 : Fin 3) 1) 0 := by decide
  intro h
  exact hne (Eidem_inj h)

end Phys.Algebra.HJ
