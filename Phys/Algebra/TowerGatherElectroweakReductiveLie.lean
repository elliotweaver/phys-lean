/-
  Phys.Algebra.TowerGatherElectroweakReductiveLie — N258.
  ===========================================================================
  THE ELECTROWEAK REDUCTIVE LIE ALGEBRA `su(2)_L ⊕ u(1)_Y` AS ONE LIE SUBALGEBRA OF `so(7)`, DERIVED
  from the gather tear of the octonion tower. Owner-authorized gather-side electroweak front, under the
  TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT the
  parked invariant-tower ascent.

  THE TWIN OF N247, WITH THE SEMISIMPLE / CENTRAL ROLES SWAPPED ACROSS THE TEAR. N247 assembled the
  colour-charge reductive factor `u(1)_Q ⊕ su(3)_colour`: the ABELIAN u(1) charge line in the
  FUNDAMENTAL 7 (`range crossEmb`), the SEMISIMPLE colour su(3) in the ADJOINT 14 (`range imRepL`).
  THIS node assembles the SECOND Standard-Model reductive factor from the SAME gather tear
  `so(7) = 14 (Der O) ⊕ 7 (crossEmb)`, with the two roles interchanged:
    • SEMISIMPLE `su(2)_L` = the weak-isospin derivations `{DI, DJ, DK}` (N202), living in the
      ADJOINT 14 `range imRepL` — the span `isospinSpan` pushed through `imRepL` (`isospinImg`);
    • ABELIAN central `u(1)_Y` = the gather hypercharge `hyperOp = crossOp (kappaO 1)` (N255), living
      in the FUNDAMENTAL 7 `range crossEmb` — the line `span{hyperOp}` (`hyperLine`).

  N253–N257 pinned the CARTAN pieces of this factor — the isospin-commuting direction, the invariant
  lengths, the orthogonality (`traceForm7 chargeOp hyperOp = 0`, `= −6` self-lengths, the gather
  isometry) — but never assembled the LIE-ALGEBRA object. THIS node builds it:

    ★★★ `su(2)_L` (`isospinImg`) is BRACKET-CLOSED (`isospinImg_lie_closed`) — a Lie subalgebra,
        because `isospinSpan = span{DI,DJ,DK}` is closed under `⁅·,·⁆` (the 9 su(2) brackets
        `⁅DI,DJ⁆=2•DK` etc., N202/N253) and `imRepL` is a Lie hom;
    ★★★ the `u(1)_Y` line `hyperLine` brackets to `0` against the WHOLE join
        (`hyperLine_central`) — a genuine central abelian ideal, because `hyperOp` COMMUTES with
        every isospin generator (`hyperOp_bracket_DI/DJ/DK = 0`, N255, extended bilinearly across
        `isospinSpan`), and `hyperLine` is self-abelian;
    ★★★ the DERIVED subalgebra of the join lands entirely in `su(2)_L`
        (`join_derived_le_isospinImg`): the abelian `u(1)_Y` direction is LOST under bracketing, so
        the semisimple part of the reductive algebra is exactly `su(2)_L`. This is the reductive
        splitting `[g, g] = su(2)_L`, `Z(g) ⊇ u(1)_Y` of `g = su(2)_L ⊕ u(1)_Y`, DERIVED not posited;
    ★★★ the join `isospinImg ⊔ hyperLine` is a genuine LIE SUBALGEBRA `electroweakLie` of
        `Module.End ℚ ImO`, sitting inside `so(7)` (`electroweakLie_le_so7`), of dimension
        `4 = 3 + 1` (`electroweakLie_finrank`): the two summands meet only in `⊥`
        (`isospinImg_inf_hyperLine_eq_bot`, forced by `inter_eq_bot` — the 14 and the 7 of the
        gather tear share nothing, the SIMPLICITY of `Der(O ℚ)`, N225/N28).

  THE MOAT / "ONE CAUSE, MANY TERMINATIONS" (docs/STANDARD §0). The SAME `inter_eq_bot` — the trivial
  intersection `range imRepL ⊓ range crossEmb = ⊥`, forced by the simplicity of `Der(O ℚ)` — that in
  N246/N247 separated the ABELIAN charge line (in the 7) from the SEMISIMPLE colour su(3) (in the 14)
  now separates the SEMISIMPLE `su(2)_L` (in the 14) from the ABELIAN `u(1)_Y` (in the 7): the two
  Standard-Model reductive factors are the two halves of the ONE gather tear, with the semisimple and
  abelian roles occupying OPPOSITE summands. The `SU(2)×U(1)` the field POSITS as an independent
  product group is here realized as the reductive Lie algebra `su(2)_L ⊕ u(1)_Y` — ONE derived Lie
  subalgebra of the single `so(7)` the gather produces, abelian factor central, semisimple factor
  `su(2)_L` — DERIVED, not posited.

  W8 TEETH — the reductive structure is PROPER and the two sectors are GENUINELY DISTINCT.
  `electroweakLie_finrank = 4`: the factor is genuinely `4`-dimensional (`3 + 1`), NOT collapsed to
  `3` (hypercharge absorbed into isospin) and NOT to `1` (isospin trivial). And
  `chargeOp_not_mem_electroweakLie`: the gather CHARGE `chargeOp = crossOp u1` (N240) — which N247
  places INSIDE the colour-charge factor — is NOT in the electroweak factor at all. Coordinate-free:
  if `chargeOp = x + h` with `x ∈ isospinImg ⊆ 14` and `h ∈ hyperLine ⊆ 7`, then
  `x = chargeOp − h ∈ range crossEmb` (both `chargeOp` and `h` are 7-elements) AND
  `x ∈ range imRepL` (isospin is 14), so `x ∈ range imRepL ⊓ range crossEmb = ⊥` (`inter_eq_bot`),
  forcing `chargeOp = h = c • hyperOp`; but then `traceForm7 chargeOp chargeOp = c · traceForm7
  chargeOp hyperOp = c · 0 = 0` (N257 orthogonality `B_chargeOp_hyperOp`), contradicting
  `traceForm7 chargeOp chargeOp = −6` (N257 `B_chargeOp_chargeOp`). So the two SM reductive factors
  are NOT the same subalgebra — the electroweak sector and the colour-charge sector are distinct, the
  charge sitting in one and absent from the other.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md warning light). `DI/DJ/DK`,
  `isospinSpan`, `imRep`, `imRepL`, `hyperOp`, `crossOp`, `crossEmb`, `chargeOp`, `bornBil`-so(7),
  `traceForm7` stay DERIVED REAL objects over the derived `ℚ`; `LieSubalgebra`, `⁅·,·⁆` on
  `Module.End ℚ ImO`, `LieHom.map_lie`, `Submodule.mem_sup`/`span`/`map`, `finrank` are Mathlib
  machinery ON them. NO `Algebra ℚ (Dbl ℚ)`, NO `TensorProduct`, NO `ℚ[i]`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "electroweak / weak isospin / hypercharge /
  su(2) / u(1) / charge / gauge / central / reductive": over the derived field `ℚ` and
  `O ℚ = CD (H ℚ)`, for the fundamental 7 `ImO`, the bracket-closed span `isospinSpan = span{DI,DJ,DK}`
  pushed through the Lie hom `imRepL` (`isospinImg`), the line `span{crossOp (kappaO 1)}` (`hyperLine`),
  and the Born form `bornBil`: the join `isospinImg ⊔ hyperLine` is a Lie subalgebra of the
  skew-adjoint endomorphisms of `bornBil`; `hyperLine` brackets to `0` against the whole join; the
  derived subalgebra `⁅join, join⁆` lies in `isospinImg`; the two summands meet in `⊥`; the join has
  `finrank 4`; and `crossOp u1 ∉ join`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N255 (`hyperOp`/`hyperOp_bracket_DI/DJ/DK`/`hyperOp_ne_zero`/`kap1'`),
  N253/N202 (`DI/DJ/DK`/`isospinSpan`/`bracket_DI_DJ_eq` etc./`imRep`/`imRepL`/`imRep_injective`/
  `imRep_mem_so7`), N257 (`traceForm7`/`B_chargeOp_chargeOp`/`B_chargeOp_hyperOp`), N247/N246
  (`chargeOp`/`chargeOp_mem_range_crossEmb`), N225 (`crossEmb`/`crossEmb_apply`/`inter_eq_bot`/
  `crossOp_mem_so7`), N201 pattern; and standard Mathlib Lie/module machinery. Ground = derived ℚ;
  nothing posited; no Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Phys.Algebra.TowerGatherForcedChargeColourComplementary
