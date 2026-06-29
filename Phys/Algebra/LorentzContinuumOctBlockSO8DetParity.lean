/-
  N162 — THE DET-PARITY CLOSURE BRIDGE.

  Closes the FULL octonion-block `SO(8)` identity component UNCONDITIONALLY: every det `+1`
  `gFormC`-isometry `S` of the terminal-algebra octonion block `O Cut` lifts to the NON-VACUOUS
  rotation path component `JoinedIdQvC (octBlockEndC S)` — no orthonormality, no parity hypothesis,
  no posited connectedness.

  ── WHERE THIS SITS (what the chain produced; what this node closes) ──
  N124 (`gFormC_isom_mem_closure`) banked: every `gFormC`-isometry of `O Cut` is a finite product of
  Householder reflections — membership in `Submonoid.closure houseHolderSet`, a FLAT reflection word
  of UNKNOWN length parity. N161 (`joinedIdQvC_octBlockEndC_bireflection` /
  `..._bireflectionWord`) banked: the lifted GENERAL bireflection (= product of TWO Householder
  reflections of ANY two nonzero-Born-norm axes) is `JoinedIdQvC`, and any finite product of such
  bireflections lifts. The SINGLE residual joining the two: certify that a det `+1` isometry's
  reflection word has EVEN length, then re-pair it two-at-a-time into general bireflections.

  ── WHAT THIS NODE DERIVES (the residual, foundations-only) ──
  THE ONE LAW / MEASURE-FIRST: the residual is NOT a fresh exhaustion and NOT a re-derivation of the
  bireflection (both banked). It is exactly the determinant homomorphism tracking word-length parity:
  • `det_houseHolder` — `LinearMap.det (houseHolder a) = -1` for `gFormC a a ≠ 0`. DERIVED by the
    Sylvester (Weinstein–Aronszajn) flip through the `LinearMap.toMatrix` translation: `houseHolder a
    = id − g ∘ₗ f` (`g = toSpanSingleton a`, `f = (2·(gFormC a a)⁻¹)·gFormCRight a`), and on the
    1-dim `Cut` side `f ∘ₗ g = 2·id`, so `det = 1 − 2 = −1`. (`Matrix.det_one_sub_mul_comm` on the
    derived `Cut`, NO posited determinant homomorphism — `LinearMap.det` is Mathlib MACHINERY on the
    DERIVED `O Cut`.)
  • `joinedIdQvC_octBlockEndC_evenReflWord` — any EVEN-length list of nonzero-Born-norm axes: the
    embedded product of Householder reflections is `JoinedIdQvC`. Two-at-a-time recursion feeding
    N161's single-bireflection core through `octBlockEndC_mul` + the engine `joinedIdQvC_mul`.
  • `axesWord_of_reflList` / `isom_eq_axesWord` — re-express N124's `Submonoid.closure` membership
    (`Submonoid.exists_list_of_mem_closure`) as an embedded product over a list of nonzero-Born-norm
    AXES.
  • `det_houseHolderWord` — `det ((L.map houseHolder).prod) = (−1)^L.length` via the multiplicative
    `LinearMap.det` (`MonoidHom.map_list_prod`).
  • ★★ `joinedIdQvC_octBlockEndC_of_det_one` — THE BRIDGE: `det S = 1` forces `Even L.length`
    (`neg_one_pow_eq_one_iff_even`), hence the pairing core lifts `octBlockEndC S` to `JoinedIdQvC`.
  W8 (NON-VACUITY): `joinedIdQvC_octBlockEndC_e2je2_via_det` — the genuinely NON-orthonormal product
  `houseHolder e₂ · houseHolder (e₂+je2)` MOVES `e₂+je2 ↦ e₂−je2` (N161), has `det = 1` computed
  THROUGH the new homomorphism, and is `JoinedIdQvC` by THIS bridge (det-parity route, not the
  direct N161 lift).

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "rotation / reflection / Householder / bireflection / isometry / SO(8) / determinant /
  parity / even / word / closure / path-connected / Lorentz / Cartan / Dieudonné": over the derived
  complete ordered field `Cut` the lemmas say — each `houseHolder a` is an involutive
  rank-one-perturbation map with `LinearMap.det = −1`; a finite product of them whose total
  `LinearMap.det` is `1` has an even factor count; and the `octBlockEndC` image of such a product
  lies in a preconnected set of `gFormC`-form-preserving operators containing `1`. Pure linear
  algebra over the derived field; no theorem statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `LinearMap.det` /
  `Matrix.det_one_sub_mul_comm` are MACHINERY on the derived `O Cut`), NO posited Lorentz group,
  NO posited determinant/parity homomorphism, NO posited connectedness.
