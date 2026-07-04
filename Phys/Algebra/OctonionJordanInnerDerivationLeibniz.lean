/-
  Phys.Algebra.OctonionJordanInnerDerivationLeibniz —
  N286: THE INNER-DERIVATION LEIBNIZ LAW `innerMul(Herm) ∈ derH3` (`f₄ ⊋ g₂` PROPER),
        BY LINEARIZING THE BANKED CAP IDENTITY `jdef_H3`.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the fold's own cap, linearized).
  The fold → self-blindness → complex unit → cascade → the terminal, NON-ASSOCIATIVE
  octonions `O ℚ`. That non-associativity CAPS the Hermitian Jordan tower at order 3
  (N5 `jordan_cap_pinned_at_three`): `H₃(O ℚ)` is the maximal matter arena. N285 built the
  arena's genuine derivation Lie algebra `derH3 = Der(H₃(O)) = f₄`, re-seated the derived gauge
  g₂ faithfully inside it, and banked the MEASURED teeth that the inner-multiplication commutator
  `innerMul A B = ⁅L_A, L_B⁆` (for L_A X = jb A X) PRESERVES the Hermitian arena and ESCAPES g₂
  (moves the diagonal every entrywise gauge element fixes) — i.e. that it is a CANDIDATE member of
  f₄ outside g₂. What N285 deferred to this node is the GENUINE membership: that `innerMul(Herm)`
  actually SATISFIES the Jordan-derivation Leibniz law on the arena, so it is literally INSIDE the
  derived f₄ — `f₄ ⊋ g₂` PROPER.

  THE DISSOLUTION (docs/RUNBOOK.md W1/W9). The classical fact "in a Jordan algebra `⁅L_a,L_b⁆` is a
  derivation" is the FULLY LINEARIZED Jordan identity. The brute coordinate route to the order-3
  Jordan defect is a measured instrument-wall (16 min / 9 GB, `HermitianJordan/Linear.lean`). The
  theory-native route DISSOLVES it: the derivation defect is an EXACT rational combination of the
  banked cap identity `jdef` polarized in its arguments,

      d(A,B,X,Y) := innerMul A B (jb X Y) − jb (innerMul A B X) Y − jb X (innerMul A B Y)
                  = ½·PolJ(B,X,Y;A) − ½·PolJ(A,X,Y;B),

  where `PolJ(u,v,w;t)` is the trilinear polarization of `P ↦ jdef P t`. This identity is a FORMAL
  identity of the FREE non-associative ring (verified: it holds over the NON-alternative sedenions
  too, `workbench/N286/probe_free.py`; and the two sides are EQUAL monomial-by-monomial in the free
  ℚ-algebra on {A,B,X,Y}, `workbench/N286/probe_freealg.py`), so in Lean it is proved by pure
  bracket biadditivity (`simp only [jb, jdef, mul_add, add_mul, …]; abel`) with ZERO octonion
  coordinate expansion — the heavy 9 GB bash NEVER enters. On Hermitian arguments each `jdef` term
  vanishes by the banked `jdef_H3` (the argument of every `jdef` in each `PolJ` is a SUM of
  Hermitian matrices, hence Hermitian), so `2 • d = 0`, hence `d = 0` (ℚ is two-torsion-free) — the
  Leibniz law. The moat: the cap identity `jdef_H3` that powers this is DERIVED from the fold, not
  imported; the field POSITS the Jordan algebra and cites the classical theorem.

  WHAT THIS NODE PROVES:
    · `self_adjoint_ocR` / `herm_eq_Hm` — a Hermitian matrix over `O ℚ` reconstructs as the general
                     `Hm` shape (self-adjoint diagonal = real, `ocR ∘ reQ`; off-diagonals free).
    · `jdef_herm` — the order-3 Jordan defect vanishes for EVERY general Hermitian pair (not just
                     the `Hm`-shaped): `Aᴴ=A → Bᴴ=B → jdef A B = 0` (via reconstruction + `jdef_H3`).
    · `inner_leibniz_two` — THE POLARIZED CAP: the abstract free-ring identity `2 • d = PolJ − PolJ`
                     over ANY `NonAssocRing` matrix arena (biadditivity + `abel`; no coordinates).
    · `innerMul_leibniz_herm` — the Jordan-derivation Leibniz law for `innerMul(Herm)` on Hermitian
                     arguments (the deferred half of the membership).
    · `innerMul_mem_derH3` — ★ THE DELIVERABLE: `innerMul A B ∈ derH3` for Hermitian A,B (the full
                     `IsHermJordanDerivQ` membership: preservation `innerMul_herm` ∧ Leibniz law).
    · capstone `inner_derivation_in_f4` — a CONCRETE member `innerMul (slotA 1)(slotB 1) ∈ derH3`
                     that MOVES the diagonal g₂ fixes (escapes g₂) — `f₄ ⊋ g₂` PROPER — carrying
                     `jordan_fails_H4` (the cap in the type).

  ONE CAUSE MANY TERMINATIONS: the SAME octonion non-associativity that stops the cascade, caps the
  Hermitian Jordan tower at order 3, and makes `H₃(O)` the maximal arena, now — LINEARIZED — makes
  the inner-derivation complement a genuine derivation of that arena, placing `f₄ ⊋ g₂` PROPER.

  SCOPE / HONESTY (what is NOT claimed here):
    · NOT that `derH3` is spanned by g₂ + inner derivations (a dimension count / basis), NOT the
      electroweak factors placed inside f₄, NOT the ★2 mixing-angle VALUE (INPUT B, human-gated).
    · NOT "= the physical F₄ / the Albert automorphism group" as a literal identity — removable prose.

  Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

