/-
  Phys.Algebra.LorentzContinuumGenerationSO8SubspaceReflection — N121: THE SUBSPACE-PRESERVING
  REFLECTION-ON-`ePerp` (the finrank-recursion crux of the global `SO(8)` octonion-block
  exhaustion).

  ===========================================================================
  CONTEXT. N115/N116 banked the `x`-block deflation STEP + REASSEMBLY; N117/N118 banked the
  OCTONION-BLOCK deflation STEP (`octDeflate_step`) + REASSEMBLY (`octDeflate_involution` /
  `octDeflate_factorization`); N119 banked the rank-DROP RESTRICTION engine (`ePerp` /
  `ePerp_finrank` the codim-one drop / `isom_fixes_mapsTo_ePerp` the KEY / `isomRestrict` +
  `isomRestrict_gFormC_isom` the closure) — for ANY DIAGONAL `gFormC`-isometry
  `S : O Cut →ₗ[Cut] O Cut` fixing an axis; N120 banked the connective tissue
  (`octDeflate_fixes_orthogonal_axis` — the bisector reflection fixes any axis orthogonal to its
  bisector) + the BOUNDED two-axis exhaustion.

  N120's MEASURE-FIRST finding flagged the EXACT obstruction the FULL global finrank-recursion
  needs cleared before the rank-DROP engine can drive a `Submodule.finrank` strong-recursion:
  the abstract `ePerp` finrank-recursion tower would need the per-step bisector reflection to be
  re-expressed AS an operator ON the `ePerp` subspace — and "a reflection of two vectors lying
  inside a subspace `W` need not preserve `W`" — a genuine SUBSPACE-PRESERVATION core. THIS node
  banks exactly that core: the bisector reflection's octonion-block v-block, restricted to the
  Born-orthogonal complement of an axis it FIXES, is a `gFormC`-isometry on that codim-1 subspace.
  ROADMAP §N121 priority (i)(a)'s named immediately-bankable structural piece.

  ── THE KEY OBSERVATION (why this is the crux, and why it is LIGHT) ──
  N119's rank-DROP engine `isom_fixes_mapsTo_ePerp` / `isomRestrict` / `isomRestrict_gFormC_isom`
  is stated for ANY DIAGONAL `gFormC`-isometry `S : O Cut →ₗ[Cut] O Cut` that FIXES an axis `e₀`.
  The bisector reflection `octDeflate e w = biMulLin n n` (N117) acts on the octonion block by the
  `v`-block linear map `biMulV n n` (N-KAK) — and that v-block, here named `octReflBlock e w`, IS
  such a diagonal `gFormC`-isometry (`biMul_gFormC` at the Born-unit bisector `octBisector_unit`)
  AND it FIXES any imaginary axis Born-orthogonal to the bisector (the O-Cut-level mirror of N120's
  `octDeflate_fixes_orthogonal_axis`, via the SAME reflection identity `octRefl_reflect_imag`).
  So the SUBSPACE-PRESERVATION is N119's engine INSTANTIATED at `S := octReflBlock e w` and the
  fixed axis `e₀`: NO new induction, NO operator topology, NO posited orthogonal-group structure —
  the per-step reflection IS an operator on `ePerp e₀`, and its restriction stays in the
  `gFormC`-isometry class on the codim-1 complement, exactly what the Cartan–Dieudonné
  finrank-strong-recursion needs to descend INTO the complement.

  ── WHAT THIS NODE BANKS ──
  `octReflBlock e w := biMulV n n` — the octonion-block v-block of the bisector reflection
    `octDeflate e w` (`n := r⁻¹•(e − w)`, the normalized bisector, `octBisector_unit`).
  `octReflBlock_apply` — `octReflBlock e w v = n·(v·n)`.
  ★ `octReflBlock_gFormC_diag` — the v-block is a DIAGONAL `gFormC`-isometry
    (`gFormC (octReflBlock e w v) (octReflBlock e w v) = gFormC v v`), from the three-factor Born
    composition law `biMul_gFormC` at the Born-unit bisector `octBisector_unit`.
  ★ `octReflBlock_fixes_orthogonal` — the v-block FIXES any imaginary axis `e₀` Born-orthogonal to
    the bisector `e − w` (`gFormC e₀ (e − w) = 0`): the reflection identity `octRefl_reflect_imag`
    at the unit bisector `n` gives `n·(e₀·n) = (gFormC n n)•e₀ − (2·gFormC e₀ n)•n = 1•e₀ − 0 = e₀`,
    the `n`-line term vanishing because `e₀ ⊥ n`. The O-Cut-level mirror of N120's
    `octDeflate_fixes_orthogonal_axis`.
  ★★ `octReflBlock_mapsTo_ePerp` — THE SUBSPACE-PRESERVATION CORE: for an axis `e₀` Born-orthogonal
    to the bisector, the v-block reflection MAPS the Born-orthogonal complement `ePerp e₀` INTO
    `ePerp e₀`. N119's `isom_fixes_mapsTo_ePerp` instantiated at `S := octReflBlock e w` (diagonal
    isometry `octReflBlock_gFormC_diag`, fixing `e₀` by `octReflBlock_fixes_orthogonal`). The exact
    obstruction N120 flagged, RESOLVED: the per-step bisector reflection IS an operator on `ePerp`.
  ★ `octReflBlockRestrict` — THE RESTRICTED OPERATOR on the codim-1 invariant subspace `ePerp e₀`:
    `octReflBlock e w` restricted to `ePerp e₀` (N119's `isomRestrict`), the strictly-smaller
    sub-problem the octonion-block exhaustion recurses on.
  `octReflBlockRestrict_coe` — the restriction coercion `↑(octReflBlockRestrict … p) = octReflBlock e w ↑p`.
  ★★ `octReflBlockRestrict_gFormC_isom` — THE CLOSURE: the restriction is STILL a `gFormC`-isometry
    on `ePerp e₀` (N119's `isomRestrict_gFormC_isom`). The inductive step stays inside the
    `gFormC`-isometry class on a space of finrank exactly one less (`ePerp_finrank`, N119), so the
    Cartan–Dieudonné finrank-strong-recursion may recurse into the same problem one rank lower.
  W8 teeth (a CONCRETE subspace-preserving reflection): `octReflBlock e₂ je2` FIXES `ke2je2`
    (`ke2je2 ⊥ e₂ − je2`, `twoaxis_witness_self_overlap`, `octReflBlock_witness`), so maps
    `ePerp ke2je2` INTO itself non-vacuously (`octReflBlock_mapsTo_witness`); the Born self-overlap
    of the fixed image reads `gFormC … = 1` (`octReflBlock_witness_self_overlap`) — NOT `117`.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the v-block map `biMulV` and its three-factor Born composition law
  `biMul_gFormC` (N-KAK / N-Spin9); the reflection identity `octRefl_reflect_imag` (N117 — from the
  octonion Clifford relation `octRefl_polarize_imag` + ONE alternative law `mul_mul_left` N5b, the
  ONLY contact with non-associativity); the normalized-bisector imaginarity `octBisector_imag` and
  unit-ness `octBisector_unit` (N117/N118); the rank-DROP RESTRICTION engine
  `isom_fixes_mapsTo_ePerp` / `isomRestrict` / `isomRestrict_gFormC_isom` + the complement `ePerp`
  (N119, itself built on the Born POLARIZATION `gFormC_polarize` N112 + rank–nullity); the Born
  bilinearity `gFormC_smul_right` (N-LieAlgebra); the concrete units `e₂` / `je2` /
  `ke2je2 := e₂·je2` with `*_imag`, `*_gFormC_self`, and the bisector orthogonality
  `twoaxis_witness_self_overlap` (N108–N120); `octDeflate_witness_ne` (N117) — the `Module.End` /
  `Submodule` / `Field Cut` MACHINERY on the DERIVED objects (STANDARD §3), over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group /
  SO⁺(1,9), NOT a posited reflection/Clifford group, NOT a posited orthogonal-group induction, NOT
  a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full `Spin(8)` /
  `SO(8)` and reads off Cartan–Dieudonné — every orthogonal map a product of reflections, by
  induction on the orthogonal complement of a fixed vector, the descent recursing into the
  complement and each reflection RESTRICTING to the complement TAKEN AS GIVEN. Here the
  subspace-preservation is CONSTRUCTED forward from the trunk: the per-step bisector reflection IS
  an operator on the kernel of the trunk's own Born functional, BECAUSE the reflection identity's
  `n`-line term vanishes under Born-orthogonality (so the reflection fixes the axis) AND the banked
  Born polarization makes the diagonal isometry preserve the complement bilinearly — the
  restriction staying in the same isometry class. The crux the abstract finrank-recursion needs is
  a forced, witnessed lemma, not assumed.

  ── THE FORWARD REMAINDER (childed N122) ──
  The FULL global octonion-block exhaustion (assembling the per-axis deflation+factorization
  (N117/N118) + the rank-DROP restriction (N119) + THIS subspace-preservation core into the full
  `Submodule.finrank` strong-recursion / `Nat.strong_induction`: every octonion-block `QvC`-isometry
  a finite bisector-reflection product, by induction on `finrank` of the moved-axis complement,
  terminating at `finrank 0/1`) — OR the alternative finite imaginary-`Cut`-basis enumeration (a
  banked 7-element `Cut`-basis of the imaginary `O Cut` block + a fixes-all-7-axes-⟹-identity lemma;
  `finrank_O_eq_eight` is banked only over `ℚ`, the derived-`Cut` basis is NOT banked) — + the
  literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)`, which Mathlib
  lacks over the derived `Cut`) remain the HEAVY group-manifold core. THIS node banks the
  subspace-preservation core — the immediately-bankable structural piece of ROADMAP §N121
  priority (i)(a) — clearing N120's flagged obstruction.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / reflection / half-turn / isometry / compact / orthogonal / SO(8) /
  Spin / Clifford / Cartan / Dieudonné / bisector / axis / deflation / restriction / complement /
  codimension / subspace-preservation / finrank-recursion / exhaustion / generation /
  octonion-block": what remains is pure linear algebra over the derived complete ordered field
  `Cut` — for unit-imaginary `e, w` with `e − w ≠ 0` and the normalized bisector `n := r⁻¹•(e − w)`,
  the `Cut`-linear map `octReflBlock e w := (v ↦ n·(v·n))` on `O Cut` preserves the diagonal Born
  form, fixes any `e₀` with `gFormC e₀ (e − w) = 0`, and therefore maps `ker (gFormC e₀ ·)` into
  itself and restricts there to a diagonal-Born-preserving operator. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationSO8BoundedExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The bisector reflection's octonion-block v-block. -/

/-- THE OCTONION-BLOCK v-BLOCK of the bisector reflection `octDeflate e w = biMulLin n n` (N117):
    `octReflBlock e w := biMulV n n` at the normalized bisector `n := r⁻¹•(e − w)`
    (`r := cutSqrt (gFormC (e − w) (e − w))`, N57). The action of the per-step bisector reflection
    on the octonion block `O Cut` alone — the `Cut`-linear map the global finrank-recursion needs
    to re-express AS an operator on the codim-1 Born-orthogonal complement. -/
def octReflBlock (e w : O Cut) : O Cut →ₗ[Cut] O Cut :=
  biMulV ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
         ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))

/-- The v-block action: `octReflBlock e w v = n·(v·n)` at the normalized bisector `n`. -/
theorem octReflBlock_apply (e w v : O Cut) :
    octReflBlock e w v =
      ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
        (v * ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))) := rfl

/-! ## The v-block is a diagonal `gFormC`-isometry and fixes axes orthogonal to the bisector. -/

/-- ★ THE V-BLOCK IS A DIAGONAL `gFormC`-ISOMETRY: `gFormC (octReflBlock e w v) (octReflBlock e w v)
    = gFormC v v` for `e − w ≠ 0`. From the three-factor Born composition law `biMul_gFormC`
    (`gFormC (n·(v·n)) (n·(v·n)) = gFormC n n · (gFormC v v · gFormC n n)`) at the Born-unit bisector
    `octBisector_unit` (`gFormC n n = 1`). The diagonal-preservation N119's rank-DROP engine
    requires of the restricted operator. -/
theorem octReflBlock_gFormC_diag {e w : O Cut} (hne : e - w ≠ 0) (v : O Cut) :
    gFormC (octReflBlock e w v) (octReflBlock e w v) = gFormC v v := by
  rw [octReflBlock_apply, biMul_gFormC, octBisector_unit hne]
  ring

/-- ★ THE V-BLOCK FIXES any imaginary axis `e₀` Born-orthogonal to the bisector `e − w`
    (`gFormC e₀ (e − w) = 0`): `octReflBlock e w e₀ = e₀`. The reflection identity
    `octRefl_reflect_imag` (N117) at the normalized unit bisector `n := r⁻¹•(e − w)`
    (`octBisector_unit`, `gFormC n n = 1`): `n·(e₀·n) = (gFormC n n)•e₀ − (2·gFormC e₀ n)•n =
    1•e₀ − 0•n = e₀`, the `n`-line term vanishing because `e₀ ⊥ n` (the orthogonality passing
    through the central scalar `r⁻¹` by `gFormC_smul_right`). The O-Cut-level mirror of N120's
    `octDeflate_fixes_orthogonal_axis` — the v-block of the same reflection, restricted to the
    octonion block. -/
theorem octReflBlock_fixes_orthogonal {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    octReflBlock e w e₀ = e₀ := by
  have hg : gFormC e₀ ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) = 0 := by
    rw [gFormC_smul_right, hortho, mul_zero]
  rw [octReflBlock_apply, octRefl_reflect_imag (octBisector_imag he hw) he₀,
      octBisector_unit hne, hg, mul_zero, zero_smul, sub_zero, one_smul]

/-! ## THE SUBSPACE-PRESERVATION CORE — the reflection restricts to the complement of a fixed axis. -/

/-- ★★ THE SUBSPACE-PRESERVATION CORE (the crux N120 flagged): for an axis `e₀` Born-orthogonal to
    the bisector `e − w`, the v-block bisector reflection `octReflBlock e w` MAPS the Born-orthogonal
    complement `ePerp e₀` INTO `ePerp e₀`. N119's `isom_fixes_mapsTo_ePerp` instantiated at
    `S := octReflBlock e w` — a diagonal `gFormC`-isometry (`octReflBlock_gFormC_diag`) that FIXES
    `e₀` (`octReflBlock_fixes_orthogonal`). The exact obstruction N120's MEASURE-FIRST finding named
    ("a reflection of two vectors lying inside a subspace `W` need not preserve `W`"), RESOLVED: the
    per-step bisector reflection IS an operator on `ePerp e₀`, because it fixes `e₀` and a diagonal
    Born-isometry preserves the kernel of the Born functional `gFormC e₀ ·` (via the banked Born
    polarization `gFormC_polarize`, N112). The connective fact the abstract `Submodule.finrank`
    strong-recursion needs to descend INTO the complement. -/
theorem octReflBlock_mapsTo_ePerp {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    ∀ p ∈ ePerp e₀, octReflBlock e w p ∈ ePerp e₀ :=
  isom_fixes_mapsTo_ePerp (octReflBlock e w)
    (fun v => octReflBlock_gFormC_diag hne v)
    (octReflBlock_fixes_orthogonal he hw he₀ hortho hne)

/-- ★ THE RESTRICTED OPERATOR on the codim-1 invariant subspace `ePerp e₀`: the v-block bisector
    reflection `octReflBlock e w` restricted to `ePerp e₀` (N119's `isomRestrict`). The
    strictly-smaller sub-problem the octonion-block exhaustion finrank-recursion recurses on — the
    per-step reflection, now genuinely an operator on the codim-1 complement of an axis it fixes. -/
def octReflBlockRestrict {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    Module.End Cut (ePerp e₀) :=
  isomRestrict (octReflBlock e w)
    (fun v => octReflBlock_gFormC_diag hne v)
    (octReflBlock_fixes_orthogonal he hw he₀ hortho hne)

/-- The restriction coercion: `↑(octReflBlockRestrict … p) = octReflBlock e w ↑p`. -/
theorem octReflBlockRestrict_coe {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) (p : ePerp e₀) :
    ((octReflBlockRestrict he hw he₀ hortho hne p : O Cut)) = octReflBlock e w (p : O Cut) := rfl

/-- ★★ THE CLOSURE — the restriction is STILL a `gFormC`-isometry on `ePerp e₀` (diagonally):
    `gFormC (octReflBlockRestrict … p) (octReflBlockRestrict … p) = gFormC p p` on the coercions.
    N119's `isomRestrict_gFormC_isom` instantiated. The inductive step stays inside the
    `gFormC`-isometry class on a space of finrank EXACTLY one less (`ePerp_finrank`, N119), so the
    octonion-block exhaustion finrank-strong-recursion may recurse into the same problem one rank
    lower — the descent terminating at `finrank 0/1`. THIS is what makes the abstract
    Cartan–Dieudonné induction on the moved-axis complement well-founded, DERIVED. -/
theorem octReflBlockRestrict_gFormC_isom {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) (p : ePerp e₀) :
    gFormC ((octReflBlockRestrict he hw he₀ hortho hne p : O Cut))
           ((octReflBlockRestrict he hw he₀ hortho hne p : O Cut))
      = gFormC ((p : O Cut)) ((p : O Cut)) :=
  isomRestrict_gFormC_isom (octReflBlock e w)
    (fun v => octReflBlock_gFormC_diag hne v)
    (octReflBlock_fixes_orthogonal he hw he₀ hortho hne) p

/-! ## W8 teeth — a CONCRETE subspace-preserving reflection: `octReflBlock e₂ je2` on `ePerp ke2je2`. -/

/-- ★ W8 — THE CONCRETE SUBSPACE REFLECTION IS NON-VACUOUS (the fixed axis). The v-block bisector
    reflection `octReflBlock e₂ je2` FIXES the axis `ke2je2` because `ke2je2` is Born-orthogonal to
    the bisector `e₂ − je2` (`twoaxis_witness_self_overlap`, via `octReflBlock_fixes_orthogonal`,
    the genuine axis-moving pair `e₂ ≠ je2`, `octDeflate_witness_ne`). -/
theorem octReflBlock_witness :
    octReflBlock (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) = (ke2je2 : O Cut) :=
  octReflBlock_fixes_orthogonal e2_imag je2_imag ke2je2_imag
    twoaxis_witness_self_overlap octDeflate_witness_ne

/-- ★ W8 TEETH — the Born self-overlap of the fixed image reads `1`. The distinguishing read-off:
    `octReflBlock e₂ je2` leaves `ke2je2` (orthogonal to the bisector `e₂ − je2`) untouched, so the
    self-overlap of the image is `gFormC ke2je2 ke2je2 = 1` (`ke2je2_gFormC_self`) — NOT `117`. -/
theorem octReflBlock_witness_self_overlap :
    gFormC (octReflBlock (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut))
           (octReflBlock (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut)) = 1 := by
  rw [octReflBlock_witness]; exact ke2je2_gFormC_self

/-- ★ W8 — THE CONCRETE SUBSPACE PRESERVATION IS NON-VACUOUS. `octReflBlock e₂ je2` (a genuine
    diagonal `gFormC`-isometry, `octReflBlock_gFormC_diag`) FIXES the unit-imaginary axis `ke2je2`
    (`octReflBlock_witness`); so `octReflBlock_mapsTo_ePerp` applies, and the operator MAPS the
    codim-1 Born-orthogonal complement `ePerp ke2je2` INTO itself. The subspace preservation is
    realized on a concrete higher-rank reflection, not a vacuous one. -/
theorem octReflBlock_mapsTo_witness :
    ∀ p ∈ ePerp (ke2je2 : O Cut),
      octReflBlock (CD.e2 : O Cut) (je2 : O Cut) p ∈ ePerp (ke2je2 : O Cut) :=
  octReflBlock_mapsTo_ePerp e2_imag je2_imag ke2je2_imag
    twoaxis_witness_self_overlap octDeflate_witness_ne

end

end Phys.Algebra
