/-
  Phys.Algebra.DerivationRep7FullBranching — N190: THE FULL ISOSPIN BRANCHING OF THE `7`
  — `7 = 1 ⊕ 3 ⊕ 3` under the embedded `su(2)`.
  ===========================================================================
  N189 banked the FIRST step of the branching: the SINGLET `ℚ·e₄` (`e₄ = κO 1 = ⟨0,1⟩`)
  drops out when `g₂ = Der(O ℚ)` is restricted to the embedded weak-isospin
  `su(2) = ⟨innerDeriv hI/J/K⟩` (N187). THIS node completes the decomposition: the remaining
  `6` of the `7` splits into TWO copies of the adjoint `3`, giving the explicit
  `7 = 1 ⊕ 3 ⊕ 3` isospin decomposition of `ImO` (N22) — DERIVED FORWARD from the cascade's
  OWN doubling, not read off by hand.

  ★ THE MECHANISM — the two complementary embeddings + componentwise action (docs/RUNBOOK W9.4
  structure-over-coordinate-expansion). The octonion rung is the Cayley–Dickson double
  `O ℚ = CD (H ℚ) = ⟨H, H⟩`, with two complementary copies of the quaternion rung:
    • the OLD line   `ιO : H ℚ →ₗ[ℚ] O ℚ`, `a ↦ ⟨a, 0⟩`   (banked `CD.iota`, packaged ℚ-linear),
    • the NEW plane  `κO : H ℚ →ₗ[ℚ] O ℚ`, `b ↦ ⟨0, b⟩`   (banked N189).
  The inner derivations act COMPONENTWISE (N6 `innerDeriv_apply`:
  `innerDeriv q ⟨a,b⟩ = ⟨adHom q a, adHom q b⟩`), so on BOTH copies the embedded algebra acts by
  the adjoint representation of `H`:
    • `innerDeriv q (ιO a) = ιO (adHom q a)`   (`innerDeriv_iotaO`),
    • `innerDeriv q (κO b) = κO (adHom q b)`   (`innerDeriv_kappaO_full`).
  Both intertwiners are immediate (`adHom q 0 = 0`); they GENERALIZE N189's special case
  (`q ↦ innerDeriv q e₄ = 0`, the `b = 1` instance, since `adHom q 1 = 0`).

  ★★ THE DECOMPOSITION. Mirror the N22 `ImO` construction one rung down: the imaginary
  quaternion subspace `ImH := ker(starLH + 1)` has `finrank ℚ ImH = 3` (rank–nullity on
  `starLH + 1`, whose range is `ℚ·1`, with `finrank ℚ (H ℚ) = 4` banked N19). Then `ImO`
  (`finrank 7`, N22) is the internal sup of THREE su(2)-invariant pieces:
    • `A := ιO(ImH)`              — the OLD adjoint `3` (3-dim, `ιO` injective on `ImH`),
    • `B := ℚ·e₄`                 — the SINGLET `1` (N189),
    • `C := κO(ImH)`              — the NEW adjoint `3` (3-dim, `κO` injective on `ImH`),
  with `A ⊔ B ⊔ C = ImO` (`fullBranching_sup_eq_ImO`): every imaginary `x = ⟨a, b⟩` has
  `a ∈ ImH` (forced by `star x = −x`), and `b = (reH b)·1 + b'` with `b' ∈ ImH`, so
  `x = ιO a + (reH b)·e₄ + κO b'` lands in `A + B + C`. Each piece is su(2)-INVARIANT:
  `adHom q` preserves `ImH` for imaginary `q` (`adHom_mem_ImH`, via the banked `adHom_star_comm`),
  so `innerDeriv q` preserves `A` and `C` (`invariant_iotaImH`, `invariant_kappaImH`) and fixes
  `B` (N189 `singlet_fixed_by_isospin`). DIMENSIONS: `3 + 1 + 3 = 7` (`branching_dim_sum`).

  ★ W8 NON-VACUITY: the embedded `su(2)` acts NONTRIVIALLY on the OLD adjoint `3` —
  `innerDeriv hI (ιO hJ) ≠ 0` (`action_on_iotaImH_ne_zero`, since `adHom hI hJ = 2hK ≠ 0`).
  So the two `3`'s are GENUINE nonzero invariant summands carrying a nontrivial action, not a
  vacuous zero-decomposition.

  THE MOAT — THE UNBROKEN-STRAND NOVELTY (docs/STANDARD.md §0). The division-algebra-physics
  field reads the branching `7 = 1 ⊕ 3 ⊕ 3` off the octonions by hand. Here it is DERIVED
  FORWARD: the `1` is the upper-doubling unit `⟨0,1⟩`, and the two `3`'s are the imaginary
  quaternions in the OLD line `⟨ImH,0⟩` and the NEW plane `⟨0,ImH⟩` — the SAME doubling that
  stops the cascade (N2c) and embeds `su(2) ↪ g₂` (N187) here splits the `7`. One cause, several
  consequences.

  NO posited su(2)/su(3)/g₂/SU(2)/SU(3)/G₂/Lie-group/rep as content, NO Mathlib ℝ/ℂ as content
  (ℚ is the coefficient field the `Module.End`/`Submodule`/`LinearMap`/`finrank` statements are
  WRITTEN IN, the N6/N16/N19/N22/N25/N42/N184–N189 precedent; the OBJECTS are the derived rungs
  `H ℚ` (N3) and `O ℚ = CD (H ℚ)` (N4), the imaginary subspaces `ImO` (N22) and `ImH`).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "colour / isospin / 7 / g₂ / su(2) /
  singlet / adjoint / branching / rep / gauge": what remains is the pure statement that for the
  Cayley–Dickson double `O ℚ = CD (H ℚ)`, the imaginary subspace `ker(star+1)` is the internal
  direct sum of the image of the imaginary base subspace under the two coordinate embeddings
  `a ↦ ⟨a,0⟩`, `b ↦ ⟨0,b⟩` together with the line through `⟨0,1⟩`, each preserved by every inner
  derivation `innerDeriv q ⟨a,b⟩ = ⟨adHom q a, adHom q b⟩`, with dimensions `3 + 1 + 3 = 7`.
  No theorem statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationRep7IsospinBranching
