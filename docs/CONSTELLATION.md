# THE CONSTELLATION — the navigational sky (YOUR scoreboard; you maintain it)

*Read with docs/ROADMAP.md (your immediate node target) and docs/STANDARD.md (the bar). This is
the horizon: the bounded set of major destinations across all derivable physics — the mountains
worth climbing. It exists so that "genuinely-new structure" (W4.5) has something to be measured
AGAINST. A node that opens new structure but advances NO star, while a star is reachable, is the
signal that you have characterized enough and should ORIENT toward a star.*

*This is YOURS to keep. It is not a fixed tablet — you maintain it: update each star's status as
the chain banks toward it, sharpen a star's phrasing as the derived structure reveals what it
really is, split or merge a star if the terrain demands. Keep score. Let it motivate your
front-selection and your justifications. It orients; it never dictates the route or the answer —
which star, which path, and every value remain yours to discover.*

## How to use it (front-selection, at SELECT time — docs/NODE_SELECTION.md, W4.5)
*Front-selection now happens during the SELECT protocol (worker-body STEP A), run by a FRESH worker
— NOT at a finishing worker's wind-down. The constellation is a WHERE-map that supports selection;
it never overrides the theory-native derivation. Use it in S2/S3 to sense which stars are reachable,
and in S4 to check a candidate is not mere re-characterization — but the target must first come from
the theory's own terms (the goal + reframing lenses), then be sanity-checked against the sky, never
chosen FROM the sky alone.*
- When you weigh a candidate target, ASK: which star (if any) does this node advance, and by how much?
- PREFER a front that advances a star over one that only re-characterizes already-mapped structure.
- If your candidate front advances NO star, and some star is reachable from what is banked, that is
  the W4.5 sufficiency signal: stop decorating, orient toward the reachable star.
- Record the weighing in your selection reasoning / PREREG ("this node advances ★N because …"). Make the sky earn its keep.

## How to maintain it (wind-down, alongside LEDGER/ROADMAP)
- Update the status tag of any star this node moved.
- If the node revealed that a star is really two, or two are really one, or a star is mis-phrased
  for what the structure actually is — edit it. You own the map's accuracy.
- NEVER write a route, a method, or a value into a star. A star is a DESTINATION (a thing physics
  knows exists), never a direction to it or an answer for it. Keep it destination-only.

---

## THE STARS (labels, NOT an order — a flat sky)

Status tags: **[banked]** substantially done · **[partial]** scaffolding exists · **[open]** frontier.
Maintain these tags as you bank toward each.