-/
import Phys.Algebra.LorentzContinuumOctBlockSO8ClosureWord
import Mathlib.LinearAlgebra.Matrix.SchurComplement
import Mathlib.LinearAlgebra.Determinant
import Mathlib.Algebra.Ring.Parity

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators Matrix

/-! ## THE EVEN-PAIRING CORE — every even reflection word lifts to the NON-VACUOUS `JoinedIdQvC`. -/

/-- ★ THE EVEN-PAIRING CORE (det-free, trunk-native). Any EVEN-length list of nonzero-Born-norm
    axes: the embedded product of Householder reflections is `JoinedIdQvC`. Two-at-a-time recursion
    pairing each `houseHolder a · houseHolder b` into N161's single-bireflection core
    `joinedIdQvC_octBlockEndC_bireflection`, glued by the multiplicative lift `octBlockEndC_mul`
    and the engine `joinedIdQvC_mul` (N157). The exact shape the det `+1` part of N124's reflection
    word produces once paired. -/
theorem joinedIdQvC_octBlockEndC_evenReflWord :
    ∀ (L : List (O Cut)), (∀ a ∈ L, gFormC a a ≠ 0) → Even L.length →
      JoinedIdQvC (octBlockEndC ((L.map houseHolder).prod))
  | [], _, _ => by
      simp only [List.map_nil, List.prod_nil, octBlockEndC_one]; exact joinedIdQvC_one
  | [a], _, hev => by
      simp only [List.length_singleton] at hev
      exact absurd hev (by decide)
  | a :: b :: L, hmem, hev => by
      have ha : gFormC a a ≠ 0 := hmem a (by simp)
      have hb : gFormC b b ≠ 0 := hmem b (by simp)
      have hLmem : ∀ x ∈ L, gFormC x x ≠ 0 := fun x hx => hmem x (by simp [hx])
      have hLev : Even L.length := by
        simpa [List.length_cons, Nat.add_comm, Nat.even_add] using hev
      simp only [List.map_cons, List.prod_cons]
      rw [← mul_assoc, octBlockEndC_mul]
      refine joinedIdQvC_mul (joinedIdQvC_octBlockEndC_bireflection a b ha hb) ?_
      exact joinedIdQvC_octBlockEndC_evenReflWord L hLmem hLev

/-! ## THE DETERMINANT — each Householder reflection has `LinearMap.det = −1`. -/

/-- The rank-one functional factor `f a := (2·(gFormC a a)⁻¹) • gFormCRight a : O Cut →ₗ[Cut] Cut`. -/
def hhDetF (a : O Cut) : O Cut →ₗ[Cut] Cut := (2 * (gFormC a a)⁻¹) • gFormCRight a

/-- The rank-one axis factor `g a := toSpanSingleton a : Cut →ₗ[Cut] O Cut`. -/
def hhDetG (a : O Cut) : Cut →ₗ[Cut] O Cut := LinearMap.toSpanSingleton Cut (O Cut) a

/-- `houseHolder a = id − g ∘ₗ f` — the rank-one-perturbation factorization. -/
theorem houseHolder_eq_id_sub_comp (a : O Cut) :
    houseHolder a = LinearMap.id - (hhDetG a).comp (hhDetF a) := by
  apply LinearMap.ext; intro v
  rw [houseHolder_apply]
  simp only [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.comp_apply, hhDetG, hhDetF,
    LinearMap.smul_apply, LinearMap.toSpanSingleton_apply, smul_eq_mul, gFormCRight]
  rfl

/-- On the 1-dim `Cut` side the composite flips to `f ∘ₗ g = 2·id` (`gFormC a a ≠ 0`). -/
theorem houseHolder_factor_one_dim (a : O Cut) (ha : gFormC a a ≠ 0) :
    (hhDetF a).comp (hhDetG a) = (2 : Cut) • LinearMap.id := by
  apply LinearMap.ext; intro t
  simp only [LinearMap.comp_apply, hhDetG, hhDetF, LinearMap.smul_apply, LinearMap.id_apply,
    LinearMap.toSpanSingleton_apply, map_smul, smul_eq_mul]
  show t * (2 * (gFormC a a)⁻¹ * gFormC a a) = 2 * t
  field_simp

/-- ★ THE DETERMINANT — `LinearMap.det (houseHolder a) = −1` for `gFormC a a ≠ 0`. Sylvester
    (Weinstein–Aronszajn) through the `LinearMap.toMatrix` translation on the chosen basis of
    `O Cut` and the singleton basis of `Cut`: `toMatrix (id − g∘f) = 1 − (toMatrix g)(toMatrix f)`,
    flipped by `Matrix.det_one_sub_mul_comm` to `det (1 − (toMatrix f)(toMatrix g))`, and
    `f ∘ₗ g = 2·id` on the 1-dim `Cut`, so the flipped `1×1` matrix is `1 − 2 = −1`. `LinearMap.det`
    is Mathlib MACHINERY on the DERIVED `O Cut`, NOT a posited homomorphism. -/
