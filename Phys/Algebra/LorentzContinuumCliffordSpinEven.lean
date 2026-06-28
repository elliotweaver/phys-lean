/-
  Phys.Algebra.LorentzContinuumCliffordSpinEven — N142: THE EVEN / SPIN ℤ/2-GRADING OF THE
  CLIFFORD COVER `Pin(1,9) ↠ SO⁺(1,9)` — the even subalgebra `CliffC⁰` as the Spin grade,
  separated from the improper (odd) grade by the grade involution, with the `{±1}` cover kernel
  (N136) living in the even (Spin) part. Over the derived ℝ `Cut`, the terminal algebra `O Cut`,
  the spacetime `STVC`, the indefinite Minkowski form `BvC`, the Clifford algebra
  `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE FORCED NEXT STRUCTURE (W4.5 SUFFICIENCY: advance, do not re-pin).
  N133 banked the generator-level Clifford cover (`reflection_clifford_conj`). N134 banked the
  even/Spin two-generator HOMOMORPHISM (`cover_compose_two`/`cover_conj_even`). N135 banked the
  GLOBAL surjectivity `Pin(1,9) ↠ SO⁺(1,9)` (`cover_global_bvIsom`: every isometry has a Clifford
  covering unit `CliffCˣ`). N136 banked the `{±1}` cover KERNEL (`cover_neg_unit` /
  `cover_kernel_distinct` / `cover_kernel_neg_one_sq` — the two-to-one half). On the gauge side,
  N137–N141 banked the observer-plane stabilizer `octStab`, the G₂ gauge link, and the Klein-four
  ℤ/2 × ℤ/2 ⊂ G₂.

  What N133–N136 pinned is the cover as a SET-level two-to-one map plus its kernel. What it does
  NOT yet carry is the ℤ/2 PARITY GRADING that separates the proper (Spin, even) sheet from the
  improper (odd) sheet — the defining structural datum that makes `Spin` the even-graded subgroup
  of `Pin`. The forward joint (priority i — "THE EVEN subalgebra `CliffC⁰` Spin structure as a
  Mathlib `even`-grade object") is exactly that grading: the even subalgebra `CliffordAlgebra.even
  QvCQuad` (= `evenOdd QvCQuad 0`) IS the Spin grade; a single reflection generator `ι a` is odd
  (`involute`-NEGATED), an even product `ι a · ι b` (a Spin element) is even (`involute`-FIXED),
  and the `{±1}` cover kernel lives in the even (Spin) part — the Spin/Pin index-2 relation. This
  is NEW structure, not a re-pin: N133–N136 never separated even from odd, and never identified
  the derived covering units with Mathlib's abstract Clifford/Lipschitz group.

  ── THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — pure grading machinery, no new construction). ──
  No `tsum`, no exponential, no coordinate brute, no W9 risk. Every fact is one
  `Submodule`/`Subalgebra`/`AlgHom` lemma of Mathlib's ℤ/2-grading (`evenOdd`, `even`, `involute`)
  applied to the DERIVED Clifford algebra `CliffC` over the DERIVED field `Cut` and chained on the
  cascade's OWN covering units (`cliffUnitOf`, N135). The grade involution `involute` (the same map
  that made the cover sign-free in N135) is exactly the parity operator: `involute_eq_of_mem_even`
  fixes even elements, `involute_ι` negates the generators.

  ── WHAT THIS NODE BANKS ──
    cliffUnit_mem_lipschitzGroup    — THE ABSTRACT CLIFFORD-GROUP IDENTIFICATION: the derived
                                      covering generator `cliffUnitOf a` is an element of Mathlib's
                                      `lipschitzGroup QvCQuad` (the abstract Clifford/Lipschitz group)
                                      — the cascade's own Pin generator IS an abstract Clifford-group
                                      element, not merely a hand-built unit.
    cliffUnitMul_mem_lipschitzGroup — the even (two-generator) covering unit is in `lipschitzGroup`
                                      (a product of two generators).
    ★ cliffUnit_involute_neg        — THE ODD (IMPROPER) GRADE: a single reflection generator
                                      `cliffUnitOf a` is `involute`-NEGATED (`involute (ι a) = -ι a`)
                                      — the improper sheet of the cover.
    cliffUnit_mem_evenOdd_one       — the generator lies in the odd grade `evenOdd QvCQuad 1`.
    ★★ cliffEvenUnit_mem_even       — THE SPIN GRADE: the even (two-generator) covering unit
                                      `cliffUnitOf a · cliffUnitOf b` lies in the even subalgebra
                                      `CliffordAlgebra.even QvCQuad` (= `CliffC⁰`) — a Spin element.
    even_involute_fixed_cliffC      — THE SPIN CHARACTERIZATION over `CliffC`: every even element is
                                      `involute`-FIXED (`involute x = x`) — the proper sheet.
    cliffEvenUnit_involute_fixed    — the even covering unit is `involute`-fixed (Spin = proper).
    cover_kernel_one_mem_even       — `1` lies in the even subalgebra.
    ★ cover_kernel_neg_one_mem_even — THE SPIN/PIN INDEX-2 DATUM: the nontrivial kernel element `-1`
                                      (N136) lies in the even (Spin) part — the `{±1}` cover kernel
                                      sits inside `Spin`, the index-2 relation `Spin ⊂ Pin`.
    ★★ cover_proper_even            — THE HEADLINE: a PROPER isometry (an even reflection word
                                      `houseHolderM a ∘ houseHolderM b`) is covered by an EVEN
                                      (Spin-grade) covering unit — the even unit BOTH `CliffCovers`
                                      the composite isometry AND lies in `CliffordAlgebra.even`.
    cover_even_odd_split            — THE PARITY SPLIT: a single generator is `involute`-negated
                                      (odd / improper) while the two-generator product is
                                      `involute`-fixed (even / proper) — the cover's two sheets
                                      distinguished by grade.
    W8 (genuinely-indefinite teeth):
    cover_spin_timelike_double_val_eq_one — the even covering unit of the DOUBLE timelike reflection
                                      has value `1` (`ι mTimeUnit · ι mTimeUnit = 1`, the timelike
                                      generator a Clifford involution) — the read-off costume C174
                                      (`1 = 142`) negates.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Pin/Spin double cover
  and reads `Spin = Pin ∩ (even subalgebra)` off a FIXED Minkowski metric, with the ℤ/2-grading and
  the index-2 relation `Spin ⊂ Pin` taken as standard structure. Here the Clifford algebra is the
  FUNCTOR on the cascade's derived form `QvCQuad` over the derived field `Cut`, the covering units
  are the cascade's own `cliffUnitOf` (N135), the grade involution is the banked twisted-adjoint
  parity operator, and the even/odd (Spin/improper) split with the `{±1}` kernel-in-even index-2
  datum is DERIVED FORWARD by pure grading algebra — no posited Pin/Spin group, no posited grading,
  no posited index-2 relation, no bridge. The UNBROKEN strand: the generator-level cover (N133), the
  even homomorphism (N134), the global surjectivity (N135), and the `{±1}` kernel (N136) are exactly
  what the grading organizes into the two-sheeted (proper/improper) structure of the cover.

  DERIVED from the banked N49–N141 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford algebra `CliffC`. Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Spin / Pin / cover / spinor / even / odd /
  grade / parity / involution / Lipschitz / Clifford / reflection / Lorentz / Minkowski / timelike /
  isometry / index / kernel / proper / improper / SO⁺(1,9) / bridge": what remains is pure algebra
  over the derived complete ordered field `Cut`, the Clifford algebra `CliffC` of `QvCQuad`, and
  Mathlib's `evenOdd` / `even` / `involute` / `lipschitzGroup` — the unit `ι a` is in the
  subgroup-closure of the vector-units; `involute (ι a) = -ι a`; the product `ι a · ι b` lies in the
  even subalgebra and is `involute`-fixed; `1` and `-1` lie in the even subalgebra; an even product
  unit conjugation-covers the composite of two reflection maps and is even-graded. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra` / `evenOdd` /
  `even` / `involute` / `lipschitzGroup` are MACHINERY on the derived form), NO posited
  Clifford/Pin/Spin/cover/grading structure.