set_option synthInstance.maxSize 400000

/-! ## R0 — Hermitian reconstruction: a self-adjoint matrix over `O ℚ` is a general `Hm`. -/

/-- A SELF-ADJOINT octonion is REAL: if `star z = z` then `z = ocR (reQ z)`. Star negates every
    imaginary Cayley–Dickson layer, so `star z = z` forces all seven imaginary coordinates to zero,
    leaving the single real coordinate `reQ z = z.re.re.re`. Destructured to eight rational
    coordinates; no octonion product. -/
theorem self_adjoint_ocR (z : O ℚ) (hz : star z = z) : z = ocR (reQ z) := by
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := z
  have hstar : star (⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ : O ℚ)
      = ⟨⟨⟨a, -b⟩, ⟨-c, -d⟩⟩, ⟨⟨-e, -f⟩, ⟨-g, -h⟩⟩⟩ := rfl
  rw [hstar] at hz
  simp only [CD.mk.injEq, Dbl.mk.injEq] at hz
  simp only [ocR, reQ]
  obtain ⟨⟨⟨_, hb⟩, hc, hd⟩, ⟨he, hf⟩, hg, hh⟩ := hz
  have hb0 : b = 0 := by linarith
  have hc0 : c = 0 := by linarith
  have hd0 : d = 0 := by linarith
  have he0 : e = 0 := by linarith
  have hf0 : f = 0 := by linarith
  have hg0 : g = 0 := by linarith
  have hh0 : h = 0 := by linarith
  subst hb0 hc0 hd0 he0 hf0 hg0 hh0
  rfl

/-- THE HERMITIAN RECONSTRUCTION. Every Hermitian matrix `Aᴴ = A` over `O ℚ` is the general
    Hermitian shape `Hm` with real diagonal `reQ (A i i)` and off-diagonals `A 0 1, A 0 2, A 1 2`
    (their conjugates below the diagonal are forced by `Aᴴ = A`). Entrywise: diagonal via
    `self_adjoint_ocR`, sub-diagonal via `Aᴴ = A`. -/
theorem herm_eq_Hm (A : Matrix (Fin 3) (Fin 3) (O ℚ)) (hA : Aᴴ = A) :
    A = Hm (reQ (A 0 0)) (reQ (A 1 1)) (reQ (A 2 2)) (A 0 1) (A 0 2) (A 1 2) := by
  have hentry : ∀ i j, star (A j i) = A i j := fun i j => congrFun (congrFun hA i) j
  apply Matrix.ext
  intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [Hm, of_apply, cons_val', empty_val', cons_val_fin_one]
  · exact self_adjoint_ocR (A 0 0) (hentry 0 0)
  · rfl
  · rfl
  · exact (hentry 1 0).symm
  · exact self_adjoint_ocR (A 1 1) (hentry 1 1)
  · rfl
  · exact (hentry 2 0).symm
  · exact (hentry 2 1).symm
  · exact self_adjoint_ocR (A 2 2) (hentry 2 2)

/-- THE CAP ON THE GENERAL HERMITIAN SUBSPACE. The order-3 Jordan defect vanishes for EVERY pair of
    general Hermitian matrices (`Aᴴ = A`, `Bᴴ = B`), not only the explicitly-`Hm`-shaped ones:
    `jdef A B = 0`. Reconstruct both as `Hm` (`herm_eq_Hm`) and apply the banked `jdef_H3`. -/