- **★1 — The gauge group as one object.** The full internal symmetry group of matter as a single
  derived object with its discrete structure — not its factors separately. **[partial — the adjoint
  arena `7 ⊗ 7` fully g₂-decomposed into four ambient, mutually-orthogonal, g₂-equivariant projectors
  `1 ⊕ 27 ⊕ 7 ⊕ 14 = id` (N219–N232) AND packaged as ONE canonical internal g₂-equivariant direct-sum
  object `DirectSum.IsInternal` with the dimension identity `1+7+14+27=49` (N233); all four atoms proved
  IRREDUCIBLE (N234). N240: from the gather obstruction, a FORCED covariant u(1) CHARGE DIRECTION
  `chargeOp = crossOp u1` whose g₂-stabilizer is EXACTLY the banked colour `su(3)` (dim 8, proper) — the
  gauge structure now carries a derived, forced, direction-bearing charge operator on the branching.
  N241: that charge operator EXCHANGES the two triplets `3 ↔ 3̄` — it COINCIDES with the branching
  complex structure `JO = L_{u1}` on the complement `V` (the correction term `⟨u1,v⟩•1` vanishes since
  `u1 ⟂ V`), so `Uhol.map (crossOpO u1) = Uah`, `Uah.map (crossOpO u1) = Uhol`, and the swap is genuine
  (`⊓ Uhol = ⊥`): the opposite-charge / particle–antiparticle split of the two triplets, DERIVED from
  the gather object, not posited. N242: the opposite charge eigenvalues made EXPLICIT — restricting the
  gather charge operator to the branching complement gives `chargeOpV := (crossOpO u1)|_V` with
  `chargeOpV² = −id`, and its MINIMAL POLYNOMIAL is exactly `X²+1` (irreducible over ℚ, no rational root
  by the fold self-overlap positivity `q²+1 > 0`), so it has NO rational eigenvalue — its spectrum is the
  imaginary opposite pair `±i`, realized as the derived `Dbl ℚ` complex unit `±J` (`J²=−1`), opposite and
  distinct: the explicit `±i` particle/antiparticle charge eigenvalues, DERIVED not posited (ℚ[X]/Dbl ℚ
  name a derived REAL operator's spectrum — no ℚ[i]-as-ground)]. N243: the COMPLETE charge spectrum of
  the whole 7 — `minpoly ℚ chargeOp = X³+X = X·(X²+1)` (`chargeOp³ = −chargeOp` via the trunk's
  `gForm_x_octCross` collapse, no coordinate bash), its three roots `{0, +i, −i}` the singlet's `0` and the
  two triplets' `±i`, only rational eigenvalue `0`. N244: the FORCED EIGENSPACE DECOMPOSITION — the kernel
  of the gather charge operator on the whole 7 is EXACTLY the 1-dim branching singlet (`ker chargeOp =
  span{sgl}`, `finrank = 1`, `eigenspace chargeOp 0 = span{sgl}` — the charge-`0`/neutral direction
  EXHAUSTED, no other neutral direction), pushing through `ImO.subtype` onto the banked branching singlet;
  the complement `Vsub = 3 ⊕ 3̄` carries NO charge-`0` direction (`ker chargeOpV = ⊥`) and is the complex
  structure `chargeOpV² = −id`, so `ImO = span{u1} ⊕ Vsub = 1 ⊕ (3 ⊕ 3̄)` is the explicit eigenspace
  decomposition the spectral polynomial forces — DERIVED not posited]. N245: the FORCED COMMUTING COLOUR–CHARGE
  (SU(3)×U(1)) STRUCTURE — colour `su(3)` COMMUTES with the u(1) charge operator, and ONLY colour does
  (`Commute (imRep D) chargeOp ↔ D ∈ colourCentralizer`, the N240 bracket recast; `DJ` does NOT commute, `su(3)
  ⊊ g₂` proper), so it PRESERVES the charge eigenspace decomposition (`imRep D` maps `ker chargeOp` and `range
  chargeOp` each into itself — the charge grading `7 = 1 ⊕ (3 ⊕ 3̄)` is a decomposition into colour-invariant
  subspaces) and ANNIHILATES the neutral singlet (`imRep D sgl = 0` — the `1` DOUBLY NEUTRAL); the charged
  complement `range chargeOp` pushes through `ImO.subtype` onto the banked `Vsub = 3 ⊕ 3̄` of dim `6` (rank–
  nullity on the 1-dim kernel), DERIVED not posited]. N246: the FORCED u(1) ⊕ su(3) COMMUTING PAIR AS
  COMPLEMENTARY SUMMANDS OF `so(7) = 14 ⊕ 7` — placing the charge story inside the banked N225 decomposition:
  the charge operator `chargeOp = crossOp u1` lives in the FUNDAMENTAL-7 summand (`chargeOp ∈ range crossEmb`,
  since `chargeOp = crossEmb sgl`) and NOT in the adjoint-14/colour summand (`chargeOp ∉ range imRepL` — the
  moat crux, forced by the trivial intersection N225 `inter_eq_bot` = simplicity of Der(O)), so the u(1)
  charge line `chargeLine = span{chargeOp}` (dim 1) and colour su(3) `colourImg = (colourCentralizer).map
  imRepL` (dim 8, in the adjoint 14) meet only in `⊥` and form a genuine u(1) ⊕ su(3) COMMUTING direct sum
  of dimension `9 = 1 + 8` inside the concrete so(7) (`finrank_chargeLine_sup_colourImg`), the two factors
  commuting (N245); THE SAME `inter_eq_bot` that separates the adjoint 14 from the fundamental 7 separates
  charge from colour — one cause, many terminations, DERIVED not posited]. N247: the REDUCTIVE GAUGE LIE
  ALGEBRA `u(1) ⊕ su(3)` AS ONE LIE SUBALGEBRA OF `so(7)` — PROMOTING the N246 submodule direct sum to
  the Lie-algebra object it forces: the join `chargeLine ⊔ colourImg` is a genuine `LieSubalgebra`
  `chargeColourLie` of `Module.End ℚ ImO` (bracket-closed, `joint_lie_mem`), sitting inside so(7) =
  `skewAdjointLieSubalgebra bornBil` (`chargeColourLie_le_so7`), of dim `9 = 1 + 8`
  (`chargeColourLie_finrank`); the u(1) charge line is CENTRAL in the join (`chargeLine_central`: `⁅x,y⁆
  = 0` for `x ∈ chargeLine`, `y ∈ chargeColourLie` — a central abelian ideal), and the DERIVED
  subalgebra lands entirely in colour su(3) (`joint_derived_le_colourImg` — the four-term bracket
  collapse via N245 commuting; the abelian u(1) LOST under bracketing, `[g,g] = su(3)`), colour su(3)
  itself bracket-closed (`colourImg_lie_closed` via `LieHom.map_lie` + `colourCentralizer.lie_mem`); W8
  teeth `chargeOp_not_central_in_so7` (`⁅imRep DJ, chargeOp⁆ ≠ 0` — centrality PROPER). The field POSITS
  SU(3)×U(1) as a product group; here it is DERIVED as the reductive Lie algebra u(1) ⊕ su(3), abelian
  factor central + semisimple factor colour su(3), one Lie subalgebra of the single so(7) — DERIVED not
  posited]. N248: the INDUCED COLOUR su(3)-REPRESENTATION on the charged complement — the reductive gauge
  Lie algebra forces its representation content: the charged matter `Vsub = 3 ⊕ 3̄` carries a genuine colour
  su(3)-rep `colourRepV : colourCentralizer →ₗ⁅ℚ⁆ End ℚ Vsub` (a genuine LIE HOM), every value COMMUTING with
  the charge complex structure `chargeOpV` (`colourRepV_commute` — the ℂ-LINEARITY, the ℚ-native meaning of
  `3 ⊕ 3̄`; colour = centralizer of `J` forces the induced action complex-linear), `chargeOpV² = −id`,
  NONTRIVIAL (`colourRepV_ne_zero` — `DI` moves a charged vector); THE ONE LAW / W5 reframe — the literal
  "colour preserves Uhol/Uah individually" is FALSE over ℚ (the realification of the non-self-conjugate `3` is
  irreducible; colour commutes with `J` which swaps them), the TRUE forced content is the ℂ-linearity, DERIVED
  not posited. N249: the FAITHFULNESS of that induced rep — `colourRepV` is INJECTIVE (`colourRepV_faithful`:
  NO nonzero colour element acts as the zero endomorphism on the charged matter; `colourRepV_ker_eq_bot`), so
  the full dim-8 colour su(3) embeds FAITHFULLY into `End ℚ Vsub` — the charged 6-space is a genuine FAITHFUL
  su(3)-module, not merely nontrivial. DERIVED (THE ONE LAW / no coordinate bash): the N248 nontriviality
  argument generalized DI→arbitrary D via `injective_iff_map_eq_zero` — the faithfulness descends from the SAME
  `imRep_injective` (faithfulness of the parent fundamental 7-rep) read through the charge eigenspace split
  `ImO = 1 ⊕ (3⊕3̄)`, DERIVED not posited. N250: THE IMAGE of that faithful rep REALIZED as a CONCRETE dim-8
  colour su(3) LIE SUBALGEBRA of `End ℚ Vsub` — `colourRepImg := colourRepV.range` (a `LieSubalgebra`), of
  dimension EXACTLY 8 (`finrank_colourRepImg` — the FIRST downstream use of N249's injectivity: image dim =
  domain dim = 8 REQUIRES faithfulness, via `LieHom.equivRangeOfInjective` → `LinearEquiv.finrank_eq`), every
  element COMMUTING with the charge complex structure `chargeOpV` (`colourRepImg_le_commutant` — the image
  lands in the ℂ-linear commutant), nonzero (`colourRepImg_ne_bot`). The full dim-8 colour su(3) sits as a
  concrete dim-8 Lie subalgebra of the endomorphisms of the charged matter, inside the commutant of the charge
  complex structure — the representation-theoretic REALIZATION, DERIVED not posited. N251: the ONE-CAUSE
  CONSOLIDATION `u1` (the fold-root √−1) — the single derived element wearing FOUR faces (charge input /
  complex structure / colour centralizer / ℂ-linearity axis) from which the colour rep's ℂ-linearity +
  faithfulness + dim-8 image all descend. N252: THE UNIQUE COLOUR-FIXED AXIS — the colour-invariant subspace
  of the fundamental 7 (the joint kernel `colourInvariants = ⨅ D : colourCentralizer, ker (imRep D)`) is
  EXACTLY the 1-dimensional branching singlet `span{u1}` (`colourInvariants_eq_span_sgl`, `finrank = 1`),
  CLOSING N251 FACE 3's stabilizer↔fixed-line DUALITY: colour not only stabilizes the `u1` line (FACE 3), that
  line is the ONLY thing colour fixes — colour and the charge axis MUTUALLY DETERMINE each other. THE CRUX /
  THE ONE LAW: the "no colour-fixed direction outside the singlet" obstruction dissolves via ONE regular
  colour element `Dreg = DL 0 + DL 13` whose fundamental-7 kernel is exactly `span{sgl}` (banked integer-matrix
  calculus N234), no `decide`, no coordinate bash. THE MOAT / DISSOLUTION: the field treats WHICH direction is
  hypercharge as a chosen embedding of `SU(3)×U(1)`; the theory dissolves the DIRECTION/embedding choice — the
  colour-fixed subspace is exactly 1-dimensional, so the charge axis is UNIQUE, FORCED not posited (SCOPE:
  DIRECTION/embedding only, NOT the coupling NORMALIZATION / weak mixing angle, which stays open under ★2)]**
