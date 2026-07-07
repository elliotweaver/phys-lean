/-
  Phys.Algebra.PoincareMassEnergy — N420 (arc-O O5): POINCARÉ + E = mc² AS A THEOREM.
  The full symmetry of the derived (1,3) arena (N419) and the invariant-norm identity: rest
  mass = the Minkowski norm of the energy-momentum vector = the Born self-overlap weight at rest.
  ===========================================================================
  THE COMPLETION-SWEEP TARGET (docs/SEED_COMPLETION_SWEEP.md §O5). N419 DERIVED the physical
  spacetime arena: the reduced (1,3) form `Q4v` on `STV4 = ℚ × ℚ × Dbl ℚ`, form-isometrically
  contained in the banked octonionic Minkowski (1,9) (`Qv` on `STV`, N43). This module derives
  the FULL SYMMETRY that arena forces and the CONSERVED INVARIANT that symmetry protects — none
  posited, all forced forward from the banked objects:

    • THE LORENTZ STRUCTURE of the reduced form — the `Q4v`-preserving ℚ-linear maps (`IsQ4Isom`,
      `q4IsomMonoid`), containing the non-compact hyperbolic BOOST `boost4` forced by the
      INDEFINITE SIGN of the reduced form (exactly as N45 for the (1,9) form), NOT posited.
    • THE TRANSLATIONS of the arena — `transl4`, the affine shifts; `interval4 p q = Q4v (p − q)`
      the translation-INVARIANT interval.
    • POINCARÉ = LORENTZ ⋉ TRANSLATIONS — the affine transformation `poincare4 T a : p ↦ T p + a`
      with the SEMIDIRECT composition law `(T₁,a₁)(T₂,a₂) = (T₁T₂, a₁ + T₁a₂)` (`poincare4_comp`),
      the interval preserved when the Lorentz part is an isometry (`poincare4_preserves_interval`).
    • ENERGY–MOMENTUM as the translation charges — the symmetric bilinear pairing `bForm4` whose
      diagonal is the reduced form, with `bForm4 P (1,0,0) = E` and `bForm4 P (0,1,0) = −pₓ` the
      charges conjugate to time / space translation, and the pairing BOOST-INVARIANT in both slots
      (`bForm4_boost_invariant` — the invariant contraction).
    • ★★★ E = mc² — the invariant-norm identity. `massSq P = P.time² − bornMomentum P` is
      DEFINITIONALLY the banked reduced form `Q4v P` (`massSq_eq_Q4v`), because `bornMomentum` is
      the banked Born self-overlap `gForm (cToO d) (cToO d) + x²` (the N419 coordinate collapse).
      So the invariant mass IS the (1,3) self-norm of the energy-momentum vector, BOOST-INVARIANT
      (`massSq_boost_invariant`), splitting as `E² = m² + |p|²` (`energy_sq_split`) and reducing at
      rest (zero spatial momentum) to `m² = E²` (`emc2_rest`) — rest energy IS rest mass. And
      `c² = 1` is FORCED, not chosen: the null cone of the reduced form is `t = ±x`
      (`null_cone_unit_slope`), the unit-slope light cone forced by the EQUAL unit coefficients of
      the banked Born-determinant form.

  WHY THIS IS DERIVED, NOT POSITED (the moat, docs/STANDARD.md §0). Standard special relativity
  POSITS three independent things: the Minkowski metric, the Poincaré group, and the mass-shell
  `p² = m²`. Here NONE is posited. The metric is the banked (1,3) reduction (N419) of the banked
  (1,9) Born-determinant form (N43). The boost falls out of the reduced form's INDEFINITE SIGN
  (a rational hyperbola point, pure ℚ arithmetic — no ℝ, no matrix determinant), exactly as N45.
  `c² = 1` is FORCED by the equal unit coefficients of the banked form, not chosen. And the
  mass-shell `p² = m²` is not a postulate at all: it is the DEFINITIONAL identity
  `massSq ≡ Q4v` — the same banked Born self-overlap form `gForm` (which N419 collapsed to the
  two-square ℂ-norm) read on the energy-momentum vector. SR's three postulates DISSOLVE into one
  banked form and one identity. No posited group, no posited mass-energy relation.

  ℝ-VIGILANCE (docs/STANDARD.md §3). The whole development is over the cascade ground ring ℚ and
  the banked terminal algebra `O ℚ` / `Dbl ℚ` (via `cToO`, `gForm`), exactly as N43/N45/N419.
  NO Mathlib ℝ/ℂ as content: the boost is a rational hyperbola point, `c² = 1` a coefficient
  identity, `massSq ≡ Q4v` a ring identity over ℚ. Mathlib supplies only proof machinery
  (`Submonoid`, `LinearMap`, `abel`, `linear_combination`).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / Poincaré / translation /
  energy / momentum / mass / spacetime / rest frame / light cone / c": what remains is the theorem
  that the ℚ-linear self-maps of `ℚ × ℚ × Dbl ℚ` preserving `Q4v` form a submonoid containing the
  nontrivial shear `boost4`; that the affine maps `p ↦ T p + a` compose by the semidirect law and
  preserve `interval4` when `T` is an isometry; that the symmetric bilinear form `bForm4` with
  diagonal `Q4v` is invariant under `boost4` in both slots; and that `P.1² − bornMomentum P = Q4v P`
  with the spatial-part term vanishing at zero spatial coordinates. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.SpacetimeReduction
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The Lorentz structure of the reduced (1,3) form (the `Q4v`-preservers). -/

