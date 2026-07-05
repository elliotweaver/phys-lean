# SEED — THE FLAVOR SECTOR VIA SELF-BLINDNESS (owner-authorized route)

> ⚠ **THIS IS AN OWNER-AUTHORIZED SEED.** The project's standing law is *witness, never inject* —
> the owner does not hand the worker routes. This document is the **single, explicit, owner-signed
> exception**, made because this particular mechanism is the hardest-won result in the whole program
> and re-discovering it blind would cost the chain an enormous amount of time. **The exception is
> narrow: it gives the ROUTE (which structures to build, in which order, and what they mean). It does
> NOT relax the discipline by one inch.** Every value below is a *landing the derivation must reach on
> its own*, NEVER a thing to assert. Read this whole document, then read the HARD GUARDS at the bottom
> before you touch Lean.

---

## 0. WHAT THIS ROUTE IS FOR (the destination)

The **flavor sector** — the pattern of the three fermion generations' masses and their mixing — is,
in the standard framework, ~13 free numbers inserted by hand (the Yukawa couplings). This route
derives that pattern from the fold. The destination is:

- The **Koide relation** `Q = (Σ mₖ) / (Σ √mₖ)² = 2/3` for the charged leptons — an exact structural
  fact, NOT a coincidence.
- The **generation mass ratios** as forced consequences of the fold, controlled by **one** derived
  phase, NOT three free Yukawas.
- The **mixing structure** (Cabibbo/CKM/PMNS) as a geometric consequence of the same object.

**These are the numbers the field treats as free inputs. This route forces them.** That is why the
owner authorized the seed.

---

## 1. THE MECHANISM (the theory-native picture — this is the route, not the proof)

The prior arc (N283–N303) climbed the **ascent** side — the f₄/e₆ exceptional tower — trying to make
the derived symmetry *split* the three generations. It kept proving the opposite: the family symmetry
is **isospectral** and has **no fixed direction** (N275, N301, N302). That is not a failure — **it is
the discovery that the flavor pattern is NOT an algebraic feature of the symmetry tower.** A symmetry,
by its nature, relates the generations; it cannot single one out.

The flavor pattern lives on the **gather / self-reference** side — in the fold's own self-blindness,
made quantitative. The route:

1. **The three generations are the three primitive idempotents of the cap-forced arena** `J₃(O)` — one
   generation per diagonal slot (already banked: N267). The cap at order 3 (Hurwitz) is *why there are
   exactly three*.

2. **A generation is a PROBE that looks back at the other two and is blind to itself.** This is the fold's
   founding move (self-look-back → the MISS) reappearing at the generation level. The self-seeing
   operator on the three generations is **diagonal-zero** (a probe cannot see itself) — a self-blind
   circulant on the ℤ₃ cycle of generations.

3. **Self-blindness FORCES the Born weights.** A self-blind operator (diagonal = 0) puts weight `1/n` on
   the democratic/Unity eigenvector and `(n−1)/n` on the "others" subspace — these are the *unique*
   weights making the self-view vanish (`Σ weight·eigenvalue = 0`). For `n = 3` the self-seen "other"
   fraction is `(n−1)/n = 2/3`. **This is where the 2/3 comes from — it is a Born counting fact of
   self-blindness, derived, not fit.**

4. **The generations are PHASES OF ONE CYCLE, not three static states.** Because the coherent ground
   state has **no fixed point** (C6: "best coherence is not a fixed point" — a bounded no-fixed-point
   process must cycle), the three idempotents are not frozen; the fold rotates through them
   `e₁ → e₂ → e₃ → e₁`. The mass amplitudes (`√mₖ`, the Born-square-root variable) are the ℤ₃-Fourier
   expansion of this coherence cycle:
   `√mₖ = M · (1 + √2 · cos(δ + 2πk/3))` — Unity/DC mode (the "1", gathered) + one cycle mode
   (`√2 cos`, the turning) + the phase `δ` of the cycle relative to Unity's frame.

5. **The Koide `Q = 2/3` is an identity of this cycle form** — it holds for *any* `δ`, and it is exactly
   the self=other Born balance of step 3 (the `√2` is the 45° balance, `cos²φ = 1/2`). Leptons sit on the
   associative ℂ-line and are *exact*; quarks span an octonionic Fano line and *deviate* by the
   associator — the associator distortion of step 6.

