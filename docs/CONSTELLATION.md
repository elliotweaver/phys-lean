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
  invariant-length RATIO + orthogonality ONLY — the forced `3:8` anchor; the full identification as
  the weak mixing angle (couplings/running/full generation embedding) is a separate downstream node,
  route not-yet-found (a BUILD target, never un-derivable), NOT claimed here. N254: THE FORCED SECOND
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
  N285: THE GENUINE `f₄ = Der(H₃(O))` ON THE CORRECT (HERMITIAN) CARRIER — a FRESH measure-first
  SELECT REDIRECTED N284's carrier. Measured (exact Fraction octonion arithmetic): N284's `jDer` was
  built on the FULL matrix space `Matrix (Fin 3)(Fin 3)(O ℚ)`, but `jb` is genuinely Jordan
  (`jdef=0`) ONLY on the HERMITIAN submatrices (`jdef_H3`); over the full space the inner derivations
  `innerMul=⁅L_A,L_B⁆` (the f₄/g₂ complement where the electroweak directions live) are NOT
  derivations of `jDer` — `innerMul(Herm) ∉ jDer`, 60/60 nonzero on general args. So N284's full-space
  object EXCLUDED the very complement INPUT A requires; the genuine ambient is the derivation algebra
  of the HERMITIAN arena. N285 builds it (`Phys/Algebra/OctonionJordanHermDerivationAlgebra.lean`, ns
  `Phys.Algebra.HJ`, 17 decls): `derH3` = the Hermitian-restricted Jordan-derivation `LieSubalgebra` =
  the genuine `f₄`, with `jb`/`innerMul`/`jActL` all proved to PRESERVE the Hermitian subspace; the
  derived gauge g₂ re-seated inside as the BUNDLED, FAITHFUL, trace-skew Lie hom `g2ToDerH3`
  (`g2ToDerH3_injective` via `slotA_inj`; skew in the banked positive-definite `jTraceForm` via the
  reused N284 anchor); and the MEASURED STRUCTURAL TEETH `innerMul_escapes_g2` — `innerMul` preserves
  H₃ (a candidate member the full-space `jDer` misses) YET moves the diagonal every entrywise g₂
  element fixes (`jAct_Dg`), so `f₄ ⊋ g₂` at the inner-derivation generator on the correct carrier.
  The one cause (octonion non-associativity, caps the Hermitian tower at 3) furnishes the arena with
  `f₄ ⊋ g₂` whose unique form is the derived positive-definite trace form. SCOPE: the genuine ambient +
  re-seated faithful skew embedding + the complement-present-and-escapes-g₂ teeth ONLY. NOT
  `innerMul(Herm) ∈ derH3` (the derivation LAW / `f₄ ⊋ g₂` PROPER — the W9-heavy linearized Jordan
  identity by polarizing `jdef_H3`, CHILDED as the single successor), NOT the electroweak factors in
  f₄, NOT the mixing-angle VALUE (INPUT B, route not-yet-found — a FORCED value, a BUILD target, NOT human-gated).
  N286: `f₄ ⊋ g₂` PROPER — the inner-derivation Leibniz law `innerMul(Herm) ∈ derH3` by LINEARIZING
  the banked cap `jdef_H3` (the derivation defect = a formal free-ring polarization identity, abel-closable
  with ZERO octonion coordinates), placing the electroweak-bearing inner-derivation complement genuinely
  INSIDE the derived f₄, not merely adjacent.
  N287: THE ★2 INPUT-A STRUCTURAL DISSOLUTION — the derived f₄=Der(H₃(O)) SUPPLIES a nonzero member of the
  inner-derivation complement `f₄/g₂` that COMMUTES WITH THE ENTIRE DERIVED GAUGE g₂=Der(O). The whole
  N281→N286 ascent was the declared repeated-deferral STAIRCASE built to reach a single simple derived
  ambient holding two commuting factors the vector carriers so(7)/so(8) provably could not (N283 MEASURED
  the joint centralizer of su(2)_L+colour in so(8) = 0). MEASURED (exact-Fraction octonion table + numpy
  nullspaces): so(8) joint centralizer(su(2)_L+colour)=0 → derived f₄ joint centralizer=3 ≠ 0 (THE WALL
  GONE one carrier up); `centralizer_{f4}(colour su(3))` = a GENUINE second su(3) (dim 8, commutes to 1e-16,
  colour∩it=0 direct-sum dim 16, bracket-closed, semisimple Killing rank 8 + centre 0, rank 2 — the
  maximal-rank F₄ ⊃ su(3)_c ⊕ su(3)_ew pattern, DERIVED, disjoint from jActL(g₂)); `centralizer_{f4}(FULL g₂)=3`
  = the inner-derivation algebra of the REAL sub-arena J₃(ℝ)=so(3). THE MECHANISM (coordinate-free LEIBNIZ
  LEVER `⁅jActL D, innerMul A B⁆ = innerMul(jAct D A) B + innerMul A(jAct D B)`, from banked `jAct_jb`): since
  every derivation kills the reals (`derivQ_one`: `D 1 = 0`) and M0=innerMul(slotA 1)(slotB 1)'s matter slots
  carry the real unit 1, both terms vanish → M0 commutes with the WHOLE gauge (`M0_gauge_central`), ZERO
  octonion coordinates. THE DISSOLUTION: the field POSITS `F₄ ⊃ SU(3)×SU(3)` + CHOOSES that embedding to
  place the colour-neutral factor; the theory DERIVES colour=Der(O) and f₄=Der(H₃(O)) BOTH from the fold, so
  the colour-commuting member is the FORCED centralizer, not an embedding convention — the N257/N283 carrier
  wall dissolves on the fold-forced arena. SCOPE: the forced gauge-commuting inner-derivation member + the
  coordinate-free lever ONLY. NOT the FULL second su(3)_ew as a complete simple 8-dim LieSubalgebra (measured
  dim 8 — the next rung, CHILDED), NOT the room=so(3)=Der(J₃(ℝ)) identification, NOT the mixing-angle VALUE
  (INPUT B, route not-yet-found — a FORCED value, a BUILD target, NOT human-gated)]**
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
  parity.
  N288: THE CONTINUOUS FAMILY-ROTATION ALGEBRA — the Lie form of N273's discrete S₃. N287 proved the
  derived `f₄ = Der(H₃(O))` supplies a gauge-neutral inner-derivation member `M0`; N288 IDENTIFIES the
  whole gauge-neutral room (`centralizer_{f4}(FULL g₂)`, measured dim 3) as the FAMILY-ROTATION algebra:
  the three inner-multiplication commutators of the REAL-UNIT matter slots `famA = innerMul (slotB 1)(slotC 1)`,
  `famB = innerMul (slotC 1)(slotA 1)`, `famC = innerMul (slotA 1)(slotB 1)` (= N287's `M0`) each (1) lie
  in `f₄ = derH3` (`famA/famB/famC_mem_derH3`), (2) COMMUTE with the ENTIRE derived gauge `g₂` (each
  `fam_gauge_central`, via the N287 coordinate-free lever + the real-core annihilation `D 1 = 0`), and (3)
  ROTATE the three cap-forced matter slots (N267) into each other — `famC (slotB b) = slotA b`,
  `famC (slotA a) = − slotB a`, `famA (slotC c) = slotB c` (`famC_slotB`/`famC_slotA`/`famA_slotC`) — so
  they MIX the three generations; W8 `famC_slotB_ne_zero`. So the gauge-neutral room is the CONTINUOUS
  Lie realization, as INNER derivations inside the derived `f₄`, of N273's DISCRETE family permutation S₃;
  N287's anonymous `M0` is exposed as one generation-rotation generator (`famC`). ONE CAUSE: the SAME
  octonion non-associativity that caps the Hermitian Jordan tower at 3 (N5) — furnishing EXACTLY THREE
  matter-carrier slots (N267) — now furnishes the arena's gauge-neutral room with the continuous rotation
  of those three slots. THE DISSOLUTION/MOAT: the field POSITS a flavour symmetry (U(3)_F / SU(3)_flavour)
  + CHOOSES its action + breaks it by hand (Yukawa spurions); the theory DERIVES the family-rotation
  algebra as the FORCED centralizer of the whole derived gauge inside the derived `f₄`. A theory-over-arc
  REDIRECT (docs/NODE_SELECTION.md S3): the arc's childed "colour-commuting su(3)_ew" was MEASURED to be
  the GUT-embedding CHOICE the theory dissolves, NOT the derived electroweak container (the derived su(2)_L
  does NOT commute with colour — joint centralizer = 3, su(2)_L ∉ the dim-8 colour-centralizer) — so ★2 is
  CLARIFIED (the f₄ gauge-centralizer is FAMILY so(3), not an electroweak u(1)_Y/su(2)_L holder). NOT banked:
  the FULL `so(3)` closure `⁅famA,famB⁆ = famC` (measured true, coefficient 1, but a heavy End-identity over
  the non-associative matrix ring — the directed W1 next node), the bundled `= Der(J₃(ℝ))` LieHom, the S₃ ⊂
  so(3) embedding vs N273 `framePerm`, the ★5 texture, masses/mixings, the mixing angle (★2), parity.]**

  N289: THE `so(3)` CLOSURE OF THE FAMILY-ROTATION ALGEBRA — the Lie structure of N288's gauge-neutral
  room, banked. The three gauge-central family-rotation generators `famA = innerMul (slotB 1)(slotC 1)`,
  `famB = innerMul (slotC 1)(slotA 1)`, `famC = innerMul (slotA 1)(slotB 1)` CLOSE as a 3-dimensional
  SIMPLE Lie algebra: `⁅famA,famB⁆ = famC`, `⁅famB,famC⁆ = famA`, `⁅famC,famA⁆ = famB` (cyclic,
  `famA_famB_closure`/`famB_famC_closure`/`famC_famA_closure`), the closure genuinely NON-abelian
  (`famB_ne_zero`) — so `span{famA,famB,famC} ≅ so(3)`, the CONTINUOUS Lie realization (as inner
  derivations inside `f₄`) of N273's discrete family S₃. THE W1 DISSOLUTION (docs/RUNBOOK.md, THE ONE
  LAW): the naive entrywise route over the non-associative matrix ring is an INSTRUMENT WALL (a scratch
  `Matrix.ext`+`simp` ran 5m26s without closing, W9); the THEORY dissolves it — the family generators are
  built from the REAL-UNIT matter slots whose entries are the CENTRAL ground scalar `ocR` (nuclear in
  `O ℚ`, `ocR_comm`/`ocR_assocL/R`, N5c), so the octonion NON-associativity provably does NOT bite: (1)
  `innerMul (ocRM P)(ocRM Q)` COLLAPSES to the ordinary matrix-commutator endomorphism `adE (P·Q − Q·P)`
  (`collapse`, via the nuclearity lemmas `ocRM_assoc_L/R`); (2) the bracket of two such is `adE` of the
  matrix commutator (`adE_bracket`, the Lie-hom on the nuclear generators); (3) `ocRM` is a ring hom
  (`ocRM_mul`/`ocRM_sub`), so the whole closure DESCENDS to a PURE-ℚ constant `so(3)` structure-constant
  identity `Kc·Ka − Ka·Kc = Kb` (0/±1 entries, `q_so3_CA`/`q_so3_AB`/`q_so3_BC`). The non-associativity
  that made the coordinate route intractable is precisely what the CENTRALITY of the real unit removes —
  the theory making a classically-brutal proof dissolve. ONE CAUSE: the SAME octonion non-associativity
  that caps the tower at 3 (N5) furnishing the three matter slots (N267) does NOT obstruct the closure of
  their rotation generators, precisely because those generators carry the central real unit. 22 decls
  foundations-only; costume C318 bites `1=318`. NOT banked: the bundled `LieSubalgebra`/`= Der(J₃(ℝ))`
  LieHom (optional hardening), the S₃ ⊂ so(3) embedding vs N273 `framePerm`, the ★2 mixing VALUE
  (route-not-yet-found — a FORCED build target), `= physical 3 generations / flavour SU(3)` (removable
  prose).

  N290: THE FAMILY-INVARIANT CORE OF THE MATTER ARENA IS THE SCALAR-UNIT LINE — the derived family
  `so(3)` (N288/N289) is BLIND to all generation content. After BUILDING a symmetry, the fold's own
  next beat is always *what is it BLIND to?* (self-blindness, the trunk primitive). The gauge arc
  answered this (N252 unique colour-fixed axis, N266 colour-neutral core, N271 joint colour∧isospin
  core = `span{1}`); the family `so(3)` had NOT. N290 answers it: the JOINT KERNEL of the family-
  rotation `so(3)` {famA,famB,famC} on the maximal Hermitian octonionic Jordan arena `H₃(O ℚ)` (N267)
  is EXACTLY the scalar-unit line — a Hermitian matrix is annihilated by all three family generators
  IFF it is the central real diagonal `Dg r r r = r·id` (`family_invariant_core_eq_span_one`, an IFF
  characterization). So the TRACELESS 26-dim arena, where ALL generation content lives, carries NO
  nonzero family-invariant direction (W8 `slotA_one_not_faminvariant`: a matter slot escapes the core
  since `famC (slotA 1) = −slotB 1 ≠ 0`). THE DISSOLUTION (THE ONE LAW): the field decomposes `J₃(O)`
  as an `so(3)`-module (a character computation over a non-associative exceptional algebra); the
  theory DISSOLVES it via N289's `collapse` — each family generator, built from the CENTRAL real-unit
  slots, equals the matrix-commutator endomorphism `famX = adE (ocRM Kx)` (`famA/B/C_eq_adE`), so the
  joint kernel is a PURE-ℚ `0/±1` linear system (`Ka_const`/`Kb_const`, entry extraction
  `famA/B_forces_*`) whose only Hermitian solution is `ocR r · id` — NO octonion coordinate bash.
  ONE CAUSE: the SAME octonion non-associativity that caps the tower at 3 (N5), furnishing three
  matter slots (N267) and their `so(3)` rotation (N288/N289), makes that rotation blind to precisely
  the fold's own scalar unit — self-blindness reappearing at the family level. This is the CONTINUOUS
  twin of N275's discrete "no fixed root" A₂ ceiling: the mass/mixing texture (★5) needs a
  family-symmetry-BREAKING derived object, NOT a fixed direction this arena supplies. 22 decls
  foundations-only; costume C319 bites `1=319`. NOT banked: the full family-`so(3)` MODULE
  decomposition (the Casimir `1 ⊕ 21 ⊕ 5` multiplet tower — scope-out); the ★5 texture-breaking
  (downstream); the ★2 mixing VALUE (route-not-yet-found).
  N294: THE DERIVED COLOUR AND FAMILY-FLAVOUR su(3) ARE A COMMUTING PAIR — the ★1↔★4 joint, the
  capstone of the N287→N293 f₄ sub-arc. Inside the single derived `f₄ = Der(H₃(O))` the gauge-COLOUR
  `su(3)` (`jActL(colourCentralizer)`, N201/N268) and the family-FLAVOUR `su(3)` (`Z_{f4}(colour)` =
  family-so(3) ⊕ fold-root-dressed coset, N288–293) COMMUTE (all six flavour generators:
  `colour_centralizes_famA/B/C` + `_kAB/kBC/kCA`) AND are genuinely DISTINCT (`famC_ne_gauge`: `famC`
  crosses generation slots, no entrywise gauge element does), so they form a genuine commuting PAIR —
  the derived maximal-rank `su(3)_c ⊕ su(3)_flavour ⊂ f₄`. THE ONE CAUSE `colour_kills_foldcomplex_core`:
  every colour `D` kills the fold's colour-neutral ℂ-core `span{1,u1}` (`D 1 = 0`, `D u1 = 0`, N266/N201)
  and flavour is generated by `innerMul` of `{1,u1}`-dressed slots — so colour is BLIND to everything
  flavour is built from; the one fold-root `u1` is at once the colour complex structure (colour =
  stab(u1), block-diagonal in the generation index) and the generation-mixing dressing (flavour), two
  orthogonal roles. THE MOAT: the field POSITS `F₄ ⊃ (SU(3)_c × SU(3)_flavour)/ℤ₃` + CHOOSES the factor
  assignment/embedding; the theory DERIVES both as mutual centralizers in the derived f₄, commuting
  FORCED by the fold-root's colour-blindness. Costume C323 (`1=323`); 10 decls foundations-only. NOT
  banked: the mutual-centralizer RIGIDITY `Z_{f4}(flavour) = colour` EXACTLY (measured 2e-15 — needs an
  f₄ coordinate handle, CHILDED as a directed W1 route-finder); the ★5 texture-breaking (N269: all of
  f₄ preserves the spectrum → needs a spectrum-breaking object beyond f₄); the ★2 mixing VALUE
  (route-not-yet-found).]**
  N295: THE SPECTRUM-MOVING SECTOR BEYOND f₄ — the traceless Jordan LEFT-MULTIPLICATIONS MOVE the
  identity every derivation FIXES (the first rung of the reduced structure algebra `e₆ ⊃ f₄`; the
  ★5/★2 structural CEILING NAMED and its resolution BUILT). f₄ has a hard ceiling every mass/mixing
  front kept hitting (N269/N275/N290/N291): every derivation `T ∈ f₄` PRESERVES the arena's spectrum
  (`jN`/`jS`/char-poly, N269) — in particular KILLS the identity `T 1 = 0` (`derH3_kills_one`,
  forced by the Leibniz law at `A=B=1`: `2•T1 = 4•T1 ⟹ T1 = 0` char 0), so f₄ FIXES the maximally-
  degenerate spectral point `1 = diag(1,1,1)` and CANNOT lift the degeneracy a mass TEXTURE needs.
  SELECTED (fresh worker, anti-bullshit gate passed) via the SOUL REPEATED-DEFERRAL SIGNAL (★2/★5
  route-not-yet-found ~10 nodes, same ceiling) — REDIRECT off the handed-forward lateral rigidity
  `Z_{f4}(flavour)=colour` (a commutant characterization INSIDE spectrum-preserving f₄); NAME the
  ceiling + BUILD the object BEYOND f₄ that MOVES the spectrum: the Jordan left-multiplication
  `Lmul A X = jb A X` (N274), the fold's own multiplication act. `Lmul A 1 = A + A` (`Lmul_one`) MOVES
  the identity; `Lmul (slotA 1) ∉ derH3` (`Lmul_notMem_derH3`) — the first spectrum-mover, genuinely
  outside f₄. Movers close BACK into f₄: `⁅Lmul A, Lmul B⁆ = innerMul A B ∈ derH3` (N286), the Lie
  structure of `e₆ = f₄ ⊕ L₀` (`dim 78 = 52 + 26`, MEASURED exact; full closure CHILDED). Motion size
  = Born positive-definite trace form `reQ (jTraceForm A A) = 2·jQ A ≥ 0` (N270). THE MOAT: the field
  has `F₄ = Aut(J₃(O))` norm-preserving, invokes `E₆` that moves the norm BY HAND + POSITS the
  Yukawa/mass-splitting spurion; the theory DISSOLVES it — the splitting generators ARE the banked
  derived `Lmul`, that f₄ can't split the spectrum is a THEOREM (`derH3_kills_one` + N269), the
  resolution the rest of derived `e₆ = Der ⊕ L₀`, FORCED. ONE CAUSE: the SAME octonion non-
  associativity that caps the Jordan tower at 3 (N5) furnishing `H₃(O)` makes its derivations f₄
  spectrum-preserving AND makes the arena's own multiplication operators `Lmul` the spectrum-MOVERS.
  Costume C324 (`2=324`); 7 decls foundations-only. NOT banked: the full `e₆ = f₄ ⊕ L₀` dim-78 closure
  as a bundled LieSubalgebra (CHILDED — needs the 78-dim span handle); the ★5 mass texture VALUE
  (route-not-yet-found — the e₆ climb is the named ascent toward it); the ★2 mixing VALUE.
  N296: THE f₄-EQUIVARIANCE OF THE SPECTRUM-MOVING SECTOR — the third bracket relation `[f₄, L₀] ⊆ L₀`
  that closes the Z₂-graded Lie structure of `e₆ = f₄ ⊕ L₀`; the mass-texture module IS the derived
  matter arena. The fold's own next beat after N295's first spectrum-mover: HOW does the spectrum-
  PRESERVING f₄ act on the spectrum-MOVING sector? FORCED by the derivation Leibniz law — `⁅T, Lmul A⁆ B
  = Lmul (T A) B` for `T ∈ derH3`, Hermitian A,B (`spectrum_sector_equivariance`), exhibiting `A ↦ Lmul A`
  as an f₄-MODULE INTERTWINER: L₀ is a canonical copy of the arena `H₃(O)` carrying the f₄-action `A ↦ T A`.
  With the two banked relations `[L₀,L₀]⊆f₄` (N295) and `[f₄,f₄]⊆f₄`, this completes the whole Z₂-graded
  triple (capstone `spectrum_sector_graded_module`). NON-TRIVIAL: the derived family derivation `famC`
  moves the mover `Lmul (slotA 1)` to `Lmul (−slotB 1)` (`family_moves_mover`), `≠ 0` at `1`
  (`family_moves_mover_ne`) — `[f₄,L₀] ≠ 0`, a genuine graded (non-split) extension. THE MOAT: the field
  POSITS the Yukawa/mass-texture sector as a spurion in a CHOSEN gauge rep (assignment by hand); the theory
  DISSOLVES the choice — the module is FORCED to be the arena itself via `A ↦ Lmul A`, its transformation
  law the derivation Leibniz law (the fold's own act). ONE CAUSE: the same octonion non-assoc that caps
  the tower at 3 makes f₄ the spectrum-preservers AND Lmul the spectrum-movers AND now forces the
  derivations to act on the movers by Leibniz. Costume C325 (`2=325`); 4 decls foundations-only. NOT banked:
  the full dim-78 bundled LieSubalgebra (CHILDED — 78-dim span handle); the traceless L₀ submodule refinement
  (CHILDED — needs "derH3 kills jTr"); the jTr/jS spectrum-GRADING / weight structure (CHILDED — the named
  ascent's next rung); the ★5 mass texture VALUE (route-not-yet-found); the ★2 mixing VALUE.
  N297: THE DILATION/TRACELESS-SPLIT GRADING OF THE SPECTRUM-MOVING SECTOR — the f₄-central dilation
  `Lmul 1 = 2·id` (pure scaling, NO splitting — the module's fixed direction) vs the TRACE-GRADED
  diagonal movers whose genuine SPLITTING lives EXACTLY on the trace-zero Cartan hyperplane `(ℚ·1)^⊥`
  (the N214 charge hyperplane). The fold's own beat after N296: HOW does a mover MOVE the degenerate
  spectrum `1=diag(1,1,1)` that f₄ fixes, and which motion is trivial? `dilation_scale` (`Lmul 1 X = X+X`,
  pure dilation) + `dilation_fixed` (`⁅T,Lmul 1⁆B=0` for T∈derH3, Herm B, VIA the N296 equivariance +
  N295 `derH3_kills_one` — the f₄-fixed identity's image, NOT trivial 2·id centrality); `diag_mover_split`
  (`Lmul(Dg t)1 = Dg t + Dg t`, displaces the degeneracy by `2·(t0,t1,t2)`); `mover_trace_grading`
  (`jTr(Lmul(Dg t)1)=ocR(2·Σtᵢ)`); `split_iff_traceless` (genuine splitting ⟺ Σtᵢ=0) and ★★★
  `split_iff_orthogonal` (⟺ `jTraceForm 1 (Dg t)=0` — THE INTRINSIC JOINT via N214 `jTF_one_Dg_zero_iff`:
  the splitters are EXACTLY `(ℚ·1)^⊥`, the same charge hyperplane N213 lives on, normalization-free);
  W8 traceless-nonzero split (`split_traceless`∧`split_ne`); capstone `spectrum_grading_structure`. THE
  MOAT: the field POSITS the Yukawa/mass-splitting spurion + CHOOSES the breaking direction; the theory
  DISSOLVES the choice — the splitters ARE the traceless derived left-mults, the non-splitting direction
  FORCED to be the f₄-central dilation, the dichotomy the linear-trace grading tied to the charge
  hyperplane. Costume C326 (`6=326`); 10 decls foundations-only. NOT banked: "derH3 kills jTr" (CHILDED —
  measure-confirmed TRUE but W9-nontrivial: `innerMul ≠ [[A,B],M]` for the non-assoc octonion matrices,
  needs the trace-form-skewness of Jordan derivations; splits `L = ℚ·1 ⊕ L₀` as f₄-modules); the full
  dim-78 bundled LieSubalgebra; the ★5 mass texture VALUE (route-not-yet-found — this grading is the
  named ascent's mass-splitting mechanism); the ★2 mixing VALUE.
  N298: THE INVARIANCE (ASSOCIATIVITY) OF THE DERIVED CARTAN–KILLING TRACE FORM + THE TRACE-
  ANNIHILATION BY THE f₄-GENERATORS — the directed route-finder for N297's childed "derH3 kills jTr".
  W1 step 2 (reframe through the trunk) dissolves the FORCED core WITHOUT the innerness theorem: the
  theory-native object is not the abstract predicate but the DERIVED TRACE FORM ITSELF. A Killing
  form's defining property is invariance `⟨AB,C⟩=⟨A,BC⟩`; over the octonions the PRODUCT is
  non-associative yet its REAL-PART TRACE is ASSOCIATIVE (`reQ_mul_assoc3`, N209 — the associator is
  pure-imaginary, killed by the real part, the SAME non-assoc that stops the cascade). `rtr = reQ∘jTr`;
  `rtr_mul_comm`+`rtr_mul_assoc` (the matrix lift of the octonion reQ-trace laws); ★★
  `traceform_associative` (`rtr(jb(jb A B)C)=rtr(jb A(jb B C))` — the trace form is INVARIANT, the
  genuinely-new lever); ★★★ `innerMul_kills_trace` (`rtr(innerMul A B M)=0` — the inner-derivation
  complement `f₄⊋g₂`, N274, via invariance + `jb A B = jb B A`; the CLEAN route the false
  trace-of-commutator route `innerMul≠[[A,B],M]` could not reach); ★★ `jActL_kills_trace`
  (`rtr(jActL D M)=0` for `IsDerivQ D`, via `derivQ_reQ_zero`); `herm_jTr_eq_ocR_rtr` (reality bridge:
  Hermitian ⇒ `jTr H = ocR(rtr H)`, via `selfconj_eq_smul`) lifting the killers to the banked
  octonion trace (`innerMul_kills_jTr`, `jActL_kills_jTr` as FULL octonion equalities on the arena);
  W8 `dilation_trace_rtr` (`rtr(Lmul 1 1)=6≠0`, N297 dilation) — the killed functional is genuinely
  nonzero; capstone `trace_form_invariance_structure`. THE MOAT: the field POSITS a "traceless"
  operator algebra + CHOOSES the invariant form; the theory DERIVES the form's invariance FROM the
  octonion trunk and forces BOTH generating families to kill the trace — no posited form, no
  innerness assumed. ONE CAUSE: the same octonion non-assoc that stops the cascade + caps the tower +
  makes the calibration 3-form cyclic makes the trace form invariant, forcing the symmetry-generators
  to respect the grading functional. Costume C327 (`6=327`); 11 decls foundations-only. NOT banked:
  the FULL abstract `∀ T∈derH3, jTr(T A)=0` (CHILDED — the gap is EXACTLY `Der(H₃O)=InnDer`, the
  innerness of Jordan derivations; N298's generator-annihilation reduces the full predicate to that
  one structural theorem, by linearity); the f₄-module split `L=ℚ·1⊕L₀` (follows once the full
  predicate is in hand); the dim-78 bundled e₆; the ★5 mass texture VALUE (route-not-yet-found — this
  invariance is a rung of the named ascent); the ★2 mixing VALUE.]**
  **[N299: THE INNERNESS-FREE TRACE-ANNIHILATION OF f₄=Der(H₃(O))=derH3 — every Hermitian Jordan
  derivation kills the Hermitian-arena OPERATOR TRACE, the RUNBOOK W1 STEP 2 DISSOLUTION of the
  Chevalley–Schafer innerness wall `Der(H₃O)=InnDer` N298 named as the remaining gap. N298 reduced
  the full predicate `∀T∈derH3, jTr(TA)=0` to innerness by linearity (MEASURED TRUE: span{innerMul}
  = derH3 rank 52), but that is the HEAVY route (no dim f₄=52 banked). The theory's shorter classical
  stroke: a derivation kills the trace NOT because it is inner but because its action on the
  MULTIPLICATION OPERATOR is a COMMUTATOR — `⁅T, Lmul A⁆ = Lmul(TA)` is the banked N296 equivariance
  (the Leibniz law of `jb` rearranged) — and the operator trace of a commutator is `0` by cyclicity
  (`LinearMap.trace_mul_comm`), killing the trace for the ENTIRE f₄ at once. `hermSub` (the Hermitian
  submodule, `Module.Finite`/`Free`); ★★★ `restricted_comm` (the N296 equivariance transported to
  `hermSub`: `(Lmul(TA))|_H = T|_H·(Lmul A)|_H − (Lmul A)|_H·T|_H`, an operator COMMUTATOR); ★★★
  `derH3_kills_hermTrace` (`trace_H((Lmul(TA))|_H)=0` for EVERY `T∈derH3`, Hermitian `A`, NO innerness);
  ★ `dilation_restrict` (`(Lmul 1)|_H=2•id`); `finrank_hermSub_pos` (`0<dim hermSub`); ★★ W8
  `dilation_hermTrace_ne` (`trace_H((Lmul 1)|_H)=2·dim hermSub≠0` — the killed functional is genuinely
  nonzero, `Lmul(TA)` in the kernel of a NONZERO functional); capstone `herm_trace_commutator_structure`.
  THE MOAT: the field proves `Der(H₃O)=InnDer` (classification) then observes inner⟹kills trace; the
  theory DISSOLVES the classification — the action on `Lmul` is a commutator, trace 0 by cyclicity,
  killing the trace for the WHOLE f₄ at once. ONE CAUSE: the same octonion non-assoc that stops the
  cascade + caps the tower makes the derivations f₄ satisfy Leibniz, and Leibniz turns the action on
  the multiplication operator into a commutator. Costume C328 (`2=328`); 14 decls foundations-only.
  NOT banked: the FULL octonion-valued `∀T∈derH3, jTr(TA)=0` (CHILDED — the remaining step is the
  trace-COEFFICIENT identity `trace_H((Lmul C)|_H)=k·rtr C` with k≠0, measured k=18; combined with
  `derH3_kills_hermTrace` it closes the full predicate + the f₄-module split `L=ℚ·1⊕L₀`); the dim-78
  bundled e₆; the ★5 mass texture VALUE (route-not-yet-found); the ★2 mixing VALUE.]**
  **[N300: THE TRACE-COEFFICIENT PROPORTIONALITY + THE FULL f₄-ANNIHILATION OF THE LINEAR TRACE —
  closes N299's childed target. `φ(C) := trace_H((Lmul C)|_H) = k·rtr C` with `k = 2·dim hermSub/3 ≠ 0`,
  giving the FULL `∀T∈derH3, jTr(TA)=0`. THE W9 DISSOLUTION: the 27-dim operator trace is NOT a brute
  basis (the naive `D*X*D` coordinate `ext` TIMES OUT at 200k hb) — it is PINNED BY THE ARENA'S OWN
  SYMMETRIES. `csign s X = of((sᵢsⱼ)•Xᵢⱼ)` (sign reweighting) is a Jordan automorphism when `sₖ²=1`
  (★★ `csign_jb`, forced by the CENTRALITY of the ℚ-scalar through the octonion product, NO coordinate
  expansion), so `φ` is invariant (★★ `phi_csign` via `LinearMap.trace_conj'`); a single sign flip
  NEGATES an off-diagonal slot (`csign_flip_pair`), forcing ★★★ `phi_pair_zero` (`φ(slot)=0`:
  `φ=−φ`). `pconj σ X = X.submatrix σ σ` (permutation) is a Jordan automorphism (★★ `pconj_jb` via
  `submatrix_mul_equiv`, no assoc), so the diagonal idempotents share one φ-value (★★ `phi_Eidem_eq`),
  and with `φ(1)=2·dim` (N299 `dilation_hermTrace`) + `ΣE i=1`, `φ(E i)=2·dim/3` (`phi_Eidem_val`).
  ★★★ `phi : hermSub →ₗ[ℚ] ℚ` (dependent-restrict dissolved by `LmulH` landing in `End hermSub`);
  ★★★ `phi_proportional` (`φ(C)=kconst·rtr C`) + ★★ `kconst_ne_zero` (from `finrank_hermSub_pos` —
  k≠0 FREE, NO dim=27 computed); ★★★ `derH3_kills_jTr` (N299 `derH3_kills_hermTrace` gives `φ(TA)=0`,
  proportionality + k≠0 gives `rtr(TA)=0`, reality bridge `herm_jTr_eq_ocR_rtr` lifts to `jTr(TA)=0`);
  `L0 = hermSub ⊓ ker(traceLinearMap)` (the `ℚ·1⊕L₀` split); capstone `full_trace_annihilation_structure`.
  THE MOAT: the field grinds a 27-dim exceptional-Jordan operator trace via an invariant tower OR proves
  `Der(H₃O)=InnDer`; the theory DISSOLVES both — the trace is pinned by the arena's own sign/permutation
  symmetries, `k≠0` free from the banked dilation, `jTr(TA)=0` for the WHOLE f₄ at once, NO basis, NO
  innerness. ONE CAUSE: the same octonion non-assoc that stops the cascade + caps the tower makes f₄
  satisfy Leibniz (→N299) AND makes the sign/permutation reweightings Jordan automorphisms whose
  invariance pins the trace to a nonzero multiple of `rtr`. Costume C329 (`1=329`); 40 decls
  foundations-only. NOT banked: the dim-78 bundled e₆; the ★5 mass texture VALUE (route-not-yet-found);
  the ★2 mixing VALUE.]**
- **★5 — The mixing & mass texture.** The inter-generation mixing and the mass-ratio structure, as
  relations rather than free parameters. **[SEED-DIRECTED — see `docs/SEED_FLAVOR_SELF_BLINDNESS.md`
  (owner-authorized route). The flavor pattern is NOT an algebraic feature of the f₄/e₆ symmetry tower
  (N283–N303 proved isospectral / no fixed direction); it lives on the gather/self-blindness side — the
  three generations as phases of one self-blind ℤ₃ cycle, the mass amplitudes its Fourier structure, the
  Koide balance and cycle phase forced by self-blindness + a holonomy=statistics consistency. Route,
  targets T1–T8, and the discipline guards are in the seed doc. Every value remains a landing to be
  DERIVED, never asserted; the crux (holonomy=statistics) must be derived or the node CHAIN-RUNWAY
  blocked. Prior partial below is retained as banked structural context.]
  [partial — N272: the FIRST result reaching this star (the
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
  structure (childed N276 route-finder). Cap-bounded at order 3 (`jordan_cap_pinned_at_three`).
  N291: THE FORCED FAMILY-SYMMETRY-BREAKING OBJECT — the family-breaking derived object N290/N275
  NAMED as ★5's missing ingredient, now BUILT. The derived arena's Jordan-derivation Lie algebra
  `f₄ = derH3` (N285/N286) splits `dim 52 = jActL(g₂)[14] ⊕ family-so(3)[3, N288/N289] ⊕ CROSS[35 =
  7×5]`; N288–N290 built ONLY the family piece and its self-blindness (N290 the invariant core =
  scalar unit, so the arena supplies NO fixed direction to break the family symmetry). N291 banks a
  concrete member of the CROSS complement: `Mc := innerMul (slotA u1)(slotB 1)` (`u1` the fold-root
  √−1, imaginary; `slotA u1` Hermitian). Unlike the gauge-CENTRAL family generators (N288), `Mc` is
  gauge-COVARIANT with the exact DEFINING law `⁅jActL D, Mc⁆ = innerMul (slotA (D u1))(slotB 1)`
  (`coupling_covariance`, the SAME N287 Leibniz lever but only ONE real-unit slot → one surviving
  term), vanishing IFF `D u1 = 0`. TWO forced consequences tie ★5↔★2 by ONE cause (`u1`):
  COLOUR-NEUTRAL (`coupling_colour_neutral` — colour kills `u1`, N201) + ISOSPIN-COVARIANT (W8
  `coupling_isospin_covariant_ne_zero` — `DJ u1 = ιO(−2•hK) ≠ 0`, N202); the fold-root's
  COLOUR-BLINDNESS (N266) FORCES the family-breaking coupling into the colour-neutral / electroweak
  sector. And `Mc` is FAMILY-VISIBLE (the family so(3) MOVES it, contrast N290's blind core) and
  MOVES the diagonal the entrywise gauge fixes (`coupling_moves_diagonal`). THE DISSOLUTION/MOAT: the
  field POSITS a Yukawa/flavour-breaking spurion + the G₂×SU(2) embedding + CHOOSES the sector BY
  HAND; the theory posits NEITHER — the coupling is FORCED as the derived f₄'s (gauge⊕family)
  complement, its transformation law the fold's own Leibniz lever, its colour-neutrality forced by
  the fold-root being colour-blind. Cap-bounded at order 3 (`jordan_fails_H4` in the capstone TYPE).
  NOT banked: the actual ★5 texture / mass ratios / CKM-PMNS, the mixing angle VALUE (★2), the full
  35-dim CROSS module / (7,5) branching character (optional hardening), the
  `f₄ = Der(J₃(O))`.
  N292: THE FOLD-ROOT-DRESSED FAMILY-BREAKING COSET — N291 built ONE member of the CROSS complement;
  N292 builds the full OFF-DIAGONAL coset as the FOLD-ROOT dressing of the three family generators
  (`kAB = innerMul (slotA u1)(slotB 1)` [= N291's Mc], `kBC = innerMul (slotB u1)(slotC 1)`,
  `kCA = innerMul (slotC u1)(slotA 1)`) and PLACES it in its algebraic home: the derived
  colour-centralizer `Z_{f4}(colour)` is a dim-8 SIMPLE su(3) (measured: bracket-closed, Killing
  all-negative) whose maximal compact is the family `so(3)` and whose symmetric complement is the
  fold-root-dressed coset — so the family symmetry SITS INSIDE a larger derived su(3), broken to
  `so(3)` BY THE FOLD-ROOT `u1`. Banks: `kBC, kCA ∈ derH3`; COLOUR-NEUTRAL (`cosetBC_colour_neutral`
  — the fold-root is colour-blind); the GENERATION-ROTATION ACTIONS `kAB (slotA 1) = slotB u1`,
  `kAB (slotB 1) = slotA u1`, `kAB (slotC 1) = 0` (the u1-DRESSED analog of the undressed family
  rotation N288, moving the three cap-forced generations through the fold's √−1); FAMILY-VISIBLE W8
  (`kAB (slotA 1) ≠ 0`, NOT in N290's blind core); capstone `colour_centralizer_coset`. THE
  DISSOLUTION/MOAT: the field POSITS `F₄ ⊃ SU(3)_c × SU(3)_flavour` + CHOOSES the SU(3)_flavour →
  SO(3) breaking by hand; the theory DERIVES `SU(3)_flavour = Z_{f4}(colour)` and its breaking as the
  fold-root dressing. Cap-bounded at order 3. NOT banked: the su(3)/so(3) symmetric-pair CLOSURE
  `⁅kAB,kBC⁆ = famB` (measured residual 0.0, CHILDED as a directed W1 node — the N288→N289 analog),
  the full 8-dim su(3) as a bundled LieSubalgebra, the (7,5) module character, the ★2 mixing VALUE
  (route-not-yet-found), the ★5 mass texture / CKM-PMNS.
  N293: THE su(3)/so(3) SYMMETRIC-PAIR CLOSURE — N292 childed the closure of the fold-root-dressed
  coset back into the family; N293 BANKS it: ★★★ `⁅kAB, kBC⁆ = famB`, `⁅kBC, kCA⁆ = famC`,
  `⁅kCA, kAB⁆ = −famA` (cyclic), so the family-so(3) [maximal compact] and the fold-root-dressed
  coset [5] CLOSE the dim-8 SIMPLE su(3) = `Z_{f4}(colour)` — the family symmetry is now COMPLETE as
  the maximal compact of a genuine derived simple su(3), and the family-breaking is the "square-root"
  of the family so(3). THE DISSOLUTION (extends N289's collapse to the fold-root, NO coordinate bash):
  the coset generators ARE matrix-commutator endomorphisms `adE(u1M ·)` on the FOLD-ROOT LINE
  (`u1M P i j = ocR (P i j)·u1`, right-central collapse); the fold-root ALTERNATIVITY Lie-hom
  (`adE_bracket_u1` — every entry on `ℚ·u1`, matrix associators vanish entrywise by the octonion
  alternative laws `mul_mul_left/right`, `mul_flex`); and the fold-root's OWN SQUARE `u1²=−1`
  (`complexUnit_sq`) sends two fold-root-line matrices to a REAL central matrix (`u1M_mul`:
  `u1M P · u1M Q = −ocRM(P·Q)`), landing the bracket back in the family via a pure-ℚ 0/±1 structure
  constant. THE PHYSICS / ONE CAUSE: the SAME octonion non-associativity that stops the cascade — in
  its ALTERNATIVE guise plus the fold-root's `u1²=−1` — is WHY two fold-root-dressed family-BREAKING
  directions REGENERATE the real family so(3). Cap-bounded at order 3 (`jordan_fails_H4` in the
  capstone TYPE); non-abelian (`famB ≠ 0`, N289). NOT banked: the full dim-8 su(3) as a bundled
  LieSubalgebra, the (7,5) module character, the ★2 mixing VALUE (route-not-yet-found), the ★5 mass
  texture / CKM-PMNS.
  N301: THE FAMILY-so(3) ROTATION OF THE MASS-TEXTURE MODULE — the DIAGONAL mass-splitting sector and
  the OFF-DIAGONAL generation-mixing sector are ONE family orbit in `L₀`, ISOSPECTRALLY. The family
  generator `famC = innerMul (slotA 1)(slotB 1) ∈ f₄` carries the diagonal mass-splitting mover
  `Lmul (Dg t0 t1 t2)` to the off-diagonal generation-mixing mover `Lmul (slotC ((t2−t1)•1))`
  (`family_rotates_split_to_mix`, via `famC_diag_to_mix` = N274 `innerMul_slot_diag` + N296
  equivariance) and BACK (`family_rotates_mix_to_split`, `famC (slotC c) = Dg 0 (2reQc)(−2reQc)`,
  traceless), while FIXING the `f₄`-central universal-mass dilation `Lmul 1` (`family_fixes_dilation`,
  N297) — the two sectors are one family-`so(3)` orbit in `L₀`, the dilation the family singlet. And
  the rotation is ISOSPECTRAL: it preserves the LINEAR (`family_kills_linear_spectral`, `rtr(famC A)=0`
  via N300 `derH3_kills_jTr`) and QUADRATIC (`family_kills_quadratic_spectral`, `rtr(jb A (famC A))=0`
  via the derivation Leibniz law + N300 on the Hermitian `jb A A`) spectral invariants — MIXING WITHOUT
  CHANGING THE SPECTRUM. THE DISSOLUTION/MOAT: the field POSITS the CKM/PMNS mixing matrix as free
  parameters (mass↔flavour eigenbasis misalignment) + a SEPARATE Yukawa mass texture; the theory
  DISSOLVES the separation — mixing IS the spectrum-preserving family rotation of the mass texture,
  forced by the arena's own Jordan multiplication and the fold-forced family symmetry. ONE CAUSE: the
  same octonion non-associativity that caps the tower at 3 (N5) furnishes the three matter slots, the
  spectrum-movers `L₀`, the family `so(3)`, AND forces the family rotation to carry the mass-splitting
  sector into the mixing sector isospectrally. W8 `family_rotates_split_to_mix_ne`; capstone
  `family_mass_mixing_orbit_structure` (+`jordan_fails_H4` in TYPE). NOT banked: the CUBIC-norm `jN`
  preservation / full isospectrality (childed if wanted), the ★2 mixing-angle VALUE (route-not-yet-
  found — FORCED build target), the ★5 mass-ratio VALUES, "= physical CKM/PMNS" (removable prose), the
  dim-78 bundled `e₆`.
  N302: THE CUBIC/DETERMINANT ISOSPECTRALITY — `f₄ = Der(H₃(O)) = derH3` PRESERVES THE FULL SPECTRUM of
  the derived arena (all three cap-forced char-poly coefficients), completing N301's explicitly-childed
  cubic rung and GENERALIZING it from `famC` to the WHOLE `f₄`. The arena's char-poly has EXACTLY THREE
  coefficients (`jTr`, `jS`, `jN` — N214/N216 `jN_charpoly`) because the Jordan tower is cap-forced at
  order 3 (N5); "isospectral" = preserving ALL THREE. `derH3_kills_cubic_spectral` (`rtr(jb (jb A A)(T A))
  = 0` for ALL `T ∈ derH3`, Hermitian `A`) is the σ₃/reduced-determinant first-variation vanishing — NO
  cubic power-associativity (the naive `T(A∘A∘A)=3(A∘A)∘TA` FAILS over the octonions, measured resid
  6.07e+01); the clean route is `T`'s Leibniz law on the Hermitian trace-zero `jb(jb A A)A` (N300 kills
  its trace) + the S₃-symmetry of the derived trace 3-form `rtr(jb(jb X Y)Z)` (`rtr_jb_cyc`, N298
  `traceform_associative`). With `derH3_kills_quadratic_spectral` (the famC-only N301 quadratic lifted to
  all of `f₄`) and N300's linear `derH3_kills_jTr`, the capstone `derH3_isospectral` bundles
  DjTr=DjS=DjN=0 — `f₄` preserves the full spectrum, so the family mixing is isospectral to FULL cubic
  order. W8 `derH3_isospectral_nonvacuous` (`famC (slotB 1) = slotA 1 ≠ 0`). THE DISSOLUTION/MOAT: the
  field takes `F₄=Aut(J₃O)` preserving the cubic norm as an EXTERNAL invariant-theory fact + posits masses
  & mixing independent; the theory DERIVES it from the fold's OWN trace-associativity — the SAME
  `reQ_mul_assoc3` (N209) that makes the cubic norm WELL-DEFINED (N215 `jN_cross_assoc`) makes its
  variation VANISH. Masses and mixing are ONE isospectral orbit; the ★5↔★2 dissolution now COMPLETE at
  all three coefficients (N301 was only two). NOT banked: the ★2 mixing-angle VALUE / the ★5 mass-ratio
  VALUES (route-not-yet-found — FORCED build targets; N275 family A₂ has NO fixed root, so a distinguished
  texture/value needs symmetry-breaking beyond the current family-symmetric structure), the dim-78 `e₆`.]
  N303: THE FOLD-ROOT COMPLEXIFICATION OF THE GENERATION-MIXING SECTOR — the family-symmetry-BREAKING
  coset (N291–293) carries the diagonal mass-splitting into the fold's IMAGINARY mixing direction
  (isospectrally), and the family rotation of the mass-texture module is a COMPLEX `su(3)_flavour`
  rotation whose phase axis is the fold-root √−1. The two banked halves — the isospectral mass-texture
  module + REAL family-`so(3)` rotation (N301/302) and the family-BREAKING fold-root-dressed coset
  (N291–293) — are here connected for the first time. THE IMAGINARY LEG: the breaking generator
  `kAB = innerMul (slotA u1)(slotB 1) ∈ derH3` (`coupling_mem_derH3`) sends the diagonal mass-splitting
  mover to `slotC ((t2−t1)•(−u1))` (`kAB_diag_to_imag_mix`, the u1-dressed twin of N301's
  `famC (Dg t) = slotC ((t2−t1)•1)`), so `⁅kAB, Lmul (Dg t)⁆ B = Lmul (slotC ((t2−t1)•(−u1))) B`
  (`breaking_rotates_split_to_imag_mix`, via N296). THE COMPLEX LINE: the two produced mixing directions
  `slotC (r•1)` (real, famC) and `slotC (s•u1)` (imaginary, kAB) are `slotC` of the fold's OWN `ℂ`-core
  `span{1, u1}` (N266, the colour-neutral core of matter), `u1` the fold-root √−1
  (`one_in_fold_core`/`u1_in_fold_core`). THE COMPLEX STRUCTURE: the bracket `famMixJ = ⁅famC, kAB⁆`
  phases the mixing plane — `famMixJ (slotC 1) = slotC ((−4)•u1)` (`famMixJ_slotC_one`),
  `famMixJ (slotC u1) = slotC (4•1)` (`famMixJ_slotC_u1`), so `famMixJ² = −16` on `span{slotC 1, slotC u1}`
  (`famMixJ_sq_slotC_one`) — the derived `su(3)_flavour` Cartan multiplying the mixing coupling by the
  fold-root, a genuine complex structure. STILL ISOSPECTRAL: the breaking generator preserves all three
  char-poly coefficients (`kAB_kills_linear/quadratic/cubic`, free from N300/302, `kAB ∈ derH3`) — the
  complex mixing rotation preserves the full spectrum, exactly as a unitary CKM rotation preserves masses.
  W8 `kAB_imag_mix_nonvacuous` (`kAB (Dg 0 0 1) = slotC (−u1) ≠ 0`); capstone
  `family_mixing_complexification_structure` (+`jordan_fails_H4` in TYPE). THE DISSOLUTION/MOAT: the field
  posits CKM/PMNS as a COMPLEX unitary matrix — real angles PLUS an INDEPENDENT free CP-violating phase;
  the theory DERIVES the mixing sector as complex, its imaginary/CP-phase axis IS the fold-root √−1 (the
  SAME √−1 that is the cascade's first complex unit N2 and the colour-neutral core N266). The complex
  phase of mixing is not a free parameter; it is the fold-root; and the complex mixing is STILL
  isospectral. ONE CAUSE: the fold-root `u1` wears all faces — the first doubling's √−1 (N2), the
  colour-neutral core (N266), the `su(3)_flavour → so(3)` breaker (N292), AND the complex/CP-phase axis
  of generation mixing here. NOT banked: the ★2/★5 mixing-angle / mass-ratio / CP-phase VALUE
  (route-not-yet-found — FORCED build targets; N275 family A₂ has NO fixed root), "= physical CKM/PMNS
  δ_CP" (removable prose), the full bundled dim-8 `su(3)_flavour` LieSubalgebra (optional hardening), the
  dim-78 `e₆`.]**
  N304: THE GENERATION FOLD-ROOT CHARGES OF THE FAMILY COMPLEX-STRUCTURE GENERATOR — the SINGLE banked
  family complex-structure generator `famMixJ = ⁅famC, kAB⁆ ∈ f₄ = derH3` (N303, the derived
  `su(3)_flavour` Cartan element phasing generation-mixing by the fold-root √−1) acts DIAGONALLY on the
  three cap-forced generation slots `slotA 1, slotB 1, slotC 1` (the three matter copies, N267/N268)
  with three DISTINCT NONZERO integer fold-root (`u1`) charges: `famMixJ (slotA 1) = slotA (2•u1)`
  (`famMixJ_slotA_one`, charge +2), `famMixJ (slotB 1) = slotB ((−2)•u1)` (`famMixJ_slotB_one`, −2),
  `famMixJ (slotC 1) = slotC ((−4)•u1)` (`famMixJ_slotC_charge` = N303 `famMixJ_slotC_one`, −4), the
  three images pairwise distinct (`slotA/slotB/slotC_charge_ne_*`, via `smul_u1_ne_zero` + slot-entry
  injectivity). THE REFINEMENT / MOAT: standard flavour physics treats the three generations as three
  IDENTICAL copies of one matter representation (the "generation puzzle"); N268 derived the cap at three
  identical copies. This node REFINES that — the copies, identical under the gauge structure, carry
  three DISTINCT nonzero fold-root charges +2,−2,−4 under the arena's OWN inner-multiplication bracket
  `⁅famC,kAB⁆`. The generations are told apart, not by a posited horizontal charge, but by the fold-root
  phase. THE CEILING, LOCALIZED: since `famMixJ ∈ f₄` (N303) and `f₄` is isospectral (N302, masses =
  char-poly coefficients, all `f₄`-preserved), the fold-root charge is INVISIBLE to the spectrum in the
  `f₄`-symmetric limit — so the generation mass SPLITTING is precisely localized as a phenomenon that
  must be driven by a fold-derived element BEYOND the isospectral `f₄`, a Weyl-breaking element of the
  spectrum-mover sector `L₀` (a NAMED-but-unbuilt target — pursued via the owner-authorized flavor seed
  route N305, docs/SEED_FLAVOR_SELF_BLINDNESS.md, which redirects to the self-blindness/gather side). ONE CAUSE: the
  fold-root `u1` — the cascade's first √−1 (N2), the colour-neutral core (N266), the `su(3)_flavour → so(3)`
  breaker (N292), the complex/CP-phase axis of mixing (N303) — is here the phase whose distinct integer
  charges tell the three generations apart. Capstone `generation_foldroot_charges` (+`jordan_fails_H4` N5
  in TYPE). NOT banked: the full 3×3 weight matrix of all three `⁅famX,kXY⁆` (JA/JB rows need unbanked
  famA/famB/kBC/kCA slot actions, and carry a `u(1)` trace so are NOT the traceless `su(3)` Cartan —
  claiming otherwise would be an overclaim); the full-arena commuting-Cartan brackets (generic Lie
  machinery); the ★2/★5 mixing-angle / mass-ratio / CP-phase VALUE (route-not-yet-found — FORCED build
  targets; N275 no fixed root); the Weyl-breaking `L₀` element that lifts the degeneracy (a NAMED-but-
  unbuilt target, pursued via the owner-authorized flavor seed route N305).
  N305: THE ℤ₃ SELF-BLIND GENERATION CYCLE AND ITS FORCED BORN-WEIGHT SPLIT (owner-authorized flavor
  seed, docs/SEED_FLAVOR_SELF_BLINDNESS.md, targets T1+T2) — the FIRST node on the gather/self-blindness
  side. The fold's founding move (self-look-back → the MISS, no nonzero fixed point) reappears at the
  GENERATION level: each of the three cap-forced primitive idempotents (N267/N300 `Eidem`) is a probe
  that sees the other two and is blind to itself. T1 — the ℤ₃ cycle: `gcyc := finRotate 3` is FIXED-
  POINT-FREE (`gcyc_fpf`, self-blindness — C6 forces the bounded no-fixed-point coherence process to
  CYCLE `e₁→e₂→e₃→e₁`), fixes NO generation (`gen_no_fixed`, via the banked S₃ Jordan-automorphism
  action `pconj_Eidem` N300) but FIXES the democratic Unity gather (`unity_fixed`, the DC mode);
  GROUNDING `see_others_i`: `Eidem (gcyc i)+Eidem (gcyc² i)=1−Eidem i` — each probe sees exactly the two
  idempotents that are not itself. T2 — the forced Born weights (the first DERIVED value): the diagonal-
  zero (self-blind) seeing operator `seeMat = Jall−1` over ℚ has spectral projectors `Pdem=(1/3)Jall`
  (eig +2, Unity, dim 1) and `Poth=1−(1/3)Jall` (eig −1, others, dim 2); ★★★ `born_fraction_others` —
  the normalized weight killing the self-view balance is UNIQUE, `w0+w1=1 ∧ w0·2+w1·(−1)=0 ⟹ w1=2/3`
  (a `linarith` uniqueness LANDING, DERIVED not asserted; `born_fraction_dem` gives `w0=1/3`;
  `born_fraction_forced_gen` the uniform self-blind fraction `(n−1)/n`). THE DISSOLUTION/MOAT: the SM
  POSITS three generations AND a democratic/Fritzsch texture by hand; the theory DERIVES both — the count
  is the cap C(3,2) (N267/N5), and the 2/3 self-seen fraction is FORCED by self-blindness (diagonal 0) +
  normalization, a Born-counting landing, not a fit. The 2/3 is the same self=other balance that makes
  Koide Q=2/3 an identity downstream (T4). ONE CAUSE: the SAME octonion non-associativity that stops the
  cascade (N2c) and caps the Jordan tower at 3 (N5, `jordan_fails_H4`) — furnishing exactly three
  idempotents — now carries the fold's self-blindness to the generation level. Capstone
  `generation_cycle_born_split_structure` (+`jordan_fails_H4` N5 in TYPE). SEED GUARDS: G1 (2/3 & 1/3
  proved uniqueness landings, never premises), G2 (no measured mass/coupling/PDG number), G4 (no cycle-
  FORM ansatz — that is T3, downstream). NOT banked: the cycle FORM of the amplitudes (T3 — the single
  directed successor: the ℤ₃-Fourier structure Unity-DC + one cycle mode, with the √2 from the T2
  self=other balance), the Koide Q=2/3 (T4), the phase δ_B (T5, the crux — holonomy=statistics, derive-
  or-CHAIN-RUNWAY-block), the mass ratios (T6), quark deviation (T7), mixing (T8).**
  N306: THE ℤ₃-FOURIER CYCLE FORM OF THE COHERENCE AMPLITUDES (owner-authorized flavor seed, target T3,
  directed successor of N305). The amplitude on the self-blind ℤ₃ generation cycle is DERIVED as its
  ℤ₃-Fourier expansion — a Unity/DC mode (cycle-invariant, gathered) ⊕ ONE cycle mode (the turning) ⊕
  NOTHING ELSE — and the DC-vs-cycle amplitude ratio (the √2) is FORCED by the N305-T2 self=other Born
  balance, NOT posited as an ansatz (seed G4, the ansatz-danger point). §1 — DC⊕one cycle mode⊕nothing:
  the cyclic-shift matrix `Pcyc` (the permutation matrix of the banked `gcyc`, `Pcyc_ground` — grounded)
  fixes the DC/Unity mode (`Pcyc_Pdem : Pcyc*Pdem=Pdem`, the shadow of `unity_fixed`) and, on the banked
  cycle subspace `Poth`, obeys the ℤ₃ cyclotomic `1+Pcyc+Pcyc²=0` (`cyc_cyclotomic_on_Poth`) — `x²+x+1`
  irreducible over ℚ = degree 2 = ONE conjugate pair ω,ω² = exactly ONE cosine mode + phase, NOTHING
  else; with `Pdem+Poth=1` (banked P_sum) + `Pdem⊥Poth` (banked P_orth) this IS "DC⊕one cycle mode⊕
  nothing". §2 — Parseval: `Σaₖ²=DCpower+cyclepower` on the banked projectors. §3 — the forced √2:
  ★★ `forced_sqrt2` — the self=other Born balance `DCpower=cyclepower` (the SAME balance that killed the
  seeing operator's self-view in T2) FORCES `A²=2M²` — the unique positive amplitude ratio A/M=√2,
  DERIVED not asserted (over ℚ the amplitude-SQUARED form, exact; the √ is the Born-square-root reading,
  prose); ★ `balance_forces_koide` — the balance makes the Koide quantity `(Σaₖ²)/(Σaₖ)²=2/3` for ANY
  amplitude, hence ANY phase δ (the T4 landing already visible), and δ is left SYMBOLIC (fixed only at
  T5). W8 `koide_not_one`: the 45° balance (A²=2M², Q=2/3) is DISTINCT from the WRONG 2:1 operator-weight
  reading (A²=4M², Q=1). THE DISSOLUTION/MOAT: the SM/Brannen parametrization POSITS the √2·cos Koide form
  as an ansatz FITTED to measured lepton masses; the theory DERIVES it — the form is the ℤ₃-Fourier
  structure of the banked self-blind cycle, the √2 forced by the self=other Born balance. ONE CAUSE: the
  SAME octonion non-associativity (cascade stop N2c, Jordan cap order 3 N5, three idempotents N267/N300,
  the ℤ₃ self-blind cycle N305) now delivers the amplitude FORM and its forced √2. Capstone
  `generation_cycle_form_structure` (+`jordan_fails_H4` N5 in TYPE). SEED GUARDS: G1 (√2/A²=2M² & the
  balance PROVED landings, never premises), G2 (no measured mass/coupling/PDG number; Koide 2/3 a
  structural identity, data-comparison removable prose), G4 (the FORM DERIVED — cyclotomic + Born balance
  — not posited/fitted; δ symbolic). NOT banked: the full Koide Q=2/3 on the cosine form for all δ (T4 —
  the single directed successor), the phase δ_B (T5, the crux — holonomy=statistics, derive-or-CHAIN-
  RUNWAY-block), the mass ratios (T6), quark deviation (T7), mixing (T8).
  N307: THE KOIDE IDENTITY Q = 2/3, FOR ALL PHASES δ (owner-authorized flavor seed, target T4, directed
  successor of N306). The Koide relation `Q = (Σaₖ²)/(Σaₖ)² = 2/3` is proved an EXACT IDENTITY of the
  N306 ℤ₃-Fourier cycle FORM, holding for ALL phases δ — not just the δ=0 slice. N306 banked the abstract
  landing `balance_forces_koide` (the self=other Born balance forces Q=2/3 for ANY amplitude) + the δ=0
  witness `cosVec`; T4's NEW content is to make the identity FULLY GENERAL and CONTINUOUS over δ — build
  the δ-family and prove the balance is δ-INVARIANT, hence Q=2/3 for every δ. THE POINT: the Koide relation
  is not δ-dependent — it is the self=other Born balance ITSELF, an identity of the cycle form independent
  of where the cycle sits relative to Unity's frame; the phase DROPS OUT. §1 — the δ-family over ℚ:
  `genVec M A p r := ![M+A·p, M−A·(p+r)/2, M−A·(p−r)/2]` (p=cos δ, r=√3·sin δ a RATIONAL conic point — the
  general form `M(1+√2·cos(δ+2πk/3))` with fully rational entries, the √3 absorbed into r; `genVec_zero`:
  the δ=0 point (1,0) recovers the banked `cosVec`), `mean_genVec=M`/`DCpower_genVec=3M²` (phase-independent).
  §2 — the δ-invariance (the heart): ★ `cyclepower_genVec_core` (`cyclepower=A²(3p²+r²)/2`, exact ℚ) → ★★
  `cyclepower_genVec` (under the RATIONAL phase conic `3p²+r²=3`, `cyclepower=(3/2)A²` — the SAME at EVERY δ:
  the turning has equal Born power in every rotated frame, the continuous analogue of the banked
  `Pcyc_Poth_comm`; with `DCpower=3M²` this makes the balance `DCpower=cyclepower` δ-INVARIANT). §3 — Q=2/3
  for ALL δ: ★ `forced_sqrt2_genVec` (the balance forces `A²=2M²` at every phase — the SAME √2 everywhere,
  the phase does not enter), ★★★ `koide_genVec` (`3p²+r²=3 → M≠0 → A²=2M² → Qkoide(genVec)=2/3` — THE T4
  LANDING, via the banked `balance_forces_koide`), W8 `koide_genVec_not_one` (the WRONG ratio A²=4M² gives
  Q=1 for the whole family — Q=2/3 is a real consequence of the forced √2, not an artifact). §4 — grounded
  on the banked cycle: `Pcyc_mulVec` (Pcyc.mulVec a=![a2,a0,a1]), ★ `cyclepower_Pcyc_inv`/`Qkoide_Pcyc_inv`
  (the cycle power AND the Koide quantity are invariant under the banked ℤ₃ shift Pcyc — the discrete shadow
  of the continuous δ-invariance). THE MODELING DECISION (seed G7, ONE LAW): a genuine `cos(δ+…)` over
  Mathlib ℝ would be the FIRST analytic node (grep: NO Phys file uses Real.cos) — tripping the number-tower
  gate — so the √3 is absorbed into r and the phase circle becomes the exact ℚ conic 3p²+r²=3; exact over ℚ,
  no trig, no field extension (Route B REJECTED, Route A CHOSEN, both MEASURED). THE DISSOLUTION/MOAT:
  Koide's 2/3 is a standard-framework near-coincidence of three measured masses (Brannen's √2·cos an ansatz
  FITTED to them, δ a fit param ≈2/9); the theory DERIVES it as an IDENTITY for ALL δ — the self=other Born
  balance of the banked self-blind cycle (N305 T2), δ-invariant by the rotation-invariance of the cycle-mode
  power (N306 Pcyc_Poth_comm); Q=2/3 needs NO fit and NO particular δ. ONE CAUSE: the SAME octonion
  non-associativity (cascade stop N2c, Jordan cap order 3 N5, three idempotents N267/N300, the ℤ₃ self-blind
  cycle N305, the ℤ₃-Fourier form + forced √2 N306) now makes Koide a phase-independent identity. Capstone
  `generation_koide_all_phases` (+`jordan_fails_H4` N5 in TYPE). SEED GUARDS: G1 (2/3 falls out of the banked
  balance, A²=2M² from the balance — PROVED landings), G2 (no measured mass/coupling/PDG number; comparison
  to e,μ,τ removable prose), G4 (DERIVED from the cycle form + δ-invariance, NOT fitted). NOT banked: the
  phase δ_B=2/9 (T5, THE CRUX — holonomy=statistics, derive-or-CHAIN-RUNWAY-block), the mass ratios (T6),
  quark deviation (T7), mixing (T8).**
  N308: THE CRUX — THE CYCLE PHASE δ_B = 2/9 FROM HOLONOMY = STATISTICS (owner-authorized flavor seed,
  target T5, THE CRUX, directed successor of N307). The cycle phase δ_B — the ONE remaining free parameter
  of the derived ℤ₃-Fourier cycle form (N307 proved Koide Q=2/3 for ALL δ; T5 FIXES δ) — is DERIVED as
  `δ_B=2/9`, NEVER asserted, from a holonomy=statistics consistency that is ITSELF a theorem of the banked
  self-blindness (NOT a bridge, NOT a posit — the load-bearing link seed §3 flagged as the crux, DERIVED
  not blocked). §1 — holonomy=statistics at the OPERATOR level: ★★★ `seeMat_eq_cycle_holonomy`
  (`seeMat=Pcyc+Pcyc²` — the banked self-blind SEEING operator `seeMat=Jall−1` (N305 T2, statistics: each
  generation sees the n−1 others, blind to itself) IS LITERALLY the ℤ₃ loop-HOLONOMY operator, forward
  transport Pcyc + backward transport Pcyc², via the banked `cyc_sum_Jall` `1+Pcyc+Pcyc²=Jall` N306 —
  "holonomy=statistics" as a literal operator identity on the banked objects), `holonomy_diag_zero`
  (self-blindness at the holonomy level), `cycle_holonomy_on_Pdem` (=2•Pdem, gather holonomy-invariant),
  `cycle_holonomy_on_Poth` (=(−1)•Poth, turning eigenvalue −1). §2 — the fixed-point equation IS the banked
  self-blindness balance (THE CRUX DERIVATION, G4): ★★★ `holonomy_from_selfblind`
  (`(1−T)(n−1)+T·(−1)=0 → n·T(1−T)=T` — the consistency *total loop holonomy = total Born return
  probability* is DERIVED, NOT posited, from the banked N305 self-view-vanishes balance `weight_balance`:
  the balance forces `n(1−T)=1`, hence `n·T(1−T)=T·(n(1−T))=T·1=T`; no new posit, no T≠0 needed),
  `selfblind_from_holonomy` (converse, T≠0 — the two conditions IDENTICAL). §3 — the solve (exact ℚ):
  `born_fixedpoint_solve` (`n·T(1−T)=T, T≠0, n≠0 → T=(n−1)/n`, the unique nonzero root = the banked
  self-seen fraction N305 `born_fraction_forced_gen`), ★ `cyclephase_value` (`→ T(1−T)=(n−1)/n²`). §4 — the
  n=3 landing on the banked traces (δ_B=2/9 FALLS OUT): ★★★ `selfseen_satisfies_fixedpoint`
  (`3·((tr Poth/3)(1−tr Poth/3))=tr Poth/3` — the banked self-seen fraction SATISFIES the holonomy fixed
  point via §2; self-blindness ⟹ holonomy), ★★★ `cyclephase_delta_B` (`(tr Poth/3)(1−tr Poth/3)=2/9` — THE
  CRUX LANDING: δ_B=T(1−T)=(2/3)(1/3)=2/9, a pure rational Born count, NOT a fraction of π; the geometric
  2π/9 de-π'd to the Born interference count — DERIVED from the banked traces, never asserted), ★
  `cyclephase_as_weight_product` (`(tr Pdem/3)(tr Poth/3)=2/9` — δ_B is the product of the two banked Born
  weights, self×other interference on one edge, Born=self-overlap the trunk), ★★ `total_holonomy_closes`
  (`3·δ_B=2/3=T` — the total loop holonomy EQUALS the statistics, holonomy=statistics closed numerically at
  the derived phase). §5 — W8 non-vacuity: `cyclephase_not_selfseen` (2/9≠2/3), `cyclephase_not_democratic`
  (2/9≠1/3), ★ `fixedpoint_excludes_half` (a WRONG T=1/2 does NOT satisfy the holonomy fixed point at n=3 —
  the equation genuinely SELECTS 2/3), `fixedpoint_forces_two_thirds` (uniqueness). THE CRUX NAVIGATED
  (seed §3, owner reframe "GO IN WITH NO FEAR — T5 DERIVES"): δ_B rests on ONE identification — "cycle
  holonomy = total Born return probability" — NOT assertable in this ontology; DERIVED as a theorem of the
  banked self-blindness in TWO grounded halves: (a) the OPERATOR identity `seeMat=Pcyc+Pcyc²` makes the
  statistics operator literally the loop-holonomy operator, and (b) the fixed-point equation `n·T(1−T)=T`
  is PROVABLY the banked N305 self-view-vanishes balance (both reduce to `n(1−T)=1`, i.e. `tr Pdem=1`, the
  rank-1 democratic gather). NO CHAIN-RUNWAY BLOCK NEEDED — the identification derived cleanly (the whole
  route compiled in one bounded probe, EXIT 0 34s, foundations-only). THE DISSOLUTION/MOAT: Brannen's Koide
  phase δ_B≈2/9 is a standard-framework FIT parameter tuned to the three measured lepton masses; the theory
  DERIVES it — δ_B is the fixed point of the holonomy=statistics consistency on the self-blind ℤ₃
  visibility cycle, and that fixed-point equation is the SAME self-view-vanishes balance that forced the
  Born split T=2/3 (N305) and the Koide 2/3 (N307). ONE CAUSE, THREE LANDINGS: the rank-1 democratic gather
  `n(1−T)=1` (self-blindness) forces the Born split T=2/3 (N305), Koide 2/3 (N307), and now δ_B=2/9 (N308)
  — one mathematical fact, three physical landings. Capstone `generation_cycle_phase_structure`
  (+`jordan_fails_H4` N5 in TYPE). SEED GUARDS: G1 (2/3, 2/9, the fixed-point equation ALL fall out — never
  premised), G2 (no measured mass/coupling/PDG number; Brannen's measured δ_B≈2/9 removable prose/costume
  only), G4 (the fixed-point equation is DERIVED from holonomy=statistics itself derived from
  self-blindness — NOT posited and solved backward). C337 bites 2=337. NOT banked: the mass ratios (T6 —
  forced functions of Q=2/3 and δ_B=2/9, the single directed successor), quark associator deviation (T7),
  mixing (T8).**
  N309: THE GENERATION MASS RATIOS AS A FORCED CUBIC (owner-authorized flavor seed, target T6, directed
  successor of N308). With the banked Q=2/3 (N307) and δ_B=2/9 (N308), the dimensionless generation mass
  RATIOS are forced functions of them — the generation MASS SPECTRUM is a FORCED CUBIC with ZERO free
  shape parameters. THE ROUTE: masses are BORN SQUARES of the banked amplitudes — √mₖ = genVec (N307), so
  mₖ = (√mₖ)² = aₖ² (Born = self-overlap, the trunk); the whole spectrum is the three symmetric functions
  of the masses. Phys/Algebra/OctonionJordanGenerationMassRatios.lean, ns Phys.Algebra.HJ, 21 decls: §1
  ★★ `sigma1_mass` (Σmₖ = 6M² — the total mass / linear cubic coefficient FORCED and δ-INVARIANT by the
  Koide balance A²=2M², = 3M²+(3/2)A²; the mass-level content of Koide Q=6M²/9M²=2/3), `mass_koide`
  (Σmₖ/(Σ√mₖ)²=2/3 on the masses); §2 the forced cubic — `e3amp`=a₀a₁a₂ (the SINGLE phase-carrier), ★
  `e3amp_closed` (e₃ = M³ − M·A²(3p²+r²)/4 + A³p(p²−r²)/4, on the conic = (M²/2)(A(4p³−3p)−M),
  4p³−3p=cos(3δ)), ★★ `sigma2_mass` (Σ_{i<j}mᵢmⱼ = (9/4)M⁴ − 6M·e₃, phase ONLY through e₃), ★
  `sigma3_mass` (Πmₖ = e₃²), ★★★ `mass_cubic` ((t−m₀)(t−m₁)(t−m₂) = t³ − 6M²t² + σ₂t − e₃² — the spectrum
  is a cubic whose LINEAR coeff 6M² is FORCED/phase-independent and whose quadratic/cubic coeffs are set by
  the SINGLE derived phase through e₃; the three mass RATIOS are forced functions of Q=2/3 (via σ₁) and δ_B
  (via e₃), ZERO free shape parameters, M the one scale); §3 the holonomy tie — ★ `triple_phase_is_holonomy`
  (3δ_B=3·(2/9)=2/3=T, the banked self-seen fraction — the spectrum's phase-shape cos(3δ_B) is the cosine of
  the TOTAL LOOP HOLONOMY, = N308 `total_holonomy_closes`); §4 non-vacuity — `mass_degenerate_at_zero`
  (m₁=m₂ at δ=0), `amp_distinct01/12/02` (3 distinct at the generic ℚ conic point (1/7,−12/7) — the phase
  genuinely controls the spectrum). Capstone `generation_mass_ratio_structure` (+`jordan_fails_H4` N5 in
  TYPE). THE ROUTE DECISION (W9 MEASURE-FIRST): route (a) three ℚ-exact rational ratios STRUCTURALLY
  IMPOSSIBLE (A/M=√2 irrational ⟹ ratios reduce to u=√2·cos(3δ_B), never ℚ); the forced ℚ-exact STRUCTURE
  banks here. The individual NUMERICAL ratios need cos(3δ_B)=cos(2/3 rad), a transcendental — the analytic ℝ,
  NOT yet descended from the fold — a FORWARD ℝ-descent BUILD dependency (route-NOT-YET-FOUND), NOT an ℝ
  import, NOT a CHAIN-RUNWAY block, NOT empirical, NOT fit-grade; honestly deferred to the ℝ-descent (the
  measured lepton match 206.77/3477 removable prose, G2). THE DISSOLUTION/MOAT: the SM has three FREE Yukawa
  numbers; the theory forces the whole spectrum — σ₁ by Koide (N307), the entire shape by the single derived
  δ_B (N308) — three masses ← one scale M + ZERO free shape parameters. ONE CAUSE: the SAME octonion
  non-associativity (cascade stop N2c, cap order 3 N5, three idempotents N267/300, the ℤ₃ self-blind cycle
  N305, the ℤ₃-Fourier form + √2 N306, Koide ∀δ N307, δ_B=2/9 N308) now delivers the mass spectrum as a
  forced cubic, its phase-shape tied to the banked total loop holonomy. SEED GUARDS: G1 (σ₁=6M², e₂(a)=(3/2)M²,
  the cubic ALL fall out of banked genVec/parseval/koide_genVec — never premised), G2 (no measured number;
  comparison to e,μ,τ removable prose), G3 (RATIOS derived, zero free shape parameters; M the one scale, a
  SCALE not a ratio), G4 (mass form = banked genVec evaluated at the derived δ_B, not a fitted ansatz). C338
  bites 6=338. NOT banked: the individual numerical mass ratios (need the ℝ-descent, forward BUILD dep),
  quark associator deviation (T7 — the single directed successor), mixing (T8).**

  N310: THE QUARK ASSOCIATOR DEVIATION / THE SEPARATION OF THE TWO GENERATION INVARIANTS (owner-authorized
  flavor seed, target T7, directed successor of N309). Leptons live on the ASSOCIATIVE ℂ-line and are EXACT
  at the 45° Born balance (cross-term I₃=0); quarks span an octonionic FANO line and DEVIATE by the
  associator (I₃≠0); the norm/Koide invariant Q (from the amplitude magnitudes, the quadratic I₂) and the
  CP/associator invariant I₃ (the antisymmetric triple-product Re(x₁x₂x₃)) are INDEPENDENT octonion
  invariants. The object that carries I₃ is the banked calibration 3-form `assoc3 x y z = gForm x (octCross
  y z) = −reQ(x·(y·z))` (N209, totally antisymmetric, Fano witness `assoc3 u2 u1 (u1×u2)=−1`); the vector
  associator is the banked `Phys.Algebra.assoc` (N5b). THE OBJECTS (Phys/Algebra/OctonionJordanGeneration-
  AssociatorDeviation.lean, ns Phys.Algebra.HJ, 14 decls): §1 the separation mechanism — ★ `assoc_central_
  homogeneous` (scaling the arguments by central real scalars factors `ocR(a·b·c)` OUT of the associator, so
  its VANISHING is a DIRECTION-only property, independent of the magnitudes that fix Q); §2 the associative
  ℂ-line EXACT — `cline a b = ocR a + ocR b·u1` (a copy of ℂ), `cline_mul` (closure = ordinary complex
  multiplication), ★★ `cline_assoc_zero` (three ℂ-line elements ASSOCIATE: leptons exact); §3 I₃ TRILINEAR —
  ★ `assoc3_scale` (a nonzero cross-term stays nonzero, a zero one stays zero at ANY magnitude); §4 the ℂ-line
  scalar I₃=0 — ★★ `assoc3_cline_zero` (the associative line carries NO cross-term); §5 the Fano line
  DEVIATING — ★ `fano_assoc3_ne_zero` (banked N209 witness=−1), ★ `fano_scaled_ne_zero` (`=−a·b·c≠0` — the
  deviation persists at every magnitude); §6 THE SEPARATION THEOREM — ★★★ `separation` (Qkoide(genVec)=2/3
  for EVERY phase (banked koide_genVec, Q reads NORMS alone) ∧ I₃ VANISHES on the ℂ-line ∧ I₃≠0 on the Fano
  line), ★★ `invariants_independent` (at matched magnitudes the ℂ-line has I₃=0 while the Fano line has
  I₃=−a·b·c≠0 — a single family of magnitudes realizes BOTH values of I₃, so I₃ is NOT a function of Q:
  Q←I₂/norms ⊥ I₃←the associator cross-term). THE DISSOLUTION/MOAT: the field POSITS separate Koide (mass)
  and CKM (CP) structures with independent free parameters; the theory DERIVES both from ONE octonion — Q
  from the norms (I₂), CP from the associator cross-term (I₃), their INDEPENDENCE from the trilinearity/
  central-homogeneity of the same banked assoc/assoc3. ONE CAUSE: the SAME octonion non-associativity
  (cascade stop N2c, cap order 3 N5, the ℤ₃ self-blind cycle N305, Koide ∀δ N307, δ_B=2/9 N308, the forced
  cubic N309) now separates the two flavor invariants — leptons exact on the associative ℂ-line, quarks
  deviating on the non-associative Fano line. SEED GUARDS: G1 (the deviation/separation fall out of banked
  assoc/assoc3/assoc3_witness — never premised), G2 (no measured CKM/quark number; comparison removable
  prose), G4 (the Fano line/associator is the banked object EVALUATED, not a new ansatz), G5–G7 met (ℚ-exact,
  no ℝ reached for). C339 bites 1=339. NOT banked: the numerical CP phase / Jarlskog value (needs the
  ℝ-descent, forward BUILD dep), the mixing angles / CKM matrix (T8 — the single directed successor,
  LEADING-ORDER per the seed's ⚠ HONEST-STATUS caveat, NOT theorem-exact like T1–T7).**
  N311: THE GENERATION-MIXING TRIDIAGONAL FRAME (owner-authorized flavor seed, target T8, the ℚ-exact
  structural half, directed successor of N310). Mixing is NOT a single mass ratio and NOT a quartic ground
  state — it is a FRAME OVERLAP: each sector is a TRIDIAGONAL structure on the three generations, and the
  mixing matrix is the overlap of the two diagonalized frames dressed by the fold phase. THE THEORY-NATIVE
  KEY (two dissolutions): (a) THE CORNER-ZERO `M₁₃ = 0` IS THE CASCADE TERMINATION. The three generations are
  the cascade rungs ℂ→ℍ→𝕆; the generation coupling follows the doubling adjacency (rung n couples to n±1),
  so rungs 1(ℂ) and 3(𝕆) are two doubling-steps apart AND the chain does NOT wrap (𝕆↛ℂ) because the cascade
  TERMINATES at 𝕆 (`cap_from_cascade_stop`/`not_associative` — the next double loses Born/division). So the
  coupling graph is the OPEN PATH `cascadePath` (corner 0), DISTINCT from the CLOSED coherence-cycle
  statistics operator `seeMat = Jall−1` (corner 1) exactly at the corner (`cascade_open_ne_closed`) — the
  corner-zero FALLS OUT of the cascade's termination, a SECOND termination of the same cascade stop that caps
  the count at three (the coherence cycle CLOSES by C6, the cascade coupling chain is OPEN by N2c). (b) THE
  GEOMETRIC-MEAN COUPLING IS ℚ-EXACT: the nearest-neighbour coupling `|xᵢⱼ|=√(mᵢmⱼ)` naively carries an
  irrational √, but the masses are Born squares `mₖ=aₖ²` (N309), so `√(mᵢmⱼ)=|aᵢaⱼ|` is the rational
  amplitude product — the √ DISSOLVES through the Born square (the ONE LAW reframe, as the N306 √2 was the
  amplitude-SQUARED A²=2M²). THE OBJECTS (Phys/Algebra/OctonionJordanGenerationMixingFrame.lean, ns
  Phys.Algebra.HJ, 21 decls): §1 the open coupling path — `cascadePath = !![0,1,0;1,0,1;0,1,0]`,
  `cascadePath_corner_zero` (M₁₃=0), `seeMat_corner_one` (the closed cycle has corner 1), ★★★
  `cascade_open_ne_closed` (open path ≠ closed cycle, differ at the corner — the corner-zero DERIVED); §2 the
  tridiagonal matrix — `massMat` (diagonal = banked `massVec` N309, nearest-neighbour off-diag = banked
  amplitude products `genVec i·genVec j` N307, corner 0), `massMat_diag/corner_zero/symm/offdiag`; §3 the
  geometric-mean coupling, ℚ-exact — ★★ `massMat_nn_born_01/12` (`(offdiag)²=mᵢmⱼ`, the √ dissolved); §4 the
  Gatto–Sartori–Tonin leading angle — ★ `gst_tan_sq_01/12` (`(offdiag/diagⱼ)²=mᵢ/mⱼ`, the relation
  θᵢⱼ~√(mᵢ/mⱼ), ℚ-exact at leading order); §5 non-vacuity — `corner_open_ne_cycle` (0≠1),
  `massMat_genuinely_tridiagonal` (nearest-neighbour ≠0 while corner =0), `coupling_geometric_not_arithmetic`
  (the coupling² is the PRODUCT mᵢmⱼ, NOT the sum mᵢ+mⱼ); ★★★ capstone `generation_mixing_frame_structure`
  (+jordan_fails_H4 N5 in TYPE). ⚠ HONEST STATUS (seed §2 T8 caveat): unlike T1–T7 (theorem-exact), the
  mixing sector lands only at LEADING ORDER (~few %) with precision masses — this node banks the ℚ-EXACT
  STRUCTURAL half; the two-sector FRAME OVERLAP (the CKM/PMNS matrix = misalignment of the up/down
  diagonalized frames) and the CP-phase-as-cascade-angle need the ℝ diagonalization and are the
  honestly-deferred T8 remainder (ℝ-descent BUILD dep, the N309 precedent — NOT imported, NOT blocked, NOT
  empirical). THE DISSOLUTION/MOAT: the SM inserts the CKM/PMNS angles as free numbers; the theory FORCES the
  structure — the tridiagonal frame from cascade adjacency, the corner-zero from the cascade termination, the
  geometric-mean couplings from the Born-square masses, the leading GST angles as forced relations — zero free
  continuous parameters. ONE CAUSE: the SAME octonion non-associativity (cascade stop N2c, cap order 3 N5, the
  whole flavor stack N305–N310) now OPENS the coupling chain (corner-zero) in addition to capping the count.
  SEED GUARDS: G1 (corner-zero/tridiagonal/geometric-mean fall out of the cascade adjacency + Born squares —
  never premised, never reverse-engineered from CKM data), G2 (no measured CKM/PMNS/Jarlskog in any proof;
  comparison removable prose, lands only at leading order), G3 (the structural frame the target, the
  per-sector scale a legit input), G4 (the tridiagonal is the cascade-adjacency object EVALUATED, not a fitted
  ansatz), G5–G7 met (the √ dissolved through the Born-square framing, no ℝ reached for). C340 bites 4=340.
  NOT banked: the two-sector frame overlap / the actual CKM & PMNS matrices, the exact numerical mixing angles
  (arctan needs ℝ), the CP-phase-as-cascade-angle (the single directed successor, the T8 ℝ-descent
  remainder).**
- **✅ N312 (★5) — THE TWO-SECTOR FRAME OVERLAP.**
  N312: THE TWO-SECTOR FRAME OVERLAP (owner-authorized flavor seed, target T8 REMAINDER, the ℚ-exact
  structural core, directed successor of N311). N311 banked ONE sector's tridiagonal frame `massMat`; T8's
  mixing matrix is the OVERLAP `V = U†D` of the TWO diagonalized sector frames (up & down; lepton/neutrino).
  THE THEORY-NATIVE KEY — THE DIAGONALIZATION DISSOLVES THROUGH `Born = self-overlap`: a generic symmetric
  tridiagonal has IRRATIONAL eigenvectors (char cubic no ℚ-factor) needing the derived ℝ, but `massMat` is NOT
  generic — each nearest-neighbour adjacency 2×2 block is the rank-1 BORN OUTER PRODUCT `(aᵢ,aⱼ)ᵀ(aᵢ,aⱼ)` of
  the banked amplitude direction (N307 `genVec`), because the diagonal is `aₖ·aₖ` and off-diagonal `aᵢ·aⱼ`. A
  rank-1 outer product has a RATIONAL eigenstructure: the amplitude direction `(aᵢ,aⱼ)` is the eigenvector for
  the large eigenvalue `mᵢ+mⱼ`, `(aⱼ,−aᵢ)` the null direction (eigenvalue 0) — both ℚ-EXACT, `det=0`; so the
  per-sector mass-basis frame directions are RATIONAL and the overlap `V=U†D` has ℚ-exact numerators; the √ /
  the ℝ eigen-toolkit DISSOLVES through the Born-square (the ONE LAW reframe, as N306's √2 / N311's
  geometric-mean coupling). THE OBJECTS (Phys/Algebra/OctonionJordanGenerationMixingOverlap.lean, ns
  Phys.Algebra.HJ, 17 audited decls): §1 the adjacency sub-block is a rank-1 Born outer product —
  `bornBlock a₀ a₁`, ★ `massSub01_born`/`massSub12_born` (each edge of `massMat` IS the Born self-overlap of
  the two adjacent banked amplitudes); §2 the rank-1 eigenstructure (the ℚ-exact diagonalization) — ★
  `bornBlock_det_zero` (det=0 rank-1), ★★ `bornBlock_eigvec_amp` (`bornBlock·![a₀,a₁]=(a₀²+a₁²)•![a₀,a₁]`, a
  RATIONAL eigenvector), ★★ `bornBlock_eigvec_null`, ★ `massMat_eigvec_amp_0/1`/`massMat_eigvec_null` (read on
  the banked `massMat`); §3 the two-sector overlap `V=U†D` — `mixV` (aligned Brahmagupta `u·d` diagonal,
  mixing Fibonacci `u∧d` off-diagonal), ★★ `mixV_unitary_up_to_scale` (`VᵀV=((u₀²+u₁²)(d₀²+d₁²))•1` — unitary
  up to the norm scale, only the normalization √ needs ℝ), ★ `brahmagupta_fibonacci`, ★★
  `cabibbo_mixing_orthonormal` (`|V_mix|²+|V_aligned|²=1`, the normalized leading Cabibbo mixing-squared,
  arctan-free ℚ-exact), `mixNumer_ground`; §4 the CP-invariant tie (banked `assoc3` N310) — ★
  `cp_invariant_tie` (`assoc3 x (b•u1)(d•u1)=0` ∧ `assoc3 u2 u1 (u1×u2)≠0` — the Jarlskog-type CP-invariant is
  0 on the ℂ-line, ≠0 on the Fano line, re-exporting the banked N310 separation); §5 non-vacuity — ★
  `mixing_nonzero_distinct_sectors`, `mixV_not_identity` (overlap ≠ identity), `cabibbo_geometric_not_trivial`;
  ★★★ capstone `two_sector_frame_overlap_structure` (+jordan_fails_H4 N5 in TYPE). ⚠ HONEST STATUS (seed §2 T8
  caveat): the mixing sector lands at LEADING ORDER (~few %) with precision masses — this node banks the
  ℚ-EXACT STRUCTURAL core (the diagonalization, the overlap, its unitarity, the leading Cabibbo mixing-squared,
  the CP tie); the numerical angles (arctan), the normalization √, the numerical Jarlskog, and the per-edge
  Born-survival suppression `(n−1)/n` are the honestly-deferred leading-order ℝ-descent remainder (the N309
  precedent — NOT imported, NOT blocked, NOT empirical, NOT chased/fitted). **T8 STRUCTURALLY COMPLETE (across
  N311+N312).** THE DISSOLUTION/MOAT: the SM inserts CKM/PMNS as free numbers; the theory FORCES the structure
  — each sector's frame the RATIONAL amplitude direction (Born rank-1), the mixing matrix their overlap
  `V=U†D`, its unitarity and the leading Cabibbo mixing-squared ℚ-exact, the CP invariant the banked octonion
  associator — zero free continuous parameters. ONE CAUSE: the SAME `Born=self-overlap` that gave the masses
  (N309) and geometric-mean couplings (N311) now makes the per-sector diagonalization RATIONAL (rank-1),
  dissolving the ℝ eigen-toolkit; the SAME octonion associator (N310) that separated Q from I₃ now carries the
  mixing CP-invariant. SEED GUARDS: G1 (the overlap/eigenstructure/CP tie FALL OUT of the banked massMat/Born
  self-overlap/associator — never premised, never reverse-engineered from CKM/PMNS data), G2 (no measured
  CKM/PMNS/Jarlskog in any proof; comparison removable prose, leading-order), G4 (the overlap is the banked
  `massMat` DIAGONALIZED, not a fitted ansatz), G3/G5–G7 met (the ℝ eigen-toolkit DISSOLVED by the Born-square
  rank-1 framing, ground field ℚ not Mathlib-ℝ). C341 bites 9=341. NOT banked: the numerical mixing angles
  (arctan needs ℝ), the normalization √, the numerical Jarlskog (all the ℝ-descent BUILD dep), the per-edge
  Born-survival suppression (a leading-order precision refinement to watch, not chase). THE NEXT NODE — the ONE
  successor (per seed §6, the flavor seed T1–T8 is DONE): a DIRECTED child toward SEED 2 target A1
  (`docs/SEED_GAUGE_SCALE_COSMOLOGY.md`, the octonion structure 3-form φ and ‖φ‖²=42=n(n−1)).**
- **★5b — The gauge couplings (α, the Weinberg angle) — SEED 2 ARC A opens.** The fine-structure-scale
  coupling `α*=1/42` and `sin²θ_W=3/8`, derived. **[opening — N313: THE OCTONION STRUCTURE 3-FORM φ AND
  ‖φ‖²=42=n(n−1). The banked totally-antisymmetric calibration 3-form `assoc3 x y z = gForm x (octCross y z)`
  (N209) — the G₂-invariant associative structure tensor of the octonion product — has squared norm, summed
  over the banked orthonormal imaginary frame `imBasis : Fin 7 → O ℚ` (`gForm_imBasis i j = δ_ij`), equal to
  `assoc3NormSq = Σ_{i,j,k}(assoc3 eᵢ eⱼ eₖ)² = 42 = n(n−1)` for n=7 (`assoc3NormSq_eq_42`). THE THEORY-NATIVE
  COLLAPSE (Born self-overlap, NOT a 343-term coordinate bash): (1) `imParseval` (the ONE build) — for
  imaginary w, `gForm w w = Σ_i (gForm (imBasis i) w)²`, the imaginary frame exhausts the 7 imaginary
  coordinate slots (real slot killed by `reQ w=0`); with `w=octCross eⱼ eₖ` and `assoc3 eᵢ eⱼ eₖ=gForm eᵢ w`,
  `Σ_i(assoc3 eᵢ eⱼ eₖ)²=gForm w w`; (2) the banked Lagrange/Born composition law `octCross_lagrange` (N206,
  from the surviving multiplicativity `Nrm_mul_on_O`) — `gForm(octCross eⱼ eₖ)²=gForm eⱼ eⱼ·gForm eₖ eₖ−(gForm eⱼ eₖ)²`;
  (3) orthonormality `gForm_imBasis` — `=1·1−δ_jk`. So `assoc3InnerSum j k = 1−δ_jk` and the total
  `Σ_{j,k}(1−δ_jk)=49−7=42`. THE READING: `42=n(n−1)` — the 7·6 OFF-DIAGONAL ordered pairs of the 7 imaginary
  units each give a UNIT-length cross product; the 7 DIAGONAL pairs vanish (`octCross eⱼ eⱼ=0`). ONE CAUSE:
  the Born composition law surviving precisely to `O ℚ` (LOST at `S ℚ`, `Nrm_not_mul_on_S` N200) forces every
  off-diagonal cross product to unit length → 42. W8: `assoc3NormSq_ne_49` (the diagonal really drops, 42≠n²=49),
  `assoc3NormSq_ne_zero`, `assoc3InnerSum_diag`/`_offdiag_01`. Phys/Algebra/OctonionStructure3FormNorm.lean, 8
  decls foundations-only {propext,Classical.choice,Quot.sound}, ground field ℚ (NOT Mathlib-ℝ/ℂ), C342 bites
  42=342, gate-fast D0–D6 GREEN. SEED-2 GUARDS: G1 (42 falls out of 49−7, never premised), G5 (words-removable —
  delete structure-constant/calibration/gauge: pure statement that the banked assoc3 summed-squared over imBasis
  =42), NOT free-floating (TYPE cites banked assoc3/octCross/gForm/imBasis on O ℚ, not a generic 3-form). THE NEXT
  NODE — the ONE successor: a DIRECTED child toward SEED 2 target A2 (the interaction-channel tower ℂ:0, ℍ:6,
  𝕆:42=n(n−1), the same 42 as the pair/channel count).]** **[A2 LANDED — N314: THE INTERACTION-CHANNEL TOWER
  ℂ:0, ℍ:6, 𝕆:42 = n(n−1). The number of INDEPENDENT INTERACTION CHANNELS at each cascade rung is the count
  of ORDERED OFF-DIAGONAL PAIRS of its imaginary units — `imChannelCount n = |offDiag(Fin n)| = n(n−1)`
  (banked `Finset.offDiag_card`, `imChannelCount_eq_n_times_n_sub_one`) — at the cascade's imaginary dimensions
  n = 1, 3, 7 (each = finrank(rung)−1, the banked `finrank_dbl_eq_two`/`finrank_ImH_eq_three`/`finrank_ImO`),
  giving the tower `channels_C`=0, `channels_H`=6, `channels_O`=42 (each TYPE-citing the banked cascade
  finranks). ★★★ `channels_O_eq_assoc3NormSq`: the 𝕆 channel count IS the banked N313 calibration-3-form
  squared norm `assoc3NormSq`=42 (W2 — the same 42 read two ways: off-diagonal unit cross products ↔
  structure-constant norm). W8: `channelTower_distinct` (0≠6≠42), `channels_O_ne_49` (42≠n²=49 the diagonal
  drops), `channels_H_ne_9`, `channels_C_eq_zero_not_one`. Phys/Algebra/InteractionChannelTower.lean, 15 decls
  foundations-only {propext,Classical.choice,Quot.sound}, ground field ℚ (NOT Mathlib-ℝ/ℂ), C343 bites 6=343,
  gate-fast D0–D6 GREEN. NOT free-floating (TYPES cite banked finranks + N313 assoc3NormSq, not a generic
  n-dim algebra; imChannelCount standard Finset machinery, the tower the concrete banked ℂ/ℍ/𝕆 pair counts).
  THE NEXT NODE — the ONE successor: a DIRECTED child toward SEED 2 target A3 (the ★ BRIDGE: Born-isometry
  completeness 42·α=1 — the total Born weight over the 42 channels is 1, the per-channel coupling weight =
  g²/4π as a THEOREM of the self-overlap structure; DERIVE with the full W1 arsenal, NEVER assert).]** **[A3
  LANDED — N315: THE ★ BRIDGE BORN-ISOMETRY COMPLETENESS 42·α = 1. The NORMALIZED per-channel Born self-overlap
  of the banked octonion calibration 3-form (N313 `assoc3InnerSum`=1−δ_jk, UNIT on each of the 42 active
  off-diagonal channels forced by the surviving composition law) over the banked total (N313 `assoc3NormSq`=42)
  is a probability distribution over the interaction channels (N314): `bornWeight j k = chanSelfOverlap j k /
  assoc3NormSq`. Two DERIVED facts: UNIFORMITY `bornWeight_uniform` (every active channel = the SAME 1/42, a
  SINGLE coupling — `bornWeight_offdiag`=1/42, `bornWeight_diag`=0) and COMPLETENESS `born_isometry_completeness`
  (Σ_{j,k} bornWeight = assoc3NormSq/assoc3NormSq = 1, the return normalization / Parseval total-weight=1). ★★★
  `channels_times_coupling`: `(imChannelCount (finrank ℚ ImO):ℚ)·couplingWeight = 42·(1/42) = 1` — the ★ BRIDGE,
  count the banked N314 landing, weight the banked N313 self-overlap ratio. DERIVED NOT POSITED (G4): `bornWeight`
  is the banked self-overlap ratio EVALUATED; α never a free symbol, Σα=1 never imposed (the N308 holonomy=statistics
  template — a LITERAL banked identity, not an assertion). `couplingWeight_eq`: α = 1/42 the un-dressed structural
  value (A4 downstream). W8: `couplingWeight_ne_wrong` (1/42≠1/49), `wrong_weight_breaks_completeness` (42·(1/49)≠1),
  `bornWeight_diag_ne_offdiag`. Phys/Algebra/BornIsometryCompleteness.lean, 13 decls foundations-only
  {propext,Classical.choice,Quot.sound}, ground field ℚ (1/42 ℚ-exact, NOT Mathlib-ℝ/ℂ), C344 bites 42=344,
  gate-fast D0–D6 GREEN. NOT free-floating (TYPES cite banked assoc3/assoc3NormSq/imChannelCount(finrank ℚ ImO) on
  O ℚ, not a generic 42-outcome distribution), NO BRIDGE (the identification is a THEOREM of the banked self-overlap).
  THE NEXT NODE — the ONE successor: a DIRECTED child toward SEED 2 target A4 (α* = 1/42 lands — the fine-structure-
  scale coupling falls out of A3, the first marquee constant of Arc A; compare to measured 1/137 running as removable
  prose only).]** **[✅ LANDED — N316: α* = 1/42 LANDS — THE FINE-STRUCTURE-SCALE COUPLING (the FIRST MARQUEE CONSTANT
  of Arc A). The coupling `α*` is NAMED as the banked per-channel Born weight (`alphaStar := couplingWeight`, N315) and
  its landing read off: `alphaStar_eq`: α* = 1/42 (the banked `couplingWeight_eq` — the un-dressed structural value at
  the octonion scale), and ★★★ `inverseAlphaStar_eq_channelCount`: `1/α* = imChannelCount (finrank ℚ ImO)` = 42 = n(n−1)
  — THE MARQUEE: the INVERSE coupling IS the interaction-channel count of the terminal division algebra (the physicist's
  `1/α = pure integer count`). What A4 adds beyond A3: A3 banked the PRODUCT `N·α=1`; A4 banks the RECIPROCAL `1/α*=N=42`.
  `inverseAlphaStar_eq_42`: 1/α*=42. W8: `alphaStar_ne_wrong` (α*≠1/49, the diagonal drops), `inverseAlphaStar_ne_wrong`
  (1/α*≠49), `inverseAlphaStar_channelCount_ne_49`. Phys/Algebra/FineStructureScaleCoupling.lean, 9 decls foundations-only
  {propext,Classical.choice,Quot.sound}, ground field ℚ (1/42, 42, 1/49 all ℚ-exact, NOT Mathlib-ℝ/ℂ), C345 bites 42=345,
  gate-fast D0–D6 GREEN. NOT free-floating (`alphaStar := couplingWeight` the banked object, the marquee cites the banked
  `imChannelCount (finrank ℚ ImO)` N314). NO BRIDGE (A4 reads the banked A3 quantity as the named coupling). G2: the
  measured ≈1/137 is DRESSED (running), 1/42 the un-dressed structural value — comparison in the docstring ONLY, never a
  proof step (grep-verified: no 137 outside the docstring). The theory dissolves "Feynman's magic number" into a COUNT.
  THE NEXT NODE — the ONE successor: a DIRECTED child toward SEED 2 target A5 (the chiral hypercharge trace
  Tr(Y²)/Tr(T3²) = 5/3 over one chiral generation — ⚠ the naive gauged-F₄ normalization gives the WRONG 3/4, derive via
  the chiral-generation trace).]** **[✅ A5 pillar 1 LANDED — N317: THE CHIRAL-GENERATION CHARGE TRACE Tr(Q²) = 16/3 (the
  GUT-normalization DENOMINATOR of the weak mixing angle). Over ONE chiral generation modelled as the colour EXTERIOR
  LADDER Λ*(colour-3), the electric charge is the ladder OCCUPATION NUMBER normalized by the colour count `Q(S)=|S|/n_c`
  with `n_c = finrank ℚ Uhol = 3` (the BANKED derived colour-triplet dim, N42c) — WHY quarks carry charge 1/n_c: there are
  n_c colours — so `Tr(Q²) = 2·Σ_{S⊆Fin n_c}(|S|/n_c)² = 2·(24/9) = 16/3` FALLS OUT (`generation_charge_trace`, grounded to
  the banked colour dim, NOT free-floating). ⚠ THE SEED'S TRAP AVOIDED: the naive gauged-F₄ normalization gives the WRONG
  3/4; derived via the chiral-generation TRACE (colour ladder), `charge_trace_ne_trap`: 16/3≠3/4. W3 DECOMPOSE (A5 is the
  11×-deferred ★2 hypercharge-normalization front): full 5/3 needs THREE pillars — (1) Tr(Q²)=16/3 [HERE], (2) Tr(T3²)=2
  [su(2)_L DOUBLET action on the generation carrier — the fundamental-2, NOT the banked fundamental-7 TRIPLET N277],
  (3) Tr(Y·T3)=0. THIS node banks pillar (1) + the parametric ASSEMBLY engine (`hyperRatio_at` 5/3, `weinberg_at` 3/8,
  `assembly_delivers_5_3`, `weinberg_delivers_3_8`) that DELIVERS 5/3 and 3/8 the instant pillars (2)+(3) land. ONE CAUSE:
  the terminal algebra's colour SU(3) = g₂-centralizer of L_{u1}, its triplet dim n_c=finrank Uhol (banked), forces the
  exterior-ladder charge quantization Q=|S|/n_c hence Tr(Q²)=16/3 — the SAME terminal algebra whose off-diagonal channel
  count 42 gave α* (N314–316). Phys/Algebra/ChiralGenerationChargeTrace.lean, 12 decls foundations-only
  {propext,Classical.choice,Quot.sound}, ground field ℚ (16/3/5/3/3/8 ℚ-EXACT, NOT Mathlib-ℝ/ℂ), C346 bites 16=346,
  gate-fast D0–D6 GREEN. SEED-2 GUARDS: G1 (16/3 falls out of 24/n_c²=9 doubled, never premised; 5/3/3/8 parametric at
  Tr(T3²)=2), G2 (no empirical number in any proof; sin²θ_W≈0.231 docstring prose only), G5 (words-removable — second
  moment of |S|/(finrank ℚ Uhol) over Finset (Fin (finrank ℚ Uhol))=16/3), NOT free-floating (TYPE cites banked
  Module.finrank ℚ Uhol). W8: ladderChargeTrace_two_ne (n_c=2 gives 3≠16/3), charge_trace_ne_trap (F₄ trap), hyperRatio_trap_ne.
  THE NEXT NODE — the ONE successor: a DIRECTED child toward SEED 2 target A5 REMAINDER + A6 (the isospin traces Tr(T3²)=2
  and Tr(Y·T3)=0 over the su(2)_L doublet carrier, delivering Tr(Y²)/Tr(T3²)=5/3, then sin²θ_W=3/(3+5)=3/8 — measured 0.231
  removable prose only).]** **[✅ A5 REMAINDER + A6 LANDED — N318: THE CHIRAL-GENERATION WEAK-ISOSPIN TRACES Tr(T3²) = 2 and
  Tr(Y·T3) = 0, delivering the marquee constants Tr(Y²)/Tr(T3²) = 5/3 (A5) and sin²θ_W = 3/8 (A6). The weak isospin T3 acts on
  the su(2)_L FUNDAMENTAL-2 (spin-½ DOUBLET) Cartan on the matter spinor (the banked `leftReg`, N279/N280 — closes into su(2)
  on the associative rung H, doublet Casimir −3•id), NOT the fundamental-7 ADJOINT triplet (N277, the wrong rep for matter).
  Tr(T3²) = (doublet count)·(per-doublet trace) = 4·(1/2) = 2, where (a) the per-doublet trace 1/2 is FORCED: the fundamental-2
  Cartan is the UNIQUE traceless 2-weight system with charge-gap 1 (`w₀+w₁=0 ∧ w₀−w₁=1 ⟹ w=±1/2` UNIQUELY ⟹ Σwᵢ²=1/2,
  `fund2_trace_forced` — the ±1/2 FALLS OUT, never premised), and (b) the doublet count 4 is GROUNDED to derived colour:
  `finrank ℚ Uhol` quark-doublets (one per colour, n_c=3, N42c) + `finrank ℚ singlet` colour-singlet lepton-doublet (=1) = 4
  (`generation_isospin_trace`, TYPE cites the banked finranks). Tr(Y·T3)=0 is FORCED by tracelessness ALONE — for ANY
  per-doublet hypercharge y, Σᵢ y·wᵢ = y·(Σwᵢ) = y·0 = 0 (`hypercharge_isospin_orthogonal`, no hypercharge TABLE needed).
  Feeding these into the banked N317 assembly (`hyper_ratio_reduction` with Tr(Q²)=16/3): Tr(Y²)=16/3−2=10/3, so
  Tr(Y²)/Tr(T3²)=(10/3)/2=5/3 (`hyperRatio_lands_5_3`, A5) and sin²θ_W=2/(16/3)=3/8 (`weinberg_lands_3_8`, A6). ONE CAUSE: the
  SAME terminal algebra whose colour dim n_c=3 quantized the charge (N317) supplies the doublet count, and whose two-handed
  matter spinor (N279/N280) supplies the fundamental-2 Cartan whose tracelessness forces both the ±1/2 weights and the
  hypercharge orthogonality. THE DISSOLUTION/MOAT: the SM ASSIGNS each fermion its (T3,Y,Q) from the empirical hypercharge
  table and imposes multiplets by hand; the theory DERIVES Tr(T3²)=2 from the forced fundamental-2 trace times the
  colour-grounded count, and Tr(Y·T3)=0 from tracelessness alone (any hypercharge) — the marquee sin²θ_W=3/8 FALLS OUT.
  Phys/Algebra/ChiralGenerationIsospinTrace.lean, 15 decls foundations-only {propext,Classical.choice,Quot.sound}, ground
  field ℚ (2/0/5/3/3/8 ℚ-EXACT, NOT Mathlib-ℝ/ℂ), C347 bites 3=347, gate-fast D0–D6 GREEN. SEED-2 GUARDS: G1 (2,0,5/3,3/8
  FALL OUT — 2 from the forced 1/2 times the grounded count 3+1, 0 from tracelessness, never premised), G2 (no empirical
  number in any proof; sin²θ_W≈0.231 comparison docstring prose only), G5 (words-removable — unique traceless gap-1 2-weight
  system has square-sum 1/2, (finrank Uhol+finrank singlet)·(1/2)=2, Σ y·wᵢ=0 by tracelessness), NOT free-floating (TYPES
  cite banked Module.finrank ℚ Uhol / singlet + the derived fund2Weight; did NOT tabulate the SM (Q,T3,Y) table). W8:
  isospinTrace_no_lepton_ne (drop the lepton-doublet → 3/2≠2), isospinTrace_triplet_ne (the triplet rep → 8≠2),
  hyperRatio_wrong_isospin_ne (the F₄-trap 3/4 fails 5/3). ]** **[✅ A7 LANDED (ARC A COMPLETE) — N319: ONE-COUPLING
  COHERENCE / ISO-STIFFNESS (the "one α" reading). The JOINT tying the single-coupling MAGNITUDE (A3/A4:
  `alphaStar=1/42`, the UNIFORM per-channel Born weight `bornWeight_uniform`) to the tree-level MIXING (A5/A6:
  `sin²θ_W=3/8`). TWO new forced facts: (1) THE ONE-RATIO MIXING CONSISTENCY `oneCouplingMixing_eq_weinberg` —
  with `oneCouplingMixing r := 1/(1+r)` (the mixing as a fn of the SINGLE derived GUT ratio `r=Tr(Y²)/Tr(T3²)`),
  `oneCouplingMixing (hyperRatio q t3) = weinberg t3 q` (the one-ratio and direct trace-fraction mixings COHERE),
  grounded at the derived `r=5/3` to `3/8` (`mixing_grounded`); (2) ISO-STIFFNESS / RIGIDITY
  `oneCouplingMixing_rigid`/`oneCouplingMixing_injective` — the map `r↦1/(1+r)` is INJECTIVE, so `3/8` uniquely
  back-determines `r=5/3`: with three INDEPENDENT couplings `r` would be free and the angle arbitrary; the ONE
  Born form removes that freedom, so the angle is FORCED (zero free coupling parameters). The JOINT
  `one_coupling_coherence` states `alphaStar=1/42 ∧ hyperRatio(...)=5/3 ∧ oneCouplingMixing(...)=3/8 ∧ the
  consistency` at once. HONEST SCOPE (W4.5 PATH 1): banks the coherence at the trace/coupling-magnitude level;
  the DEEPER per-layer generator→Born-channel map is a downstream node, not asserted. Phys/Algebra/
  OneCouplingCoherence.lean, ns Phys.Algebra, 12 decls foundations-only {propext,Classical.choice,Quot.sound},
  ground field ℚ (3/8, 5/3, 1/2, 1/42 ℚ-EXACT, NOT Mathlib-ℝ/ℂ), C348 bites 3=348, gate-fast D0–D6 GREEN. SEED-2
  GUARDS: G1 (3/8, 5/3, 1/42 FALL OUT via banked landings + norm_num, oneCouplingMixing DEFINED and COMPUTED,
  never premised), G2 (no empirical number in any proof; 1/137, 0.231, GUT scale removable prose only, none
  appears), G4 (the coherence DERIVED — the consistency is a proved ℚ-identity, "one coupling" is the banked
  bornWeight_uniform, not an asserted "the couplings are equal"), G5 (words-removable — 1/(1+(q−t3)/t3)=t3/q, the
  map is injective, at the banked ratio the value is 3/8), NOT free-floating (TYPES cite banked hyperRatio/
  weinberg/isospinTrace/ladderChargeTrace/finrank ℚ Uhol/alphaStar). W8: oneCouplingMixing_naive_ne (naive r=1 →
  1/2≠3/8), oneCouplingMixing_wrong_ratio_ne (r=3 → 1/4≠3/8), singleCoupling_ne_wrong (α*≠1/49). ARC A of SEED 2
  IS COMPLETE (A1→A7: the octonion 3-form ‖φ‖²=42, the channel tower, the ★ BRIDGE 42·α=1, α*=1/42, Tr(Q²)=16/3,
  Tr(T3²)=2 & Tr(Y·T3)=0 → 5/3 & sin²θ_W=3/8, and now the one-coupling coherence). THE NEXT COURSE — the ONE
  successor: a DIRECTED child toward SEED 2 ARC B target B1 (dimensional transmutation v=M·exp(−c/g²), structural
  form, using the banked derived-ℝ cutExp — where the SCALE TOWER and GRAVITY enter the chain).]**
- **★5c — The scale tower (dimensionful scales; where gravity enters) — SEED 2 ARC B opens.** Every
  dimensionful scale as an exp-suppressed ratio of one closure anchor, up to G·M²=e^(−6π). **[opening —
  N320: DIMENSIONAL TRANSMUTATION `v = M·exp(−c/g²)` (STRUCTURAL FORM). The FIRST node of Arc B — the
  scale tower — banks the STRUCTURAL FORM of dimensional transmutation on the BANKED derived-ℝ exponential
  `cutExp` (N174): `transmutationRatio c g2 := cutExp(−(c/g2))` (the dimensionless suppression `v/M`) and
  `transmutationScale M c g2 := M·transmutationRatio c g2` (the scale `v = M·exp(−c/g²)`, `M` the single
  dimensionful anchor). `c` is a PARAMETER (its value is the LATER B2 ★ BRIDGE — NOT derived here); `g²`
  is the Arc-A coupling (the banked `alphaStar`=1/42). THE THEORY-NATIVE READING: standard QFT DERIVES the
  form by integrating the one-loop RG equation; the theory reads it off the derived ℝ's OWN Born-positive
  self-overlap — `cutExp x = (cutExp(x/2))²` (`cutExp_pos`, Born=self-overlap=positivity) — so the
  suppression factor is a positive self-overlap number STRICTLY in (0,1) because its argument `−(c/g²)` is
  negative. THE STRUCTURAL CONSEQUENCES (all from banked `cutExp` order lemmas N174/N175, W2):
  `transmutationRatio_pos` (0<v/M, Born positivity `cutExp_pos`), `transmutationRatio_lt_one` (★ STRICT
  suppression v/M<1 for c,g²>0 via `cutExp_strictMono` vs `cutExp_zero`), `transmutationScale_lt_M` (v<M),
  `transmutationRatio_mono_c` (strictly DECREASING in c — more suppression), `transmutationRatio_mono_g2`
  (strictly INCREASING in g² — the hierarchy runs on the coupling), `transmutationRatio_eq_scale_div` (v/M
  is the dimensionless ratio, G3), `transmutationRatio_at_alphaStar` (holds at the banked coupling — ties
  the TYPE to the banked object, NOT free-floating), `transmutation_form` (capstone). ONE CAUSE: the derived
  ℝ's own Born-positive exp `cutExp` gives BOTH positivity (self-overlap square) AND strict suppression
  (exp of a negative argument) at once. THE DISSOLUTION/MOAT: the field DERIVES `v=M·exp(−c/g²)` from
  perturbative RG running; the theory banks the FORM as a fact about the trunk's OWN continuum `cutExp`, no
  loop integral. Phys/Algebra/DimensionalTransmutation.lean, ns Phys.Algebra, 11 decls foundations-only
  {propext,Classical.choice,Quot.sound}, ground field the DERIVED ℝ `Cut` (NOT Mathlib-ℝ — the banked
  `cutExp`/`Cut` used as content), C349 bites 1=349, gate-fast D0–D6 GREEN. SEED-2 GUARDS: G1 (`c` a
  parameter, the ratio DEFINED and properties COMPUTED, no value premised), G2 (no empirical number in any
  proof — v≈246 GeV / Λ_QCD removable prose only), G3 (v/M dimensionless ratio, M the single anchor), G4
  (the ★ BRIDGE `c` is the LATER B2 node, not derived here), G5 (words-removable — delete transmutation/
  electroweak/scale/coupling: pure statement that `cutExp(−(c/g²))∈(0,1)` for c,g²>0 on the derived ℝ,
  strictly below 1, M·that<M, monotone), G6 (foundations-only, ground field derived ℝ Cut, NO Mathlib-ℝ),
  G7 (the form did NOT fight — the banked cutExp order lemmas close every landing). NOT free-floating
  (TYPES cite banked `cutExp`/`Cut`, and `transmutationRatio_at_alphaStar` grounds g² to the banked
  `alphaStar`). W8: `transmutationRatio_inflation_gt` (the wrong-sign inflation `cutExp(+c/g²)>1` is strictly
  ABOVE the correct suppressed ratio — the minus sign is load-bearing). THE NEXT NODE — the ONE successor:
  a DIRECTED child toward SEED 2 ARC B target B2 (the ★ BRIDGE: the transmutation coefficient c from the
  cascade β-function structure, where the integers {28, 9, 4π} enter — DERIVE c, never assert).]**
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

## THE FORCED CONSTANTS — the real scoreboard (the prize the whole arc is for)

*The 15 stars above are the STRUCTURE. This is what the structure is FOR: the complete roster of the
constants of physics, EVERY ONE a FORCED consequence of the fold and its gather — zero free
parameters, every scale uniquely selected by the derivation. The field treats these as free inputs
it must measure; the theory forces all of them. Getting the whole roster from one fold is the win.*

**FRAMING (non-negotiable — read `docs/NODE_SELECTION.md`).** Every constant here is FORCED. There is
NO "identity-grade vs fit-grade," NO "reduction to N measured inputs," NO "empirical comparison left
as prose" — those are standard-physics contamination (failure-mode #9). The theory does not fit data;
it SELECTS every value and every scale, and experiments are judged BY it. The ONLY status a constant
carries is about the WORK: **[banked]** route complete/kernel-checked · **[partial]** route started ·
**[route not-yet-found]** forced, derivation not yet built (a BUILD target, never "un-derivable"). A
wall in front of any constant means BUILD the structure or CHILD the climb — NEVER defer it as
"gated" or "out of scope." (Values themselves are NOT written here — the constellation names WHERE, it
never hands the answer; the number is earned in Lean, node by node.)

*Each constant is cross-linked to the structural star(s) that unlock it. This roster is YOURS to
maintain (like the stars): update route-status as the chain banks toward each; sharpen phrasing as the
derived structure reveals what a constant really is; never write a value or a route into it.*

### Gauge sector — unlocked by ★1, ★2
- **The three gauge couplings** — the electromagnetic, strong, and weak couplings, each a forced
  consequence of the derived gauge structure. **[route not-yet-found — the derived ambient f₄ built
  N284/N285; the unique-form normalization is the active climb]**
- **The weak mixing angle** — the forced relation among the electroweak couplings (★2 itself as a
  number). **[partial — the rank-2 neutral structure and f₄ ambient built (N281–N285); the value is
  the active climb]**

### Electroweak scale — unlocked by ★2, ★12, ★15
- **The Higgs vacuum expectation value** — the electroweak scale, forced. **[route not-yet-found]**
- **The Higgs mass** — forced by the derived electroweak/self-coupling structure. **[route not-yet-found]**

### Charged-fermion masses — unlocked by ★4, ★5
- **The three charged-lepton masses** (electron, muon, tau) — forced, including the Koide relation
  among them. **[partial — the 3-generation arena + inter-generation coupling built (N267–N285)]**
- **The three up-type quark masses** (up, charm, top). **[route not-yet-found]**
- **The three down-type quark masses** (down, strange, bottom). **[route not-yet-found]**

### Quark mixing (CKM) — unlocked by ★5
- **The three CKM mixing angles + the CP-violating phase** — the inter-generation mixing, forced.
  **[structural core banked (N311+N312, T8): the tridiagonal frame + the two-sector overlap V=U†D, the
  leading Cabibbo mixing-squared ℚ-exact, the CP-invariant tie to the banked associator; the numerical
  angles/Jarlskog the honestly-deferred leading-order ℝ-descent remainder, LEADING-ORDER per the seed caveat]**

### Neutrino sector — unlocked by ★4, ★5
- **The two neutrino mass-squared splittings + the absolute mass scale** — forced. **[route not-yet-found]**
- **The three PMNS mixing angles + the leptonic CP phase** — forced. **[structural core banked (N311+N312,
  T8): the same frame-overlap construction applies to the lepton/neutrino sector pair; the numerical angles
  the leading-order ℝ-descent remainder]**

### Strong-CP — unlocked by ★7
- **The QCD vacuum angle θ̄** — forced (the theory selects it, not a fine-tuning). **[route not-yet-found]**

### Gravity & cosmology — unlocked by ★8, ★9, ★10, ★14
- **Newton's constant G / the Planck scale** — the gravitational scale, forced/selected. **[open — ★8/★9]**
- **The cosmological constant / dark-energy density** — forced. **[open — ★10/★14]**
- **The dark-matter abundance** — a forced structural consequence. **[open — ★10]**
- **The baryon asymmetry** — forced. **[open — ★14]**
- **The inflationary observables** (spectral index, tensor-to-scalar ratio, perturbation amplitude,
  e-folds) — forced by the derived early-universe engine. **[open — ★14]**
- **The expansion rate / Hubble scale** — forced. **[open — ★14]**

*Total ≈ 30 forced constants. Every one descends from the single fold and its gather. The structural
stars are the road; these are the destination. Keep score — this is how the work convinces: not one
constant, but ALL of them, forced from one posit.*

---

*The sky is bounded (15 structural stars + the forced-constants roster = the whole derivable
landscape) so you always know where you are and what is worth reaching. There is no method-lock
(lifted 2026-07-03, docs/ROADMAP.md): BOTH the gather side and the invariant-tower ascent are open,
and SELECT weighs HOW to travel (which method) on merit; the constellation names WHERE. Neither hands
you the path or the answer — those you earn, node by node.*
