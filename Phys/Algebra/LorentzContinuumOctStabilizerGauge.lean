/-
  Phys.Algebra.LorentzContinuumOctStabilizerGauge — N137: THE OCTONION-BLOCK STABILIZER's
  GAUGE CONTENT — the stabilizer of the (t,x) plane inside the continuum Lorentz group
  `SO⁺(1,9)` (`bvIsomLinMonoid`, N132) restricts to the octonion-block `gFormC`-isometry group
  (the internal-symmetry / gauge group SO(8) ⊃ Spin(7) ⊃ G₂ = Aut(O) = Der(O) tower N16–N21/N124,
  N20), over the derived ℝ `Cut`, the terminal algebra `O Cut := CD (H Cut)`, the spacetime
  `STVC = Cut × Cut × O Cut`, the indefinite Minkowski form `BvC` (signature (1,9)).

  ===========================================================================
  CONTEXT. The double cover `Pin(1,9) ↠ SO⁺(1,9)` is now CLOSED end-to-end: the group (N132,
  `reflection_closure_eq_bvIsomLinMonoid` — `SO⁺(1,9) = bvIsomLinMonoid` = the closed reflection-
  word group), the generator cover (N133), the even/Spin cover (N134), the global surjectivity
  (N135), the `{±1}` kernel (N136). W4.5 SUFFICIENCY: this node does NOT add another cover/kernel
  identity — it ADVANCES to the FORWARD joint the now-complete cover OPENS: the GAUGE CONTENT of
  the spacetime, the internal-symmetry group that lives inside the Lorentz group as the stabilizer
  of the observer (t,x) plane.

  ── THE MEASURED STRUCTURE (W1/W9 measure-first) ──
  `STVC = Cut × Cut × O Cut`, `BvC p q = p.1·q.1 − p.2.1·q.2.1 − gFormC p.2.2 q.2.2`. The (t,x)
  plane is spanned by `mTimeUnit = (1,0,0)` and `mSpaceUnit = (0,1,0)`; the octonion block is
  `{(0,0,v)}`. By N129 `bvC_tx_oct_orthogonal` the (t,x) plane is `BvC`-ORTHOGONAL to the octonion
  block. THE STABILIZER `IsOctStab S` := `S` is a `BvC`-isometry (a Lorentz element) FIXING the
  (t,x) plane pointwise. This is the GAUGE subgroup: the part of the Lorentz group that touches
  ONLY the internal (octonion) directions.

  ── THE GAUGE CONTENT (the forced theorem) ──
  A Lorentz element fixing the (t,x) plane PRESERVES the octonion block and restricts there to a
  `gFormC`-isometry: for a stabilizer `S` and a block vector `(0,0,v)`, the time component of the
  image is `(S(0,0,v)).1 = BvC (S(0,0,v)) mTimeUnit = BvC (S(0,0,v)) (S mTimeUnit) = BvC (0,0,v)
  mTimeUnit = 0` (the orthogonality), likewise the space component vanishes — so `S` maps the
  octonion block INTO itself; and on the block the `BvC`-isometry identity collapses to
  `gFormC (S(0,0,v)).2.2 (S(0,0,w)).2.2 = gFormC v w`, the induced map a `gFormC`-isometry. THE
  GAUGE GROUP: the octonion-block `gFormC`-isometries (SO(8) ⊃ Spin(7) ⊃ G₂ = Aut(O), N124/N20).

  ── THE SECTION (non-emptiness / converse embedding) ──
  N129's octonion-block embedding `octBlockEndC R` (for `R` a `gFormC`-isometry) is a `BvC`-isometry
  (N129 `octBlockEndC_isBvIsomLin`) fixing the (t,x) plane — so it LANDS in the stabilizer
  (`octBlockEndC_mem_octStab`). The stabilizer of the (t,x) plane in `SO⁺(1,9)` IS the octonion-block
  `gFormC`-isometry gauge group, realized via the embedding section.

  ── THE TRUNK REFRAME (W1) ──
  No new analytic input. Every step is a one-rewrite reduction through banked `gFormC` bilinearity
  (N-LieAlgebra), the N129 `(t,x)`/octonion `BvC`-orthogonality, and the N129 embedding `octBlockEndC`.
  The gauge structure is the DERIVED stabilizer of the derived form's observer plane — not a posited
  internal-symmetry group glued onto a posited Lorentz group.

  ── WHAT THIS NODE BANKS ──
  `bvC_oct_time` / `bvC_oct_space` — the `(t,x)`/octonion `BvC`-orthogonality read-offs.
  `IsOctStab` — the gauge-stabilizer predicate (a `BvC`-isometry fixing the (t,x) plane pointwise).
  `octStab_time_comp_zero` / `octStab_space_comp_zero` — a stabilizer element maps the octonion block
    into itself (the time/space components of the image vanish).
  ★★ `octStab_block_gFormC_isom` — THE GAUGE CONTENT: the induced octonion-block map of a stabilizer
    element preserves `gFormC` — the internal-symmetry (SO(8)/Spin(7)/G₂) gauge group.
  `octStabMonoid` — the gauge stabilizer as a SUBMONOID of `Module.End Cut STVC`.
  ★ `octStabMonoid_le_bvIsomLinMonoid` — the gauge group is a SUBGROUP of the Lorentz group `SO⁺(1,9)`.
  `octBlockEndC_fixes_mTimeUnit` / `octBlockEndC_fixes_mSpaceUnit` — the embedding fixes the (t,x) plane.
  ★ `octBlockEndC_mem_octStab` — THE SECTION: the octonion-block gauge group embeds into the stabilizer.
  W8 (genuinely non-identity gauge teeth): `octStab_witness_moves` (the concrete gauge element
    `octBlockEndC (houseHolder e2)` GENUINELY MOVES the octonion axis `e2 ↦ −e2`),
    `octStab_witness_mem` (it is a real stabilizer element), `octStab_witness_self_overlap`
    (it preserves the octonion-block self-overlap of `e2`, reading `1 = gFormC e2 e2` — the costume anchor).

  THE MOAT: the literature POSITS the Lorentz group AND an internal gauge group as independent inputs;
  here the gauge group is DERIVED as the stabilizer of the observer (t,x) plane inside the cascade's
  own derived Lorentz group `bvIsomLinMonoid` (N132), restricting to the cascade's own octonion-block
  `gFormC`-isometries (N124, the octonion automorphism / G₂ = Der(O) tower N20) — the internal symmetry
  is the residual Lorentz freedom that fixes the observer, CONSTRUCTED forward, not assumed; no posited
  gauge group, no posited Lorentz group, no Mathlib ℝ/ℂ as content, no bridge.

  DERIVED from the banked N49–N136 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the spacetime
  `STVC` + the indefinite Minkowski form `BvC` + the octonion-block embedding `octBlockEndC` (N129) +
  the Lorentz group `bvIsomLinMonoid` (N132). Foundations-only.
  ===========================================================================
