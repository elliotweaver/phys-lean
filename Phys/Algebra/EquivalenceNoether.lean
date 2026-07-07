/-
  Phys.Algebra.EquivalenceNoether — N422 (arc-O O7): THE EQUIVALENCE PRINCIPLE +
  THE NOETHER CORRESPONDENCE.
  ===========================================================================
  THE COMPLETION-SWEEP TARGET (docs/SEED_COMPLETION_SWEEP.md §O7). N420 (O5) derived, on the
  reduced (1,3) arena `STV4 = ℚ × ℚ × Dbl ℚ` (N419), the FULL Poincaré symmetry and its one
  conserved invariant — the mass as the (1,3) self-norm of the energy-momentum vector
  (`massSq P = Q4v P = bForm4 P P`, the diagonal of the symmetric boost-invariant pairing
  `bForm4`). This module reads the TWO marquee physical laws off that ONE banked pairing — none
  posited, both forced:

    • ★ THE EQUIVALENCE PRINCIPLE — m_inertial ≡ m_gravitational, from the UNIQUE mass channel.
      The mass is a boost-invariant symmetric quadratic scalar of the momentum vector. On the
      inertial time–space plane, the space of boost-invariant symmetric forms is ONE-DIMENSIONAL:
      any such form is a scalar multiple of the single banked mass form `t² − x²` (`Q4 t x 0`, the
      diagonal of `bForm4` on the plane). There is NO independent second channel to house a
      distinct "gravitational mass". Consequences, all derived:
        – `mass_channel_one_dim` — every boost-invariant symmetric plane form `= p · massForm2`;
        – `equivalence_principle` — two boost-invariant "mass" forms have a STATE-INDEPENDENT
          ratio (the universal Eötvös ratio), never a per-body dial;
        – ★★★ `ep_unique_channel` — a boost-invariant form NORMALIZED to `1` at rest IS the mass
          form everywhere: the gravitational channel, once required boost-covariant + rest-
          normalized, is FORCED to equal the inertial one — m_g = m_i, no freedom;
        – `ep_no_dial` (the N372 no-dial shape) — a "violation" (a boost-invariant, rest-normalized
          form differing from the mass form on some boosted state) is UNWRITABLE: the EP "problem"
          assumes a dial (the ratio m_g/m_i) the invariant structure provably lacks.

    • ★ THE NOETHER CORRESPONDENCE — conservation laws = the invariant forms of the forced
      symmetry. The charge conjugate to a translation generator `ξ` is the invariant contraction
      `noetherCharge P ξ = bForm4 P ξ`. Derived:
        – `noetherCharge_energy` / `noetherCharge_momentum` — energy = the time-translation charge
          `bForm4 P (1,0,0) = E`, momentum = the space-translation charge `bForm4 P (0,1,0) = −pₓ`
          (banked N420);
        – `noetherCharge_conserved` — BOOST-INVARIANT (the charge is unchanged along the symmetry:
          the conservation law), banked `bForm4_boost_invariant`;
        – `noetherCharge_add` / `noetherCharge_smul` — LINEAR in the generator (the charge map is
          linear: generators combine, charges add);
        – ★★★ `noether_faithful` — the correspondence `ξ ↦ noetherCharge P ξ` is FAITHFUL: the
          full set of translation charges determines the momentum vector (non-degeneracy). The
          invariant contractions with the symmetry generators carry ALL the conserved information.

    • ★★★ THE ONE-STRUCTURE MOAT (`equivalence_and_noether`). BOTH laws are faces of the ONE
      banked pairing `bForm4`: its DIAGONAL is the unique invariant (the mass — EP), its
      OFF-DIAGONAL pairings with the symmetry generators are the conserved charges (Noether). One
      structure, two laws.

  WHY THIS IS DERIVED, NOT POSITED (the moat, docs/STANDARD.md §0). Standard physics POSITS the
  equivalence principle as an experimental coincidence (Eötvös) built into GR by hand, and proves
  Noether's theorem by variational calculus on a POSITED Lagrangian. Here NEITHER is posited. EP is
  the UNIQUENESS of the Lorentz invariant scalar — proved by pure ℚ Gram-matrix forcing from a
  single rational boost `(5/4, 3/4)` on the unit hyperbola: a boost-invariant symmetric form
  `p t² + 2q tx + r x²` must have `q = 0` and `r = −p`, so it is `p · (t² − x²)`. No second
  invariant exists to dial. Noether needs no Lagrangian and no variation: the conserved charge is
  the invariant contraction `bForm4(·, ξ)`, conserved because `bForm4` is boost-invariant (N420),
  faithful because `bForm4` is non-degenerate. Both walls dissolve into properties of the one
  banked pairing.

  ℝ-VIGILANCE (docs/STANDARD.md §3). The whole development is over the cascade ground ring ℚ and
  the banked reduced arena `STV4 = ℚ × ℚ × Dbl ℚ` with the banked pairing `bForm4` / form `Q4`
  (N419/N420). NO Mathlib ℝ/ℂ as content: the boost is a rational hyperbola point, the uniqueness
  a ℚ linear-algebra fact, the charges ℚ contractions. Mathlib supplies only proof machinery
  (`nlinarith`, `linarith`, `Dbl.ext`, `ring`).

  NOT FREE-FLOATING (docs/STANDARD.md §3). Every leg's TYPE mentions the banked derived objects:
  the mass channel is instantiated to the banked mass form `Q4 t x 0` (= the diagonal of `bForm4`
  on the plane, `massForm2_eq_Q4` / `massForm2_eq_bForm4_diag`); the Noether charge is literally
  `bForm4` (N420); the abstract §0 uniqueness lemma is MACHINERY, instantiated to the banked mass
  form at the EP capstone — never left as a generic statement.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "equivalence / inertial / gravitational /
  mass / energy / momentum / conservation / Noether / charge / boost / spacetime / rest frame":
  what remains is the theorem that the space of `{(a t + b x, b t + a x)}`-invariant symmetric
  quadratic forms on `ℚ²` (over the unit hyperbola `a² − b² = 1`) is one-dimensional, spanned by
  `t² − x²`; that a member normalized to `1` at `(1,0)` equals `t² − x²` everywhere; that the
  symmetric bilinear `bForm4` is linear and non-degenerate in each slot and invariant under the
  banked shear; and that pairing with the coordinate axes recovers the coordinates. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.PoincareMassEnergy
