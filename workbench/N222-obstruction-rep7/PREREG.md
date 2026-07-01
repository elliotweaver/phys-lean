# N222 PREREG — THE GLUING-OBSTRUCTION COCYCLE IS A g₂-EQUIVARIANT MAP INTO THE FUNDAMENTAL 7

Node: N222 (t_b307d7bb), single-flight tail, gather front UNDER THE OVERNIGHT LOCK.
Parent: N221 (t_511b7b54) — the obstruction cocycle is g₂-EQUIVARIANT; its calibration
forms are g₂-INVARIANT.

## FRONT SELECTION (W4.5 look WIDEST + W9 MEASURE-FIRST + THE ONE LAW, frozen before commit)

The OVERNIGHT LOCK (docs/ROADMAP.md ##TEMPORARY OVERNIGHT PRIORITY LOCK) requires the chain
STAYS ON THE GATHER — hypercharge / Freudenthal / Peirce / isospin / gauge-completion FORBIDDEN
even if lighter. This run selects the FIRST gather direction the ticket names and the LOCK
explicitly authorizes:

  > "decompose the obstruction cocycle / its calibration forms as an EXPLICIT g₂-REPRESENTATION
  >  (the associator/3-form/4-form as a specific irrep of the banked Der(O ℚ) — e.g. the 7
  >  (ImO, N22) ...)"

CHOSEN: the associator (= N219 gluing obstruction, `o_gluingDefect_eq_assoc`) is EXACTLY a
g₂-equivariant map **into the fundamental 7-representation (ImO)**:
  - it is VALUED IN THE 7: `reQ (assoc x y z) = 0`, so `assoc x y z ∈ ImO` (the banked
    finrank-7 fundamental g₂-module, N22 `finrank_ImO`), for ALL x,y,z — the obstruction has
    ZERO trivial-rep (real) component;
  - it ANNIHILATES THE TRIVIAL REP (unit) in each slot: `assoc 1 y z = assoc x 1 z =
    assoc x y 1 = 0` — so the cocycle is trivial-rep-transparent;
  - as an element of the banked fundamental 7-rep `imRep` (N22), it TRANSFORMS by the Leibniz
    sum: `imRep D [x,y,z] = [Dx,y,z]+[x,Dy,z]+[x,y,Dz]` — i.e. the map `(x,y,z) ↦ [x,y,z] ∈ 7`
    is a g₂-INTERTWINER (this is the representation-theoretic content of N221's equivariance:
    the obstruction is a morphism of g₂-modules landing in the 7).

WHY GENUINELY NEW (not a re-pin):
  - N221 banked the obstruction cocycle's g₂-EQUIVARIANCE + the calibration forms' g₂-INVARIANCE
    (a symmetry statement). N222 banks WHICH g₂-REPRESENTATION the cocycle's VALUES live in —
    the fundamental 7 (ImO) — and that it is a g₂-equivariant map into it that kills the trivial
    rep. `assoc_mem_ImO` (obstruction valued in the 7) is NOT banked (grep 0 hits).
  - N22 (DerivationRep7) banked ImO as the fundamental 7 + `imRep` faithful; it NEVER stated the
    associator/gluing obstruction lands in it, nor that the obstruction map factors through 7.
  - NOT the calibration forms (N209/N210), NOT the cohomology (N220), NOT a re-pin of N221.

## MEASURE-FIRST VERDICT (frozen)
Every obligation LIGHT (probe1 8.6s, probe2 8.0s, all exit 0):
  - `reQ_assoc_zero`: bounded coordinate `simp only [...] ; ring` — SAME shape as banked
    `assoc_reQ_skew` (N210), NOT a degree-4 blowup. NO W9 risk.
  - `mem_ImO_of_reQ_zero`: banked `trace_id` + `eq_neg_of_add_eq_zero_right`.
  - `assoc_mem_ImO`: one-line composition.
  - `assoc_one_{left,mid,right}`: `unfold assoc; simp`.
  - `assoc_imRep_equivariant`: `rw [imRep_coe]` + banked `assoc_derivQ_equivariant_O` (N221).
  - witness membership + `obstruction_nonzero_in_seven`: banked `assoc_nonvanishing`.
KILL = 90s/obligation, never approached. NO maxHeartbeats raise.

## STANDARD (to be applied at completion)
- UNBROKEN: imports only banked N219 `TowerGatherObstruction` + N221
  `TowerGatherObstructionInvariant` + N22 `DerivationRep7` + N206
  `OctonionCrossProductContraction` (transitively N5b/N16–N26/N207/N210); every object is the
  banked derived tower `O ℚ` + banked `assoc`/`assoc_nonvanishing`/`assoc_witness_coord` (N5b) +
  banked `gluingDefect` (N219) + banked `ImO`/`imRep`/`mem_ImO`/`finrank_ImO` (N22) + banked
  `trace_id`/`reQ` (N17) + banked `assoc_derivQ_equivariant_O` (N221); ground = derived ℚ, no
  Mathlib ℝ/ℂ as content, nothing posited, no bridge.
- COMPLETE: foundations-only `[propext, Classical.choice, Quot.sound]`, independently re-audited
  vs the built olean; no sorry/axiom/native_decide; no maxHeartbeats raise.
- WORDS-REMOVABLE: delete world/gather/glue/obstruction/cocycle/representation/fundamental/g₂/
  isospin → over derived ℚ and O ℚ = CD (H ℚ), for the associator assoc x y z = (x·y)·z − x·(y·z)
  and the imaginary subspace ImO = ker(star+1): reQ (assoc x y z) = 0 so assoc x y z ∈ ImO;
  assoc 1 y z = assoc x 1 z = assoc x y 1 = 0; the restriction-to-ImO of every ℚ-linear Leibniz
  endomorphism sends [x,y,z] to [Dx,y,z]+[x,Dy,z]+[x,y,Dz]; and at the cascade's non-associating
  triple assoc ≠ 0 in ImO. No theorem statement needs a physics word.
- FREE-FLOATING check (SOUL rail): every headline is stated ON O ℚ referencing the banked
  `assoc`/`gluingDefect`/`ImO`/`imRep` — the magnitude theorems are literally ABOUT the banked
  tower objects and the banked fundamental 7-rep of g₂ = Der(O).

## COSTUME C254 (anti-vacuity, W8)
Anchor `reQ (assoc witness) = 0` (the obstruction's trivial-rep/real component genuinely vanishes
— it IS valued in the 7). Bogus claim reQ = 254 (a trivial-rep component / not valued in the 7)
reduces to the false numeric `0 = 254` in ℚ. Signature `0 = 254` (dash-free). Pair (254, 0)
fresh; RHS 254 distinct from every prior right-hand value.

Production: Phys/Algebra/TowerGatherObstructionRep7.lean