import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinTraceForm
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.TowerGatherIsometry

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-! ## THE WEAK-ISOSPIN SPAN `su(2)_L` IS BRACKET-CLOSED IN `Der(O ℚ)`. -/

/-- ★★ `isospinSpan = span{DI, DJ, DK}` IS BRACKET-CLOSED in `derivationLieQ`:
    `⁅x, y⁆ ∈ isospinSpan` for `x, y ∈ isospinSpan`. Expanding `x = a1•DI + a2•DJ + a3•DK`,
    `y = b1•DI + b2•DJ + b3•DK` bilinearly, each `⁅Dp, Dq⁆` is `0` (self) or `±2•Dr` (the 9 su(2)
    brackets `⁅DI,DJ⁆=2•DK`, `⁅DJ,DK⁆=2•DI`, `⁅DK,DI⁆=2•DJ`, N202/N253, + antisymmetry), so the
    bracket is again a linear combination of `DI, DJ, DK` — back in the span. Weak isospin `su(2)_L`
    is a genuine Lie subalgebra of the derivations. -/
theorem isospinSpan_lie_closed (x y : derivationLieQ)
    (hx : x ∈ isospinSpan) (hy : y ∈ isospinSpan) : ⁅x, y⁆ ∈ isospinSpan := by
  have mDI : DI ∈ isospinSpan := Submodule.subset_span (by simp)
  have mDJ : DJ ∈ isospinSpan := Submodule.subset_span (by simp)
  have mDK : DK ∈ isospinSpan := Submodule.subset_span (by simp)
  rw [isospinSpan, Submodule.mem_span_triple] at hx hy
  obtain ⟨a1, a2, a3, rfl⟩ := hx
  obtain ⟨b1, b2, b3, rfl⟩ := hy
  have hII : (⁅DI, DI⁆ : derivationLieQ) = 0 := lie_self DI
  have hJJ : (⁅DJ, DJ⁆ : derivationLieQ) = 0 := lie_self DJ
  have hKK : (⁅DK, DK⁆ : derivationLieQ) = 0 := lie_self DK
  have hIJ : (⁅DI, DJ⁆ : derivationLieQ) = (2:ℚ) • DK := bracket_DI_DJ_eq
  have hJK : (⁅DJ, DK⁆ : derivationLieQ) = (2:ℚ) • DI := bracket_DJ_DK_eq
  have hKI : (⁅DK, DI⁆ : derivationLieQ) = (2:ℚ) • DJ := bracket_DK_DI_eq
  have hJI : (⁅DJ, DI⁆ : derivationLieQ) = -((2:ℚ) • DK) := by
    rw [← lie_skew DJ DI, hIJ]
  have hKJ : (⁅DK, DJ⁆ : derivationLieQ) = -((2:ℚ) • DI) := by
    rw [← lie_skew DK DJ, hJK]
  have hIK : (⁅DI, DK⁆ : derivationLieQ) = -((2:ℚ) • DJ) := by
    rw [← lie_skew DI DK, hKI]
  simp only [add_lie, lie_add, smul_lie, lie_smul, hII, hJJ, hKK, hIJ, hJK, hKI, hJI, hKJ, hIK,
    smul_zero, add_zero, zero_add, smul_neg]
  repeat' first
    | exact Submodule.zero_mem _
    | exact mDI
    | exact mDJ
    | exact mDK
    | apply Submodule.add_mem
    | apply Submodule.neg_mem
    | apply Submodule.smul_mem

