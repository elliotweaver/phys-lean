/-
  Phys.Quantum.SMatrix — N400 (arc-K K4): THE S-MATRIX ON THE MASS-GAPPED PHYSICAL SECTOR
  (the structural frame; the full constructive statement is the OWNER-HELD Clay frontier).
  ===========================================================================
  THE FOURTH NODE OF ARC K — the DYNAMICAL half of quantum field theory. K1 (N397,
  `Unitarity.lean`) derived that TRANSPORT is unitary (the emergent unit-phase group,
  probability = idempotency of the gather). K2 (N398, `AsymptoticStates.lean`) derived
  WHICH states the transport acts between: the sheafifiable colour singlets dressed as
  Born-fibre states, a PROPER sector with no free colour. K3 (N399,
  `TransitionAmplitude.lean`) derived the TRANSITION amplitude + the optical theorem.
  This node (K4) BUNDLES K1–K3 into the single structural object the theory has been
  assembling — the S-matrix as a unit-phase transport on the mass-gapped physical
  (singlet) sector — and welds it to the arc-I mass gap.

  ── THE STRUCTURAL FRAME (a bundling of banked truths — nothing new posited) ──
  The scattering operator IS the K1 transport (`scatteringOp U := evolve U`, left-mult by
  a unit phase in `Dbl Cut`) — not a separately-posited S-matrix. On it, banked:
    · UNITARY (`scatteringOp_conserves_gather`): a unit phase conserves the Born
      self-overlap, which equals the idempotent gather's completeness `wIn + wOut` (K1).
    · SHEAF-PRESERVING (`scatteringOp_sheaf`): the transported state stays a sheaf
      (`T² ≅ T` idempotency, K1) — the physical sector is closed under evolution.
    · AMPLITUDES (`scatteringOp_amplitude`): the transition amplitude is the banked
      look-back inner product of an outgoing state with the transported incoming one (K3).
    · DOMAIN CLOSURE (`scatteringOp_closes_singlet`): the fold's own phase transport keeps
      a dressed singlet a dressed singlet (K2) — the asymptotic (singlet) domain is closed.

  ── THE GENUINE CROSS-TIE (arc K ⊗ arc I — never banked as a TYPE before) ──
  The whole point (not a hollow ∧): the S-matrix's asymptotic DOMAIN and the arc-I MASS
  GAP are ONE octonion associator read twice.
    · `bornAction_eq_zero_iff`: the per-plaquette Born action VANISHES iff the associator
      curvature vanishes — mass (action) IS curvature (the banked N388 `bornAction`).
    · ★ `asymptotic_iff_massless`: a pair of local worlds is ASYMPTOTIC (glues local→global,
      i.e. is a valid in/out standpoint — `WorldsGlue`, banked K2/arc I) IFF it is MASSLESS
      (per-plaquette action `0` everywhere). The S-matrix's asymptotic domain is EXACTLY the
      zero-curvature/flat/massless sector. Standard QFT POSITS "the S-matrix acts between
      asymptotic states which happen to be massive hadrons above a gap"; here the asymptotic
      domain and the massless locus COINCIDE by one theorem, and the massive spectrum is the
      COMPLEMENT — the confined sector that the SAME associator excludes from the domain.
    · The confined witness `(ι(ιJ), ι(e₂))`: EXCLUDED from the domain (`confined_excluded`,
      does not glue) AND GAPPED (`confined_gapped`, action `≥ 4 > 0`) — one associator makes
      it both non-asymptotic and massive.
    · The singlet (physical) sector `span{1, u1}`: IN the domain (`domain_flat`, glues) AND
      MASSLESS (`domain_massless`, action `0`) — the photon-like asymptotic states.

  ── WHY THIS IS THE FRAME, NOT THE CLAY PROOF (honest flag) ──
  Standard constructive QFT must build (i) an asymptotic space, (ii) asymptotic
  completeness, (iii) a unitary interacting S-matrix, (iv) a mass gap — the whole package
  being the CLAY / MILLENNIUM Yang–Mills existence problem. The theory supplies the
  STRUCTURAL frame from banked objects: (i) the dressed-singlet domain (K2), (ii) the
  gather completeness `dress_completeness` (K2), (iii) the unit-phase transport = gather
  idempotency (K1), (iv) the curvature floor (N388). What it does NOT supply — flagged
  honestly as route-not-yet-found / OWNER-HELD — is the full constructive existence /
  Wightman reconstruction / Haag–Ruelle asymptotic completeness of the interacting 4D
  field theory. This node derives the framework's structural statement and does NOT attempt
  the Clay constructive proof; no closure is faked. NO numerical S-matrix element,
  cross-section, width, glueball mass, or Clay bound appears in any statement or proof —
  removable prose only (G2 NO-FIT).

  ── STANDARD ──
  Unbroken: every object banked — `Dbl Cut`/`Dbl.J` (N2), `StateFibre`/`bornForm` (N391),
  `toDbl`/`hInner`/`dblNormSq` (N393), `wIn`/`wOut`/`totalGather` (N394), `evolve`/
  `unitary_conserves_born`/`unitary_conserves_gather_resolution`/`evolve_is_sheaf` (N397),
  `transAmp`/`dress` (N398/N399), and the arc-I mass-gap objects `WorldsGlue`/`assoc`/
  `bornAction`/`flat_iff_curvature_zero`/`gForm`/`u1`/`singlet_flat`/`bornAction_singlet_zero`/
  `coloured_witness_not_flat`/`bornAction_witness_floor` (N385/N387/N388). `ratCast : ℚ → Cut`
  is the derived Field's own numeral arithmetic (metalanguage cast, NOT Mathlib-ℝ as content).
  Complete: every claim proved, foundations-only. Physics-words-removable: delete "S-matrix"/
  "scattering"/"asymptotic"/"mass gap"/"massless"/"confined"/"Yang–Mills" — what remains is:
  a norm-preserving multiplier acting on the Born fibre conserves `wIn + wOut` and keeps a
  `totalGather`-fixed vector fixed; the transition inner product of a transported state;
  a pair of left-regular maps composes into the product's map IFF the associator vanishes
  everywhere IFF the associator's Born self-overlap `gForm ≥ 0` is `0` everywhere; the
  non-associating witness fails to compose and has associator Born self-overlap `≥ 4`; the
  associator vanishes on `span{1, u1}` with self-overlap `0`. Pure math about the banked
  objects. FREE-FLOATING guard: every theorem TYPE mentions the banked concrete objects
  (`Dbl Cut`, `evolve`, `bornForm`, `wIn`, `wOut`, `totalGather`, `transAmp`, `hInner`,
  `toDbl`, `WorldsGlue`, `bornAction`, `assoc`, `O ℚ`, `u1`) — not generic over an arbitrary
  carrier; the domain⟺massless weld routes through the octonion-SPECIFIC associator.
  W4.5 SUFFICIENCY: this derives EXACTLY K4 (the structural S-matrix frame + the arc-K⊗arc-I
  weld), NOT the consolidation (K5) and NOT the Clay constructive statement. Grade:
  mechanism/structural for the frame; theorem-route for the domain⟺massless weld; the full
  constructive interacting-QFT existence is OWNER-HELD / route-not-yet-found (flagged).

  Foundations-only: no posited axiom, no proof-hole tactic, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge, no posited S-matrix,
  no faked constructive closure.