-/
import Phys.Algebra.LorentzContinuumCliffordCoverKernel
import Mathlib.LinearAlgebra.CliffordAlgebra.SpinGroup
import Mathlib.LinearAlgebra.CliffordAlgebra.Even
import Mathlib.LinearAlgebra.CliffordAlgebra.Grading

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The derived covering units are abstract Clifford-group (Lipschitz) elements. -/

/-- THE ABSTRACT CLIFFORD-GROUP IDENTIFICATION: the derived covering generator `cliffUnitOf a` of an
    anisotropic vector is an element of Mathlib's `lipschitzGroup QvCQuad` (the abstract
    Clifford/Lipschitz group, the subgroup of `CliffCˣ` generated by the vector-units). The
    cascade's own Pin generator IS an abstract Clifford-group element. -/
theorem cliffUnit_mem_lipschitzGroup {a : STVC} (ha : BvC a a ≠ 0) :
    cliffUnitOf a ha ∈ lipschitzGroup QvCQuad :=
  Subgroup.subset_closure ⟨a, rfl⟩

/-- The even (two-generator) covering unit `cliffUnitOf a · cliffUnitOf b` is in `lipschitzGroup`,
    being a product of two generators of the abstract Clifford group. -/
theorem cliffUnitMul_mem_lipschitzGroup {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    cliffUnitOf a ha * cliffUnitOf b hb ∈ lipschitzGroup QvCQuad :=
  mul_mem (cliffUnit_mem_lipschitzGroup ha) (cliffUnit_mem_lipschitzGroup hb)

/-! ## The odd (improper) grade — a single reflection generator. -/

/-- ★ THE ODD (IMPROPER) GRADE: a single reflection generator `cliffUnitOf a` is `involute`-NEGATED
    (`involute (ι a) = -ι a`) — the grade involution acts as `-1` on it, the improper sheet of the
    cover (an odd-length Clifford word). -/
theorem cliffUnit_involute_neg {a : STVC} (ha : BvC a a ≠ 0) :
    CliffordAlgebra.involute ((cliffUnitOf a ha : CliffCˣ) : CliffC)
      = -((cliffUnitOf a ha : CliffCˣ) : CliffC) := by
  rw [cliffUnitOf_val]; exact CliffordAlgebra.involute_ι a

/-- The reflection generator lies in the odd grade `evenOdd QvCQuad 1`. -/
theorem cliffUnit_mem_evenOdd_one {a : STVC} (ha : BvC a a ≠ 0) :
    ((cliffUnitOf a ha : CliffCˣ) : CliffC) ∈ CliffordAlgebra.evenOdd QvCQuad 1 := by
  rw [cliffUnitOf_val]; exact CliffordAlgebra.ι_mem_evenOdd_one QvCQuad a

/-! ## The even (Spin) grade — the two-generator product, and its `involute`-fixed characterization. -/

/-- ★★ THE SPIN GRADE: the even (two-generator) covering unit `cliffUnitOf a · cliffUnitOf b` lies
    in the even subalgebra `CliffordAlgebra.even QvCQuad` (= `evenOdd QvCQuad 0` = `CliffC⁰`) — a
    Spin element, an even-length Clifford word. -/
theorem cliffEvenUnit_mem_even {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  rw [Units.val_mul, cliffUnitOf_val, cliffUnitOf_val, CliffordAlgebra.even,
      Submodule.mem_toSubalgebra]
  exact CliffordAlgebra.ι_mul_ι_mem_evenOdd_zero QvCQuad a b

/-- THE SPIN CHARACTERIZATION over `CliffC`: every element of the even subalgebra is
    `involute`-FIXED (`involute x = x`) — the proper sheet, the grade involution acting as `+1`. -/
theorem even_involute_fixed_cliffC {x : CliffC} (h : x ∈ CliffordAlgebra.even QvCQuad) :
    CliffordAlgebra.involute x = x := by
  rw [CliffordAlgebra.even, Submodule.mem_toSubalgebra] at h
  exact CliffordAlgebra.involute_eq_of_mem_even h

/-- The even covering unit is `involute`-fixed (Spin = proper). -/
theorem cliffEvenUnit_involute_fixed {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    CliffordAlgebra.involute ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) :=
  even_involute_fixed_cliffC (cliffEvenUnit_mem_even ha hb)

/-! ## The `{±1}` cover kernel lies in the even (Spin) part — the index-2 datum. -/

/-- `1` lies in the even subalgebra. -/
theorem cover_kernel_one_mem_even : ((1 : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  rw [Units.val_one]; exact one_mem _

/-- ★ THE SPIN/PIN INDEX-2 DATUM: the nontrivial cover-kernel element `-1` (N136) lies in the even
    (Spin) part of the algebra. With `cover_kernel_one_mem_even`, the whole `{±1}` cover kernel sits
    inside the even subalgebra `CliffC⁰` — the kernel of the cover is contained in `Spin`, the
    structural form of the index-2 relation `Spin ⊂ Pin`. -/
theorem cover_kernel_neg_one_mem_even :
    ((-1 : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  rw [Units.val_neg, Units.val_one]; exact Subalgebra.neg_mem _ (one_mem _)

/-! ## THE HEADLINE — a proper isometry is covered by an even (Spin-grade) unit. -/

/-- ★★ THE HEADLINE — A PROPER ISOMETRY IS COVERED BY AN EVEN (SPIN-GRADE) UNIT: the even covering
    unit `cliffUnitOf a · cliffUnitOf b` BOTH `CliffCovers` the composite proper isometry
    (`houseHolderM a ∘ houseHolderM b`, an even reflection word, N134) AND lies in the even
    subalgebra `CliffordAlgebra.even QvCQuad`. The proper (orientation-preserving) part of the
    isometry group is covered by the EVEN (Spin) grade of the Clifford cover — the defining
    `Spin ↠ SO⁺` half of the double cover, DERIVED forward. -/
theorem cover_proper_even {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    CliffCovers (cliffUnitOf a ha * cliffUnitOf b hb) (houseHolderM a * houseHolderM b)
      ∧ ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad :=
  ⟨cliffCovers_mul (cliffCovers_reflection ha) (cliffCovers_reflection hb),
   cliffEvenUnit_mem_even ha hb⟩

/-- THE PARITY SPLIT — the cover's two sheets distinguished by grade: a single reflection generator
    is `involute`-NEGATED (odd / improper) while the two-generator product is `involute`-FIXED
    (even / proper). The grade involution separates the improper from the proper (Spin) sheet. -/
theorem cover_even_odd_split {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    CliffordAlgebra.involute ((cliffUnitOf a ha : CliffCˣ) : CliffC)
        = -((cliffUnitOf a ha : CliffCˣ) : CliffC)
      ∧ CliffordAlgebra.involute ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
        = ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) :=
  ⟨cliffUnit_involute_neg ha, cliffEvenUnit_involute_fixed ha hb⟩

/-! ## W8 teeth — the even unit of the double timelike reflection, the genuinely-indefinite demo. -/

/-- ★ W8 TEETH — the even covering unit of the DOUBLE timelike reflection has value `1`:
    `cliffUnitOf mTimeUnit · cliffUnitOf mTimeUnit` has value `ι mTimeUnit · ι mTimeUnit = 1`
    (the timelike generator is a Clifford involution, `cover_timelike_unit_clifford_sq`, since
    `QvC mTimeUnit = 1`). The concrete even (Spin-grade) element of the closed group, on the spinor
    module — the read-off the costume C174 (`1 = 142`) negates. -/
theorem cover_spin_timelike_double_val_eq_one
    (hmt : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0) :
    ((cliffUnitOf (mTimeUnit : STVC) hmt * cliffUnitOf (mTimeUnit : STVC) hmt : CliffCˣ) : CliffC)
      = 1 := by
  rw [Units.val_mul, cliffUnitOf_val]
  exact cover_timelike_unit_clifford_sq

end

end Phys.Algebra
