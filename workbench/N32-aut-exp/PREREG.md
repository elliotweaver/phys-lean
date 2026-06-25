# PREREG — N32 increment 2: the continuum-free COMPACTNESS SKELETON of AutO + W1 decompose of the analytic exp

FROZEN before production compute. Worker run 153, task t_6c3d1afa.

## W9 MEASUREMENT (bounded probes — DECISIVE, earned its budget by CHANGING the plan)

probe_measure.lean / probe_measure2.lean / probe_sigs.lean / probe_ortho.lean (all #check/#synth, fail-fast):

- Derived ℝ `Cut` carries: `Field`, `LinearOrder`, `IsStrictOrderedRing`. `O Cut` forms (CommRing).
- `Cut` does NOT carry: `TopologicalSpace`, `UniformSpace`, `NormedField`, `Archimedean`.
  (Only the rational base `Q` has banked `Archimedean`.)
- `NormedSpace.exp : {𝔸} → [Ring 𝔸] → [TopologicalSpace 𝔸] → [IsTopologicalRing 𝔸] → 𝔸 → 𝔸`.
  ⟹ The analytic operator-exp needs a TOPOLOGY + completeness on the derived ℝ that is NOT banked.
- TRUNK FACT (banked): every derivation is `gForm`-skew-adjoint (`gFormQ_skew`,
  `derivationLieQ_le_skewAdjoint`) ⟹ negative-definite trace form ⟹ SEMISIMPLE
  (`derivationLieQ_semisimple`), NOT nilpotent. So derivations are rotation-like; their exp is
  genuinely transcendental (cos/sin). ⟹ NO continuum-free finite-sum exp shortcut exists.
- ORTHONORMALITY route locked (probe_ortho.lean, 3 example lemmas compile clean):
  `coordO (bO i) = Pi.single i 1`, `gForm (bO i) (bO j) = if i=j then 1 else 0`,
  `gForm w w = ∑ j, (coordO w j)^2`.

## THE SCOPE DECISION (W1/W3/W4.5 — forced by the measurement)

The full analytic exp `Der(𝕆) → Aut(𝕆)` over the derived ℝ is a genuine W1 hard core: it requires
an analytic sub-tower over `Cut` (topology, uniform/Cauchy completeness, operator norm, power-series
convergence, Heine–Borel) that is NOT banked and is a multi-file BUILD. Grinding it in one run is the
exact W9 timeout death that killed N28/29/30/30a/30b. The measurement CHANGED the plan: do NOT attempt
the analytic exp this run.

INSTEAD, bank the genuinely-NEW, continuum-free COMPACTNESS SKELETON — the algebraic heart of
"the definite Born form makes Aut(𝕆) compact" (the SAME Born positivity from the trunk, ONE cause):

  GO (this run, continuum-free, foundations-only, in Phys/Algebra/DerivationAutCompact.lean):
   1. `gForm_polar`        — gForm v w = ∑ i, (coordO v i)·(coordO w i)   [polarization of the
                              banked gForm_self_sum_sq; the Born form IS the standard inner product
                              in the orthonormal frame].
   2. `gForm_orthonormal`  — gForm (bO i) (bO j) = if i = j then 1 else 0.
   3. `aut_col_unit`       — for φ : AutO, ∑ i, (coordO (φ (bO j)) i)^2 = 1   (each coordinate
                              column of an automorphism is a UNIT vector — isometry of the frame).
   4. `aut_col_orthogonal` — ∑ i, coordO(φ(bO j)) i · coordO(φ(bO k)) i = if j=k then 1 else 0
                              (the columns are ORTHONORMAL — the algebraic orthogonal-group relation).
   5. `aut_entry_bound`    — |coordO (φ (bO j)) i| ≤ 1 for every automorphism, every entry
                              (★ THE BOUNDEDNESS = the algebraic skeleton of COMPACTNESS, from the
                              definite Born form). Equivalently (coordO (φ (bO j)) i)^2 ≤ 1.
   6. (stretch, bank-as-you-go iff turns allow) the matrix `M(φ) := toMatrix bO bO φ` satisfies
      `Mᵀ * M = 1` and `det M ^ 2 = 1` — the recognizable orthogonal-group / det=±1 statement.

  Anti-vacuity costume C54 (MUST bite): a WRONG boundedness/orthogonality claim — e.g. asserting
  some automorphism coordinate column has squared-norm ≠ 1, or an entry with square > 1 — must FAIL.

  CHILD onto the chain tail (W1 dissolution/decomposition node, NOT asserted here):
   N33 — the analytic exp `Der(𝕆) → Aut(𝕆)` + topological COMPACTNESS over the derived ℝ
   `ContinuumQ.Cut`. Requires the analytic sub-tower BUILD: topology + Cauchy-completeness on `Cut`,
   operator norm on End(O Cut), power-series convergence (C6 eternal-approach one level up),
   exp(D) ∈ AutO, d/dt exp(tD)|₀ = D, and Heine–Borel (closed + the banked algebraic boundedness ⟹
   compact). Do NOT import Mathlib ℝ as content.

## KILL / compile-cost budget (W9)
- Each forward lemma is a coordinate identity on a FIXED 8-term expansion (the same shape as the
  banked gForm_self_sum_sq, which compiles fine). KILL: if any single lemma's `ring`/`simp` closure
  exceeds ~90 s in a bounded probe, STOP — decompose that lemma or reframe (do NOT inflate
  maxHeartbeats). The polarization `gForm_polar` is the only mild W9 risk (8×8 cross terms); if its
  monolithic `ring` is heavy, prove it from gForm_self_sum_sq by polarization identity
  gForm v w = ½(gForm(v+w)(v+w) − gForm v v − gForm w w) instead of raw expansion.
- TURN CHECKPOINT ~55%: by then, lemmas 1–5 committed (bank-as-you-go: commit the instant each
  elaborates). FINALIZE EARLY (AxiomAudit + costume + LEDGER + ROADMAP + child) with turns to spare.
  DECOMPOSE the stretch (lemma 6) to a follow-up if it risks the budget.

## NO-GO (forbidden this run)
- NO `import Mathlib.Data.Real` / Mathlib ℝ as content (STANDARD §3 STANDING GATE).
- NO posited exp / G₂ / Aut / orthogonal group — BUILD forward on the derived objects.
- NO bridge / asserted-at-grade / weakened target.
- NO attempt to grind the analytic exp inside the turn budget (W9 — measured dead for one run).

## STANDARD pre-commitment
- UNBROKEN: every lemma derives from banked gForm/coordO/bO (N24) + aut_gForm/AutO (N31) + the
  octonion frame; Matrix/Finset.sum standard MACHINERY on the DERIVED object.
- COMPLETE: foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide.
- PHYSICS-WORDS-REMOVABLE: delete "compact / orthogonal-group / gauge / G₂ / colour" → a complete
  proof that the structure-preserving ℚ-linear bijections of the Cayley–Dickson double-of-double-of-
  double of ℚ have coordinate columns of unit Born-length, mutually orthogonal, each entry bounded by 1.
