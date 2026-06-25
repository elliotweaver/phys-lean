# PREREG — N34 increment 4(a): the TOPOLOGY RUNG on the derived ℝ + the Heine–Borel
# TOPOLOGICAL COMPACTNESS of the orthogonal-isometry group over the derived continuum,
# with the banked AutO coordinate image landing in it. Child N35 = the analytic operator-exp core.

FROZEN before production compute. Worker run 157, task t_f19480d9.
Parent N33 (t_1044a32e) banked `ConditionallyCompleteLinearOrder Cut`; this node BUILDS the
remaining analytic sub-tower over the DERIVED ℝ `ContinuumQ.Cut` and banks the COMPACTNESS.

## W9 MEASUREMENT (bounded #check/example probes, ALL exit 0, ~8s each — DECISIVE, changed the plan)

workbench/N34-operator-exp/probe_topo{1,2,3}.lean, probe_box.lean, probe_haus.lean,
probe_ring.lean, probe_closed2.lean, probe_ratcast{,2}.lean:

- With N33's `ConditionallyCompleteLinearOrder Cut`, the STANDARD ORDER TOPOLOGY is reachable
  CHEAPLY as MACHINERY (STANDARD §3 — a property OF the derived ℝ, not a posited topology):
    • `TopologicalSpace Cut := Preorder.topology Cut`, `OrderTopology Cut := ⟨rfl⟩` (elaborate clean)
    • `T2Space Cut`, `OrderClosedTopology Cut` — inferInstance
    • ★ `IsTopologicalRing Cut` / `ContinuousMul`/`ContinuousAdd` — inferInstance (the derived ℝ is
      a TOPOLOGICAL RING under the order topology)
    • `ConditionallyCompleteLinearOrder.toCompactIccSpace` ⟹ `CompactIccSpace Cut` ⟹
      ★★ `isCompact_Icc : IsCompact (Set.Icc a b)` — HEINE–BOREL on the DERIVED ℝ
    • `isCompact_univ_pi` ⟹ finite-product BOX compactness `[-1,1]^n` over Cut
    • `IsCompact.of_isClosed_subset` (closed ⊆ compact ⟹ compact)
- Orthonormality conditions over Cut are CLOSED: `M ↦ ∑ i, M i j * M i k` is continuous
  (`continuous_finset_sum` + `continuous_apply`), so `{M | ∑ i, M i j * M i k = c}` is `isClosed_eq`.
- The `ℚ → Cut` canonical embedding (`RatCast Cut`, `CharZero Cut`, inferInstance) transports the
  banked N32 ℚ-facts cleanly: `∑ (f i)^2 = 1 (ℚ) ⟹ |(f i : Cut)| ≤ 1`, `∑ f i*g i = c (ℚ) ⟹
  ∑ (f i:Cut)*(g i:Cut) = (c:Cut)` (`exact_mod_cast`/`push_cast`).
- THE HARD CORE (NOT reachable this run): the operator norm + a UNIFORM/Cauchy-complete structure
  on `End (O Cut)` + `tsum`/power-series convergence of `exp(D)=∑Dⁿ/n!` + `exp(D)∈AutO` +
  `d/dt exp(tD)|₀=D`. The order topology gives Heine–Borel but NOT out-of-the-box a uniform space
  carrying Cauchy-completeness in the form `tsum`/`NormedSpace.exp` consume. This is the genuine
  multi-file W1 analytic BUILD the N32/N33 measurements already flagged — grinding it in one run is
  the W9 timeout death that killed N28/29/30/30a/30b/N32/N33. → CHILD N35 (NOT asserted here).

## THE REFRAME (W1 step 2 — through the trunk) + THE ONE CAUSE

Topological compactness of the automorphism group does NOT need the exp. The SAME Born positivity
(self-overlap = gForm, a sum of coordinate squares) that
  • made every derivation SKEW-ADJOINT (N26) and
  • bounded every automorphism's entries `|entry| ≤ 1` (N32, the unit-box)
gives — once the derived ℝ is order-complete (N33) hence Heine–Borel — the COMPACTNESS of the
orthogonal-isometry group: closed (orthonormality = continuous polynomial conditions) + bounded
(the N32 unit-box) ⟹ compact. ONE cause (Born definiteness), several terminations (skew-adjoint
algebra, bounded group, COMPACT group). This is the Heine–Borel half of "Aut(𝕆) compact"; the
exp (the analytic 1-parameter-subgroup half) is childed.

## GO (this run — bank-as-you-go, EACH piece its own commit; FINALIZE EARLY)

COMMIT 1 — `Phys/Foundation/ContinuumTopology.lean` (ℝ-import-free; imports ContinuumCCLO +
  Mathlib.Topology.Order.Compact + Mathlib.Topology.Algebra.Order.Field + Mathlib.Topology.Constructions):
  • `instance instTopologicalSpaceCut : TopologicalSpace Cut := Preorder.topology Cut`
  • `instance instOrderTopologyCut : OrderTopology Cut := ⟨rfl⟩`
  • theorems re-exporting the derived facts: `t2Space_cut`, `isTopologicalRing_cut`,
    `compactIccSpace_cut`, ★ `isCompact_Icc_cut (a b : Cut) : IsCompact (Set.Icc a b)` (Heine–Borel),
    `isCompact_box` (the `[-1,1]^n` box compact).

