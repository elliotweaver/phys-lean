/-
  Phys.Algebra.LorentzContinuumGenerationSO8FinrankTower — N122: THE DERIVED-`Cut` FINRANK TOWER
  (the dimension count of the terminal algebra and the spacetime vector space over the
  fold-derived ℝ `ContinuumQ.Cut`, NOT over Mathlib ℚ/ℝ).

  ===========================================================================
  CONTEXT. N117/N118 banked the octonion-block deflation STEP + REASSEMBLY; N119 banked the
  rank-DROP RESTRICTION engine (`ePerp` / `ePerp_finrank` the codim-one drop /
  `isom_fixes_mapsTo_ePerp` / `isomRestrict` / `isomRestrict_gFormC_isom`); N120 banked the
  connective tissue + the BOUNDED two-axis exhaustion; N121 banked THE SUBSPACE-PRESERVATION CORE
  (`octReflBlock_mapsTo_ePerp` / `octReflBlockRestrict` / `octReflBlockRestrict_gFormC_isom`) — the
  per-step bisector reflection IS now an operator on the codim-1 Born-orthogonal complement
  `ePerp e₀`, its restriction still a `gFormC`-isometry there, each peel dropping the finrank by
  EXACTLY one (`ePerp_finrank` N119: `finrank Cut (ePerp e) = finrank Cut (O Cut) − 1`).

  ── THE MEASURE-FIRST FINDING (ROADMAP §N122 priority (ii)'s explicit measure) ──
  ROADMAP §N122 lists three scaffolds the FULL global octonion-block exhaustion needs on top of
  N121's subspace-preservation core, and asks to MEASURE which is lighter:
    (i)  the finrank-strong-recursion assembly (HEAVY — its base case needs a spanning/basis
         argument, and the moved-axis-inside-the-complement existence is the resistant piece N121
         flagged; the `gFormC`-ISOMETRY strand has no clean analogue of N85's
         `submodule_selfadj_has_eigenvalue`);
    (ii) the `Cut`-basis of `O Cut` — "MEASURE whether a `Cut`-basis of `O Cut` OR the `ℚ→Cut`
         finrank transport is the lighter scaffold";
    (iii) the operator TOPOLOGY over `Cut` (the W1 HEAVY core Mathlib lacks).
  MEASURED: the `ℚ→Cut` FINRANK TRANSPORT is the LIGHT, CERTAIN scaffold — AND it is the
  load-bearing PREREQUISITE the heavier options each need. The recursion's base case and depth
  bound, and the basis enumeration, are ALL stated in `finrank Cut` terms; but the derived-`Cut`
  finrank VALUES are genuinely UNBANKED: `DerivationFinrank.finrank_O_eq_eight` is over ℚ
  (`finrank ℚ (O ℚ) = 8`), and `SpacetimeSignature.finrank_STV = 10` is over ℚ
  (STV = ℚ × ℚ × O ℚ, NOT STVC = Cut × Cut × O Cut). N76 already banked the derived-`Cut` product
  equivalences `dblProdEquivCut` / `hProdEquivCut` / `oProdEquivCut : O Cut ≃ₗ[Cut] H Cut × H Cut`
  (the `Module.Finite Cut` chain `instFiniteDblCut`/`instFiniteHCut`/`instFiniteOCut` is built on
  them), so the ℚ proof transports VERBATIM with these `Cut`-equivalences — the SAME structural
  `2 → 4 → 8` doubling proof, now over the DERIVED field. This OPENS structure the chain lacks
  (W4.5: NOT lateral re-pinning — no derived-`Cut` dimension is anywhere banked).

  ── WHAT THIS NODE BANKS (the derived-`Cut` dimension count) ──
  `finrank_dbl_eq_two_Cut` — `finrank Cut (Dbl Cut) = 2`  (rung 1, via `dblProdEquivCut`).
  `finrank_H_eq_four_Cut`  — `finrank Cut (H Cut) = 4`     (rung 2, via `hProdEquivCut`).
  ★★ `finrank_O_eq_eight_Cut` — `finrank Cut (O Cut) = 8`  (rung 3, THE NAMED GAP, via `oProdEquivCut`):
    the TERMINAL ALGEBRA is an 8-dimensional vector space over the fold-derived ℝ `Cut` — derived
    STRUCTURALLY through the cascade's own doubling equivalences (`2 → 4 → 8`), NO coordinate basis
    matrix, NO Mathlib ℝ/ℂ as content.
  ★ `finrank_STVC` — `finrank Cut STVC = 10` (= `1 + 1 + 8`): the spacetime vector space
    `STVC = Cut × Cut × O Cut` is 10-dimensional over the derived field — the (1,9) split's total
    dimension, `Module.finrank_prod` through the time line, the space-scalar line, and the 8 Born
    octonion-block directions.
  ★★ `ePerp_finrank_value` — `finrank Cut (ePerp e) = 7` for a Born-unit `e` (`gFormC e e = 1`):
    THE CONCRETE DEPTH BOUND of the global octonion-block exhaustion. N119's `ePerp_finrank`
    (`= finrank (O Cut) − 1`) EVALUATED at the now-banked `finrank Cut (O Cut) = 8`. Each peel of
    the Cartan–Dieudonné descent lands the moved-axis Born-orthogonal complement on `8 − 1 = 7`,
    so the finrank-strong-recursion terminates in at most 7 reflections — the explicit numeric
    depth the abstract `Submodule.finrank` well-founded recursion descends along.
  `finrank_End_O_Cut` — `finrank Cut (Module.End Cut (O Cut)) = 64`: the operator-space dimension
    the octonion-block `SO(8)` generators live inside (`finrank_linearMap`, `8² = 64`).
  W8 teeth (a CONCRETE depth bound): `ePerp_finrank_witness` — `finrank Cut (ePerp ke2je2) = 7`,
    the moved-axis complement of the concrete Born-unit `ke2je2` (`ke2je2_gFormC_self = 1`), the
    7-dimensional invariant the witnessed subspace reflection (N121) recurses into.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the terminal algebra `O Cut := CD (H Cut) = CD (CD (CD Cut))`, the
  doubling cascade evaluated over the DERIVED continuum `Cut`; the cascade's own structural product
  equivalences `dblProdEquivCut` / `hProdEquivCut` / `oProdEquivCut` (N76, componentwise `re`/`im`
  splits) and the `Module.Finite Cut` chain they ground (`instFiniteDblCut` / `instFiniteHCut` /
  `instFiniteOCut`); the Born-orthogonal complement `ePerp` and its codim-one drop `ePerp_finrank`
  (N119, rank–nullity on the Born functional `gFormCRight`); the Born self-overlap `gFormC` and the
  concrete Born-unit `ke2je2_gFormC_self` (N108–N120). `Module.finrank_prod` / `Module.finrank_self`
  / `Module.finrank_linearMap` / `LinearEquiv.finrank_eq` standard Mathlib MACHINERY on the DERIVED
  objects (STANDARD §3), over the derived ℝ `ContinuumQ.Cut`. NOT a posited dimension, NOT
  `finrank_O_eq_eight` over ℚ relabeled (the ℚ→Cut transport is the SAME structural proof over the
  derived field), NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the octonions as
  ℝ⁸ — an 8-dimensional REAL vector space TAKEN AS GIVEN, the real field assumed. Here the field is
  the fold-DERIVED `Cut` and the dimension `8` is COUNTED through the cascade's own doublings
  `2 → 4 → 8`, the `(1,9)` spacetime dimension `10 = 1 + 1 + 8` assembled from the time line, the
  space-scalar line, and the 8 Born directions over that derived field — every rung a forced,
  witnessed transport, not an assumed coordinate count.

  ── THE FORWARD REMAINDER (childed N123) ──
  The FULL global octonion-block exhaustion (the abstract `Submodule.finrank` strong-recursion /
  `Nat.strong_induction` assembling N117/N118's per-axis deflation + N119's rank-DROP restriction +
  N121's subspace-preservation core into: every octonion-block `QvC`-isometry a finite
  bisector-reflection product, by induction on the moved-axis complement finrank, terminating at
  `finrank 0/1`, the depth bounded by THIS node's `ePerp_finrank_value = 7`) — its base case the
  fixes-all-imaginary-axes-⟹-identity lemma (needing a spanning argument over the now-banked
  `finrank Cut (O Cut) = 8`) — + the literal operator TOPOLOGY over `Cut`
  (`TopologicalSpace (Module.End Cut STVC)`, which Mathlib lacks over the derived `Cut`) remain the
  HEAVY group-manifold core. THIS node banks the derived-`Cut` dimension count — the LIGHT scaffold
  ROADMAP §N122 priority (ii) names, the prerequisite both heavier options need.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / spacetime / rotation / reflection / isometry / SO(8) / Spin / octonion-block /
  exhaustion / generation / signature / depth / recursion / complement / codimension": what remains
  is pure linear algebra over the derived complete ordered field `Cut` — `finrank Cut (Dbl Cut) = 2`,
  `finrank Cut (H Cut) = 4`, `finrank Cut (O Cut) = 8`, `finrank Cut (Cut × Cut × O Cut) = 10`,
  `finrank Cut (ker (gFormC e ·)) = 7` when `gFormC e e = 1`, and
  `finrank Cut (Module.End Cut (O Cut)) = 64`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited dimension.
-/
import Phys.Algebra.LorentzContinuumGenerationSO8SubspaceReflection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The rung dimensions over the derived `Cut` (the cascade's doublings `2 → 4 → 8`). -/

/-- The rung-1 dimension over the DERIVED ℝ `Cut`: `finrank Cut (Dbl Cut) = 2`. The cascade's first
    doubling `Dbl Cut ≃ₗ[Cut] Cut × Cut` (N76 `dblProdEquivCut`), `Module.finrank_prod` +
    `Module.finrank_self`. The ℚ analogue is `DerivationFinrank.finrank_dbl_eq_two`; this is the
    SAME structural proof over the derived field. -/
theorem finrank_dbl_eq_two_Cut : Module.finrank Cut (Dbl Cut) = 2 := by
  rw [dblProdEquivCut.finrank_eq, Module.finrank_prod, Module.finrank_self]

/-- The rung-2 dimension over the DERIVED ℝ `Cut`: `finrank Cut (H Cut) = 4`. The cascade's second
    doubling `H Cut ≃ₗ[Cut] Dbl Cut × Dbl Cut` (N76 `hProdEquivCut`), `Module.finrank_prod` +
    `finrank_dbl_eq_two_Cut`. The ℚ analogue is `DerivationFinrank.finrank_H_eq_four`. -/
theorem finrank_H_eq_four_Cut : Module.finrank Cut (H Cut) = 4 := by
  rw [hProdEquivCut.finrank_eq, Module.finrank_prod, finrank_dbl_eq_two_Cut]

/-- ★★ THE TERMINAL DIMENSION OVER THE DERIVED ℝ `Cut`: `finrank Cut (O Cut) = 8`. The named gap of
    ROADMAP §N122 priority (ii). The octonion shape is an 8-dimensional `Cut`-vector space — derived
    STRUCTURALLY through the cascade's third doubling `O Cut ≃ₗ[Cut] H Cut × H Cut` (N76
    `oProdEquivCut`), `Module.finrank_prod` + `finrank_H_eq_four_Cut`, with NO coordinate basis
    matrix. `DerivationFinrank.finrank_O_eq_eight` banks this only over ℚ; THIS is the derived-field
    analogue, the load-bearing prerequisite the global octonion-block exhaustion's base case and
    depth bound both consume. -/
theorem finrank_O_eq_eight_Cut : Module.finrank Cut (O Cut) = 8 := by
  rw [oProdEquivCut.finrank_eq, Module.finrank_prod, finrank_H_eq_four_Cut]

/-! ## The spacetime vector-space dimension over the derived `Cut` (the `(1,9)` total). -/

/-- ★ THE SPACETIME DIMENSION OVER THE DERIVED ℝ `Cut`: `finrank Cut STVC = 10`
    (`STVC := Cut × Cut × O Cut`). The total dimension of the `(1,9)` split `= 1 + 1 + 8`: the time
    line, the space-scalar line, and the 8 Born octonion-block directions, assembled by
    `Module.finrank_prod` through the now-banked `finrank_O_eq_eight_Cut`. The ℚ analogue
    `SpacetimeSignature.finrank_STV = 10` is over `STV = ℚ × ℚ × O ℚ`; THIS is the derived-field
    spacetime dimension the isometry group acts on. -/
theorem finrank_STVC : Module.finrank Cut (STVC) = 10 := by
  show Module.finrank Cut (Cut × Cut × O Cut) = 10
  rw [Module.finrank_prod, Module.finrank_prod, Module.finrank_self, finrank_O_eq_eight_Cut]

/-! ## The concrete depth bound — the moved-axis Born-orthogonal complement is 7-dimensional. -/

/-- ★★ THE CONCRETE DEPTH BOUND of the global octonion-block exhaustion: for a Born-unit `e`
    (`gFormC e e = 1`), the Born-orthogonal complement `ePerp e` has `finrank Cut (ePerp e) = 7`.
    N119's codim-one drop `ePerp_finrank` (`= finrank (O Cut) − 1`) EVALUATED at the now-banked
    `finrank_O_eq_eight_Cut`. Each peel of the Cartan–Dieudonné finrank-strong-recursion lands the
    moved-axis complement on `8 − 1 = 7`, so the descent (N121's `octReflBlockRestrict` recursing
    on the codim-1 complement, still a `gFormC`-isometry) terminates in AT MOST 7 reflections — the
    explicit numeric depth the abstract `Submodule.finrank` well-founded recursion descends along.
    The prerequisite the global exhaustion assembly (childed N123) needs to bound its depth. -/
theorem ePerp_finrank_value {e : O Cut} (he : gFormC e e = 1) :
    Module.finrank Cut (ePerp e) = 7 := by
  rw [ePerp_finrank he, finrank_O_eq_eight_Cut]

/-- THE OPERATOR-SPACE DIMENSION over the derived ℝ `Cut`: `finrank Cut (Module.End Cut (O Cut)) = 64`
    (`= 8²`). The ambient the octonion-block `SO(8)` generators (the bisector reflections
    `octReflBlock`, the half-turns `biMulV`) live inside, `Module.finrank_linearMap` through the
    now-banked `finrank_O_eq_eight_Cut`. The derived-field analogue of
    `DerivationFinrank.finrank_End_eq_64`. -/
theorem finrank_End_O_Cut : Module.finrank Cut (Module.End Cut (O Cut)) = 64 := by
  rw [Module.finrank_linearMap, finrank_O_eq_eight_Cut]

/-! ## W8 teeth — a CONCRETE moved-axis complement: `ePerp ke2je2` is 7-dimensional. -/

/-- ★ W8 — THE CONCRETE DEPTH BOUND IS NON-VACUOUS: `finrank Cut (ePerp ke2je2) = 7`. The concrete
    Born-unit `ke2je2 := e₂·je2` (`ke2je2_gFormC_self = 1`, N120) is a genuine moved unit-imaginary
    axis (the witnessed subspace reflection `octReflBlock e₂ je2` FIXES it, N121
    `octReflBlock_witness`), and its Born-orthogonal complement `ePerp ke2je2` — the 7-dimensional
    invariant subspace the witnessed reflection maps into itself (`octReflBlock_mapsTo_witness`,
    N121) — has finrank exactly `7`, NOT `119`. The descent into the complement is realized on a
    concrete higher-rank axis, the depth bound non-vacuous. -/
theorem ePerp_finrank_witness : Module.finrank Cut (ePerp (ke2je2 : O Cut)) = 7 :=
  ePerp_finrank_value ke2je2_gFormC_self

end

end Phys.Algebra
