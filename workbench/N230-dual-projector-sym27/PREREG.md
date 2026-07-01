# N230 PREREG — THE g₂-EQUIVARIANT DUAL PROJECTOR `End ℚ ImO → Sym²7` ALONG `so(7)` + the RESOLUTION OF IDENTITY

Node: N230. Task: t_db15ac33. Parent: t_ad4cb415 (N229 LANDED). Under the OVERNIGHT PRIORITY LOCK (gather side).

## FRONT CHOSEN (measure-first, frozen before commit)

Of the §N229-superseded gather fronts explicitly NAMED in the N229 handoff + ROADMAP §N229-superseded
frontier, the FIRST-named: **the DUAL projector `End ℚ ImO → Sym²7` along `so(7)` (`1 − projSo7`, its own
g₂-equivariant retraction onto the symmetric side) + the RESOLUTION OF IDENTITY binding both idempotents.**

N229 banked `projSo7 = skewSelf_isCompl.projection` : the retraction onto so(7) (the skew side) along Sym²7,
idempotent, range the full 21-dim so(7), g₂-equivariant. This node builds its complementary partner
`projSym = selfSkew_isCompl.projection` : the retraction onto Sym²7 (the self side) along so(7), and proves
the two projectors RESOLVE THE IDENTITY (`projSym X + projSo7 X = X`), are ORTHOGONAL
(`projSo7 ∘ projSym = projSym ∘ projSo7 = 0`), and that `projSym` is ITSELF a morphism of g₂-modules
(`projSym (adEnd D X) = adEnd D (projSym X)`). Together the pair `(projSo7, projSym)` exhibits `7 ⊗ 7 = End ℚ ImO`
as the INTERNAL g₂-equivariant direct sum `Λ²7 (21 = so(7)) ⊕ Sym²7 (28)` via two commuting idempotent
g₂-module maps — the resolution-of-identity form of the N227 decomposition.

WHY THIS FRONT (not a re-pin): N227 banked the decomposition FACTS (`selfSkew_isCompl`); N229 banked the
so(7)-side splitting MAP `projSo7`. N230 banks the Sym²7-side splitting MAP `projSym` AND the relational content
binding both maps: the resolution of identity + orthogonality + dual g₂-equivariance. `projSym`, the resolution
`projSym + projSo7 = id`, and the orthogonality relations were NOT banked (grep 0 hits). This is the natural
completion: N229 gave one half of the retraction pair, N230 gives the other half + the pair's algebra.

Fronts NOT chosen (deferred, still available for N231): g₂-module ISO `so(7) ≃ 14 ⊕ 7` as explicit LinearEquiv;
the trace/metric g₂-invariant functional isolating the 27; the `Phase/` category track; the physical reading.
The dual projector is the LIGHTEST and MOST DIRECTLY FORCED from the just-banked N229, and completes the
retraction-pair structure that N229 left half-built.

## MEASURE-FIRST VERDICT (W9)

Probe `workbench/N230-dual-projector-sym27/probe1.lean` — 13 decls (projSym + idem/range/ker/finrank-28 +
apply_self/apply_skew/apply_mem/projSym_projSym + resolution projSym_add_projSo7 + projSym_eq_sub +
orthogonality projSo7_projSym/projSym_projSo7 + g₂-equivariance projSym_equivariant + capstone
end_dual_projection_sym27_structure) — **measured standalone: 21.97s, EXIT 0, no errors/warnings**.

A LIGHT node: every obligation structural over banked N227/N229 facts + Mathlib `IsCompl.projection`
MACHINERY (`projection_add_projection_eq_self` is the resolution; the dual projector is the SAME `IsCompl.projection`
on the un-reoriented `selfSkew_isCompl`). NO coordinate bash, NO degree-4 expansion, NO W9 kernel-blowup risk.
KILL = coordinate-expansion-forbidden / any single obligation > 60s → decompose; never approached.
Kept the N227/N228/N229 synthInstance ceiling `1000000` for the ℚ-End instance diamond (NOT a proof-search raise).

Instrument notes discovered while measuring:
- `projSym_eq_sub` proved via `eq_sub_of_add_eq (projSym_add_projSo7 X)` — NOT via
  `projection_eq_self_sub_projection` directly, whose type displays `selfSkew_isCompl.symm.projection` and
  mismatches `projSo7 = skewSelf_isCompl.projection` at the surface (defeq but not syntactically). A tactic-family
  switch per SOUL (derive from the already-proven resolution, don't fight the symm display).

## BANK PLAN
- Production: `Phys/Algebra/TowerGatherDualProjectionSym27.lean` (imports ONLY banked N229
  `Phys.Algebra.TowerGatherEndProjectionSo7`, transitively the whole tower).
- Wiring: `Phys.lean` import; `Audits/AxiomAudit.lean` import + `#print axioms` for all NEW decls.
- Costume C262: `Sym²7` GENUINELY has dim 28 (`finrank_projSym_range`); a bogus claim it collapses forces
  `28 = 262` in ℕ. Pair (262, 28) fresh, RHS 262 distinct from every prior right-hand value.
- Manifest row `C262 <TAB> file <TAB> 28 = 262`.
- Commit bank-as-you-go BEFORE the gate.

## STANDARD (to verify at completion)
- UNBROKEN: imports only banked tower; `IsCompl.projection`/`projection_add_projection_eq_self` as MACHINERY;
  ground = derived ℚ, `O ℚ = CD (H ℚ)`; nothing posited, no bridge.
- COMPLETE: all decls foundations-only `{propext, Classical.choice, Quot.sound}`; no sorry/axiom/native_decide.
- PHYSICS-WORDS-REMOVABLE: delete g₂/so(7)/Sym²7/projector → over derived ℚ and `O ℚ`, for `End ℚ ImO` with the
  Born form's complementary self and skew submodules, the `IsCompl.projection` onto the self side is idempotent,
  range the self submodule (finrank 28), ker the skew submodule, sums with `projSo7` to the identity, is orthogonal
  to it, and commutes with `X ↦ ⁅imRep D, X⁆`. No theorem statement needs a physics word.
- FREE-FLOATING: every headline TYPE mentions banked tower objects `bornBil`/its self+skew submodules/`adEnd`/
  `derivationLieQ`/`ImO`/`projSo7` on the derived `O ℚ`. `projSym` is the CONCRETE dual retraction, not carrier-agnostic.