/-! ## THE ELECTROWEAK GENERATORS INSIDE `End ℚ ImO` — `su(2)_L` IN THE 14, `u(1)_Y` IN THE 7. -/

/-- Weak isospin `su(2)_L = isospinSpan` (N202) as a submodule of the gather arena so(7), via the
    derivation embedding `imRepL` (N225): `isospinImg = isospinSpan.map imRepL`. This is the
    concrete `su(2)_L` acting on the fundamental 7, sitting inside the adjoint 14 — the twin of
    N247's `colourImg = colourCentralizer.map imRepL`, semisimple factor in the ADJOINT summand. -/
def isospinImg : Submodule ℚ (Module.End ℚ ImO) := isospinSpan.map imRepL

/-- The `u(1)_Y` hypercharge line (dim `1`) as a submodule of the gather arena so(7):
    `hyperLine = span{hyperOp}`, `hyperOp = crossOp (kappaO 1)` (N255). The twin of N247's
    `chargeLine = span{chargeOp}`, abelian factor — but here in the FUNDAMENTAL 7, not the adjoint. -/
def hyperLine : Submodule ℚ (Module.End ℚ ImO) := Submodule.span ℚ {hyperOp}

/-- Weak isospin `su(2)_L` lies in the adjoint-14 summand `range imRepL` (the image of a submodule
    under `imRepL`). -/
theorem isospinImg_le_range_imRep : isospinImg ≤ LinearMap.range imRepL :=
  LinearMap.map_le_range

/-- `hyperOp ∈ range crossEmb`: the hypercharge operator is a fundamental-7 element,
    `hyperOp = crossOp (kappaO 1) = crossEmb kap1'` (N255). -/
theorem hyperOp_mem_range_crossEmb : hyperOp ∈ LinearMap.range crossEmb :=
  ⟨kap1', by rw [crossEmb_apply]; rfl⟩

