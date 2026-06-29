/-
  N161 — THE GENERAL BIREFLECTION = octPlaneRot WORD: the full octonion-block SO(8) identity
  component reached by bireflection words, lifted into the NON-VACUOUS `JoinedIdQvC`, removing
  N160's orthonormality restriction.

  N160 (`LorentzContinuumOctBlockSO8Exhaustion`) banked the single ORTHONORMAL bireflection =
  half-turn identity (`houseHolder a · houseHolder b = octPlaneRot a b (−1) 0` for orthonormal
  `a,b`), lifted into `JoinedIdQvC`. The ONE restriction blocking the closure-induction over
  N124's reflection word (`gFormC_isom_mem_closure`: every `gFormC`-isometry of `O Cut` is a
  finite product of Householder reflections) was the ORTHONORMALITY of the pair. THIS node removes
  it: the GENERAL bireflection of ANY two nonzero-Born-norm vectors lifts into `JoinedIdQvC`, and
  hence so does any finite product of bireflections — the full octonion-block `SO(8)` identity
  component reached by even reflection words, into the NON-VACUOUS path-component predicate.

  ── THE MEASURE-FIRST FINDING (Gram–Schmidt + the trunk Born positivity, NO Cauchy–Schwarz) ──
  Normalize `a,b` to unit vectors (`houseHolder` is SCALE-INVARIANT, `houseHolder_smul`:
  `houseHolder (t•a) = houseHolder a` for `t ≠ 0`). For unit `a,b` set `k := gFormC a b` and
  Gram–Schmidt `f₀ := b − k•a` (so `gFormC a f₀ = 0`, `gFormC f₀ f₀ = 1 − k²`). The Born
  positivity `gFormC_nonneg` gives `1 − k² ≥ 0` for FREE — no Cauchy–Schwarz needed (the trunk:
  Born = self-overlap = positivity). Two cases:
  • `1 − k² = 0` ⇒ `f₀ = 0` (`gFormC_eq_zero_iff`) ⇒ `b = k•a`, `k² = 1` ⇒
    `houseHolder b = houseHolder a` ⇒ the bireflection is `houseHolder a · houseHolder a = 1`
    (`houseHolder_involutive`) ⇒ `JoinedIdQvC` (`joinedIdQvC_one`).
  • `1 − k² > 0` ⇒ `μ := cutSqrt (1−k²) > 0`, `f := μ⁻¹•f₀` unit and Born-orthogonal to `a`,
    `b = k•a + μ•f`, and ★ `houseHolder a · houseHolder (k•a + μ•f) = octPlaneRot a f (2k²−1)
    (−2kμ)` (`bireflection_eq_octPlaneRot_gen`, the general two-axis identity). The circle point
    `(2k²−1, −2kμ)` satisfies `(2k²−1)² + (−2kμ)² = 1` (since `k² + μ² = 1`), so the lift is
    `JoinedIdQvC` by `joinedIdQvC_octBlockEndC_octPlaneRot_circle` (which handles BOTH the
    off-antipode generators directly (N159) AND the antipode half-turn `1 + c = 0` via the
    quarter-turn-squared, N160).

  ── WHAT THIS NODE BANKS ──
  `houseHolder_smul` — the Householder reflection is scale-invariant (`houseHolder (t•a) =
    houseHolder a`, `t ≠ 0`).
  `normalize_unit` — every nonzero-Born-norm `a` admits a unit `u` with `houseHolder u =
    houseHolder a` (rescale by `(cutSqrt (gFormC a a))⁻¹`).
  ★ `bireflection_eq_octPlaneRot_gen` — THE GENERAL TWO-AXIS IDENTITY: for orthonormal `e,f` and a
    circle point `k² + μ² = 1`, `houseHolder e · houseHolder (k•e + μ•f) = octPlaneRot e f
    (2k²−1) (−2kμ)`. Generalizes N160's orthonormal-pair identity to ANY in-plane second axis.
  `joinedIdQvC_octBlockEndC_octPlaneRot_circle` — the lifted plane rotation is `JoinedIdQvC` for
    ANY circle point (off-antipode via N159; antipode half-turn via N160's quarter-turn-squared).
  ★★ `joinedIdQvC_octBlockEndC_bireflection` — THE CORE: the lifted GENERAL bireflection
    `octBlockEndC (houseHolder a · houseHolder b)` of ANY two nonzero-Born-norm vectors is
    `JoinedIdQvC` (non-vacuously). N160's orthonormality restriction REMOVED.
  ★★ `joinedIdQvC_octBlockEndC_bireflectionWord` — THE WORD: any finite product of GENERAL
    bireflections lifts to `JoinedIdQvC`. The full octonion-block `SO(8)` identity component
    reached by even reflection words, into the NON-VACUOUS target.
  W8: `bireflection_e2je2plus_moves` (the NON-orthonormal pair `e₂, e₂+je2` bireflection sends
    `e₂+je2 ↦ e₂−je2`, genuinely exercising the general — not orthonormal — path) +
    `bireflection_e2je2plus_moves_read` (reads `−1` on the moved `je2` slot) +
    `joinedIdQvC_octBlockEndC_bireflection_e2je2plus` (it is `JoinedIdQvC`).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the Householder reflection `houseHolder` / `houseHolder_apply` /
  `houseHolder_involutive` / `houseHolder_neg_self` / `gFormC_houseterm` on the positive-definite
  Born form `gFormC` (N124); the octonion-block generator `octPlaneRot` / `octPlaneRot_apply` and
  its lift `octBlockEndC` to the NON-VACUOUS `JoinedIdQvC`
  (`joinedIdQvC_octBlockEndC_octPlaneRot`, N159); the even-pair core `octBlockEndC_mul` /
  `octBlockEndC_one` / `octPlaneRot_quarter_sq` (N160); the engine `joinedIdQvC_mul` /
  `joinedIdQvC_one` (N157); the Born positivity `gFormC_nonneg` / `gFormC_eq_zero_iff` (N56) and
  the scalar square root `cutSqrt` / `cutSqrt_sq` / `cutSqrt_pos` (N57); `gFormC` bilinearity and
  `LinearMap.ext` / `Module.End.mul_apply` / `match_scalars` / `module` MACHINERY on the DERIVED
  objects (STANDARD §3) — over the derived ℝ `ContinuumQ.Cut` and the terminal algebra `O Cut`.
  NOT a posited rotation group, NOT a posited reflection group, NOT a posited connectedness, NOT a
  posited topology, NOT a posited Lorentz / Pin / Spin / gauge / G₂ / SO(8) group, NOT Mathlib ℝ/ℂ
  as content, NOT a regression to the vacuous `JoinedIdC`, NOT a fully proved implication asserted
  without a proof, NOT a bridge.

  ── THE FORWARD REMAINDER (childed N162) ──
  THE DET-PARITY CLOSURE BRIDGE: N124's `gFormC_isom_mem_closure` gives membership in
  `Submonoid.closure houseHolderSet` — a FLAT reflection word of unknown length parity. To
  conclude that every det +1 (`SO(8)`) isometry equals an EVEN product (a bireflection word, hence
  `JoinedIdQvC` by THIS node), one needs a `det : O(8) → {±1}` Z/2 homomorphism (each `houseHolder`
  ↦ −1, the `SO` part ↦ +1) to track word-length parity over the closure induction — the genuine
  heavy combinatorial / determinant invariant Mathlib lacks over the derived `Cut`. THIS node banks
  the trunk-native core (the general bireflection lift + the bireflection word); the det-parity
  bridge is childed.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "rotation / reflection / Householder / bireflection / half-turn / isometry / SO(8) /
  Cartan / Dieudonné / Gram–Schmidt / path-connected / Lorentz / det / determinant / parity /
  even-pair": over the derived complete ordered field `Cut` the lemmas say — `houseHolder` is
  scale-invariant; for nonzero-norm `a,b` the composite `houseHolder a · houseHolder b` equals an
  explicit `octPlaneRot` after rescaling and a Gram–Schmidt substitution; and the embedding
  `octBlockEndC` of any finite product of such composites lies in a preconnected set of
  `gFormC`-form-preserving operators containing `1`. Pure linear algebra over the derived field;
  no theorem statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumOctBlockSO8Exhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The Householder reflection is scale-invariant, and normalization to unit norm. -/

/-- The Householder reflection is SCALE-INVARIANT: `houseHolder (t•a) = houseHolder a` for `t ≠ 0`.
    The `t` cancels between the bundled functional `gFormC (t•a) v = t·gFormC a v`, the inverse
    norm `(gFormC (t•a) (t•a))⁻¹ = (t·t)⁻¹·(gFormC a a)⁻¹`, and the axis `(t•a)`. The reflection
    depends only on the LINE through `a`, not its length. -/
theorem houseHolder_smul (a : O Cut) (t : Cut) (ht : t ≠ 0) :
    houseHolder (t • a) = houseHolder a := by
  apply LinearMap.ext; intro v
  rw [houseHolder_apply, houseHolder_apply, gFormC_smul_left, gFormC_smul_right,
      gFormC_smul_left, mul_inv, smul_smul]
  congr 1; field_simp

/-- Every nonzero-Born-norm `a` admits a UNIT vector `u` (Born self-overlap `1`) with the SAME
    Householder reflection (`houseHolder u = houseHolder a`): rescale by `(cutSqrt (gFormC a a))⁻¹`,
    legal since the Born self-overlap is strictly positive off `0` (`gFormC_nonneg` + `ha`) and the
    scalar square root over the derived ℝ `Cut` is positive (`cutSqrt_pos`, `cutSqrt_sq`, N57). -/
theorem normalize_unit (a : O Cut) (ha : gFormC a a ≠ 0) :
    ∃ u : O Cut, gFormC u u = 1 ∧ houseHolder u = houseHolder a := by
  have hpos : 0 < gFormC a a := lt_of_le_of_ne (gFormC_nonneg a) (Ne.symm ha)
  set n : Cut := cutSqrt (gFormC a a) with hn
  have hnpos : 0 < n := cutSqrt_pos hpos
  have hnne : n ≠ 0 := ne_of_gt hnpos
  have hnn : n * n = gFormC a a := cutSqrt_sq (le_of_lt hpos)
  refine ⟨n⁻¹ • a, ?_, houseHolder_smul a n⁻¹ (inv_ne_zero hnne)⟩
  rw [gFormC_smul_left, gFormC_smul_right]
  field_simp
  nlinarith [hnn]

/-! ## THE GENERAL TWO-AXIS IDENTITY — the bireflection of an in-plane pair is an `octPlaneRot`. -/

/-- ★ THE GENERAL TWO-AXIS IDENTITY. For ORTHONORMAL `e,f` (`gFormC e e = gFormC f f = 1`,
    `gFormC e f = 0`) and a circle point `k² + μ² = 1`, the bireflection of `e` and the in-plane
    unit vector `k•e + μ•f` equals the plane rotation by `(2k²−1, −2kμ)`:
    `houseHolder e · houseHolder (k•e + μ•f) = octPlaneRot e f (2k²−1) (−2kμ)`. Generalizes N160's
    orthonormal-pair half-turn (`k = 0`: `(2·0−1, 0) = (−1, 0)`) to ANY second axis in the plane.
    The reflection across `e` then across the line at angle `θ` (`cos θ = k`) is the rotation by
    `2θ` — DERIVED by reducing both Householder inner products to `gFormC e v`, `gFormC f v`
    (orthonormality collapse) and matching scalars, the residual `2·gFormC f v·(k²+μ²−1)` killed by
    the circle relation. -/
theorem bireflection_eq_octPlaneRot_gen (e f : O Cut) (k μ : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hkm : k ^ 2 + μ ^ 2 = 1) :
    houseHolder e * houseHolder (k • e + μ • f)
      = octPlaneRot e f (2 * k ^ 2 - 1) (-(2 * k * μ)) := by
  have hfe : gFormC f e = 0 := by rw [gFormC_symm]; exact hef
  have hbb : gFormC (k • e + μ • f) (k • e + μ • f) = 1 := by
    simp only [gFormC_add_left, gFormC_add_right, gFormC_smul_left, gFormC_smul_right,
      hee, hff, hef, hfe]
    nlinarith [hkm]
  apply LinearMap.ext; intro v
  rw [Module.End.mul_apply, houseHolder_apply e (houseHolder (k • e + μ • f) v),
      houseHolder_apply (k • e + μ • f) v, octPlaneRot_apply, hee, hbb]
  simp only [inv_one, mul_one]
  have hbv : gFormC (k • e + μ • f) v = k * gFormC e v + μ * gFormC f v := by
    rw [gFormC_add_left, gFormC_smul_left, gFormC_smul_left]
  have heb : gFormC e (k • e + μ • f) = k := by
    rw [gFormC_add_right, gFormC_smul_right, gFormC_smul_right, hee, hef]; ring
  have hinner : gFormC e (v - (2 * gFormC (k • e + μ • f) v) • (k • e + μ • f))
      = gFormC e v - 2 * gFormC (k • e + μ • f) v * k := by
    rw [gFormC_symm e, gFormC_sub_left, gFormC_smul_left, gFormC_symm (k • e + μ • f) e, heb,
        gFormC_symm v e]
  rw [hinner, hbv, gFormC_symm v e, gFormC_symm v f]
  match_scalars
  all_goals (try ring)
  all_goals linear_combination (-2 * gFormC f v) * hkm

/-! ## The lifted plane rotation is `JoinedIdQvC` for ANY circle point (antipode handled). -/

/-- The lifted octonion-block plane rotation `octBlockEndC (octPlaneRot e f c s)` is `JoinedIdQvC`
    for ORTHONORMAL `e,f` and ANY circle point `c² + s² = 1` — including the cayley ANTIPODE
    (`1 + c = 0`, the half-turn). OFF the antipode: direct from N159
    (`joinedIdQvC_octBlockEndC_octPlaneRot`). AT the antipode (`c = −1`, forcing `s = 0`): the
    half-turn is the quarter-turn squared (`octPlaneRot_quarter_sq`, N160), each quarter-turn
    `JoinedIdQvC` and the product `JoinedIdQvC` by the engine `joinedIdQvC_mul` (N157) through the
    multiplicative lift `octBlockEndC_mul` (N160). The unconditional circle-point lift. -/
theorem joinedIdQvC_octBlockEndC_octPlaneRot_circle (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) :
    JoinedIdQvC (octBlockEndC (octPlaneRot e f c s)) := by
  by_cases hc : 1 + c = 0
  · have hc' : c = -1 := by linarith
    have hs0 : s ^ 2 = 0 := by nlinarith [hcs]
    have hs : s = 0 := pow_eq_zero_iff (n := 2) (by norm_num) |>.mp hs0
    rw [hc', hs, ← octPlaneRot_quarter_sq e f hee hff hef, octBlockEndC_mul]
    have hq : JoinedIdQvC (octBlockEndC (octPlaneRot e f 0 1)) :=
      joinedIdQvC_octBlockEndC_octPlaneRot e f 0 1 hee hff hef (by ring) (by norm_num)
    exact joinedIdQvC_mul hq hq
  · exact joinedIdQvC_octBlockEndC_octPlaneRot e f c s hee hff hef hcs hc

/-! ## THE CORE — the lifted GENERAL bireflection is `JoinedIdQvC` (orthonormality removed). -/

/-- The lifted bireflection of two UNIT vectors `a,b` (Born self-overlap `1`) is `JoinedIdQvC`.
    Gram–Schmidt `f₀ := b − k•a` (`k := gFormC a b`); the Born positivity `gFormC_nonneg` gives
    `gFormC f₀ f₀ = 1 − k² ≥ 0` for free. If `f₀ = 0` the pair is collinear (`b = k•a`, `k² = 1`)
    and the bireflection is the involution `houseHolder a · houseHolder a = 1` (`JoinedIdQvC` via
    `joinedIdQvC_one`); else normalize `f := μ⁻¹•f₀` (`μ := cutSqrt (1−k²) > 0`) to get orthonormal
    `a,f` with `b = k•a + μ•f`, apply the general two-axis identity, and lift via the circle-point
    `JoinedIdQvC`. -/
theorem joinedIdQvC_octBlockEndC_unitBireflection (a b : O Cut)
    (haa : gFormC a a = 1) (hbb : gFormC b b = 1) :
    JoinedIdQvC (octBlockEndC (houseHolder a * houseHolder b)) := by
  set k : Cut := gFormC a b with hk
  have hba : gFormC b a = k := by rw [hk, gFormC_symm]
  set f0 : O Cut := b - k • a with hf0
  have haf0 : gFormC a f0 = 0 := by
    rw [hf0, sub_eq_add_neg, gFormC_add_right, octRefl_gFormC_neg_right, gFormC_smul_right, haa,
        ← hk]; ring
  have hf0f0 : gFormC f0 f0 = 1 - k ^ 2 := by
    rw [hf0, gFormC_houseterm b b a k k, hbb, hba, ← hk, haa]; ring
  rcases eq_or_lt_of_le (gFormC_nonneg f0) with hz | hpos
  · -- collinear: f0 = 0 ⇒ b = k•a, k² = 1 ⇒ bireflection = involution = 1
    have hf0z : f0 = 0 := (gFormC_eq_zero_iff f0).mp hz.symm
    have hbka : b = k • a := by rw [hf0] at hf0z; linear_combination (norm := module) hf0z
    have hk2 : k ^ 2 = 1 := by
      have hzz : gFormC f0 f0 = 1 - k ^ 2 := hf0f0
      rw [← hz] at hzz; linarith [hzz]
    have hkne : k ≠ 0 := by intro h; rw [h] at hk2; norm_num at hk2
    rw [hbka, houseHolder_smul a k hkne, houseHolder_involutive (by rw [haa]; norm_num),
        octBlockEndC_one]
    exact joinedIdQvC_one
  · -- generic: normalize f0, apply the general two-axis identity + circle-point lift
    have hpos' : (0:Cut) < 1 - k ^ 2 := by rw [← hf0f0]; exact hpos
    set μ : Cut := cutSqrt (1 - k ^ 2) with hμ
    have hμpos : 0 < μ := cutSqrt_pos hpos'
    have hμne : μ ≠ 0 := ne_of_gt hμpos
    have hμ2 : μ * μ = 1 - k ^ 2 := cutSqrt_sq (le_of_lt hpos')
    set f : O Cut := μ⁻¹ • f0 with hf
    have hffu : gFormC f f = 1 := by
      rw [hf, gFormC_smul_left, gFormC_smul_right, hf0f0]
      field_simp
      nlinarith [hμ2]
    have haf : gFormC a f = 0 := by rw [hf, gFormC_smul_right, haf0, mul_zero]
    have hbexp : b = k • a + μ • f := by
      rw [hf, smul_smul, mul_inv_cancel₀ hμne, one_smul, hf0]; module
    have hkm : k ^ 2 + μ ^ 2 = 1 := by nlinarith [hμ2]
    rw [hbexp, bireflection_eq_octPlaneRot_gen a f k μ haa hffu haf hkm]
    apply joinedIdQvC_octBlockEndC_octPlaneRot_circle a f _ _ haa hffu haf
    nlinarith [hkm]

/-- ★★ THE CORE — the lifted GENERAL bireflection `octBlockEndC (houseHolder a · houseHolder b)` of
    ANY two nonzero-Born-norm vectors `a,b` is `JoinedIdQvC` (non-vacuously). N160's ORTHONORMALITY
    restriction REMOVED: normalize each vector to unit norm (`normalize_unit`, the reflection is
    scale-invariant) and apply the unit-pair core. Every det +1 even reflection pair lifts into the
    NON-VACUOUS rotation path component, for ARBITRARY axes. -/
theorem joinedIdQvC_octBlockEndC_bireflection (a b : O Cut)
    (ha : gFormC a a ≠ 0) (hb : gFormC b b ≠ 0) :
    JoinedIdQvC (octBlockEndC (houseHolder a * houseHolder b)) := by
  obtain ⟨ua, huaa, hua⟩ := normalize_unit a ha
  obtain ⟨ub, hubb, hub⟩ := normalize_unit b hb
  rw [← hua, ← hub]
  exact joinedIdQvC_octBlockEndC_unitBireflection ua ub huaa hubb

/-! ## THE WORD — any finite product of general bireflections lifts to `JoinedIdQvC`. -/

/-- ★★ THE WORD — any finite product of GENERAL bireflections (each from a pair of nonzero-Born-norm
    vectors) lifts to `JoinedIdQvC`. List induction on the core
    `joinedIdQvC_octBlockEndC_bireflection` through the multiplicative lift `octBlockEndC_mul` and
    the engine `joinedIdQvC_mul` (N157). The full octonion-block `SO(8)` identity component reached
    by even reflection words, into the NON-VACUOUS target. The exact shape the det +1 part of
    N124's reflection word produces once paired two-at-a-time (the det-parity pairing childed
    N162). -/
theorem joinedIdQvC_octBlockEndC_bireflectionWord :
    ∀ (L : List (O Cut × O Cut)),
      (∀ t ∈ L, gFormC t.1 t.1 ≠ 0 ∧ gFormC t.2 t.2 ≠ 0) →
      JoinedIdQvC (octBlockEndC ((L.map (fun t => houseHolder t.1 * houseHolder t.2)).prod))
  | [], _ => by
      simp only [List.map_nil, List.prod_nil, octBlockEndC_one]; exact joinedIdQvC_one
  | t :: L, h => by
      simp only [List.map_cons, List.prod_cons, octBlockEndC_mul]
      obtain ⟨h1, h2⟩ := h t (List.mem_cons_self ..)
      refine joinedIdQvC_mul (joinedIdQvC_octBlockEndC_bireflection t.1 t.2 h1 h2) ?_
      exact joinedIdQvC_octBlockEndC_bireflectionWord L
        (fun s hs => h s (List.mem_cons_of_mem t hs))

/-! ## W8 NON-VACUITY — a NON-orthonormal bireflection moves an axis and is `JoinedIdQvC`. -/

/-- The Born self-overlap of the NON-orthonormal pair member `e₂ + je2` reads `2` (not the
    orthonormal `1`): `gFormC (e₂+je2) (e₂+je2) = 2`. Confirms the pair `e₂, e₂+je2` is genuinely
    NON-orthonormal (`gFormC e₂ (e₂+je2) = 1 ≠ 0`), exercising the general — not the N160
    orthonormal — path. -/
theorem e2_plus_je2_gFormC_self :
    gFormC ((CD.e2 : O Cut) + (je2 : O Cut)) ((CD.e2 : O Cut) + (je2 : O Cut)) = 2 := by
  have h1 : gFormC (je2 : O Cut) (CD.e2 : O Cut) = 0 := by
    rw [gFormC_symm]; exact octDeflate_e2_je2_gFormC_zero
  simp only [gFormC_add_left, gFormC_add_right, je2_gFormC_self, e2_gFormC_self,
    octDeflate_e2_je2_gFormC_zero, h1]
  ring

/-- The NON-orthonormal bireflection `houseHolder e₂ · houseHolder (e₂+je2)` sends `e₂+je2 ↦
    e₂−je2`: the second reflection negates its own axis (`houseHolder_neg_self`), then the first
    reflection across `e₂` sends `−(e₂+je2) ↦ e₂−je2`. A genuine det +1 isometry that MOVES the
    vector via the GENERAL (non-orthonormal) construction — not the identity. -/
theorem bireflection_e2je2plus_moves :
    (houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut)))
      ((CD.e2 : O Cut) + (je2 : O Cut)) = (CD.e2 : O Cut) - (je2 : O Cut) := by
  have hbne : gFormC ((CD.e2 : O Cut) + (je2 : O Cut)) ((CD.e2 : O Cut) + (je2 : O Cut)) ≠ 0 := by
    rw [e2_plus_je2_gFormC_self]; norm_num
  rw [Module.End.mul_apply, houseHolder_neg_self hbne]
  rw [show -((CD.e2 : O Cut) + (je2 : O Cut)) = (-1:Cut) • ((CD.e2 : O Cut) + (je2 : O Cut)) by
        module]
  rw [map_smul, houseHolder_apply, e2_gFormC_self]
  rw [gFormC_add_right, e2_gFormC_self, octDeflate_e2_je2_gFormC_zero]
  rw [show (2 * (1:Cut)⁻¹ * (1 + 0)) = 2 by norm_num]
  module

