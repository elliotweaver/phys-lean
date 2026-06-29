import io

path = "docs/LEDGER.md"
with io.open(path, "r", encoding="utf-8") as f:
    lines = f.readlines()

row = (
    "| N167 THE RECIPROCAL CHARACTERIZATION of the polar positive part "
    "(the eigenvalue-reciprocal-pair pin toward the isometric positive-part path) — "
    "an EvC-self-adjoint `QvC`-isometry `p` satisfies the operator equation `p ∘ J ∘ p = J` "
    "and the J-conjugation inversion `(J ∘ p ∘ J) ∘ p = id` (i.e. `J p J = p⁻¹`), the "
    "reciprocal-eigenvalue-pair structure of a pure boost; over the DERIVED ℝ `Cut`, the "
    "terminal algebra `O Cut := CD (H Cut)`, the spacetime `STVC = Cut × Cut × O Cut`. "
    "| Algebra (gauge / spacetime) | ✅ | "
    "THE ONE LAW REFRAME — `p`'s SELF-ADJOINTNESS IS NOW LOAD-BEARING (★ MEASURE-FIRST / W3 DECOMPOSE): "
    "N166 dissolved the N165 obstruction (the positive part `p` is a positive self-adjoint `QvC`-isometry, "
    "NOT a generic positive operator), leaving the single residual `JoinedIdQvC p` — a path of ISOMETRIES "
    "from `1` to `p`. ★ THE FULL closure is the genuinely-heavy remainder; the two trunk-native routes were "
    "MEASURED (W1/W9): (a) the spectral `t`-power `specOpN (fun i => cutSqrt(c i)^t) u` needs a CONTINUOUS "
    "REAL POWER `cutRpow` over the derived ℝ `Cut`, GREP-CONFIRMED GENUINELY MISSING (no `def cutRpow`/`cutPow` "
    "anywhere — only doc mentions); building it from `Cut` is itself a number-tower sub-node; (b) the KAK "
    "FRAME-PRODUCT expressing `p = specOpN (cutSqrt∘c) u` as a finite product of single-axis `boostEndC` needs "
    "the eigenvalues to come in RECIPROCAL PAIRS `(λ, 1/λ)` (one boost per eigenplane) + the eigenframe "
    "extraction — heavy. ★★ THE ONE LAW REFRAME (the clean trunk lever banked THIS run): `p` is EvC-self-adjoint "
    "(`IsEvCSymm p` = `IsEvCAdjoint p p`) AND a `QvC`-isometry, so by the BANKED metric-condition characterization "
    "`isQvIsom_iff_metric_condition` (N90, instantiated with `g := p`, `h := p` — the operator is its OWN "
    "EvC-adjoint), the form-preservation `IsQvIsomC p` is EQUIVALENT to the operator equation `p ∘ J ∘ p = J` "
    "(`J = sigOpC`), and hence (by `sigOpC_comp_self`, `J∘J = id`) to `(J ∘ p ∘ J) ∘ p = id`, i.e. `J p J = p⁻¹`. "
    "Conjugating a positive self-adjoint isometry by the signature involution INVERTS it — exactly the "
    "reciprocal-eigenvalue-pair structure of a pure boost, the structural fact distinguishing the positive "
    "part (a product of boosts) from a generic positive operator (for which `q J q ≠ J`). The self-adjointness, "
    "UNUSED by N166, is now LOAD-BEARING, and the characterization is the precise input the eigenframe "
    "boost-product closure (N168) consumes. WHAT THIS NODE BANKS (4 audited decls in "
    "`Phys/Algebra/LorentzContinuumPositivePartReciprocal.lean`): ★★ `evCSymm_isQvIsomC_recip` (THE RECIPROCAL "
    "CHARACTERIZATION / the engine — an EvC-self-adjoint `QvC`-isometry `p` satisfies `p ∘ J ∘ p = J`, the "
    "metric condition with `h := p`); ★★ `evCSymm_isQvIsomC_Jconj_inv` (THE J-CONJUGATION INVERSION — "
    "`(J ∘ p ∘ J) ∘ p = id`, `J p J = p⁻¹`, the reciprocal-eigenvalue-pair form); ★★ `bvIsomLin_polar_part_recip` "
    "(THE APPLICATION — the positive-part factor `p` of the converse polar decomposition of a `BvC`-isometry "
    "satisfies both). W8 NON-VACUITY: `polarPart_recip_nonvac` (the positive part of the concrete boost "
    "`(5/3,4/3)` is a genuine `QvC`-isometry satisfying the reciprocal characterization with a genuine "
    "non-identity operator). 4 declarations foundations-only `[propext, Classical.choice, Quot.sound]` "
    "(INDEPENDENTLY axiom-audited 4/4 vs the built olean). THE MOAT: the literature POSITS the polar "
    "decomposition of `SO⁺(1,9)` and reads the positive part as `exp(self-adjoint generator)` with manifestly "
    "reciprocal spectrum; here the reciprocal/`J p J = p⁻¹` structure is FORCED by a one-line application of "
    "the derived metric-condition characterization to the positive part's own self-adjointness, with NO "
    "operator `exp`, NO spectral theory, NO posited topology, NO posited Lorentz group, NO Mathlib ℝ/ℂ as "
    "content. DERIVED from the trunk (the metric-condition characterization `isQvIsom_iff_metric_condition` "
    "N90; the signature involution `sigOpC`/`sigOpC_comp_self`; the strengthened polar reduction "
    "`bvIsomLin_polar_part_isQvIsomC` N166; the boost `boostEndC`/`boostEndC_isBvIsomLin`/`boostWitness_hab` "
    "N49/N164; `IsEvCSymm`/`IsEvCAdjoint`; `LinearMap.ext`/`LinearMap.comp_apply` MACHINERY on the DERIVED "
    "objects, STANDARD §3), NOT a posited topology/connectedness, NOT a posited Lorentz/Pin/Spin/gauge/G₂ "
    "group, NOT a posited KAK/polar product, NOT a posited boost flow/rapidity, NOT a posited eigenframe, "
    "NOT a posited continuous power (`cutRpow` is the childed remainder, NOT imported as content), NOT Mathlib "
    "ℝ/ℂ as content (the field, the form, the involution, the operators are ALL the derived `Cut`), NOT a "
    "regression to the vacuous `JoinedIdC`, NOT a fully proved implication asserted without a proof, NOT a "
    "bridge. W9 MEASURE-FIRST: a LIGHT node (the full eigenframe-extraction + path closure childed N168) — "
    "the four levers compiled clean in a ~31s isolated probe (2.4s user CPU), the production whole-file build "
    "18s, independent axiom audit 4/4 clean vs the built olean, costume bite `⊢ 1 = 167` ~instant; "
    "KILL=5min/obligation never approached; no name collisions; bank-as-you-go (production + Phys.lean/AxiomAudit "
    "wiring committed `b8aeff5`, costume + manifest `3d252b5`, BEFORE the gate ceremony). Costume C199 (`1 = 167`, "
    "a WRONG reciprocal / J-conjugation / positive-part-path read-off — the eigenvalue-pair product "
    "`(5/3+4/3)·(5/3−4/3) = (5/3)²−(4/3)²` of the boost's reciprocal eigenvalues genuinely equals `1` "
    "(`boostWitness_hab`); claiming `167` forces `1 = 167` in `Cut`) — DISTINCT from the banked battery "
    "(… C197 `1=165`, C198 `1=166`). STANDARD applied (unbroken / complete / words-removable: delete "
    "\"Lorentz/boost/reciprocal/pure-boost/eigenvalue/eigenplane/J-conjugation/self-adjoint/isometry/positive-part/"
    "polar/KAK/signature/metric/Minkowski/spectral\" → over the derived complete ordered field `Cut`, the terminal "
    "algebra `O Cut`, the form `QvC`/`EvC`, and the involution `sigOpC`, if an endomorphism `p` is symmetric for "
    "the form `EvC` (`∀ p q, EvC (p p) q = EvC p (p q)`) and preserves the form `QvC` (`∀ q, QvC (p q) = QvC q`), "
    "then `p ∘ sigOpC ∘ p = sigOpC` and `(sigOpC ∘ p ∘ sigOpC) ∘ p = id`; pure linear algebra over the derived "
    "field, no theorem statement needs a physics word). Gate D0–D6 GREEN. 🔨→✅ | gate green; foundations-only "
    "(4/4 vs built olean); words-removable (as above). | THE NEXT FORCED GAUGE/SPACETIME NODE — N168 (the single "
    "childed forward residual): creative theory-native dissolution — `JoinedIdQvC p` for the positive self-adjoint "
    "`QvC`-isometry `p`, via the eigenframe BOOST-PRODUCT route: read the reciprocal-pair structure (THIS node's "
    "`evCSymm_isQvIsomC_Jconj_inv`) off `p = specOpN (cutSqrt∘c) u` to express `p` as a finite product of "
    "single-axis `boostEndC`, each `JoinedIdQvC` by N164's `boostPath`, glued by `joinedIdQvC_listProd` (N157); OR "
    "build `cutRpow` over the derived `Cut` for the continuous spectral path — closing the UNCONDITIONAL full "
    "`SO⁺(1,9)` identity component for EVERY proper orthochronous `S`; OR the FULL G₂ as a 14-dim structure via "
    "the heavy `expOEquiv` route; OR a Mathlib Klein-four identification of `kleinFour`, child as OPTIONAL — "
    "childed N168. |\n"
)

# Insert after line 213 (1-indexed) — i.e. after the N166 row.
insert_idx = None
for i, ln in enumerate(lines):
    if ln.startswith("| N166 THE POSITIVE-PART DISSOLUTION"):
        insert_idx = i + 1
        break
assert insert_idx is not None, "N166 row not found"
lines.insert(insert_idx, row)
with io.open(path, "w", encoding="utf-8") as f:
    f.writelines(lines)
print("Inserted N167 row at line", insert_idx + 1)