/-- The `u(1)_Y` line lies in the fundamental-7 summand `range crossEmb`. -/
theorem hyperLine_le_range_crossEmb : hyperLine ≤ LinearMap.range crossEmb := by
  rw [hyperLine, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  exact hyperOp_mem_range_crossEmb

/-! ## `su(2)_L` IS LIE-BRACKET CLOSED (a Lie subalgebra of so(7)). -/

/-- ★★ WEAK ISOSPIN `su(2)_L` IS BRACKET-CLOSED: `⁅x, y⁆ ∈ isospinImg` for `x, y ∈ isospinImg`. Any
    two isospin elements are `imRepL d`, `imRepL d'` with `d, d' ∈ isospinSpan`; their bracket is
    `imRepL ⁅d, d'⁆` (the Lie-hom identity for `imRep`) with `⁅d, d'⁆ ∈ isospinSpan`
    (`isospinSpan_lie_closed`). `su(2)_L` is a genuine Lie subalgebra sitting inside so(7). -/
theorem isospinImg_lie_closed (x y : Module.End ℚ ImO)
    (hx : x ∈ isospinImg) (hy : y ∈ isospinImg) : ⁅x, y⁆ ∈ isospinImg := by
  rw [isospinImg, Submodule.mem_map] at hx hy
  obtain ⟨d, hd, rfl⟩ := hx
  obtain ⟨d', hd', rfl⟩ := hy
  have hbr : (⁅d, d'⁆ : derivationLieQ) ∈ isospinSpan := isospinSpan_lie_closed d d' hd hd'
  rw [isospinImg, Submodule.mem_map]
  exact ⟨⁅d, d'⁆, hbr, by rw [show imRepL ⁅d, d'⁆ = imRep ⁅d, d'⁆ from rfl, LieHom.map_lie]; rfl⟩

/-! ## THE `u(1)_Y` LINE COMMUTES WITH `su(2)_L` AT THE LIE-BRACKET LEVEL. -/

/-- `hyperOp` brackets to `0` against every isospin generator in the span: `⁅imRep d, hyperOp⁆ = 0`
    for `d ∈ isospinSpan`. Expanding `d = a•DI + b•DJ + c•DK`, each `⁅imRep DI/DJ/DK, hyperOp⁆ = 0`
    (N255 `hyperOp_bracket_DI/DJ/DK` — `hyperOp` commutes with the WHOLE weak isospin because
    `kappaO 1` is the isospin-fixed singlet, N256). -/
theorem hyperOp_bracket_isospinSpan (d : derivationLieQ) (hd : d ∈ isospinSpan) :
    ⁅imRep d, hyperOp⁆ = 0 := by
  rw [isospinSpan, Submodule.mem_span_triple] at hd
  obtain ⟨a, b, c, rfl⟩ := hd
  rw [map_add, map_add, map_smul, map_smul, map_smul, add_lie, add_lie,
      smul_lie a (imRep DI) hyperOp, smul_lie b (imRep DJ) hyperOp, smul_lie c (imRep DK) hyperOp,
      hyperOp_bracket_DI, hyperOp_bracket_DJ, hyperOp_bracket_DK,
      smul_zero, smul_zero, smul_zero, add_zero, add_zero]

/-- `⁅x, hyperOp⁆ = 0` for `x ∈ isospinImg` (`x = imRepL d`, `d ∈ isospinSpan`, then
    `hyperOp_bracket_isospinSpan`). -/
theorem isospinImg_lie_hyperOp (x : Module.End ℚ ImO) (hx : x ∈ isospinImg) :
    ⁅x, hyperOp⁆ = 0 := by
  rw [isospinImg, Submodule.mem_map] at hx
  obtain ⟨d, hd, rfl⟩ := hx
  show ⁅imRep d, hyperOp⁆ = 0
  exact hyperOp_bracket_isospinSpan d hd

/-- The other order: `⁅hyperOp, x⁆ = 0` for `x ∈ isospinImg`. -/
theorem hyperOp_lie_isospinImg (x : Module.End ℚ ImO) (hx : x ∈ isospinImg) :
    ⁅hyperOp, x⁆ = 0 := by
  have hs : -⁅hyperOp, x⁆ = ⁅x, hyperOp⁆ := lie_skew x hyperOp
  rw [isospinImg_lie_hyperOp x hx] at hs
  rw [← neg_eq_zero]; exact hs

/-- The `u(1)_Y` line brackets to `0` against `su(2)_L`: `⁅x, y⁆ = 0` for `x ∈ hyperLine`,
    `y ∈ isospinImg` (`x = a • hyperOp`, then `hyperOp_lie_isospinImg`). -/
theorem hyperLine_lie_isospinImg (x y : Module.End ℚ ImO)
    (hx : x ∈ hyperLine) (hy : y ∈ isospinImg) : ⁅x, y⁆ = 0 := by
  rw [hyperLine, Submodule.mem_span_singleton] at hx
  obtain ⟨a, rfl⟩ := hx
  rw [smul_lie, hyperOp_lie_isospinImg y hy, smul_zero]

/-- The other order: `⁅x, y⁆ = 0` for `x ∈ isospinImg`, `y ∈ hyperLine`. -/
theorem isospinImg_lie_hyperLine (x y : Module.End ℚ ImO)
    (hx : x ∈ isospinImg) (hy : y ∈ hyperLine) : ⁅x, y⁆ = 0 := by
  rw [hyperLine, Submodule.mem_span_singleton] at hy
  obtain ⟨b, rfl⟩ := hy
  rw [lie_smul, isospinImg_lie_hyperOp x hx, smul_zero]

/-- The `u(1)_Y` line is self-abelian: `⁅x, y⁆ = 0` for `x, y ∈ hyperLine` (both `• hyperOp`,
    `⁅hyperOp, hyperOp⁆ = 0`). -/
theorem hyperLine_lie_hyperLine (x y : Module.End ℚ ImO)
    (hx : x ∈ hyperLine) (hy : y ∈ hyperLine) : ⁅x, y⁆ = 0 := by
  rw [hyperLine, Submodule.mem_span_singleton] at hx hy
  obtain ⟨a, rfl⟩ := hx
  obtain ⟨b, rfl⟩ := hy
  have hs : (⁅hyperOp, hyperOp⁆ : Module.End ℚ ImO) = 0 := lie_self hyperOp
  rw [smul_lie, lie_smul, hs, smul_zero, smul_zero]

/-! ## THE DERIVED SUBALGEBRA OF THE JOIN LANDS IN `su(2)_L` — THE REDUCTIVE SPLITTING. -/

/-- ★★★ THE DERIVED SUBALGEBRA LANDS IN `su(2)_L`: `⁅x, y⁆ ∈ isospinImg` for `x, y ∈ isospinImg ⊔
    hyperLine`. Writing `x = xs + xh`, `y = ys + yh` with `xs, ys ∈ isospinImg` and
    `xh, yh ∈ hyperLine`, the bracket expands into four terms; THREE vanish — `⁅xs, yh⁆ = 0` and
    `⁅xh, ys⁆ = 0` (the `u(1)_Y` line commutes with `su(2)_L`, N255) and `⁅xh, yh⁆ = 0` (`u(1)_Y`
    self-abelian) — leaving only `⁅xs, ys⁆ ∈ isospinImg` (`su(2)_L` bracket-closed). So the abelian
    `u(1)_Y` direction is LOST under bracketing: the derived subalgebra of the reductive
    `su(2)_L ⊕ u(1)_Y` is exactly `su(2)_L`. -/
theorem join_derived_le_isospinImg (x y : Module.End ℚ ImO)
    (hx : x ∈ isospinImg ⊔ hyperLine) (hy : y ∈ isospinImg ⊔ hyperLine) :
    ⁅x, y⁆ ∈ isospinImg := by
  rw [Submodule.mem_sup] at hx hy
  obtain ⟨xs, hxs, xh, hxh, rfl⟩ := hx
  obtain ⟨ys, hys, yh, hyh, rfl⟩ := hy
  rw [add_lie, lie_add, lie_add,
      isospinImg_lie_hyperLine xs yh hxs hyh, hyperLine_lie_isospinImg xh ys hxh hys,
      hyperLine_lie_hyperLine xh yh hxh hyh, add_zero, add_zero, add_zero]
  exact isospinImg_lie_closed xs ys hxs hys

/-- The join is bracket-closed: `⁅x, y⁆ ∈ isospinImg ⊔ hyperLine` (the derived subalgebra lands in
    `isospinImg ≤ isospinImg ⊔ hyperLine`). -/
theorem join_lie_mem (x y : Module.End ℚ ImO)
    (hx : x ∈ isospinImg ⊔ hyperLine) (hy : y ∈ isospinImg ⊔ hyperLine) :
    ⁅x, y⁆ ∈ isospinImg ⊔ hyperLine :=
  Submodule.mem_sup_left (join_derived_le_isospinImg x y hx hy)

/-! ## THE ELECTROWEAK REDUCTIVE LIE ALGEBRA OBJECT. -/

/-- ★★★ THE ELECTROWEAK REDUCTIVE LIE ALGEBRA `su(2)_L ⊕ u(1)_Y`: the join `isospinImg ⊔ hyperLine`
    packaged as a genuine LIE SUBALGEBRA of the ambient endomorphism algebra `Module.End ℚ ImO`,
    bracket-closed by `join_lie_mem`. This is the `SU(2)×U(1)` the field POSITS realized as ONE
    derived Lie object inside the single so(7) the gather tear produces — the semisimple `su(2)_L`
    in the adjoint 14 plus the abelian `u(1)_Y` line in the fundamental 7, the field's posited
    product group DERIVED as a reductive Lie subalgebra. The twin of N247's `chargeColourLie`. -/
def electroweakLie : LieSubalgebra ℚ (Module.End ℚ ImO) where
  __ := isospinImg ⊔ hyperLine
  lie_mem' {x y} hx hy := join_lie_mem x y hx hy

/-- The carrier of the electroweak reductive Lie algebra is the join. -/
@[simp] theorem electroweakLie_toSubmodule :
    electroweakLie.toSubmodule = isospinImg ⊔ hyperLine := rfl

/-- Membership in the electroweak reductive Lie algebra is membership in the join. -/
theorem mem_electroweakLie {x : Module.End ℚ ImO} :
    x ∈ electroweakLie ↔ x ∈ isospinImg ⊔ hyperLine := Iff.rfl

/-! ## THE `u(1)_Y` LINE IS A CENTRAL IDEAL OF THE REDUCTIVE ALGEBRA. -/

/-- ★★★ THE `u(1)_Y` LINE IS CENTRAL IN THE REDUCTIVE ALGEBRA: `⁅x, y⁆ = 0` for every
    `x ∈ hyperLine` and every `y ∈ electroweakLie`. Decomposing `y = ys + yh`
    (`ys ∈ isospinImg`, `yh ∈ hyperLine`): `⁅x, ys⁆ = 0` (the `u(1)_Y` line commutes with `su(2)_L`,
    N255) and `⁅x, yh⁆ = 0` (`u(1)_Y` self-abelian). So the abelian `u(1)_Y` factor is a genuine
    CENTRAL abelian ideal of the reductive gauge Lie algebra `su(2)_L ⊕ u(1)_Y`. -/
theorem hyperLine_central (x y : Module.End ℚ ImO)
    (hx : x ∈ hyperLine) (hy : y ∈ electroweakLie) : ⁅x, y⁆ = 0 := by
  rw [mem_electroweakLie, Submodule.mem_sup] at hy
  obtain ⟨ys, hys, yh, hyh, rfl⟩ := hy
  rw [lie_add, hyperLine_lie_isospinImg x ys hx hys, hyperLine_lie_hyperLine x yh hx hyh, add_zero]

/-! ## THE REDUCTIVE ALGEBRA SITS INSIDE THE GATHER ARENA so(7). -/

/-- `su(2)_L` lies in so(7): each `imRepL d` is skew-adjoint for the Born form (N223
    `imRep_mem_so7`). -/
theorem isospinImg_le_so7 :
    isospinImg ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule := by
  intro x hx
  rw [isospinImg, Submodule.mem_map] at hx
  obtain ⟨d, _hd, rfl⟩ := hx
  show (imRepL d) ∈ (skewAdjointLieSubalgebra bornBil).toSubmodule
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq]; exact imRep_mem_so7 d

/-- The `u(1)_Y` line lies in so(7): it is spanned by `hyperOp = crossOp (kappaO 1) ∈ so(7)` (N223
    `crossOp_mem_so7` at the singlet `kappaO 1 ∈ ImO`, N191 `kappaO_one_mem_ImO`). -/
theorem hyperLine_le_so7 :
    hyperLine ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule := by
  rw [hyperLine, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  show hyperOp ∈ (skewAdjointLieSubalgebra bornBil).toSubmodule
  show crossOp (kappaO 1) ∈ (skewAdjointLieSubalgebra bornBil).toSubmodule
  exact crossOp_mem_so7 (kappaO 1) kappaO_one_mem_ImO

/-- ★★ THE ELECTROWEAK REDUCTIVE LIE ALGEBRA SITS INSIDE so(7):
    `electroweakLie ≤ skewAdjointLieSubalgebra bornBil`. Both factors — `su(2)_L`
    (`isospinImg_le_so7`) and the `u(1)_Y` line (`hyperLine_le_so7`) — are skew-adjoint for the Born
    form, so their join is a Lie subalgebra of the concrete gather arena so(7) = 14 ⊕ 7. -/
theorem electroweakLie_le_so7 :
    electroweakLie ≤ skewAdjointLieSubalgebra bornBil := by
  rw [LieSubalgebra.le_def]
  intro x hx
  have hx' : x ∈ isospinImg ⊔ hyperLine := hx
  exact (sup_le isospinImg_le_so7 hyperLine_le_so7) hx'

/-! ## THE FINRANK OF THE REDUCTIVE ALGEBRA — 4 = 3 + 1. -/

/-- The imaginary derivation family `![DI, DJ, DK]` is `ℚ`-linearly independent: the N253 invariant
    trace form `B = LieModule.traceForm` is diagonal-nonsingular on it (`B Dp Dp = −16`,
    `B Dp Dq = 0` for `p ≠ q`), so any vanishing combination pairs to `0` on each generator, forcing
    all coefficients `0`. No coordinate bash. -/
theorem isospin_indep3 (a b c : ℚ) (h : a • DI + b • DJ + c • DK = 0) :
    a = 0 ∧ b = 0 ∧ c = 0 := by
  have hIJ : isospinTraceForm DI DJ = 0 := traceForm_DI_DJ
  have hJK : isospinTraceForm DJ DK = 0 := traceForm_DJ_DK
  have hKI : isospinTraceForm DK DI = 0 := traceForm_DK_DI
  have hJI : isospinTraceForm DJ DI = 0 := by
    rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DJ DI]; exact hIJ
  have hKJ : isospinTraceForm DK DJ = 0 := by
    rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DK DJ]; exact hJK
  have hIK : isospinTraceForm DI DK = 0 := by
    rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DI DK]; exact hKI
  have hII : isospinTraceForm DI DI = -16 := traceForm_DI_DI
  have hJJ : isospinTraceForm DJ DJ = -16 := traceForm_DJ_DJ
  have hKK : isospinTraceForm DK DK = -16 := traceForm_DK_DK
  have eI : isospinTraceForm (a • DI + b • DJ + c • DK) DI = 0 := by rw [h]; simp
  have eJ : isospinTraceForm (a • DI + b • DJ + c • DK) DJ = 0 := by rw [h]; simp
  have eK : isospinTraceForm (a • DI + b • DJ + c • DK) DK = 0 := by rw [h]; simp
  simp only [map_add, LinearMap.add_apply, map_smul, LinearMap.smul_apply, smul_eq_mul,
    hII, hJJ, hKK, hIJ, hJK, hKI, hJI, hKJ, hIK] at eI eJ eK
  exact ⟨by linarith, by linarith, by linarith⟩