/-- ★ W8 TEETH — the lifted NON-orthonormal bireflection reads `−1` on the moved `je2` slot:
    `gFormC ((octBlockEndC (houseHolder e₂ · houseHolder (e₂+je2)) (0,0,e₂+je2)).2.2) je2 = −1`
    (`bireflection_e2je2plus_moves` sends `e₂+je2 ↦ e₂−je2`, and `gFormC (e₂−je2) je2 =
    −gFormC je2 je2 = −1`). A non-trivial det +1 isometry built from a NON-orthonormal pair. -/
theorem bireflection_e2je2plus_moves_read :
    gFormC ((octBlockEndC (houseHolder (CD.e2 : O Cut)
        * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut)))
      ((0:Cut), (0:Cut), (CD.e2 : O Cut) + (je2 : O Cut))).2.2) (je2 : O Cut) = -1 := by
  rw [octBlockEndC_apply]
  show gFormC ((houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut)))
        ((CD.e2 : O Cut) + (je2 : O Cut))) (je2 : O Cut) = -1
  rw [bireflection_e2je2plus_moves, gFormC_sub_left, octDeflate_e2_je2_gFormC_zero,
      je2_gFormC_self]
  ring

/-- ★ W8 — the concrete lifted NON-orthonormal bireflection `octBlockEndC (houseHolder e₂ ·
    houseHolder (e₂+je2))` is `JoinedIdQvC` (the general core applied to the genuinely
    non-orthonormal pair `e₂, e₂+je2`). A genuine element of the NON-VACUOUS group-constrained path
    component built WITHOUT orthonormality (`bireflection_e2je2plus_moves_read` shows it moves the
    axis), not the identity. -/
theorem joinedIdQvC_octBlockEndC_bireflection_e2je2plus :
    JoinedIdQvC (octBlockEndC (houseHolder (CD.e2 : O Cut)
      * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut)))) :=
  joinedIdQvC_octBlockEndC_bireflection (CD.e2 : O Cut) ((CD.e2 : O Cut) + (je2 : O Cut))
    (by rw [e2_gFormC_self]; norm_num) (by rw [e2_plus_je2_gFormC_self]; norm_num)

end
end Phys.Algebra
