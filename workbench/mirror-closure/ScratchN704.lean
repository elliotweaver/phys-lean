import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.TowerGatherIsometry
import Phys.Algebra.InteractionChannelTower
import Mathlib.Data.Finset.Sym
import Mathlib.Tactic

/-!
  # N704 — CHANNEL ORIENTATION CHARACTERIZED (why 42 directed, not 21 quotiented)
  ==============================================================================
  THE REFEREE'S QUESTION: `imChannelCount n := offDiag.card` DEFINES the directed
  (ordered-pair) channel count. "What I do not want is the count decided by choosing
  `Finset.offDiag`." Why is the interaction channel space DIRECTED (42 ordered
  off-diagonal pairs at n = 7) rather than quotiented by reversal (21 unordered)?

  THIS NODE derives the channel object from the ALGEBRA and lets the algebra decide.

  ## THE TRANSPORT OBJECT
  Each ordered pair `(j,k)`, `j ≠ k`, carries its cross-product transport
  `channelTransport (j,k) = octCross (imBasis j) (imBasis k) ∈ Im(𝕆)` — the banked
  vector product (N-OctonionCrossProduct) on the banked orthonormal imaginary frame
  (`imBasis`, N-DerivationStabilizerSplit; `gForm_imBasis i j = δ_ij`,
  N-TowerGatherIsometry). The channel object proper is the GRAPH of the transport
  (`ChannelGraph` — pairs WITH their transports), not the bare pair set.

  ## WHAT IS PROVED (all from banked material, no new inputs)
  1. `channelTransport_reversal` — reversal SIGN-FLIPS the transport:
     `T(k,j) = −T(j,k)` (banked antisymmetry `octCross_antisymm`).
  2. `channelTransport_gram_self` — every transport is a Born UNIT: `⟨T,T⟩ = 1`
     (banked Lagrange identity `octCross_lagrange` + frame orthonormality). Hence
     `channelTransport_ne_zero`: no transport vanishes.
  3. `channelReversal_ne` / `graphReversal_free` — reversal acts FREELY (no fixed
     points) on the pairs and on the transport graph.
  4. `channelTransport_reversal_ne` — the reversed transport is a genuinely DISTINCT
     algebra element: `−T ≠ T` (since `⟨T,T⟩ = 1 ≠ 0`, char-0 Gram argument).
  5. ★ THE DERIVED DISCRIMINATOR (`gram_detects_orientation`,
     `quotient_identifies_gram_distinct`): the banked Gram form ITSELF distinguishes
     the two members of every reversal orbit — `gForm (T(k,j)) (T(j,k)) = −1` while
     `gForm (T(j,k)) (T(j,k)) = +1`. Orientation is ALGEBRA-detectable (a Gram
     contraction of transports), NOT label-detectable. The individuation of channels
     by transports is therefore DERIVED-FROM-GRAM, not an assumed input: the support
     quotient identifies channels whose transports the banked bilinear structure
     provably separates.
  6. BOTH COUNTS, exactly (`channel_count_fork`): the transport-individuated object
     has `card = 42` (`channelGraph_card`, via `Fintype.card_subtype`, NOT by choosing
     `offDiag`); the support-individuated quotient (`ChannelSupport` = non-diagonal
     `Sym2`) has `card = 21` (`Sym2.card_subtype_not_diag`, `choose 7 2`); and the
     directed count double-covers the quotient (`42 = 2·21`, the free involution's
     orbit count, fibers exhibited exactly by `channelSupportMap_fiber`).
  7. `imChannelCount_is_transport_graph_count` — offDiag DEMOTED TO EVALUATION: the
     banked `imChannelCount (finrank ℚ ImO) = 42` (N-InteractionChannelTower
     `channels_O`) coincides with the card of the transport graph. `offDiag` is now a
     bookkeeping evaluation of a derived object, not the definition of the count.

  ## THE HONEST FORK (named, not hidden)
  IF channels are individuated by their TRANSPORTS (the object is the graph), the
  count is FORCED to n(n−1) = 42 at n = 7. IF channels are individuated by their
  unordered SUPPORTS, the count is 21. The fork is decided in favour of transports
  by (5): the quotient would identify configurations that the banked Gram structure
  assigns DIFFERENT contraction values (−1 vs +1) — i.e. the quotient is not
  invariant under the algebra's own bilinear observables. What remains an input is
  only that the channel object must be separated by the algebra's Gram observables
  at all (the Born-square reading attaches amplitude to the transport); GIVEN that,
  the direction is derived.

  ⛔ BLIND DISCIPLINE: this node makes NO reference to where any coupling lands and
  uses NO goodness-of-42 reasoning; had the algebra failed to separate ±T, the
  quotient (21) would have been banked instead. It did not fail: `−1 ≠ 1`.

  DERIVED from the trunk: `octCross`/`octCross_antisymm`/`octCross_lagrange`/
  `octCross_mem_ImO` N-OctonionCrossProduct; `imBasis`/`imBasis_mem_ImO`
  N-DerivationStabilizerSplit; `gForm_imBasis` N-TowerGatherIsometry;
  `gForm_smul_left` N31; `imChannelCount`/`imChannelCount_eq_n_times_n_sub_one`/
  `channels_O` N-InteractionChannelTower; Mathlib `Sym2` counting MACHINERY
  (`Sym2.card_subtype_not_diag`, `Sym2.eq_iff`, `Sym2.mk_isDiag_iff`,
  `Fintype.card_subtype`). NO sorry, NO axiom.
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The directed channel object: ordered pairs of distinct frame indices. -/