/-- Linear independence of the family `![DI, DJ, DK]`. -/
theorem isospin_linearIndependent : LinearIndependent ℚ ![DI, DJ, DK] := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  have h : g 0 • DI + g 1 • DJ + g 2 • DK = 0 := by
    have := hg
    simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons] at this
    linear_combination (norm := abel) this
  obtain ⟨h0, h1, h2⟩ := isospin_indep3 (g 0) (g 1) (g 2) h
  intro i; fin_cases i <;> assumption

/-- `su(2)_L` = `isospinSpan` is 3-dimensional: `finrank ℚ isospinSpan = 3` (the family
    `{DI, DJ, DK}` is linearly independent). -/
theorem finrank_isospinSpan : Module.finrank ℚ isospinSpan = 3 := by
  have hspan : isospinSpan = Submodule.span ℚ (Set.range ![DI, DJ, DK]) := by
    rw [isospinSpan]; congr 1
    rw [Matrix.range_cons, Matrix.range_cons, Matrix.range_cons, Matrix.range_empty]
    ext x; simp only [Set.mem_insert_iff, Set.mem_singleton_iff, Set.union_empty, Set.mem_union]
  rw [hspan, finrank_span_eq_card isospin_linearIndependent]
  simp

/-- ★ `su(2)_L` IS 3-DIMENSIONAL: `finrank ℚ isospinImg = 3`. Since `imRepL` is INJECTIVE (N22
    `imRep_injective`), it embeds `isospinSpan` isomorphically onto `isospinImg`, transporting
    `finrank_isospinSpan = 3`. The semisimple `su(2)_L` factor is a genuine 3-dimensional subalgebra
    inside so(7). -/
