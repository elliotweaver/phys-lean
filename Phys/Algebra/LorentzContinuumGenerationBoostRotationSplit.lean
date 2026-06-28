/-
  Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit — N129: THE BOOST/ROTATION BLOCK
  DECOMPOSITION stitching the (t,x) boost strand to the octonion-block exhaustion, both COVERED
  by the now-CLOSED indefinite Householder exhaustion (N128 `lorentz_exhaustion_M`), over the
  derived ℝ `Cut`.

  ===========================================================================
  CONTEXT. N128 CLOSED the full unconditional `SO⁺(1,9)` indefinite Cartan–Dieudonné exhaustion:
  EVERY `BvC`-isometry of the spacetime `STVC = Cut × Cut × O Cut` is a finite product of indefinite
  Householder reflections (`lorentz_exhaustion_M`, `Submonoid.closure houseHolderMSet`). The two
  strands that the exhaustion was assembled from are still DISCONNECTED as a structural statement:
    • the genuinely-indefinite `(t,x)` hyperbolic boost factor `boostEndC a b` (N49–N51), a
      `QvC`-isometry on the unit hyperbola `a² − b² = 1`;
    • the positive-definite octonion-block rotation factor — N124's full `O(8)` exhaustion
      `gFormC_isom_mem_closure`: every `gFormC`-isometry `R` of `O Cut` is a finite product of
      positive-definite Householder reflections.

  ── THE STITCH (the forward joint this node banks) ──
  The block-diagonal subgroup `boost × rotation` of `SO⁺(1,9)` is realized as a DERIVED structure:
  the boost touches only the `(t,x)` plane, the rotation only the octonion block, the two blocks
  are `BvC`-orthogonal, the factors COMMUTE, and the whole product is a `BvC`-isometry — hence
  COVERED by the closed exhaustion `lorentz_exhaustion_M`. No polar/KAK descent is asserted; the
  block decomposition is CONSTRUCTED forward from the two banked strands and the closed exhaustion.

  ── THE TRUNK REFRAME (W1) ──
  The block-diagonal isometry needs NO new analytic input. The boost preserves `BvC` because it
  preserves the Born quadratic `QvC` and a linear `QvC`-isometry preserves the polarized `BvC`
  (`linIsom_BvC_preserved`, the banked EvC↔BvC bridge). The octonion-block embedding preserves
  `BvC` because the `(t,x)` part is the identity and the `v`-block is a `gFormC`-isometry, and `BvC`
  on the spatial block IS `−gFormC`. The two factors commute because each acts on a complementary
  block. The block-orthogonality `BvC ((t,x,0)) ((0,0,v)) = 0` is `gFormC 0 v = 0` (`gFormC_zero_left`).
  Every step is a one-rewrite reduction through banked structure — no coordinate brute force.

  ── WHAT THIS NODE BANKS ──
  `octBlockEndC R` — the octonion-block embedding `(t,x,v) ↦ (t,x,R v)` as a `Module.End Cut STVC`.
  `octBlockEndC_apply` — its action.
  `octBlockEndC_isBvIsomLin` — `octBlockEndC R` preserves `BvC` when `R` is a `gFormC`-isometry.
  `boostEndC_isBvIsomLin` — the boost preserves `BvC` on the unit hyperbola (`linIsom_BvC_preserved`).
  `blockDiagC a b R := boostEndC a b * octBlockEndC R` — the block-diagonal `boost × rotation` operator.
  `blockDiagC_apply` — its explicit action `(t,x,v) ↦ (a t + b x, b t + a x, R v)`.
  `boostEndC_octBlockEndC_commute` — the block factors COMMUTE.
  `blockDiagC_isBvIsomLin` — the block-diagonal operator preserves `BvC`.
  ★★ `blockDiagC_mem_closure` — THE STITCH: the closed exhaustion `lorentz_exhaustion_M` covers the
    ENTIRE block-diagonal `boost × rotation` subgroup of `SO⁺(1,9)`.
  ★ `bvC_tx_oct_orthogonal` — the `(t,x)` plane is `BvC`-orthogonal to the octonion block (the
    EvC-orthogonal split realized on the indefinite form).
  `id_isGFormCIsom` — the identity octonion-block rotation is a `gFormC`-isometry.
  W8 (genuinely-indefinite): `blockDiagC_boost_witness_image` (a concrete boost `a=5/3, b=4/3` GENUINELY
    MOVES the timelike axis `mTimeUnit = (1,0,0) ↦ (5/3, 4/3, 0)` — non-vacuous), and
    `blockDiagC_boost_witness_self_overlap` (the moved image's Minkowski self-overlap reads `1`, NOT
    a wrong value — the block-diagonal map preserves the indefinite form).

  THE MOAT: the literature POSITS the polar/KAK decomposition `SO⁺(1,9) ≅ boosts × SO(9)`; here the
  block-diagonal `boost × rotation` subgroup is CONSTRUCTED forward from the cascade-derived boost
  factor (the `(t,x)` Born quadratic) and the cascade-derived octonion-block exhaustion N124, and
  shown to live inside the closed exhaustion's Householder closure — the structure DERIVED, not
  asserted. The full converse (an arbitrary `BvC`-isometry FACTORS as boost × rotation — the polar
  decomposition / `(1,1)`-block hyperbolic classification) is the childed HEAVY remainder N130; this
  node banks the forward block-diagonal structure + the `BvC`-orthogonal split, the bankable joint.

  DERIVED from the banked N49–N128 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC`. Foundations-only.
  ===========================================================================
-/
import Phys.Algebra.LorentzContinuumGenerationTotallyIsotropic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The octonion-block embedding `(t,x,v) ↦ (t,x,R v)`. -/

/-- THE OCTONION-BLOCK EMBEDDING as a `Module.End Cut STVC`: a linear endomorphism `R` of the
    octonion block `O Cut` lifted to act on `STVC = Cut × Cut × O Cut` fixing the `(t,x)` plane,
    `(t,x,v) ↦ (t,x,R v)`. -/
def octBlockEndC (R : O Cut →ₗ[Cut] O Cut) : Module.End Cut STVC where
  toFun p := (p.1, p.2.1, R p.2.2)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show R (p.2.2 + q.2.2) = R p.2.2 + R q.2.2
    rw [map_add]
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show R (c • p.2.2) = c • R p.2.2
    rw [map_smul]

/-- The action of the octonion-block embedding. -/
theorem octBlockEndC_apply (R : O Cut →ₗ[Cut] O Cut) (p : STVC) :
    octBlockEndC R p = (p.1, p.2.1, R p.2.2) := rfl

/-- ★ THE OCTONION-BLOCK EMBEDDING PRESERVES THE INDEFINITE FORM: `octBlockEndC R` is a
    `BvC`-isometry whenever `R` is a `gFormC`-isometry of the octonion block. The `(t,x)` part is
    the identity, the `v`-block is `R`, and `BvC` on the spatial block IS `−gFormC` — so the single
    hypothesis `gFormC (R v)(R v') = gFormC v v'` closes it. -/
theorem octBlockEndC_isBvIsomLin {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    IsBvIsomLin (octBlockEndC R) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * t' - x * x' - gFormC (R v) (R v') = t * t' - x * x' - gFormC v v'
  rw [hR v v']

/-! ## The boost preserves the indefinite form. -/

/-- ★ THE BOOST PRESERVES THE INDEFINITE FORM: `boostEndC a b` is a `BvC`-isometry on the unit
    hyperbola `a² − b² = 1`. The boost preserves the Born quadratic `QvC` (`boostEndC_isQvIsomC`),
    and a LINEAR `QvC`-isometry preserves the polarized Minkowski form `BvC`
    (`linIsom_BvC_preserved`, the banked EvC↔BvC bridge) — no new analytic input. -/
theorem boostEndC_isBvIsomLin {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    IsBvIsomLin (boostEndC a b) :=
  fun p q => linIsom_BvC_preserved (boostEndC_isQvIsomC hab) p q

/-! ## The block-diagonal `boost × rotation` operator. -/

/-- THE BLOCK-DIAGONAL `boost × rotation` OPERATOR: the composite of the `(t,x)` hyperbolic boost
    and the octonion-block rotation, `boostEndC a b * octBlockEndC R`. -/
def blockDiagC (a b : Cut) (R : O Cut →ₗ[Cut] O Cut) : Module.End Cut STVC :=
  boostEndC a b * octBlockEndC R

/-- The explicit action of the block-diagonal operator: `(t,x,v) ↦ (a t + b x, b t + a x, R v)`. -/
theorem blockDiagC_apply (a b : Cut) (R : O Cut →ₗ[Cut] O Cut) (p : STVC) :
    blockDiagC a b R p = (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, R p.2.2) := by
  show boostEndC a b (octBlockEndC R p) = _
  rw [octBlockEndC_apply, boostEndC_apply]

/-- ★ THE BLOCK FACTORS COMMUTE: the boost touches only the `(t,x)` plane and the rotation only the
    octonion block, so `boostEndC a b * octBlockEndC R = octBlockEndC R * boostEndC a b`. -/
theorem boostEndC_octBlockEndC_commute (a b : Cut) (R : O Cut →ₗ[Cut] O Cut) :
    boostEndC a b * octBlockEndC R = octBlockEndC R * boostEndC a b := by
  apply LinearMap.ext; intro p
  show boostEndC a b (octBlockEndC R p) = octBlockEndC R (boostEndC a b p)
  rw [octBlockEndC_apply, boostEndC_apply, boostEndC_apply, octBlockEndC_apply]

/-- ★ THE BLOCK-DIAGONAL OPERATOR PRESERVES THE INDEFINITE FORM: the composite of two `BvC`-isometries
    is a `BvC`-isometry (`IsBvIsomLin.comp`). -/
theorem blockDiagC_isBvIsomLin {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1)
    {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    IsBvIsomLin (blockDiagC a b R) :=
  IsBvIsomLin.comp (boostEndC_isBvIsomLin hab) (octBlockEndC_isBvIsomLin hR)

/-! ## THE STITCH — the closed exhaustion covers the block-diagonal subgroup. -/

/-- ★★ THE STITCH: the now-CLOSED indefinite Householder exhaustion (`lorentz_exhaustion_M`, N128)
    covers the ENTIRE block-diagonal `boost × rotation` subgroup of `SO⁺(1,9)` — every block-diagonal
    operator (a `(t,x)` boost on the unit hyperbola composed with a `gFormC`-isometry of the octonion
    block) is a finite product of indefinite Householder reflections (`Submonoid.closure
    houseHolderMSet`). The boost strand (N49–N51) and the octonion-block exhaustion (N124) STITCHED
    to the closed exhaustion (N128), CONSTRUCTED forward — the polar/KAK split DERIVED, not posited. -/
theorem blockDiagC_mem_closure {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1)
    {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    blockDiagC a b R ∈ Submonoid.closure houseHolderMSet :=
  lorentz_exhaustion_M (blockDiagC a b R) (blockDiagC_isBvIsomLin hab hR)

/-! ## The `BvC`-orthogonal block split. -/

/-- ★ THE `(t,x)`-PLANE IS `BvC`-ORTHOGONAL TO THE OCTONION BLOCK: `BvC ((t,x,0)) ((0,0,v)) = 0` —
    the EvC-orthogonal split that justifies the boost/rotation block decomposition, realized on the
    indefinite Minkowski form. The cross term is `−gFormC 0 v = 0` (`gFormC_zero_left`). -/
theorem bvC_tx_oct_orthogonal (t x : Cut) (v : O Cut) :
    BvC ((t, x, (0 : O Cut)) : STVC) ((0, 0, v) : STVC) = 0 := by
  show t * 0 - x * 0 - gFormC 0 v = 0
  rw [gFormC_zero_left]; ring

/-- The identity octonion-block rotation is a `gFormC`-isometry (the trivial rotation factor). -/
theorem id_isGFormCIsom : IsGFormCIsom (LinearMap.id : O Cut →ₗ[Cut] O Cut) :=
  fun _ _ => rfl

/-! ## W8 teeth — a genuinely-indefinite boost witness that GENUINELY moves and preserves `BvC`. -/

/-- ★ W8 NON-VACUITY: the block-diagonal map with a concrete boost `a = 5/3, b = 4/3`
    (`(5/3)² − (4/3)² = 1`) and the identity rotation GENUINELY MOVES the timelike unit axis
    `mTimeUnit = (1,0,0) ↦ (5/3, 4/3, 0)` — the operator is NOT the identity, so the structure is
    non-vacuous (it mixes the `(t,x)` block as a true boost). -/
theorem blockDiagC_boost_witness_image :
    blockDiagC ((5 : Cut) / 3) ((4 : Cut) / 3) LinearMap.id (mTimeUnit : STVC)
      = ((5 : Cut) / 3, (4 : Cut) / 3, (0 : O Cut)) := by
  rw [blockDiagC_apply]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show (5:Cut)/3 * 1 + (4:Cut)/3 * 0 = (5:Cut)/3; ring
  · show (4:Cut)/3 * 1 + (5:Cut)/3 * 0 = (4:Cut)/3; ring
  · show (LinearMap.id : O Cut →ₗ[Cut] O Cut) 0 = 0; rw [map_zero]

/-- ★ W8 TEETH — the genuinely-indefinite read-off: the block-diagonal map PRESERVES the indefinite
    Minkowski self-overlap of the (moved) timelike axis, reading `1` (`= BvC mTimeUnit mTimeUnit`).
    The boost genuinely moves the axis (`blockDiagC_boost_witness_image`) yet the indefinite form is
    preserved (`blockDiagC_isBvIsomLin`) — the distinguishing read-off the costume C161 bites. -/
theorem blockDiagC_boost_witness_self_overlap :
    BvC (blockDiagC ((5 : Cut) / 3) ((4 : Cut) / 3) LinearMap.id (mTimeUnit : STVC))
        (blockDiagC ((5 : Cut) / 3) ((4 : Cut) / 3) LinearMap.id (mTimeUnit : STVC))
      = 1 := by
  have hab : ((5 : Cut) / 3) ^ 2 - ((4 : Cut) / 3) ^ 2 = 1 := by ring
  rw [blockDiagC_isBvIsomLin hab id_isGFormCIsom, BvC_mTimeUnit_self]

end

end Phys.Algebra
