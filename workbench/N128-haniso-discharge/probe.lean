import Phys.Algebra.LorentzContinuumGenerationIndefiniteExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- POSITIVITY CORE: a vector with zero `BvC`-self-overlap and zero first coordinate is `0`. -/
theorem probe_bvC_iso_time_zero (u : STVC) (huu : BvC u u = 0) (hu1 : u.1 = 0) : u = 0 := by
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

/-- `BvC` is non-degenerate in the right slot: if `BvC w r = 0` for all `r`, then `w = 0`. -/
theorem probe_bvC_right_nondeg (w : STVC) (h : ∀ r, BvC w r = 0) : w = 0 := by
  have h1 : w.1 = 0 := by
    have := h (1, 0, 0)
    have e : BvC w ((1, 0, 0) : STVC) = w.1 := by
      show w.1 * 1 - w.2.1 * 0 - gFormC w.2.2 0 = w.1
      rw [gFormC_symm, gFormC_zero_left]; ring
    rw [e] at this; exact this
  have h2 : w.2.1 = 0 := by
    have := h (0, 1, 0)
    have e : BvC w ((0, 1, 0) : STVC) = -w.2.1 := by
      show w.1 * 0 - w.2.1 * 1 - gFormC w.2.2 0 = -w.2.1
      rw [gFormC_symm, gFormC_zero_left]; ring
    rw [e] at this; linarith
  have h3 : w.2.2 = 0 := by
    apply (gFormC_eq_zero_iff w.2.2).mp
    have := h (0, 0, w.2.2)
    have e : BvC w ((0, 0, w.2.2) : STVC) = -gFormC w.2.2 w.2.2 := by
      show w.1 * 0 - w.2.1 * 0 - gFormC w.2.2 w.2.2 = -gFormC w.2.2 w.2.2
      ring
    rw [e] at this; linarith
  exact Prod.ext h1 (Prod.ext h2 h3)

/-- `BvC` is `Cut`-homogeneous in the LEFT slot (from symmetry + right homogeneity). -/
theorem probe_BvC_smul_left (c : Cut) (x y : STVC) : BvC (c • x) y = c * BvC x y := by
  rw [BvC_symm, BvC_smul_right, BvC_symm]

/-- ★★ THE TOTALLY-ISOTROPIC RIGIDITY: a `BvC`-isometry whose every moved difference is isotropic
    (`BvC (S p − p)(S p − p) = 0`) is the identity. The Witt-index-1 fact dissolved through Born
    positivity, with NO finrank computation. -/