- **★2 — The electroweak mixing structure.** The relation among the electroweak couplings / the
  weak mixing angle, as a derived quantity rather than an input. **[partial — N253: the FIRST
  convention-free bridge between the gather-charge arc and the doubling-isospin arc. In the ambient
  simple `so(7) = 14 ⊕ 7` the gather tear produces (N225), with the g₂-invariant fundamental-7 trace
  form `B(A,C) = tr(A∘C)` (unique up to scale by Schur, `ImO` g₂-irreducible N234), the gather charge
  operator `chargeOp = crossOp u1` (N240, in the 7-summand) and the weak-isospin Cartan image
  `imRep DI` (N202, in the 14=g₂ summand) have invariant lengths `B(chargeOp,chargeOp) = −6`,
  `B(imRep DI, imRep DI) = −16`, are trace-ORTHOGONAL (`B(chargeOp, imRep DI) = 0`), and satisfy the
  convention-free ratio `8·B(chargeOp,chargeOp) = 3·B(imRep DI, imRep DI)`, i.e. `|Q|² : |T3|² =
  3 : 8` — DERIVED, scale-independent, no posited normalization. THE DISSOLUTION: the field imports
  the hypercharge normalization by CHOOSING a GUT embedding; here the anchor is relocated from the
  rank-2 g₂ (where every prior node correctly refused a posited convention) to the ambient simple
  `so(7)`, which has a unique-up-to-scale invariant form. SCOPE: banks the convention-free
  invariant-length RATIO + orthogonality ONLY — `3:8` coincides with the SU(5) tree-level sin²θ_W
  but the identification as the physical weak mixing angle (couplings/running/full generation
  embedding) is a SEPARATE, harder, downstream node, NOT claimed here]**