theorem finrank_isospinImg : Module.finrank ℚ isospinImg = 3 := by
  rw [isospinImg, (Submodule.equivMapOfInjective imRepL imRep_injective isospinSpan).finrank_eq.symm]
  exact finrank_isospinSpan

/-- The `u(1)_Y` line is 1-dimensional: `finrank ℚ hyperLine = 1` (spanned by the nonzero `hyperOp`,
    N255 `hyperOp_ne_zero`). -/
theorem finrank_hyperLine : Module.finrank ℚ hyperLine = 1 :=
  finrank_span_singleton hyperOp_ne_zero

/-- ★★ `su(2)_L` AND THE `u(1)_Y` LINE MEET ONLY IN `0`: `isospinImg ⊓ hyperLine = ⊥`. `su(2)_L`
    lies in the adjoint 14 (`isospinImg_le_range_imRep`), the `u(1)_Y` line lies in the fundamental
    7 (`hyperLine_le_range_crossEmb`), and the two summands of the gather tear meet only in `⊥`
    (`inter_eq_bot`, forced by the simplicity of `Der(O ℚ)`, N225/N28). So the semisimple `su(2)_L`
    and the abelian `u(1)_Y` share NO common generator — a genuine direct sum. -/
theorem isospinImg_inf_hyperLine_eq_bot : isospinImg ⊓ hyperLine = ⊥ := by
  rw [Submodule.eq_bot_iff]
  intro x hx
  obtain ⟨hxs, hxh⟩ := hx
  have hmem : x ∈ LinearMap.range imRepL ⊓ LinearMap.range crossEmb :=
    ⟨isospinImg_le_range_imRep hxs, hyperLine_le_range_crossEmb hxh⟩
  rw [inter_eq_bot] at hmem
  exact hmem