theorem det_houseHolder (a : O Cut) (ha : gFormC a a ≠ 0) :
    LinearMap.det (houseHolder a) = -1 := by
  classical
  set b := Module.Free.chooseBasis Cut (O Cut) with hb
  set bs := Module.Basis.singleton Unit Cut with hbs
  rw [houseHolder_eq_id_sub_comp a, ← LinearMap.det_toMatrix b]
  rw [map_sub, LinearMap.toMatrix_id, LinearMap.toMatrix_comp b bs b]
  rw [Matrix.det_one_sub_mul_comm (LinearMap.toMatrix bs b (hhDetG a))
        (LinearMap.toMatrix b bs (hhDetF a))]
  rw [← LinearMap.toMatrix_comp bs b bs, houseHolder_factor_one_dim a ha]
  simp only [map_smul, LinearMap.toMatrix_id]
  rw [Matrix.det_unique]
  simp only [Matrix.sub_apply, Matrix.smul_apply, Matrix.one_apply_eq, smul_eq_mul]
  norm_num

/-! ## THE CLOSURE WORD as a list of AXES, and its determinant. -/

/-- `(-1 : Cut) ≠ 1` — the derived `Cut` is an ordered field with `0 < 1`. -/
theorem cut_neg_one_ne_one : (-1 : Cut) ≠ 1 := by
  intro h; nlinarith [(one_pos : (0:Cut) < 1)]

/-- A flat list of reflection-alphabet elements re-expresses as an embedded product over a list of
    nonzero-Born-norm AXES (recursion peeling each element to its axis). -/
theorem axesWord_of_reflList :
    ∀ (l : List (Module.End Cut (O Cut))), (∀ R ∈ l, R ∈ houseHolderSet) →
      ∃ L : List (O Cut), (∀ a ∈ L, gFormC a a ≠ 0) ∧ (L.map houseHolder).prod = l.prod
  | [], _ => ⟨[], by simp, by simp⟩
  | R :: t, h => by
      obtain ⟨a, ha, hRa⟩ := h R (List.mem_cons_self ..)
      obtain ⟨L, hLmem, hLprod⟩ :=
        axesWord_of_reflList t (fun S hS => h S (List.mem_cons_of_mem R hS))
      refine ⟨a :: L, ?_, ?_⟩
      · intro x hx
        rcases List.mem_cons.mp hx with rfl | hx
        · exact ha
        · exact hLmem x hx
      · simp only [List.map_cons, List.prod_cons, hLprod, hRa]

/-- THE AXES-WORD form of N124's closure exhaustion: every `gFormC`-isometry `S` of `O Cut` is the
    embedded product `(L.map houseHolder).prod` over a list `L` of nonzero-Born-norm axes
    (`Submonoid.exists_list_of_mem_closure` on N124's `gFormC_isom_mem_closure`, each element peeled
    to its axis by `axesWord_of_reflList`). -/
theorem isom_eq_axesWord (S : O Cut →ₗ[Cut] O Cut) (hS : IsGFormCIsom S) :
    ∃ L : List (O Cut), (∀ a ∈ L, gFormC a a ≠ 0) ∧ (L.map houseHolder).prod = S := by
  obtain ⟨l, hl_mem, hl_prod⟩ :=
    Submonoid.exists_list_of_mem_closure (gFormC_isom_mem_closure S hS)
  obtain ⟨L, hLmem, hLprod⟩ := axesWord_of_reflList l hl_mem
  exact ⟨L, hLmem, hLprod.trans hl_prod⟩

/-- THE WORD DETERMINANT — `LinearMap.det ((L.map houseHolder).prod) = (−1)^L.length`, via the
    multiplicative `LinearMap.det` (`MonoidHom.map_list_prod`) and `det_houseHolder` on each axis. -/
theorem det_houseHolderWord (L : List (O Cut)) (hL : ∀ a ∈ L, gFormC a a ≠ 0) :
    LinearMap.det ((L.map houseHolder).prod) = (-1 : Cut) ^ L.length := by
  rw [MonoidHom.map_list_prod (LinearMap.det : (O Cut →ₗ[Cut] O Cut) →* Cut) (L.map houseHolder)]
  rw [List.map_map]
  have : (L.map ((fun a => LinearMap.det a) ∘ houseHolder)) = L.map (fun _ => (-1 : Cut)) := by
    apply List.map_congr_left
    intro a ha
    exact det_houseHolder a (hL a ha)
  rw [this]
  rw [List.prod_eq_pow_card _ (-1 : Cut)
        (by intro x hx; rw [List.mem_map] at hx; obtain ⟨_, _, rfl⟩ := hx; rfl)]
  rw [List.length_map]