/-- THE REDUCED ISOMETRY PREDICATE for the banked (1,3) form `Q4v` on `STV4 = ℚ × ℚ × Dbl ℚ`:
    a ℚ-linear self-map `T` is a `Q4v`-isometry iff `Q4v (T p) = Q4v p` for all `p`. -/
def IsQ4Isom (T : STV4 →ₗ[ℚ] STV4) : Prop := ∀ p : STV4, Q4v (T p) = Q4v p

/-- The identity preserves `Q4v`. -/
theorem isQ4Isom_id : IsQ4Isom (LinearMap.id) := fun _ => rfl

/-- A composite of two `Q4v`-isometries is a `Q4v`-isometry (closure under `∘`). -/
theorem isQ4Isom_comp {S T : STV4 →ₗ[ℚ] STV4} (hS : IsQ4Isom S) (hT : IsQ4Isom T) :
    IsQ4Isom (S.comp T) := by
  intro p; show Q4v (S (T p)) = Q4v p; rw [hS (T p), hT p]

/-- ★ THE REDUCED ISOMETRY STRUCTURE: the `Q4v`-preserving ℚ-linear maps form a submonoid of the
    endomorphism monoid `Module.End ℚ STV4` — the Lorentz structure of the derived (1,3) arena,
    DERIVED, not a posited Lorentz group. -/
def q4IsomMonoid : Submonoid (Module.End ℚ STV4) where
  carrier := {T | IsQ4Isom T}
  one_mem' := isQ4Isom_id
  mul_mem' hS hT := isQ4Isom_comp hS hT

@[simp] theorem mem_q4IsomMonoid {T : Module.End ℚ STV4} :
    T ∈ q4IsomMonoid ↔ IsQ4Isom T := Iff.rfl

/-! ## The boost on the reduced arena — the non-compact generator from the indefinite sign. -/

/-- THE RATIONAL HYPERBOLIC BOOST on the reduced arena: `(t, x, d) ↦ (a t + b x, b t + a x, d)`,
    leaving the two ℂ-rung space coordinates `d` fixed. ℚ-linear by construction. -/
def boost4 (a b : ℚ) : STV4 →ₗ[ℚ] STV4 where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by
    simp only [Prod.fst_add, Prod.snd_add]
    ext <;> simp <;> ring
  map_smul' c p := by
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, RingHom.id_apply]
    ext <;> simp <;> ring

