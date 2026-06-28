  - **(N121 LANDED — run 307, clean in one run, bank-as-you-go) THE SUBSPACE-PRESERVING
    REFLECTION-ON-`ePerp` (the finrank-recursion crux of the global `SO(8)` octonion-block exhaustion;
    ROADMAP §N121 priority (i)(a)'s named immediately-bankable structural piece — clearing the EXACT
    obstruction N120's MEASURE-FIRST finding flagged, THE ONE LAW: no operator-topology grind, no
    global-surjectivity grind).** N119 banked the rank-DROP RESTRICTION engine
    (`isom_fixes_mapsTo_ePerp` / `isomRestrict` / `isomRestrict_gFormC_isom`) for ANY DIAGONAL
    `gFormC`-isometry `S : O Cut →ₗ O Cut` fixing an axis; N120 banked the connective tissue
    (`octDeflate_fixes_orthogonal_axis`) + the bounded two-axis exhaustion, and FLAGGED the one
    obstruction the FULL global finrank-recursion still needed: the abstract `ePerp` finrank-recursion
    tower needs the per-step bisector reflection re-expressed AS an operator ON the `ePerp` subspace —
    "a reflection of two vectors lying inside a subspace `W` need not preserve `W`" — a genuine
    SUBSPACE-PRESERVATION core. THE KEY OBSERVATION (why the crux is LIGHT, THE ONE LAW reframe): N119's
    engine is stated for ANY diagonal `gFormC`-isometry fixing an axis, and the bisector reflection
    `octDeflate e w = biMulLin n n` (N117) acts on the octonion block by the `v`-block linear map
    `biMulV n n` — which IS such a diagonal `gFormC`-isometry fixing any axis Born-orthogonal to the
    bisector. So the subspace-preservation is N119's engine INSTANTIATED at `S := octReflBlock e w`: NO
    new induction, NO operator topology, NO posited orthogonal-group structure. THE STRUCTURAL FACTS
    (DERIVED): `octReflBlock e w := biMulV n n` (the octonion-block v-block of the bisector reflection,
    `n := r⁻¹•(e − w)`); ★ `octReflBlock_gFormC_diag` — a DIAGONAL `gFormC`-isometry (three-factor Born
    composition law `biMul_gFormC` at the Born-unit bisector `octBisector_unit`); ★
    `octReflBlock_fixes_orthogonal` — FIXES any imaginary axis `e₀` Born-orthogonal to the bisector
    `e − w` (the reflection identity `octRefl_reflect_imag` N117 at the unit bisector `n`:
    `n·(e₀·n) = (gFormC n n)•e₀ − (2·gFormC e₀ n)•n = e₀`, the `n`-line term vanishing because `e₀ ⊥ n` —
    the O-Cut-level mirror of N120's `octDeflate_fixes_orthogonal_axis`); ★★ `octReflBlock_mapsTo_ePerp`
    — THE SUBSPACE-PRESERVATION CORE: the v-block reflection MAPS the Born-orthogonal complement
    `ePerp e₀` INTO `ePerp e₀` (N119's `isom_fixes_mapsTo_ePerp` instantiated), the exact obstruction
    N120 flagged RESOLVED — the per-step bisector reflection IS an operator on `ePerp`; ★
    `octReflBlockRestrict` — THE RESTRICTED OPERATOR on the codim-1 invariant subspace (N119's
    `isomRestrict`); ★★ `octReflBlockRestrict_gFormC_isom` — THE CLOSURE: the restriction is STILL a
    `gFormC`-isometry on `ePerp e₀` (N119's `isomRestrict_gFormC_isom`), so the inductive step stays
    inside the `gFormC`-isometry class on a space of finrank EXACTLY one less (`ePerp_finrank` N119) —
    what makes the abstract Cartan–Dieudonné finrank-strong-recursion well-founded. W8 NON-VACUITY:
    `octReflBlock e₂ je2` FIXES `ke2je2` (because `ke2je2 ⊥ e₂ − je2`, `twoaxis_witness_self_overlap`
    N120), so maps `ePerp ke2je2` into itself non-vacuously (`octReflBlock_mapsTo_witness`); the Born
    self-overlap of the fixed image reads `1` (`octReflBlock_witness_self_overlap`). 11 decls
    foundations-only, independently axiom-audited.
    `Phys/Algebra/LorentzContinuumGenerationSO8SubspaceReflection.lean`. THE MOAT: the literature POSITS
    the full `Spin(8)`/`SO(8)` and reads off Cartan–Dieudonné with each reflection RESTRICTING to the
    complement TAKEN AS GIVEN; here the subspace-preservation is CONSTRUCTED forward — the per-step
    bisector reflection IS an operator on the kernel of the trunk's own Born functional, BECAUSE the
    reflection identity's `n`-line term vanishes under Born-orthogonality AND the banked Born
    polarization makes the diagonal isometry preserve the complement bilinearly. A LIGHT node: the crux
    probe (all decls) isolated-typechecked clean in ~24s (import-dominated, user 2.4s), the full
    production in 8.3s (every obligation first try, well under the 90s KILL), production build cached
    7.2s, costume bite ~2s; NO inflated `maxHeartbeats` / NO native_decide / NO brute. Costume C153
    (`1 = 117`, a WRONG subspace-preservation / reflection-restriction coordinate claim — the v-block
    reflection `octReflBlock e₂ je2` FIXES `ke2je2`, so the fixed-image Born self-overlap reads `1`, not
    `117`) — distinct from C115 `1=7` … C151 `1=113`, C152 `0=115`. STANDARD applied (unbroken /
    complete / words-removable). Gate D0–D6 GREEN. The FULL global octonion-block exhaustion (the
    abstract `Submodule.finrank` strong-recursion assembly built on this subspace-preservation core, OR
    the finite imaginary-`Cut`-basis enumeration) + the operator topology over `Cut` stay the childed
    heavy remainder N122.
  - **★ (FORWARD FRONTIER — the immediate next node, N122) THE GLOBAL OCTONION-BLOCK EXHAUSTION — THE
    FINRANK-STRONG-RECURSION ASSEMBLY (built on the N121 subspace-preserving reflection-on-`ePerp`) /
    THE `Cut`-BASIS OF `O Cut` (the finite imaginary-basis enumeration) / OPERATOR TOPOLOGY OVER `Cut`
    → THE FULL COMPACT-`SO(9)` SURJECTIVITY.** The remaining HEAVY group-manifold core, over the banked
    N49–N121 + the derived ℝ `Cut` + the terminal algebra `O Cut`. **N121 banked the
    SUBSPACE-PRESERVATION CORE (`octReflBlock_mapsTo_ePerp` / `octReflBlockRestrict` /
    `octReflBlockRestrict_gFormC_isom`) — the per-step bisector reflection IS now an operator on the
    codim-1 Born-orthogonal complement `ePerp e₀`, its restriction still a `gFormC`-isometry there, and
    each peel drops the finrank by exactly one (`ePerp_finrank` N119). EVERY ingredient of the abstract
    finrank-strong-recursion is now in hand. What the FULL assembly needs on top is ONE of two heavy
    scaffolds (MEASURE which is lighter FIRST):** (i) ★ THE FINRANK-STRONG-RECURSION ASSEMBLY — a
    `Nat.strong_induction` / `Submodule.finrank`-well-founded recursion that, given an octonion-block
    `gFormC`-isometry `T` on a finrank-`n` Born-orthogonal block, picks a moved unit-imaginary axis,
    peels it with `octReflBlock` (N121, the restriction landing on the codim-1 complement `ePerp`,
    `ePerp_finrank` = n−1, `octReflBlockRestrict_gFormC_isom` keeping it an isometry), and recurses to
    the identity at `finrank 0/1`, assembling `T` as a finite bisector-reflection product (full `SO(8)`
    surjectivity). ⚠ THE KEY NEW MEASURE: does the MOVED-AXIS hypothesis transport cleanly to the
    restricted operator on `ePerp` (i.e. is there always a moved unit-imaginary axis INSIDE the
    complement, and does Mathlib's `Submodule.finrank` strong-recursion / well-founded `Nat`-descent
    drive it without a hand-rolled fuel parameter)? — the immediately-bankable piece if it resists is
    the THREE-axis exhaustion (extending N120's two-axis by one more orthogonal peel using
    `octReflBlock_mapsTo_ePerp`), OR the explicit fuel-parametrized recursion at fixed small depth.
    (ii) ★ THE `Cut`-BASIS OF `O Cut` — build a 7-element unit-imaginary `Cut`-basis of the imaginary
    `O Cut` block (`finrank_O_eq_eight` is banked only over `ℚ`; the derived-`Cut` analogue + the
    explicit basis are NOT banked) and a fixes-all-7-imaginary-axes-⟹-identity lemma, bounding the
    global depth to ≤ 7 (MEASURE whether a `Cut`-basis of `O Cut` or the `ℚ`→`Cut` finrank transport is
    the lighter scaffold). (iii) the literal operator TOPOLOGY over `Cut`
    (`TopologicalSpace (Module.End Cut STVC)` / `ContinuousLinearMap` so the N96 affine path γ is
    CONTINUOUS — Mathlib has NO operator topology over the derived `Cut`, the W1 HEAVY core — MEASURE
    whether an operator topology over `Cut` even EXISTS before committing). REFRAME THROUGH THE TRUNK
    FIRST — if the full assembly / operator topology genuinely RESISTS after measure + reframe it is an
    HONEST W1 dissolution ticket + block, decompose into the immediately-bankable structural piece (the
    three-axis exhaustion, the `Cut`-basis of `O Cut`, or the operator-topology existence question over
    `Cut`) + child the global remainder. The costume must bite a WRONG global-exhaustion /
    finrank-recursion / three-axis / basis-enumeration / spanning / operator-topology / `Spin(9)`-cover
    claim, reducing to a false numeric DISTINCT from C115 `1=7` … C152 `0=115`, C153 `1=117`. NO posited
    Lorentz group, NO Mathlib ℝ/ℂ as content — DERIVE from the banked N49–N121 + the derived ℝ `Cut` +
    the terminal algebra `O Cut`.
