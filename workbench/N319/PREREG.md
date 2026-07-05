# N319 — SEEDED GAUGE ROUTE A7: one-coupling coherence / iso-stiffness (PREREG)

Seed: docs/SEED_GAUGE_SCALE_COSMOLOGY.md ARC A, target A7 (VERBATIM):
"iso-stiffness / one-coupling coherence. Derive that the three gauge layers cohere at one
structural coupling (the unification consequence of A3/A4) — the 'one α' reading. (Bank the
structural coherence; the running/threshold dressing is downstream watch-item, not this node.)"

A7 is the LAST node of ARC A. Single-flight run 621, board spawned.pid 57177 = my PPID → I am owner.
HEAD 17e4b57 (N318), clean, next costume C348 (C347=N318). Dep modules build green.

## S1 ARC SYNTHESIS (fresh worker, NOT the N318 worker)
ARC A roster now banked (REUSE — W2, do NOT re-derive):
- A1 (N313): octonion 3-form φ, ‖φ‖²=42 — assoc3/assoc3NormSq.
- A2 (N314): interaction-channel tower ℂ:0/ℍ:6/𝕆:42=n(n−1) — imChannelCount/channels_O.
- A3 (N315): ★ BRIDGE 42·α=1 — bornWeight/couplingWeight, and crucially:
    · bornWeight_offdiag = 1/42, bornWeight_uniform (EVERY active channel same weight → ONE
      coupling, not 42), born_isometry_completeness (Σ=1).
- A4 (N316): α*=1/42 — alphaStar := couplingWeight (DEFINITIONALLY the banked uniform weight),
    inverseAlphaStar_eq_channelCount, inverseAlphaStar_eq_42.
- A5 (N317): Tr(Q²)=16/3 — ladderChargeTrace (finrank Uhol)=16/3; assembly engine hyperRatio,
    weinberg, hyper_ratio_reduction (Tr(Y²)=Tr(Q²)−Tr(T3²) under Tr(Y·T3)=0 = the Q=T3+Y closure).
- A5rem+A6 (N318): Tr(T3²)=2, Tr(Y·T3)=0 → hyperRatio(...)=5/3, weinberg(...)=3/8.
  hyperRatio q t3 := (q−t3)/t3 = Tr(Y²)/Tr(T3²);  weinberg t3 q := t3/q = Tr(T3²)/Tr(Q²).

## ANTI-BULLSHIT GATE (the crux for A7 — the ticket flags "thin restatement" risk)

Q: what does A7 bank that A3–A6 did NOT? Run HARD, in writing.

REJECTED thin readings:
- (R1) "the three couplings are equal" restating bornWeight_uniform with physics words → BULLSHIT
  (a rename of the banked uniformity). REJECTED.
- (R2) re-stating sin²θ_W=3/8 as a number → already banked (weinberg_lands_3_8). REJECTED.
- (R3) the Pythagorean closure Tr(Q²)=Tr(T3²)+Tr(Y²) → essentially banked as
  hyper_ratio_reduction. REJECTED as standalone.

