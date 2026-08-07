/-
  # THE CERTIFICATE SCHEMA — the inverse engine's proof kit (GQ CAP)

  ## What this file proves (INVERSE-ENGINE port, production node)

  The composed certificate theorems the per-fiber completeness assembly
  instantiates — one theorem per exclusion mode, welded once from the
  banked laws (N618–N623):

  * `seeds_force_h` — ★★★ THE COMPOSED EARLY JAW (seed_slot ∘ floor_law):
    a duplicate-free list of deep touching primes forces
    h(D) ≥ 1 + #primes. The billed-contact exclusion.
  * `fiber_exclusion` — ★★★ THE EXCLUSION CERTIFICATE: h deep touching
    primes ⟹ the box exceeds h — per-D exclusion above the frontier,
    witness = the (p, x_p) list.
  * `dvdRe_to_Z` / `ofRe_mono` / `prime_two_le` — transport kit.
  * `small_factor_of_composite` — ★★ THE DESCENT: a composite count has
    a prime factor whose square sits under it.
  * `rabinowitsch_cert` — ★★★ THE RABINOWITSCH CERTIFICATE: root-freeness
    under the square wall forces primality — with deferral_law (N623),
    finitely many kernel checks decide prime generation on the principal
    branch (Euler's x²+x+41 as a theorem schema).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussDeferral

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★★★ THE COMPOSED EARLY JAW: deep principal contacts force the box
    size. The engine's billed-contact exclusion, one theorem. -/
theorem seeds_force_h {D c₀ : Z} {pf : BQF} {L : List BQF} {ps : List Z}
    (hD : D = 1 - 4 * c₀) (hDneg : D < 0)
    (hpw : List.Pairwise (· ≠ ·) L)
    (hmem : ∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = D)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = D → f ∈ L)
    (hpfL : pf ∈ L) (hpfa : pf.a = 1)
    (hpspw : List.Pairwise (· ≠ ·) ps)
    (hp2 : ∀ p ∈ ps, (2 : Z) ≤ p)
    (hdeep : ∀ p ∈ ps, 4 * (p * p) ≤ -D)
    (htouch : ∀ p ∈ ps, ∃ x m : Z, x * x + x + c₀ = p * m) :
    1 + ps.length ≤ L.length := by
  apply floor_law hpw hmem hcomplete hpfL hpfa hpspw hp2
  intro p hp
  obtain ⟨x, m, hxm⟩ := htouch p hp
  have hppos : (0 : Z) < p := by linarith [hp2 p hp]
  exact seed_slot hD hppos hxm (hdeep p hp) hDneg


/-- ★★★ THE EXCLUSION CERTIFICATE: h distinct deep touching primes push
    the box size PAST h — D is excluded from all fibers ≤ h. -/
theorem fiber_exclusion {D c₀ : Z} {pf : BQF} {L : List BQF} {ps : List Z}
    {h : Nat}
    (hD : D = 1 - 4 * c₀) (hDneg : D < 0)
    (hpw : List.Pairwise (· ≠ ·) L)
    (hmem : ∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = D)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = D → f ∈ L)
    (hpfL : pf ∈ L) (hpfa : pf.a = 1)
    (hpspw : List.Pairwise (· ≠ ·) ps)
    (hp2 : ∀ p ∈ ps, (2 : Z) ≤ p)
    (hdeep : ∀ p ∈ ps, 4 * (p * p) ≤ -D)
    (htouch : ∀ p ∈ ps, ∃ x m : Z, x * x + x + c₀ = p * m)
    (hcount : h ≤ ps.length) :
    h < L.length := by
  have hforce := seeds_force_h hD hDneg hpw hmem hcomplete hpfL hpfa
    hpspw hp2 hdeep htouch
  omega


/-- Divisibility transports along ofRe. -/
theorem dvdRe_to_Z {p n : Re} (h : dvdRe p n) :
    ZDvd' (Z.ofRe p) (Z.ofRe n) := by
  obtain ⟨c, hc⟩ := h
  exact ⟨Z.ofRe c, by rw [hc, Z.ofRe_mul]⟩

/-- ofRe is monotone. -/
theorem ofRe_mono {a b : Re} (h : a ≤ b) : Z.ofRe a ≤ Z.ofRe b := by
  obtain ⟨c, hc⟩ := h
  rw [hc, Z.ofRe_add]
  have := ofRe_nonneg c
  linarith

/-- PrimeRe p ⟹ 2 ≤ ofRe p. -/
theorem prime_two_le {p : Re} (hp : PrimeRe p) : (2 : Z) ≤ Z.ofRe p := by
  obtain ⟨h1, _⟩ := hp
  obtain ⟨c, hc⟩ := lt_iff_step_le.mp h1
  rw [hc, Z.ofRe_add]
  have h2 : Z.ofRe (Re.step oneR) = (2 : Z) := by
    show Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z)
    rfl
  rw [h2]
  have := ofRe_nonneg c
  linarith

/-- ★★ THE DESCENT: a composite count has a prime factor under its own
    square root (Z-side inequality form). -/
