import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7FullBranching
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

def quatNorm (w : H ℚ) : ℚ :=
  w.re.re ^ 2 + w.re.im ^ 2 + w.im.re ^ 2 + w.im.im ^ 2

theorem starMulSelf_eq_quatNorm (w : H ℚ) :
    star w * w = quatNorm w • (1 : H ℚ) := by
  ext <;> simp [quatNorm, Dbl.mul_re, Dbl.mul_im, cd_qsmul_re, cd_qsmul_im,
    Dbl.smul_re, Dbl.smul_im] <;> ring

theorem quatNorm_eq_zero {w : H ℚ} : quatNorm w = 0 ↔ w = 0 := by
  constructor
  · intro h
    have h4 : w.re.re ^ 2 + w.re.im ^ 2 + w.im.re ^ 2 + w.im.im ^ 2 = 0 := h
    have e1 : w.re.re = 0 := by nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e2 : w.re.im = 0 := by nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e3 : w.im.re = 0 := by nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e4 : w.im.im = 0 := by nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    ext <;> simp [e1, e2, e3, e4]
  · intro h; subst h; simp [quatNorm]

theorem quatNorm_ne_zero {w : H ℚ} (hw : w ≠ 0) : quatNorm w ≠ 0 :=
  fun h => hw (quatNorm_eq_zero.mp h)

theorem sub_reH_mem_ImH (q : H ℚ) : (q - (reH q) • (1 : H ℚ)) ∈ ImH := by
  rw [mem_ImH]
  have ht : q + star q = (2 * reH q) • (1 : H ℚ) := reH_trace q
  have hst : star (q - (reH q) • (1:H ℚ)) = star q - (reH q) • (1:H ℚ) := by
    rw [star_sub]; congr 1; ext <;> simp [reH]
  rw [hst]
  have hsq : star q = (2 * reH q) • (1:H ℚ) - q := by
    linear_combination (norm := abel) ht
  rw [hsq]; module

theorem left_mul_mem_of_ideal {W : Submodule ℚ (H ℚ)}
    (hW : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, Q * x ∈ W)
    (q x : H ℚ) (hx : x ∈ W) : q * x ∈ W := by
  have hsplit : q * x = (reH q) • x + (q - (reH q) • (1:H ℚ)) * x := by
    rw [sub_mul, smul_mul_assoc, one_mul]; abel
  rw [hsplit]
  refine W.add_mem (W.smul_mem _ hx) ?_
  exact hW _ ((mem_ImH).mp (sub_reH_mem_ImH q)) x hx

theorem leftRegular_H_irreducible (W : Submodule ℚ (H ℚ))
    (hW : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, Q * x ∈ W) :
    W = ⊥ ∨ W = ⊤ := by
  by_cases hbot : W = ⊥
  · exact Or.inl hbot
  · right
    obtain ⟨w, hwW, hwne⟩ := (Submodule.ne_bot_iff W).mp hbot
    have hstarw_mul : star w * w ∈ W := left_mul_mem_of_ideal hW (star w) w hwW
    rw [starMulSelf_eq_quatNorm] at hstarw_mul
    have hq : quatNorm w ≠ 0 := quatNorm_ne_zero hwne
    have h1 : (1 : H ℚ) ∈ W := by
      have := W.smul_mem (quatNorm w)⁻¹ hstarw_mul
      rwa [smul_smul, inv_mul_cancel₀ hq, one_smul] at this
    rw [eq_top_iff]; intro q _
    have := left_mul_mem_of_ideal hW q 1 h1
    rwa [mul_one] at this

/-! ## PROBE 3: transport to the actual (2,2) = κO(⊤), su(2)_T-irreducibility + so(4) corollary. -/

/-- ★★ THE (2,2) IS su(2)_T-IRREDUCIBLE: any submodule `W'` of the new plane `κO(⊤)` (dim 4, N192)
    closed under `leftImDeriv Q` (imaginary Q, the su(2)_T action by left-mult) is `⊥` or the
    whole `κO(⊤)`. The (2,2) has NO proper nonzero su(2)_T-invariant subspace. -/