theorem jdef_herm {A B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) (hB : Bᴴ = B) :
    jdef A B = 0 := by
  rw [herm_eq_Hm A hA, herm_eq_Hm B hB]
  exact jdef_H3 _ _ _ _ _ _ _ _ _ _ _ _

/-! ## R1 — the polarized cap: the derivation defect is a free-ring combination of `jdef`s. -/

set_option maxHeartbeats 1000000 in
/-- ★★ THE POLARIZED CAP IDENTITY (ABSTRACT, any `NonAssocRing`). Twice the Jordan-derivation defect
    of the inner-multiplication commutator equals a fixed integer combination of the order-3 Jordan
    defect `jdef` with its first argument polarized:

        2 • d(A,B,X,Y) = PolJ(B,X,Y;A) − PolJ(A,X,Y;B),   where
        d(A,B,X,Y) = ⁅L_A,L_B⁆(jb X Y) − jb (⁅L_A,L_B⁆ X) Y − jb X (⁅L_A,L_B⁆ Y),
        PolJ(u,v,w;t) = jdef(u+v+w,t) − jdef(u+v,t) − jdef(u+w,t) − jdef(v+w,t)
                        + jdef(u,t) + jdef(v,t) + jdef(w,t).

    This is a FORMAL identity of the free non-associative ring — the two sides are equal
    monomial-by-monomial once the brackets are expanded by biadditivity — so it is closed by
    `simp only [jb, jdef, distributivity]; abel` with NO coordinate expansion and NO alternativity.
    It is the exact linearization of the banked cap that turns "cap holds on Hermitian pairs" into
    "the inner commutator is a derivation of the Hermitian arena." -/
