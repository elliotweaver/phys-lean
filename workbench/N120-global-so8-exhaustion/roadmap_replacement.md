  - **(N120 LANDED — run 305, clean in one run, bank-as-you-go) THE ORTHOGONAL-AXIS-PRESERVING REFLECTION +
    THE BOUNDED TWO-AXIS EXHAUSTION (the descent-stays-in-complement connective tissue of the global `SO(8)`
    octonion-block exhaustion; ROADMAP §N120 priority (i)'s named immediately-bankable structural piece — the
    BOUNDED two-axis exhaustion, a W1 decomposition of the heavy group-manifold core, THE ONE LAW: no
    operator-topology grind, no global-surjectivity grind).** N115/N116 banked the `x`-block step+reassembly,
    N117/N118 the OCTONION-BLOCK step+reassembly, N119 the rank-DROP RESTRICTION engine (`ePerp` /
    `ePerp_finrank` / `isom_fixes_mapsTo_ePerp` / `isomRestrict` / `isomRestrict_gFormC_isom`): EVERY per-axis
    ingredient was in hand. What the GLOBAL exhaustion induction needs to TERMINATE is the connective fact that
    the Cartan–Dieudonné descent STAYS INSIDE the orthogonal complement of the already-peeled axes — that a
    later bisector reflection FIXES an earlier-fixed axis whenever that axis is Born-orthogonal to the later
    bisector. THE ⚠ MEASURE-FIRST FINDING (why the BOUNDED piece is the bankable one, not the full assembly):
    the full abstract global assembly carries TWO heavy obstructions resisting a one-run bank — (a) the abstract
    `ePerp` finrank-recursion tower would need the per-step bisector reflection re-expressed AS an operator ON
    the `ePerp` subspace (a reflection of two vectors lying inside a subspace `W` need not preserve `W` — a
    genuine subspace-preservation core); AND (b) the finite imaginary-basis enumeration would need a `Cut`-basis
    of `O Cut` (`finrank_O_eq_eight` is banked only over `ℚ`, NOT over the derived `Cut`, and NO `Cut`-basis is
    banked) plus a fixes-all-imaginary-axes-⟹-identity lemma — itself a heavy node. Both honestly childed N121.
    THE STRUCTURAL FACTS (DERIVED, not a posited reflection-group structure theorem): ★★
    `octDeflate_fixes_orthogonal_axis` — THE CONNECTIVE LEMMA: the bisector reflection `octDeflate e w` FIXES
    `(0,0,e₀)` for ANY imaginary axis `e₀` Born-orthogonal to the bisector `e − w` (`gFormC e₀ (e − w) = 0`),
    via the reflection identity `octRefl_reflect_imag` (N117) at the normalized unit bisector `n := r⁻¹•(e−w)`:
    `n·(e₀·n) = (gFormC n n)•e₀ − (2·gFormC e₀ n)•n = 1•e₀ − 0•n = e₀`, the `n`-line term vanishing BECAUSE
    `e₀ ⊥ n` — the structural reason Cartan–Dieudonné's induction recurses INTO the orthogonal complement, a
    later reflection PRESERVING an earlier fixed axis; ★★ `octDeflate_two_axis_step` — THE BOUNDED TWO-AXIS
    DEFLATION STEP: for an octonion-block `QvC`-isometry `T` moving a chosen axis `e → w`, whose first deflation
    moves a SECOND axis `e' → w'`, with `e` Born-orthogonal to the second bisector `e' − w'`, the two-reflection
    composite `octDeflate e' w' · (octDeflate e w · T)` FIXES BOTH `(0,0,e)` and `(0,0,e')` (the first because
    the first deflation fixes it `octDeflate_step` AND the second reflection PRESERVES it
    `octDeflate_fixes_orthogonal_axis`; the second because the second deflation peels it) — the bounded base of
    the Cartan–Dieudonné induction at depth 2; ★ `octDeflate_two_axis_factorization` — THE TWO-REFLECTION
    FACTORIZATION: any `T = octDeflate e w · (octDeflate e' w' · (octDeflate e' w' · (octDeflate e w · T)))`
    (two banked involutions composed). W8 NON-VACUITY: `ke2je2 := e₂·je2` Born-orthogonal to BOTH `e₂` and `je2`
    (`ke2je2_e2_gFormC_zero` / `ke2je2_je2_gFormC_zero`), hence to the bisector `e₂ − je2`
    (`twoaxis_witness_self_overlap`, `= 0`), so `octDeflate e₂ je2` FIXES `(0,0,ke2je2)` (`twoaxis_witness`,
    genuine axis-moving pair `e₂ ≠ je2`), the deep coordinate reading `ke2je2` back (`twoaxis_witness_coord`).
    8 decls foundations-only, independently axiom-audited. `Phys/Algebra/LorentzContinuumGenerationSO8BoundedExhaustion.lean`.
    THE MOAT: the literature POSITS `Spin(8)`/`SO(8)` and reads off Cartan–Dieudonné with the descent STAYING in
    the complement TAKEN AS GIVEN; here the descent-stays-in-complement is CONSTRUCTED forward — the later
    reflection fixes the earlier axis BECAUSE the reflection identity's `m`-line term vanishes under
    Born-orthogonality (the trunk's own Born form), the bounded two-axis exhaustion the explicit two-reflection
    product, each reflection a genuine involution from the banked half-turn-squared-is-the-full-turn (N118), the
    non-associativity obstruction NAVIGATED through the single alternative law the octonions KEEP. A LIGHT node:
    the connective lemma isolated-typechecked clean in 7.8s, the full production 8.1s (every obligation first
    try, well under the 90s KILL), production build cached 6.9s, costume bite ~7s; NO inflated `maxHeartbeats` /
    NO native_decide / NO brute. Costume C152 (`0 = 115`, a WRONG bounded-exhaustion / orthogonal-axis-preserving
    coordinate claim — `ke2je2` IS Born-orthogonal to the bisector `e₂ − je2`, `gFormC ke2je2 (e₂ − je2) = 0`,
    not `115`, which is exactly why the reflection fixes it) — distinct from C115 `1=7` … C150 `1=111`, C151
    `1=113`. STANDARD applied (unbroken / complete / words-removable). Gate D0–D6 GREEN. The FULL global
    octonion-block exhaustion (the abstract finrank-strong-recursion assembly with the per-step reflection
    re-expressed AS an operator on the codim-1 complement — the subspace-preservation core — OR the finite
    imaginary-`Cut`-basis enumeration) + the operator topology over `Cut` stay the childed heavy remainder N121.
  - **★ (FORWARD FRONTIER — the immediate next node, N121) THE GLOBAL OCTONION-BLOCK EXHAUSTION — THE
    SUBSPACE-PRESERVING REFLECTION-ON-`ePerp` (the finrank-strong-recursion assembly) / THE `Cut`-BASIS OF
    `O Cut` (the finite imaginary-basis enumeration) / OPERATOR TOPOLOGY OVER `Cut` → THE FULL COMPACT-`SO(9)`
    SURJECTIVITY.** The remaining HEAVY group-manifold core, over the banked N49–N120 + the derived ℝ `Cut` +
    the terminal algebra `O Cut`. **N120 banked the connective tissue (the descent-stays-in-complement
    reflection lemma `octDeflate_fixes_orthogonal_axis`) + the bounded two-axis exhaustion. What the FULL global
    induction needs on top is ONE of two heavy scaffolds (MEASURE which is lighter FIRST):** (i)(a) ★ THE
    SUBSPACE-PRESERVING REFLECTION-ON-`ePerp` — re-express the per-step bisector reflection AS an operator on the
    codim-1 Born-orthogonal complement `ePerp e` (N119), so the rank-DROP restriction (`isom_fixes_mapsTo_ePerp`
    / `isomRestrict_gFormC_isom` / `ePerp_finrank`) drives a `finrank`-strong-recursion: a `gFormC`-isometry on
    an `n`-dim block = one bisector reflection · a `gFormC`-isometry on the `(n−1)`-dim complement, recursing to
    the identity at `finrank 0/1`. THE KEY NEW MEASURE: does the bisector reflection of two vectors lying inside
    `ePerp` PRESERVE `ePerp` (the subspace-preservation core the bounded exhaustion sidesteps)? does Mathlib's
    `Submodule.finrank` strong-recursion / `Nat.strong_induction` cleanly drive the descent with the restricted
    isometry's moved-axis hypothesis transporting to the subspace? — the immediately-bankable piece if it
    resists is the subspace-preservation lemma ALONE (the reflection restricted to `ePerp` is a `gFormC`-isometry
    on `ePerp`), OR the three-axis exhaustion (extending N120's two-axis by one more orthogonal peel). (i)(b) ★
    THE `Cut`-BASIS OF `O Cut` — build a 7-element unit-imaginary `Cut`-basis of the imaginary `O Cut` block
    (`finrank_O_eq_eight` is banked only over `ℚ`; the derived-`Cut` analogue + the explicit basis are NOT
    banked) and a fixes-all-7-imaginary-axes-⟹-identity lemma, bounding the global depth to ≤ 7 (MEASURE whether
    a `Cut`-basis of `O Cut` or the `ℚ`→`Cut` finrank transport is the lighter scaffold). (ii) the literal
    operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` / `ContinuousLinearMap` so the N96
    affine path γ is CONTINUOUS — Mathlib has NO operator topology over the derived `Cut`, the W1 HEAVY core —
    MEASURE whether an operator topology over `Cut` even EXISTS before committing). REFRAME THROUGH THE TRUNK
    FIRST — if the full assembly / operator topology genuinely RESISTS after measure + reframe it is an HONEST
    W1 dissolution ticket + block, decompose into the immediately-bankable structural piece (the
    subspace-preserving reflection-on-`ePerp` lemma, the three-axis exhaustion, the `Cut`-basis of `O Cut`, or
    the operator-topology existence question over `Cut`) + child the global remainder. The costume must bite a
    WRONG global-exhaustion / finrank-recursion / subspace-preservation / basis-enumeration / operator-topology /
    `Spin(9)`-cover claim, reducing to a false numeric DISTINCT from C115 `1=7` … C151 `1=113`, C152 `0=115`. NO
    posited Lorentz group, NO Mathlib ℝ/ℂ as content — DERIVE from the banked N49–N120 + the derived ℝ `Cut` +
    the terminal algebra `O Cut`.