6. **The cycle phase `δ` (equivalently `δ_B`, the Koide phase in Brannen's convention) is fixed by a
   HOLONOMY = STATISTICS consistency condition.** The generations form a visibility cycle (each probe
   sees the other two); the cycle has one gauge-invariant holonomy. The consistency requirement — *the
   total holonomy of the visibility cycle equals the total Born return probability of the self-seeing* —
   is the fixed-point equation `n · T(1−T) = T`, whose unique nontrivial solution is `T = (n−1)/n`, and
   the per-edge phase `δ_B = T(1−T)`. For `n = 3`: `T = 2/3`, `δ_B = 2/9` (radians, a pure rational — NOT
   a fraction of π; the geometric route gives `2π/9`, the physical datum is that de-π'd to a Born count).
   **This is THE CRUX. See §3.**

7. **Mixing (Cabibbo/CKM/PMNS) is the same object seen between two sectors** — the misalignment /
   non-commutativity of the up and down generation frames in `J₃(O)`. Each sector is a **tridiagonal**
   structure (masses on the diagonal, geometric-mean `|x_k| = √(dᵢ dⱼ)` nearest-neighbour couplings —
   balloon/idempotent coherence, which DERIVES the Gatto–Sartori–Tonin relations `θᵢⱼ ~ √(mᵢ/mⱼ)` — and
   `M₁₃ = 0` from cascade adjacency); the mixing matrix is the **overlap of the two diagonalized frames**
   dressed by the fold phase, giving all angles AND the CP invariant `Re(x₁x₂x₃)` together. **This sector
   lands at LEADING ORDER (~few %), NOT theorem-exact like the masses** — see target T8's honest-status
   caveat before treating any mixing number as an exact target.

That is the whole route. **None of it is proved yet. Proving it — link by link, foundations-only — is
the work.**

---

## 2. THE DERIVATION TARGETS (in order — each a separate node, each a real theorem)

Build these as forced derivations. Each is a SELECT candidate; run each through the anti-bullshit gate;
NONE may assert a value — every value must *fall out*.

- **T1 — the ℤ₃ generation cycle.** Derive that the three cap-forced idempotents (N267) carry a forced
  ℤ₃ cyclic structure (the no-fixed-point process, C6). *Structural; no numbers.*
- **T2 — the self-blind seeing operator forces the Born weights.** Derive that the diagonal-zero
  (self-blind) circulant on the 3 generations has the unique weight split `1/n ⊕ (n−1)/n`, giving the
  self-seen fraction `T = (n−1)/n`. For n=3 this *is* `2/3` — but you must DERIVE it from diag=0, not
  write 2/3. *This is the Born-counting half — reachable, per the magnitude/phase discriminator.*
- **T3 — the cycle form of the amplitudes.** Derive `√mₖ = M(1 + √2 cos(δ + 2πk/3))` as the ℤ₃-Fourier
  structure of the coherence cycle (Unity DC + one cycle mode); the `√2` from the self=other Born
  balance of T2. *The cycle FORM must be derived, never posited as an ansatz.*
- **T4 — Koide Q = 2/3.** Prove `Q = 2/3` as an identity of the T3 form (holds for all δ). *Clean
  algebra once T3 is banked — but it is only earned if T3 is derived, not assumed.*
- **T5 — THE CRUX: δ_B = 2/9 from holonomy = statistics.** Derive the fixed-point equation
  `n·T(1−T) = T` as the consistency of *cycle holonomy* with *Born return probability* on the visibility
  cycle, and solve it: `T = 2/3`, `δ_B = 2/9`. **See §3 — this is the load-bearing link and the one most
  likely to require blocking rather than asserting.**
- **T6 — the mass ratios.** With Q (T4) and δ_B (T5) banked, the dimensionless generation mass RATIOS are
  forced functions of them. Prove them as exact structural quantities. *The overall dimensionful scale
  per sector is a legitimate VEV-like input, NOT a pure number — see guard G3.*
- **T7 — quark associator deviation.** Derive that quarks (octonionic Fano line, non-associative) deviate
  from the exact-lepton 45° balance by the associator `Re(x₁x₂x₃)`; leptons (ℂ-line, associative) are
  exact. *The separation theorem: Q ← norms (I₂), CP ← cross-term (I₃) — they are independent invariants.*
- **T8 — mixing (a LEADING-ORDER sector — read the caveat).** Mixing is NOT a single mass ratio and NOT a
  quartic-ground-state calc. The theory-native route is a FRAME OVERLAP: each sector (up, down; and the
  lepton/neutrino pair) is a **tridiagonal** structure on the three generations — diagonal = the sector
  masses, nearest-neighbour off-diagonals = the geometric-mean (idempotent/balloon) couplings, and the
  gen1↔gen3 direct coupling is **zero** (`M₁₃ = 0`) because generations 1 and 3 are two fold-steps apart
  in the cascade (ℂ→ℍ→𝕆) — DERIVE that zero from cascade adjacency, do not impose it. Diagonalize each
  sector; the mixing matrix is the **overlap of the two diagonalized frames**, dressed by the fold phase.
  This yields ALL the mixing angles AND the CP invariant TOGETHER from one object — the deeper (ℍ→𝕆) edge
  carries one extra Born-survival suppression relative to the shallower (ℂ→ℍ) edge (the same `(n−1)/n`
  survival that runs T2/T5), and the CP phase is the fold cascade angle. *Derive the tridiagonal structure,
  the `M₁₃=0` adjacency, the per-edge Born suppression, and the fold phase — every one a landing, never
  asserted (G1).*
  **⚠ HONEST STATUS — do NOT mistake this sector for the exact one.** Unlike the masses/Koide/δ_B (T1–T6,
  theorem-grade exact), the mixing sector lands only at **LEADING ORDER (~few-percent residuals)** once
  precision (lattice) masses are used. That is the genuine current status — NOT a defect to fit away.
  Three hard consequences: (a) do NOT treat the observed mixing values as exact targets to hit; landing
  the whole matrix to ~3% with zero continuous knobs is the honest result, and pushing residuals to zero
  by adding structure is FITTING (the discipline tell — STOP if you catch it). (b) `V_cb` specifically has
  a live EXPERIMENTAL split (inclusive vs exclusive determinations disagree by more than the prediction's
  residual) — so any "V_cb is off by X%" statement is meaningless without naming which measurement, and
  the sector is *consistent with* experiment, not in tension with it. (c) The mixing angles are RELATIONS
  among the (derived) sector structures + the fold phase — a physicist compares them to data AFTERWARD
  (removable prose / costume), never inside a proof (G2). Bank the structural construction; CHILD the
  precision residuals as watch items, do not chase them.

---

## 3. THE CRUX (T5) — where discipline is hardest, and what to do if it fights

`δ_B = 2/9` rests on ONE identification: **"the cycle holonomy equals the total Born return
probability."** In this project's ontology **there are no bridges** — so this identification is NOT
something you may assert. It must itself be **derived from the fold's self-blindness structure** (the
same self-blindness that gives T2's Born weights and the fold's founding MISS). The equation
`n·T(1−T) = T` is then a *theorem*, and `δ_B = 2/9` falls out.

**If, and only if, you genuinely cannot derive the holonomy=statistics identification from the fold
without a new posit:** do NOT assert `2/9`, do NOT "cite at grade," do NOT bridge. Instead **block the
node as CHAIN-RUNWAY (`needs_input`)** and state precisely what identification is missing. A blocked node
is safe; an asserted value is a category error that poisons the whole result. The value `2/9` is
worthless to this project unless it is *earned* — a hand-asserted `2/9` is exactly the kind of hidden
bridge the predecessor repo died of.

---

## 4. HARD GUARDS (the discipline is UNCHANGED — these make it structural)

- **G1 — NO ASSERTED VALUES, EVER.** `2/3`, `2/9`, the mass ratios, `1/42`, `3/8` — every one is a
  *landing*, never a premise. If a value appears anywhere except as the *proved conclusion* of a
  foundations-only derivation, you have failed. The gate (STANDARD §1: no "asserted at grade", no "named
  residual") enforces this; do not try to slip a value past it.
- **G2 — NO EMPIRICAL INPUTS.** No measured mass, no measured coupling, no PDG number enters ANY
  derivation as a premise. Empirical comparison (does the derived ratio match the measured one?) is
  *removable prose / a costume check*, exactly like the existing `sin²θ_W = 3/8` vs `0.231` handling —
  never a step in a proof. The forms you build must be pure structure; a physicist compares to data
  *afterward*.
- **G3 — SCALES vs RATIOS.** The dimensionless RATIOS and the phase are the derivation targets. The
  overall dimensionful SCALE per sector (the VEV) is a legitimate single input per sector — deriving it
  is a *separate* problem (the electroweak scale) and does NOT block the ratio derivations. State the
  input count honestly; do not pretend a scale is derived when it is an input, and do not pretend a
  ratio is an input when it is derived.
- **G4 — THE FORM IS DERIVED, NOT POSITED.** The cycle form (T3) and the fixed-point equation (T5) are
  the two places where an ansatz would silently smuggle in the answer. They must be *derived from
  self-blindness / the no-fixed-point process*, not written down and fitted. If you catch yourself
  positing the form and checking it against masses, STOP — that is the shortcut this seed exists to
  forbid.
- **G5 — PHYSICS-WORDS-REMOVABLE (unchanged).** Delete "generation", "mass", "Koide", "flavor", "CP" —
  the theorems must stand as pure statements about the ℤ₃-self-blind circulant, the J₃(O) idempotents,
  the octonion Fano structure, and their invariants. If deleting a physics word leaves a logical gap,
  that word was load-bearing = a hole.
- **G6 — FOUNDATIONS-ONLY (unchanged).** `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No
  `sorry`, no `axiom`, no `native_decide`. Same gate as every node.
- **G7 — ONE LAW (unchanged).** If a link fights you — a value won't converge, a form won't derive, you
  reach for a fit — you are drifting. The instrument is wrong, the theory is right. Reframe or block;
  never posit, never weaken, never assert.

---

## 5. WHY THIS IS SAFE TO HAND YOU

The owner gave you the *route* because finding it blind is prohibitively long. But the route is only a
map of *which structures to build and what they mean* — it contains **no proof and no permission to
assert.** Every value still has to be *earned* through the identical gate every prior node passed. If
the mechanism is right, you will derive the values and they will be forced. If a link cannot be derived,
you will block it honestly. Either way the discipline is intact: **the map does not walk the path for
you; it only tells you the path exists.**