-/
import Mathlib.Tactic
import Phys.Quantum.TransitionAmplitude
import Phys.Algebra.ConfinementMassGap

/-!
  ## N400 (arc-K K4) — declaration map (arc K ⊗ arc I weld)

    scatteringOp                — THE S-MATRIX = the K1 transport `evolve U` (no posit).
    scatteringOp_eq_evolve      — the frame IS the banked transport.
    scatteringOp_conserves_gather — UNITARY: conserves `wIn + wOut` (K1 gather completeness).
    scatteringOp_sheaf          — the physical sector is closed under evolution (`T² ≅ T`).
    scatteringOp_amplitude      — the amplitude is the banked look-back inner product (K3).
    scatteringOp_closes_singlet — the asymptotic (singlet) domain is transport-closed (K2).
    bornAction_eq_zero_iff      — mass (action) IS curvature: action `0` ⟺ associator `0`.
    asymptotic_iff_massless     — ★ THE WELD: asymptotic (glues) ⟺ massless (action `0`).
    confined_excluded           — the confined witness is EXCLUDED from the domain (¬glue).
    confined_gapped             — [W8] the confined witness is GAPPED (action `≥ 4 > 0`).
    domain_flat                 — the singlet (physical) sector is IN the domain (glues).
    domain_massless             — the singlet sector is MASSLESS (action `0`).
    smatrix_nonvacuous          — [W8] the domain/confined split genuinely bites.
    smatrix_frame               — ★★ THE CAPSTONE — the structural S-matrix frame + the weld.