import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The two complementary coordinate embeddings + the componentwise intertwiners. -/

/-- THE OLD-LINE EMBEDDING `ιO : H ℚ → O ℚ`, `a ↦ ⟨a, 0⟩` — the first-coordinate copy of the
    quaternion rung inside `O ℚ = CD (H ℚ) = ⟨H, H⟩`, complementary to the new plane `κO`. -/
def iotaO : H ℚ →ₗ[ℚ] O ℚ where
  toFun a := ⟨a, 0⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

@[simp] theorem iotaO_apply (a : H ℚ) : iotaO a = (⟨a, 0⟩ : O ℚ) := rfl

theorem iotaO_injective : Function.Injective iotaO := by
  intro x y h; have := congrArg CD.re h; simpa [iotaO] using this

theorem kappaO_injective : Function.Injective (kappaO) := by
  intro x y h; have := congrArg CD.im h; simpa [kappaO] using this

/-- ★ THE OLD-LINE INTERTWINER: `innerDeriv q (ιO a) = ιO (adHom q a)`. The inner derivations
    act componentwise and `adHom q 0 = 0`, so the first coordinate carries the adjoint action. -/
theorem innerDeriv_iotaO (q a : H ℚ) :
    innerDeriv q (iotaO a) = iotaO (adHom q a) := by
  have h0 : adHom q (0 : H ℚ) = 0 := by simp
  ext <;> simp [innerDeriv_apply, iotaO, h0]

/-- ★ THE NEW-PLANE INTERTWINER: `innerDeriv q (κO b) = κO (adHom q b)`. Generalizes N189's
    `innerDeriv_kappaO_one` (the `b = 1` case, where `adHom q 1 = 0`). -/