import Mathlib.Tactic

namespace Phys.Algebra.EquivNoether

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## §1 — THE MASS CHANNEL: the space of boost-invariant symmetric forms on the inertial
    time–space plane. (Machinery — instantiated to the banked mass form at the EP capstone.) -/

/-- A GENERAL symmetric quadratic form on the inertial time–space plane:
    `genForm2 p q r t x = p t² + 2q tx + r x²`. The candidate "mass-like" scalar. -/
def genForm2 (p q r : ℚ) (t x : ℚ) : ℚ := p * t ^ 2 + 2 * q * t * x + r * x ^ 2

/-- THE BANKED MASS FORM on the plane `massForm2 t x = t² − x²` — the diagonal of the banked
    pairing `bForm4` (and the banked reduced form `Q4`) restricted to the ℂ-rung-free plane. -/
def massForm2 (t x : ℚ) : ℚ := t ^ 2 - x ^ 2

/-- THE MASS FORM IS THE BANKED REDUCED FORM ON THE PLANE: `massForm2 t x = Q4 t x 0`. The mass
    channel is not a new object — it is the banked `(1,3)` form with zero ℂ-rung part (N419). -/
theorem massForm2_eq_Q4 (t x : ℚ) : massForm2 t x = Q4 t x 0 := by
  unfold massForm2 Q4; simp [Dbl.zero_re, Dbl.zero_im]

/-- THE MASS FORM IS THE DIAGONAL OF THE BANKED PAIRING ON THE PLANE:
    `massForm2 t x = bForm4 (t,x,0) (t,x,0)`. The inertial mass channel IS the diagonal of the
    banked energy-momentum pairing `bForm4` (N420) on the time–space plane. -/
theorem massForm2_eq_bForm4_diag (t x : ℚ) :
    massForm2 t x = bForm4 (t, x, (0 : Dbl ℚ)) (t, x, (0 : Dbl ℚ)) := by
  unfold massForm2 bForm4; simp [Dbl.zero_re, Dbl.zero_im]; ring