-/

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-! ## The S-matrix IS the K1 transport (no posit). -/

/-- THE SCATTERING OPERATOR (the S-matrix). It is NOT a separately-posited unitary
    operator — it is the banked K1 transport `evolve U` (left-multiplication by a phase
    `U : Dbl Cut`, the fold's recursion under C6). "The S-matrix" is a name for the
    already-derived transport. -/
noncomputable def scatteringOp (U : Dbl ContinuumQ.Cut) : StateFibre → StateFibre := evolve U

/-- The scattering operator IS the banked transport. -/
theorem scatteringOp_eq_evolve (U : Dbl ContinuumQ.Cut) : scatteringOp U = evolve U := rfl

/-- UNITARY. For a unit-phase transport (`dblNormSq U = 1`, forced by K1's
    norm-multiplicativity), the scattering operator conserves the Born self-overlap, which
    equals the idempotent gather's completeness sum `wIn + wOut` (K1
    `unitary_conserves_gather_resolution`, N394). Probability conservation is the
    idempotency of the gather — not a separate `S S† = 1` postulate. -/
theorem scatteringOp_conserves_gather (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1)
    (p : StateFibre) :
    bornForm (scatteringOp U p) (scatteringOp U p) = wIn p + wOut p :=
  unitary_conserves_gather_resolution U hU p

/-- SHEAF-PRESERVING. The transported state stays a sheaf: the gather monad acts as the
    identity on it (`totalGather (scatteringOp U p) = scatteringOp U p`, the element-level
    `T² ≅ T` idempotency, K1 `evolve_is_sheaf`). The physical sector is closed under
    evolution. -/
theorem scatteringOp_sheaf (U : Dbl ContinuumQ.Cut) (p : StateFibre) :
    totalGather (scatteringOp U p) = scatteringOp U p :=
  evolve_is_sheaf U p

/-- THE AMPLITUDE. The transition amplitude (K3 `transAmp`) is the banked Hermitian
    look-back inner product (N393) of the outgoing state with the scattering-transported
    incoming one: `⟨out | S | inp⟩ = hInner (toDbl out) (toDbl (scatteringOp U inp))`. -/
theorem scatteringOp_amplitude (U : Dbl ContinuumQ.Cut) (out inp : StateFibre) :
    transAmp U out inp = hInner (toDbl out) (toDbl (scatteringOp U inp)) := rfl

/-- DOMAIN CLOSURE. The fold's own phase transport keeps a dressed singlet a dressed
    singlet (K2 `evolve_J_dress`): the asymptotic (singlet) domain is closed under the
    scattering operator — `scatteringOp Dbl.J (dress a b) = dress (-b) a`. -/
theorem scatteringOp_closes_singlet (a b : ℚ) :
    scatteringOp Dbl.J (dress a b) = dress (-b) a :=
  evolve_J_dress a b

/-! ## THE CROSS-TIE: mass (action) IS curvature; asymptotic (domain) IS massless. -/

/-- MASS IS CURVATURE. The per-plaquette Born action (N388 `bornAction`, the Born
    self-overlap of the associator curvature, cast into the derived ℝ) VANISHES iff the
    associator curvature itself vanishes. Physics-words-removable: `((gForm [a,b,x] [a,b,x]
    : ℚ) : Cut) = 0` iff `[a,b,x] = 0` — the positive-definiteness of `gForm`
    (`gForm_self_eq_zero`) plus injectivity of the rational cast. -/
