/-
  Phys.Algebra.LorentzContinuumGenerationSO8BoundedExhaustion — N120: THE ORTHOGONAL-AXIS-
  PRESERVING REFLECTION + THE BOUNDED TWO-AXIS EXHAUSTION (the descent-stays-in-complement
  connective tissue of the global `SO(8)` octonion-block exhaustion).

  ===========================================================================
  CONTEXT. N115/N116 banked the `x`-block deflation STEP + REASSEMBLY; N117/N118 banked the
  OCTONION-BLOCK deflation STEP (`octDeflate_step`) + REASSEMBLY (`octDeflate_involution` /
  `octDeflate_factorization`); N119 banked the rank-DROP RESTRICTION engine (`ePerp` /
  `ePerp_finrank` the codim-one drop / `isom_fixes_mapsTo_ePerp` the KEY / `isomRestrict` +
  `isomRestrict_gFormC_isom` the closure). Every per-axis ingredient is in hand. What the GLOBAL
  exhaustion induction needs to TERMINATE is the connective fact that the Cartan–Dieudonné descent
  STAYS INSIDE the orthogonal complement of the already-peeled axes — i.e. that a later bisector
  reflection FIXES an earlier-fixed axis whenever that axis is Born-orthogonal to the later
  bisector. THIS node banks exactly that connective tissue and the bounded two-axis exhaustion it
  immediately yields — ROADMAP §N120 priority (i)'s named immediately-bankable structural piece
  (the BOUNDED two-axis or three-axis exhaustion).

  ── THE MEASURE-FIRST FINDING (why the bounded exhaustion is the bankable piece) ──
  The full abstract global assembly has two heavy obstructions that resist a one-run bank:
    (a) the abstract `ePerp` finrank-recursion tower would need the per-step bisector reflection to
        be re-expressed as an operator ON the `ePerp` subspace (a reflection of two vectors lying
        inside a subspace `W` need not preserve `W`) — a genuine subspace-preservation core; AND
    (b) the finite imaginary-basis enumeration would need a `Cut`-basis of `O Cut` (`finrank_O_eq_eight`
        is banked only over `ℚ`, NOT over the derived `Cut`, and no `Cut`-basis is banked) plus a
        "fixes all imaginary axes ⟹ identity" lemma — itself a heavy node.
  Both are honestly childed (N121). The DERIVED connective lemma below — the reflection fixes any
  axis orthogonal to its bisector — is the EXACT reason the induction terminates inside the
  complement (it is what makes (a) work once the subspace machinery is in place), and it banks the
  bounded TWO-axis exhaustion clean in one run.

  ── WHAT THIS NODE BANKS ──
  ★★ `octDeflate_fixes_orthogonal_axis` — THE CONNECTIVE LEMMA (the descent-stays-in-complement
    content): the bisector reflection `octDeflate e w` FIXES `(0,0,e₀)` for ANY axis `e₀`
    Born-orthogonal to the bisector `e − w` (`gFormC e₀ (e − w) = 0`). The reflection identity
    `octRefl_reflect_imag` (N117) at the unit bisector `n := r⁻¹·(e−w)` (`octBisector_unit`,
    `gFormC n n = 1`): `n·(e₀·n) = (gFormC n n)•e₀ − (2·gFormC e₀ n)•n = 1•e₀ − 0 = e₀`, the
    `n`-line term vanishing because `e₀ ⊥ n`. This is the structural reason Cartan–Dieudonné's
    induction recurses INTO the orthogonal complement — a later reflection preserves an earlier
    fixed axis.
  ★★ `octDeflate_two_axis_step` — THE BOUNDED TWO-AXIS DEFLATION STEP: for an octonion-block
    `QvC`-isometry `T` moving a chosen axis `e → w`, whose first deflation `octDeflate e w · T`
    moves a SECOND axis `e' → w'`, with `e` Born-orthogonal to the SECOND bisector `e' − w'`, the
    two-reflection composite `octDeflate e' w' · (octDeflate e w · T)` FIXES BOTH `(0,0,e)` and
    `(0,0,e')`. The second reflection preserves the first fixed axis (`octDeflate_fixes_orthogonal_axis`).
  ★ `octDeflate_two_axis_factorization` — THE TWO-REFLECTION FACTORIZATION: any `T` factors as
    `octDeflate e w · (octDeflate e' w' · (octDeflate e' w' · (octDeflate e w · T)))` (two banked
    involutions composed), the inner doubly-deflated operator fixing both axes. The bounded analogue
    of the global Cartan–Dieudonné product, DERIVED.
  W8 teeth (a CONCRETE orthogonal-axis fix): `ke2je2` is Born-orthogonal to BOTH `e₂` and `je2`
    (`ke2je2_e2_gFormC_zero` / `ke2je2_je2_gFormC_zero`), hence to the bisector `e₂ − je2`
    (`ke2je2_bisector_ortho`, `= 0`), so `octDeflate e₂ je2` FIXES `(0,0,ke2je2)` (`twoaxis_witness`),
    the deep coordinate reading `ke2je2` back (`twoaxis_witness_coord`). The orthogonality value
    `gFormC ke2je2 (e₂ − je2) = 0` (`twoaxis_witness_self_overlap`) — NOT `115`.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the reflection identity `octRefl_reflect_imag` (N117 — from the octonion
  Clifford relation `octRefl_polarize_imag` + ONE alternative law `mul_mul_left` N5b, the ONLY
  contact with non-associativity); the normalized-bisector imaginarity `octBisector_imag` and
  unit-ness `octBisector_unit` (N117/N118); the deflation STEP `octDeflate_step` (N117); the
  reflection INVOLUTION `octDeflate_involution` + FACTORIZATION `octDeflate_factorization` (N118);
  the Born bilinearity `gFormC_add_right` / `gFormC_smul_right` (N-LieAlgebra); the concrete units
  `e₂` / `je2` / `ke2je2 := e₂·je2` with `*_imag` and their coordinate Born-orthogonality
  (N108–N110); `biMulLin_tx_apply` (N-EndBridge/KAK); `octDeflate_witness_ne` (N117) — the
  `Module.End` / `Field Cut` MACHINERY on the DERIVED objects (STANDARD §3), over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group /
  SO⁺(1,9), NOT a posited reflection/Clifford group, NOT a posited orthogonal-group induction, NOT
  a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full `Spin(8)` /
  `SO(8)` and reads off Cartan–Dieudonné (every orthogonal map a product of reflections, by
  induction on the orthogonal complement of a fixed vector — the descent staying in the complement
  TAKEN AS GIVEN). Here the descent-stays-in-complement is CONSTRUCTED forward from the trunk: the
  later reflection fixes the earlier axis BECAUSE the reflection identity's `m`-line term vanishes
  under Born-orthogonality, which is the trunk's own Born form. The bounded two-axis exhaustion is
  the explicit two-reflection product, each reflection a genuine involution from the banked
  half-turn-squared-is-the-full-turn (N118), the non-associativity obstruction NAVIGATED through
  the single alternative law the octonions KEEP. NOT a posited reflection-group structure theorem.

  ── THE FORWARD REMAINDER (childed N121) ──
  The FULL global octonion-block exhaustion (the abstract `ePerp` finrank-strong-recursion assembly
  with the per-step reflection re-expressed AS an operator on the codim-1 complement — the genuine
  subspace-preservation core — OR the finite imaginary-`Cut`-basis enumeration with a banked
  `Cut`-basis of `O Cut` + a fixes-all-axes-⟹-identity lemma) + the literal operator TOPOLOGY over
  `Cut` (`TopologicalSpace (Module.End Cut STVC)`, which Mathlib lacks over the derived `Cut`)
  remain the HEAVY group-manifold core. THIS node banks the connective tissue (the
  descent-stays-in-complement reflection lemma) + the bounded two-axis exhaustion — the
  immediately-bankable structural piece of ROADMAP §N120 priority (i).

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / reflection / half-turn / involution / isometry / compact / orthogonal
  / SO(8) / Spin / Clifford / Cartan / Dieudonné / bisector / axis / deflation / factorization /
  exhaustion / complement / generation / octonion-block": what remains is pure linear algebra over
  the derived complete ordered field `Cut` — for unit-imaginary `e, w` with `e − w ≠ 0`, the
  operator `octDeflate e w` of `Module.End Cut (Cut × Cut × O Cut)` sends `(0,0,e₀)` to itself
  whenever `gFormC e₀ (e − w) = 0`; consequently a two-fold composite of such operators with a
  `Cut`-linear `T` fixes two coordinate vectors, and `T` factors through the two operators (each an
  involution). No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationSO8RankDropRestriction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## THE CONNECTIVE LEMMA — the bisector reflection fixes any axis orthogonal to its bisector. -/

