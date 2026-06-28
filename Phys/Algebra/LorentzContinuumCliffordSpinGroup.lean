/-
  Phys.Algebra.LorentzContinuumCliffordSpinGroup — N143: THE ABSTRACT SPIN GROUP
  `spinGroup QvCQuad = pinGroup QvCQuad ⊓ even QvCQuad` — the cascade's even covering units LAND in
  Mathlib's abstract Spin group via the UNITARY condition `star x · x = 1` over the DERIVED ℝ `Cut`.
  Over the derived ℝ `Cut`, the terminal algebra `O Cut`, the spacetime `STVC`, the indefinite
  Minkowski form `BvC`, the Clifford algebra `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE FORWARD JOINT (W4.5 SUFFICIENCY: advance, do not re-pin).
  N142 banked the even / Spin ℤ/2-GRADING of the Clifford cover: the even subalgebra
  `CliffordAlgebra.even QvCQuad` (= `CliffC⁰`) is the Spin grade; a single reflection generator
  `cliffUnitOf a` is `involute`-NEGATED (odd / improper); the even two-generator product is
  `involute`-FIXED and EVEN-graded (`cliffEvenUnit_mem_even`); the cascade's covering units are
  abstract `lipschitzGroup` elements (`cliffUnitMul_mem_lipschitzGroup`); the `{±1}` cover kernel
  lives in the even part. What N142 did NOT carry is the UNITARY condition — and hence could NOT
  land the covering units in Mathlib's abstract `pinGroup` / `spinGroup` (both of which are an
  infimum WITH `unitary`). That condition is THE genuine new content of this node.

  Mathlib's tower (`Mathlib.LinearAlgebra.CliffordAlgebra.SpinGroup`):
    `pinGroup Q  = (lipschitzGroup Q).map(coeHom) ⊓ unitary (CliffordAlgebra Q)`
    `spinGroup Q = pinGroup Q ⊓ CliffordAlgebra.even Q`.
  N142 already banks the `lipschitzGroup` half and the `even` half. The MISSING structural datum is
  `unitary`, i.e. `star x · x = 1`. This node computes it and lands the even covering unit in the
  abstract Spin group — the GROUP-level (not merely subalgebra-level) Spin structure.

  ── THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — pure star/grading algebra, no new construction). ──
  No `tsum`, no exponential, no coordinate brute, no W9 risk. The `star` of the Clifford algebra is
  Mathlib's `reverse ∘ involute`, with `star (ι m) = -ι m` (`CliffordAlgebra.star_ι`). For the even
  covering unit value `x = ι a · ι b`:
    `star x = star (ι b) · star (ι a) = (-ι b)(-ι a) = ι b · ι a`,
    `star x · x = (ι b · ι a)(ι a · ι b) = ι b · (QvC a) · ι b = (QvC a · QvC b)·1`
               = `algebraMap Cut CliffC (QvC a · QvC b)`  (via the banked `cliffSq`, N133).
  So the even covering unit is UNITARY exactly when `QvC a · QvC b = 1` — the like-signature pairs.
  This is the cascade's OWN derived quadratic form `QvC` over the DERIVED field `Cut`; the unitary
  group is read off it, not posited.

  ── WHAT THIS NODE BANKS ──
    star_even_unit                  — `star (ι a · ι b) = ι b · ι a` (the reversed word; `star_ι`
                                      negations cancel).
    ★ cliffEvenUnit_star_mul_self   — THE CENTRAL UNITARY IDENTITY: `star x · x =
                                      algebraMap (QvC a · QvC b)` (the even covering unit's
                                      self-overlap is the product of the two reflection-axis norms).
    cliffEvenUnit_mul_star_self     — the other-side identity `x · star x = algebraMap (QvC a · QvC b)`.
    ★ cliffEvenUnit_mem_unitary     — THE UNITARY CONDITION: `QvC a · QvC b = 1 → x ∈ unitary CliffC`.
    cliffEvenUnit_mem_pinGroup      — `QvC a · QvC b = 1 → x ∈ pinGroup QvCQuad` (lipschitz ∧ unitary).
    ★★ cliffEvenUnit_mem_spinGroup  — THE HEADLINE: `QvC a · QvC b = 1 → x ∈ spinGroup QvCQuad`
                                      (`pinGroup ⊓ even`) — the cascade's own even covering unit IS an
                                      element of Mathlib's abstract Spin group.
    QvC_mTimeUnit / QvC_mSpaceUnit  — the banked signature read-offs `QvC mTimeUnit = 1`,
                                      `QvC mSpaceUnit = -1` (`BvC_mTimeUnit_self` / `BvC_mSpaceUnit_self`).
    cover_spin_timelike_double_mem_spinGroup  — a CONCRETE Spin-group witness: the double-timelike
                                      even unit (`QvC = 1·1 = 1`) lands in `spinGroup` (a rotor).
    cover_spin_spacelike_double_mem_spinGroup — a CONCRETE Spin-group witness: the double-spacelike
                                      even unit (`QvC = (-1)(-1) = 1`) lands in `spinGroup`.
    ★★ cover_proper_spin            — THE GROUP-LEVEL `Spin ↠ SO⁺` HALF: a proper isometry from two
                                      like-signature reflections (`houseHolderM a ∘ houseHolderM b`,
                                      N134) is covered by a `spinGroup`-landing unit — the proper part
                                      of the isometry group is covered by the abstract Spin GROUP.
    W8 (genuinely-indefinite teeth):
    ★ cover_boost_even_star_mul_self_eq_neg_one — the MIXED (timelike·spacelike = boost) even unit has
                                      `star x · x = -1` (NOT `1`): pseudo-unitary, NOT in the compact
                                      `unitary` group — the indefinite signature's fingerprint. The
                                      read-off the costume C175 (`-1 = 143`) negates.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Spin group as
  `Pin ∩ (even subalgebra)` with the unitary norm read off a FIXED Minkowski metric, taking the
  group structure as standard. Here the Clifford algebra is the FUNCTOR on the cascade's derived
  form `QvCQuad` over the derived field `Cut`, the covering units are the cascade's own `cliffUnitOf`
  (N135), the `star`-structure is Mathlib's `reverse ∘ involute` machinery, and the unitary
  condition `star x · x = algebraMap (QvC a · QvC b)` is COMPUTED from the cascade's own quadratic
  form — the abstract `spinGroup` membership is DERIVED FORWARD, no posited Pin/Spin group, no
  posited unitary structure, no posited group structure, no Mathlib ℝ/ℂ as content, no bridge. The
  UNBROKEN strand: the even-grade membership (N142), the lipschitz membership (N142), and the
  unitary condition (here) are exactly the three infima Mathlib's `spinGroup` is built from.

  DERIVED from the banked N49–N142 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford algebra `CliffC` + the even
  subalgebra `CliffC⁰` (N142) + the cover/kernel family (N133–N136). Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Spin / Pin / cover / spinor / rotor / boost
  / even / odd / grade / parity / involution / Lipschitz / Clifford / reflection / Lorentz /
  Minkowski / timelike / spacelike / signature / isometry / unitary-as-physics / index / kernel /
  proper / improper / compact / SO⁺(1,9) / bridge": what remains is pure algebra over the derived
  complete ordered field `Cut`, the Clifford algebra `CliffC` of `QvCQuad`, and Mathlib's `star`
  (= `reverse ∘ involute`), `unitary`, `pinGroup`, `spinGroup`, `even`, `lipschitzGroup` — for the
  unit value `x = ι a · ι b`, `star x = ι b · ι a` and `star x · x = algebraMap (QvC a · QvC b)`;
  when `QvC a · QvC b = 1` the element lies in `unitary CliffC`, in `pinGroup QvCQuad`, and in
  `spinGroup QvCQuad`; for the concrete generators with `QvC = 1` resp. `QvC = -1`, the like-pair
  products land in `spinGroup` while the mixed product has `star x · x = -1`. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra` / `star` /
  `unitary` / `pinGroup` / `spinGroup` / `even` / `lipschitzGroup` are MACHINERY on the derived
  form), NO posited Clifford/Pin/Spin/cover/unitary/group structure.
