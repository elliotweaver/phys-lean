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
  the angle)]**
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
  NOT parity.]**
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
  families, a bundled cross-module gauge-module isomorphism.]**
- **★5 — The mixing & mass texture.** The inter-generation mixing and the mass-ratio structure, as
  relations rather than free parameters. **[open]**
- **★6 — Chirality / parity violation.** The handedness of the weak interaction, derived. **[partial —
  N44: the abstract chirality block on raw `O ℚ` (the left/right regular-multiplication families do NOT
  all commute ⟺ non-associativity ⟺ the generation-cap failure). N264: lifted to the DERIVED SPINOR —
  the fold's worldMap has TWO chirality faces (`leftReg`, `rightReg`), BOTH Clifford modules for the ONE
  fold Born form, and octonionic non-associativity FORBIDS fusing them into one commuting action
  (`chir_spinor_block`, mixed commutator = associator, one-cause link to the generation cap). The
  STRUCTURAL GERM of chirality (two irreducibly-distinct handednesses, forced) is banked; PARITY
  VIOLATION (which hand the weak force couples to) remains open, a separate downstream node.]**
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