/-- ★★ THE CONNECTIVE LEMMA (the descent-stays-in-complement content of the global exhaustion): the
    bisector reflection `octDeflate e w` FIXES `(0,0,e₀)` for ANY imaginary axis `e₀` Born-orthogonal
    to the bisector `e − w` (`gFormC e₀ (e − w) = 0`). The reflection identity
    `octRefl_reflect_imag` (N117) at the normalized unit bisector `n := r⁻¹·(e − w)`
    (`octBisector_unit`, `gFormC n n = 1`): `n·(e₀·n) = (gFormC n n)•e₀ − (2·gFormC e₀ n)•n =
    1•e₀ − 0•n = e₀`, the `n`-line term vanishing because `e₀ ⊥ n` (the orthogonality passes through
    the central scalar `r⁻¹` by `gFormC_smul_right`). This is the structural reason Cartan–Dieudonné's
    induction recurses INTO the orthogonal complement — a later reflection PRESERVES an earlier fixed
    axis. The connective tissue the global octonion-block exhaustion assembly needs to terminate. -/
theorem octDeflate_fixes_orthogonal_axis {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    octDeflate e w ((0:Cut), (0:Cut), e₀) = ((0:Cut), (0:Cut), e₀) := by
  have hg : gFormC e₀ ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) = 0 := by
    rw [gFormC_smul_right, hortho, mul_zero]
  unfold octDeflate
  rw [biMulLin_tx_apply, octRefl_reflect_imag (octBisector_imag he hw) he₀,
      octBisector_unit hne, hg, mul_zero, zero_smul, sub_zero, one_smul]