/-- ★★ THE BOOST IS A `Q4v`-ISOMETRY when `(a, b)` lies on the unit hyperbola `a² − b² = 1`. The
    ℂ-rung block `d` is untouched; the `t² − x²` block is preserved by PURE ℚ RING ARITHMETIC —
    the INDEFINITE SIGN of the reduced form (the source of the (1,3) signature, N419) is exactly
    what a hyperbolic shear preserves. No octonion product, no matrix determinant, no ℝ. -/
theorem boost4_isom {a b : ℚ} (h : a^2 - b^2 = 1) : IsQ4Isom (boost4 a b) := by
  intro p
  obtain ⟨t, x, d⟩ := p
  show Q4 _ _ _ = Q4 _ _ _
  unfold boost4 Q4
  simp only [LinearMap.coe_mk, AddHom.coe_mk]
  linear_combination (t^2 - x^2) * h

/-- The boost with `a² − b² = 1` lives in the reduced isometry monoid. -/
theorem boost4_mem {a b : ℚ} (h : a^2 - b^2 = 1) : boost4 a b ∈ q4IsomMonoid :=
  boost4_isom h

/-- ★ NON-TRIVIALITY (W8 teeth): a boost with `b ≠ 0` is NOT the identity — it sends the pure-time
    vector `(1, 0, 0)` to `(a, b, 0)` with nonzero space component `b`. The reduced isometry
    structure is STRICTLY larger than `{id}`: it contains a genuine time–space-mixing (non-compact)
    element — the (1,3) structure is honestly Lorentzian, not Euclidean. -/
theorem boost4_ne_id {a b : ℚ} (hb : b ≠ 0) : boost4 a b ≠ LinearMap.id := by
  intro hcontra
  have := congrArg (fun T => (T ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))).2.1) hcontra
  simp only [boost4, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.id_coe, id_eq] at this
  rw [mul_one, mul_zero, add_zero] at this
  exact hb this

/-- ★ THE BOOST GENUINELY MIXES TIME AND SPACE: the pure-time vector `(1, 0, 0)` acquires a space
    component `b`. The honest hallmark of a Lorentz boost (a non-compact direction). -/
theorem boost4_mixes_time_space (a b : ℚ) :
    boost4 a b ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ)) = (a, b, (0 : Dbl ℚ)) := by
  show (a * 1 + b * 0, b * 1 + a * 0, _) = _
  simp

/-! ## The translations of the arena and the interval. -/

/-- THE TRANSLATIONS of the arena: the affine shift `p ↦ p + a`. -/
def transl4 (a : STV4) : STV4 → STV4 := fun p => p + a

/-- THE INTERVAL between two points: the reduced form of their difference, `Q4v (p − q)`. -/
def interval4 (p q : STV4) : ℚ := Q4v (p - q)

/-- The zero translation is the identity. -/
theorem transl4_zero : transl4 (0 : STV4) = id := by
  funext p; simp [transl4]

/-- The translations compose additively (the translation group of the arena). -/
theorem transl4_comp (a b : STV4) : transl4 a ∘ transl4 b = transl4 (a + b) := by
  funext p; simp only [transl4, Function.comp_apply]; abel

/-- ★ THE INTERVAL IS TRANSLATION-INVARIANT: shifting both points leaves `interval4` unchanged.
    The reduced form measures only DIFFERENCES — the arena has no preferred origin. -/
theorem interval4_transl_invariant (a p q : STV4) :
    interval4 (transl4 a p) (transl4 a q) = interval4 p q := by
  unfold interval4 transl4
  congr 1
  abel

/-! ## Poincaré = Lorentz ⋉ translations. -/

/-- THE POINCARÉ TRANSFORMATION: the affine map `p ↦ T p + a`, a Lorentz part `T` followed by a
    translation `a`. -/
