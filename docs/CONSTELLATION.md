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
  DIRECTION/embedding only, NOT the coupling NORMALIZATION / weak mixing angle, which stays open under ★2).
  N258: BOTH SM REDUCTIVE FACTORS NOW DERIVED — the electroweak factor su(2)_L ⊕ u(1)_Y is assembled as a
  second `LieSubalgebra ℚ (End ℚ ImO)` (`electroweakLie`, dim 4 = 3 + 1) inside the SAME so(7), the twin of
  N247's colour-charge factor u(1)_Q ⊕ su(3)_c (dim 9 = 1 + 8) with the semisimple/central roles SWAPPED
  across the gather tear 14⊕7 (colour: abelian-in-7 + semisimple-in-14; electroweak: semisimple-in-14 +
  abelian-in-7). Both are reductive Lie subalgebras of the ONE derived so(7), each split by the same
  `inter_eq_bot`; W8 `chargeOp_not_mem_electroweakLie` shows the gather charge sits in the colour-charge
  factor and NOT the electroweak factor (the two sectors genuinely distinct). N259: THE TWO FACTORS ARE
  NOT A DIRECT PRODUCT — the joint structure of the two derived reductive factors inside the ONE so(7):
  they MEET in EXACTLY the 1-dimensional isospin Cartan line `chargeColourLie ⊓ electroweakLie =
  span{imRepL DI}` (`shared_cartan`, finrank 1), their sup has finrank 12 (= 9 + 4 − 1, inclusion–
  exclusion), the meet is nonzero, and the gather charge `chargeOp ∉` it. THE DISSOLUTION: the field
  POSITS SU(3)×SU(2)×U(1) as an independent DIRECT PRODUCT (factors share nothing); the theory DERIVES
  that they OVERLAP in the shared isospin Cartan T3 — forced because both non-abelian factors sit in the
  SAME rank-2 g₂, which cannot independently hold su(3)+su(2), and the fold-root `u1` puts DI into colour
  (`DI ∈ colourCentralizer`) so `imRepL DI` lands in BOTH factors (one cause). The full SM gauge algebra
  as ONE object is now assembled at the shared-Cartan level — the intersection/sum structure of both
  derived reductive factors inside the single so(7); the heavier so(7)-generation (12→21 bracket closure)
  is a later node. N260: THE GATHER TEAR REGENERATES THE AMBIENT — the closure of ★1: the gather-tear
  fundamental-7 (`range crossEmb`, N225) LIE-GENERATES the WHOLE derived `so(7) = skewAdjointLieSubalgebra
  bornBil` (`crossEmb_lieSpan_eq_so7`: `LieSubalgebra.lieSpan ℚ _ (↑(range crossEmb)) = so7`), so the
  14-dim derivation algebra g₂ (`range imRepL` — the structure group the field POSITS) is REGENERATED
  from brackets of the 7 (`range_imRepL_le_lieGenCross`), finrank 21 (`finrank_lieSpan_crossEmb`); W8
  witness `proj14 ⁅crossOp (imBasis 1), crossOp (imBasis 2)⁆ ≠ 0`. THE ⊇ ENGINE: `W14 := span{proj14
  ⁅crossEmb a, crossEmb b⁆}` is adEnd-invariant (Jacobi + the banked intertwiner `crossOp_imRep_intertwine`)
  and nonzero, so by IRREDUCIBILITY of the adjoint 14 (`imRepL_range_no_proper_invariant`, N30 simplicity
  of Der O) it is ALL of the 14. THE DISSOLUTION: the field POSITS the structure/derivation group g₂ (or a
  GUT) as a GIVEN container; the theory INVERTS it — the ambient is DERIVED FIRST (gather tear, N225) and
  the 14-dim g₂ is GENERATED by brackets of the fold's own tear directions (the 7). DEEPER than the
  standard-physics "12→21 SM-factors-fill-so7" (the FACTOR framing needs the ugly su(3)+su(2)→g₂ coordinate
  rank — measured to have no clean structural proof, deferred); the tear framing (7→21) is the fold-native
  object and closes CLEAN. ONE CAUSE MANY TERMINATIONS: the single g₂-irreducibility of the fundamental 7
  forces the whole 21 — the adjoint 14 is not a posited structure group but a REGENERATED consequence of
  the tear. ★1 gauge-group-as-one-object is now at its capstone: both SM reductive factors + their joint
  structure + the tear regenerating the whole simple ambient, all inside the single derived so(7)]**
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
  embedding) is a SEPARATE, harder, downstream node, NOT claimed here. N254: THE FORCED SECOND
  NEUTRAL DIRECTION — the structural fact UNDERNEATH the angle. The gather charge `chargeOp =
  crossOp u1` (N240) and the doubling weak-isospin Cartan `imRep DI` (N202), both born from the
  single fold-root `u1`, COMMUTE (`charge_isospin_commute`), are ℚ-linearly INDEPENDENT
  (`charge_isospin_independent`, a rank-2 abelian torus of `so(7)`), and grade the fundamental 7
  DIFFERENTLY (`grading_misaligned`): the isospin singlet `kap1 = κO 1` is isospin-neutral yet
  charge-NONZERO (`ker (imRep DI) ⊄ ker chargeOp`), and the two meet only in the fold-root axis
  (`joint_neutral_kernel`: `ker chargeOp ⊓ ker (imRep DI) = span{sgl}`). So weak isospin ALONE does
  NOT determine the charge grading — a SECOND independent neutral generator (hypercharge) is FORCED,
  not posited. THE DISSOLUTION: the field POSITS `U(1)_Y` + chooses `Q = T3 + Y/2` by convention;
  here the second neutral direction is FORCED by the MISALIGNMENT of two DERIVED operators' gradings,
  computable from banked integer matrices. SCOPE: banks the forced-independence + grading-misalignment
  ANCHOR ONLY, NOT the mixing angle / normalization (still open under ★2). N255: THE FORCED HYPERCHARGE
  DIRECTION — the forward IDENTITY beat pinning WHICH direction the forced second neutral generator is.
  The gather cross-product `crossOp` embeds the 7 into `so(7)` g₂-equivariantly (`⁅imRep D, crossOp a⁆
  = crossOp (D a)`, N225), so `hyperOp = crossOp (κO 1)` — the cross-product of the isospin-NEUTRAL
  su(2)_L branching singlet `κO 1` (EVERY inner derivation annihilates it, N189) — COMMUTES with the
  WHOLE weak isospin su(2)_L = {DI,DJ,DK} (`hyperOp_commute_isospin`: `⁅imRep D, hyperOp⁆ = crossOp 0
  = 0`), WHEREAS the charge `chargeOp = crossOp u1` does NOT (`⁅imRep DJ, chargeOp⁆ ≠ 0`, N240) — the
  two U(1)s are GENUINELY DIFFERENT operators with different commutants (the TWIN of N252's charge
  direction: charge = crossOp of the colour-fixed singlet, hypercharge = crossOp of the isospin-fixed
  singlet; DUAL SYMMETRY charge↔colour, hypercharge↔isospin). `hyperOp ≠ 0` coordinate-free from the
  banked FAITHFUL embedding `crossEmb_injective` (N225, Born positivity). THE DISSOLUTION: the field
  POSITS `U(1)_Y` + CHOOSES its direction by a GUT embedding; the theory FORCES the direction — it IS
  `crossOp (κO 1)`, the unique isospin-commuting gather generator. SCOPE: banks the forced isospin-
  commuting DIRECTION + the twin asymmetry ONLY, NOT the mixing angle / normalization / Gell-Mann–
  Nishijima (numerically FALSE as a span relation here). The 1-dim so(7)-centralizer UNIQUENESS of the
  direction is numerically confirmed and CHILDED as a dedicated W1 node (still open under ★2). N256:
  THE UNIQUE ISOSPIN-FIXED AXIS — the CONVERSE that N255 left open, the vector-level TWIN of N252's
  unique colour-fixed axis. The joint kernel of weak isospin su(2)_L = {DI,DJ,DK} on the fundamental
  7 = `ImO` (`isospinInvariants`) is EXACTLY the 1-dim branching singlet `span{κO 1}`
  (`isospinInvariants_eq_span_kap`, `finrank = 1`): `κO 1` is the UNIQUE isospin-fixed direction, the
  charged complement carries none. The ⊆ crux uses the PAIR {DI,DJ} alone (`imRep DI = qI Imat` N253 +
  the new twin bridge `imRep DJ = qI Jmat`), forcing all coordinates but `c4` (the `κO 1 = e4` axis) to
  zero — a `linarith` on banked integer rows, no coordinate bash. The faithful embedding `crossEmb`
  (N225) sends it to `span{hyperOp}` (`map_crossEmb_isospinInvariants`), so `hyperOp = crossOp (κO 1)`
  is the UNIQUE up-to-scale isospin-commuting gather generator — grounding N255's forced EXISTENCE with
  UNIQUENESS. THE TWIN DUALITY (with N252): each forced U(1) direction is the gather cross-product of
  the OTHER factor's unique fixed axis, and the two fixed axes `span{κO 1}` and `span{u1}` are DIFFERENT
  lines. SCOPE: banks the forced UNIQUE isospin-fixed DIRECTION + operator uniqueness within the
  faithful embedded 7 ONLY, NOT the mixing angle / normalization, NOT the full so(7)-operator-centralizer
  uniqueness over the 14-dim g₂ (still open under ★2). N257: THE GATHER ISOMETRY — the ONE cause the
  per-operator lengths N253/N255/N256 are shadows of. The gather embedding `crossEmb : ImO →ₗ End ℚ ImO`
  (N225, faithful from Born positivity) is a SCALED ISOMETRY from the fold's Born self-overlap form
  `gForm` to the so(7) trace form `traceForm7`: `traceForm7 (crossOp ↑a)(crossOp ↑b) = -6 · gForm ↑a ↑b`
  for ALL `a b : ImO` (`gather_isometry`, `crossEmb^* B = −6·gForm`; scale −6 FORCED, Schur uniqueness of
  the invariant form on the g₂-irreducible 7). The whole neutral-sector Gram COLLAPSES as ONE consequence:
  `B_chargeOp_chargeOp_via_isometry = -6` (re-derives N253's charge length as the `a=b=u1` instance),
  `B_hyperOp_hyperOp = -6` (hyperOp's length EQUALS chargeOp's — equinormalized), `B_chargeOp_hyperOp = 0`
  (the two forced U(1)s trace-ORTHOGONAL) — charge and hypercharge an ORTHONORMAL pair forced by the fold
  metric, not chosen. THE DISSOLUTION: the field POSITS the hypercharge normalization by choosing a GUT
  embedding + invariant tower; the theory reads the whole neutral-sector geometry off the fold's own Born
  form in ONE identity — the normalization IS the pullback scale of the Born form under the gather
  embedding. SCOPE: banks the convention-free pullback SCALE (−6) + the collapsed neutral Gram (equal
  length + orthogonality) ONLY — NOT the physical weak mixing angle / couplings / Gell-Mann–Nishijima
  (numerically FALSE as a span here: `Q ∉ span{T3, Y}`, `[Q,Y] ≠ 0`); the mixing angle now deferred ≥7×
  for the SAME structural reason (the so(7) neutral plane supplies no posit-free richer structure to
  force it), a NAMED repeated-deferral signal (RUNBOOK) pending an owner call on the LOCK for a route-
  finding ascent to the richer structure the angle requires. N258: THE ELECTROWEAK REDUCTIVE LIE ALGEBRA
  su(2)_L ⊕ u(1)_Y as ONE LieSubalgebra of so(7) — the FIRST forward step of that named ascent. N253–N257
  pinned the Cartan pieces (directions, lengths, orthogonality) but never assembled the LIE-ALGEBRA
  object; this node does: semisimple `su(2)_L = isospinImg` (the isospin derivations {DI,DJ,DK} in the
  adjoint 14, pushed through the Lie hom `imRepL`) joined with the abelian central `u(1)_Y = hyperLine`
  (`hyperOp = crossOp (κO 1)` in the fundamental 7) is a genuine `LieSubalgebra ℚ (End ℚ ImO)`
  (`electroweakLie`) inside so(7), bracket-closed, u(1)_Y central (`hyperLine_central`), derived subalgebra
  = su(2)_L (`join_derived_le_isospinImg` — the reductive splitting), dim 4 = 3 + 1 (`electroweakLie_finrank`,
  the two summands meeting in ⊥ by `inter_eq_bot`). W8 sector-distinctness: the gather charge Q ∉ the
  electroweak factor (`chargeOp_not_mem_electroweakLie`, coordinate-free via `inter_eq_bot` + N257
  orthogonality). THE TWIN OF N247 with semisimple/central roles SWAPPED across the 14⊕7 tear — together
  with N247, BOTH SM reductive factors (u(1)_Q⊕su(3)_c and su(2)_L⊕u(1)_Y) are now derived Lie subalgebras
  of the single derived so(7), the same `inter_eq_bot` forcing them apart in complementary summands. THE
  DISSOLUTION: the field POSITS SU(2)×U(1) as an independent product group; the theory DERIVES it — both
  summands the two halves of ONE gather tear, direct-sum + centrality FORCED by `inter_eq_bot` (simplicity
  of Der O) and the isospin-fixedness of κO 1. SCOPE: the reductive Lie algebra + splitting + dim 4 +
  sector-distinctness teeth ONLY, NOT the mixing angle (still deferred, needs a structure larger than the
  neutral plane — the full electroweak Lie algebra built HERE IS that richer structure, WITHOUT positing
  the angle). N281: THE NAMED ★2 CLIMB BEGINS on the matter SPINOR (not the vector-7). The two-handed
  so(4) of N280 hands a RANK-2 neutral Cartan torus `{L_{u1}, R_{u1}}` (the fold-root's two regular faces)
  that COMMUTES on ALL of `O ℚ` (`flex_reg_commute`, via the FLEXIBLE law — the LAST identity surviving the
  cascade stop, where the cross-unit so(4) BREAKS off H). Its VECTOR face `foldVec = L_{u1}+R_{u1}` is
  supported entirely on the fold's own ℂ-core `span{1,u1}` (N266) and carries NO `ImO → ImO` content beyond
  the `u1`-axis the ADJOINT/vector-7 rep discards (`foldVec_imaginary_content_is_u1_axis`): the rank-2 spinor
  torus COLLAPSES to rank-1 on the vector-7. THIS IS THE STRUCTURAL CAUSE the ≥11×-deferred ceiling (N257,
  `Q ∉ span{T3,Y}`, `[Q,Y]≠0`) was missing — the second independent neutral generator lives on the fold's
  real-unit core, present on the SPINOR carrier, discarded by the adjoint rep. The wall was an artifact of
  asking on the too-small carrier; the matter spinor holds the second neutral direction. Colour centralizes
  BOTH faces (`colour_centralizes_both_faces`), so the whole neutral torus is colour-invariant. SCOPE: banks
  the flexibility-protected rank-2 neutral torus + its survival on O + the eigen-split + the rank-2→rank-1
  collapse (the ceiling's dissolution) + colour-centralizes-both ONLY, NOT the mixing-angle VALUE itself (the
  VALUE ceiling STANDS; a route-finding node is CHILDED — the torus is the richer DERIVED structure the value
  needs, the value not yet claimed, NOT circled)]**
  N284: THE ★2 AMBIENT (INPUT A) BUILT — the arena's Jordan-derivation Lie algebra `f₄` + the bundled
  faithful trace-skew embedding of the derived gauge `g₂`. N283 (route-finding) proved the mixing-angle
  VALUE un-forceable from the spinor torus and NAMED the required structure as INPUT A: a DERIVED single
  simple ambient with a UNIQUE invariant form. N284 builds it: the maximal matter arena's Jordan-
  derivation algebra `jDer` = `LieSubalgebra ℚ (Module.End ℚ (Matrix (Fin 3)(Fin 3)(O ℚ)))` (the f₄-
  ambient), into which the derived gauge `g₂ = derivationLieQ` embeds as a BUNDLED, FAITHFUL Lie hom
  `g2ToJDer : derivationLieQ →ₗ⁅ℚ⁆ jDer` (`g2ToJDer_injective`, via `slotA_inj`) landing SKEW-ADJOINT in
  the banked POSITIVE-DEFINITE trace form `jTraceForm` (`jActL_skew_jTraceForm`, the UNIQUE-FORM ANCHOR —
  the single simple ambient with a unique form the mixing front structurally requires). Picks up N269's
  un-bundled `g₂⊆f₄` LieHom + N274's deferred `f₄ = Der(J₃(O))` determination. THE DISSOLUTION: the field
  POSITS `F₄ = Aut(J₃(O))` + a GUT embedding to fix the hypercharge normalization; the theory DERIVES the
  ambient (Der of the derived arena) + its unique invariant form (the derived positive-definite jTraceForm).
  SCOPE: the f₄-ambient + the bundled FAITHFUL skew-adjoint g₂ embedding ONLY — NOT `f₄ ⊋ g₂` PROPERLY
  (the inner-derivation complement `innerMul ∈ jDer`, where the electroweak directions live, needs the
  linearized Jordan identity — CHILDED as the single successor), NOT the electroweak factors placed inside
  f₄, NOT the convention-free electroweak ratio / the mixing-angle VALUE (INPUT B, human-gated CHAIN
  RUNWAY, NOT invented)]**