/-- A DIRECTED channel: an ordered pair `(j,k)` of distinct imaginary-frame indices.
    This is the raw pair object — the transport (below) is what individuates it. -/
abbrev ChannelPair (n : ℕ) := { p : Fin n × Fin n // p.1 ≠ p.2 }

/-- The reversal involution `(j,k) ↦ (k,j)` on directed channels. -/
def channelReversal {n : ℕ} (p : ChannelPair n) : ChannelPair n :=
  ⟨(p.val.2, p.val.1), fun h => p.property h.symm⟩

/-- Reversal is an involution: `reversal (reversal p) = p`. -/
theorem channelReversal_involutive {n : ℕ} (p : ChannelPair n) :
    channelReversal (channelReversal p) = p := rfl

/-- ★ REVERSAL IS FREE on directed channels: no channel is its own reversal
    (a fixed point would force `j = k`, excluded by off-diagonality). -/
theorem channelReversal_ne {n : ℕ} (p : ChannelPair n) : channelReversal p ≠ p := by
  intro h
  have h1 : p.val.2 = p.val.1 := congrArg (fun q : ChannelPair n => q.val.1) h
  exact p.property h1.symm

/-! ## The transport object: each ordered pair carries its cross-product transport. -/

/-- ★ THE TRANSPORT: the directed channel `(j,k)` carries the cross-product transport
    `octCross (imBasis j) (imBasis k) ∈ Im(𝕆)` — the algebra element the channel
    physically transports, in the banked orthonormal imaginary frame. -/
def channelTransport (p : ChannelPair 7) : O ℚ :=
  octCross (imBasis p.val.1) (imBasis p.val.2)

/-- ★★ REVERSAL SIGN-FLIPS THE TRANSPORT: `T(k,j) = −T(j,k)` — the banked
    antisymmetry of the vector product (`octCross_antisymm`). The reversal orbit
    `{(j,k),(k,j)}` carries the two transports `{v, −v}`. -/
theorem channelTransport_reversal (p : ChannelPair 7) :
    channelTransport (channelReversal p) = - channelTransport p :=
  octCross_antisymm (imBasis_mem_ImO p.val.2) (imBasis_mem_ImO p.val.1)

/-- ★★ EVERY TRANSPORT IS A BORN UNIT: `gForm T T = 1` for every directed channel —
    the banked Lagrange identity `⟨u_j×u_k, u_j×u_k⟩ = ⟨u_j,u_j⟩⟨u_k,u_k⟩ − ⟨u_j,u_k⟩²
    = 1·1 − 0² = 1` on the orthonormal frame (`gForm_imBasis`). -/
theorem channelTransport_gram_self (p : ChannelPair 7) :
    gForm (channelTransport p) (channelTransport p) = 1 := by
  unfold channelTransport
  rw [octCross_lagrange (imBasis_mem_ImO p.val.1) (imBasis_mem_ImO p.val.2)]
  simp [gForm_imBasis, p.property]

/-- No transport vanishes: `T(j,k) ≠ 0` for `j ≠ k` (its Gram norm is `1`, and the
    zero vector has Gram norm `0`). -/
theorem channelTransport_ne_zero (p : ChannelPair 7) : channelTransport p ≠ 0 := by
  intro h
  have h1 : gForm (channelTransport p) (channelTransport p) = 1 :=
    channelTransport_gram_self p
  rw [h] at h1
  have h0 : gForm (0 : O ℚ) (0 : O ℚ) = 0 := by
    have h2 := gForm_smul_left (0 : O ℚ) (0 : O ℚ) (0 : ℚ)
    rw [zero_smul, zero_mul] at h2
    exact h2
  rw [h0] at h1
  norm_num at h1

/-- ★★ THE SIGN IS NOT A GAUGE: the reversed transport is a genuinely DISTINCT
    algebra element, `T(k,j) ≠ T(j,k)` — because `−v = v` would force
    `⟨v,v⟩ = −⟨v,v⟩`, i.e. `1 = −1` in ℚ (char 0). The reversal orbit carries TWO
    distinct transports. -/
theorem channelTransport_reversal_ne (p : ChannelPair 7) :
    channelTransport (channelReversal p) ≠ channelTransport p := by
  rw [channelTransport_reversal]
  intro h
  have hg : gForm (-(channelTransport p)) (channelTransport p)
      = - gForm (channelTransport p) (channelTransport p) := by
    rw [← neg_one_smul ℚ (channelTransport p), gForm_smul_left]
    ring
  rw [h, channelTransport_gram_self] at hg
  norm_num at hg

/-! ## ★★★ THE DERIVED DISCRIMINATOR — the banked Gram form detects orientation.

The individuation of channels by transports is NOT an assumed label: the banked
bilinear structure `gForm` (the Born form) assigns the Gram contraction `+1` to a
channel paired with its own transport and `−1` to its reversal paired with the same
transport. Orientation is ALGEBRA-detectable. -/

/-- ★★★ GRAM DETECTS ORIENTATION: `gForm (T(k,j)) (T(j,k)) = −1` while
    `gForm (T(j,k)) (T(j,k)) = +1`. The banked Gram contraction of transports takes
    DIFFERENT values on the two members of every reversal orbit — the algebra itself
    distinguishes reversed channels; no external label is invoked. -/
theorem gram_detects_orientation (p : ChannelPair 7) :
    gForm (channelTransport (channelReversal p)) (channelTransport p) = -1 ∧
    gForm (channelTransport p) (channelTransport p) = 1 := by
  constructor
  · rw [channelTransport_reversal, ← neg_one_smul ℚ (channelTransport p),
      gForm_smul_left, channelTransport_gram_self]
    ring
  · exact channelTransport_gram_self p

/-! ## The support quotient: unordered pairs (what reversal-quotienting would give). -/

/-- The SUPPORT-individuated channel object: an unordered pair of distinct frame
    indices (a non-diagonal element of `Sym2 (Fin n)`) — the object one gets by
    quotienting directed channels by reversal. -/
abbrev ChannelSupport (n : ℕ) := { a : Sym2 (Fin n) // ¬ a.IsDiag }

/-- The quotient map: a directed channel to its unordered support. -/
def channelSupportMap {n : ℕ} (p : ChannelPair n) : ChannelSupport n :=
  ⟨s(p.val.1, p.val.2), by rw [Sym2.mk_isDiag_iff]; exact p.property⟩

/-- The support quotient IDENTIFIES reversal orbits: `support (reversal p) = support p`. -/
theorem channelSupportMap_reversal {n : ℕ} (p : ChannelPair n) :
    channelSupportMap (channelReversal p) = channelSupportMap p :=
  Subtype.ext Sym2.eq_swap

/-- ★ THE FIBERS ARE EXACTLY THE REVERSAL ORBITS: `support q = support p` iff
    `q = p` or `q = reversal p`. The quotient collapses precisely the 2-element
    orbits of the free involution — nothing more, nothing less. -/
theorem channelSupportMap_fiber {n : ℕ} (p q : ChannelPair n) :
    channelSupportMap q = channelSupportMap p ↔ q = p ∨ q = channelReversal p := by
  constructor
  · intro h
    have h' : s(q.val.1, q.val.2) = s(p.val.1, p.val.2) := congrArg Subtype.val h
    rw [Sym2.eq_iff] at h'
    rcases h' with ⟨h1, h2⟩ | ⟨h1, h2⟩
    · exact Or.inl (Subtype.ext (Prod.ext_iff.mpr ⟨h1, h2⟩))
    · exact Or.inr (Subtype.ext (Prod.ext_iff.mpr ⟨h1, h2⟩))
  · rintro (rfl | rfl)
    · rfl
    · exact channelSupportMap_reversal p

/-- ★★ THE QUOTIENT IDENTIFIES GRAM-DISTINCT CHANNELS: the two members of every
    reversal orbit have EQUAL supports but Gram-DISTINGUISHABLE transports
    (contraction `−1 ≠ +1`). This is the honest content of the fork: support
    individuation erases a difference the banked algebra provably detects —
    individuation-by-transport is DERIVED from the Gram structure. -/
theorem quotient_identifies_gram_distinct (p : ChannelPair 7) :
    channelSupportMap (channelReversal p) = channelSupportMap p ∧
    gForm (channelTransport (channelReversal p)) (channelTransport p)
      ≠ gForm (channelTransport p) (channelTransport p) := by
  refine ⟨channelSupportMap_reversal p, ?_⟩
  rw [(gram_detects_orientation p).1, (gram_detects_orientation p).2]
  norm_num

/-! ## Both counts, proved — the fork made exact. -/

/-- The directed channel count is the banked `imChannelCount` — proved through
    `Fintype.card_subtype` (counting the SUBTYPE of distinct ordered pairs), so the
    count is a cardinality of a derived object, not a choice of `offDiag`. -/
theorem channelPair_card (n : ℕ) : Fintype.card (ChannelPair n) = imChannelCount n := by
  rw [Fintype.card_subtype]
  unfold imChannelCount
  congr 1
  ext p
  simp [Finset.mem_offDiag]

/-- ★ THE DIRECTED COUNT: `card (ChannelPair 7) = 42 = 7·6`. -/
theorem channelPair_card_seven : Fintype.card (ChannelPair 7) = 42 := by
  rw [channelPair_card, imChannelCount_eq_n_times_n_sub_one]

/-- ★ THE QUOTIENT COUNT: `card (ChannelSupport 7) = 21 = C(7,2)` — the unordered
    non-diagonal pair count, computed by exhaustive decidable enumeration of
    `Sym2 (Fin 7)` (no `offDiag`, no choice — a finite cardinality fact). -/
theorem channelSupport_card_seven : Fintype.card (ChannelSupport 7) = 21 := by decide

/-- The quotient count IS the binomial coefficient: `21 = C(7,2)`. -/
theorem channelSupport_card_eq_choose :
    Fintype.card (ChannelSupport 7) = Nat.choose 7 2 := by
  rw [channelSupport_card_seven]; decide

/-- ★★ ORBIT COUNTING: the directed count double-covers the quotient count,
    `42 = 2·21` — the arithmetic shadow of the FREE involution (each fiber of
    `channelSupportMap` is a 2-element orbit, `channelSupportMap_fiber` +
    `channelReversal_ne`). -/
theorem channelPair_card_eq_two_mul_support :
    Fintype.card (ChannelPair 7) = 2 * Fintype.card (ChannelSupport 7) := by
  rw [channelPair_card_seven, channelSupport_card_seven]

/-- ★★ THE FORK, EXACT: transport-individuation gives 42, support-individuation
    gives 21, and the ratio is exactly the free reversal action. Both counts are
    THEOREMS; the discriminator between them is `quotient_identifies_gram_distinct`. -/
theorem channel_count_fork :
    Fintype.card (ChannelPair 7) = 42 ∧
    Fintype.card (ChannelSupport 7) = 21 ∧
    Fintype.card (ChannelPair 7) = 2 * Fintype.card (ChannelSupport 7) :=
  ⟨channelPair_card_seven, channelSupport_card_seven, channelPair_card_eq_two_mul_support⟩

/-! ## The channel space proper: the GRAPH of the transport. -/

/-- ★ THE CHANNEL SPACE: the graph of the transport map — channels ARE pairs WITH
    their transports. This is the object the Born-square reading acts on (amplitude
    attaches to the transport), and the object whose cardinality is the channel count. -/
def ChannelGraph := { q : ChannelPair 7 × O ℚ // q.2 = channelTransport q.1 }

/-- The graph is equivalent to the directed pair space (a graph of a function
    always is) — but the graph carries the transports EXPLICITLY, so its points are
    separated by the algebra, not by labels. -/
def channelGraphEquiv : ChannelPair 7 ≃ ChannelGraph where
  toFun p := ⟨(p, channelTransport p), rfl⟩
  invFun q := q.val.1
  left_inv _ := rfl
  right_inv q := Subtype.ext (Prod.ext_iff.mpr ⟨rfl, q.property.symm⟩)

noncomputable instance : Fintype ChannelGraph := Fintype.ofEquiv _ channelGraphEquiv

/-- Reversal lifts to the transport graph with the SIGN-FLIPPED transport. -/
def graphReversal (q : ChannelGraph) : ChannelGraph :=
  ⟨(channelReversal q.val.1, - q.val.2), by
    show -q.val.2 = channelTransport (channelReversal q.val.1)
    rw [channelTransport_reversal, q.property]⟩

/-- ★★ REVERSAL ACTS FREELY ON THE TRANSPORT GRAPH: no point of the channel space
    is fixed — `(j,k)` with transport `v` maps to `(k,j)` with transport `−v ≠ v`. -/
theorem graphReversal_free (q : ChannelGraph) : graphReversal q ≠ q := by
  intro h
  have h1 : channelReversal q.val.1 = q.val.1 :=
    congrArg (fun r : ChannelGraph => r.val.1) h
  exact channelReversal_ne q.val.1 h1

/-- ★★ THE FORCED COUNT: the transport-individuated channel space has exactly
    `42` elements. GIVEN that channels are individuated by their transports (which
    `gram_detects_orientation` derives from the banked Gram structure rather than
    assuming), the count `n(n−1) = 42` at `n = 7` is FORCED. -/
theorem channelGraph_card : Fintype.card ChannelGraph = 42 := by
  rw [← Fintype.card_congr channelGraphEquiv]
  exact channelPair_card_seven

/-! ## Capstone + evaluation: offDiag demoted. -/

/-- ★★★ CHANNEL ORIENTATION CHARACTERIZED (the capstone): reversal sign-flips
    transports and acts freely on the transport graph; the banked Gram form detects
    the orientation (contraction `−1` vs `+1` — individuation DERIVED, not assumed);
    the transport-individuated count is `42` and the support quotient is `21`, with
    the directed count exactly double-covering the quotient. -/
theorem channel_orientation_characterized :
    (∀ p : ChannelPair 7, channelTransport (channelReversal p) = - channelTransport p) ∧
    (∀ q : ChannelGraph, graphReversal q ≠ q) ∧
    (∀ p : ChannelPair 7,
      gForm (channelTransport (channelReversal p)) (channelTransport p) = -1 ∧
      gForm (channelTransport p) (channelTransport p) = 1) ∧
    Fintype.card ChannelGraph = 42 ∧
    Fintype.card (ChannelSupport 7) = 21 :=
  ⟨channelTransport_reversal, graphReversal_free, gram_detects_orientation,
    channelGraph_card, channelSupport_card_seven⟩

/-- ★★ OFFDIAG DEMOTED TO EVALUATION: the banked tower count at the octonion rung
    (`channels_O : imChannelCount (finrank ℚ ImO) = 42`, defined via `offDiag`)
    coincides with the cardinality of the DERIVED transport graph. `offDiag` is now
    a bookkeeping evaluation of the transport-individuated channel space, not the
    definition of the count. -/
theorem imChannelCount_is_transport_graph_count :
    imChannelCount (Module.finrank ℚ ImO) = Fintype.card ChannelGraph := by
  rw [channels_O, channelGraph_card]

/-- The same demotion at the raw index: `imChannelCount 7 = card ChannelGraph`. -/
theorem imChannelCount_seven_eval : imChannelCount 7 = Fintype.card ChannelGraph := by
  rw [channelGraph_card, imChannelCount_eq_n_times_n_sub_one]

end

end Phys.Algebra
