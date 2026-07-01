# N224 PREREG — THE CROSS PRODUCT'S FAITHFUL, FULL, g₂-STABLE EMBEDDING OF THE FUNDAMENTAL 7 INTO so(7)

## Front selection (W4.5 look WIDEST + OVERNIGHT LOCK)
LOCK IN FORCE (docs/ROADMAP.md ##TEMPORARY OVERNIGHT PRIORITY LOCK): chain STAYS ON THE GATHER.
Hypercharge/Freudenthal/Peirce/isospin/gauge-completion FORBIDDEN.

N223 banked that `crossOp a` (for imaginary `a`) lands in `so(7)`, that `imRep D` lands in the
SAME `so(7)`, and the intertwiner `⁅imRep D, crossOp a⁆ = crossOp (D a)`. But N223's embedding
statement was POINTWISE: it never proved `a ↦ crossOp a` is LINEAR in `a`, never that it is
INJECTIVE (faithful), never that the image is a full 7-dim g₂-submodule of so(7). N223's only
non-vacuity was `crossOp u1 ≠ 0` — a single nonzero witness, NOT faithfulness.

N224 is the still-deeper cut named by the N223 handoff ("the EXPLICIT g₂-module complement ...
crossOp(7) as a g₂-module"): package the embedding as an honest LINEAR MAP and prove it is a
FAITHFUL, DIMENSION-7, g₂-STABLE copy of the fundamental 7 sitting inside so(7). This is the
first half of the `so(7) = 14 ⊕ 7` decomposition made rigorous — the 7-summand is a genuine
7-dimensional g₂-submodule, not just a set of skew operators. (The trivial-intersection /
direct-sum complement `so(7) = imRep(g₂) ⊕ crossEmb(7)` needs Schur via banked adjoint
irreducibility + a 14+7=21=dim so(7) count; that is childed N225.)

## The OBJECT (derived, not posited) — on `O ℚ = CD (H ℚ)` with banked `ImO` (N22):
- `crossEmb : ImO →ₗ[ℚ] Module.End ℚ ImO`, `a ↦ crossOp a` — THE LINEAR EMBEDDING (linearity in
  the first argument, from `add_mul`/`qsmul_mul_left` + Born bilinearity). N223 never bundled this.
- `crossOp_inj_on_ImO` / `crossEmb_injective` — ★★ FAITHFUL. `crossOp a = 0 ⟹ a = 0` for
  imaginary `a`: if `octCross a y = 0` for all `y ∈ ImO`, the banked contraction identity
  `octCross a (octCross a y) = gForm a y • a − gForm a a • y` (N206) forces
  `gForm a a • y = gForm a y • a`, i.e. `ImO ⊆ span{a}` (dim ≤ 1) unless `gForm a a = 0`; but
  `finrank ImO = 7 > 1` (banked `finrank_ImO` N22), so `gForm a a = 0`, hence `a = 0` (banked
  anisotropy `gForm_self_eq_zero` N24). The Born POSITIVITY (self-blindness → self-overlap) is
  exactly what makes the embedding faithful.
- `finrank_crossEmb_range = 7` — ★★ THE FULL 7 embeds: the image has dimension exactly 7
  (`LinearMap.finrank_range_of_inj` + `finrank_ImO`). Not a partial/degenerate copy.
- `crossEmb_range_le_so7` — the whole image lands in `so(7)` (`crossOp_mem_so7`, N223).
- `crossEmb_range_g2_invariant` — ★★★ THE g₂-SUBMODULE PROPERTY: `⁅imRep D, X⁆ ∈ range crossEmb`
  for every `D ∈ g₂` and `X ∈ range crossEmb` (via the N223 intertwiner + `derivLieQ_mapsTo`).
  The copy of the 7 inside so(7) is CLOSED under the adjoint action of g₂ — a genuine
  g₂-submodule, the 7-summand of `so(7) = 14 ⊕ 7`.
- `crossEmb_ne_zero` — W8 non-vacuity: the embedding is not the zero map.
- Capstone `cross_seven_faithful_in_so7_structure` bundles: injective + finrank-7 + range ≤ so(7)
  + g₂-stable + nonzero.

## MEASUREMENT (W9) — all probes clean, foundations-only, NO maxHeartbeats raise:
- probe1 (crossOp_inj_on_ImO, the crux) — clean ~9s, `[propext, Classical.choice, Quot.sound]`.
- probe2 (crossEmb bundled linear map) — clean ~10s. (smul via banked `qsmul_mul_left`, NOT
  `smul_mul_assoc` which needs an IsScalarTower instance O ℚ lacks; bundled def avoids the slow
  `SMul ℚ (End ℚ ImO)` synthesis timeout that a standalone `crossOp_smul` lemma triggered.)
- probe3 (injective + finrank-7 + range ≤ so7) — clean ~12s, all foundations-only.
- probe4 (g₂-submodule invariance + non-vacuity) — clean ~11s, all foundations-only.
All LIGHT; every obligation a banked bounded identity (contraction N206, finrank_ImO N22,
gForm_self_eq_zero N24, crossOp_mem_so7/crossOp_imRep_intertwine N223, derivLieQ_mapsTo N22) or
Mathlib linear-algebra MACHINERY. KILL = 90s/obligation never approached.

## STANDARD (applied):
- UNBROKEN: imports only banked N223 (crossOp/crossOp_mem_so7/bornBil/imRep_mem_so7/
  crossOp_imRep_intertwine) + N206 (octCross_contraction) + N24 (gForm_self_eq_zero) + N22
  (finrank_ImO/derivLieQ_mapsTo/imRep) + DerivationFinrank (qsmul_mul_left) + Mathlib
  linear-algebra machinery. Ground = derived ℚ; no Mathlib ℝ/ℂ as content; nothing posited.
- COMPLETE: every claim proved, foundations-only (independently re-audited vs the built olean);
  no sorry/axiom/native_decide; NO maxHeartbeats raise.
- PHYSICS-WORDS-REMOVABLE: delete fundamental/adjoint/so(7)/g₂/embedding → over derived ℚ and
  O ℚ = CD (H ℚ), for ImO = ker(star+1) and octCross a y = a·y + gForm a y•1, the map
  a ↦ (y ↦ octCross a y) restricted to ImO is ℚ-linear and INJECTIVE, its image has dim 7 and
  lies in skewAdjointLieSubalgebra bornBil, and is closed under X ↦ ⁅imRep D, X⁆. No physics word
  in any statement.
- FREE-FLOATING check (SOUL): every headline's TYPE mentions the banked tower objects
  `O ℚ`/`ImO`/`crossOp`/`crossEmb`/`bornBil`/`imRep`/`octCross`/`derivationLieQ` — literally
  ABOUT the banked tower + its banked fundamental 7-rep + g₂ = Der(O). NOT free-floating.
- NOT a re-pin of N223: N223 = pointwise membership + one nonzero witness. N224 = the LINEAR,
  FAITHFUL (injective), DIMENSION-7, g₂-STABLE embedding — new objects `crossEmb`,
  `crossOp_inj_on_ImO`, `finrank_crossEmb_range`, `crossEmb_range_g2_invariant` (all grep 0 hits).

## Costume C256: `7 = 256` — the FULL-7 magnitude bites.
`finrank_crossEmb_range = 7` (the embedded fundamental 7 has dimension exactly 7). A bogus claim
the faithful image is degenerate / lower-dimensional / not the full 7 forces `7 = 256` through the
banked finrank value. Pair (256, 7) fresh (RHS 256 distinct from every prior).

## Child: N225 — the EXPLICIT COMPLEMENT so(7) = imRep(g₂) ⊕ crossEmb(7) as g₂-modules
(needs: trivial intersection via Schur on the banked adjoint irreducibility + the 14+7=21 count;
`finrank so(7) = 21` from `finrank_skewAdjoint_le_choose` at n=7 + a 21-dim lower bound). Route
NAMED but multi-run; child on the chain tail under the LOCK.