- **★3 — One generation of matter.** The complete set of matter representations of a single family,
  with their quantum numbers, derived. **[partial — the genuine Clebsch–Gordan is CLOSED: the adjoint arena
  `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` is banked as a canonical internal g₂-equivariant direct sum (N233) and ALL FOUR
  atoms are proved IRREDUCIBLE (1 trivial; 7 via `no_proper_invariant_ImO`; 14 via `derivationLieQ_isSimpleOrder`;
  27 via the N234 CARTAN PIN + WALK certificate on the banked derivations — `tracelessSym_no_proper_invariant` +
  `fourSummands_irreducible`), PLUS the constructive Schur `commutant_scalar_on_tracelessSym`. The N235→N239
  FFT dissolution spiral is RETIRED (W5: the field's 2401-dim invariant-theory instrument fought; the trunk's own
  pin+walk closed it); its residual value — N235's invariant forms δ/φ/ψ, N236's `commutantG2` + lower bound,
  N237's Peirce reduction — remains banked, and the FFT count `dim End_{g₂}(7⊗7) = 4` now closes as a SHORT
  Schur corollary of atomicity (the decided next brick).
  N261: THE SPINOR FOUNDATION — the derived terminal algebra `O ℚ` is itself a CLIFFORD MODULE (a spinor)
  for the fold's Born form. The gather's own inner-world map (the left-regular action `leftReg a = L_a =
  (a·)`, N44/N218T), assembled as `leftReg : ImO →ₗ End ℚ (O ℚ)`, satisfies the CLIFFORD anticommutation
  relation `(leftReg a)∘(leftReg b) + (leftReg b)∘(leftReg a) = -(2·gForm a b)•id` (`leftReg_clifford`),
  diagonal `(leftReg a)² = -(gForm a a)•id` (`leftReg_sq`), with orthonormal-frame teeth `{L_i,L_i}=-2•id≠0`,
  `{L_i,L_j}=0` (i≠j). THE DISSOLUTION: the gluing obstruction (N219 associator) lives entirely in the
  ANTISYMMETRIC part of worldMap composition; the SYMMETRIC part is forced by the fold metric alone (via
  left-alternativity `mul_mul_left`, N5b) = the Clifford relation — so the spinor is not IMPORTED (as the
  field bolts a separate Dirac apparatus on) but is the gather obstruction READ SYMMETRICALLY. ONE CAUSE: the
  SAME octonion alternativity that stops the cascade (N2c), blocks a second chirality (N44), and caps
  generations here promotes the failed worldMap representation to a spinor representation. SCOPE: banks the
  Clifford relation + `O ℚ`-as-Clifford-module ONLY, NOT the full `Cl(0,7)` iso / `Spin(7)` / the
  identification with a specific SM multiplet (downstream).
  N262: THE SPIN GENERATORS — the antisymmetric part of the SAME gather worldMap composition IS the
  spin/rotation generator of the spinor. N261 mined the SYMMETRIC half (`{L_a,L_b}`, the Clifford
  relation); N262 mines the ANTISYMMETRIC half `spinGen a b := L_a·L_b − L_b·L_a` (= `[L_a,L_b]` = the
  gather gluing obstruction, N219). It acts on the Clifford generators `{L_c} ≅ ImO` (the fundamental
  7) as the elementary so(7) rotation (`spinGen_act`: `[S_ab,L_c] = 4gForm(a,c)L_b − 4gForm(b,c)L_a`),
  and the spin generators CLOSE into a Lie algebra (`spinGen_bracket`: `[S_ab,S_cd] = 4gForm(a,c)S_bd
  − 4gForm(b,c)S_ad − 4gForm(a,d)S_bc + 4gForm(b,d)S_ac`, the so(V) structure relation), with W8
  non-vacuity `spinGen_frame_ne_zero` (a frame `S_ij` genuinely rotates a third frame vector, ≠ 0),
  all closed by `noncomm_ring` over the banked Clifford anticommutators + `module` (NO coordinate
  bash). THE DISSOLUTION: the field IMPORTS an external Clifford `Cl(V,q)` + bivector `so(V)`; the
  theory reads the "gamma matrices" as the fold worldMap `L_a`, the "bivectors" as the antisymmetric
  composition part = the obstruction, "bivectors rotate/close" as the ONE derivation from the banked
  Clifford relation. ONE CAUSE: the same octonion alternativity that forces the Clifford relation
  (N261) makes the antisymmetric part a genuine rotation generator — the obstruction to gluing worlds
  IS the rotational symmetry acting on matter. And this so(7) is the SAME so(7) the gather TEAR built
  for gauge (N225–N260): one so(7), two faces — the gauge tear and the spinor rotation. SCOPE: banks
  the spin generator + rotation action + so(7) closure + non-vacuity ONLY, NOT `Cl(0,7)` iso /
  `Spin(7)` / the specific SM multiplet (downstream).
  N263: THE TWO FACES OF so(7) ARE ONE — the "one so(7), two faces" asserted by N262 (and here in
  ★1/★3) is now a PROVED theorem, not prose. The gauge TEAR so(7) (`skewAdjointLieSubalgebra bornBil`
  on the vector 7 `ImO`, N225–N260) and the SPINOR-rotation so(7) (the spin generators `spinGen` close
  into, on the 8-dim spinor `O ℚ`, N262) are ONE so(7) in its two natural representations. Since
  `leftReg` is INJECTIVE (`leftReg_injective`), the "gamma" frame `{L_c}` is a FAITHFUL copy of the 7;
  the elementary so(V) vector rotation `elemRot a b : c ↦ (gForm a c)•b − (gForm b c)•a` lies in the
  BANKED gauge so(7) (`elemRot_skew`: `elemRot a b ∈ skewAdjointLieSubalgebra bornBil`); THE BRIDGE
  `spinGen_vector_action`: `[spinGen a b, leftReg c] = leftReg (4•elemRot a b c)` — the spinor spin
  generator's ad-action on the faithful frame IS `leftReg` of that gauge-so(7) rotation; `elemRot`
  closes by the SAME so(V) structure relation as `spinGen` (`elemRot_bracket`); W8 `elemRot_frame_ne_zero`;
  capstone `two_faces_of_so7`. THE DISSOLUTION: the field builds `so(V)` on V, SEPARATELY builds
  `Cl(V,q)`, extracts the bivectors `Λ²V`, proves the EXTERNAL iso `Λ²V ≅ so(V)`, and acts on the
  spinor — a bridge between two apparatuses. The theory reads it off the ONE Born form `gForm`
  (`bornBil x y = gForm x y`): the vector so(7) and the spinor bivectors are two readings of the SAME
  object, and "bivector ≅ so(V) rotation" is `spinGen_act` composed with `leftReg`-injectivity — NO
  Clifford import, NO external iso. The deepest joint on the ★1↔★3 seam. SCOPE: banks the action-level
  identification (the spin generator acts on the faithful 7 as a gauge rotation) + elemRot ∈ gauge
  so(7) + same so(V) closure + faithfulness + non-vacuity ONLY, NOT a bundled cross-dimensional
  LieAlgebra iso (spinor rep on 8 vs vector rep on 7), NOT `Spin(7)`, NOT `Cl(0,7)` (downstream).
  N264: THE SPINOR IS INTRINSICALLY TWO-HANDED (the chirality germ) — N261–263 built the spinor using
  ONLY the LEFT worldMap face (`leftReg = L_a`); this node completes the object the fold actually makes.
  The RIGHT worldMap face `rightReg a = R_a = (·a)` is EQUALLY a Clifford module for the ONE fold Born
  form (`rightReg_clifford`: `{R_a, R_b} = −(2·gForm a b)•id`, the exact MIRROR of N261's
  `leftReg_clifford`, via right-alternativity `mul_mul_right`), so BOTH worldMap faces are spinor
  structures. The mixed commutator of the two faces IS the associator (`chir_mixed_apply`:
  `(L_a R_b − R_b L_a)x = a·(x·b) − (a·x)·b`), so the two chiralities do NOT all commute on the
  imaginary generators (`chir_spinor_block`, with a CONCRETE IMAGINARY witness `ι(ιJ), e₂ ∈ ImO`) —
  the octonionic non-associativity FORBIDS fusing them. And the block ⟺ the order-4 Hermitian-Jordan
  generation-cap failure (`chir_spinor_block_iff_jordan_cap`) — ONE CAUSE (the SAME non-associativity
  as the cascade-stop, generation-cap, and N44's block), now lifted to the derived spinor as the germ
  of chirality. THE DISSOLUTION: the field POSITS two chiralities (left/right Weyl) + parity violation
  as empirical inputs; the theory DERIVES the two-ness + non-fusion from ONE worldMap with two
  multiplication faces, both Clifford modules, non-fusable by non-associativity. SCOPE: banks the
  structural GERM (two irreducibly-distinct handednesses, forced) ONLY, NOT parity violation, NOT a
  `ℤ₂` Weyl-grading `O = O⁺ ⊕ O⁻`, NOT `Spin(7)`/`Cl(0,7)` (downstream).
  N265: MATTER IS ONE INDIVISIBLE WHOLE, AND ITS INDIVISIBILITY IS THE CASCADE STOP — the deepest fact
  about matter itself. The derived matter carrier `O ℚ` is IRREDUCIBLE under the fold's own worldMap
  `leftReg` (`worldMap_irreducible`: the only worldMap-invariant subspaces are `⊥` and `⊤`);
  equivalently `O ℚ` has NO ZERO DIVISORS (`octNoZeroDivisors`, read off the banked Born composition
  law `gForm_comp` + ℚ-anisotropy `gForm_self_eq_zero`) and every nonzero standpoint's worldMap is
  INJECTIVE (`worldMap_injective`, world-completeness — each fold standpoint opens a COMPLETE inner
  world). And this indivisibility IS the cascade stop: `division_boundary` (no zero divisors at O ∧
  zero divisors at S ℚ, banked `has_zero_divisor`) is the EXACT MIRROR of the banked
  `forced_stop_boundary` — a ★3↔★15 joint. THE DISSOLUTION: the field CHOOSES matter to be an
  irreducible rep (irreducibility an INPUT); the theory proves matter's indivisibility IS the
  multiplicativity boundary that stops the cascade — one cause across matter (★3) and the terminal
  stop (★15). SCOPE: banks indivisibility + no-zero-divisors + world-completeness + the boundary joint
  + non-vacuity ONLY, NOT a Mathlib `IsDomain` instance, NOT the specific SM multiplet, NOT parity.
  N266: THE COLOUR-NEUTRAL CORE OF THE MATTER CARRIER IS THE FOLD'S OWN COMPLEX LINE — the first
  statement on the full 8-dim matter carrier (N42c/N245/N252 all lived on the vector 7 = `ImO`). The
  DERIVED colour subalgebra `colourCentralizer` (the g₂-stabilizer of the fold's √−1 `JO = L_{u1}`,
  N201) acts on `O ℚ` (N265) with joint kernel `matterColourNeutral` EXACTLY `span{1, u1}`
  (`matterColourNeutral_eq_span_one_u1`) — the fold's OWN complex line ℂ: dimension 2
  (`finrank_matterColourNeutral`, W8 — a genuine PLANE, adjoining the real unit to the vector-7
  singlet `span{u1}`), CLOSED under multiplication via `u1² = −1` (`span_one_u1_mul_mem`, the fold's ℂ
  SUBALGEBRA), and disjoint from the charged complement `Vsub = 3 ⊕ 3̄` (`neutral_disj_Vsub`). So
  `O ℚ = ℂ ⊕ (3 ⊕ 3̄)` as colour-modules: colour is BLIND to precisely the fold's generative √−1 and
  unit, and charges everything else. THE DISSOLUTION / MOAT: Furey IMPOSES ℂ⊗O and CHOOSES SU(3) as
  the stabilizer of a chosen complex structure; the theory DERIVES both — `span{1,u1}` FALLS OUT as
  the colour-neutral core and IS the fold's own √−1, colour IS the g₂-stabilizer of that same √−1.
  ONE CAUSE MANY TERMINATIONS: the same fold-root `u1` is the first cascade step's complex unit, the
  colour complex structure, the axis whose g₂-stabilizer is colour, AND the generator of the carrier's
  colour-invisible core. NOVELTY claimed ONLY for the forced fold-derivation, NOT the `1 ⊕ 3 ⊕ 3̄`
  pattern. SCOPE: the carrier's colour-decomposition + the neutral-core-IS-the-fold's-ℂ identification
  + the `Vsub` direct sum ONLY, NOT the charge VALUES per multiplet, NOT the full SM classification,
  NOT parity.
  N271: THE JOINT COLOUR∧ISOSPIN NEUTRAL-CORE DECOMPOSITION OF THE MATTER CARRIER — the climax of the
  matter turn. N266 gave the COLOUR-neutral core of the full carrier (`span{1,u1}`); isospin had only
  been on the vector-7 `ImO` (N256, `span{κO1}`). This node puts isospin onto the FULL carrier (the
  exact N266 twin: `matterIsospinNeutral = ⨅{DI,DJ,DK} ker = span{1, κO1}`,
  `matterIsospinNeutral_eq_span_one_kap`, dim 2) and takes the JOINT: the doubly-neutral core —
  invisible to BOTH derived symmetries — is EXACTLY the fold's scalar unit line
  `matterColourNeutral ⊓ matterIsospinNeutral = span{1}` (`matter_joint_neutral_eq_span_one`,
  `finrank = 1`, W8). The two 2-dim cores are DISTINCT (`u1 ∉ span{1,κO1}`, `κO1 ∉ span{1,u1}`) — the
  grading MISALIGNMENT on the full carrier, the lift of N254's `ImO`-level misalignment. THE
  DISSOLUTION/MOAT: the SM ASSIGNS (colour,isospin,hyper) quantum numbers by hand and encodes the
  U(1)-neutral misalignment as the convention `Q=T₃+Y/2`; the theory DERIVES the neutral cores as
  joint-kernels, FORCES the doubly-neutral core = the fold's scalar unit, and reads the misalignment
  off two distinct fold-directions (`u1` vs `κO1`). ONE CAUSE: the same fold-root `u1` (cascade √−1,
  colour complex structure, colour-neutral carrier direction) and the same branching singlet `κO1`
  (isospin-fixed vector-7 direction, isospin-neutral carrier direction) are DIFFERENT fold-directions,
  so the doubly-neutral core collapses to the pure scalar unit — the piece the fold makes before
  either symmetry can act. NOVELTY claimed ONLY for the forced neutral-core decomposition + the
  misalignment joint, NOT "= a specific SM multiplet" (removable prose). SCOPE: the isospin-neutral
  core + the joint doubly-neutral core = `span{1}` + the two cores' distinctness/dimensions ONLY, NOT
  the charge/hypercharge VALUES per multiplet, NOT the electroweak su(2)_L Lie action on the carrier,
  NOT the mixing angle (★2), NOT masses/mixings (★5), NOT parity.
  N276: THE JOINT (CHARGE, WEAK-ISOSPIN-CARTAN) WEIGHT DECOMPOSITION OF ONE GENERATION'S FUNDAMENTAL
  MATTER — the charged complement's DERIVED quantum-number grading (N254 built only the neutral
  kernel). Under the two BANKED COMMUTING derived operators `Q = chargeOp` (the gather tear on the
  fold-root `u1`, N240) and `T3 = imRep DI` (the doubling weak-isospin Cartan, N202), which COMMUTE
  (N254 `charge_isospin_commute`), the fundamental 7 `ImO` decomposes into JOINT INVARIANT SUBSPACES
  `ImO = span{sgl} ⊕ Winert ⊕ Wactive` (finranks 1 ⊕ 2 ⊕ 4): `Winert = span{e4O,e5O}` is CHARGED
  (`chargeOp` a complex structure `e4↦e5`, `e5↦−e4`, `Q²=−1`) but isospin-Cartan-INERT (`imRep DI`
  kills both `e4O,e5O`), and `Wactive = span{e2O,e3O,e6O,e7O}` is the T3-ACTIVE block
  (`imRep DI e2O = 2•e3O ≠ 0`). The charged 6-space `Vsub = 3 ⊕ 3̄` (N42c) SPLITS `2 ⊕ 4`
  (`Winert_sup_Wactive_eq_Vsub`), and the isospin-inert block STRADDLES both colour halves
  (`e4O ∈ Uhol`, `e5O ∉ Uhol` — `e5O ∈ Uah`): the derived isospin-Cartan grading is TRANSVERSE to the
  derived colour `3 ⊕ 3̄` grading (N266), not a refinement. THE DISSOLUTION/MOAT: the SM ASSIGNS each
  fermion component `(T3,Y,Q)` from the hypercharge table by hand; the theory DERIVES the joint weight
  blocks as the JOINT INVARIANT SUBSPACES of two fold-forced operators that COMMUTE (N254) — the
  quantum numbers fall out as joint eigenspaces, the `Q=T3+Y/2` misalignment a derived transversality.
  ONE CAUSE: the same fold-root `u1` seeds the charge (N240), the neutral core (N254), and the colour
  complex structure (N266); the doubling seeds the isospin Cartan (N189). NOT banked: the hypercharge
  NORMALIZATION / mixing angle (★2), the full su(2) Casimir irrep refinement of `Wactive` (downstream
  ascent), the ★5 texture (PROVED un-forceable from the arena, N275), masses/mixings, parity, or
  "= a specific SM multiplet" (removable prose).
  N277: THE FULL NON-ABELIAN WEAK-ISOSPIN (su(2)_L) MULTIPLET DECOMPOSITION OF ONE GENERATION'S
  FUNDAMENTAL MATTER = THE CAYLEY–DICKSON DOUBLING TEAR — the non-abelian completion N276's abelian
  Cartan could not give. N276 gave the (Q, T3-CARTAN) weights `1 ⊕ 2 ⊕ 4` using only the abelian
  `imRep DI`; N277 uses the FULL `su(2)_L = {imRep DI, imRep DJ, imRep DK}` (closure `⁅DI,DJ⁆=2•DK`)
  and decomposes the fundamental 7 into THREE su(2)_L-submodules `ImO = TL ⊕ Sg ⊕ TR = 3 ⊕ 1 ⊕ 3`:
  the un-doubled imaginary triplet `TL = ImH` (Casimir `casimirOp = (-8)•id`, NO su(2)_L-fixed vector
  — a NONTRIVIAL multiplet), the su(2)_L-FIXED doubling axis `Sg = span{κO1}` (Casimir `0`, N256), and
  the doubled triplet `TR = ℓ·ImH`. ★ THE REFRAME: this su(2)_L decomposition IS the CAYLEY–DICKSON
  DOUBLING TEAR `ImO = ImH ⊕ ⟨ℓ⟩ ⊕ ℓ·ImH` that BUILT the terminal algebra `O = CD(H)` — su(2)_L IS
  `Der(H)`, the two irreducible triplets ARE the un-doubled/doubled worlds, the fixed singlet IS the
  doubling axis `ℓ = κO1`. The multiplet grading is TRANSVERSE to BOTH N276's abelian Cartan blocks
  (`Winert` SPLITS `Sg ⊕ TR`) and the colour `1 ⊕ 3 ⊕ 3̄` split (N266: `TL` straddles `span{u1}`,
  `Uhol`, `Uah`) — a THIRD independent, fold-derived grading. THE DISSOLUTION/MOAT: the SM ASSIGNS the
  weak-isospin multiplets (which fields are doublets, which singlets) by hand; the theory DERIVES them
  as the CD doubling pieces, FORCED by `O = CD(H)`. ONE CAUSE MANY TERMINATIONS: the LAST doubling
  `O = H ⊕ Hℓ` that stops the cascade (N2c) is the SAME doubling whose `Der(H) = su(2)_L` grades the
  matter into its weak-isospin multiplets.
  N278: THE FORCED HYPERCHARGE OPERATOR IS THE CAYLEY–DICKSON DOUBLING INTERTWINER THAT IDENTIFIES
  THE TWO WEAK-ISOSPIN WORLDS — N277 left the reframe "the two triplets ARE the un-doubled/doubled
  worlds, related by the doubling `ℓ·(−)`" as PROSE; N278 proves the MAP that realizes it, and
  identifies it with the banked forced hypercharge `hyperOp = crossOp (κO 1)` (N255). On N277's
  multiplet decomposition `ImO = TL ⊕ Sg ⊕ TR = 3 ⊕ 1 ⊕ 3`, `hyperOp` SWAPS the two triplets
  (`TL_map_hyperOp_eq_TR : TL.map hyperOp = TR`, `TR_map_hyperOp_eq_TL`), KILLS the su(2)_L-fixed
  doubling axis `Sg` (`hyperOp_e4I = 0`, `octCross_self`), is a COMPLEX STRUCTURE on the charged
  sector (`hyperOp_sq_coe : hyperOp²(y) = ⟨κO1,y⟩•κO1 − y`, the `octCross_contraction` twin of N240;
  `= −1` on `TL ⊔ TR`, `= 0` on `Sg`), and — being su(2)_L-equivariant (N255) — induces a genuine
  su(2)_L-MODULE ISOMORPHISM `TL ≃ₗ[ℚ] TR` (`hyperEquivTLTR`, inverse `−hyperTR`): the two triplets
  are ONE representation, doubled. THE REFRAME: on the triplets `hyperOp` IS left-multiplication by
  `ℓ = κO 1` (`octCross (κO1) y = κO1·y` for `y ⟂ κO1`, correction vanishing), so `TR = ℓ·ImH` is
  literally the image of `TL = ImH` under the cascade-stop doubling. THE DISSOLUTION/MOAT: the field
  POSITS U(1)_Y + CHOOSES its embedding + SEPARATELY asserts the "doubled multiplet" structure; the
  theory DISSOLVES all three at once — the intertwiner is `octCross (κO 1)`, ALREADY banked-forced as
  the hypercharge (N255), and the doubled world is literally `ℓ·ImH`. ONE CAUSE MANY TERMINATIONS:
  the LAST doubling `O = H ⊕ Hℓ` (stops the cascade, N2c) supplies THREE faces of ONE operator —
  `su(2)_L = Der(H)` grading matter (N277), the map `ℓ·(−)` identifying `TL ≅ TR` (N278), and the
  forced hypercharge `hyperOp` (N255). W8: the swap is genuine (`hyperOp u1M = -e5I ≠ 0`, not the
  identity on `TL`). The ★3↔cascade-stop↔electroweak joint. NOT banked: the ★2 hypercharge
  NORMALIZATION / mixing angle (ceiling STANDS, nothing childed toward it, no coupling ratio
  appears), Gell-Mann–Nishijima (WALLED N255/N257), the FULL Burnside irreducibility (downstream),
  the ★5 texture, masses/mixings, parity, "= a specific SM multiplet" (removable prose).
  N279: THE WEAK-ISOSPIN FUNDAMENTAL DOUBLET OF MATTER IS THE LEFT-REGULAR QUATERNION ACTION ON THE
  SPINOR, CONFINED TO THE LAST ASSOCIATIVE RUNG BY THE CASCADE-STOPPING ASSOCIATOR — N277 gave
  `su(2)_L = Der(H)` on the ADJOINT / vector-7 `ImO` (TRIPLETS `3 ⊕ 1 ⊕ 3`, Casimir `-8`); but SM
  matter fermions sit in weak-isospin DOUBLETS (the FUNDAMENTAL spin-½ rep), and matter in this chain
  IS the derived SPINOR carrier `O ℚ` (N261–265). N279 puts the weak-isospin onto the actual matter
  spinor as a FUNDAMENTAL doublet: the LEFT-REGULAR multiplication `leftReg a = (a·−)` by the imaginary
  units of the last-doubled quaternion subalgebra `H ⊂ O`. The generic obstruction identity
  (`leftmul_comm_obstruction`, coordinate-free from `assoc_swap12`): `a*(b*y) − b*(a*y) − (a*b−b*a)*y
  = -2•assoc a b y` — the left-regular commutator's failure to be the left-regular of the algebra
  commutator IS (twice) the banked associator. On the associative rung `H` (associator vanishing via
  `CD.iota_assoc_iff`) the units CLOSE (`leftReg_closure_on_H_IJ : ⁅L_hI,L_hJ⁆ = 2•L_hK`) with the
  FUNDAMENTAL DOUBLET Casimir `(L_hI²+L_hJ²+L_hK²) = -3•id` on the whole spinor
  (`leftReg_casimir_eq_neg_three`, spin-½ certificate, contrast N277's adjoint `-8`); on the full
  non-associative `O ℚ` the su(2) does NOT close (`leftReg_comm_obstructed`, W8 defect `-4•e7O` at
  `e4O`), the defect being `-2•` the banked associator (`leftReg_defect_eq_associator`). THE
  DISSOLUTION/MOAT: the field POSITS which fermions are left-handed doublets + takes the fundamental
  2-rep as chosen; the theory DERIVES the doublet as the forced left-regular action AND its confinement
  (why it doesn't extend) as the SAME associator that stops the cascade. ONE CAUSE MANY TERMINATIONS:
  the SAME octonion non-associativity that stops the cascade (N2c/★15), caps generations at 3 (N5/★4),
  and blocks the second chirality (N264/★6) CONFINES the fundamental weak doublet to the last
  associative rung `H`. The ★3↔cascade-stop↔★6 joint. NOT banked: the ★2 hypercharge NORMALIZATION /
  mixing angle (ceiling STANDS, `Q ∉ span{T3,Y}`, `[Q,Y]≠0` on the vector-7, nothing childed toward
  it), the full electroweak `su(2)⊕u(1)` on the carrier (a different, adjoint front), parity VIOLATION
  (which hand couples — ★6 stays a germ), masses/mixings (★5), "= a specific SM multiplet" (removable
  prose).]**
- **★4 — Family replication.** The count and structure of the repeated matter generations. **[partial —
  N267: the FIRST result reaching this star (the COUNT). The maximal Hermitian octonionic Jordan order is
  3 (order 3 Jordan, order 4 NOT — banked cap N5 `jordan_cap_pinned_at_three`/`jordan_fails_H4`), and at
  that maximal order the general self-adjoint element `Hm` decomposes as a real diagonal ⊕ EXACTLY THREE
  position-disjoint, injective, ℚ-linear copies of the DERIVED matter carrier `O ℚ` (N261–266):
  `Hm = Dg + slotA a + slotB b + slotC c`, dim `3 + 3·8 = 27` (`Hm_slot_decomp`, `matter_multiplicity_three`).
  The three-fold multiplicity is `C(3,2)` at the maximal order, and that maximal order is FORCED to be 3
  by the cascade-stop non-associativity (`H₄` is not Jordan). ONE CAUSE MANY TERMINATIONS: the same
  octonion non-associativity that stops the cascade (★15), caps the Jordan tower (N5), makes matter
  indivisible (★3, N265) and two-handed (★6, N264) forces the maximal observable Jordan arena to carry
  exactly THREE matter-carrier copies.
  N268: THE STRUCTURE of the three copies (the ★1↔★4 joint) — FAMILY UNIVERSALITY FORCED. The derived
  gauge `Der(O ℚ) = g₂` (N6; contains the banked colour su(3) N201 + electroweak factors N258) acts on
  the maximal matter arena `J₃(O ℚ)` ENTRYWISE (`jAct D M := M.map (D·)`) BY JORDAN-ALGEBRA DERIVATIONS
  (`jAct_jb` — a genuine symmetry of the arena, from the matrix Leibniz law `jAct_mul`), fixes the real
  diagonal (`jAct_Dg = 0`), and carries each of the three matter-carrier slots (N267) by the IDENTICAL
  rule `jAct D (slotX v) = slotX (D v)` (`jAct_slotA/B/C`) — so the three cap-forced copies are mutually
  isomorphic gauge-modules, each ≅ the ONE g₂-IRREDUCIBLE fundamental (N234 `no_proper_invariant_ImO`).
  Family universality (identical gauge transformation across the three copies) is FORCED by the entrywise
  structure, not posited; the count 3 is cap-forced. THE DISSOLUTION: the field POSITS universality
  (identical quantum numbers, an empirical input) + a separate symmetry-BREAKING (Yukawa/mixing) sector;
  the theory FORCES universality (the three copies ARE the three octonion slots of the ONE arena, carried
  by the ONE entrywise gauge identically) AND, in the SAME structure, NAMES the ★2/★5 blocker — the arena
  has EXACT family symmetry (the un-broken S₃ frame permutation + identical gauge action), precisely why
  the mixing-angle `T₃`-split cannot be forced here (N217 frontier) and why the mass/mixing texture
  requires BREAKING it. NOVELTY claimed ONLY for the forced universality + the cap-forced-3 ×
  irreducible-fundamental joint, NOT for "= three physical generations with identical SM quantum numbers"
  (removable prose). NOT banked: the masses/mixings of the three (★5), which "3" maps to physical
  families, a bundled cross-module gauge-module isomorphism.
  N269: THE DERIVED GAUGE PRESERVES THE ARENA'S OBSERVABLE SPECTRUM (the ★1↔★4 deepening). The derived
  gauge — both the Lie algebra `Der(O ℚ) = g₂` (infinitesimally) and the group `Aut(O ℚ) = g₂`
  (`IsAlgAut`, finitely) — acting entrywise on `J₃(O ℚ)` (diagonal fixed) PRESERVES the arena's
  intrinsic SPECTRAL INVARIANTS: the CUBIC NORM `jN` (Freudenthal reduced determinant, N215;
  `jN_aut_invariant` exact, `jN_first_variation_zero` infinitesimal), the QUADRATIC SPUR `jS` (N216),
  and the whole GENERIC CHARACTERISTIC POLYNOMIAL `jN_charpoly` (N216) = the eigenvalue SPECTRUM
  (`jN_charpoly_aut_invariant`). So the observable spectrum/eigenvalues are gauge-invariant — the FIRST
  inclusion of the derived gauge into the arena's EXCEPTIONAL Jordan-automorphism structure
  (`g₂ ⊆ f₄ = Der(J₃(O))`, at the level of the defining invariants). MECHANISM (trunk, no coordinate
  bash): each `|v|²` term preserved by `aut_gForm`/`gFormQ_skew` (Born norm-preservation/skewness); the
  trilinear cross-term by multiplicativity + `aut_star`/`aut_reQ` (finite) or Leibniz + `reQ∘D=0`
  (infinitesimal). THE DISSOLUTION/MOAT: the field POSITS `J₃(O)` + writes its determinant by hand +
  INVOKES `F₄=Aut(J₃(O))` preserving it (gauge-invariance of the spectrum ASSUMED as "observable"); the
  theory DERIVES the arena (N5/N267), the cubic norm (N215) + its octonion-specific well-definedness,
  the gauge = g₂ (N6), and now that the gauge PRESERVES the spectrum. FREE-FLOATING grounding: the
  invariance mechanism is generic to composition-algebra derivations/automorphisms (DEMOTED to
  supporting ingredient); the octonion-SPECIFIC anchor is that `jN` is well-defined ONLY up to O
  (`jN_cross_assoc` = octonion trace-associativity, FALSE at sedenions N200 — over a generic ring
  there is nothing to preserve), the gauge is g₂ (Der(ℂ)=0, Der(ℍ)=su(2)≠g₂), the arena cap-forced at 3
  (N267); the capstone TYPE carries `jN_cross_assoc`, NOT carrier-agnostic. NOVELTY claimed ONLY for the
  forced invariance + the octonion-specific well-definedness joint, NOT for "eigenvalues = physical
  masses / spectrum = observed quantum numbers" (removable prose). W8: `jN 0 0 0 1 1 1 = 2 ≠ 0` (a
  genuine nonzero spectrum preserved) + `witnessDerivQ ≠ 0`. NOT banked: eigenvalues=masses (★5), the
  mixing angle (★2), the full f₄=Der(J₃(O)) determination, a bundled g₂⊆f₄ LieHom object.
  N270: THE OBSERVABLE ARENA IS FORMALLY REAL (the ★4↔★12 joint, grounding N269's spectrum as REAL).
  The fold's Born self-overlap POSITIVITY (`gForm` ℚ-anisotropy, a TRUNK PRIMITIVE) lifted to
  `J₃(O ℚ)` makes its banked Cartan–Killing trace form `jTraceForm` (N214) POSITIVE-DEFINITE: the real
  trace-square `jQ (Hm d0 d1 d2 a b c) = d0²+d1²+d2²+2·(gForm a a+gForm b b+gForm c c)` is a sum of
  ℚ-squares (`jQ_Hm`), `≥ 0` (`jQ_Hm_nonneg`), `= 0 ↔ A = 0` (`jQ_Hm_eq_zero_iff`, via the fold
  anisotropy `gForm_self_eq_zero`); tied to the banked metric by `reQ (jTraceForm A A) = 2·jQ A`
  (`reQ_jTraceForm_self`), so `jTraceForm_Hm_posdef`. `J₃(O ℚ)` is thus a FORMALLY-REAL (Euclidean)
  Jordan algebra — WHY N269's gauge-invariant char-poly spectrum is a genuine REAL observable
  spectrum. Octonion-anchored: formal reality holds AT the cap-forced MAXIMAL order 3 (order 4 NOT
  even Jordan, `jordan_fails_H4`), the capstone `arena_formally_real` carrying
  `jordan_cap_pinned_at_three` (NOT carrier-agnostic). ONE CAUSE: the same fold positivity that
  makes `O ℚ` a division algebra / matter indivisible (N265), `Der(O ℚ)` compact = g₂, the frame
  orthonormal (N257), now makes the observable arena formally real. THE MOAT: Jordan–von
  Neumann–Wigner POSIT formal reality as the founding axiom; the theory DERIVES it. NOVELTY ONLY for
  the forced positivity + cap-maximality joint, NOT "real eigenvalues ARE masses/charges" (removable
  prose). NOT banked: the full spectral theorem / char-poly roots literally real (downstream), the
  masses/mixings (★5).
  N273: THE DERIVED FAMILY SYMMETRY AS AN ACTING OBJECT — the ★4 forward beat that BUILDS the S₃
  named-but-unbuilt in N268/N272 docstrings as the ★2/★5 blocker. The family action
  `framePerm σ M := M.submatrix σ σ` (the `C(3,2)=3`-position relabeling S₃ of the arena) is a
  group action, a Jordan-bracket automorphism (`framePerm_jb`), and COMMUTES with the derived gauge
  `jAct` (`framePerm_jAct`, by `rfl` — FLAVOUR ⊥ GAUGE, a genuine SEPARATE symmetry, not gauge
  redundancy), permuting the three cap-forced slots. THE OCTONION HEADLINE: the family symmetry
  carries the N272 coupling law by PRODUCT-REVERSAL (`framePerm_swap12_coupling`:
  `framePerm (swap 1 2)(jb (slotA a)(slotB b)) = slotC (star b * a)` vs the un-permuted
  `slotC (star a * b)`); the two DIFFER (`coupling_orbit_reverses`, witnessed at `a=1,b=u1`) because
  `O ℚ` is NON-commutative — the algebra's non-commutativity surfacing in the discrete family
  action, blind over a commutative rung. S₃ is MAXIMAL because the Jordan order is cap-forced at 3
  (capstone TYPE carries `jordan_cap_pinned_at_three`). Banked EXACT/UNBROKEN — the correct non-posit
  statement of the structural ceiling; the ★5 texture-BREAKING is downstream and this node BUILDS the
  symmetry it will break. THE MOAT: the SM POSITS a flavour group + a Yukawa spurion that breaks it;
  the theory posits NEITHER — the family symmetry IS the derived arena's position-permutation
  symmetry, cap-bounded at S₃. NOT banked: the ★5 texture, masses/mixings, the mixing angle (★2),
  parity.]**
- **★5 — The mixing & mass texture.** The inter-generation mixing and the mass-ratio structure, as
  relations rather than free parameters. **[partial — N272: the FIRST result reaching this star (the
  FORCED inter-generation COUPLING). The maximal matter arena `J₃(O ℚ)` carries exactly 3 cap-forced
  matter-carrier copies (N267) on which the derived gauge acts IDENTICALLY and family-symmetry-BLIND
  (N268 `jAct`, per-slot/diagonal). N272 banks the ONLY derived structure that is NOT blind: the
  arena's OWN symmetric (Jordan) product `jb` WEAVES two distinct generations into the third, carried
  by an octonion product — `jb (slotA a)(slotB b) = slotC (star a * b)` cyclically
  (`jb_slotA_slotB`/`jb_slotB_slotC`/`jb_slotC_slotA`, closing a triangle A→B→C→A). The coupling is
  division-valued (`coupling_ne_zero`, nonzero cross-copy, via `octMul_ne_zero` N265, FALSE at
  sedenions) and genuinely cross-copy (`coupling_cross_copy`). THE MOAT TIE: the scalar
  trace-contraction of a same-slot woven Jordan square reads the fold's Born self-overlap —
  `reQ (trace (jb (slotC x)(slotC c))) = 4 * gForm x c` (`trace_coupling_reQ`/`trace_coupling_gForm`)
  — the diagonal analogue of the banked cubic-norm cross-term (N215/N269), whose full-triangle
  well-definedness is octonion trace-associativity (`coupling_cross_term_assoc = reQ_mul_assoc3`,
  N210, FALSE at sedenions). THE DISSOLUTION/MOAT: the SM treats the 3 generations as identical copies
  (universality, N268) PLUS a SEPARATELY POSITED Yukawa/mixing sector; the theory DERIVES the coupling
  too — it is the arena's OWN product, forced, not an added sector. ONE CAUSE: the SAME octonion
  structure (cap-forced 3 copies + no-zero-divisors + trace-associativity) that stops the cascade
  gives the count (N267), universality (N268), and now the coupling. FREE-FLOATING RAIL: the bare
  coupling law holds for any *-ring 3×3 matrix units → DEMOTED to supporting; the HEADLINE is the
  octonion JOINT (moat tie + division-valuedness + the cap `jordan_cap_pinned_at_three` in the
  capstone `generation_coupling_structure` TYPE). NOVELTY claimed ONLY for the forced
  coupling-IS-the-arena's-product + the moat anchor. SCOPE: the coupling structure ONLY, NOT the
  CKM/PMNS matrix / physical Yukawa couplings / mass ratios / the mixing angle (★2 stays open); the
  breaking of the N268 family symmetry into an actual texture is the downstream node.
  N274: THE DERIVED DIRECTION-MIXING OPERATOR — the arena's OWN Jordan-MULTIPLICATION operator
  `Lmul A := (X ↦ jb A X)` and its inner commutator `innerMul A B := Lmul A ∘ₗ Lmul B - Lmul B ∘ₗ Lmul A`
  (the canonical inner-derivation generator; span = `f₄ = Der(J₃(O)) ⊋` the entrywise `g₂`, N269) COUPLE
  the two symmetry axes N273 proved ORTHOGONAL — the ENTRY/gauge axis (`jAct`, diagonal-FIXING) and the
  POSITION/family axis (`framePerm`, position-PERMUTING). THE OCTONION HEADLINE `innerMul_slot_diag`:
  `innerMul (slotA a)(slotB b)(Dg d0 d1 d2) = slotC ((d2 - d1) • (star a * b))` — the inner commutator
  reads the diagonal position-weight DIFFERENCE `d2 - d1` (the N213 trace-zero charge-space coordinate)
  into the octonion entry-gauge coupling `star a * b` (the N272 inter-generation coupling). W8
  `innerMul_moves_diagonal`: it MOVES matter (an off-diagonal `slotC 1 ≠ 0` sourced from a diagonal split)
  that NEITHER `jAct` nor `framePerm` can produce — the derived direction-mixing operator N273 flagged as
  the missing S₃-breaking structure, DERIVED (forced by `jb`), not posited. THE MOAT: the SM POSITS a
  Yukawa spurion to couple flavour-breaking to the gauge/mass structure; the theory posits NEITHER the
  flavour group (N273) NOR the coupling operator — it is the arena's OWN inner multiplication commutator,
  dissolving the RUNBOOK S₃-breaking blocker without a posit. Cap-bounded at order 3
  (`jordan_cap_pinned_at_three`).
  N275: THE COMPLETE INNER-MULTIPLICATION A₂ TRIANGLE + THE FAMILY-ORBIT CEILING — N274 computed ONE
  of `innerMul`'s three couplings against the diagonal Cartan (leg 1); N275 completes the triangle
  (`innerMul_slot_diagBC` leg 2 `= slotA ((d1-d0)•(b*star c))`, `innerMul_slot_diagCA` leg 3
  `= slotB ((d0-d2)•(a*c))`) whose three coupling coefficients — the trace-zero root functionals
  `(d2-d1)`,`(d1-d0)`,`(d0-d2)` — SUM TO ZERO (`innerMul_root_sum_zero`, the A₂/rank-2 root closure).
  ⭐⭐⭐ THE FAMILY-ORBIT CEILING: `innerMul` INTERTWINES with the family symmetry `framePerm`
  (`framePerm_innerMul`, because `innerMul` is built from `jb` and `framePerm` is a `jb`-automorphism)
  and the family 3-cycle `cyc` carries leg 1 → leg 2 (`innerMul_family_orbit`, cyclically relabelling
  `Dg d0 d1 d2 ↦ Dg d1 d2 d0`, `cyc_Dg`): the three couplings form ONE S₃-ORBIT with NO fixed root
  (`inner_root_no_fixed_direction`). THE DISSOLUTION/MOAT: the SM POSITS a distinguished flavour
  direction (the Yukawa texture) to break the family symmetry; the ≥9×-deferred ★2/★5 fronts kept
  refusing to posit one — N275 PROVES WHY: the three couplings form a family-SYMMETRIC A₂ root system
  with NO fixed root, the fold's OWN self-blindness (no nonzero fixed point) at the family level. The
  "missing distinguished direction" is a THEOREM that the structure is transitively symmetric, not a
  missing input — NAMES the ceiling: a family-symmetry-BREAKING derived object is the precise missing
  structure (childed N276 route-finder). Cap-bounded at order 3 (`jordan_cap_pinned_at_three`). NOT
  banked: the actual ★5 texture / mass ratios / CKM-PMNS, the mixing angle (★2), the full
  `f₄ = Der(J₃(O))`.]**
- **★6 — Chirality / parity violation.** The handedness of the weak interaction, derived. **[partial —
  N44: the abstract chirality block on raw `O ℚ` (the left/right regular-multiplication families do NOT
  all commute ⟺ non-associativity ⟺ the generation-cap failure). N264: lifted to the DERIVED SPINOR —
  the fold's worldMap has TWO chirality faces (`leftReg`, `rightReg`), BOTH Clifford modules for the ONE
  fold Born form, and octonionic non-associativity FORBIDS fusing them into one commuting action
  (`chir_spinor_block`, mixed commutator = associator, one-cause link to the generation cap). The
  STRUCTURAL GERM of chirality (two irreducibly-distinct handednesses, forced) is banked; PARITY
  VIOLATION (which hand the weak force couples to) remains open, a separate downstream node.
  N280: the germ GROWS INTO STRUCTURE — the two-handed spinor carries the full `so(4) = su(2)_L ⊕
  su(2)_R` of the matter world. The right-regular action is EQUALLY a fundamental su(2)_R doublet
  (`rightReg_casimir_eq_neg_three = -3•id`, spin-½, EQUAL to N279's left), closing on the last
  associative rung H with the OPPOSITE-orientation structure constant `-2` (`rightReg_closure_on_H_IJ`,
  contrast su(2)_L's `+2`); on H the two hands COMMUTE (`leftRight_commute_on_H`), assembling the
  `so(4) = su(2)_L ⊕ su(2)_R` (the rotation algebra of the associative rung, realized as left/right
  multiplication). On the full non-associative `O ℚ` NEITHER hand closes (both defects `= -2•` the
  banked associator, `rightReg_defect_eq_associator` / N279) and the two do NOT commute
  (`so4_breaks_on_O`, N264) — the two-handed `so(4)` is CONFINED to H and BROKEN on O by the SAME
  non-associativity that stops the cascade (`cap_forces_nonassoc`), one cause. The FUNDAMENTAL
  realization on the actual matter SPINOR (distinct from N191's ADJOINT so(4) in g₂, a non-breaking
  Lie subalgebra); the load-bearing novelty is the confinement/breaking, NOT the generic so(4). The
  ★3↔cascade-stop↔★6 joint on the spinor. SCOPE (honesty): banks the SYMMETRIC two-handed germ; a
  symmetric `so(4)` is parity-CONSERVING, so PARITY VIOLATION (which hand couples — the asymmetry)
  remains the OPEN part of ★6, a separate downstream node.]**
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
  complex amplitudes as derived, not axiomatic. **[partial — N270 adds the observable-algebra reality:
  the maximal matter arena `J₃(O ℚ)` is FORMALLY REAL (Euclidean) — its banked Cartan–Killing trace
  form `jTraceForm` (N214) is POSITIVE-DEFINITE (`reQ (jTraceForm A A) ≥ 0`, `= 0 ⟺ A = 0`,
  `jTraceForm_Hm_posdef`), because the fold's Born self-overlap POSITIVITY (`gForm` ℚ-anisotropy)
  lifts to the trace-square `jQ (Hm ...) = ∑dᵢ² + 2∑gForm` (a sum of ℚ-squares, `jQ_Hm`). This
  GROUNDS N269's gauge-invariant char-poly spectrum as a genuine REAL observable spectrum, and
  DISSOLVES the Jordan–von Neumann–Wigner founding AXIOM (they POSIT formal reality; the theory
  DERIVES it from the fold's positivity, at the cap-forced maximal order 3). The ★4↔★12 joint.]**
- **★13 — The continuum.** The real numbers / analysis derived from the fold — the substrate every
  analytic quantity stands on. **[banked — the number tower ℕ→ℤ→ℚ→ℝ descends from the fold (N7–N14,
  ROADMAP §STANDING DEPENDENCY GATE, ✅ RESOLVED); the derived ℝ = `ContinuumQ.Cut` (Dedekind cuts on
  the derived ℚ) is a COMPLETE ORDERED FIELD — `Field Cut` (N-field), `ConditionallyCompleteLinearOrder`
  (N33), order topology (N34), `Archimedean`, `CompleteSpace Cut` Cauchy-completeness (N37), plus
  derived `exp`/`log`/summability (own power series, NOT `Real.exp`), all foundations-only. No node
  leans on imported ℕ/ℤ/ℚ/ℝ as content. Remaining analytic apparatus (measure/integration, deeper
  real analysis) is build-out on this banked substrate, not a missing foundation.]**
- **★14 — The cosmological arc.** The large-scale sector — expansion history / vacuum energy /
  early-universe engine. **[open]**
- **★15 — The terminal exceptional structure.** The forced boundary of what the fold generates —
  the cascade's stop and the exceptional structures at the edge. **[partial — the cascade STOP is
  banked (N2c/ForcedStop: the Born self-overlap norm is multiplicative through `O ℚ` and LOST at
  `S ℚ = CD(O ℚ)`, `forced_stop_boundary`/`has_zero_divisor`). N265 JOINS it to matter (★3): the SAME
  multiplicativity boundary that stops the cascade is what makes `O ℚ` a division algebra / matter
  INDIVISIBLE — `division_boundary` is the exact mirror of `forced_stop_boundary`, so the terminal
  stop and matter's indivisibility are ONE cause.]**

---

*The sky is bounded (15 stars = the whole derivable landscape) so you always know where you are and
what is worth reaching. There is no method-lock (lifted 2026-07-03, docs/ROADMAP.md): BOTH the
gather side and the invariant-tower ascent are open, and SELECT weighs HOW to travel (which method)
on merit; the constellation names WHERE. Neither hands you the path or the answer — those you earn,
node by node.*