def poincare4 (T : STV4 →ₗ[ℚ] STV4) (a : STV4) : STV4 → STV4 := fun p => T p + a

/-- ★★ THE SEMIDIRECT PRODUCT LAW — POINCARÉ = LORENTZ ⋉ TRANSLATIONS. The composition of two
    Poincaré transformations is a Poincaré transformation whose Lorentz part is the composite and
    whose translation is TWISTED by the outer Lorentz map: `(T₁,a₁)(T₂,a₂) = (T₁T₂, a₁ + T₁ a₂)`.
    This nontrivial twist (the translation acted on by the Lorentz part) IS the semidirect
    structure of the Poincaré group. -/
theorem poincare4_comp (T₁ T₂ : STV4 →ₗ[ℚ] STV4) (a₁ a₂ : STV4) :
    poincare4 T₁ a₁ ∘ poincare4 T₂ a₂ = poincare4 (T₁.comp T₂) (a₁ + T₁ a₂) := by
  funext p
  simp only [poincare4, Function.comp_apply, LinearMap.comp_apply, map_add]
  abel

/-- The pure Lorentz part (`a = 0`) is just the linear map. -/
theorem poincare4_zero (T : STV4 →ₗ[ℚ] STV4) : poincare4 T 0 = T := by
  funext p; simp [poincare4]

/-- The pure translation (`T = id`) is `transl4`. -/
theorem poincare4_id (a : STV4) : poincare4 LinearMap.id a = transl4 a := by
  funext p; simp [poincare4, transl4]

/-- ★★ POINCARÉ PRESERVES THE INTERVAL when the Lorentz part is a `Q4v`-isometry — the full
    invariance group of the interval `interval4`. -/
theorem poincare4_preserves_interval {T : STV4 →ₗ[ℚ] STV4} (hT : IsQ4Isom T) (a p q : STV4) :
    interval4 (poincare4 T a p) (poincare4 T a q) = interval4 p q := by
  unfold interval4 poincare4
  have hsub : T p + a - (T q + a) = T (p - q) := by rw [map_sub]; abel
  rw [hsub, hT (p - q)]

/-! ## Energy–momentum as the translation charges (the symmetric invariant pairing). -/

/-- THE SYMMETRIC BILINEAR PAIRING of the reduced arena: `bForm4 P R = P.t·R.t − pₓ·rₓ −
    (Born overlap of the ℂ-rung parts)`, the polarization of the reduced form `Q4v`. This is the
    invariant contraction that makes the energy-momentum vector the charge conjugate to the
    translations. -/
def bForm4 (P R : STV4) : ℚ :=
  P.1 * R.1 - P.2.1 * R.2.1 - (P.2.2.re * R.2.2.re + P.2.2.im * R.2.2.im)

/-- The pairing is symmetric. -/
theorem bForm4_symm (P R : STV4) : bForm4 P R = bForm4 R P := by unfold bForm4; ring

/-- The diagonal of the pairing IS the reduced (1,3) form. -/
theorem bForm4_diag (P : STV4) : bForm4 P P = Q4v P := by
  unfold bForm4 Q4v Q4; ring

/-- ★ THE PAIRING IS BOOST-INVARIANT IN BOTH SLOTS — the Lorentz-invariant contraction of the
    energy-momentum vector with any four-vector (the Casimir/invariant structure of the arena). -/
theorem bForm4_boost_invariant {a b : ℚ} (h : a^2 - b^2 = 1) (P R : STV4) :
    bForm4 (boost4 a b P) (boost4 a b R) = bForm4 P R := by
  obtain ⟨pt, px, pd⟩ := P
  obtain ⟨rt, rx, rd⟩ := R
  simp only [bForm4, boost4, LinearMap.coe_mk, AddHom.coe_mk]
  linear_combination (pt * rt - px * rx) * h

/-- THE ENERGY as the charge conjugate to time-translation: `bForm4 P (1,0,0) = E` (the time
    component of the energy-momentum vector). -/
