/-
  Phys.Algebra.TowerGatherForcedChargeDirection — N240.
  ===========================================================================
  THE FORCED u(1) CHARGE DIRECTION from the ATOMIZED GATHER OBSTRUCTION, read on the banked
  branching `7 = 3 ⊕ 3̄ ⊕ 1` (N42c). Owner-authorized gather-side hypercharge front, under the
  TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner authorization 2026-07-01).

  THE FRONT (gather-native, NOT the invariant-tower ascent). The inter-world gluing obstruction
  of the derived Cayley–Dickson tower — the associator / cross product — was made explicit
  (N218T/N219) and then embedded g₂-equivariantly INTO the skew-symmetry algebra `so(7)` of the
  fundamental 7 (`ImO`) as the cross-product operator `crossOp a : y ↦ octCross a y` (N223,
  `TowerGatherObstructionAdjointSo7`; the fundamental-7-in-so(7) tear, `so(7) = 14 ⊕ 7`).

  The banked branching `7 = 3 ⊕ 3̄ ⊕ 1` (N42c `DerivationStabilizerSplit`) SINGLES OUT exactly
  one element of the fundamental 7: the singlet generator `u1` — the cascade's distinguished
  square-root of `−1`, the axis of the colour complex structure `J = L_{u1}`. Feed THAT
  distinguished singlet element into the gather-obstruction operator. The result is a FORCED,
  covariant charge operator — no normalization choice, no posited u(1):

  ★ THE FORCED CHARGE OPERATOR:  `chargeOp := crossOp u1 ∈ so(7) ⊂ End ℚ ImO`.

  WHAT THIS FILE BANKS (all foundations-only):
    chargeOp                    — the gather tear on the branching singlet generator `u1`.
    chargeOp_mem_so7            — ★ it is a genuine element of the gather arena `so(7)`
                                  (`skewAdjointLieSubalgebra bornBil`, banked `crossOp_mem_so7`).
    chargeOp_ne_zero            — W8: it is nonzero (`crossOp_ne_zero`).
    chargeOp_kills_singlet      — ★ it ANNIHILATES the branching singlet `⟨u1⟩`
                                  (`octCross u1 u1 = 0`, banked `octCross_self`). The singlet `1`
                                  is the CHARGE-ZERO direction — DERIVED, not assigned.
    chargeOp_sq_coe             — ★★ `chargeOp²(y) = ⟨u1,y⟩•u1 − y` (banked `octCross_contraction`
                                  + `gForm_u1 = 1`). Restricted to the branching complement
                                  `V = 3 ⊕ 3̄` (Born-orthogonal to `u1`) this is `chargeOp² = −id`:
                                  the charge operator is a COMPLEX STRUCTURE on the `6 = 3 ⊕ 3̄`
                                  and ZERO on the `1`. Its eigen-grading REPRODUCES the branching
                                  `7 = 1 ⊕ (3 ⊕ 3̄)` (singlet at eigenvalue 0; the triplet/
                                  antitriplet as the `±i` eigenspaces of `chargeOp|_V`), now
                                  realized INSIDE the gather-obstruction `so(7)`.
    chargeOp_stabilizer_iff     — ★★★ THE COVARIANCE HEADLINE: the g₂-stabilizer of `chargeOp`,
                                  `{D | ⁅imRep D, chargeOp⁆ = 0}`, is EXACTLY colour
                                  `su(3) = colourCentralizer` (N201). Via the banked g₂-intertwiner
                                  `⁅imRep D, crossOp u1⁆ = crossOp (D u1)` (N223) + faithfulness of
                                  the fundamental-7 embedding (`crossOp_inj_on_ImO`, N224) + the
                                  colour criterion `D u1 = 0 ⟺ D ∈ su(3)` (N201 `commutes_JO_iff`).
    finrank_chargeStabilizer_eq_eight — the stabilizer has dimension `8` (the su(3) value).
    chargeOp_stabilizer_proper  — ★★ W8 TEETH: some derivation does NOT stabilize `chargeOp`
                                  (`⁅imRep DJ, chargeOp⁆ ≠ 0`, via banked `DJ_not_mem_colour`,
                                  N202). The charge direction is genuinely NOT central — the
                                  reduction `su(3) ⊊ g₂` is PROPER. An INVARIANT object (a trace
                                  form) is symmetric under the whole group and cannot force a
                                  direction; this COVARIANT gather obstruction can, and does.
    forced_charge_direction_structure — the capstone.

  THE MOAT (docs/STANDARD §0). The division-algebra-physics field POSITS hypercharge assignments
  (Baez: "nobody knows why"). Here the charge OPERATOR is not posited and not normalized: it is
  the value of the gather-obstruction tear (`crossOp`, N223) on the ONE element the branching
  `7 = 3 ⊕ 3̄ ⊕ 1` distinguishes (`u1`, N42c). Its symmetry is FORCED to be the banked colour
  `su(3)`. ONE cause — `u1`, the fold's √−1, simultaneously the gather-tear input, the colour
  complex-structure axis, and the branching singlet — MANY faces: the charge grading of the 7 AND
  the colour stabilizer, both derived, neither asserted.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / u(1) / colour /
  su(3) / gauge / singlet / triplet / complex structure": over the derived field ℚ and the
  Cayley–Dickson double `O ℚ = CD (H ℚ)`, for `ImO`, the cross-product endomorphism
  `crossOp a : y ↦ octCross a y`, and the fixed square-root-of-`−1` `u1`, the endomorphism
  `crossOp u1` is skew-adjoint for the restricted Born form, kills `u1`, satisfies
  `crossOp u1 (crossOp u1 y) = ⟨u1,y⟩•u1 − y`, and the Leibniz-derivations `D` with
  `⁅imRep D, crossOp u1⁆ = 0` are exactly those with `D u1 = 0` — an 8-dimensional PROPER Lie
  subalgebra of the 14-dimensional derivation algebra. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N223 (`crossOp`/`crossOp_mem_so7`/`crossOp_imRep_intertwine`),
  N224 (`crossOp_inj_on_ImO`/`crossEmb`), N206 (`octCross_self`/`octCross_contraction`), N24
  (`gForm_u1`), N201 (`colourCentralizer`/`commutes_JO_iff`/`isDerivQ_of_mem`), N202
  (`DJ`/`DJ_not_mem_colour`), N42c (`u1`), N22 (`imRep`/`ImO`/`derivLieQ_mapsTo`). Ground = derived
  ℚ; nothing posited; no Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationStabilizerSplit

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## THE FORCED CHARGE OPERATOR — the gather tear on the branching's distinguished singlet. -/

