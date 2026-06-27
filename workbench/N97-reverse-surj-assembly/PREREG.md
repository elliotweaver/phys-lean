# N97 PREREG — THE PACKAGED REVERSE-SURJECTIVITY / POLAR-PATH DECOMPOSITION WITNESS

FROZEN before compute. Run 272 (fresh N97). Parent N96 (t_d4246177) LANDED @ deadd99.

## CHOICE OF FRONT (MEASURE-FIRST, priority order from ROADMAP §N97)
Priority **(i)** — EXTEND the affine-path / cone-connectedness toward a PACKAGED reverse-surjectivity
witness for a CONCRETE isometry: its `k·p^{1/2}` split (N93) with `p^{1/2}` connected to id by N96's
`specPathOp` and `k` an isometry. **This is the immediately-bankable structural assembly** — every
piece is ALREADY COMPILED into oleans:
  - N93 `isometry_compact_part_isQvIsom` : `IsQvIsomC g → IsEvCAdjoint g h → ∃ n c u, ... ∧
      h∘g = specOpN c u ∧ IsQvIsomC (g∘(p^{1/2})⁻¹)`  (compact part k is an isometry)
  - N96 `specPathOp`/`_zero`/`_one`/`_isEvCSymm`/`_nonneg` : the affine path γ from id to p^{1/2}
      through the cone of positive operators (NO continuous power / operator topology)
  - N87 `specOpN_resolution_of_injective`, N88 `comp_specInverse_exists`,
      `specOpN_inverse_right`, `specOpN_op_sqrt`, `cutSqrt_pos`, `linIsom_injective`,
      `comp_injective_of_adjoint` : the inverse/identity-resolution machinery.

Priorities (ii) algebraic generation `qvIsomMonoidC ≤ genIsomMonoidC2`, (iii) operator topology over
Cut, (iv) full Spin(9)→SO(9) — these are the HEAVY W1 remainders (Mathlib lacks operator topology
over Cut; full surjectivity needs the generation-by-generators reverse word problem). N96's MEASURE
already confirmed the continuous power / operator topology GENUINELY MISSING. So (i) is the forced
immediately-bankable joint; the global remainder is childed as the next node.

## THE TARGET (the genuine NEW joint — connecting N93's split to N96's path in ONE statement)
`isometry_polar_path_decomp (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :`
  ∃ (n) (c : Fin n → Cut) (u : Fin n → STVC) (γ : Cut → Module.End Cut STVC),
    h.comp g = specOpN c u ∧                         -- the positive part p = g*g
    γ = specPathOp c u ∧                             -- γ IS the affine spectral path
    γ 0 = LinearMap.id ∧                             -- the path STARTS at the identity
    IsEvCOpSqrt (γ 1) (specOpN c u) ∧                -- the path ENDS at p^{1/2}
    (∀ t, IsEvCSymm (γ t)) ∧                         -- self-adjoint ALONG the path
    (∀ t, 0 ≤ t → t ≤ 1 → ∀ p, 0 ≤ EvC (γ t p) p) ∧ -- CONE-POSITIVE along the path
    IsQvIsomC (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) ∧  -- compact part k is an isometry
    (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) = g  -- POLAR RECON g = k∘γ1

NEW CONTENT (the moat): every isometry g = (compact isometry factor k) ∘ (positive factor γ1 that
is the ENDPOINT OF A CONE-PATH FROM THE IDENTITY). For the first time the N93 split's positive part
is not just "a positive operator" but "a positive operator path-connected to id through the cone" —
the structural skeleton of the global reverse surjectivity assembled in one theorem, WITHOUT any
operator exp / continuous power / operator topology (the literature's route, all genuinely missing
over the derived ℝ Cut).

Plus: `boost_polar_path_decomp {a b} (hab : a^2-b^2=1)` — the concrete boost realises the packaged
decomposition (non-vacuity); `boost_polar_recon_coord` — the reconstructed operator `k∘γ1` read at
the pure-time vector `(1,0,0)` has space coordinate `4/3` (for a=5/3,b=4/3); `boost_polar_decomp_id`
— the trivial-isometry sanity check.

## GO / NO-GO
GO if `isometry_polar_path_decomp` + `boost_polar_path_decomp` compile foundations-only
[propext, Classical.choice, Quot.sound], gate D0–D6 green, costume C129 bites a WRONG reconstruction
coordinate (distinct fresh numeric), STANDARD applied (unbroken/complete/words-removable).
NO-GO / DECOMPOSE if the assembly resists (it should NOT — all pieces banked); then bank whatever
compiles and child the remainder.

## KILL BUDGET (W9 — INSTRUMENT failure classification)
Every obligation here is a STRUCTURAL composition of already-compiled lemmas (comp_assoc, rw of
banked equalities) — NO coordinate grind, NO ring/decide/simp on expanded ground coords. EXPECTED
per-decl elaboration: < 5s (the heavy spectral work is already in oleans). KILL: if ANY single
new decl takes > 60s to elaborate, that is an INSTRUMENT signal — STOP, the framing is wrong,
measure the smallest sub-obligation, do NOT inflate maxHeartbeats. `lake build Phys` cached
expected 5–35s. The gate D5 (127→128 costumes parallel x8) ~10-11 min + D6 axiom audit ~6-11 min
cold — run in BACKGROUND, do NOT block turn budget. Checkpoint/commit production by ~50% turns.

## COSTUME C129 (W8 — MUST BITE)
`boost_recon_wrong_coord_BOGUS` : the reconstructed operator `k∘γ1` (the N97 polar/path
decomposition of the concrete boost) read at `(1,0,0)` has space coordinate WRONG value `40`
instead of the genuine `4/3`. Reduces to `4 / 3 = 40` — DISTINCT from the banked battery
(… C127 1=12, C128 3/2=13). Reuses banked objects (boostEndC, specOpN, specPathOp, the
reconstruction hypothesis realised by boost_polar_path_decomp). PHYSICS-WORDS-REMOVABLE: the
statement is pure arithmetic `(... ).2.1 = 4/3` over Cut; "polar/decomposition/isometry/compact/
reconstruction" live only in the docstring.

## PRODUCTION FILE
`Phys/Algebra/LorentzContinuumReverseSurj.lean` (import LorentzContinuumIsomCompact +
LorentzContinuumSpectralPath). Wire: Phys.lean (after LorentzContinuumSpectralPath),
Audits/AxiomAudit.lean (import at END of import list + #print axioms lines). Costume:
`Counterexamples/LorentzContinuumReverseSurjWrongReconCoordCostume.lean`, manifest row C129.