theorem probe_isom_bad_eq_id (S : Module.End Cut STVC) (hS : IsBvIsomLin S)
    (hbad : ∀ p : STVC, BvC (S p - p) (S p - p) = 0) : S = LinearMap.id := by
  by_contra hne
  set Nmap : Module.End Cut STVC := S - LinearMap.id with hN
  have hNmap : ∀ p, Nmap p = S p - p := by
    intro p; rw [hN, LinearMap.sub_apply, LinearMap.id_apply]
  have hbad' : ∀ p, BvC (Nmap p) (Nmap p) = 0 := by
    intro p; rw [hNmap]; exact hbad p
  -- im N totally isotropic (polarization)
  have hiso : ∀ a b, BvC (Nmap a) (Nmap b) = 0 := by
    intro a b
    have hab := hbad' (a + b)
    have ha := hbad' a
    have hb := hbad' b
    rw [map_add, BvC_add_left, BvC_add_right, BvC_add_right] at hab
    rw [ha, hb, BvC_symm (Nmap b) (Nmap a)] at hab
    linarith
  -- S p = N p + p
  have hsp : ∀ p, S p = Nmap p + p := by intro p; rw [hNmap]; abel
  -- skew-adjoint
  have hskew : ∀ p q, BvC (Nmap p) q + BvC p (Nmap q) = 0 := by
    intro p q
    have key := hS p q
    rw [hsp p, hsp q, BvC_add_left, BvC_add_right, BvC_add_right, hiso p q] at key
    linarith
  -- N ≠ 0, pick a moved vector
  have hNne : ∃ p₀, Nmap p₀ ≠ 0 := by
    by_contra h; push_neg at h
    apply hne
    have hN0 : Nmap = 0 := LinearMap.ext (by intro p; rw [h p]; rfl)
    have : S - LinearMap.id = 0 := by rw [← hN]; exact hN0
    rwa [sub_eq_zero] at this
  obtain ⟨p₀, hp₀⟩ := hNne
  set w := Nmap p₀ with hw
  have hww0 : BvC w w = 0 := hbad' p₀
  have hwt : w.1 ≠ 0 := fun h0 => hp₀ (probe_bvC_iso_time_zero w hww0 h0)
  -- rank-1: w.1 • N q = (N q).1 • w
  have hstar : ∀ q, w.1 • Nmap q = (Nmap q).1 • w := by
    intro q
    have huq : w.1 • Nmap q - (Nmap q).1 • w = 0 := by
      apply probe_bvC_iso_time_zero
      · have hr : w.1 • Nmap q - (Nmap q).1 • w
            = Nmap (w.1 • q - (Nmap q).1 • p₀) := by
          rw [map_sub, map_smul, map_smul]
        rw [hr]; exact hiso _ _
      · show (w.1 • Nmap q - (Nmap q).1 • w).1 = 0
        rw [Prod.fst_sub, Prod.smul_fst, Prod.smul_fst, smul_eq_mul, smul_eq_mul]
        ring
    rwa [sub_eq_zero] at huq
  -- (N q).1 * BvC w q = 0 for all q
  have hkey : ∀ q, (Nmap q).1 * BvC w q = 0 := by
    intro q
    have hs := hskew q q
    have e1 : w.1 * BvC (Nmap q) q = (Nmap q).1 * BvC w q := by
      rw [← probe_BvC_smul_left, hstar q, probe_BvC_smul_left]
    have e2 : w.1 * BvC q (Nmap q) = (Nmap q).1 * BvC w q := by
      rw [← BvC_smul_right, hstar q, BvC_smul_right, BvC_symm q w]
    have hmul : w.1 * (BvC (Nmap q) q + BvC q (Nmap q)) = 0 := by rw [hs, mul_zero]
    rw [mul_add, e1, e2] at hmul
    linarith
  -- finish
  have hφp₀ : (Nmap p₀).1 ≠ 0 := by rw [← hw]; exact hwt
  have hBp₀ : BvC w p₀ = 0 := by
    rcases mul_eq_zero.mp (hkey p₀) with h | h
    · exact absurd h hφp₀
    · exact h
  obtain ⟨r₀, hr₀⟩ : ∃ r, BvC w r ≠ 0 := by
    by_contra h; push_neg at h
    exact hp₀ (probe_bvC_right_nondeg w h)
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

/-- ★★ `haniso_exists` DISCHARGED: every non-identity `BvC`-isometry has a moved vector with
    ANISOTROPIC difference. The contrapositive of the totally-isotropic rigidity. -/
theorem probe_haniso_exists (T : Module.End Cut STVC) (hT : IsBvIsomLin T)
    (hid : T ≠ LinearMap.id) :
    ∃ v : STVC, T v ≠ v ∧ BvC (T v - v) (T v - v) ≠ 0 := by
  by_contra h; push_neg at h
  apply hid
  apply probe_isom_bad_eq_id T hT
  intro p
  by_cases hp : T p = p
  · rw [hp, sub_self]
    show (0 : Cut) * 0 - 0 * 0 - gFormC 0 0 = 0
    rw [gFormC_zero_left]; ring
  · exact h p hp

/-- ★★ THE FULL UNCONDITIONAL `SO⁺(1,9)` EXHAUSTION: every `BvC`-isometry of the spacetime `STVC`
    is a finite product of indefinite Householder reflections. -/
theorem probe_lorentz_exhaustion_M (S : Module.End Cut STVC) (hS : IsBvIsomLin S) :
    S ∈ Submonoid.closure houseHolderMSet :=
  reflection_exhaustion_M_aniso probe_haniso_exists S hS

end

end Phys.Algebra