theorem innerDeriv_kappaO_full (q b : H ℚ) :
    innerDeriv q (kappaO b) = kappaO (adHom q b) := by
  have h0 : adHom q (0 : H ℚ) = 0 := by simp
  ext <;> simp [innerDeriv_apply, kappaO, h0]

/-! ## The imaginary quaternion subspace `ImH` (mirror of N22's `ImO` one rung down). -/

/-- `star` as a ℚ-linear endomorphism of `H ℚ` (machinery on the derived object). -/
def starLH : Module.End ℚ (H ℚ) where
  toFun := star
  map_add' := star_add
  map_smul' := by
    intro q x; show star (q • x) = q • star x
    ext <;> simp [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

@[simp] theorem starLH_apply (x : H ℚ) : starLH x = star x := rfl

/-- THE IMAGINARY SUBSPACE `Im(H ℚ) := ker(star + id)` — the adjoint `3` carrier one rung down. -/
def ImH : Submodule ℚ (H ℚ) := LinearMap.ker (starLH + 1)

theorem mem_ImH {x : H ℚ} : x ∈ ImH ↔ star x = -x := by
  simp only [ImH, LinearMap.mem_ker, LinearMap.add_apply, starLH_apply,
    Module.End.one_apply]
  exact ⟨fun h => by linear_combination (norm := abel) h, fun h => by rw [h]; abel⟩

/-- The deep-real (scalar) component of a quaternion. -/
def reH (x : H ℚ) : ℚ := x.re.re

/-- THE TRACE IDENTITY one rung down: `x + star x = (2 reH x) • 1`. -/
theorem reH_trace (x : H ℚ) : x + star x = (2 * reH x) • (1 : H ℚ) := by
  ext <;> simp [reH] <;> ring

theorem one_ne_zero_H : (1 : H ℚ) ≠ 0 := by
  intro h; have hh := congrArg (fun z : H ℚ => z.re.re) h; simp at hh

/-- THE RANGE OF `star + id` IS THE UNIT LINE `ℚ·1` (the trace identity as a range statement). -/
theorem range_starLH_add_one :
    LinearMap.range (starLH + 1) = Submodule.span ℚ {(1 : H ℚ)} := by
  apply le_antisymm
  · rintro y ⟨x, rfl⟩
    have hx : (starLH + 1) x = (2 * reH x) • (1 : H ℚ) := by
      show star x + x = _; rw [add_comm]; exact reH_trace x
    rw [hx]; exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
  · rw [Submodule.span_le]
    rintro y hy
    simp only [Set.mem_singleton_iff] at hy; subst hy
    refine ⟨(1/2 : ℚ) • (1 : H ℚ), ?_⟩
    have hcalc : (starLH + 1) ((1/2 : ℚ) • (1:H ℚ))
        = (2 * reH ((1/2:ℚ) • (1:H ℚ))) • (1:H ℚ) := by
      show star ((1/2 : ℚ) • (1:H ℚ)) + ((1/2 : ℚ) • (1:H ℚ)) = _
      rw [add_comm]; exact reH_trace _
    rw [hcalc]
    have hr : reH ((1/2 : ℚ) • (1:H ℚ)) = 1/2 := by
      simp [reH, cd_qsmul_re, Dbl.smul_re]
    rw [hr]; norm_num

/-- ★★ `finrank ℚ Im(H ℚ) = 3`. Rank–nullity for `starLH + 1`: its range is the unit line
    `ℚ·1` (`range_starLH_add_one`), and `finrank (H ℚ) = 4` (banked N19 `finrank_H_eq_four`),
    so its kernel `ImH` has dimension `4 − 1 = 3` — the adjoint `3`, derived structurally
    (the W9 coordinate expansion AVOIDED, as at N19/N22). -/
theorem finrank_ImH_eq_three : Module.finrank ℚ ImH = 3 := by
  have hrk := LinearMap.finrank_range_add_finrank_ker (starLH + 1)
  rw [range_starLH_add_one, finrank_H_eq_four] at hrk
  have h1 : Module.finrank ℚ (Submodule.span ℚ {(1 : H ℚ)}) = 1 :=
    finrank_span_singleton one_ne_zero_H
  rw [h1] at hrk
  have h4 : 1 + Module.finrank ℚ ImH = 4 := hrk
  omega

/-! ## The three pieces are su(2)-invariant. -/

/-- `adHom q` preserves `ImH` for imaginary `q` — via the banked `adHom_star_comm`
    (`ad_q` commutes with `star` when `star q = −q`). -/
theorem adHom_mem_ImH {q : H ℚ} (hq : star q = -q) {a : H ℚ} (ha : a ∈ ImH) :
    adHom q a ∈ ImH := by
  rw [mem_ImH] at ha ⊢
  rw [← adHom_star_comm q hq, ha, map_neg]

/-- ★ The OLD adjoint `3` `A = ιO(ImH)` is `su(2)`-INVARIANT: `innerDeriv q` (imaginary `q`)
    maps it into itself. -/
theorem invariant_iotaImH {q : H ℚ} (hq : star q = -q) :
    ∀ x ∈ Submodule.map iotaO ImH, innerDeriv q x ∈ Submodule.map iotaO ImH := by
  rintro _ ⟨a, ha, rfl⟩
  rw [SetLike.mem_coe] at ha
  rw [innerDeriv_iotaO]
  exact Submodule.mem_map_of_mem (adHom_mem_ImH hq ha)

/-- ★ The NEW adjoint `3` `C = κO(ImH)` is `su(2)`-INVARIANT. -/
theorem invariant_kappaImH {q : H ℚ} (hq : star q = -q) :
    ∀ x ∈ Submodule.map kappaO ImH, innerDeriv q x ∈ Submodule.map kappaO ImH := by
  rintro _ ⟨b, hb, rfl⟩
  rw [SetLike.mem_coe] at hb
  rw [innerDeriv_kappaO_full]
  exact Submodule.mem_map_of_mem (adHom_mem_ImH hq hb)

/-! ## The decomposition `ImO = A ⊔ B ⊔ C` and the dimension identity `3 + 1 + 3 = 7`. -/

/-- ★★ THE FULL BRANCHING `ImO = ιO(ImH) ⊔ ℚ·e₄ ⊔ κO(ImH)`. Each piece is imaginary (`⊆`), and
    conversely every imaginary `x = ⟨a,b⟩` decomposes: `a ∈ ImH` (forced by `star x = −x`) and
    `b = (reH b)·1 + b'` with `b' ∈ ImH`, so `x = ιO a + (reH b)·e₄ + κO b'`. The explicit
    `7 = 1 ⊕ 3 ⊕ 3` decomposition of the `g₂` fundamental under the embedded `su(2)`. -/
theorem fullBranching_sup_eq_ImO :
    (Submodule.map iotaO ImH) ⊔ (Submodule.span ℚ {kappaO (1:H ℚ)})
        ⊔ (Submodule.map kappaO ImH) = ImO := by
  apply le_antisymm
  · apply sup_le
    apply sup_le
    · rintro _ ⟨a, ha, rfl⟩
      rw [SetLike.mem_coe, mem_ImH] at ha
      rw [mem_ImO]; ext <;> simp [iotaO, CD.star_re, CD.star_im, ha]
    · rw [Submodule.span_le, Set.singleton_subset_iff]; exact kappaO_one_mem_ImO
    · rintro _ ⟨b, hb, rfl⟩
      rw [mem_ImO]; ext <;> simp [kappaO, CD.star_re, CD.star_im]
  · intro x hx
    rw [mem_ImO] at hx
    have hre : star x.re = -x.re := by
      have := congrArg CD.re hx; simpa [CD.star_re, CD.neg_re] using this
    have hdecomp : x = iotaO x.re + kappaO x.im := by
      ext <;> simp [iotaO, kappaO]
    rw [hdecomp]
    apply Submodule.add_mem
    · apply Submodule.mem_sup_left; apply Submodule.mem_sup_left
      exact Submodule.mem_map_of_mem (by rw [mem_ImH]; exact hre)
    · -- κO x.im = (reH x.im)•e₄ + κO (x.im − (reH x.im)•1), second factor imaginary
      have hb_im : star (x.im - (reH x.im) • (1:H ℚ)) = -(x.im - (reH x.im) • (1:H ℚ)) := by
        have hsum := reH_trace x.im
        have hstar1 : star ((reH x.im) • (1:H ℚ)) = (reH x.im) • (1:H ℚ) := by
          ext <;> simp [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]
        rw [star_sub, hstar1]
        have key : star x.im = (2 * reH x.im) • (1:H ℚ) - x.im := by
          linear_combination (norm := abel) hsum
        rw [key, two_mul, add_smul]; abel
      have hsplit : kappaO x.im
          = (reH x.im) • kappaO (1:H ℚ) + kappaO (x.im - (reH x.im) • (1:H ℚ)) := by
        rw [← map_smul, ← map_add]; congr 1; module
      rw [hsplit]
      apply Submodule.add_mem
      · apply Submodule.mem_sup_left; apply Submodule.mem_sup_right
        exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _)
      · apply Submodule.mem_sup_right
        exact Submodule.mem_map_of_mem (by rw [mem_ImH]; exact hb_im)