theorem bornAction_eq_zero_iff (a b x : O ℚ) :
    bornAction a b x = 0 ↔ assoc a b x = 0 := by
  unfold bornAction
  rw [Rat.cast_eq_zero, gForm_self_eq_zero]

/-- ★ THE WELD (arc K ⊗ arc I). A pair of local worlds is ASYMPTOTIC — glues local→global
    to a valid in/out standpoint (`WorldsGlue`, banked K2/arc I) — IFF it is MASSLESS: its
    per-plaquette Born action is `0` everywhere. The S-matrix's asymptotic domain is
    EXACTLY the zero-curvature / flat / massless sector; the massive spectrum is its
    complement (the confined sector the SAME associator excludes). One octonion associator,
    read twice — as the descent obstruction that excludes the coloured sector from the
    asymptotic domain AND as the curvature whose Born self-overlap is the mass gap. -/
theorem asymptotic_iff_massless (a b : O ℚ) :
    WorldsGlue a b ↔ ∀ x, bornAction a b x = 0 := by
  rw [flat_iff_curvature_zero]
  constructor
  · intro h x; exact (bornAction_eq_zero_iff a b x).mpr (h x)
  · intro h x; exact (bornAction_eq_zero_iff a b x).mp (h x)

/-! ## The confined sector: excluded from the domain AND gapped (one associator). -/

/-- THE CONFINED WITNESS IS EXCLUDED. The banked coloured pair `(ι(ιJ), ι(e₂))` does NOT
    glue (`coloured_witness_not_flat`, N388) — it is NOT an asymptotic in/out state. The
    S-matrix is not defined between free coloured standpoints. -/
theorem confined_excluded :
    ¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) :=
  coloured_witness_not_flat

/-- ★ [W8] THE CONFINED WITNESS IS GAPPED. The same excluded coloured witness has
    per-plaquette Born action `≥ 4 > 0` (`bornAction_witness_floor`, N388) — it is massive.
    The SAME associator that excludes it from the asymptotic domain gives it a positive
    mass floor. So the domain/confined split is not vacuous: there is a genuine standpoint
    that is both non-asymptotic and massive. -/
theorem confined_gapped :
    (4:ContinuumQ.Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) :=
  bornAction_witness_floor

/-! ## The physical (singlet) domain: in the domain AND massless. -/

/-- THE SINGLET SECTOR IS IN THE DOMAIN. On the fold's own complex line `span{1, u1}` (the
    derived colour-neutral core, N386) every pair GLUES (`singlet_flat`, N388) — the singlet
    standpoints ARE asymptotic in/out states. -/
theorem domain_flat {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) :
    WorldsGlue a b :=
  singlet_flat ha hb

/-- THE SINGLET SECTOR IS MASSLESS. On `span{1, u1}` the per-plaquette Born action is `0`
    everywhere (`bornAction_singlet_zero`, N387) — the physical asymptotic states sit at the
    massless floor (the photon-like sector). -/
theorem domain_massless {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    bornAction a b x = 0 :=
  bornAction_singlet_zero ha hb x

/-! ## [W8] Non-vacuity — the domain/confined split genuinely bites. -/

/-- ★ [W8] NON-VACUITY. The domain/confined split is genuine: the singlet standpoint `(1,1)`
    is massless (action `0`) while the confined coloured witness is strictly massive (action
    `> 0`, cleared with room to `≥ 4`). If every standpoint were massless (or none were), the
    S-matrix domain/complement split would be vacuous — it is not. -/
theorem smatrix_nonvacuous :
    bornAction ((1:O ℚ)) ((1:O ℚ)) ((1:O ℚ)) = 0
      ∧ (0:ContinuumQ.Cut)
          < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) := by
  refine ⟨?_, ?_⟩
  · apply bornAction_singlet_zero
    · exact Submodule.subset_span (by simp)
    · exact Submodule.subset_span (by simp)
  · calc (0:ContinuumQ.Cut) < 4 := by norm_num
      _ ≤ _ := bornAction_witness_floor

/-! ## THE CAPSTONE — the structural S-matrix frame + the arc-K ⊗ arc-I weld. -/