theorem inner_leibniz_two (A B X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (jb A (jb B (jb X Y)) - jb B (jb A (jb X Y))
        - jb (jb A (jb B X) - jb B (jb A X)) Y
        - jb X (jb A (jb B Y) - jb B (jb A Y)))
    + (jb A (jb B (jb X Y)) - jb B (jb A (jb X Y))
        - jb (jb A (jb B X) - jb B (jb A X)) Y
        - jb X (jb A (jb B Y) - jb B (jb A Y)))
    =
    ( (jdef (B + X + Y) A - jdef (B + X) A - jdef (B + Y) A - jdef (X + Y) A
        + jdef B A + jdef X A + jdef Y A)
    - (jdef (A + X + Y) B - jdef (A + X) B - jdef (A + Y) B - jdef (X + Y) B
        + jdef A B + jdef X B + jdef Y B) ) := by
  simp only [jb, jdef, mul_add, add_mul, mul_sub, sub_mul]
  abel

/-! ## R2 — the Leibniz law for `innerMul(Herm)` on Hermitian arguments. -/

/-- Hermitian matrices are closed under addition (`(A+B)ᴴ = A+B`). -/
theorem herm_add {A B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) (hB : Bᴴ = B) :
    (A + B)ᴴ = A + B := by rw [conjTranspose_add, hA, hB]

/-- ★★★ THE INNER-DERIVATION LEIBNIZ LAW. For Hermitian `A, B, X, Y` the inner-multiplication
    commutator `innerMul A B = ⁅L_A, L_B⁆` satisfies the Jordan-derivation Leibniz law:

        `innerMul A B (jb X Y) = jb (innerMul A B X) Y + jb X (innerMul A B Y)`.

    From the polarized cap `inner_leibniz_two`, twice the defect is a combination of `jdef`s each of
    whose arguments is a sum of Hermitian matrices (`herm_add`), hence Hermitian, so each vanishes by
    `jdef_herm`. Thus `2 • d = 0`; since the matrix arena is a ℚ-module (two-torsion-free), `d = 0`. -/
theorem innerMul_leibniz_herm {A B X Y : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (hA : Aᴴ = A) (hB : Bᴴ = B) (hX : Xᴴ = X) (hY : Yᴴ = Y) :
    innerMul A B (jb X Y) = jb (innerMul A B X) Y + jb X (innerMul A B Y) := by
  -- abbreviate the derivation defect
  set d : Matrix (Fin 3) (Fin 3) (O ℚ) :=
    jb A (jb B (jb X Y)) - jb B (jb A (jb X Y))
      - jb (jb A (jb B X) - jb B (jb A X)) Y
      - jb X (jb A (jb B Y) - jb B (jb A Y)) with hd
  -- every jdef in the polarized cap has Hermitian arguments, hence vanishes (jdef_herm)
  have hBXY : (B + X + Y)ᴴ = B + X + Y := herm_add (herm_add hB hX) hY
  have hBX : (B + X)ᴴ = B + X := herm_add hB hX
  have hBY : (B + Y)ᴴ = B + Y := herm_add hB hY
  have hXY : (X + Y)ᴴ = X + Y := herm_add hX hY
  have hAXY : (A + X + Y)ᴴ = A + X + Y := herm_add (herm_add hA hX) hY
  have hAX : (A + X)ᴴ = A + X := herm_add hA hX
  have hAY : (A + Y)ᴴ = A + Y := herm_add hA hY
  -- 2 · d = (polarized-cap combination of jdef's) = 0
  have hkey : d + d = 0 := by
    rw [hd, inner_leibniz_two]
    rw [jdef_herm hBXY hA, jdef_herm hBX hA, jdef_herm hBY hA, jdef_herm hXY hA,
        jdef_herm hB hA, jdef_herm hX hA, jdef_herm hY hA,
        jdef_herm hAXY hB, jdef_herm hAX hB, jdef_herm hAY hB, jdef_herm hXY hB,
        jdef_herm hA hB, jdef_herm hX hB, jdef_herm hY hB]
    abel
  -- d + d = 0 ⟹ d = 0 (the arena is a ℚ-module, hence two-torsion-free)
  have hd0 : d = 0 := by
    have h2 : (2 : ℚ) • d = 0 := by rw [two_smul]; exact hkey
    rcases smul_eq_zero.mp h2 with hz | hz
    · norm_num at hz
    · exact hz
  -- unfold d = 0 into the Leibniz equation
  rw [hd] at hd0
  simp only [innerMul_apply]
  rw [← sub_eq_zero, ← sub_sub]
  exact hd0

/-! ## R3 — the membership: `innerMul(Herm) ∈ derH3` (the deliverable). -/

/-- ★★★ THE DELIVERABLE — `f₄ ⊋ g₂` PROPER. For Hermitian `A, B`, the inner-multiplication
    commutator `innerMul A B` is a GENUINE member of the derived `f₄ = Der(H₃(O)) = derH3` (N285):
    it PRESERVES the Hermitian arena (`innerMul_herm`, N285) and satisfies the Jordan-derivation
    Leibniz law on Hermitian arguments (`innerMul_leibniz_herm`). So the inner-derivation complement
    — the structure the full-space `jDer` misses and the electroweak directions live in — is
    literally INSIDE the derived f₄, not merely adjacent to it. -/
theorem innerMul_mem_derH3 {A B : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (hA : Aᴴ = A) (hB : Bᴴ = B) : innerMul A B ∈ derH3 := by
  refine ⟨?_, ?_⟩
  · intro X hX
    exact innerMul_herm hA hB hX
  · intro X Y hX hY
    exact innerMul_leibniz_herm hA hB hX hY

/-! ## THE CAPSTONE. -/

/-- ★★★ N286 — `f₄ ⊋ g₂` PROPER. The inner-multiplication generator `innerMul (slotA 1)(slotB 1)`
    (matter slots are Hermitian, `slotA_one_herm`/`slotB_one_herm`, N285) is a GENUINE member of the
    derived `f₄ = derH3` (`innerMul_mem_derH3`), YET it MOVES the diagonal
    (`innerMul_moves_diagonal`, N274) that EVERY entrywise gauge element FIXES (`jAct_Dg`, N268) — so
    it is NOT in the entrywise image of g₂. The derived gauge g₂ = Der(O ℚ) is therefore a PROPER
    subalgebra of the derived f₄ = Der(H₃(O)): `f₄ ⊋ g₂`, with the inner-derivation complement now
    proved genuinely present INSIDE f₄. Carries `jordan_fails_H4` — the arena is genuine only at the
    cap-forced terminal order 3, NOT carrier-agnostic. -/
theorem inner_derivation_in_f4 :
    innerMul (slotA 1) (slotB 1) ∈ derH3
    ∧ innerMul (slotA 1) (slotB 1) (Dg 0 0 1) ≠ 0
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ d0 d1 d2, jAct D (Dg d0 d1 d2) = 0)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨innerMul_mem_derH3 slotA_one_herm slotB_one_herm,
   innerMul_moves_diagonal,
   fun D hD d0 d1 d2 => jAct_Dg D hD d0 d1 d2,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