theorem kappaTop_su2T_irreducible (W' : Submodule ℚ (O ℚ))
    (hle : W' ≤ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)))
    (hinv : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W', leftImDeriv Q x ∈ W') :
    W' = ⊥ ∨ W' = Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)) := by
  -- pull W' back to H ℚ through the injective κO
  set W : Submodule ℚ (H ℚ) := Submodule.comap kappaO W' with hWdef
  have hrange : W' ≤ LinearMap.range kappaO := by
    rw [LinearMap.range_eq_map]; exact hle
  have hmap : Submodule.map kappaO W = W' := Submodule.map_comap_eq_self hrange
  -- W is closed under left-mult by imaginary Q (transport of leftImDeriv_kappaO)
  have hWideal : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, Q * x ∈ W := by
    intro Q hQ x hx
    rw [hWdef, Submodule.mem_comap] at hx ⊢
    have := hinv Q hQ (kappaO x) hx
    rwa [leftImDeriv_kappaO] at this
  rcases leftRegular_H_irreducible W hWideal with hb | ht
  · left; rw [← hmap, hb, Submodule.map_bot]
  · right; rw [← hmap, ht]

/-- ★ THE so(4) COROLLARY: the (2,2) is also irreducible under the FULL `so(4)` (a fortiori — more
    operators, hence fewer invariant subspaces). A submodule invariant under BOTH `leftImDeriv`
    (su(2)_T) and `secondSU2` (su(2)_S) is in particular `leftImDeriv`-invariant. -/
theorem kappaTop_so4_irreducible (W' : Submodule ℚ (O ℚ))
    (hle : W' ≤ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)))
    (hinvT : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W', leftImDeriv Q x ∈ W')
    (hinvS : ∀ (P : H ℚ), star P = -P → ∀ x ∈ W', secondSU2 P x ∈ W') :
    W' = ⊥ ∨ W' = Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)) :=
  kappaTop_su2T_irreducible W' hle hinvT

/-! ## W8 — non-vacuity: a natural PROPER nonzero subspace (the diagonal singlet line ℚ·κO 1) is
    NOT su(2)_T-invariant, so the dichotomy genuinely forbids proper invariants (not vacuous). -/

/-- The singlet line `ℚ·κO 1` (the diagonal su(2)-FIXED line, N189) is a PROPER nonzero subspace of
    the (2,2): it is nonzero (`κO 1 ≠ 0`) and does NOT exhaust `κO(⊤)` (it is 1-dim of 4). -/
theorem singletLine_ne_bot : Submodule.span ℚ {kappaO (1 : H ℚ)} ≠ ⊥ := by
  rw [Ne, Submodule.span_singleton_eq_bot]
  intro h
  have h0 : kappaO (1 : H ℚ) = kappaO (0 : H ℚ) := by rw [h, map_zero]
  have h1 : (1 : H ℚ) = 0 := kappaO_injective h0
  exact one_ne_zero (congrArg (fun z : H ℚ => z.re.re) h1)

/-- ★ W8: the singlet line is NOT su(2)_T-invariant — `leftImDeriv hI (κO 1) = κO hI ∉ ℚ·κO 1`.
    So a natural proper nonzero candidate FAILS invariance: the irreducibility dichotomy has teeth,
    forbidding proper nonzero invariants rather than holding vacuously. -/
theorem singletLine_not_su2T_invariant :
    ¬ (∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ Submodule.span ℚ {kappaO (1 : H ℚ)},
        leftImDeriv Q x ∈ Submodule.span ℚ {kappaO (1 : H ℚ)}) := by
  intro hinv
  have hImem : star (hI : H ℚ) = -hI := by
    rw [hI]; ext <;> simp [CD.iota, Dbl.J]
  have hmem : leftImDeriv (hI : H ℚ) (kappaO 1) ∈ Submodule.span ℚ {kappaO (1 : H ℚ)} :=
    hinv hI hImem (kappaO 1) (Submodule.mem_span_singleton_self _)
  rw [leftImDeriv_kappaO, mul_one] at hmem
  -- κO hI ∈ span{κO 1} ⟹ hI ∈ span{1}, contradiction (hI imaginary, deep coord 1)
  rw [Submodule.mem_span_singleton] at hmem
  obtain ⟨c, hc⟩ := hmem
  have : kappaO ((c : ℚ) • (1 : H ℚ)) = kappaO hI := by rw [map_smul]; exact hc
  have hcc := kappaO_injective this
  have := congrArg (fun z : H ℚ => z.re.im) hcc
  simp [hI, CD.iota, Dbl.J, cd_qsmul_re, Dbl.smul_im] at this

end

end Phys.Algebra