/-! ## ★★ THE BRIDGE — every det `+1` isometry lifts to the NON-VACUOUS `JoinedIdQvC`. -/

/-- ★★ THE DET-PARITY CLOSURE BRIDGE — every det `+1` (`SO(8)`) `gFormC`-isometry `S` of `O Cut`
    lifts to the NON-VACUOUS rotation path component `JoinedIdQvC (octBlockEndC S)`. N124's reflection
    word gives `S = (L.map houseHolder).prod`; the multiplicative determinant forces
    `(−1)^L.length = det S = 1`, hence `Even L.length` (`neg_one_pow_eq_one_iff_even`,
    `cut_neg_one_ne_one`); the even-pairing core then lifts `octBlockEndC S` into `JoinedIdQvC`.
    The full octonion-block `SO(8)` identity component reached UNCONDITIONALLY, into the NON-VACUOUS
    target — no orthonormality, no parity hypothesis, no posited connectedness. -/
theorem joinedIdQvC_octBlockEndC_of_det_one (S : O Cut →ₗ[Cut] O Cut)
    (hS : IsGFormCIsom S) (hdet : LinearMap.det S = 1) :
    JoinedIdQvC (octBlockEndC S) := by
  obtain ⟨L, hLmem, hLprod⟩ := isom_eq_axesWord S hS
  have heven : Even L.length := by
    have hd : (-1 : Cut) ^ L.length = 1 := by
      rw [← det_houseHolderWord L hLmem, hLprod, hdet]
    exact (neg_one_pow_eq_one_iff_even cut_neg_one_ne_one).mp hd
  rw [← hLprod]
  exact joinedIdQvC_octBlockEndC_evenReflWord L hLmem heven

/-! ## W8 NON-VACUITY — a NON-orthonormal det `+1` isometry that MOVES an axis, via THIS bridge. -/

/-- The product `houseHolder e₂ · houseHolder (e₂+je2)` has `LinearMap.det = 1` — computed THROUGH
    the new determinant homomorphism (`det_comp` + `det_houseHolder` on each factor:
    `(−1)·(−1) = 1`), NOT assumed. The genuinely NON-orthonormal pair (`gFormC e₂ (e₂+je2) = 1 ≠ 0`,
    `e2_plus_je2_gFormC_self`). -/
theorem det_e2je2_product :
    LinearMap.det
      (houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut))) = 1 := by
  have hbne : gFormC ((CD.e2 : O Cut) + (je2 : O Cut)) ((CD.e2 : O Cut) + (je2 : O Cut)) ≠ 0 := by
    rw [e2_plus_je2_gFormC_self]; norm_num
  have he2 : gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) ≠ 0 := by
    rw [e2_gFormC_self]; norm_num
  rw [show (houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut)))
        = (houseHolder (CD.e2 : O Cut)).comp (houseHolder ((CD.e2 : O Cut) + (je2 : O Cut))) from rfl]
  rw [LinearMap.det_comp, det_houseHolder _ he2, det_houseHolder _ hbne]
  norm_num

/-- ★ W8 — the genuinely NON-orthonormal, axis-MOVING det `+1` isometry
    `houseHolder e₂ · houseHolder (e₂+je2)` (sends `e₂+je2 ↦ e₂−je2`, `bireflection_e2je2plus_moves`,
    reads `−1` on the moved slot, `bireflection_e2je2plus_moves_read`) is `JoinedIdQvC` BY THE NEW
    DET-PARITY BRIDGE — its determinant `1` established through the homomorphism (`det_e2je2_product`),
    NOT through N161's direct lift. A non-trivial element of the NON-VACUOUS path component certified
    by the parity route. -/
theorem joinedIdQvC_octBlockEndC_e2je2_via_det :
    JoinedIdQvC (octBlockEndC
      (houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut)))) := by
  have hbne : gFormC ((CD.e2 : O Cut) + (je2 : O Cut)) ((CD.e2 : O Cut) + (je2 : O Cut)) ≠ 0 := by
    rw [e2_plus_je2_gFormC_self]; norm_num
  have he2 : gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) ≠ 0 := by
    rw [e2_gFormC_self]; norm_num
  have hIsom : IsGFormCIsom
      (houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut))) :=
    (houseHolder_isom he2).comp (houseHolder_isom hbne)
  exact joinedIdQvC_octBlockEndC_of_det_one _ hIsom det_e2je2_product

end