/-- BOOST-INVARIANCE of a plane form under ALL unit-hyperbola boosts `(a t + b x, b t + a x)`,
    `a² − b² = 1` — exactly the `(t,x)`-block action of the banked `boost4` (N420, which leaves
    the ℂ-rung `d` fixed). -/
def IsPlaneBoostInvariant (p q r : ℚ) : Prop :=
  ∀ (a b : ℚ), a ^ 2 - b ^ 2 = 1 → ∀ t x : ℚ,
    genForm2 p q r (a * t + b * x) (b * t + a * x) = genForm2 p q r t x

/-- ★ THE MASS FORM IS IN THE CHANNEL: `t² − x²` is boost-invariant (`genForm2 1 0 (−1)`). The
    channel is non-empty — it contains the banked mass form (the diagonal of `bForm4`). -/
theorem massForm2_boost_invariant : IsPlaneBoostInvariant 1 0 (-1) := by
  intro a b h t x
  unfold genForm2
  linear_combination (t ^ 2 - x ^ 2) * h

/-- ★★ THE MASS CHANNEL IS ONE-DIMENSIONAL — the uniqueness that forces the equivalence
    principle. ANY boost-invariant symmetric plane form has `q = 0` and `r = −p`: it is a scalar
    multiple of the single mass form. Proved by pure ℚ Gram forcing from ONE rational boost
    `(5/4, 3/4)` on the unit hyperbola — no ℝ, no second invariant. -/
theorem plane_uniqueness {p q r : ℚ} (h : IsPlaneBoostInvariant p q r) : q = 0 ∧ r = -p := by
  have hab : (5 / 4 : ℚ) ^ 2 - (3 / 4 : ℚ) ^ 2 = 1 := by norm_num
  have h10 := h (5 / 4) (3 / 4) hab 1 0
  have h01 := h (5 / 4) (3 / 4) hab 0 1
  have h11 := h (5 / 4) (3 / 4) hab 1 1
  unfold genForm2 at h10 h01 h11
  exact ⟨by nlinarith [h10, h01, h11], by nlinarith [h10, h01, h11]⟩

/-- ★ EVERY BOOST-INVARIANT PLANE FORM IS A SCALAR MULTIPLE OF THE MASS FORM:
    `genForm2 p q r t x = p · massForm2 t x`. -/
theorem mass_channel_one_dim {p q r : ℚ} (h : IsPlaneBoostInvariant p q r) (t x : ℚ) :
    genForm2 p q r t x = p * massForm2 t x := by
  obtain ⟨hq, hr⟩ := plane_uniqueness h
  unfold genForm2 massForm2
  rw [hq, hr]; ring

/-! ## §2 — THE EQUIVALENCE PRINCIPLE: m_inertial ≡ m_gravitational, no dial. -/

/-- ★★ THE EQUIVALENCE PRINCIPLE (state-independent ratio). Two boost-invariant "mass" forms —
    an inertial one `Gᵢ = genForm2 pᵢ qᵢ rᵢ` and a gravitational one `G_g = genForm2 p_g q_g r_g`
    — have a ratio that is a UNIVERSAL CONSTANT, never a per-state (per-body) dial:
    `G_g(t,x) · pᵢ = Gᵢ(t,x) · p_g` for ALL states. The Eötvös ratio is `p_g / pᵢ`, the same for
    every state — the equivalence principle, DERIVED from the one-dimensional mass channel. -/
theorem equivalence_principle {pᵢ qᵢ rᵢ p_g q_g r_g : ℚ}
    (hi : IsPlaneBoostInvariant pᵢ qᵢ rᵢ) (hg : IsPlaneBoostInvariant p_g q_g r_g) (t x : ℚ) :
    genForm2 p_g q_g r_g t x * pᵢ = genForm2 pᵢ qᵢ rᵢ t x * p_g := by
  rw [mass_channel_one_dim hi, mass_channel_one_dim hg]; ring