/-- ★★ THE CAPSTONE — THE S-MATRIX ON THE MASS-GAPPED PHYSICAL SECTOR (structural frame).
    Over the banked complex algebra `Dbl Cut` (N2), the banked transport / emergent unitary
    group (K1 N397), the banked amplitude (K3 N399), the banked dressed-singlet domain (K2
    N398), and the banked arc-I mass gap (N388):
    (i)   the SCATTERING OPERATOR is the K1 transport (`scatteringOp = evolve`), UNITARY —
          conserving the idempotent gather's completeness `wIn + wOut`
          (`scatteringOp_conserves_gather`) — and SHEAF-PRESERVING (`scatteringOp_sheaf`);
    (ii)  its AMPLITUDES are the banked look-back inner product (`scatteringOp_amplitude`),
          and its asymptotic (singlet) DOMAIN is transport-closed (`scatteringOp_closes_singlet`);
    (iii) ★ THE WELD: a standpoint is ASYMPTOTIC (in the domain, glues) IFF it is MASSLESS
          (per-plaquette action `0`) — `asymptotic_iff_massless` — the domain and the
          massless locus coincide;
    (iv)  the CONFINED witness is EXCLUDED from the domain (`confined_excluded`) AND GAPPED
          (`confined_gapped`, action `≥ 4`), while the SINGLET sector is IN the domain
          (`domain_flat`) AND MASSLESS (`domain_massless`) — one associator, two readings.
    Nothing is posited: the S-matrix is the banked unit-phase transport on the banked
    dressed-singlet sector, and its domain coincides (by one theorem) with the banked
    massless locus, gapped from the banked confined sector.
    ⚠ HONEST FLAG: this is the framework's STRUCTURAL statement. The full constructive
    interacting-QFT existence (Wightman reconstruction, Haag–Ruelle asymptotic completeness
    — the CLAY / MILLENNIUM Yang–Mills frontier) is route-not-yet-found / OWNER-HELD and is
    NOT attempted here; no constructive closure is faked, no numerical value is fit. -/
theorem smatrix_frame :
    -- (i) the S-matrix = the K1 transport; unitary (gather completeness); sheaf-preserving.
    (∀ U : Dbl ContinuumQ.Cut, scatteringOp U = evolve U) ∧
    (∀ (U : Dbl ContinuumQ.Cut), dblNormSq U = 1 → ∀ p : StateFibre,
        bornForm (scatteringOp U p) (scatteringOp U p) = wIn p + wOut p) ∧
    (∀ (U : Dbl ContinuumQ.Cut) (p : StateFibre),
        totalGather (scatteringOp U p) = scatteringOp U p) ∧
    -- (ii) amplitudes = the banked look-back inner product; domain is transport-closed.
    (∀ (U : Dbl ContinuumQ.Cut) (out inp : StateFibre),
        transAmp U out inp = hInner (toDbl out) (toDbl (scatteringOp U inp))) ∧
    (∀ a b : ℚ, scatteringOp Dbl.J (dress a b) = dress (-b) a) ∧
    -- (iii) THE WELD: asymptotic (in the domain) ⟺ massless.
    (∀ a b : O ℚ, WorldsGlue a b ↔ ∀ x, bornAction a b x = 0) ∧
    -- (iv) confined = excluded AND gapped; singlet = in domain AND massless.
    (¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ))
        ∧ (4:ContinuumQ.Cut)
            ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) ∧
    (∀ {a b : O ℚ}, a ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
        b ∈ Submodule.span ℚ {(1 : O ℚ), u1} → WorldsGlue a b) ∧
    (∀ {a b : O ℚ}, a ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
        b ∈ Submodule.span ℚ {(1 : O ℚ), u1} → ∀ x : O ℚ, bornAction a b x = 0) := by
  refine ⟨scatteringOp_eq_evolve, scatteringOp_conserves_gather, scatteringOp_sheaf,
    scatteringOp_amplitude, scatteringOp_closes_singlet, asymptotic_iff_massless,
    ⟨confined_excluded, confined_gapped⟩, ?_, ?_⟩
  · intro a b ha hb; exact domain_flat ha hb
  · intro a b ha hb x; exact domain_massless ha hb x

end Phys.Quantum