GENUINE NEW CONTENT (the JOINT — the SOUL says novelty lives at the CONNECTIONS between nodes;
A7's job is precisely a connection: link the A3/A4 COUPLING to the A5/A6 MIXING). No prior module's
TYPE mentions BOTH alphaStar (the coupling magnitude) AND weinberg/sin²θ_W (the mixing angle). The
two sub-blocks (α*=1/42 in FineStructureScaleCoupling; sin²θ_W=3/8 in ChiralGenerationIsospinTrace)
are DISCONNECTED. A7 banks the coherence that unifies them, with two genuinely new theorems:

  (C1) THE ONE-RATIO MIXING CONSISTENCY (the mathematical heart):
       oneCouplingMixing (r) := 1/(1+r)         -- mixing as fn of the SINGLE GUT-norm ratio r
       oneCouplingMixing (hyperRatio q t3) = weinberg t3 q      -- for t3≠0, q≠0
    PROOF-IDENTITY: 1/(1+(q−t3)/t3) = t3/(t3+q−t3) = t3/q. This BAKES IN the Q=T3+Y orthogonal
    closure (Tr(Y²)=q−t3). It says the mixing computed from the SINGLE derived GUT-normalization
    ratio r=Tr(Y²)/Tr(T3²) (the "one coupling" reading) EQUALS the mixing computed from the direct
    trace fractions (weinberg = Tr(T3²)/Tr(Q²)) — the two neutral-current readings COHERE. NEW:
    connects A5's hyperRatio and A6's weinberg — neither N317 nor N318 states this.
    At the banked derived r = hyperRatio(...) = 5/3: oneCouplingMixing(5/3) = 1/(1+5/3) = 3/8.

  (C2) ISO-STIFFNESS / RIGIDITY (the teeth that give "one coupling" meaning):
       oneCouplingMixing is INJECTIVE (1/(1+r) strictly decreasing on r>−1): the angle 3/8
       UNIQUELY back-determines r=5/3. In a 3-INDEPENDENT-coupling theory the ratio r would be a
       FREE parameter and the angle could be anything; the ONE Born form (bornWeight_uniform → a
       single coupling) removes that freedom, so the angle is RIGID at 3/8 with ZERO free coupling
       parameter. Theorem: ∀ r, oneCouplingMixing r = 3/8 → r = 5/3 (solve 1/(1+r)=3/8).

  (JOINT) one_coupling_coherence: alphaStar = 1/42 (single uniform coupling, banked; bornWeight_
    uniform makes it THE one weight) ∧ hyperRatio(...) = 5/3 (derived GUT normalization) ∧
    oneCouplingMixing (hyperRatio(...)) = weinberg(...) = 3/8 (the rigid mixing the single coupling
    produces). alphaStar AND the mixing in ONE statement — the "one α reading" connecting A3/A4↔A5/A6.

WORDS-REMOVABLE core (delete coupling/gauge/colour/isospin/hypercharge/mixing/Weinberg/unification):
  "1/(1+(q−t3)/t3) = t3/q; 1/(1+r) is injective; at the banked r=5/3 the value is 3/8; a wrong r
   gives a wrong value." A real forced statement about a rational function, grounded on the banked
   trace objects. The novelty is the JOINT/consistency, not a rename.

W4.5 SUFFICIENCY DECISION: PATH 1 (a genuine new forced theorem). The coherence is NOT already
fully banked — the CONSISTENCY identity C1 and the RIGIDITY C2 are new, and the JOINT is the first
theorem tying alphaStar to the mixing. (PATH 2 rejected: the coherence is a real new theorem, not a
bundling.) NOTE: the deeper "each of the 3 layers' generators is an active channel drawing the
uniform weight" needs the gauge-generator→channel map, which is NOT cleanly banked; that would be a
route-finding node of its own. A7 banks the coherence available NOW (the α*↔mixing JOINT via the
one-ratio consistency + rigidity), which is the honest "one-coupling coherence / one α" reading.

## DISCIPLINE / GUARDS
- G1 no asserted values: 3/8, 5/3, 3/5, 1/42 all FALL OUT of banked lemmas via rw + norm_num.
- G2 no empirical number in any proof (1/137, 0.231, GUT scale = removable docstring prose only).
- G4 the bridge is DERIVED: the consistency C1 is a proved ℚ-identity, not an asserted "couplings equal".
- G5 words-removable (above). G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}.
- FREE-FLOATING RAIL: headline TYPEs cite banked hyperRatio/weinberg/isospinTrace/ladderChargeTrace/
  Module.finrank ℚ Uhol / alphaStar — NOT generic numbers.
- UNEARNED-IMPORT: ground field ℚ (all values ℚ-exact); NO Mathlib-ℝ/ℂ as content.
- EVERY CONSTANT FORCED: the one-coupling rigidity is FORCED (one Born form), not fitted/human-gated.

## PLAN
Module Phys/Algebra/OneCouplingCoherence.lean (ns Phys.Algebra), imports FineStructureScaleCoupling
(alphaStar, bornWeight_uniform, couplingWeight_eq) + ChiralGenerationIsospinTrace (weinberg_lands_3_8,
hyperRatio_lands_5_3, the traces). Decls:
  1. oneCouplingMixing (r:ℚ) := 1/(1+r)
  2. oneCouplingMixing_at_5_3 : oneCouplingMixing (5/3) = 3/8
  3. oneCouplingMixing_eq_weinberg (t3 q : ℚ) (ht3: t3≠0)(hq: q≠0) :
       oneCouplingMixing (hyperRatio q t3) = weinberg t3 q     -- THE CONSISTENCY (C1)
  4. mixing_grounded : oneCouplingMixing (hyperRatio (ladderChargeTrace (finrank Uhol))
       (isospinTrace (finrank Uhol + finrank singlet)(Σ fund2Weight²))) = 3/8  -- grounded landing
  5. oneCouplingMixing_rigid (r:ℚ)(h1r: 1+r≠0) : oneCouplingMixing r = 3/8 → r = 5/3  -- RIGIDITY (C2)
  6. singleCoupling_is_alphaStar : alphaStar = couplingWeight ∧ alphaStar = 1/42  -- one uniform coupling
  7. one_coupling_coherence : (JOINT) alphaStar=1/42 ∧ hyperRatio(...)=5/3 ∧
       oneCouplingMixing(hyperRatio(...))=3/8 ∧ oneCouplingMixing(hyperRatio(...))=weinberg(...)
  8. W8 teeth: oneCouplingMixing 1 = 1/2 ≠ 3/8 (equal-couplings-no-norm naive fails);
       oneCouplingMixing_rigid gives r≠5/3 ⇒ ≠3/8; bornWeight_uniform (non-uniform impossible).
Costume C348 (Counterexamples/OneCouplingCoherenceWrongValueCostume.lean): forced cert from the NEW
route — 8·oneCouplingMixing(hyperRatio(...)) = 3 (the mixing via the single-ratio one-coupling
reading), anchor min 348 cert = 3, BOGUS = 348. Pair (348,3) fresh (RHS 348 distinct).