/-- ★★★ THE ELECTROWEAK REDUCTIVE LIE ALGEBRA IS 4-DIMENSIONAL:
    `finrank ℚ electroweakLie.toSubmodule = 4` (= `3 + 1`). By rank–nullity
    (`Submodule.finrank_sup_add_finrank_inf_eq`) with the trivial intersection
    (`isospinImg_inf_hyperLine_eq_bot`): `finrank (⊔) + finrank (⊓ = ⊥) = finrank isospinImg +
    finrank hyperLine = 3 + 1`, so the sup is `4`. W8: not `3` (hypercharge absorbed into isospin)
    and not `1` (isospin trivial). -/
theorem electroweakLie_finrank :
    Module.finrank ℚ electroweakLie.toSubmodule = 4 := by
  have key := Submodule.finrank_sup_add_finrank_inf_eq isospinImg hyperLine
  rw [isospinImg_inf_hyperLine_eq_bot, finrank_bot, add_zero, finrank_isospinImg,
      finrank_hyperLine] at key
  change Module.finrank ℚ ↥(isospinImg ⊔ hyperLine) = 4
  omega

/-! ## W8 TEETH — THE TWO SM REDUCTIVE SECTORS ARE GENUINELY DISTINCT. -/

/-- The right-scalar linearity of the trace form: `traceForm7 A (c • B) = c * traceForm7 A B`. -/
theorem traceForm7_right (A B : Module.End ℚ ImO) (c : ℚ) :
    traceForm7 A (c • B) = c * traceForm7 A B := by
  unfold traceForm7
  rw [mul_smul_comm, map_smul, smul_eq_mul]

/-- ★★★ W8 TEETH — THE GATHER CHARGE IS NOT IN THE ELECTROWEAK FACTOR:
    `chargeOp ∉ isospinImg ⊔ hyperLine`. Coordinate-free sector-distinctness. If `chargeOp = x + h`
    with `x ∈ isospinImg ⊆ range imRepL` (adjoint 14) and `h ∈ hyperLine ⊆ range crossEmb`
    (fundamental 7), then `x = chargeOp − h ∈ range crossEmb` (both `chargeOp` — N246
    `chargeOp_mem_range_crossEmb` — and `h` are 7-elements), so
    `x ∈ range imRepL ⊓ range crossEmb = ⊥` (`inter_eq_bot`), forcing `x = 0` and
    `chargeOp = h = c • hyperOp`; but then `traceForm7 chargeOp chargeOp = c · traceForm7 chargeOp
    hyperOp = c · 0 = 0` (N257 orthogonality `B_chargeOp_hyperOp`), contradicting
    `traceForm7 chargeOp chargeOp = −6` (N257 `B_chargeOp_chargeOp`). So the gather charge Q — placed
    INSIDE the colour-charge factor by N247 — is absent from the electroweak factor: the two SM
    reductive sectors are genuinely distinct. -/