theorem small_factor_of_composite {n : Re} (h1 : oneR < n)
    (hnp : ¬ PrimeRe n) :
    ∃ r : Re, PrimeRe r ∧ dvdRe r n ∧
      Z.ofRe r * Z.ofRe r ≤ Z.ofRe n := by
  obtain ⟨p, hpprime, hpdvd0⟩ := exists_prime_dvd n h1
  obtain ⟨c, hc⟩ := hpdvd0
  have hpdvd : dvdRe p n := ⟨c, hc⟩
  -- c = 1 would make n = p prime — excluded
  have hcne1 : c ≠ oneR := by
    intro h1c
    apply hnp
    rw [hc, h1c]
    have : p * oneR = p := by
      show p * Re.step Re.void = p
      rw [Re.mul_step, Re.mul_void, Re.void_add]
    rw [this]
    exact hpprime
  -- c ≠ 0 (else n = 0 contradicts 1 < n)
  have hcne0 : c ≠ Re.void := by
    intro h0
    rw [hc, h0] at h1
    have hz : p * Re.void = Re.void := Re.mul_void p
    rw [hz] at h1
    -- oneR < void: ofRe-monotone contradiction
    have hm := ofRe_mono (le_of_lt h1)
    have h1z : Z.ofRe oneR = (1 : Z) := Z.ofRe_one
    have h0z : Z.ofRe Re.void = (0 : Z) := rfl
    rw [h1z, h0z] at hm
    linarith
  -- 1 < c: c = step m with m ≠ void... c ≥ 1 and ≠ 1 and ≠ 0 ⟹ 1 < c
  have h1c : oneR < c := by
    match c, hcne0, hcne1 with
    | .step m, _, hne1 =>
        match m with
        | .void => exact absurd rfl hne1
        | .step m' =>
            rw [lt_iff_step_le]
            refine ⟨m', ?_⟩
            show Re.step (Re.step m') = Re.step oneR + m'
            rw [show Re.step oneR + m' = Re.step (oneR + m') from Re.step_add _ _,
                show oneR + m' = Re.step m' from by
                  show Re.step Re.void + m' = Re.step m'
                  rw [Re.step_add, Re.void_add]]
  obtain ⟨q, hqprime, hqdvd⟩ := exists_prime_dvd c h1c
  have hqn : dvdRe q n := by
    obtain ⟨d, hd⟩ := hqdvd
    exact ⟨p * d, by rw [hc, hd]; ring⟩
  -- n = p * q * d
  obtain ⟨d, hd⟩ := hqdvd
  have hn_eq : n = p * q * d := by rw [hc, hd]; ring
  -- Z side: N = P * Q * Dd, P, Q ≥ 2, Dd ≥ 1
  have hZ : Z.ofRe n = Z.ofRe p * Z.ofRe q * Z.ofRe d := by
    rw [hn_eq, Z.ofRe_mul, Z.ofRe_mul]
  have hP := prime_two_le hpprime
  have hQ := prime_two_le hqprime
  have hDd : (1 : Z) ≤ Z.ofRe d := by
    have hnn := ofRe_nonneg d
    rcases lt_or_eq_of_le hnn with hpos | h0
    · exact z_pos_ge_one hpos
    · exfalso
      rw [← h0] at hZ
      -- n = 0 on Z contradicts 1 < n
      have h1n' : Z.ofRe oneR ≤ Z.ofRe n := ofRe_mono (le_of_lt h1)
      have h1z : Z.ofRe oneR = (1 : Z) := Z.ofRe_one
      rw [h1z] at h1n'
      rw [hZ] at h1n'
      linarith [h1n']
  -- pick the smaller of p, q
  rcases lt_trichotomy (Z.ofRe p) (Z.ofRe q) with hlt | heq | hqp
  case _ =>
    have hpq : Z.ofRe p ≤ Z.ofRe q := le_of_lt hlt
    exact ⟨p, hpprime, hpdvd, by
      rw [hZ]
      nlinarith [hP, hQ, hDd, hpq,
        mul_le_mul_of_nonneg_left hpq (by linarith : (0:Z) ≤ Z.ofRe p),
        mul_le_mul_of_nonneg_left hDd
          (by nlinarith [hP, hQ] : (0:Z) ≤ Z.ofRe p * Z.ofRe q)]⟩
  case _ =>
    have hpq : Z.ofRe p ≤ Z.ofRe q := le_of_eq heq
    exact ⟨p, hpprime, hpdvd, by
      rw [hZ]
      nlinarith [hP, hQ, hDd, hpq,
        mul_le_mul_of_nonneg_left hpq (by linarith : (0:Z) ≤ Z.ofRe p),
        mul_le_mul_of_nonneg_left hDd
          (by nlinarith [hP, hQ] : (0:Z) ≤ Z.ofRe p * Z.ofRe q)]⟩
  case _ =>
    have hqp' : Z.ofRe q ≤ Z.ofRe p := le_of_lt hqp
    exact ⟨q, hqprime, hqn, by
      rw [hZ]
      nlinarith [hP, hQ, hDd, hqp',
        mul_le_mul_of_nonneg_right hqp' (by linarith : (0:Z) ≤ Z.ofRe q),
        mul_le_mul_of_nonneg_left hDd
          (by nlinarith [hP, hQ] : (0:Z) ≤ Z.ofRe p * Z.ofRe q)]⟩

/-- ★★★ THE RABINOWITSCH CERTIFICATE: root-freeness under the square
    wall forces primality. -/
theorem rabinowitsch_cert {n : Re} {v : Z} (hv : v = Z.ofRe n)
    (h1 : oneR < n)
    (hfree : ∀ q : Re, PrimeRe q → Z.ofRe q * Z.ofRe q ≤ v →
      ¬ ZDvd' (Z.ofRe q) v) :
    PrimeRe n := by
  by_contra hnp
  obtain ⟨r, hrprime, hrdvd, hrsq⟩ := small_factor_of_composite h1 hnp
  exact hfree r hrprime (by rw [hv]; exact hrsq)
    (by rw [hv]; exact dvdRe_to_Z hrdvd)


#print axioms seeds_force_h
#print axioms fiber_exclusion
#print axioms small_factor_of_composite
#print axioms rabinowitsch_cert

end BQF
end GaussForms
end Phys.Foundation