COMMIT 2 — `Phys/Algebra/DerivationAutCompactTopo.lean` (imports ContinuumTopology + DerivationAutCompact):
  • `bornIsometrySet : Set (Fin 8 → Fin 8 → Cut)` := orthonormal columns for the standard sum
    (= the Born form in the bO frame, banked `gForm_polar`): `{M | ∀ j k, ∑ i, M i j * M i k = δ}`.
  • `bornIsometry_subset_box` — an element's entries satisfy `|M i j| ≤ 1` (from the diagonal
    condition `∑ i, M i j * M i j = 1` + nonneg summands, the N32 single_le_sum argument over Cut).
  • `bornIsometry_isClosed` — CLOSED (intersection of `isClosed_eq` orthonormality conditions).
  • ★★ `bornIsometry_isCompact : IsCompact bornIsometrySet` — closed ⊆ compact box (Heine–Borel).
  • ★ `autO_matrix_mem_bornIsometry (φ : AutO) : (fun i j => ((coordO (φ.1 (bO j)) i : ℚ) : Cut)) ∈
    bornIsometrySet` — the banked `AutO_col_orthogonal` (N32) cast through ℚ→Cut: the automorphism
    group's coordinate image lands in the COMPACT orthogonal-isometry set. (Heine–Borel compactness
    of the group's home, the ONE-cause payoff.)
  • non-vacuity: the identity matrix ∈ bornIsometrySet (nonempty, the bound saturated).

Anti-vacuity costume C56 (MUST bite): a WRONG claim — an orthonormal-column matrix with an entry
`= 2` (violating `|·| ≤ 1`), OR a non-compact claim for the definite-form isometry set, OR the
identity matrix asserted to have a diagonal entry ≠ 1 — must FAIL to compile (reduces to a Cut
contradiction like `(1:Cut) = 2` or `(2:Cut)^2 ≤ 1`). Reuse the banked AutO/coordO/bO/gForm_polar/
N32 boundedness/ContinuumCCLO/the topology rung — NEVER a fresh table/order/orthogonal group.

## KILL / compile-cost budget (W9)
- Every lemma is either an `inferInstance`/`isCompact_*` machinery call (measured ~8s clean) or a
  finite-`Fin 8` coordinate identity (the same shape as the banked N32 lemmas). KILL: if any single
  lemma's tactic block exceeds ~90s in a bounded probe, STOP — decompose/reframe (NEVER inflate
  maxHeartbeats). The closedness intersection (64 conditions) is the only mild risk; if heavy,
  state closedness as a single `isClosed_iInter`/`isClosed_biInter` over the index, measured first.
- TURN CHECKPOINT ~50%: COMMIT 1 (topology rung) banked by then; COMMIT 2 in progress. FINALIZE
  EARLY (AxiomAudit + costume + LEDGER + ROADMAP + child N35) with turns to spare. If COMMIT 2's
  isometry-compactness risks the budget, COMMIT 1 (the topology rung) alone is a clean bankable
  increment — child the compactness + operator-exp to N35.

## NO-GO (forbidden this run)
- NO `import Mathlib.Data.Real` / Mathlib ℝ as content (STANDARD §3 STANDING GATE).
- NO posited exp / G₂ / Aut / orthogonal-group / topology-on-ℝ — BUILD on the derived `Cut`.
- NO bridge / asserted-at-grade / weakened target.
- NO attempt to grind the analytic operator-exp (Cauchy-completeness/tsum/exp∈Aut/d-dt) this run
  (W9 — measured the hard multi-file core, childed N35).

## STANDARD pre-commitment
- UNBROKEN: the topology is `Preorder.topology` on the banked `ConditionallyCompleteLinearOrder Cut`
  (N33) — standard order MACHINERY on the DERIVED object (STANDARD §3: a property OF the derived ℝ,
  the metalanguage in which "this derived ℝ is Heine–Borel" is a theorem, NOT a posited number
  system/topology). The compactness reuses banked AutO (N31) + N32 boundedness/orthonormality +
  gForm_polar + the ℚ→Cut cast. Topology/Matrix/Finset.sum are MACHINERY.
- COMPLETE: foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide.
- PHYSICS-WORDS-REMOVABLE: delete "compact / orthogonal-group / gauge / G₂ / colour / automorphism"
  → the file is the pure statement that the order topology on the completion of the gather-of-
  closures of the derived rationals is Heine–Borel, and the set of 8×8 matrices over it with
  orthonormal columns for the standard sum is topologically COMPACT, and the coordinate matrix of
  every structure-preserving ℚ-linear bijection of the Cayley–Dickson double-of-a-double-of-a-double
  of ℚ lands in it. NO physics name is load-bearing.