/-- The OLD adjoint `3` has dimension `3` (`ιO` injective on `ImH`, `finrank ImH = 3`). -/
theorem finrank_iotaImH : Module.finrank ℚ (Submodule.map iotaO ImH) = 3 := by
  rw [(Submodule.equivMapOfInjective iotaO iotaO_injective ImH).symm.finrank_eq,
    finrank_ImH_eq_three]

/-- The NEW adjoint `3` has dimension `3`. -/
theorem finrank_kappaImH : Module.finrank ℚ (Submodule.map kappaO ImH) = 3 := by
  rw [(Submodule.equivMapOfInjective kappaO kappaO_injective ImH).symm.finrank_eq,
    finrank_ImH_eq_three]

/-- The SINGLET has dimension `1` (N189 `kappaO_one_ne_zero`). -/
theorem finrank_singletLine : Module.finrank ℚ (Submodule.span ℚ {kappaO (1:H ℚ)}) = 1 :=
  finrank_span_singleton kappaO_one_ne_zero

/-- ★★ THE DIMENSION IDENTITY `3 + 1 + 3 = 7` — the `7 = 1 ⊕ 3 ⊕ 3` branching dimensions:
    the two adjoint `3`'s, the singlet `1`, summing to `finrank ℚ ImO = 7` (banked N22). -/
