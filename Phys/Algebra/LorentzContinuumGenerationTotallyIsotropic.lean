/-
  Phys.Algebra.LorentzContinuumGenerationTotallyIsotropic — N128: DISCHARGING `haniso_exists` —
  THE TOTALLY-ISOTROPIC EXISTENCE QUESTION DISSOLVED THROUGH BORN POSITIVITY, CLOSING THE FULL
  UNCONDITIONAL `SO⁺(1,9)` INDEFINITE CARTAN–DIEUDONNÉ EXHAUSTION over the derived ℝ `Cut`.

  ===========================================================================
  CONTEXT. N127 banked the indefinite finrank-strong-recursion SKELETON `reflection_exhaustion_M`
  + the concrete reduction `reflection_exhaustion_M_aniso`, which discharge the FULL `SO⁺(1,9)`
  exhaustion DOWN TO the single hypothesis `haniso_exists`: *every non-identity `BvC`-isometry `T`
  has SOME moved vector `v` with `T v ≠ v` and ANISOTROPIC difference `BvC (T v − v)(T v − v) ≠ 0`*.
  N127 also MEASURED (by hand) that the N126 two-reflection peel does NOT grow the fixed subspace
  by subset-inclusion, so the ONLY remaining route to close the global exhaustion is to DISCHARGE
  `haniso_exists`. The ROADMAP §N128 priority (i) THE TOTALLY-ISOTROPIC EXISTENCE QUESTION + THE
  KEY MEASURE: does a `BvC`-isometry `T ≠ id` with EVERY moved `v` totally isotropic actually EXIST
  over the derived `Cut`? If NO, `haniso_exists` is VACUOUSLY discharged and the exhaustion CLOSES.

  ── THE MEASURE-FIRST FINDING (W1 reframe through the trunk — Born = self-overlap = positivity) ──
  NO such `T` exists. The negation of `haniso_exists` forces the image of `N := S − id` to be
  TOTALLY ISOTROPIC (`BvC (N p)(N q) = 0` for all `p, q`, by polarization of `BvC (N p)(N p) = 0`;
  `BvC` is already bilinear so no extra polarization machinery is needed). The signature is `(1,9)`:
  `BvC p q = p.1 q.1 − p.2.1 q.2.1 − gFormC p.2.2 q.2.2`, whose SPATIAL part
  `p.2.1 q.2.1 + gFormC p.2.2 q.2.2` is POSITIVE-DEFINITE (`gFormC_nonneg`, `mul_self_nonneg`,
  `gFormC_eq_zero_iff` — the trunk's Born positivity, N56). Hence the time-coordinate functional
  `τ : w ↦ w.1` is INJECTIVE on the totally-isotropic image: an isotropic `w` with `w.1 = 0` is `0`
  (`bvC_totally_isotropic_first_zero`). The Witt index of `(1,9)` is `1` — DERIVED from Born
  positivity, with NO finrank/Witt computation.

  The rigidity then closes WITHOUT the dimension-restriction recursion: pick a moved `w := N p₀ ≠ 0`,
  so `w.1 ≠ 0`; for every `q` the vector `w.1 • N q − (N q).1 • w = N(w.1 • q − (N q).1 • p₀)` is in
  the isotropic image with zero first coordinate, hence `0` — so `im N` is RANK-1 (`w.1 • N q =
  (N q).1 • w`). The isometry equation makes `N` `BvC`-SKEW-ADJOINT (`BvC (N p) q + BvC p (N q) = 0`);
  combining with rank-1 gives `(N q).1 · BvC w q = 0` for all `q`. With `(N p₀).1 = w.1 ≠ 0`, `w ≠ 0`,
  and `BvC` NON-DEGENERATE (`bvC_right_nondeg`, from `gFormC` non-degenerate), evaluating at `p₀`,
  `r₀` (a `BvC`-witness for `w`), and `p₀ + r₀` is a contradiction. Therefore `N = 0`, i.e. `S = id`.

  ── WHAT THIS NODE BANKS ──
  `bvC_totally_isotropic_first_zero` — the POSITIVITY CORE: an isotropic vector with zero first
    coordinate is `0` (the (1,9) spatial part is positive-definite; Witt index 1).
  `bvC_right_nondeg` — `BvC` is non-degenerate (right slot): `(∀ r, BvC w r = 0) → w = 0`.
  `BvC_smul_left` — `Cut`-homogeneity in the LEFT slot (symmetry + `BvC_smul_right`).
  ★★ `isom_totally_isotropic_eq_id` — THE TOTALLY-ISOTROPIC RIGIDITY: a `BvC`-isometry whose every
    moved difference is isotropic IS the identity. The Witt-index-1 fact dissolved through Born
    positivity, NO finrank computation, NO dimension-restriction recursion.
  ★★ `haniso_exists_thm` — `haniso_exists` DISCHARGED (the contrapositive): every non-identity
    `BvC`-isometry has a moved vector with ANISOTROPIC difference.
  ★★ `lorentz_exhaustion_M` — THE FULL UNCONDITIONAL `SO⁺(1,9)` EXHAUSTION: every `BvC`-isometry of
    the spacetime `STVC` is a finite product of indefinite Householder reflections
    (`Submonoid.closure houseHolderMSet`). The complete indefinite Cartan–Dieudonné theorem,
    CLOSED — `reflection_exhaustion_M_aniso` (N127) fired UNCONDITIONALLY on the discharged oracle.
  W8 teeth: `lorentz_exhaustion_mTimeUnit_mem` (the timelike-axis reflection is a concrete member of
    the now-unconditional closure) + `lorentz_exhaustion_witness_self_overlap` (the double reflection
    of the timelike axis reads `BvC = 1`, NOT `128` — the costume bite).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the isometry predicate `IsBvIsomLin` and the indefinite form `BvC` (N125,
  polarized from the cascade's own Born quadratic); the positivity `gFormC_nonneg` /
  `gFormC_eq_zero_iff` (N56, Born = self-overlap = positivity); the reduction
  `reflection_exhaustion_M_aniso` (N127). `LinearMap.id`, `Submonoid.closure`, `Prod.ext`,
  `mul_self_nonneg`, `linarith`/`nlinarith` are standard Mathlib MACHINERY on the DERIVED objects
  (STANDARD §3), over the derived ℝ `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  The Witt-index-1 obstruction the literature handles by a dimension-restriction recursion DISSOLVES
  here directly: the (1,9) spatial part is positive-definite by the ORDER structure of the derived
  continuum, so the totally-isotropic case is VACUOUS — no group-manifold descent, no operator
  topology needed to close the exhaustion. NOT a posited Lorentz group / `SO⁺(1,9)`, NOT a posited
  indefinite-Cartan–Dieudonné structure theorem, NOT a posited Witt decomposition, NOT Mathlib ℝ/ℂ
  as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full Lorentz group
  `SO⁺(1,9)` and reads off the indefinite Cartan–Dieudonné structure theorem, dispatching the
  totally-isotropic / null case by a posited dimension-restriction recursion on the orthogonal
  complement of a fixed anisotropic vector. Here the totally-isotropic case is shown VACUOUS by the
  trunk's own Born positivity — the (1,9) signature splits into one timelike coordinate plus a
  positive-definite spatial part (the cascade-DERIVED `gFormC` on `O Cut` plus one spatial `Cut`),
  forcing the Witt index to `1` WITHOUT any Witt-decomposition theorem, so EVERY non-identity
  isometry necessarily has an anisotropic moved difference and the N127 reduction fires
  unconditionally. The full `SO⁺(1,9)` surjectivity is CONSTRUCTED forward, not asserted.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / boost / rotation / reflection / Householder / Minkowski / metric / signature /
  timelike / spacelike / null / isotropic / anisotropic / Witt / Cartan / Dieudonné / exhaustion /
  surjectivity / SO⁺(1,9) / Spin": what remains is pure linear algebra over the derived complete
  ordered field `Cut` — for the bilinear form `BvC` on `STVC = Cut × Cut × O Cut`, a `Cut`-linear
  `BvC`-preserving `S` with `BvC (S p − p)(S p − p) = 0` for every `p` equals `LinearMap.id`
  (the form's spatial part `x·x' + gFormC(v,v')` is positive-definite, so a self-`BvC`-null vector
  with zero first coordinate is `0`); hence every `BvC`-preserving `S` lies in
  `Submonoid.closure houseHolderMSet`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationIndefiniteExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The Born-positivity core: the `(1,9)` Witt index is `1`. -/

/-- ★ THE POSITIVITY CORE (the `(1,9)` Witt-index-`1` fact, DERIVED): a vector with zero `BvC`
    self-overlap and zero first coordinate is `0`. The spatial part `x² + gFormC(v,v)` of the
    indefinite Minkowski form is positive-definite (`mul_self_nonneg` + the trunk's Born positivity
    `gFormC_nonneg` / `gFormC_eq_zero_iff`, N56), so a self-`BvC`-null vector whose timelike
    coordinate vanishes has vanishing spatial part too, hence is `0`. The light cone of `(1,9)`
    carries no nonzero vector with zero time component — Witt index `1`, with NO finrank/Witt
    computation. -/
theorem bvC_totally_isotropic_first_zero (u : STVC) (huu : BvC u u = 0) (hu1 : u.1 = 0) :
    u = 0 := by
  have hexp : u.1 * u.1 - u.2.1 * u.2.1 - gFormC u.2.2 u.2.2 = 0 := huu
  have hsum : u.2.1 * u.2.1 + gFormC u.2.2 u.2.2 = 0 := by
    rw [hu1] at hexp; nlinarith [hexp]
  have hnn1 : 0 ≤ u.2.1 * u.2.1 := mul_self_nonneg _
  have hnn2 : 0 ≤ gFormC u.2.2 u.2.2 := gFormC_nonneg _
  have hx : u.2.1 * u.2.1 = 0 := by linarith
  have hg : gFormC u.2.2 u.2.2 = 0 := by linarith
  have hx0 : u.2.1 = 0 := by rcases mul_eq_zero.mp hx with h | h <;> exact h
  have hv0 : u.2.2 = 0 := (gFormC_eq_zero_iff u.2.2).mp hg
  exact Prod.ext hu1 (Prod.ext hx0 hv0)

/-- THE INDEFINITE MINKOWSKI FORM IS NON-DEGENERATE (right slot): if `BvC w r = 0` for every `r`,
    then `w = 0`. Tested against the three coordinate axes; the spatial pairing uses `gFormC`
    non-degeneracy (`gFormC_eq_zero_iff`, N56). -/
theorem bvC_right_nondeg (w : STVC) (h : ∀ r, BvC w r = 0) : w = 0 := by
  have h1 : w.1 = 0 := by
    have hax := h (1, 0, 0)
    have e : BvC w ((1, 0, 0) : STVC) = w.1 := by
      show w.1 * 1 - w.2.1 * 0 - gFormC w.2.2 0 = w.1
      rw [gFormC_symm, gFormC_zero_left]; ring
    rw [e] at hax; exact hax
  have h2 : w.2.1 = 0 := by
    have hax := h (0, 1, 0)
    have e : BvC w ((0, 1, 0) : STVC) = -w.2.1 := by
      show w.1 * 0 - w.2.1 * 1 - gFormC w.2.2 0 = -w.2.1
      rw [gFormC_symm, gFormC_zero_left]; ring
    rw [e] at hax; linarith
  have h3 : w.2.2 = 0 := by
    apply (gFormC_eq_zero_iff w.2.2).mp
    have hax := h (0, 0, w.2.2)
    have e : BvC w ((0, 0, w.2.2) : STVC) = -gFormC w.2.2 w.2.2 := by
      show w.1 * 0 - w.2.1 * 0 - gFormC w.2.2 w.2.2 = -gFormC w.2.2 w.2.2
      ring
    rw [e] at hax; linarith
  exact Prod.ext h1 (Prod.ext h2 h3)

/-- `BvC` is `Cut`-homogeneous in the LEFT slot (symmetry from `BvC_smul_right`). -/
theorem BvC_smul_left (c : Cut) (x y : STVC) : BvC (c • x) y = c * BvC x y := by
  rw [BvC_symm, BvC_smul_right, BvC_symm]

/-! ## THE TOTALLY-ISOTROPIC RIGIDITY (the totally-isotropic existence question, answered). -/

/-- ★★ THE TOTALLY-ISOTROPIC RIGIDITY: a `BvC`-isometry whose every moved difference is isotropic
    (`BvC (S p − p)(S p − p) = 0` for all `p`) IS the identity. The negation of `haniso_exists`
    cannot occur. Proof, entirely through the trunk's Born positivity, with NO finrank computation
    and NO dimension-restriction recursion:
    • polarize the isotropy of `N := S − id`'s image to total isotropy `BvC (N a)(N b) = 0`;
    • `N` is `BvC`-skew-adjoint from the isometry equation;
    • a moved `w := N p₀ ≠ 0` has `w.1 ≠ 0` (`bvC_totally_isotropic_first_zero`);
    • `im N` is RANK-1: `w.1 • N q = (N q).1 • w` (the difference is isotropic with zero first
      coordinate, hence `0`);
    • skew-adjointness + rank-1 give `(N q).1 · BvC w q = 0` for all `q`; with `(N p₀).1 = w.1 ≠ 0`,
      `w ≠ 0`, and `BvC` non-degenerate (`bvC_right_nondeg`), evaluating at `p₀`, a `BvC`-witness
      `r₀` for `w`, and `p₀ + r₀` is a contradiction.
    Therefore `N = 0`, i.e. `S = id`. -/
theorem isom_totally_isotropic_eq_id (S : Module.End Cut STVC) (hS : IsBvIsomLin S)
    (hbad : ∀ p : STVC, BvC (S p - p) (S p - p) = 0) : S = LinearMap.id := by
  by_contra hne
  set Nmap : Module.End Cut STVC := S - LinearMap.id with hN
  have hNmap : ∀ p, Nmap p = S p - p := by
    intro p; rw [hN, LinearMap.sub_apply, LinearMap.id_apply]
  have hbad' : ∀ p, BvC (Nmap p) (Nmap p) = 0 := by
    intro p; rw [hNmap]; exact hbad p
  -- the image of `N` is totally isotropic (polarization of the self-isotropy)
  have hiso : ∀ a b, BvC (Nmap a) (Nmap b) = 0 := by
    intro a b
    have hab := hbad' (a + b)
    have ha := hbad' a
    have hb := hbad' b
    rw [map_add, BvC_add_left, BvC_add_right, BvC_add_right] at hab
    rw [ha, hb, BvC_symm (Nmap b) (Nmap a)] at hab
    linarith
  -- `S p = N p + p`
  have hsp : ∀ p, S p = Nmap p + p := by intro p; rw [hNmap]; abel
  -- `N` is `BvC`-skew-adjoint
  have hskew : ∀ p q, BvC (Nmap p) q + BvC p (Nmap q) = 0 := by
    intro p q
    have key := hS p q
    rw [hsp p, hsp q, BvC_add_left, BvC_add_right, BvC_add_right, hiso p q] at key
    linarith
  -- `N ≠ 0`: pick a moved vector
  have hNne : ∃ p₀, Nmap p₀ ≠ 0 := by
    by_contra h; push Not at h
    apply hne
    have hN0 : Nmap = 0 := LinearMap.ext (by intro p; rw [h p]; rfl)
    have hsi : S - LinearMap.id = 0 := by rw [← hN]; exact hN0
    rwa [sub_eq_zero] at hsi
  obtain ⟨p₀, hp₀⟩ := hNne
  set w := Nmap p₀ with hw
  have hww0 : BvC w w = 0 := hbad' p₀
  have hwt : w.1 ≠ 0 := fun h0 => hp₀ (bvC_totally_isotropic_first_zero w hww0 h0)
  -- `im N` is rank-1: `w.1 • N q = (N q).1 • w`
  have hstar : ∀ q, w.1 • Nmap q = (Nmap q).1 • w := by
    intro q
    have huq : w.1 • Nmap q - (Nmap q).1 • w = 0 := by
      apply bvC_totally_isotropic_first_zero
      · have hr : w.1 • Nmap q - (Nmap q).1 • w
            = Nmap (w.1 • q - (Nmap q).1 • p₀) := by
          rw [map_sub, map_smul, map_smul]
        rw [hr]; exact hiso _ _
      · show (w.1 • Nmap q - (Nmap q).1 • w).1 = 0
        rw [Prod.fst_sub, Prod.smul_fst, Prod.smul_fst, smul_eq_mul, smul_eq_mul]
        ring
    rwa [sub_eq_zero] at huq
  -- `(N q).1 · BvC w q = 0` for all `q`
  have hkey : ∀ q, (Nmap q).1 * BvC w q = 0 := by
    intro q
    have hs := hskew q q
    have e1 : w.1 * BvC (Nmap q) q = (Nmap q).1 * BvC w q := by
      rw [← BvC_smul_left, hstar q, BvC_smul_left]
    have e2 : w.1 * BvC q (Nmap q) = (Nmap q).1 * BvC w q := by
      rw [← BvC_smul_right, hstar q, BvC_smul_right, BvC_symm q w]
    have hmul : w.1 * (BvC (Nmap q) q + BvC q (Nmap q)) = 0 := by rw [hs, mul_zero]
    rw [mul_add, e1, e2] at hmul
    linarith
  -- finish: contradiction from non-degeneracy
  have hφp₀ : (Nmap p₀).1 ≠ 0 := by rw [← hw]; exact hwt
  have hBp₀ : BvC w p₀ = 0 := by
    rcases mul_eq_zero.mp (hkey p₀) with h | h
    · exact absurd h hφp₀
    · exact h
  obtain ⟨r₀, hr₀⟩ : ∃ r, BvC w r ≠ 0 := by
    by_contra h; push Not at h
    exact hp₀ (bvC_right_nondeg w h)
  have hφr₀ : (Nmap r₀).1 = 0 := by
    rcases mul_eq_zero.mp (hkey r₀) with h | h
    · exact h
    · exact absurd h hr₀
  have hsum := hkey (p₀ + r₀)
  have hN1 : (Nmap (p₀ + r₀)).1 = (Nmap p₀).1 := by
    rw [map_add, Prod.fst_add, hφr₀, add_zero]
  have hB : BvC w (p₀ + r₀) = BvC w r₀ := by rw [BvC_add_right, hBp₀, zero_add]
  rw [hN1, hB] at hsum
  exact (mul_ne_zero hφp₀ hr₀) hsum

/-- ★★ `haniso_exists` DISCHARGED: every non-identity `BvC`-isometry has SOME moved vector with
    ANISOTROPIC difference `BvC (T v − v)(T v − v) ≠ 0`. The contrapositive of the totally-isotropic
    rigidity — the single hypothesis N127's `reflection_exhaustion_M_aniso` was waiting on, now a
    proved theorem. -/
theorem haniso_exists_thm (T : Module.End Cut STVC) (hT : IsBvIsomLin T)
    (hid : T ≠ LinearMap.id) :
    ∃ v : STVC, T v ≠ v ∧ BvC (T v - v) (T v - v) ≠ 0 := by
  by_contra h; push Not at h
  apply hid
  apply isom_totally_isotropic_eq_id T hT
  intro p
  by_cases hp : T p = p
  · rw [hp, sub_self]
    show (0 : Cut) * 0 - 0 * 0 - gFormC 0 0 = 0
    rw [gFormC_zero_left]; ring
  · exact h p hp

/-! ## THE FULL UNCONDITIONAL `SO⁺(1,9)` EXHAUSTION. -/

/-- ★★ THE FULL UNCONDITIONAL `SO⁺(1,9)` INDEFINITE CARTAN–DIEUDONNÉ EXHAUSTION: EVERY `BvC`-isometry
    of the spacetime `STVC` is a finite product of indefinite Householder reflections
    (`Submonoid.closure houseHolderMSet`). N127's concrete reduction
    `reflection_exhaustion_M_aniso` fires UNCONDITIONALLY now that `haniso_exists` is discharged
    (`haniso_exists_thm`): the totally-isotropic edge case the literature dispatches by a posited
    dimension-restriction recursion is VACUOUS over the derived `Cut` (Witt index `1` from Born
    positivity), so no further descent is needed. The complete indefinite Cartan–Dieudonné theorem,
    CONSTRUCTED forward from the trunk — not asserted. DERIVED from the banked N49–N127 + the derived
    ℝ `Cut` + the terminal algebra `O Cut` + the indefinite Minkowski form `BvC`. -/
theorem lorentz_exhaustion_M (S : Module.End Cut STVC) (hS : IsBvIsomLin S) :
    S ∈ Submonoid.closure houseHolderMSet :=
  reflection_exhaustion_M_aniso haniso_exists_thm S hS

/-! ## W8 teeth — the closure is now UNCONDITIONALLY non-vacuous + the double-reflection read-off. -/

/-- ★ W8 — THE UNCONDITIONAL CLOSURE IS CONCRETELY NON-VACUOUS: the indefinite Householder reflection
    at the timelike unit axis `mTimeUnit = (1,0,0)` is `lorentz_exhaustion_M`-covered as a genuine
    member of `Submonoid.closure houseHolderMSet` (it is itself a `BvC`-isometry, `houseHolderM_isom`
    at `BvC_mTimeUnit_self = 1 ≠ 0`), realizing the now-unconditional exhaustion on a concrete derived
    vector. -/
theorem lorentz_exhaustion_mTimeUnit_mem :
    houseHolderM (mTimeUnit : STVC) ∈ Submonoid.closure houseHolderMSet :=
  lorentz_exhaustion_M (houseHolderM (mTimeUnit : STVC))
    (houseHolderM_isom (by rw [BvC_mTimeUnit_self]; exact one_ne_zero))

/-- ★ W8 TEETH — the Minkowski self-overlap of the DOUBLE indefinite reflection of the timelike axis
    reads `1` (`= BvC mTimeUnit mTimeUnit`), NOT `128`. The reflection at the timelike axis is an
    involution (`houseHolderM_neg_self`, `BvC = 1 ≠ 0`), so the double reflection returns `mTimeUnit`,
    whose Minkowski self-overlap is `1`. The distinguishing read-off the costume C160 bites. -/
theorem lorentz_exhaustion_witness_self_overlap :
    BvC (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
        (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
      = 1 := by
  have hb : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0 := by
    rw [BvC_mTimeUnit_self]; exact one_ne_zero
  rw [houseHolderM_neg_self hb, map_neg, houseHolderM_neg_self hb, neg_neg, BvC_mTimeUnit_self]

end

end Phys.Algebra
