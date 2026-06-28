/-
  Phys.Algebra.LorentzContinuumCliffordCoverHom — N134: THE EVEN / SPIN COVER STRUCTURE the
  generator-level Clifford/Pin cover opens — the cover-is-a-HOMOMORPHISM at the two-generator
  (even / Spin) level. Over the derived ℝ `Cut`, the terminal algebra `O Cut`, the spacetime
  `STVC`, the indefinite Minkowski form `BvC`, the Clifford algebra `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE FORCED NEXT STRUCTURE (W4.5 SUFFICIENCY: advance, do not re-pin).
  N133 banked the generator-level cover: every banked indefinite Householder reflection
  `houseHolderM a` lifts to Clifford conjugation by the UNIT `ι a`, with a SIGN:
  `reflection_clifford_conj : ι (houseHolderM a v) = -(QvC a)⁻¹ • (ι a · ι v · ι a)`.
  The single reflection carries the sign `-(QvC a)⁻¹`. The forward structure this OPENS is the
  EVEN / Spin cover: composing TWO reflections lifts to conjugation by the EVEN product `ι a · ι b`
  (an even-length Clifford word — a Spin element), and the two single-generator signs CANCEL to a
  positive scalar `(QvC a)⁻¹·(QvC b)⁻¹` — the cover is a HOMOMORPHISM, and the even (Spin) part
  covers without the reflection sign. N132 (`reflection_closure_eq_bvIsomLinMonoid`) already proved
  every linear `BvC`-isometry is a finite reflection word = the full group; this node banks the
  composition (homomorphism) law of the lift, the defining feature of the two-to-one Pin/Spin cover.

  ── WHAT THIS NODE BANKS ──
    cover_even_isUnit              — the EVEN product `ι a · ι b` is a UNIT (a Spin / Pin-group
                                     element at the two-generator level), being a product of the two
                                     anisotropic Clifford units `cliff_unit_isUnit` (N133).
    cover_conj_mem_range          — the generator-level cover LANDS IN THE VECTOR MODULE: the sandwich
                                     `ι a · ι v · ι a` lies in `range (ι QvCQuad)` (= `-(QvC a)•ι(houseHolderM a v)`).
                                     The defining cover property (conjugation keeps vectors as vectors).
    ★★ cover_compose_two          — THE HOMOMORPHISM LAW (the even / Spin cover): the COMPOSITION of
                                     two reflections lifts to conjugation by the even product, SIGN-FREE:
                                     `ι (houseHolderM a (houseHolderM b v))
                                        = ((QvC a)⁻¹·(QvC b)⁻¹) • (ι a · ι b · ι v · ι b · ι a)`.
                                     The two single-generator signs `-(QvC a)⁻¹`, `-(QvC b)⁻¹` combine to a
                                     POSITIVE scalar — the even cover carries no reflection sign.
    ★ cover_conj_even             — THE LITERAL EVEN COVER MAP: conjugation by the even unit `u = ι a · ι b`,
                                     with its explicit inverse `u⁻¹ = (QvC b)⁻¹ι b · (QvC a)⁻¹ι a`, sends
                                     `ι v` to `ι (houseHolderM a (houseHolderM b v))` — the Spin element
                                     acting by `x ↦ u·x·u⁻¹`, sign-free, the two-to-one cover map.
    W8 (genuinely-indefinite teeth):
    cover_spin_scalar_timelike_unit — the sign-free Spin composition scalar at the timelike generator is
                                     `1` (`(QvC mt)⁻¹·(QvC mt)⁻¹ = 1`): the two signs cancel to `+1`.
    cover_timelike_double_eq_id   — the DOUBLE timelike reflection lifts to the IDENTITY on the spinor
                                     module (`ι mt · ι mt = 1` covers identity — the homomorphism on the
                                     involution); the read-off the costume C166 negates.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Pin/Spin double cover
  `Pin(1,9) → SO⁺(1,9)` and reads the homomorphism property off a FIXED Minkowski metric. Here every
  reflection is the trunk's own `houseHolderM` (the Cartan–Dieudonné generator PROVED to exhaust the
  closed group, N132), the Clifford algebra is the FUNCTOR applied to the cascade's derived form
  `QvCQuad` over the derived field `Cut`, the generator-level lift is the banked
  `reflection_clifford_conj` (N133), and the HOMOMORPHISM / even-cover law is DERIVED FORWARD by pure
  Clifford-relation algebra — the sign-cancellation that makes the even (Spin) subalgebra cover without
  the reflection sign. No posited cover homomorphism, no posited Pin/Spin group, no bridge.

  DERIVED from the banked N49–N133 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford algebra `CliffC`. Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "cover / Pin / Spin / spinor / reflection /
  Householder / Lorentz / Minkowski / metric / timelike / isometry / even / generator / homomorphism /
  group / bridge": what remains is pure algebra over the derived complete ordered field `Cut`,
  `STVC = Cut × Cut × O Cut`, the bilinear form `BvC` and its quadratic form `QvC`, the Clifford algebra
  of `QvCQuad` — the product `ι a · ι b` is a unit; `ι a · ι v · ι a ∈ range ι`;
  `ι (houseHolderM a (houseHolderM b v)) = ((QvC a)⁻¹(QvC b)⁻¹)•(ι a·ι b·ι v·ι b·ι a)`; and the literal
  conjugation identity by `ι a · ι b`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra` is
  MACHINERY on the derived form), NO posited Clifford/Pin/Spin/cover structure.