-/
import Phys.Algebra.LorentzContinuumCliffordSpinEven
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

/-! ## The `star` of the even covering unit — the reversed word. -/

/-- THE STAR OF THE EVEN UNIT VALUE: `star (ι a · ι b) = ι b · ι a` — the Clifford conjugation
    (`reverse ∘ involute`) of the two-generator word is the reversed product, the two `star (ι ·)`
    sign flips cancelling (`star_ι`: `star (ι m) = -ι m`). -/
theorem star_even_unit {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    star ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = CliffordAlgebra.ι QvCQuad b * CliffordAlgebra.ι QvCQuad a := by
  rw [Units.val_mul, cliffUnitOf_val, cliffUnitOf_val, star_mul,
      CliffordAlgebra.star_ι, CliffordAlgebra.star_ι, neg_mul_neg]

/-! ## The central unitary identity — the even unit's self-overlap is the product of axis norms. -/

/-- ★ THE CENTRAL UNITARY IDENTITY: the even covering unit's `star`-self-overlap is the product of
    the two reflection-axis norms, `star x · x = algebraMap (QvC a · QvC b)`. The reversed word
    `ι b · ι a` times `ι a · ι b` collapses by the Clifford relation `ι a · ι a = QvC a` (`cliffSq`,
    N133) to the central scalar `QvC a · QvC b`. -/
theorem cliffEvenUnit_star_mul_self {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    star ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
        * ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = algebraMap Cut CliffC (QvC a * QvC b) := by
  rw [star_even_unit, Units.val_mul, cliffUnitOf_val, cliffUnitOf_val]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιb := CliffordAlgebra.ι QvCQuad b
  have hcomm : ιb * algebraMap Cut CliffC (QvC a)
      = algebraMap Cut CliffC (QvC a) * ιb := (Algebra.commute_algebraMap_right _ _).eq
  calc ιb * ιa * (ιa * ιb)
      = ιb * (ιa * ιa) * ιb := by noncomm_ring
    _ = ιb * algebraMap Cut CliffC (QvC a) * ιb := by rw [cliffSq a]
    _ = algebraMap Cut CliffC (QvC a) * (ιb * ιb) := by rw [hcomm]; noncomm_ring
    _ = algebraMap Cut CliffC (QvC a) * algebraMap Cut CliffC (QvC b) := by rw [cliffSq b]
    _ = algebraMap Cut CliffC (QvC a * QvC b) := by rw [map_mul]

/-- The other-side identity `x · star x = algebraMap (QvC a · QvC b)` (the unitary group needs both). -/
theorem cliffEvenUnit_mul_star_self {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
        * star ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = algebraMap Cut CliffC (QvC a * QvC b) := by
  rw [star_even_unit, Units.val_mul, cliffUnitOf_val, cliffUnitOf_val]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιb := CliffordAlgebra.ι QvCQuad b
  have hcomm : ιa * algebraMap Cut CliffC (QvC b)
      = algebraMap Cut CliffC (QvC b) * ιa := (Algebra.commute_algebraMap_right _ _).eq
  calc ιa * ιb * (ιb * ιa)
      = ιa * (ιb * ιb) * ιa := by noncomm_ring
    _ = ιa * algebraMap Cut CliffC (QvC b) * ιa := by rw [cliffSq b]
    _ = algebraMap Cut CliffC (QvC b) * (ιa * ιa) := by rw [hcomm]; noncomm_ring
    _ = algebraMap Cut CliffC (QvC b) * algebraMap Cut CliffC (QvC a) := by rw [cliffSq a]
    _ = algebraMap Cut CliffC (QvC b * QvC a) := by rw [map_mul]
    _ = algebraMap Cut CliffC (QvC a * QvC b) := by rw [mul_comm]

/-! ## The unitary condition, and the abstract Pin / Spin group membership. -/

/-- ★ THE UNITARY CONDITION: when the two reflection-axis norms multiply to `1`
    (`QvC a · QvC b = 1`, the like-signature pairs), the even covering unit is UNITARY
    (`star x · x = 1` and `x · star x = 1`) — an element of Mathlib's `unitary CliffC`. -/
theorem cliffEvenUnit_mem_unitary {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ unitary CliffC := by
  rw [Unitary.mem_iff]
  exact ⟨by rw [cliffEvenUnit_star_mul_self, h, map_one],
         by rw [cliffEvenUnit_mul_star_self, h, map_one]⟩

/-- THE PIN-GROUP MEMBERSHIP: the like-signature even covering unit lies in `pinGroup QvCQuad`
    (= `lipschitzGroup ⊓ unitary`) — combining the abstract Clifford-group membership (N142
    `cliffUnitMul_mem_lipschitzGroup`) with the unitary condition. -/
theorem cliffEvenUnit_mem_pinGroup {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ pinGroup QvCQuad := by
  rw [pinGroup.units_mem_iff]
  exact ⟨cliffUnitMul_mem_lipschitzGroup ha hb, cliffEvenUnit_mem_unitary ha hb h⟩

/-- ★★ THE HEADLINE — THE ABSTRACT SPIN-GROUP MEMBERSHIP: the like-signature even covering unit
    (`QvC a · QvC b = 1`) lies in Mathlib's abstract `spinGroup QvCQuad` (= `pinGroup ⊓ even`) —
    combining the Pin-group membership with the even-grade membership (N142 `cliffEvenUnit_mem_even`).
    The cascade's OWN even covering unit IS an element of the abstract Spin group, derived forward,
    not posited. -/
theorem cliffEvenUnit_mem_spinGroup {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ spinGroup QvCQuad := by
  rw [spinGroup.mem_iff]
  exact ⟨cliffEvenUnit_mem_pinGroup ha hb h, cliffEvenUnit_mem_even ha hb⟩

/-! ## The banked signature read-offs and concrete Spin-group witnesses. -/

/-- The timelike unit-axis norm is `1` (`BvC_mTimeUnit_self` via `BvC_self`). -/
theorem QvC_mTimeUnit : QvC (mTimeUnit : STVC) = 1 := by rw [← BvC_self]; exact BvC_mTimeUnit_self

/-- The spacelike unit-axis norm is `-1` (`BvC_mSpaceUnit_self` via `BvC_self`). -/
theorem QvC_mSpaceUnit : QvC (mSpaceUnit : STVC) = -1 := by rw [← BvC_self]; exact BvC_mSpaceUnit_self

/-- A CONCRETE Spin-group witness: the double-timelike even covering unit (`QvC = 1·1 = 1`) lands in
    `spinGroup QvCQuad` — a concrete rotor in the abstract Spin group. -/
theorem cover_spin_timelike_double_mem_spinGroup
    (hmt : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0) :
    ((cliffUnitOf (mTimeUnit : STVC) hmt * cliffUnitOf (mTimeUnit : STVC) hmt : CliffCˣ) : CliffC)
      ∈ spinGroup QvCQuad :=
  cliffEvenUnit_mem_spinGroup hmt hmt (by rw [QvC_mTimeUnit]; ring)

/-- A CONCRETE Spin-group witness: the double-spacelike even covering unit (`QvC = (-1)(-1) = 1`)
    lands in `spinGroup QvCQuad` — a concrete compact rotor in the abstract Spin group. -/
theorem cover_spin_spacelike_double_mem_spinGroup
    (hms : BvC (mSpaceUnit : STVC) (mSpaceUnit : STVC) ≠ 0) :
    ((cliffUnitOf (mSpaceUnit : STVC) hms * cliffUnitOf (mSpaceUnit : STVC) hms : CliffCˣ) : CliffC)
      ∈ spinGroup QvCQuad :=
  cliffEvenUnit_mem_spinGroup hms hms (by rw [QvC_mSpaceUnit]; ring)

/-! ## THE GROUP-LEVEL `Spin ↠ SO⁺` half — proper isometries covered by Spin-group units. -/

/-- ★★ THE GROUP-LEVEL `Spin ↠ SO⁺` HALF: a proper isometry built from two like-signature reflections
    (`houseHolderM a ∘ houseHolderM b`, N134) is BOTH `CliffCovers`-covered by the even covering unit
    AND that unit lies in the abstract `spinGroup QvCQuad`. The proper (orientation-preserving) part
    of the isometry group is covered by the abstract Spin GROUP, not merely the even subalgebra
    (N142's `cover_proper_even`) — the defining `Spin ↠ SO⁺` half lifted to the group level. -/
theorem cover_proper_spin {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    CliffCovers (cliffUnitOf a ha * cliffUnitOf b hb) (houseHolderM a * houseHolderM b)
      ∧ ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ spinGroup QvCQuad :=
  ⟨cliffCovers_mul (cliffCovers_reflection ha) (cliffCovers_reflection hb),
   cliffEvenUnit_mem_spinGroup ha hb h⟩

/-! ## W8 teeth — the mixed (boost) even unit is pseudo-unitary (`star x · x = -1`). -/

/-- ★ W8 TEETH — THE INDEFINITE SIGNATURE'S FINGERPRINT: the MIXED (timelike·spacelike = boost) even
    covering unit has `star x · x = -1` (NOT `1`) — `QvC mTimeUnit · QvC mSpaceUnit = 1·(-1) = -1`.
    It is PSEUDO-unitary, NOT in the compact `unitary` group: the boost rotor witnesses that the
    Spin group over the genuinely-indefinite form is NON-compact. The read-off the costume C175
    (`-1 = 143`) negates. -/
theorem cover_boost_even_star_mul_self_eq_neg_one
    (hmt : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0)
    (hms : BvC (mSpaceUnit : STVC) (mSpaceUnit : STVC) ≠ 0) :
    star ((cliffUnitOf (mTimeUnit : STVC) hmt * cliffUnitOf (mSpaceUnit : STVC) hms : CliffCˣ) : CliffC)
        * ((cliffUnitOf (mTimeUnit : STVC) hmt * cliffUnitOf (mSpaceUnit : STVC) hms : CliffCˣ) : CliffC)
      = -1 := by
  rw [cliffEvenUnit_star_mul_self, QvC_mTimeUnit, QvC_mSpaceUnit, mul_neg_one, map_neg, map_one]

end

end Phys.Algebra
