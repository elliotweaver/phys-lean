/-
  Phys.Algebra.TowerGatherObstructionRep7 — N222: THE GLUING-OBSTRUCTION COCYCLE IS A
  g₂-EQUIVARIANT MAP INTO THE FUNDAMENTAL 7-REPRESENTATION (ImO).
  ===========================================================================
  A STILL-DEEPER CUT of the N219/N220/N221 gather frontier (under the OVERNIGHT LOCK).
  N218T determined WHICH inter-world pairs glue across the derived Cayley–Dickson tower;
  N219 made the obstruction EXPLICIT as `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)` and
  IDENTIFIED it, on the octonion rung `O ℚ = CD (H ℚ)`, with the banked associator `[a,b,·]`
  (`o_gluingDefect_eq_assoc`); N220 determined its Hochschild-cohomological structure;
  N221 proved it is `Der(O ℚ) = g₂`-EQUIVARIANT and its calibration forms g₂-INVARIANT.

  THIS node decomposes the obstruction cocycle as an EXPLICIT g₂-REPRESENTATION. The
  associator (= the N219 gluing obstruction) is EXACTLY a g₂-equivariant map into the
  banked FUNDAMENTAL 7-REPRESENTATION `ImO` (N22, `finrank ℚ ImO = 7`, `imRep` faithful):

    (1) IT IS VALUED IN THE 7.  For all `x, y, z : O ℚ`, `reQ (assoc x y z) = 0`, hence
        `assoc x y z ∈ ImO` (`assoc_mem_ImO`; on the obstruction map itself
        `gluingDefect_mem_ImO`). The obstruction has ZERO trivial-rep (real) component — it
        lands entirely in the fundamental 7, never on the unit line (the trivial rep).

    (2) IT ANNIHILATES THE TRIVIAL REP.  The associator kills the unit in each slot:
        `assoc 1 y z = assoc x 1 z = assoc x y 1 = 0` (`assoc_one_left`/`_mid`/`_right`).
        So the cocycle is trivial-rep-transparent — it factors through the imaginary part
        `ImO = 7` in every argument.

    (3) IT IS A g₂-INTERTWINER INTO THE 7.  As an element of the banked fundamental 7-rep
        `imRep` (N22), the associator transforms by the Leibniz sum:
          `imRep D ⟨[x,y,z]⟩ = [Dx,y,z] + [x,Dy,z] + [x,y,Dz]`
        (`assoc_imRep_equivariant`) — i.e. the trilinear map `(x,y,z) ↦ [x,y,z] ∈ 7` is a
        morphism of `g₂ = Der(O ℚ)`-modules (this is the representation-theoretic content of
        N221's equivariance: the obstruction is a g₂-module map whose values live in the 7).

    (4) NON-VACUITY (W8).  At the cascade's non-associating imaginary witness triple
        (`wa, wb, wc ∈ ImO`), the obstruction is a genuinely NONZERO element of the 7
        (`obstruction_nonzero_in_seven`, banked `assoc_nonvanishing`) — the map into the
        fundamental 7 is not the zero morphism.

  THE DISCOVERED CONTENT (withheld — read off the banked derivation algebra + metric, NOT
  posited). N221 said the obstruction cocycle carries the g₂ symmetry; N222 says WHICH
  g₂-representation its VALUES live in — the FUNDAMENTAL 7 (ImO), the same 7 the gauge arc
  (isospin branching N189–N192, the colour/isospin decomposition of the 7) is built on. The
  gluing obstruction is a g₂-equivariant map `O ℚ³ → 7` that kills the trivial rep: the
  local→global obstruction of the derived tower is valued precisely in the fundamental
  representation of its own automorphism algebra `g₂ = Der(O)`. One cause — the octonion
  non-associativity — produces an obstruction that is not just g₂-equivariant (N221) but a
  g₂-module map into the exceptional group's defining 7-representation.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "world / gather / glue / obstruction /
  cocycle / representation / fundamental / intertwiner / g₂ / isospin": over the derived field
  `ℚ` and the Cayley–Dickson double of a double `O ℚ = CD (H ℚ)`, for the associator
  `assoc x y z = (x·y)·z − x·(y·z)` and the imaginary subspace `ImO = ker(star + 1)`:
  `reQ (assoc x y z) = 0` so `assoc x y z ∈ ImO`; `assoc 1 y z = assoc x 1 z = assoc x y 1 = 0`;
  the restriction-to-`ImO` of every ℚ-linear Leibniz endomorphism `D` sends `[x,y,z]` to
  `[Dx,y,z] + [x,Dy,z] + [x,y,Dz]`; and at the non-associating triple `assoc ≠ 0` in `ImO`.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no posited representation structure as content, no Mathlib
  ℝ/ℂ as content (ℚ is the coefficient field; the OBJECT is the derived octonion rung
  `O ℚ = CD (H ℚ)`, the banked associator (Alternative.lean N5b), the banked N219 `gluingDefect`,
  the banked fundamental 7-module `ImO`/`imRep` (N22), the banked `trace_id`/`reQ` (N17), and the
  banked N221 `assoc_derivQ_equivariant_O`), no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.TowerGatherObstructionInvariant
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-! ## (1) THE OBSTRUCTION COCYCLE IS VALUED IN THE FUNDAMENTAL 7-REPRESENTATION `ImO`. -/

/-- The associator (= the N219 gluing obstruction) has ZERO trivial-rep (real) component:
    `reQ (assoc x y z) = 0` for ALL `x, y, z`. A bounded coordinate identity on the
    Cayley–Dickson product, the SAME shape as the banked `assoc_reQ_skew` (N210) — forced by
    the real-part trace-associativity of `O ℚ`, NO degree-4 expansion. -/
theorem reQ_assoc_zero (x y z : O ℚ) : reQ (assoc x y z) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

/-- THE `reQ = 0 → ImO` BRIDGE (converse of the banked `reQ_ImO_zero`, N206): a zero-real-part
    element is imaginary. From the banked trace identity `x + star x = (2 reQ x)•1` (N17): with
    `reQ x = 0`, `x + star x = 0`, so `star x = −x`, i.e. `x ∈ ImO`. -/
theorem mem_ImO_of_reQ_zero {x : O ℚ} (hx : reQ x = 0) : x ∈ ImO := by
  rw [mem_ImO]
  have ht := trace_id x
  rw [hx] at ht
  simp only [mul_zero, zero_smul] at ht
  exact eq_neg_of_add_eq_zero_right ht

/-- ★★★ (1) THE HEADLINE: THE GLUING-OBSTRUCTION COCYCLE IS VALUED IN THE FUNDAMENTAL 7 (`ImO`).
    For all `x, y, z`, the associator (= the N219 gluing obstruction) lies in the banked
    finrank-7 fundamental `g₂`-module `ImO` (N22). The obstruction has zero trivial-rep
    component — it lands entirely in the 7, never on the unit line. -/
theorem assoc_mem_ImO (x y z : O ℚ) : assoc x y z ∈ ImO :=
  mem_ImO_of_reQ_zero (reQ_assoc_zero x y z)

/-- ★ (1′) THE SAME on the N219 obstruction map `gluingDefect` (definitional tie on `O ℚ`,
    `gluingDefect a b x = assoc a b x`): the explicit gluing obstruction is valued in the 7. -/
theorem gluingDefect_mem_ImO (a b x : O ℚ) : gluingDefect a b x ∈ ImO := by
  have h : gluingDefect a b x = assoc a b x := rfl
  rw [h]; exact assoc_mem_ImO a b x

/-! ## (2) THE OBSTRUCTION COCYCLE ANNIHILATES THE TRIVIAL REP (the unit) IN EACH SLOT. -/

/-- The associator kills the unit in the FIRST slot: `assoc 1 y z = 0`. -/
theorem assoc_one_left (y z : O ℚ) : assoc (1 : O ℚ) y z = 0 := by
  unfold assoc; simp [one_mul]

/-- The associator kills the unit in the MIDDLE slot: `assoc x 1 z = 0`. -/
theorem assoc_one_mid (x z : O ℚ) : assoc x (1 : O ℚ) z = 0 := by
  unfold assoc; simp [one_mul, mul_one]

/-- The associator kills the unit in the LAST slot: `assoc x y 1 = 0`. -/
theorem assoc_one_right (x y : O ℚ) : assoc x y (1 : O ℚ) = 0 := by
  unfold assoc; simp [mul_one]

/-! ## (3) THE OBSTRUCTION IS A g₂-INTERTWINER INTO THE 7 — it transforms under `imRep`. -/

/-- ★★ (3) THE g₂-INTERTWINER: the associator, VIEWED AS AN ELEMENT OF THE FUNDAMENTAL 7-REP
    `imRep` (N22), transforms by the Leibniz sum. For every `D ∈ derivationLieQ = g₂`, the
    action of the banked fundamental 7-representation `imRep D` on the obstruction cocycle
    `⟨[x,y,z]⟩ ∈ ImO` equals the total Leibniz variation:
      `imRep D ⟨[x,y,z]⟩ = [Dx,y,z] + [x,Dy,z] + [x,y,Dz]`.
    So the trilinear map `(x,y,z) ↦ [x,y,z] ∈ 7` is a MORPHISM OF `g₂`-MODULES (the
    representation-theoretic content of the N221 equivariance `assoc_derivQ_equivariant_O`). -/
theorem assoc_imRep_equivariant (D : derivationLieQ) (x y z : O ℚ) :
    ((imRep D ⟨assoc x y z, assoc_mem_ImO x y z⟩ : ImO) : O ℚ)
      = assoc ((D : Module.End ℚ (O ℚ)) x) y z + assoc x ((D : Module.End ℚ (O ℚ)) y) z
        + assoc x y ((D : Module.End ℚ (O ℚ)) z) := by
  rw [imRep_coe]
  exact assoc_derivQ_equivariant_O (D : Module.End ℚ (O ℚ)) D.2 x y z

/-! ## (4) W8 NON-VACUITY — a genuinely NONZERO element of the fundamental 7. -/

/-- The first witness input `ι(ιJ)` is imaginary (lies in the 7). -/
theorem wa_mem_ImO : (CD.iota (ιJ ℚ) : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;>
  simp [CD.iota, ιJ, Dbl.J, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']

/-- The second witness input `ι(e₂)` is imaginary (lies in the 7). -/
theorem wb_mem_ImO : (CD.iota (CD.e2 : H ℚ) : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;>
  simp [CD.iota, CD.e2, CD.star_re, CD.star_im]

/-- The third witness input `e₂` is imaginary (lies in the 7). -/
theorem wc_mem_ImO : (CD.e2 : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;>
  simp [CD.e2, CD.star_re, CD.star_im]

/-- ★ W8 NON-VACUITY: the gluing-obstruction cocycle is a genuinely NONZERO element of the
    fundamental 7 (`ImO`) at the cascade's non-associating imaginary witness triple (banked
    `assoc_nonvanishing`). So the map into the 7 is not the zero morphism. -/
theorem obstruction_nonzero_in_seven :
    (⟨assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ),
        assoc_mem_ImO _ _ _⟩ : ImO) ≠ 0 := by
  intro h
  have h0 : assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) = 0 := by
    have := congrArg (Subtype.val) h
    simpa using this
  exact assoc_nonvanishing h0

/-! ## THE CAPSTONE — the gluing obstruction is a g₂-equivariant map into the fundamental 7. -/

/-- ★★★ THE FUNDAMENTAL-7 REPRESENTATION STRUCTURE OF THE GLUING OBSTRUCTION on `O ℚ`:
      • the obstruction cocycle (= the associator) is VALUED IN THE FUNDAMENTAL 7 (`ImO`, N22);
      • it ANNIHILATES THE TRIVIAL REP (the unit) in each slot;
      • as an element of the banked fundamental 7-rep `imRep`, it is a g₂-INTERTWINER
        (transforms by the Leibniz sum);
      • it is a genuinely NONZERO element of the 7 at the non-associating witness triple.
    The gather obstruction (N218T–N221) is a g₂-equivariant map `O ℚ³ → 7` into the fundamental
    representation of the gauge carrier `g₂ = Der(O)` (N16–N207). Physics-words-removable: the
    associator has zero real part (lands in `ImO = ker(star+1)`), kills the unit in each slot,
    and restricts to `ImO` as the Leibniz-sum intertwiner. -/
theorem obstruction_seven_rep_structure :
    -- (1) valued in the fundamental 7
    (∀ x y z : O ℚ, assoc x y z ∈ ImO) ∧
    -- (2) annihilates the trivial rep (unit) in each slot
    (∀ y z : O ℚ, assoc (1 : O ℚ) y z = 0) ∧
    (∀ x z : O ℚ, assoc x (1 : O ℚ) z = 0) ∧
    (∀ x y : O ℚ, assoc x y (1 : O ℚ) = 0) ∧
    -- (3) g₂-intertwiner into the 7 (transforms by the Leibniz sum under imRep)
    (∀ (D : derivationLieQ) (x y z : O ℚ),
      ((imRep D ⟨assoc x y z, assoc_mem_ImO x y z⟩ : ImO) : O ℚ)
        = assoc ((D : Module.End ℚ (O ℚ)) x) y z + assoc x ((D : Module.End ℚ (O ℚ)) y) z
          + assoc x y ((D : Module.End ℚ (O ℚ)) z)) ∧
    -- (4) non-vacuity: a genuinely nonzero element of the 7
    ((⟨assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ),
        assoc_mem_ImO _ _ _⟩ : ImO) ≠ 0) :=
  ⟨assoc_mem_ImO, assoc_one_left, assoc_one_mid, assoc_one_right,
    assoc_imRep_equivariant, obstruction_nonzero_in_seven⟩

end Phys.Algebra