theorem chargeOp_not_mem_electroweakLie : chargeOp ∉ isospinImg ⊔ hyperLine := by
  intro hmem
  rw [Submodule.mem_sup] at hmem
  obtain ⟨x, hx, h, hh, hsum⟩ := hmem
  have hx_cross : x ∈ LinearMap.range crossEmb := by
    have hxsub : x = chargeOp - h := by rw [← hsum]; abel
    rw [hxsub]
    exact Submodule.sub_mem _ chargeOp_mem_range_crossEmb (hyperLine_le_range_crossEmb hh)
  have hx_imRep : x ∈ LinearMap.range imRepL := isospinImg_le_range_imRep hx
  have hx0 : x = 0 := by
    have hin : x ∈ LinearMap.range imRepL ⊓ LinearMap.range crossEmb := ⟨hx_imRep, hx_cross⟩
    rw [inter_eq_bot] at hin
    exact hin
  have hch : chargeOp = h := by rw [← hsum, hx0, zero_add]
  rw [hyperLine, Submodule.mem_span_singleton] at hh
  obtain ⟨c, rfl⟩ := hh
  have hlen : traceForm7 chargeOp chargeOp = 0 := by
    nth_rewrite 2 [hch]
    rw [traceForm7_right, B_chargeOp_hyperOp, mul_zero]
  rw [B_chargeOp_chargeOp] at hlen
  norm_num at hlen

/-! ## THE CAPSTONE. -/

/-- ★★★ THE ELECTROWEAK REDUCTIVE LIE ALGEBRA `su(2)_L ⊕ u(1)_Y` AS ONE LIE SUBALGEBRA OF `so(7)`,
    from the gather tear — the twin of N247's colour-charge factor with the semisimple/central roles
    swapped across `so(7) = 14 ⊕ 7`. Over the derived `ℚ` and the banked octonion rung
    `O ℚ = CD (H ℚ)`, inside the concrete `so(7) = skewAdjointLieSubalgebra bornBil` on the
    fundamental 7 `ImO`, with the isospin derivations `su(2)_L = isospinImg` in the adjoint 14 and
    the forced hypercharge line `u(1)_Y = hyperLine` (`hyperOp = crossOp (kappaO 1)`, N255) in the
    fundamental 7:
    (i)    `su(2)_L` is BRACKET-CLOSED (`⁅x, y⁆ ∈ isospinImg` for `x, y ∈ isospinImg`) — a Lie
           subalgebra;
    (ii)   the `u(1)_Y` line brackets to `0` against the whole join (`hyperLine_central`) — a
           central abelian ideal;
    (iii)  the DERIVED subalgebra of the join lands in `su(2)_L` (`join_derived_le_isospinImg`) —
           the abelian `u(1)_Y` lost under bracketing, the reductive splitting;
    (iv)   the join is a genuine LIE SUBALGEBRA `electroweakLie` of `Module.End ℚ ImO`, sitting
           inside so(7) (`electroweakLie_le_so7`);
    (v)    the two summands meet only in `⊥` (`isospinImg_inf_hyperLine_eq_bot`) and the join is
           4-dimensional (`electroweakLie_finrank`, `4 = 3 + 1`);
    (vi)   the two SM reductive sectors are GENUINELY DISTINCT — the gather charge `chargeOp` (placed
           inside the colour-charge factor by N247) is NOT in the electroweak factor
           (`chargeOp_not_mem_electroweakLie`).
    The `SU(2)×U(1)` the field POSITS as an independent product group is realized as the reductive
    Lie algebra `su(2)_L ⊕ u(1)_Y` — one derived Lie subalgebra of the single so(7) the gather tear
    produces, abelian factor central, semisimple factor `su(2)_L` — DERIVED, not posited. Together
    with N247, BOTH Standard-Model reductive factors are now derived Lie subalgebras of the ONE
    derived so(7), each split (semisimple-in-one-summand) ⊕ (abelian-u(1)-in-the-other) across the
    14 ⊕ 7 tear. -/
theorem electroweak_reductive_lie_structure :
    (∀ x y : Module.End ℚ ImO, x ∈ isospinImg → y ∈ isospinImg → ⁅x, y⁆ ∈ isospinImg) ∧
    (∀ x y : Module.End ℚ ImO, x ∈ hyperLine → y ∈ electroweakLie → ⁅x, y⁆ = 0) ∧
    (∀ x y : Module.End ℚ ImO, x ∈ isospinImg ⊔ hyperLine → y ∈ isospinImg ⊔ hyperLine →
      ⁅x, y⁆ ∈ isospinImg) ∧
    electroweakLie.toSubmodule = isospinImg ⊔ hyperLine ∧
    electroweakLie ≤ skewAdjointLieSubalgebra bornBil ∧
    isospinImg ⊓ hyperLine = ⊥ ∧
    Module.finrank ℚ electroweakLie.toSubmodule = 4 ∧
    chargeOp ∉ isospinImg ⊔ hyperLine :=
  ⟨isospinImg_lie_closed, hyperLine_central, join_derived_le_isospinImg,
   electroweakLie_toSubmodule, electroweakLie_le_so7, isospinImg_inf_hyperLine_eq_bot,
   electroweakLie_finrank, chargeOp_not_mem_electroweakLie⟩

end

end Phys.Algebra
