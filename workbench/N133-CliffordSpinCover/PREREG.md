# N133 PREREG — THE CLIFFORD/PIN COVER OF THE CLOSED SO⁺(1,9)

FROZEN before finalize. KILL budget = any single obligation > 90s compile → INSTRUMENT failure
(W9): measure/decompose, do NOT inflate maxHeartbeats. (None hit: all probes 8–37s.)

## THE FRONT (measured, forward joint (i))
N132 closed the continuum Lorentz group SO⁺(1,9) = `bvIsomLinMonoid` = `Submonoid.closure
houseHolderMSet` (the reflection-word group), with Cartan–Dieudonné PROVED (every linear
QvC-isometry IS a finite Householder word). The FORCED next structure (W4.5: do not re-pin the
Lorentz sector; advance) is the **Clifford/Pin cover at the generator level**: Cartan–Dieudonné is
exactly the input the Pin/Spin double cover consumes — every Lorentz transformation is a product of
reflections, and each reflection lifts to conjugation by a Clifford unit `ι(a)`.

## GO / NO-GO (frozen)
- GO if: the derived Minkowski quadratic form `QvCQuad := BvCBilin.toQuadraticMap` instantiates
  `CliffordAlgebra QvCQuad` over the derived field `Cut` as MACHINERY on a DERIVED object (the
  Clifford functor applied to the chain's own form — allowed exactly like `Matrix`/`Module`), AND
  the banked indefinite Householder reflection `houseHolderM a` lifts to Clifford conjugation by the
  unit `ι a`: `ι(houseHolderM a v) = -(QvC a)⁻¹ • (ι a · ι v · ι a)`, foundations-only.
- NO-GO (→ W1 dissolution ticket): if `CliffordAlgebra`/`QuadraticMap` over `Cut` drags an
  unexpected import of Mathlib ℝ/ℂ as CONTENT, or the reflection-lift requires a posited adjoint.

## MEASURED (probe1/2/3, all EXIT 0)
- `CharZero Cut` synthesizes; `BvCBilin : LinearMap.BilinForm Cut STVC` builds from banked
  BvC bilinearity (BvC_add_left/BvC_smul_left); `QvCQuad := BvCBilin.toQuadraticMap` with
  `QvCQuad p = QvC p` via BvC_self; `QvCQuad_polar = 2·BvC`.
- `CliffordAlgebra QvCQuad` instantiates; `cliffSq : ι p · ι p = algebraMap (QvC p)`;
  `cliffAnticomm : ι a ι b + ι b ι a = algebraMap (2·BvC a b)`.
- `cliffSandwich : ι a · ι v · ι a = (2·BvC a v)•ι a − (QvC a)•ι v` (the metric sandwich).
- `cliff_unit_isUnit : IsUnit (ι a)` for `BvC a a ≠ 0` (the Pin generator is a unit, inverse
  `(QvC a)⁻¹ • ι a`).
- ★★ `reflection_clifford_conj` THE HEADLINE: every banked indefinite Householder reflection
  IS Clifford conjugation by the unit `ι a` — the Pin cover at the generator level. 8.3s.
- W8: `cover_timelike_unit_clifford_sq : ι mTimeUnit · ι mTimeUnit = 1` (timelike generator is a
  Clifford involution); `cover_form_timelike_unit : QvCQuad mTimeUnit = 1`.

## STANDARD self-check (frozen)
- UNBROKEN: every object derived — `QvCQuad` from the derived form `BvC` over the derived field
  `Cut`; `CliffordAlgebra`/`QuadraticMap` are Mathlib MACHINERY (the Clifford functor) applied to the
  DERIVED form, NOT a posited number system as content (no `import Mathlib.Data.Real/Complex`).
  The reflection-lift uses ONLY banked `houseHolderM`/`houseHolderM_apply` + the Clifford relation.
  NO posited adjoint, NO posited Pin/Spin group, NO bridge.
- COMPLETE: 8 decls, foundations-only target; #print axioms ⊆ {propext, Classical.choice,
  Quot.sound}; no sorry/axiom/native_decide.
- PHYSICS-WORDS-REMOVABLE: delete Clifford/Pin/Spin/cover/spinor/reflection/Householder/Lorentz/
  Minkowski/timelike/metric → the statement stands: over Cut, STVC, BvC, the Clifford algebra of the
  form `QvCQuad = BvCBilin.toQuadraticMap` has `ι(houseHolderM a v) = -(QvC a)⁻¹•(ι a · ι v · ι a)`,
  pure algebra about the banked `houseHolderM` and the derived form.

## COSTUME C165
A WRONG Pin-cover / Clifford-generator claim: the timelike unit's Clifford generator squares to the
scalar `1` (cover_timelike_unit_clifford_sq); claiming it reads `133` forces `1 = 133`, must NOT
compile. Distinct from C164 `1=132` and the whole banked battery.