/-- ★★★ THE UNIQUE MASS CHANNEL — the equivalence principle's sharpest face. A boost-invariant
    symmetric form NORMALIZED to `1` at rest (`genForm2 p q r 1 0 = 1`) IS the mass form
    everywhere: `genForm2 p q r t x = massForm2 t x` for all `(t,x)`. The "gravitational mass
    channel", once required boost-covariant AND rest-normalized, is FORCED to equal the inertial
    mass form — m_gravitational = m_inertial, with NO remaining freedom. -/
theorem ep_unique_channel {p q r : ℚ} (h : IsPlaneBoostInvariant p q r)
    (hnorm : genForm2 p q r 1 0 = 1) (t x : ℚ) : genForm2 p q r t x = massForm2 t x := by
  have hp : p = 1 := by
    have := mass_channel_one_dim h 1 0
    rw [hnorm] at this
    unfold massForm2 at this; simp at this; linarith
  rw [mass_channel_one_dim h, hp, one_mul]

/-- ★★★ EP AS A NO-DIAL THEOREM (the N372 shape). A "violation of the equivalence principle" — a
    boost-invariant, rest-normalized form that DIFFERS from the mass form on some boosted state —
    is UNWRITABLE: no such form exists. The EP "problem" (why is `m_g / m_i = 1`?) assumes a dial
    (an independent ratio) the boost-invariant structure provably lacks. -/
theorem ep_no_dial :
    ¬ ∃ (p q r : ℚ) (t x : ℚ),
        IsPlaneBoostInvariant p q r ∧ genForm2 p q r 1 0 = 1 ∧ genForm2 p q r t x ≠ massForm2 t x := by
  rintro ⟨p, q, r, t, x, hinv, hnorm, hne⟩
  exact hne (ep_unique_channel hinv hnorm t x)

/-- ★ NON-VACUITY (W8): the mass channel is a GENUINE CONSTRAINT, not "everything is invariant".
    The pure-time form `genForm2 1 0 0 = t²` is NOT boost-invariant — so the one-dimensionality of
    the channel has teeth (there really are forms it excludes), while the mass form passes. -/
theorem timeForm_not_boost_invariant : ¬ IsPlaneBoostInvariant 1 0 0 := by
  intro h
  have hab : (5 / 4 : ℚ) ^ 2 - (3 / 4 : ℚ) ^ 2 = 1 := by norm_num
  have h10 := h (5 / 4) (3 / 4) hab 1 0
  unfold genForm2 at h10
  norm_num at h10

/-! ## §3 — THE NOETHER CORRESPONDENCE: conserved charges = invariant contractions. -/

/-- THE NOETHER CHARGE conjugate to a translation generator `ξ`: the banked invariant contraction
    `bForm4 P ξ` (N420) of the energy-momentum vector `P` with the generator `ξ`. -/
def noetherCharge (P ξ : STV4) : ℚ := bForm4 P ξ

/-- THE ENERGY as the charge conjugate to time-translation: `noetherCharge P (1,0,0) = E`
    (banked `bForm4_energy`, N420). -/
theorem noetherCharge_energy (P : STV4) :
    noetherCharge P ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ)) = P.1 :=
  bForm4_energy P

/-- THE x-MOMENTUM as the charge conjugate to x-translation: `noetherCharge P (0,1,0) = −pₓ`
    (banked `bForm4_momentum_x`, N420). -/
theorem noetherCharge_momentum (P : STV4) :
    noetherCharge P ((0 : ℚ), (1 : ℚ), (0 : Dbl ℚ)) = -P.2.1 :=
  bForm4_momentum_x P

/-- ★ THE CONSERVATION LAW: the Noether charge is BOOST-INVARIANT — unchanged along the symmetry
    (banked `bForm4_boost_invariant`, N420). Conservation = invariance of the contraction under
    the forced symmetry. -/
theorem noetherCharge_conserved {a b : ℚ} (h : a ^ 2 - b ^ 2 = 1) (P ξ : STV4) :
    noetherCharge (boost4 a b P) (boost4 a b ξ) = noetherCharge P ξ :=
  bForm4_boost_invariant h P ξ

/-- THE CHARGE IS LINEAR IN THE GENERATOR (additive): `noetherCharge P (ξ + η) =
    noetherCharge P ξ + noetherCharge P η`. Superposed generators give summed charges. -/