/-- ★ THE FORCED CHARGE OPERATOR: the gather-obstruction cross-product operator `crossOp` (N223,
    the fundamental-7-in-`so(7)` tear) evaluated on the branching's distinguished singlet
    generator `u1` (N42c, the cascade's √−1 = the colour complex-structure axis). NOT a posited
    u(1); the value of the gather tear on the ONE element the branching `7 = 3 ⊕ 3̄ ⊕ 1` singles
    out — no normalization choice. -/
def chargeOp : Module.End ℚ ImO := crossOp u1

/-- ★ `chargeOp` is a genuine element of the gather arena `so(7)` (`skewAdjointLieSubalgebra
    bornBil`), the skew-symmetry algebra of the Born form on the fundamental 7 — banked
    `crossOp_mem_so7` at `u1` (N223). -/
theorem chargeOp_mem_so7 : chargeOp ∈ skewAdjointLieSubalgebra bornBil :=
  crossOp_mem_so7 u1 u1_mem_ImO

/-- W8 NON-VACUITY: `chargeOp ≠ 0` (the forced charge operator is not the trivial map), via the
    banked `crossOp_ne_zero` (N223, `octCross u1 u2 ≠ 0`). -/
theorem chargeOp_ne_zero : chargeOp ≠ 0 := crossOp_ne_zero

/-! ## The charge operator's eigen-grading REPRODUCES the branching `7 = 1 ⊕ (3 ⊕ 3̄)`. -/

/-- ★ THE SINGLET IS THE CHARGE-ZERO DIRECTION: `chargeOp` ANNIHILATES the branching singlet
    generator `u1` (`octCross u1 u1 = 0`, banked `octCross_self`, N206). The `1` of
    `7 = 3 ⊕ 3̄ ⊕ 1` sits at eigenvalue `0` of the charge operator — DERIVED, not assigned. -/
theorem chargeOp_kills_singlet : chargeOp ⟨u1, u1_mem_ImO⟩ = 0 := by
  apply Subtype.ext
  show octCross u1 u1 = 0
  exact octCross_self u1_mem_ImO

/-- ★★ THE CHARGE OPERATOR SQUARED: `(chargeOp²(y) : O ℚ) = ⟨u1,y⟩•u1 − y` on the fundamental 7,
    from the banked triple-product contraction `octCross u1 (octCross u1 y) = ⟨u1,y⟩•u1 − ⟨u1,u1⟩•y`
    (N206) with `⟨u1,u1⟩ = 1` (N24 `gForm_u1`). On the branching complement `V = 3 ⊕ 3̄`
    (Born-orthogonal to `u1`, so `⟨u1,y⟩ = 0`) this is `chargeOp² = −id`: the charge operator is a
    COMPLEX STRUCTURE on the `6 = 3 ⊕ 3̄` and `0` on the `1`. Its eigen-grading is exactly the
    branching `7 = 1 ⊕ (3 ⊕ 3̄)` — the singlet at eigenvalue `0`, the triplet/antitriplet as the
    `±i` eigenspaces — now realized INSIDE the gather-obstruction `so(7)`. NO coordinate bash: the
    trunk's left-alternative contraction dissolves it (THE ONE LAW). -/
theorem chargeOp_sq_coe (y : ImO) :
    ((chargeOp (chargeOp y) : ImO) : O ℚ)
      = gForm u1 (y : O ℚ) • u1 - (y : O ℚ) := by
  show octCross u1 (octCross u1 (y : O ℚ)) = gForm u1 (y : O ℚ) • u1 - (y : O ℚ)
  rw [octCross_contraction u1_mem_ImO y.2, gForm_u1, one_smul]

/-! ## THE COVARIANCE HEADLINE — the charge direction's forced symmetry is colour `su(3)`. -/

/-- `crossOp 0 = 0` (helper: the gather tear of the zero direction is the zero operator). -/
theorem crossOp_zero : crossOp (0 : O ℚ) = 0 := by
  have h : crossOp (((0 : ImO) : O ℚ)) = crossEmb (0 : ImO) := (crossEmb_apply 0).symm
  rw [Submodule.coe_zero] at h
  rw [h, map_zero]

/-- ★★★ THE COVARIANCE HEADLINE: the g₂-stabilizer of the forced charge operator is EXACTLY the
    banked colour `su(3) = colourCentralizer` (N201). A derivation `D ∈ g₂ = derivationLieQ`
    stabilizes `chargeOp` under the adjoint action (`⁅imRep D, chargeOp⁆ = 0`) IF AND ONLY IF it
    lies in the colour centralizer. The mechanism is the banked g₂-intertwiner
    `⁅imRep D, crossOp u1⁆ = crossOp (D u1)` (N223): the bracket vanishes iff `crossOp (D u1) = 0`,
    which by faithfulness of the fundamental-7 embedding (`crossOp_inj_on_ImO`, N224 — the Born
    positivity making the tear faithful) forces `D u1 = 0`, i.e. `D ∈ colourCentralizer`
    (N201 `commutes_JO_iff`). The charge direction is COVARIANT — its unbroken symmetry is a
    FORCED reduction of the ambient g₂ to colour su(3). -/
theorem chargeOp_stabilizer_iff (D : derivationLieQ) :
    ⁅imRep D, chargeOp⁆ = 0 ↔ D ∈ colourCentralizer := by
  rw [chargeOp, crossOp_imRep_intertwine D u1, mem_colourCentralizer,
      commutes_JO_iff (isDerivQ_of_mem D)]
  constructor
  · intro h
    have hmem : (D : Module.End ℚ (O ℚ)) u1 ∈ ImO := derivLieQ_mapsTo D u1 u1_mem_ImO
    exact crossOp_inj_on_ImO hmem h
  · intro h
    rw [h, crossOp_zero]

/-- The g₂-stabilizer of the forced charge operator, as a Lie subalgebra of `g₂ = derivationLieQ`
    — equal to colour `su(3)` by `chargeOp_stabilizer_iff`. -/
def chargeStabilizer : LieSubalgebra ℚ derivationLieQ := colourCentralizer

/-- ★ The stabilizer of the forced charge direction equals colour `su(3)`, as Lie subalgebras. -/
theorem chargeStabilizer_eq_colour : chargeStabilizer = colourCentralizer := rfl

/-- ★ THE DIMENSION: the g₂-stabilizer of the forced charge direction is `8`-dimensional — the
    `su(3)` value (transport of the banked `finrank_colourCentralizer_eq_eight`, N201). -/
theorem finrank_chargeStabilizer_eq_eight :
    Module.finrank ℚ chargeStabilizer.toSubmodule = 8 :=
  finrank_colourCentralizer_eq_eight

/-- ★★ W8 TEETH — THE REDUCTION IS PROPER: some derivation does NOT stabilize the forced charge
    operator. The off-Cartan isospin generator `DJ` (N202) satisfies `⁅imRep DJ, chargeOp⁆ ≠ 0`,
    because `DJ ∉ colourCentralizer` (banked `DJ_not_mem_colour`, N202: `DJ u1 = ιO(−2•hK) ≠ 0`).
    So the forced charge direction is genuinely NOT central in `g₂` — its symmetry is a PROPER
    reduction `su(3) ⊊ g₂`, not the whole algebra. This is precisely what a COVARIANT object can
    do and an INVARIANT one (a trace form, symmetric under everything) cannot: force a direction. -/
theorem chargeOp_stabilizer_proper : ⁅imRep DJ, chargeOp⁆ ≠ 0 := by
  intro h
  exact DJ_not_mem_colour ((chargeOp_stabilizer_iff DJ).mp h)

/-! ## THE CAPSTONE. -/

/-- ★★★ THE FORCED u(1) CHARGE DIRECTION from the atomized gather obstruction. Over the derived
    `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the fundamental 7 `ImO`, the
    gather-obstruction cross-product operator `crossOp`, the branching singlet generator `u1`, and
    the banked colour centralizer `colourCentralizer`:
    (i)   `chargeOp = crossOp u1` is a nonzero element of the gather arena `so(7)`;
    (ii)  it annihilates the branching singlet `u1` (the charge-zero direction);
    (iii) `chargeOp²(y) = ⟨u1,y⟩•u1 − y` (a complex structure on the branching complement
          `V = 3 ⊕ 3̄`, `0` on the `1` — the eigen-grading REPRODUCES `7 = 1 ⊕ (3 ⊕ 3̄)`);
    (iv)  its g₂-stabilizer is EXACTLY colour `su(3) = colourCentralizer`, of dimension `8`;
    (v)   that reduction is PROPER — some derivation (`DJ`) does not stabilize it.
    The forced charge direction is the gather tear on the branching's distinguished element, its
    symmetry FORCED to colour su(3) — a covariant object singling out a direction, not a posited
    or normalized u(1). -/
theorem forced_charge_direction_structure :
    chargeOp ∈ skewAdjointLieSubalgebra bornBil ∧
    chargeOp ≠ 0 ∧
    chargeOp ⟨u1, u1_mem_ImO⟩ = 0 ∧
    (∀ y : ImO, ((chargeOp (chargeOp y) : ImO) : O ℚ) = gForm u1 (y : O ℚ) • u1 - (y : O ℚ)) ∧
    (∀ D : derivationLieQ, ⁅imRep D, chargeOp⁆ = 0 ↔ D ∈ colourCentralizer) ∧
    Module.finrank ℚ chargeStabilizer.toSubmodule = 8 ∧
    ⁅imRep DJ, chargeOp⁆ ≠ 0 :=
  ⟨chargeOp_mem_so7, chargeOp_ne_zero, chargeOp_kills_singlet, chargeOp_sq_coe,
   chargeOp_stabilizer_iff, finrank_chargeStabilizer_eq_eight, chargeOp_stabilizer_proper⟩

end

end Phys.Algebra
