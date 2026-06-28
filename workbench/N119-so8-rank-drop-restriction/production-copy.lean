/-
  Phys.Algebra.LorentzContinuumGenerationSO8RankDropRestriction — N119: THE RANK-DROP
  RESTRICTION LEMMA (the octonion-block isometry strand) — the genuine inductive content that
  makes the global `SO(8)` octonion-block exhaustion TERMINATE.

  ===========================================================================
  CONTEXT. N115 banked the `x`-deflation STEP, N116 the `x`-REASSEMBLY, N117 the OCTONION-BLOCK
  deflation STEP (`octDeflate_step`), N118 the OCTONION-BLOCK REASSEMBLY (`octDeflate_involution`
  / `octDeflate_factorization` / `octDeflate_factorization_stabilizer`). BOTH blocks now carry
  the COMPLETE per-axis pair: an octonion-block `QvC`-isometry MOVING a chosen unit-imaginary
  axis is one explicit bisector reflection composed with an axis-FIXING isometry. What the global
  `SO(8)` octonion-block exhaustion needs ON TOP of the per-axis step is the INDUCTIVE engine: the
  axis-FIXING factor must RESTRICT to a SMALLER-rank isometry on the orthogonal complement of the
  fixed axis — the rank-DROP that makes the induction on the number of moved axes TERMINATE. THIS
  node banks exactly that rank-DROP restriction lemma — ROADMAP §N119 priority (i)'s named
  immediately-bankable structural piece (b)/(c).

  ── THE MEASURE-FIRST FINDING (which strand owns the rank-drop) ──
  N79 (`LorentzContinuumReseed`) banked a rank-DROP (`uPerp` / `deflateRestrict` / `uPerp_finrank`
  / `deflateC_mapsTo_uPerp`) — but on the EvC-self-adjoint SPECTRAL strand (the `deflateC`
  operators of the `specOpN` existence induction), over the FULL `STVC = Cut × Cut × O Cut` with
  the positive-definite reference form `EvC`. The N115–N118 exhaustion runs on a DIFFERENT strand:
  the `gFormC` ISOMETRY/REFLECTION strand (`octDeflate` / `vTwoPlane` / `blockWordLin`), purely
  on the octonion block `O Cut` with the Born self-overlap form `gFormC`. The rank-DROP on the
  isometry strand is therefore NOT the N79 lemma — it must be BUILT (STANDARD §4 / RUNBOOK W1:
  Mathlib-or-chain absence is not a wall — build the structure). THIS node builds it, mirroring
  the N79 template on the `gFormC`-block strand.

  ── WHAT THIS NODE BANKS (the rank-DROP restriction engine) ──
  `gFormCRight e` — the Born form `gFormC e ·` bundled as a `Cut`-linear functional on `O Cut`
    (mirror of N68's `EvCRight`), so its kernel is a submodule and rank–nullity applies.
  `ePerp e := ker (gFormCRight e)` — ★ THE BORN-ORTHOGONAL COMPLEMENT of `e` within the octonion
    block. The invariant subspace the octonion-block exhaustion descends into.
  `mem_ePerp` — `p ∈ ePerp e ↔ gFormC e p = 0`.
  `gFormCRight_surjective` — for a Born-unit `e` (`gFormC e e = 1`), `gFormCRight e` is surjective
    onto `Cut` (witness `c ↦ c • e`).
  ★★ `ePerp_finrank` — THE CODIM-ONE DROP: `finrank Cut (ePerp e) = finrank Cut (O Cut) − 1` for a
    Born-unit `e` (rank–nullity on the surjective functional). Each peel drops the dimension by
    EXACTLY one — the finrank bookkeeping the induction terminates on.
  ★★ `isom_fixes_mapsTo_ePerp` — THE KEY (the genuine inductive content): a `gFormC`-isometry `S`
    on the octonion block (`gFormC (S v) (S v) = gFormC v v`) that FIXES `e` (`S e = e`) maps
    `ePerp e` INTO `ePerp e`. The proof is THREE lines from the banked Born polarization
    (`gFormC_polarize`, N112): `gFormC e (S p) = gFormC (S e) (S p) = gFormC e p = 0`. The
    rank-DROP — the axis-fixing isometry leaves the orthogonal complement invariant.
  `isomRestrict S … hfix` — ★ THE RESTRICTED OPERATOR on the codim-1 invariant subspace `ePerp e`,
    the strictly-smaller sub-problem the octonion-block exhaustion recurses on.
  `isomRestrict_coe` — the restriction coercion `↑(isomRestrict … p) = S ↑p`.
  ★ `isomRestrict_gFormC_isom` — THE CLOSURE: the restriction is STILL a `gFormC`-isometry (the
    diagonal Born preservation descends to the complement on the coercions), so the induction may
    recurse into the same isometry class on the strictly-smaller space.
  `ePerp_finite` — `Module.Finite Cut (ePerp e)` (submodule of the finite `O Cut`, `instFiniteOCut`).
  `self_not_mem_ePerp` / `ePerp_ne_top` — W8 NON-VACUITY: for a Born-unit `e`, `e ∉ ePerp e` and
    `ePerp e ≠ ⊤` — the complement is a PROPER subspace, the finrank genuinely drops.
  W8 teeth (a CONCRETE rank-drop): `vTwoPlane e₂ je2` is a genuine octonion-block `gFormC`-isometry
    (`vTwoPlane_gFormC_diag`) that FIXES the third unit `ke2je2` (`vTwoPlane_e2je2_fixes_ke2je2`,
    the block-level lift of `block1_fixes_ke2je2`), so the rank-DROP applies non-vacuously; the
    peeled axis `ke2je2` sits OUTSIDE its own complement (`ke2je2_gFormC_self = 1 ≠ 0`,
    `rankdrop_witness_self_overlap`).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the Born form `gFormC` and its bilinearity `gFormC_add_right` /
  `gFormC_smul_right` / `gFormC_symm` (N-LieAlgebra); ★ the Born POLARIZATION `gFormC_polarize`
  (N112 — diagonal preservation ⟹ full bilinear preservation, by completing the square over the
  field `Cut`); `Module.Finite Cut (O Cut)` (`instFiniteOCut`, N-SeedVector, descending from the
  cascade rungs `2 → 4 → 8`); the block isometry `vTwoPlane` / `vTwoPlane_gFormC_diag` /
  `vTwoPlane_apply` (N112/KAK); `block1_fixes_ke2je2` and the units `e₂` / `je2` / `ke2je2` with
  their `*_alt` left-square laws and `*_gFormC_self` (N108–N110); the N79 `uPerp` / `deflateRestrict`
  TEMPLATE mirrored; `LinearMap.ker` / `LinearMap.restrict` / `finrank_range_add_finrank_ker` /
  `Module.Finite.of_injective` standard Mathlib MACHINERY on the DERIVED objects (STANDARD §3) —
  over the derived ℝ `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited
  Lorentz group / SO⁺(1,9), NOT a posited reflection/Clifford group, NOT a posited spectral theorem,
  NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full `Spin(8)` /
  `SO(8)` and reads off the Cartan–Dieudonné induction (every orthogonal map is a product of
  reflections, by induction on the orthogonal complement of a fixed vector) as the standard
  structure theorem. Here the rank-DROP is CONSTRUCTED forward from the trunk: the complement is
  the KERNEL of the trunk's own Born functional `gFormCRight e`, its codimension is rank–nullity
  on that functional, the axis-fixing isometry's invariance of the complement DESCENDS from the
  banked Born polarization `gFormC_polarize` (the diagonal-to-bilinear completion of the square),
  and the restriction stays in the same isometry class — NOT a posited orthogonal-group induction.
  The genuine inductive content (the rank-DROP that makes the global exhaustion terminate) is a
  forced, witnessed lemma, not assumed.

  ── THE FORWARD REMAINDER (childed N120) ──
  The GLOBAL octonion-block exhaustion (assembling the per-axis deflation+factorization (N117/N118)
  + this rank-DROP restriction into the full induction: every octonion-block `QvC`-isometry a
  finite bisector-reflection product, by induction on the number of moved unit-imaginary basis
  axes, terminating because each peel drops the complement's finrank by one) + the literal operator
  TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` so the N96 affine path is
  continuous — Mathlib has NO operator topology over the derived `Cut`) remain the HEAVY
  group-manifold core. THIS node banks the rank-DROP restriction lemma — the immediately-bankable
  structural piece of ROADMAP §N119 priority (i)(b)/(c).

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / reflection / isometry / compact / orthogonal / SO(8) / Spin /
  Clifford / Cartan / Dieudonné / rank / drop / restriction / complement / codimension / deflation
  / peel / stabilizer / generation / spectral / octonion-block": what remains is pure linear
  algebra over the derived complete ordered field `Cut` — for the bundled functional
  `gFormCRight e := p ↦ gFormC e p` on `O Cut`, `ePerp e := ker (gFormCRight e)` has
  `finrank = finrank (O Cut) − 1` when `gFormC e e = 1`; a `Cut`-linear `S : O Cut →ₗ O Cut` with
  `gFormC (S v) (S v) = gFormC v v` and `S e = e` maps `ePerp e` into itself, and its restriction
  preserves `gFormC` diagonally. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionInvolution

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The Born form bundled as a `Cut`-linear functional, and the Born-orthogonal complement. -/