theorem noetherCharge_add (P ξ η : STV4) :
    noetherCharge P (ξ + η) = noetherCharge P ξ + noetherCharge P η := by
  obtain ⟨Pt, Px, Pd⟩ := P; obtain ⟨ξt, ξx, ξd⟩ := ξ; obtain ⟨ηt, ηx, ηd⟩ := η
  unfold noetherCharge bForm4
  simp only [Prod.fst_add, Prod.snd_add, Dbl.add_re, Dbl.add_im]
  ring

/-- THE CHARGE IS LINEAR IN THE GENERATOR (homogeneous): `noetherCharge P (c • ξ) =
    c · noetherCharge P ξ`. -/
theorem noetherCharge_smul (P : STV4) (c : ℚ) (ξ : STV4) :
    noetherCharge P (c • ξ) = c * noetherCharge P ξ := by
  obtain ⟨Pt, Px, Pd⟩ := P; obtain ⟨ξt, ξx, ξd⟩ := ξ
  unfold noetherCharge bForm4
  simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, Dbl.smul_re, Dbl.smul_im]
  ring

/-- ★★★ THE NOETHER CORRESPONDENCE IS FAITHFUL — the full set of translation charges DETERMINES
    the energy-momentum vector. If `P` has vanishing charge for every generator `ξ`
    (`bForm4 P ξ = 0` for all `ξ`), then `P = 0`: the invariant contractions with the symmetry
    generators carry ALL the conserved information. Non-degeneracy of the banked pairing. -/
theorem noether_faithful {P : STV4} (h : ∀ ξ : STV4, noetherCharge P ξ = 0) : P = 0 := by
  have hE := h ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))
  rw [noetherCharge_energy] at hE
  have hpx := h ((0 : ℚ), (1 : ℚ), (0 : Dbl ℚ))
  rw [noetherCharge_momentum] at hpx
  have hpx' : P.2.1 = 0 := by linarith
  have hdre := h ((0 : ℚ), (0 : ℚ), (⟨1, 0⟩ : Dbl ℚ))
  have hdim := h ((0 : ℚ), (0 : ℚ), (⟨0, 1⟩ : Dbl ℚ))
  unfold noetherCharge bForm4 at hdre hdim
  have hre : P.2.2.re = 0 := by nlinarith [hdre]
  have him : P.2.2.im = 0 := by nlinarith [hdim]
  have hd : P.2.2 = 0 := by
    apply Dbl.ext
    · simpa using hre
    · simpa using him
  obtain ⟨t, x, d⟩ := P
  simp only at hE hpx' hd
  subst hE; subst hpx'; subst hd
  rfl

/-- ★ THE NOETHER CORRESPONDENCE IS FAITHFUL (equality form): two energy-momentum vectors with
    the SAME charge for every generator are EQUAL. The map `ξ ↦ noetherCharge P ξ` determines
    `P` — the symmetry-generators ↔ conserved-charges correspondence is injective. -/