-/
import Phys.Algebra.LorentzContinuumCliffordCoverKernel

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The (t,x) / octonion-block `BvC`-orthogonality read-offs. -/

/-- The octonion block is `BvC`-orthogonal to `mTimeUnit`: `BvC (0,0,v) (1,0,0) = 0`. -/
theorem bvC_oct_time (v : O Cut) :
    BvC ((0, 0, v) : STVC) (mTimeUnit : STVC) = 0 := by
  show (0:Cut) * 1 - 0 * 0 - gFormC v 0 = 0
  rw [gFormC_zero_right']; ring

/-- The octonion block is `BvC`-orthogonal to `mSpaceUnit`: `BvC (0,0,v) (0,1,0) = 0`. -/
theorem bvC_oct_space (v : O Cut) :
    BvC ((0, 0, v) : STVC) (mSpaceUnit : STVC) = 0 := by
  show (0:Cut) * 0 - 0 * 1 - gFormC v 0 = 0
  rw [gFormC_zero_right']; ring

/-! ## The gauge-stabilizer predicate: a `BvC`-isometry fixing the (t,x) plane pointwise. -/

/-- THE OCTONION-BLOCK STABILIZER predicate: a `Cut`-linear `BvC`-isometry of `STVC` (a continuum
    Lorentz element, `bvIsomLinMonoid`/N132) fixing the (t,x) plane (`mTimeUnit` and `mSpaceUnit`)
    pointwise — the internal-symmetry (gauge) subgroup of the Lorentz group. -/
def IsOctStab (S : Module.End Cut STVC) : Prop :=
  IsBvIsomLin S ∧ S mTimeUnit = mTimeUnit ∧ S mSpaceUnit = mSpaceUnit

/-! ## THE GAUGE CONTENT — a stabilizer element preserves the octonion block + its Born form. -/

/-- ★ A gauge-stabilizer element maps the octonion block into itself — the time component of the
    image vanishes: `(S (0,0,v)).1 = BvC (S(0,0,v)) mTimeUnit = BvC (S(0,0,v)) (S mTimeUnit)
    = BvC (0,0,v) mTimeUnit = 0` (the `(t,x)`/octonion orthogonality through the isometry). -/
theorem octStab_time_comp_zero {S : Module.End Cut STVC} (hS : IsOctStab S) (v : O Cut) :
    (S ((0, 0, v) : STVC)).1 = 0 := by
  obtain ⟨hiso, ht, _hx⟩ := hS
  have key : BvC (S ((0, 0, v) : STVC)) (mTimeUnit : STVC) = 0 := by
    rw [← ht, hiso ((0, 0, v) : STVC) (mTimeUnit : STVC), bvC_oct_time]
  have hval : BvC (S ((0, 0, v) : STVC)) (mTimeUnit : STVC) = (S ((0, 0, v) : STVC)).1 := by
    simp only [BvC, mTimeUnit, gFormC_zero_right']; ring
  rw [hval] at key; exact key

/-- ★ A gauge-stabilizer element maps the octonion block into itself — the space component of the
    image vanishes (the `mSpaceUnit` orthogonality, dual to `octStab_time_comp_zero`). -/
theorem octStab_space_comp_zero {S : Module.End Cut STVC} (hS : IsOctStab S) (v : O Cut) :
    (S ((0, 0, v) : STVC)).2.1 = 0 := by
  obtain ⟨hiso, _ht, hx⟩ := hS
  have key : BvC (S ((0, 0, v) : STVC)) (mSpaceUnit : STVC) = 0 := by
    rw [← hx, hiso ((0, 0, v) : STVC) (mSpaceUnit : STVC), bvC_oct_space]
  have hval : BvC (S ((0, 0, v) : STVC)) (mSpaceUnit : STVC) = -(S ((0, 0, v) : STVC)).2.1 := by
    simp only [BvC, mSpaceUnit, gFormC_zero_right']; ring
  rw [hval] at key
  linarith [key]

/-- ★★ THE GAUGE CONTENT: the octonion-block component of a gauge-stabilizer element preserves the
    Born form `gFormC`. For block vectors `(0,0,v)`, `(0,0,w)`, the `BvC`-isometry identity
    `BvC (S(0,0,v))(S(0,0,w)) = BvC (0,0,v)(0,0,w)` collapses (the time/space components of the
    images vanish, `octStab_time_comp_zero`/`octStab_space_comp_zero`) to
    `−gFormC (S(0,0,v)).2.2 (S(0,0,w)).2.2 = −gFormC v w`, i.e. the induced octonion-block map is a
    `gFormC`-isometry — the internal-symmetry (gauge) group SO(8) ⊃ Spin(7) ⊃ G₂ = Aut(O) = Der(O). -/
theorem octStab_block_gFormC_isom {S : Module.End Cut STVC} (hS : IsOctStab S) (v w : O Cut) :
    gFormC (S ((0, 0, v) : STVC)).2.2 (S ((0, 0, w) : STVC)).2.2 = gFormC v w := by
  obtain ⟨hiso, ht, hx⟩ := hS
  have hbase : BvC (S ((0, 0, v) : STVC)) (S ((0, 0, w) : STVC))
      = BvC ((0, 0, v) : STVC) ((0, 0, w) : STVC) := hiso _ _
  have htv := octStab_time_comp_zero ⟨hiso, ht, hx⟩ v
  have hxv := octStab_space_comp_zero ⟨hiso, ht, hx⟩ v
  have hL : BvC (S ((0, 0, v) : STVC)) (S ((0, 0, w) : STVC))
      = (S ((0, 0, v) : STVC)).1 * (S ((0, 0, w) : STVC)).1
        - (S ((0, 0, v) : STVC)).2.1 * (S ((0, 0, w) : STVC)).2.1
        - gFormC (S ((0, 0, v) : STVC)).2.2 (S ((0, 0, w) : STVC)).2.2 := rfl
  have hR : BvC ((0, 0, v) : STVC) ((0, 0, w) : STVC) = - gFormC v w := by
    show (0:Cut) * 0 - 0 * 0 - gFormC v w = - gFormC v w; ring
  rw [hL, htv, hxv, hR] at hbase
  rw [zero_mul, zero_mul] at hbase
  linarith [hbase]

/-! ## The gauge stabilizer as a submonoid of the Lorentz group. -/

/-- THE GAUGE STABILIZER as a SUBMONOID of `Module.End Cut STVC`: the `BvC`-isometries fixing the
    (t,x) plane pointwise. The identity fixes everything and is a `BvC`-isometry; a composite of two
    stabilizer elements fixes the plane (`S (T x) = S x = x`) and is a `BvC`-isometry
    (`IsBvIsomLin.comp`). The internal-symmetry (gauge) group as a derived submonoid. -/
def octStabMonoid : Submonoid (Module.End Cut STVC) where
  carrier := {S | IsOctStab S}
  one_mem' := by
    refine ⟨?_, ?_, ?_⟩
    · intro p q; simp only [Module.End.one_apply]
    · simp only [Module.End.one_apply]
    · simp only [Module.End.one_apply]
  mul_mem' := by
    rintro S T ⟨hSiso, hSt, hSx⟩ ⟨hTiso, hTt, hTx⟩
    refine ⟨IsBvIsomLin.comp hSiso hTiso, ?_, ?_⟩
    · show S (T mTimeUnit) = mTimeUnit; rw [hTt, hSt]
    · show S (T mSpaceUnit) = mSpaceUnit; rw [hTx, hSx]

/-- Membership in `octStabMonoid` unfolds to the gauge-stabilizer predicate. -/
theorem mem_octStabMonoid {S : Module.End Cut STVC} :
    S ∈ octStabMonoid ↔ IsOctStab S := Iff.rfl

/-- ★ THE GAUGE GROUP IS A SUBGROUP OF THE LORENTZ GROUP: every gauge-stabilizer element is a
    continuum Lorentz element (`octStabMonoid ≤ bvIsomLinMonoid`, the internal symmetry sits inside
    `SO⁺(1,9)` as the stabilizer of the observer (t,x) plane). -/
theorem octStabMonoid_le_bvIsomLinMonoid : octStabMonoid ≤ bvIsomLinMonoid := by
  intro S hS
  exact hS.1

/-! ## THE SECTION — the octonion-block gauge group embeds into the stabilizer. -/

/-- The octonion-block embedding fixes `mTimeUnit` (the (t,x) part of `octBlockEndC R` is the identity). -/
theorem octBlockEndC_fixes_mTimeUnit (R : O Cut →ₗ[Cut] O Cut) :
    octBlockEndC R (mTimeUnit : STVC) = mTimeUnit := by
  rw [octBlockEndC_apply]
  show ((1:Cut), (0:Cut), R (0 : O Cut)) = mTimeUnit
  rw [map_zero]; rfl

/-- The octonion-block embedding fixes `mSpaceUnit`. -/
theorem octBlockEndC_fixes_mSpaceUnit (R : O Cut →ₗ[Cut] O Cut) :
    octBlockEndC R (mSpaceUnit : STVC) = mSpaceUnit := by
  rw [octBlockEndC_apply]
  show ((0:Cut), (1:Cut), R (0 : O Cut)) = mSpaceUnit
  rw [map_zero]; rfl

/-- ★ THE SECTION: the octonion-block embedding `octBlockEndC R` of a `gFormC`-isometry `R` lands in
    the gauge stabilizer — it is a `BvC`-isometry (N129 `octBlockEndC_isBvIsomLin`) fixing the (t,x)
    plane. The octonion-block `gFormC`-isometry gauge group (SO(8)/Spin(7)/G₂) embeds into the
    stabilizer of the observer plane inside the Lorentz group. -/
theorem octBlockEndC_mem_octStab {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    IsOctStab (octBlockEndC R) :=
  ⟨octBlockEndC_isBvIsomLin hR, octBlockEndC_fixes_mTimeUnit R, octBlockEndC_fixes_mSpaceUnit R⟩

/-! ## W8 — a concrete non-identity gauge element. -/

/-- ★ W8 NON-VACUITY: the concrete gauge element `octBlockEndC (houseHolder e2)` GENUINELY MOVES the
    octonion axis `e₂ ↦ −e₂` (`houseHolder_neg_self`, `gFormC e₂ e₂ = 1 ≠ 0`) — a real non-identity
    internal-symmetry transformation, not a vacuous stabilizer. -/
theorem octStab_witness_moves :
    octBlockEndC (houseHolder (CD.e2 : O Cut)) ((0, 0, (CD.e2 : O Cut)) : STVC)
      = (0, 0, -(CD.e2 : O Cut)) := by
  rw [octBlockEndC_apply]
  refine Prod.ext rfl (Prod.ext rfl ?_)
  show houseHolder (CD.e2 : O Cut) (CD.e2 : O Cut) = -(CD.e2 : O Cut)
  exact houseHolder_neg_self (by rw [e2_gFormC_self]; norm_num)

/-- ★ W8 TEETH: the concrete gauge element is a genuine member of the gauge stabilizer (a real
    internal-symmetry element fixing the observer (t,x) plane). -/
theorem octStab_witness_mem :
    IsOctStab (octBlockEndC (houseHolder (CD.e2 : O Cut))) :=
  octBlockEndC_mem_octStab (houseHolder_isom (by rw [e2_gFormC_self]; norm_num))

/-- ★ W8 TEETH — the distinguishing read-off the costume bites: the gauge element preserves the
    octonion-block Born self-overlap of `e₂`, reading `1` (`= gFormC e₂ e₂`). The element genuinely
    moves the axis (`octStab_witness_moves`) yet the Born form is preserved (the gauge content
    `octStab_block_gFormC_isom`) — `gFormC (−e₂)(−e₂) = gFormC e₂ e₂ = 1`. -/
theorem octStab_witness_self_overlap :
    gFormC (octBlockEndC (houseHolder (CD.e2 : O Cut)) ((0, 0, (CD.e2 : O Cut)) : STVC)).2.2
           (octBlockEndC (houseHolder (CD.e2 : O Cut)) ((0, 0, (CD.e2 : O Cut)) : STVC)).2.2 = 1 := by
  rw [octStab_witness_moves]
  show gFormC (-(CD.e2 : O Cut)) (-(CD.e2 : O Cut)) = 1
  rw [gFormC_neg_left, octRefl_gFormC_neg_right, e2_gFormC_self]; norm_num

end

end Phys.Algebra