theorem bForm4_energy (P : STV4) : bForm4 P ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ)) = P.1 := by
  unfold bForm4; simp [Dbl.zero_re, Dbl.zero_im]

/-- THE x-MOMENTUM as the charge conjugate to x-translation: `bForm4 P (0,1,0) = −pₓ`. -/
theorem bForm4_momentum_x (P : STV4) : bForm4 P ((0 : ℚ), (1 : ℚ), (0 : Dbl ℚ)) = -P.2.1 := by
  unfold bForm4; simp [Dbl.zero_re, Dbl.zero_im]

/-! ## E = mc² — the invariant-norm identity. -/

/-- THE BORN SELF-OVERLAP OF THE SPATIAL MOMENTUM `|p|²`: the banked Born self-overlap `gForm` of
    the ℂ-rung part (N419's coordinate collapse) plus the `x` square — the total spatial
    momentum-square. -/
def bornMomentum (P : STV4) : ℚ := gForm (cToO P.2.2) (cToO P.2.2) + P.2.1 ^ 2

/-- THE INVARIANT MASS-SQUARE `m²` — the Minkowski self-norm of the energy-momentum four-vector:
    TIME-square minus the Born self-overlap of the spatial momentum. -/
def massSq (P : STV4) : ℚ := P.1 ^ 2 - bornMomentum P

/-- ★★ THE MASS IS THE (1,3) SELF-NORM. `massSq P` is DEFINITIONALLY the banked reduced form
    `Q4v P` — because `bornMomentum` is the banked Born self-overlap `gForm (cToO d) (cToO d)`
    (which N419 collapsed to the two-square ℂ-norm) plus `x²`. The mass-shell `p² = m²` is NOT a
    postulate: it is this identity, the banked Born-determinant form read on the momentum vector. -/
theorem massSq_eq_Q4v (P : STV4) : massSq P = Q4v P := by
  unfold massSq bornMomentum Q4v Q4
  rw [gForm_cToO]; ring

/-- ★★ THE MASS IS BOOST-INVARIANT — the Minkowski self-norm of the energy-momentum four-vector
    is unchanged by a boost. Mass is a Lorentz invariant, DERIVED from the isometry of the reduced
    form (not posited). -/
theorem massSq_boost_invariant {a b : ℚ} (h : a^2 - b^2 = 1) (P : STV4) :
    massSq (boost4 a b P) = massSq P := by
  rw [massSq_eq_Q4v, massSq_eq_Q4v, boost4_isom h P]

/-- ★ THE MASS-SHELL SPLIT `E² = m² + |p|²` — energy-square = invariant mass-square PLUS the Born
    self-overlap of the spatial momentum. The relativistic energy-momentum relation, as a ring
    identity. -/
theorem energy_sq_split (P : STV4) : P.1 ^ 2 = massSq P + bornMomentum P := by
  unfold massSq; ring

/-- ★★★ E = mc² — THE INVARIANT-NORM IDENTITY (at rest). In the rest frame (zero spatial
    momentum: `x = 0` and the ℂ-rung part `= 0`) the invariant mass-square EQUALS the
    energy-square: `m² = E²`. The rest energy IS the rest mass — `c² = 1` the derived unit slope.
    This is the marquee identity, DERIVED: the invariant mass is the (1,3) self-norm of the
    energy-momentum vector, which at rest is exactly the energy-square. -/
theorem emc2_rest {P : STV4} (hx : P.2.1 = 0) (hd : P.2.2 = 0) : massSq P = P.1 ^ 2 := by
  unfold massSq bornMomentum
  rw [hx, hd, gForm_cToO]
  simp

/-- ★★ E = mc² IN THE OTHER DIRECTION: a state with `E² = m²` has zero Born self-overlap of the
    spatial momentum — it is at rest. Rest ⟺ energy = mass. -/
theorem rest_iff_energy_eq_mass (P : STV4) : bornMomentum P = 0 ↔ P.1 ^ 2 = massSq P := by
  unfold massSq; constructor
  · intro h; rw [h]; ring
  · intro h; linarith

/-- ★★★ c² = 1 — THE DERIVED UNIT SLOPE. The null cone of the reduced form in the time–space
    plane is `t = ±x` (`(t − x)(t + x) = 0`) — the two null rays of UNIT slope. The invariant
    speed (light-cone slope) is `1`, FORCED by the EQUAL unit coefficients of the banked
    Born-determinant form (`t²` and the space squares both carry coefficient `1`), NOT chosen. -/
theorem null_cone_unit_slope (t x : ℚ) : Q4 t x 0 = 0 ↔ (t - x) * (t + x) = 0 := by
  unfold Q4
  simp only [Dbl.zero_re, Dbl.zero_im]
  constructor
  · intro h; ring_nf; ring_nf at h; linarith
  · intro h; ring_nf; ring_nf at h; linarith

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — POINCARÉ + E = mc², all derived at once. The reduced (1,3) arena of N419
    carries: (a) a nontrivial Lorentz isometry structure containing the non-compact boost
    (`boost4_mem`, `boost4_ne_id`); (b) the affine translations composing with the Lorentz part by
    the semidirect law `(T₁,a₁)(T₂,a₂) = (T₁T₂, a₁ + T₁a₂)` — POINCARÉ = LORENTZ ⋉ TRANSLATIONS
    (`poincare4_comp`) — preserving the interval (`poincare4_preserves_interval`); (c) the
    energy-momentum vector's invariant mass-square `massSq`, which IS the banked (1,3) self-norm
    `Q4v` (`massSq_eq_Q4v`), is BOOST-INVARIANT (`massSq_boost_invariant`), splits as
    `E² = m² + |p|²` (`energy_sq_split`), and reduces at rest to `m² = E²` — E = mc² (`emc2_rest`).
    Nothing posited: the metric is the banked (1,9)→(1,3) reduction (N43/N419), the boost the
    indefinite sign, `c² = 1` the equal unit coefficients, the mass-shell the definitional
    identity `massSq ≡ Q4v` — special relativity's three postulates DISSOLVED into one banked form
    and one identity. -/
theorem poincare_mass_energy :
    (∀ a b : ℚ, a^2 - b^2 = 1 → boost4 a b ∈ q4IsomMonoid)
      ∧ (∀ a b : ℚ, b ≠ 0 → boost4 a b ≠ LinearMap.id)
      ∧ (∀ (T₁ T₂ : STV4 →ₗ[ℚ] STV4) (a₁ a₂ : STV4),
          poincare4 T₁ a₁ ∘ poincare4 T₂ a₂ = poincare4 (T₁.comp T₂) (a₁ + T₁ a₂))
      ∧ (∀ {T : STV4 →ₗ[ℚ] STV4}, IsQ4Isom T → ∀ a p q : STV4,
          interval4 (poincare4 T a p) (poincare4 T a q) = interval4 p q)
      ∧ (∀ P : STV4, massSq P = Q4v P)
      ∧ (∀ {a b : ℚ}, a^2 - b^2 = 1 → ∀ P : STV4, massSq (boost4 a b P) = massSq P)
      ∧ (∀ P : STV4, P.1 ^ 2 = massSq P + bornMomentum P)
      ∧ (∀ {P : STV4}, P.2.1 = 0 → P.2.2 = 0 → massSq P = P.1 ^ 2) :=
  ⟨fun _ _ h => boost4_mem h, fun _ _ hb => boost4_ne_id hb, poincare4_comp,
    fun hT a p q => poincare4_preserves_interval hT a p q, massSq_eq_Q4v,
    fun h P => massSq_boost_invariant h P, energy_sq_split,
    fun hx hd => emc2_rest hx hd⟩

end

end Phys.Algebra