theorem noether_charge_determines_state {P Q : STV4}
    (h : ∀ ξ : STV4, noetherCharge P ξ = noetherCharge Q ξ) : P = Q := by
  have hE := h ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))
  rw [noetherCharge_energy, noetherCharge_energy] at hE
  have hpx := h ((0 : ℚ), (1 : ℚ), (0 : Dbl ℚ))
  rw [noetherCharge_momentum, noetherCharge_momentum] at hpx
  have hpx' : P.2.1 = Q.2.1 := by linarith
  have hdre := h ((0 : ℚ), (0 : ℚ), (⟨1, 0⟩ : Dbl ℚ))
  have hdim := h ((0 : ℚ), (0 : ℚ), (⟨0, 1⟩ : Dbl ℚ))
  unfold noetherCharge bForm4 at hdre hdim
  have hre : P.2.2.re = Q.2.2.re := by nlinarith [hdre]
  have him : P.2.2.im = Q.2.2.im := by nlinarith [hdim]
  have hd : P.2.2 = Q.2.2 := by
    apply Dbl.ext
    · exact hre
    · exact him
  obtain ⟨Pt, Px, Pd⟩ := P; obtain ⟨Qt, Qx, Qd⟩ := Q
  simp only at hE hpx' hd
  rw [hE, hpx', hd]

/-! ## §4 — THE ONE-STRUCTURE MOAT: both laws are faces of the one banked pairing. -/

/-- ★★★ THE CAPSTONE — THE EQUIVALENCE PRINCIPLE AND THE NOETHER CORRESPONDENCE, both derived
    from the ONE banked pairing `bForm4`. (a) THE EQUIVALENCE PRINCIPLE: the mass channel is
    one-dimensional (every boost-invariant symmetric plane form is `p · massForm2`), so a
    boost-invariant form normalized to `1` at rest IS the mass form — the gravitational mass
    channel is FORCED to equal the inertial one (`ep_unique_channel`), and a violation is
    unwritable (`ep_no_dial`); the mass form IS the diagonal of `bForm4` on the plane
    (`massForm2_eq_bForm4_diag`). (b) THE NOETHER CORRESPONDENCE: the conserved charge is the
    invariant contraction `noetherCharge P ξ = bForm4 P ξ`, boost-invariant (the conservation
    law), linear in the generator, and faithful (the charges determine the state). ONE structure
    (`bForm4`), TWO laws: its diagonal is the unique invariant (the mass — EP), its off-diagonal
    pairings are the conserved charges (Noether). Nothing posited: EP is the uniqueness of the
    Lorentz invariant scalar (a ℚ Gram fact), Noether the invariance + non-degeneracy of the
    banked pairing (N420). Standard physics posits BOTH; here both DISSOLVE. -/
theorem equivalence_and_noether :
    (∀ {p q r : ℚ}, IsPlaneBoostInvariant p q r → ∀ t x : ℚ,
        genForm2 p q r t x = p * massForm2 t x)
      ∧ (∀ {p q r : ℚ}, IsPlaneBoostInvariant p q r → genForm2 p q r 1 0 = 1 →
          ∀ t x : ℚ, genForm2 p q r t x = massForm2 t x)
      ∧ (∀ t x : ℚ, massForm2 t x = bForm4 (t, x, (0 : Dbl ℚ)) (t, x, (0 : Dbl ℚ)))
      ∧ (∀ (P : STV4), noetherCharge P ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ)) = P.1)
      ∧ (∀ {a b : ℚ}, a ^ 2 - b ^ 2 = 1 → ∀ P ξ : STV4,
          noetherCharge (boost4 a b P) (boost4 a b ξ) = noetherCharge P ξ)
      ∧ (∀ {P : STV4}, (∀ ξ : STV4, noetherCharge P ξ = 0) → P = 0) :=
  ⟨fun h t x => mass_channel_one_dim h t x,
   fun h hn t x => ep_unique_channel h hn t x,
   massForm2_eq_bForm4_diag,
   noetherCharge_energy,
   fun h P ξ => noetherCharge_conserved h P ξ,
   fun h => noether_faithful h⟩

/-! ## §5 — NON-VACUITY TEETH (W8). -/

/-- ★★ W8 TEETH: the equivalence-principle + Noether structure is NON-VACUOUS and load-bearing.
    (a) the mass channel is a GENUINE constraint — the mass form `t² − x²` passes
    (`massForm2_boost_invariant`) but the pure-time form `t²` FAILS
    (`timeForm_not_boost_invariant`), so the one-dimensionality is not "every form is invariant";
    (b) the Noether charge is GENUINELY non-degenerate — a specific nonzero momentum vector has a
    nonzero charge (`noetherCharge (1,0,0) (1,0,0) = 1 ≠ 0`), so faithfulness is not vacuous.
    A WRONG mis-reading — that every plane form is boost-invariant (no unique channel), or that
    the charge map is trivial — fails here. This is the fact the C447 costume rejects. -/
theorem equivNoether_nonvacuous :
    IsPlaneBoostInvariant 1 0 (-1)
      ∧ (¬ IsPlaneBoostInvariant 1 0 0)
      ∧ noetherCharge ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ)) ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ)) = 1 := by
  refine ⟨massForm2_boost_invariant, timeForm_not_boost_invariant, ?_⟩
  unfold noetherCharge bForm4
  simp [Dbl.zero_re, Dbl.zero_im]

end

end Phys.Algebra.EquivNoether