/-- THE BORN FUNCTIONAL `gFormC e ·` bundled as a `Cut`-linear map on `O Cut` (the octonion-block
    mirror of N68's `EvCRight`). The Born bilinearity (`gFormC_add_right` / `gFormC_smul_right`)
    makes it a `LinearMap`, so its kernel is a submodule and rank–nullity applies. -/
def gFormCRight (e : O Cut) : O Cut →ₗ[Cut] Cut where
  toFun := fun p => gFormC e p
  map_add' := gFormC_add_right e
  map_smul' := fun c p => by simpa using gFormC_smul_right c e p

/-- ★ THE BORN-ORTHOGONAL COMPLEMENT of `e` within the octonion block: the kernel of the bundled
    Born functional `gFormCRight e`. The invariant subspace the octonion-block exhaustion induction
    descends into (the octonion-block mirror of N79's `uPerp`). -/
def ePerp (e : O Cut) : Submodule Cut (O Cut) := LinearMap.ker (gFormCRight e)

/-- Membership in the Born-orthogonal complement: `p ∈ ePerp e ↔ gFormC e p = 0`. -/
theorem mem_ePerp (e p : O Cut) : p ∈ ePerp e ↔ gFormC e p = 0 := by
  unfold ePerp
  rw [LinearMap.mem_ker]
  rfl

/-- For a Born-unit `e` (`gFormC e e = 1`) the bundled functional `gFormCRight e` is SURJECTIVE
    onto `Cut`: every `c : Cut` is hit by `c • e` (`gFormC e (c • e) = c · gFormC e e = c`). -/
theorem gFormCRight_surjective {e : O Cut} (he : gFormC e e = 1) :
    Function.Surjective (gFormCRight e) := by
  intro c
  refine ⟨c • e, ?_⟩
  show gFormC e (c • e) = c
  rw [gFormC_smul_right, he, mul_one]

/-- ★★ THE CODIM-ONE DROP: for a Born-unit `e`, the Born-orthogonal complement has
    `finrank Cut (ePerp e) = finrank Cut (O Cut) − 1`. Rank–nullity on the surjective functional
    `gFormCRight e` (range `= ⊤`, `finrank = 1`): `finrank range + finrank ker = finrank (O Cut)`,
    so the kernel `ePerp e` has codimension exactly one. The `finrank` bookkeeping the octonion-block
    exhaustion induction terminates on — each axis peel drops the dimension by exactly one. -/
theorem ePerp_finrank {e : O Cut} (he : gFormC e e = 1) :
    Module.finrank Cut (ePerp e) = Module.finrank Cut (O Cut) - 1 := by
  have hrn := (gFormCRight e).finrank_range_add_finrank_ker
  have hr : Module.finrank Cut (LinearMap.range (gFormCRight e)) = 1 := by
    have h : LinearMap.range (gFormCRight e) = ⊤ :=
      LinearMap.range_eq_top.mpr (gFormCRight_surjective he)
    rw [h, finrank_top]; simp
  unfold ePerp
  omega

/-! ## THE KEY — the axis-fixing isometry restricts to the orthogonal complement (the rank-DROP). -/

/-- ★★ THE KEY (the genuine inductive content beyond the per-axis step): a `gFormC`-isometry `S` on
    the octonion block (preserving the diagonal Born form, `gFormC (S v) (S v) = gFormC v v`) that
    FIXES `e` (`S e = e`) maps the Born-orthogonal complement `ePerp e` INTO `ePerp e`. The
    invariance descends from the banked Born POLARIZATION (`gFormC_polarize`, N112: diagonal
    preservation ⟹ full bilinear preservation): for `p ∈ ePerp e`,
    `gFormC e (S p) = gFormC (S e) (S p) = gFormC e p = 0`. The rank-DROP — the axis-fixing isometry
    leaves the strictly-smaller complement invariant, so the octonion-block exhaustion recurses
    there. The octonion-block isometry-strand mirror of N79's `deflateC_mapsTo_uPerp`. -/
theorem isom_fixes_mapsTo_ePerp (S : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (S v) (S v) = gFormC v v)
    {e : O Cut} (hfix : S e = e) :
    ∀ p ∈ ePerp e, S p ∈ ePerp e := by
  intro p hp
  rw [mem_ePerp] at hp ⊢
  have hpol := gFormC_polarize S hdiag e p
  rw [hfix] at hpol
  rw [hpol, hp]

/-- ★ THE RESTRICTED OPERATOR on the codim-1 invariant subspace `ePerp e`: the axis-fixing
    `gFormC`-isometry `S` restricted to `ePerp e`, the strictly-smaller sub-problem the
    octonion-block exhaustion induction recurses on (the mirror of N79's `deflateRestrict`). -/
def isomRestrict (S : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (S v) (S v) = gFormC v v)
    {e : O Cut} (hfix : S e = e) :
    Module.End Cut (ePerp e) :=
  S.restrict (isom_fixes_mapsTo_ePerp S hdiag hfix)

/-- The restriction coercion: `↑(isomRestrict … p) = S ↑p`. -/
theorem isomRestrict_coe (S : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (S v) (S v) = gFormC v v)
    {e : O Cut} (hfix : S e = e) (p : ePerp e) :
    ((isomRestrict S hdiag hfix) p : O Cut) = S (p : O Cut) := rfl

/-- ★ THE CLOSURE — the restricted operator is STILL a `gFormC`-isometry on `ePerp e` (diagonally):
    the ambient diagonal Born preservation `hdiag` descends to the complement on the coercions. The
    inductive step stays inside the `gFormC`-isometry class on a strictly smaller space, so the
    octonion-block exhaustion induction may recurse into the same problem one rank lower. -/
theorem isomRestrict_gFormC_isom (S : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (S v) (S v) = gFormC v v)
    {e : O Cut} (hfix : S e = e) (p : ePerp e) :
    gFormC ((isomRestrict S hdiag hfix p : O Cut)) ((isomRestrict S hdiag hfix p : O Cut))
      = gFormC ((p : O Cut)) ((p : O Cut)) := by
  rw [isomRestrict_coe]
  exact hdiag (p : O Cut)

/-- `Module.Finite Cut (ePerp e)` — the Born-orthogonal complement is finite-dimensional, as a
    submodule of the finite-dimensional `O Cut` (`instFiniteOCut`, N-SeedVector, descending from the
    cascade rungs `2 → 4 → 8`). The finiteness the rank-DROP induction requires. -/
instance ePerp_finite (e : O Cut) : Module.Finite Cut (ePerp e) :=
  Module.Finite.of_injective (ePerp e).subtype Subtype.coe_injective

/-! ## Non-vacuity — the complement is a proper subspace, the peeled axis sits outside it. -/

/-- ★ NON-VACUITY (W8): `e ∉ ePerp e` for a Born-unit `e`, since `gFormC e e = 1 ≠ 0`. The peeled
    axis is genuinely OUTSIDE its own complement. -/
theorem self_not_mem_ePerp {e : O Cut} (he : gFormC e e = 1) : e ∉ ePerp e := by
  rw [mem_ePerp, he]
  exact one_ne_zero

/-- ★ NON-VACUITY (W8): the Born-orthogonal complement `ePerp e` is a PROPER subspace (`≠ ⊤`) for a
    Born-unit `e` — the peeled axis is missing — so the codimension-one `finrank` drop is genuine
    and the octonion-block exhaustion reaches a strictly smaller space. -/
theorem ePerp_ne_top {e : O Cut} (he : gFormC e e = 1) : ePerp e ≠ ⊤ := by
  intro htop
  exact self_not_mem_ePerp he (htop ▸ Submodule.mem_top)

/-! ## W8 teeth — a CONCRETE rank-drop: the block isometry `vTwoPlane e₂ je2` fixes `ke2je2`. -/

/-- THE BLOCK-LEVEL FIX: the octonion-block `v`-rotation `vTwoPlane e₂ je2` FIXES the third unit
    `ke2je2` (the block-level lift of `block1_fixes_ke2je2`: the deep `.2.2` slot of the bridged
    composite IS the `vTwoPlane` action). `ke2je2` is the common anticommuting complement of the
    `span{e₂, ιe₂}` 2-plane, fixed by both half-turns. -/
theorem vTwoPlane_e2je2_fixes_ke2je2 :
    vTwoPlane (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) = (ke2je2 : O Cut) := by
  have h2 : (biMulFun (je2 : O Cut) (je2 : O Cut)
      (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) ((0 : Cut), (0 : Cut), (ke2je2 : O Cut)))).2.2
      = (ke2je2 : O Cut) := by rw [block1_fixes_ke2je2]
  rw [vTwoPlane_apply]
  simpa [biMulFun, biMulV_apply] using h2

/-- ★ W8 — THE CONCRETE RANK-DROP IS NON-VACUOUS. `vTwoPlane e₂ je2` is a genuine octonion-block
    `gFormC`-isometry (`vTwoPlane_gFormC_diag`, the Born-units `e₂`, `je2`) that FIXES the
    unit-imaginary axis `ke2je2` (`vTwoPlane_e2je2_fixes_ke2je2`); so `isom_fixes_mapsTo_ePerp`
    applies, and the operator restricts to the codim-1 Born-orthogonal complement `ePerp ke2je2`.
    The rank-DROP is realized on a concrete higher-rank isometry, not a vacuous one. -/
theorem rankdrop_witness_mapsTo :
    ∀ p ∈ ePerp (ke2je2 : O Cut),
      vTwoPlane (CD.e2 : O Cut) (je2 : O Cut) p ∈ ePerp (ke2je2 : O Cut) :=
  isom_fixes_mapsTo_ePerp (vTwoPlane (CD.e2 : O Cut) (je2 : O Cut))
    (vTwoPlane_gFormC_diag (CD.e2 : O Cut) (je2 : O Cut) e2_gFormC_self je2_gFormC_self)
    vTwoPlane_e2je2_fixes_ke2je2

/-- ★ W8 TEETH — the distinguishing read-off: the peeled axis `ke2je2` has Born self-overlap `1`,
    so it sits OUTSIDE its own Born-orthogonal complement (`self_not_mem_ePerp`), the codim-1 drop
    genuine. The value `gFormC ke2je2 ke2je2 = 1` (`ke2je2_gFormC_self`) — NOT `113`. -/
theorem rankdrop_witness_self_overlap :
    gFormC (ke2je2 : O Cut) (ke2je2 : O Cut) = 1 :=
  ke2je2_gFormC_self

end

end Phys.Algebra