/-! ## THE BOUNDED TWO-AXIS EXHAUSTION — two reflections fix two axes, and `T` factors through them. -/

/-- ★★ THE BOUNDED TWO-AXIS DEFLATION STEP. For an octonion-block `QvC`-isometry `T` moving a chosen
    unit-imaginary axis `e → w` (`T(0,0,e) = (0,0,w)`), whose first deflation `octDeflate e w · T`
    moves a SECOND unit-imaginary axis `e' → w'`, with `e` Born-ORTHOGONAL to the second bisector
    `e' − w'` (`gFormC e (e' − w') = 0`), the two-reflection composite
    `octDeflate e' w' · (octDeflate e w · T)` FIXES BOTH `(0,0,e)` and `(0,0,e')`. The first axis is
    fixed because the first deflation fixes it (`octDeflate_step`) and the second reflection PRESERVES
    it (`octDeflate_fixes_orthogonal_axis`, since `e ⊥ e' − w'`); the second axis is fixed because the
    second deflation peels it (`octDeflate_step` on `octDeflate e w · T`). The bounded base of the
    Cartan–Dieudonné induction (depth 2), DERIVED. -/
theorem octDeflate_two_axis_step {T : Module.End Cut STVC}
    {e w e' w' : O Cut}
    (he : star e = -e) (hw : star w = -w) (he' : star e' = -e') (hw' : star w' = -w')
    (hee : gFormC e e = 1) (hww : gFormC w w = 1) (hee' : gFormC e' e' = 1) (hww' : gFormC w' w' = 1)
    (hTe : T ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), w))
    (hne : e - w ≠ 0) (hne' : e' - w' ≠ 0)
    (heortho : gFormC e (e' - w') = 0)
    (hRTe' : (octDeflate e w * T) ((0:Cut), (0:Cut), e') = ((0:Cut), (0:Cut), w')) :
    (octDeflate e' w' * (octDeflate e w * T)) ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), e) ∧
    (octDeflate e' w' * (octDeflate e w * T)) ((0:Cut), (0:Cut), e') = ((0:Cut), (0:Cut), e') := by
  refine ⟨?_, ?_⟩
  · -- first axis e: the first deflation fixes it, the second reflection preserves it (e ⊥ e'−w')
    rw [Module.End.mul_apply, octDeflate_step he hw hee hww hTe hne,
        octDeflate_fixes_orthogonal_axis he' hw' he heortho hne']
  · -- second axis e': the second deflation peels it (octDeflate_step on octDeflate e w · T)
    exact octDeflate_step he' hw' hee' hww' hRTe' hne'

/-- ★ THE TWO-REFLECTION FACTORIZATION — the bounded analogue of the Cartan–Dieudonné product. ANY
    operator `T` factors through the two bisector reflections (each a banked involution
    `octDeflate_involution`, N118):
    `T = octDeflate e w · (octDeflate e' w' · (octDeflate e' w' · (octDeflate e w · T)))`. From the
    octonion-block factorization (`octDeflate_factorization`) applied at `(e,w)` to `T`, then at
    `(e',w')` to the once-deflated `octDeflate e w · T`. Paired with `octDeflate_two_axis_step`, the
    inner doubly-deflated operator `octDeflate e' w' · (octDeflate e w · T)` FIXES both axes — every
    two-axis-moving octonion-block isometry is a product of two explicit bisector reflections and a
    two-axis-fixing isometry. -/
theorem octDeflate_two_axis_factorization (T : Module.End Cut STVC)
    {e w e' w' : O Cut}
    (he : star e = -e) (hw : star w = -w) (he' : star e' = -e') (hw' : star w' = -w')
    (hne : e - w ≠ 0) (hne' : e' - w' ≠ 0) :
    T = octDeflate e w * (octDeflate e' w' * (octDeflate e' w' * (octDeflate e w * T))) := by
  have h1 : T = octDeflate e w * (octDeflate e w * T) :=
    octDeflate_factorization T he hw hne
  have h2 : octDeflate e w * T
      = octDeflate e' w' * (octDeflate e' w' * (octDeflate e w * T)) :=
    octDeflate_factorization (octDeflate e w * T) he' hw' hne'
  rw [← h2]; exact h1

/-! ## W8 teeth — a CONCRETE orthogonal-axis fix: `octDeflate e₂ je2` fixes `(0,0,ke2je2)`. -/

/-- `ke2je2 := e₂·je2` is Born-ORTHOGONAL to `e₂`: `gFormC ke2je2 e₂ = 0` (a direct coordinate
    computation — the deep real part of `ke2je2·star e₂ = −ke2je2·e₂` is zero). -/
theorem ke2je2_e2_gFormC_zero : gFormC (ke2je2 : O Cut) (CD.e2 : O Cut) = 0 := by
  show reQC ((ke2je2 : O Cut) * star (CD.e2 : O Cut)) = 0
  rw [e2_imag, mul_neg (ke2je2 : O Cut) (CD.e2 : O Cut), reQC_neg]
  show -((ke2je2 : O Cut) * (CD.e2 : O Cut)).re.re.re = 0
  simp [CD.e2, CD.iota, ke2je2]

/-- `ke2je2 := e₂·je2` is Born-ORTHOGONAL to `je2`: `gFormC ke2je2 je2 = 0` (a direct coordinate
    computation — the deep real part of `ke2je2·star je2 = −ke2je2·je2` is zero). -/
theorem ke2je2_je2_gFormC_zero : gFormC (ke2je2 : O Cut) (je2 : O Cut) = 0 := by
  show reQC ((ke2je2 : O Cut) * star (je2 : O Cut)) = 0
  rw [je2_imag, mul_neg (ke2je2 : O Cut) (je2 : O Cut), reQC_neg]
  show -((ke2je2 : O Cut) * (je2 : O Cut)).re.re.re = 0
  simp [CD.e2, CD.iota, ke2je2]

/-- ★ W8 — the peeled axis `ke2je2` is Born-orthogonal to the bisector `e₂ − je2`:
    `gFormC ke2je2 (e₂ − je2) = 0` (Born bilinearity on the two coordinate orthogonalities
    `ke2je2_e2_gFormC_zero` / `ke2je2_je2_gFormC_zero`). The reason `octDeflate e₂ je2` FIXES it. -/
theorem twoaxis_witness_self_overlap :
    gFormC (ke2je2 : O Cut) ((CD.e2 : O Cut) - (je2 : O Cut)) = 0 := by
  rw [sub_eq_add_neg, gFormC_add_right,
      show (-(je2 : O Cut)) = ((-1 : Cut) • (je2 : O Cut)) by simp,
      gFormC_smul_right, ke2je2_e2_gFormC_zero, ke2je2_je2_gFormC_zero]
  ring

/-- ★ W8 — THE CONCRETE ORTHOGONAL-AXIS FIX IS NON-VACUOUS. The bisector reflection
    `octDeflate e₂ je2` (the genuine axis-moving pair `e₂ ≠ je2`, `octDeflate_witness_ne`) FIXES the
    axis `(0,0,ke2je2)` because `ke2je2` is Born-orthogonal to the bisector `e₂ − je2`
    (`twoaxis_witness_self_overlap`, via `octDeflate_fixes_orthogonal_axis`). The
    descent-stays-in-complement realized on a concrete reflection. -/
theorem twoaxis_witness :
    octDeflate (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut), (0:Cut), (ke2je2 : O Cut))
      = ((0:Cut), (0:Cut), (ke2je2 : O Cut)) :=
  octDeflate_fixes_orthogonal_axis e2_imag je2_imag ke2je2_imag
    twoaxis_witness_self_overlap octDeflate_witness_ne

/-- ★ W8 TEETH — the deep octonion coordinate of the fixed image reads `ke2je2` back. The
    distinguishing read-off: the axis `ke2je2`, orthogonal to the bisector `e₂ − je2`, is left
    untouched by the reflection `octDeflate e₂ je2`. -/
theorem twoaxis_witness_coord :
    (octDeflate (CD.e2 : O Cut) (je2 : O Cut)
      ((0:Cut), (0:Cut), (ke2je2 : O Cut))).2.2 = (ke2je2 : O Cut) := by
  rw [twoaxis_witness]

end

end Phys.Algebra
