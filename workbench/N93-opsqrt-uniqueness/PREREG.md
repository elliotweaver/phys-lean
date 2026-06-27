# N93 PREREG — THE GENERAL POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS (and the crux scalar-target case)

Frozen BEFORE compute. Node t_954f21a9, run 262. Over the derived ℝ `Cut` + terminal algebra `O Cut`.

## TARGET (priority order from ROADMAP §N93)
(i) THE GENERAL POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS
    `IsEvCOpSqrt s₁ q → IsEvCOpSqrt s₂ q → s₁ = s₂`
    → the lift `J p^{1/2} J = (p^{1/2})⁻¹` → the isometry-compact-part lemma.

## MEASURE-FIRST FINDING (before any production)
The EvC-inner-product route (route (a)) — drive `EvC ((s₁−s₂)v)((s₁−s₂)v) → 0` — was worked by
hand and is GENUINELY CIRCULAR without commuting: from `s₁D = −Ds₂`, `s₂D = −Ds₁` one gets
`S := EvC(Dv)(s₁Dv)+EvC(Dv)(s₂Dv) = −EvC(D²v)(s₁+s₂)v = −(−S) = S`, a tautology. So the no-analysis
GENERAL uniqueness needs the spectral decomposition of `q` (route (b)) — the genuine W1 remainder.

The route (b) KERNEL — the immediately-bankable, FORCED, clean structural piece that the full
uniqueness consumes per q-eigenspace — is THE SCALAR-TARGET UNIQUENESS:
> `op_sqrt_scalar_unique`: a positive operator square root `R` of a SCALAR operator `λ•id`
> (`R` EvC-self-adjoint, EvC-nonneg, `R∘R = λ•id`, `0 ≤ λ`) equals `cutSqrt λ • id`.
This strictly GENERALIZES the banked `scalar_op_sqrt_unique` (which assumed the root is itself a
homothety `b•id`) to an ARBITRARY positive root. Trunk-native dissolution (THE ONE LAW: reframe,
no analysis, no functional calculus):
  - μ := cutSqrt λ, μ² = λ (cutSqrt_sq), μ ≥ 0 (cutSqrt_nonneg).
  - KEY IDENTITY: `EvC (Rv)(Rv) = λ · EvC v v` (R self-adjoint + R²=λid).
  - λ=0: `EvC(Rv)(Rv)=0` ⟹ `Rv=0` (EvC positive-definite) ⟹ R=0=cutSqrt 0•id (cutSqrt_zero).
  - λ>0 (μ>0): `(R+μ•id)` is INJECTIVE — `EvC((R+μ)v)((R+μ)v) = 2λ·EvC v v + 2μ·EvC(Rv)v`, a sum of
    two non-negatives (Born positivity), `=0 ⟹ EvC v v=0 ⟹ v=0`. Injective ⟹ SURJECTIVE on the
    finite Cut-module STVC (`LinearMap.injective_iff_surjective`, Module.Finite Cut STVC N76).
    `(R−μ•id)∘(R+μ•id) = R∘R − μ²•id = λ•id − λ•id = 0` (μ scalar commutes). Surjective ⟹ R−μ•id=0
    ⟹ R = μ•id = cutSqrt λ•id.

## GO / NO-GO
- GO if `op_sqrt_scalar_unique` compiles clean (foundations-only) in a bounded probe (KILL below).
  BANK it immediately in production `Phys/Algebra/LorentzContinuumOpSqrtScalarUnique.lean`, wire,
  costume, gate, commit — it is the FORCED new content (the (R+μ)-injective dissolution).
- THEN attempt the full eigenspace-localized general uniqueness in a probe. If it dissolves within
  the remaining budget, bank it and proceed to the lift. If the eigenspace-restriction machinery
  (build λ-eigenspace submodule, restrict R, apply the scalar-case) is too heavy for the remaining
  budget → child the full-uniqueness remainder + the lift + isometry-compact-part onto the chain
  tail (W3 decompose), completing this node with the scalar-target uniqueness banked.

## KILL (W9 — instrument-failure budget, per obligation)
- KILL = 180s for ANY single obligation/probe compile. If a probe exceeds 180s or ends at full
  budget banking nothing, it is an INSTRUMENT failure (not a theory failure): STOP, decompose,
  do NOT inflate maxHeartbeats, do NOT re-run the same monolith. `op_sqrt_scalar_unique` is pure
  pointwise linear algebra — expected « ~10s. If it blows up, the framing is wrong.
- No `maxHeartbeats` inflation. No monolithic `ring`/`decide`/`simp` over expanded coordinates.

## ANTI-VACUITY (W8) — costume C124 MUST bite
A WRONG scalar-target uniqueness collapse, reducing to a false numeric DISTINCT from C115 1=7 …
C123 4=64. Candidate: claim the positive root of `9•id` is `3•id` is fine, but a WRONG one — e.g.
"the positive operator square root of `λ•id` reads eigenvalue cutSqrt of a WRONG λ" or a concrete
homothety mismatch `cutSqrt 9 = 4` (i.e. `4 = 3` style) forcing a false numeric. Finalize the exact
distinct false numeric at costume-authoring time.

## STANDARD (the only bar)
Unbroken: every object ← banked N49–N92 ← derived ℝ Cut ← the fold. `injective_iff_surjective`,
`map_smul`, `LinearMap.comp_apply`, `smul_smul` are standard MACHINERY on DERIVED objects (§3).
Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for every decl, audited vs the
built olean. Words-removable: delete "square-root/uniqueness/positive-definite/self-adjoint/
eigenvalue/spectral/isometry/compact/scalar/homothety" → pure linear algebra over the complete
ordered field `Cut` with the positive-definite form `EvC`.
NO Mathlib ℝ/ℂ as content. NO posited Lorentz group. NO bridge.