theorem branching_dim_sum :
    Module.finrank ℚ (Submodule.map iotaO ImH)
      + Module.finrank ℚ (Submodule.span ℚ {kappaO (1:H ℚ)})
      + Module.finrank ℚ (Submodule.map kappaO ImH)
    = Module.finrank ℚ ImO := by
  rw [finrank_iotaImH, finrank_singletLine, finrank_kappaImH, finrank_ImO]

/-- ★ W8 NON-VACUITY: the embedded `su(2)` acts NONTRIVIALLY on the OLD adjoint `3` —
    `innerDeriv hI (ιO hJ) ≠ 0`, since `adHom hI hJ = hK − (−hK) = 2hK ≠ 0`. So the two `3`'s are
    GENUINE nonzero invariant summands carrying a nontrivial action, not a trivial decomposition. -/
theorem action_on_iotaImH_ne_zero : innerDeriv (hI : H ℚ) (iotaO hJ) ≠ 0 := by
  rw [innerDeriv_iotaO]
  intro h
  have hadj : adHom (hI : H ℚ) hJ = 0 := by
    have := congrArg CD.re h; simpa [iotaO] using this
  rw [adHom_apply, hI_hJ, hJ_hI, sub_neg_eq_add, hK_def] at hadj
  have hc := congrArg (fun z : H ℚ => z.im.im) hadj
  simp [Dbl.J, CD.add_im, Dbl.add_im] at hc

end

end Phys.Algebra