- **★3 — One generation of matter.** The complete set of matter representations of a single family,
  with their quantum numbers, derived. **[partial — the genuine Clebsch–Gordan is CLOSED: the adjoint arena
  `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` is banked as a canonical internal g₂-equivariant direct sum (N233) and ALL FOUR
  atoms are proved IRREDUCIBLE (1 trivial; 7 via `no_proper_invariant_ImO`; 14 via `derivationLieQ_isSimpleOrder`;
  27 via the N234 CARTAN PIN + WALK certificate on the banked derivations — `tracelessSym_no_proper_invariant` +
  `fourSummands_irreducible`), PLUS the constructive Schur `commutant_scalar_on_tracelessSym`. The N235→N239
  FFT dissolution spiral is RETIRED (W5: the field's 2401-dim invariant-theory instrument fought; the trunk's own
  pin+walk closed it); its residual value — N235's invariant forms δ/φ/ψ, N236's `commutantG2` + lower bound,
  N237's Peirce reduction — remains banked, and the FFT count `dim End_{g₂}(7⊗7) = 4` now closes as a SHORT
  Schur corollary of atomicity (the decided next brick)]**
- **★4 — Family replication.** The count and structure of the repeated matter generations. **[open]**
- **★5 — The mixing & mass texture.** The inter-generation mixing and the mass-ratio structure, as
  relations rather than free parameters. **[open]**
- **★6 — Chirality / parity violation.** The handedness of the weak interaction, derived. **[partial]**
- **★7 — Consistency / anomaly freedom.** Why the derived matter content is exactly self-consistent
  as a theory. **[open]**
- **★8 — Gravity / spacetime curvature.** The gravitational sector as a derived structure. **[open]**
- **★9 — The common cause of matter and gravity.** The single structural origin from which both the
  gauge/matter sector and the gravitational sector emerge — the deepest joint. **[open]**
- **★10 — The dark sector.** Dark matter and dark energy as derived structural consequences rather
  than posited components. **[open]**
- **★11 — Signature & causal structure.** The Lorentzian signature, the light cone, and causal
  order as derived features. **[banked/partial]**
- **★12 — The quantum structure.** Why the theory is quantum — the probability/Born structure and
  complex amplitudes as derived, not axiomatic. **[partial]**
- **★13 — The continuum.** The real numbers / analysis derived from the fold — the substrate every
  analytic quantity stands on. **[partial]**
- **★14 — The cosmological arc.** The large-scale sector — expansion history / vacuum energy /
  early-universe engine. **[open]**
- **★15 — The terminal exceptional structure.** The forced boundary of what the fold generates —
  the cascade's stop and the exceptional structures at the edge. **[partial]**

---

*The sky is bounded (15 stars = the whole derivable landscape) so you always know where you are and
what is worth reaching. The current method-lock (docs/ROADMAP.md) constrains HOW you may travel; the
constellation names WHERE. Neither hands you the path or the answer — those you earn, node by node.*