-/
import Phys.Algebra.LorentzContinuumCliffordSpinCover

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The even product is a unit, and the generator-level cover lands in the vector module. -/

/-- THE EVEN PRODUCT IS A UNIT (a Spin / Pin-group element at the two-generator level): for
    anisotropic `a`, `b` (`BvC a a ≠ 0`, `BvC b b ≠ 0`), the even Clifford product `ι a · ι b` is
    invertible, being the product of the two anisotropic Clifford units (`cliff_unit_isUnit`). -/
theorem cover_even_isUnit {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    IsUnit (CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b) :=
  (cliff_unit_isUnit ha).mul (cliff_unit_isUnit hb)

/-- THE GENERATOR-LEVEL COVER LANDS IN THE VECTOR MODULE: the sandwich `ι a · ι v · ι a` lies in
    `range (ι QvCQuad)` — explicitly `-(QvC a)•ι(houseHolderM a v)`. Conjugation by the Clifford
    unit `ι a` keeps a vector a vector (the defining cover property), read off the banked lift. -/
theorem cover_conj_mem_range {a : STVC} (ha : BvC a a ≠ 0) (v : STVC) :
    CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad v * CliffordAlgebra.ι QvCQuad a
      ∈ LinearMap.range (CliffordAlgebra.ι QvCQuad) := by
  refine ⟨-(QvC a) • houseHolderM a v, ?_⟩
  rw [map_smul, reflection_clifford_conj ha v, smul_smul]
  have hq : QvC a ≠ 0 := by rw [← BvC_self a]; exact ha
  rw [show (-(QvC a) * -(QvC a)⁻¹) = (1 : Cut) by field_simp, one_smul]

/-! ## The homomorphism law — the even / Spin cover is sign-free. -/

/-- ★★ THE HOMOMORPHISM LAW (the even / Spin cover): the COMPOSITION of two banked reflections lifts
    to conjugation by the EVEN product `ι a · ι b`, SIGN-FREE:
    `ι (houseHolderM a (houseHolderM b v)) = ((QvC a)⁻¹·(QvC b)⁻¹) • (ι a · ι b · ι v · ι b · ι a)`.
    Applying the generator-level lift `reflection_clifford_conj` twice, the two single-generator signs
    `-(QvC a)⁻¹`, `-(QvC b)⁻¹` multiply to a POSITIVE scalar — the even (Spin) cover carries no
    reflection sign; the lift is a homomorphism. DERIVED, no posited cover homomorphism. -/
theorem cover_compose_two {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) (v : STVC) :
    CliffordAlgebra.ι QvCQuad (houseHolderM a (houseHolderM b v))
      = ((QvC a)⁻¹ * (QvC b)⁻¹) •
          (CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b
            * CliffordAlgebra.ι QvCQuad v
            * CliffordAlgebra.ι QvCQuad b * CliffordAlgebra.ι QvCQuad a) := by
  rw [reflection_clifford_conj ha (houseHolderM b v), reflection_clifford_conj hb v]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιb := CliffordAlgebra.ι QvCQuad b
  set ιv := CliffordAlgebra.ι QvCQuad v
  rw [mul_smul_comm, smul_mul_assoc, smul_smul, neg_mul_neg]
  congr 1
  noncomm_ring

/-- ★ THE LITERAL EVEN COVER MAP: conjugation by the even unit `u = ι a · ι b`, with explicit inverse
    `u⁻¹ = (QvC b)⁻¹ι b · (QvC a)⁻¹ι a`, sends `ι v` to `ι (houseHolderM a (houseHolderM b v))` — the
    Spin element acting by `x ↦ u · x · u⁻¹`, sign-free; the two-to-one cover map at the even level. -/
theorem cover_conj_even {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) (v : STVC) :
    (CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b)
      * CliffordAlgebra.ι QvCQuad v
      * (((QvC b)⁻¹ • CliffordAlgebra.ι QvCQuad b) * ((QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a))
      = CliffordAlgebra.ι QvCQuad (houseHolderM a (houseHolderM b v)) := by
  rw [cover_compose_two ha hb v]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιb := CliffordAlgebra.ι QvCQuad b
  set ιv := CliffordAlgebra.ι QvCQuad v
  rw [mul_smul_comm, smul_mul_assoc, smul_smul]
  rw [mul_smul_comm]
  congr 1
  noncomm_ring

/-! ## W8 teeth — the sign-free even cover at the timelike generator (the genuinely-indefinite demo). -/

/-- ★ W8 — THE SIGN-FREE SPIN COMPOSITION SCALAR at the timelike generator is `1`:
    `(QvC mTimeUnit)⁻¹·(QvC mTimeUnit)⁻¹ = 1`, because `QvC mTimeUnit = 1` — the two
    single-generator signs cancel to `+1`, the even (Spin) cover carrying no reflection sign. -/
theorem cover_spin_scalar_timelike_unit :
    (QvC (mTimeUnit : STVC))⁻¹ * (QvC (mTimeUnit : STVC))⁻¹ = 1 := by
  have : QvC (mTimeUnit : STVC) = 1 := by rw [← BvC_self]; exact BvC_mTimeUnit_self
  rw [this, inv_one, mul_one]

/-- ★ W8 TEETH — THE DOUBLE TIMELIKE REFLECTION LIFTS TO THE IDENTITY on the spinor module:
    `ι (houseHolderM mTimeUnit (houseHolderM mTimeUnit v)) = ι v`, because the reflection is an
    involution (`ι mTimeUnit · ι mTimeUnit = 1` covers identity — the homomorphism on the involution).
    The Clifford generator image of the doubled timelike reflection is `ι v` itself — the read-off the
    costume C166 (`1 = 134`) negates. -/
theorem cover_timelike_double_eq_id (v : STVC) :
    CliffordAlgebra.ι QvCQuad
        (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) v))
      = CliffordAlgebra.ι QvCQuad v := by
  have hmt : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0 := by
    rw [BvC_mTimeUnit_self]; exact one_ne_zero
  have hid : houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) v) = v := by
    rw [← Module.End.mul_apply, houseHolderM_involutive hmt, Module.End.one_apply]
  rw [hid]

end

end Phys.Algebra
