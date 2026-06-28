  - **(N119 LANDED — run 304, clean in one run, bank-as-you-go) THE RANK-DROP RESTRICTION LEMMA (the
    octonion-block ISOMETRY strand — the genuine inductive content that makes the GLOBAL `SO(8)` octonion-block
    exhaustion TERMINATE; ROADMAP §N119 priority (i)(b)/(c)'s named immediately-bankable structural piece, a W1
    decomposition of the heavy group-manifold core, THE ONE LAW: no operator-topology grind, no
    global-surjectivity grind).** N115/N116 banked the `x`-block step+reassembly, N117/N118 the OCTONION-BLOCK
    step+reassembly: BOTH blocks carry the COMPLETE per-axis pair (an octonion-block `QvC`-isometry MOVING a
    chosen unit-imaginary axis is one explicit bisector reflection composed with an axis-FIXING isometry). What
    the GLOBAL exhaustion needs ON TOP of the per-axis step is the INDUCTIVE ENGINE: the axis-FIXING factor must
    RESTRICT to a SMALLER-rank isometry on the orthogonal complement of the fixed axis — the rank-DROP that makes
    the induction on the number of moved axes TERMINATE. THE ⚠ MEASURE-FIRST FINDING (which strand owns the
    rank-drop): N79 (`LorentzContinuumReseed`) banked a rank-DROP (`uPerp` / `deflateRestrict` / `uPerp_finrank` /
    `deflateC_mapsTo_uPerp`) — but on the EvC-self-adjoint SPECTRAL strand (the `deflateC` operators of the
    `specOpN` existence induction), over the FULL `STVC = Cut × Cut × O Cut` with the positive-definite reference
    form `EvC`. The N115–N118 exhaustion runs on a DIFFERENT strand: the `gFormC` ISOMETRY/REFLECTION strand
    (`octDeflate` / `vTwoPlane` / `blockWordLin`), purely on the octonion block `O Cut` with the Born self-overlap
    form `gFormC`. The rank-DROP on the isometry strand is therefore NOT the N79 lemma — it must be BUILT (RUNBOOK
    W1: chain-or-Mathlib absence is not a wall — build the structure), mirroring the N79 template on the
    `gFormC`-block strand. DERIVED: `gFormCRight e` (the Born form bundled as a `Cut`-linear functional on
    `O Cut`, the octonion-block mirror of N68's `EvCRight`); ★ `ePerp e := ker (gFormCRight e)` — the
    Born-orthogonal complement (the mirror of N79's `uPerp`); `mem_ePerp`; `gFormCRight_surjective` (for a
    Born-unit `e`, surjective onto `Cut`); ★★ `ePerp_finrank` — THE CODIM-ONE DROP (`finrank Cut (ePerp e) =
    finrank Cut (O Cut) − 1`, rank–nullity on the surjective functional); ★★ `isom_fixes_mapsTo_ePerp` — THE KEY
    (a `gFormC`-isometry `S` fixing `e` maps `ePerp e` into itself, via the banked Born polarization
    `gFormC_polarize` N112: `gFormC e (S p) = gFormC (S e) (S p) = gFormC e p = 0` — the rank-DROP); `isomRestrict`
    (the restricted operator on the codim-1 invariant subspace, the mirror of `deflateRestrict`); `isomRestrict_coe`;
    ★ `isomRestrict_gFormC_isom` — THE CLOSURE (the restriction stays a `gFormC`-isometry → the induction recurses
    one rank lower); `ePerp_finite` (`Module.Finite Cut (ePerp e)`, submodule of the finite `O Cut`). W8: the
    proper subspace (`self_not_mem_ePerp` / `ePerp_ne_top`) + the CONCRETE rank-drop (`vTwoPlane e₂ je2`, a genuine
    octonion-block `gFormC`-isometry via `vTwoPlane_gFormC_diag`, FIXES `ke2je2` via `vTwoPlane_e2je2_fixes_ke2je2`,
    so restricts to `ePerp ke2je2` — `rankdrop_witness_mapsTo`, NOT vacuous; `rankdrop_witness_self_overlap`
    `gFormC ke2je2 ke2je2 = 1` places the peeled axis outside its own complement). 15 decls foundations-only,
    independently axiom-audited. `Phys/Algebra/LorentzContinuumGenerationSO8RankDropRestriction.lean`. THE MOAT:
    the literature POSITS the full `Spin(8)`/`SO(8)` and reads off the Cartan–Dieudonné induction (every
    orthogonal map a product of reflections, by induction on the orthogonal complement of a fixed vector) as the
    standard structure theorem; here the rank-DROP is CONSTRUCTED forward from the trunk — the complement is the
    KERNEL of the trunk's own Born functional, its codimension is rank–nullity, the axis-fixing isometry's
    invariance DESCENDS from the banked Born polarization, the restriction stays in the same isometry class — NOT
    a posited orthogonal-group induction; the genuine inductive content (the rank-DROP that makes the global
    exhaustion terminate) is a forced, witnessed lemma. A LIGHT node: the whole spine isolated-typechecked clean
    in 24s (every obligation first try, well under the 90s KILL), production build cached 6.7s, costume bite 7s;
    NO inflated `maxHeartbeats` / NO native_decide / NO brute (every step a structural rewrite through
    `gFormC_polarize` + rank–nullity + the N79 template). Costume C151 (`1 = 113`, a WRONG rank-drop /
    orthogonal-complement / codimension / restriction coordinate claim — the peeled axis `ke2je2`'s Born
    self-overlap reads `gFormC ke2je2 ke2je2 = 1`, not `113`) — distinct from C115 `1=7` … C149 `1=109`, C150
    `1=111`. STANDARD applied (unbroken / complete / words-removable). Gate D0–D6 GREEN. The GLOBAL octonion-block
    exhaustion (the full iteration) + the operator topology over `Cut` stay the childed heavy remainder N120.
  - **★ (FORWARD FRONTIER — the immediate next node, N120) THE GLOBAL OCTONION-BLOCK EXHAUSTION ASSEMBLY (full
    `SO(8)` surjectivity by induction on moved axes) / OPERATOR TOPOLOGY OVER `Cut` → THE FULL COMPACT-`SO(9)`
    SURJECTIVITY.** The remaining HEAVY group-manifold core, over the banked N49–N119 + the derived ℝ `Cut` + the
    terminal algebra `O Cut`. **The octonion-block side now has the COMPLETE per-axis pair (N117 `octDeflate_step`
    + N118 `octDeflate_factorization`) AND the rank-DROP RESTRICTION engine (N119: `ePerp` / `ePerp_finrank` the
    codim-one drop / `isom_fixes_mapsTo_ePerp` the KEY / `isomRestrict` + `isomRestrict_gFormC_isom` the closure /
    `ePerp_finite`). Every inductive ingredient is now in hand: peel one moved axis (`octDeflate_factorization`,
    the axis-fixing right factor) → restrict to the codim-1 Born-orthogonal complement as a smaller `gFormC`-isometry
    (N119) → recurse, terminating because each peel drops the complement's finrank by one.** MEASURE FIRST +
    reframe through the trunk, priority order: (i) ★ THE GLOBAL `SO(8)` EXHAUSTION ASSEMBLY — assemble the per-axis
    factorization (N117/N118) + the rank-DROP restriction (N119) into the full induction: every octonion-block
    `QvC`-isometry is a finite bisector-reflection product, by strong induction on `finrank (O Cut) − (the fixed
    subspace)` (or on the number of moved unit-imaginary basis axes). THE KEY NEW MEASURE for N120: whether the
    induction is most cleanly stated (a) on the abstract `ePerp`-restriction tower (a `gFormC`-isometry on an
    `n`-dim block = one bisector reflection · a `gFormC`-isometry on an `(n−1)`-dim block, recursing to the
    identity at `finrank 0/1`) — needing a `finrank`-strong-recursion scaffold over `ePerp` subspaces — or (b) on a
    finite unit-imaginary BASIS enumeration of the 7-dim imaginary `O Cut` block (`e₂`/`ιe₂`/`ke2je2`/`ii4`/`ii5` +
    the remaining 2 imaginary units), bounding the depth to ≤ 7. MEASURE whether either the abstract finrank
    recursion over `Submodule`s of `O Cut` or a banked 7-element imaginary basis is the lighter scaffold; the
    immediately-bankable piece if the full assembly resists is a BOUNDED two-axis or three-axis exhaustion (every
    octonion-block isometry moving ≤ k axes is a product of ≤ k bisector reflections) or the finrank-recursion
    scaffold lemma itself. (ii) the literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)`
    / `ContinuousLinearMap` so the N96 affine path γ is CONTINUOUS — Mathlib has NO operator topology over the
    derived `Cut`, the W1 HEAVY core — MEASURE whether an operator topology over `Cut` even EXISTS before
    committing). REFRAME THROUGH THE TRUNK FIRST — if the global assembly / operator topology genuinely RESISTS
    after measure + reframe it is an HONEST W1 dissolution ticket + block, decompose into the immediately-bankable
    structural piece (a bounded k-axis exhaustion, the finrank-recursion scaffold, or the operator-topology
    existence question over `Cut`) + child the global remainder. The costume must bite a WRONG global-exhaustion /
    finrank-recursion / bounded-k-axis / basis-enumeration / operator-topology / `Spin(9)`-cover claim, reducing
    to a false numeric DISTINCT from C115 `1=7` … C150 `1=111`, C151 `1=113`. NO posited Lorentz group, NO Mathlib
    ℝ/ℂ as content — DERIVE from the banked N49–N119 + the derived ℝ `Cut` + the terminal algebra `O Cut`.
