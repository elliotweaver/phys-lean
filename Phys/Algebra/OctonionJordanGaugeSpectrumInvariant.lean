/-
  Phys.Algebra.OctonionJordanGaugeSpectrumInvariant — N269: THE DERIVED GAUGE PRESERVES THE
  ARENA'S OBSERVABLE SPECTRUM — the cubic norm (Freudenthal reduced determinant), the quadratic
  spur, and the whole generic characteristic polynomial of the maximal matter arena J₃(O ℚ) are
  GAUGE-INVARIANT, under BOTH the derived gauge Lie algebra Der(O ℚ) = g₂ (infinitesimally) AND
  the derived gauge group Aut(O ℚ) = g₂ (finitely).
  ===========================================================================
  THE FORWARD ★1↔★4 DEEPENING (the observable spectrum). N268 banked that the derived gauge acts on
  the arena `J₃(O ℚ)` by JORDAN-ALGEBRA DERIVATIONS (`jAct_jb` — preserving the degree-2 symmetric
  bracket) and carries the three cap-forced matter-carrier slots identically (family universality).
  The next thing the theory demands: the gauge preserves not merely the algebraic bracket but the
  arena's INTRINSIC SPECTRAL INVARIANTS — the DEFINING content of `J₃(O)` as an OBSERVABLE algebra.

  THE OBJECT. The exceptional Jordan algebra `J₃(O ℚ)` carries a tower of invariants climbing by
  degree: the LINEAR trace `jTr` (N214), the QUADRATIC spur `jS` (N216), and the CUBIC NORM `jN`
  (the Freudenthal reduced determinant, N215) — assembled into the GENERIC CHARACTERISTIC POLYNOMIAL
  `jN_charpoly` (N216) `λ³ − e₁·λ² + jS·λ − jN`, whose roots on the Cartan are the eigenvalues. The
  derived gauge acts entrywise, fixing the real diagonal and sending each off-diagonal octonion
  entry `a ↦ D a` (Lie) or `a ↦ φ a` (group).

  ★★★ THE HEADLINE — THE DERIVED GAUGE PRESERVES THE CUBIC NORM (finite, the sharper form).
  For an algebra automorphism `φ` of `O ℚ` (`IsAlgAut`, the derived gauge GROUP `Aut(O ℚ) = g₂`),
      `jN d0 d1 d2 (φ a) (φ b) (φ c) = jN d0 d1 d2 a b c`   (`jN_aut_invariant`),
  and likewise the spur (`jS_aut_invariant`) and — pulling the whole characteristic polynomial
  through — the entire eigenvalue SPECTRUM (`jN_charpoly_aut_invariant`). Infinitesimally, for a
  Leibniz derivation `D` (the derived gauge Lie algebra `Der(O ℚ) = g₂`), the FIRST VARIATION of
  the cubic norm vanishes (`jN_first_variation_zero`) and likewise the spur
  (`jS_first_variation_zero`). The observable spectrum is gauge-invariant, both integrated and
  infinitesimally.

  THE MECHANISM (the trunk dissolves it; NO coordinate bash). Each `|v|²` diagonal-of-the-form term
  is preserved because an automorphism preserves the Born self-overlap form (`aut_gForm`, N-aut) and
  a derivation is SKEW for it (`gFormQ_skew`, N26 — the SAME Born positivity). The trilinear
  cross-term `2·reQ ((a·c)·star b)`: finitely, `reQ (φ((a·c)·star b)) = reQ ((a·c)·star b)` since an
  automorphism commutes with `star` (`aut_star`) and preserves the real part (`aut_reQ`);
  infinitesimally, its first variation `2·reQ (D[(a·c)·star b])` vanishes because `D` maps into `ImO`
  so `reQ ∘ D = 0` — the ONE-cause Leibniz collapse.

  THE FREE-FLOATING GROUNDING (docs/SOUL — decisive). The invariance MECHANISM — an automorphism
  preserves the norm form (`aut_gForm`), a derivation is skew (`gFormQ_skew`) — is GENERIC to the
  derivations/automorphisms of ANY composition algebra: a SUPPORTING INGREDIENT, NOT the headline.
  The HEADLINE is the octonion-SPECIFIC JOINT, false for the tower's other rungs:
    (i) the cubic norm `jN` EXISTS as a WELL-DEFINED invariant ONLY up to `O` — its bracketing/cyclic
        well-definedness (`jN_cross_assoc`, N215) IS octonion trace-associativity (`reQ_mul_assoc3`,
        N210), which FAILS at the sedenions (N200); over a generic ring the reduced determinant of a
        Hermitian octonionic matrix is not even well-defined, so there is nothing to preserve;
    (ii) the gauge is `g₂ = Der(O ℚ) = Aut(O ℚ)` — `Der(ℂ) = 0`, `Der(ℍ) = su(2) ≠ g₂`; only the
        terminal rung's derivation/automorphism algebra is the derived gauge;
    (iii) the arena is the MAXIMAL exceptional order, cap-forced at 3 (N267).
  The capstone TYPE carries `jN_cross_assoc` (the octonion-specific well-definedness anchor), so it
  is NOT carrier-agnostic.

  THE DISSOLUTION (docs/STANDARD.md §0) — THE MOAT. Standard physics / the division-algebra field
  POSITS `J₃(O)` as the observable exceptional algebra, WRITES its cubic norm / determinant down by
  hand, and INVOKES `F₄ = Aut(J₃(O))` (or `E₆`) as the structure group preserving it — the
  gauge-invariance of the observable spectrum is ASSUMED as the meaning of "observable." The theory
  DERIVES the arena (N5/N267), DERIVES the cubic norm (N215) and its octonion-specific
  well-definedness, DERIVES the gauge `= g₂` (N6), and now DERIVES that the gauge PRESERVES the
  spectrum — the first `g₂ ⊆ f₄ = Der(J₃(O))` inclusion, at the level of the defining invariants,
  no posit. The physical content (charges / eigenvalues are gauge-invariant quantum numbers) is
  READ OFF, never written in.

  ONE CAUSE MANY TERMINATIONS: the SAME octonion trace-associativity (`reQ_mul_assoc3`) that makes
  the calibration 3-form cyclic (N209), makes the cubic norm well-defined (N215), and fails at the
  sedenions (N200) — is what makes the reduced determinant a genuine invariant the derived gauge
  can preserve; the SAME Born positivity (`gForm`) that makes every derivation skew (N26) and every
  automorphism norm-preserving (N-aut) is what forces the spectral invariance.

  ⚠ SCOPE — HONESTY CLAUSE: banks the gauge-invariance of the spectral invariants (`jN` cubic norm,
  `jS` spur, `jN_charpoly`) — finite AND infinitesimal — + the octonion-specific well-definedness
  anchor (`jN_cross_assoc`) + non-vacuity ONLY; does NOT bank "the eigenvalues ARE the physical
  masses / the gauge-invariant spectrum IS the observed quantum numbers" (removable prose), NOT a
  bundled `g₂ ⊆ f₄` `LieHom` object, NOT the mixing angle (★2), NOT the masses/mixings (★5), NOT the
  full `f₄ = Der(J₃(O))` determination.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete gauge / spectrum / observable / charge /
  eigenvalue / mass / exceptional: over the derived ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`,
  every ℚ-linear Leibniz derivation `D` and every algebra automorphism `φ` of `O ℚ` leaves the
  ℚ-valued cubic form `jN d0 d1 d2 a b c` invariant under the entrywise action fixing the real
  diagonal (finite: `jN d0 d1 d2 (φa)(φb)(φc) = jN d0 d1 d2 a b c`; infinitesimal: the first
  variation vanishes), likewise the quadratic spur `jS` and the whole characteristic polynomial
  `jN_charpoly`; and `jN` is a well-defined invariant only because `reQ ((a·c)·star b)` is
  bracketing-independent (`jN_cross_assoc = reQ_mul_assoc3`), which fails at the next Cayley–Dickson
  rung — the CONJUNCTION carrier-specific.
-/
import Phys.Algebra.OctonionJordanInvariantTower
import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

-- Ring instances for `O ℚ = CD (H ℚ)`; NO `qMod` override — use the ambient global instance so the
-- derivation lemmas (`derivQ_maps_im`/`gFormQ_skew`) and the automorphism lemmas
-- (`aut_gForm`/`aut_reQ`/`aut_star`) typecheck. `jN`/`jS`/`jN_charpoly` use no `•` on `O ℚ` (they are
-- built from `gForm`/`reQ`/`star`/`*`), so they are instance-independent.
attribute [local instance] CD.narCD CD.srCD

/-! ## PART A — THE FINITE (GROUP) INVARIANCE: the derived gauge group `Aut(O ℚ) = g₂` preserves
    the spectral invariants EXACTLY. -/

/-- ★★★ THE HEADLINE — THE DERIVED GAUGE GROUP PRESERVES THE CUBIC NORM (Freudenthal reduced
    determinant). For an algebra automorphism `φ` of `O ℚ`, transforming the off-diagonal entries by
    `φ` (the real diagonal fixed) leaves `jN` unchanged. The observable determinant is
    gauge-invariant. PROOF (no coordinate bash): the three `|v|²` terms via `aut_gForm`
    (norm-preservation); the trilinear cross-term via multiplicativity (`φ (x·y) = φx·φy`),
    conjugation-commuting (`aut_star`), and real-part preservation (`aut_reQ`). -/
theorem jN_aut_invariant {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jN d0 d1 d2 (φ a) (φ b) (φ c) = jN d0 d1 d2 a b c := by
  unfold jN
  rw [aut_gForm h c c, aut_gForm h b b, aut_gForm h a a]
  rw [← h.1 a c, ← aut_star h b, ← h.1 (a * c) (star b), aut_reQ h]

/-- ★★ THE QUADRATIC SPUR is preserved by the derived gauge group. -/
theorem jS_aut_invariant {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jS d0 d1 d2 (φ a) (φ b) (φ c) = jS d0 d1 d2 a b c := by
  unfold jS
  rw [aut_gForm h a a, aut_gForm h b b, aut_gForm h c c]

/-- ★★ THE GENERIC CHARACTERISTIC POLYNOMIAL — hence the whole eigenvalue SPECTRUM — is preserved by
    the derived gauge group. `jN_charpoly` expresses `det(λ·1 − A)` via `jN` with negated
    off-diagonals; automorphism-invariance of `jN` (through `φ(−a) = −φa`) carries the whole cubic in
    `λ` unchanged, so the roots (the eigenvalues) are gauge-invariant. -/
theorem jN_charpoly_aut_invariant {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ)
    (d0 d1 d2 lam : ℚ) (a b c : O ℚ) :
    jN (lam - d0) (lam - d1) (lam - d2) (-(φ a)) (-(φ b)) (-(φ c))
      = jN (lam - d0) (lam - d1) (lam - d2) (-a) (-b) (-c) := by
  rw [← map_neg φ a, ← map_neg φ b, ← map_neg φ c]
  exact jN_aut_invariant h (lam - d0) (lam - d1) (lam - d2) (-a) (-b) (-c)

/-! ## PART B — THE INFINITESIMAL (LIE) INVARIANCE: the derived gauge Lie algebra `Der(O ℚ) = g₂`
    preserves the spectral invariants to first order (the Lie derivative vanishes). -/

/-- A derivation output has vanishing real part (`reQ ∘ D = 0`): a derivation maps into the imaginary
    subspace (`derivQ_maps_im`: `star (D w) = − D w`), so its real part is its own negative. -/
theorem reQ_deriv_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (w : O ℚ) :
    reQ (D w) = 0 := by
  have hstar : star (D w) = - D w := derivQ_maps_im D hD w
  have h := congrArg reQ hstar
  rw [reQ_star, reQ_neg] at h
  linarith

/-- ★★ THE TRILINEAR CROSS-TERM'S FIRST VARIATION dissolves to `reQ (D[(a·c)·star b]) = 0` via the
    Leibniz law + conjugation-commuting (`derivQ_star_comm`). The one-cause collapse: the derived
    product's Leibniz law reassembles the three variation terms into `D` of the single cross product,
    whose real part vanishes because `D` maps into the imaginary subspace. -/
theorem cross_variation_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (a b c : O ℚ) :
    reQ ((D a * c) * star b + (a * D c) * star b + (a * c) * star (D b)) = 0 := by
  have hsb : star (D b) = D (star b) := (derivQ_star_comm D hD b).symm
  rw [hsb]
  have hac : D a * c + a * D c = D (a * c) := (hD a c).symm
  have hstep : (D a * c) * star b + (a * D c) * star b + (a * c) * D (star b)
      = D ((a * c) * star b) := by
    rw [hD (a * c) (star b)]
    rw [← add_mul, hac]
  rw [hstep]
  exact reQ_deriv_zero D hD _

/-- ★★★ THE HEADLINE (infinitesimal) — THE FIRST VARIATION OF THE CUBIC NORM VANISHES. Under the
    entrywise derived-gauge action (the real diagonal fixed, `a ↦ D a`, `b ↦ D b`, `c ↦ D c`), the
    Lie derivative of `jN` along a derivation `D` is zero: each `|v|²` term's variation
    `gForm (D v) v + gForm v (D v) = 0` by skew-adjointness (`gFormQ_skew`), and the trilinear
    cross-term's variation vanishes (`cross_variation_zero`). The derived gauge preserves the
    Freudenthal determinant to first order. -/
theorem jN_first_variation_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    (- (d0 * (gForm (D c) c + gForm c (D c)))
      - (d1 * (gForm (D b) b + gForm b (D b)))
      - (d2 * (gForm (D a) a + gForm a (D a)))
      + 2 * reQ ((D a * c) * star b + (a * D c) * star b + (a * c) * star (D b))) = 0 := by
  have hc := gFormQ_skew D hD c c
  have hb := gFormQ_skew D hD b b
  have ha := gFormQ_skew D hD a a
  have hcross := cross_variation_zero D hD a b c
  rw [hc, hb, ha, hcross]
  ring

/-- ★★ THE QUADRATIC SPUR'S FIRST VARIATION VANISHES (the SAME skew-adjointness; no cross-term). -/
theorem jS_first_variation_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (a b c : O ℚ) :
    (- (gForm (D a) a + gForm a (D a))
      - (gForm (D b) b + gForm b (D b))
      - (gForm (D c) c + gForm c (D c))) = 0 := by
  have hc := gFormQ_skew D hD c c
  have hb := gFormQ_skew D hD b b
  have ha := gFormQ_skew D hD a a
  rw [hc, hb, ha]; ring

/-! ## PART C — W8 ANTI-VACUITY: the preserved invariant is genuinely NONZERO.

    The spectral invariance is not the trivial "the gauge preserves 0". The cubic norm takes a
    genuine NONZERO value on a genuine off-diagonal element (`jN_witness_cross = 2`, N215), and the
    derived gauge has a genuine NONZERO element (`witnessDerivQ ≠ 0`, N6). -/

/-- W8 TEETH: the cubic norm takes a genuine NONZERO value the gauge preserves — the pure
    off-diagonal element `Hm 0 0 0 1 1 1` has `jN = 2 ≠ 0` (N215 `jN_witness_cross`). The spectral
    invariance is non-vacuous: there is a genuine nonzero spectrum to preserve. -/
theorem jN_preserved_value_ne_zero : jN 0 0 0 1 1 1 ≠ 0 := jN_witness_cross_ne

/-- W8 TEETH: the derived gauge is non-trivial — the banked witness derivation is nonzero
    (`witnessDerivQ ≠ 0`, N6). So the invariance is the statement about a genuine gauge, not the
    zero map. -/
theorem gauge_nontrivial : witnessDerivQ ≠ 0 := witnessDerivQ_ne_zero

/-! ## THE CAPSTONE — the derived gauge preserves the arena's observable spectrum. -/

/-- ★★★ THE CAPSTONE — THE DERIVED GAUGE PRESERVES THE ARENA'S OBSERVABLE SPECTRUM. The bundle:
      · FINITE (the derived gauge GROUP `Aut(O ℚ) = g₂`): every algebra automorphism preserves the
        cubic norm `jN`, the spur `jS`, and the whole characteristic polynomial `jN_charpoly` — the
        eigenvalue spectrum is gauge-invariant;
      · INFINITESIMAL (the derived gauge Lie algebra `Der(O ℚ) = g₂`): the first variation of `jN`
        and of `jS` along every derivation vanishes;
      · THE OCTONION-SPECIFIC ANCHOR (why this is NOT carrier-agnostic): the cubic norm is a
        well-defined invariant precisely because its trilinear cross-term is bracketing-independent
        (`jN_cross_assoc = reQ_mul_assoc3`, octonion trace-associativity), which FAILS at the next
        Cayley–Dickson rung — over a generic ring there is no well-defined reduced determinant to
        preserve;
      · NON-VACUITY: the preserved cubic norm takes a genuine nonzero value (`jN 0 0 0 1 1 1 ≠ 0`)
        and the derived gauge is nontrivial (`witnessDerivQ ≠ 0`).
    The first `g₂ ⊆ f₄ = Der(J₃(O))` inclusion, at the level of the defining invariants: the derived
    gauge lives inside the arena's exceptional automorphism structure, preserving the observable
    spectrum. FORCED by the fold's own derivation/automorphism structure, not posited. -/
theorem gauge_preserves_spectrum :
    (∀ {φ : O ℚ ≃ₗ[ℚ] O ℚ}, IsAlgAut φ → ∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        jN d0 d1 d2 (φ a) (φ b) (φ c) = jN d0 d1 d2 a b c)
    ∧ (∀ {φ : O ℚ ≃ₗ[ℚ] O ℚ}, IsAlgAut φ → ∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        jS d0 d1 d2 (φ a) (φ b) (φ c) = jS d0 d1 d2 a b c)
    ∧ (∀ {φ : O ℚ ≃ₗ[ℚ] O ℚ}, IsAlgAut φ → ∀ (d0 d1 d2 lam : ℚ) (a b c : O ℚ),
        jN (lam - d0) (lam - d1) (lam - d2) (-(φ a)) (-(φ b)) (-(φ c))
          = jN (lam - d0) (lam - d1) (lam - d2) (-a) (-b) (-c))
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        (- (d0 * (gForm (D c) c + gForm c (D c)))
          - (d1 * (gForm (D b) b + gForm b (D b)))
          - (d2 * (gForm (D a) a + gForm a (D a)))
          + 2 * reQ ((D a * c) * star b + (a * D c) * star b + (a * c) * star (D b))) = 0)
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D → ∀ (a b c : O ℚ),
        (- (gForm (D a) a + gForm a (D a))
          - (gForm (D b) b + gForm b (D b))
          - (gForm (D c) c + gForm c (D c))) = 0)
    ∧ (∀ a b c : O ℚ, reQ ((a * c) * star b) = reQ (a * (c * star b)))
    ∧ jN 0 0 0 1 1 1 ≠ 0
    ∧ witnessDerivQ ≠ 0 :=
  ⟨fun h d0 d1 d2 a b c => jN_aut_invariant h d0 d1 d2 a b c,
   fun h d0 d1 d2 a b c => jS_aut_invariant h d0 d1 d2 a b c,
   fun h d0 d1 d2 lam a b c => jN_charpoly_aut_invariant h d0 d1 d2 lam a b c,
   fun D hD d0 d1 d2 a b c => jN_first_variation_zero D hD d0 d1 d2 a b c,
   fun D hD a b c => jS_first_variation_zero D hD a b c,
   fun a b c => jN_cross_assoc a b c,
   jN_preserved_value_ne_zero,
   gauge_nontrivial⟩

end Phys.Algebra.HJ
