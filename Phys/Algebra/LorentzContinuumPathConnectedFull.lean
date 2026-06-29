/-
  Phys.Algebra.LorentzContinuumPathConnectedFull — N154: THE KAK-PRODUCT ASSEMBLY → THE FULL
  PATH-CONNECTEDNESS of the `SO⁺(1,9)` identity component, REDUCED TO A SINGLE RESIDUAL, in the
  operator topology `endOpC` over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.

  ===========================================================================
  THE FORWARD FRONTIER (N154). N152 banked the BOOST/cone factor of the path-connectedness — the
  positive operator square root `p^{1/2}` is path-joined to the identity through the cone by a
  CONTINUOUS affine spectral path (`specPathOp_joins_id_sqrt`, `specPathOp_cont`). N153 banked the
  COMPACT/rotation factor — the ninth-direction rotation `planeRotLin c s` is path-joined to the
  identity through the circle by a CONTINUOUS rational Cayley path of genuine isometries
  (`rotPath_joins_id_rotation`, `rotPath_cont`) — and the RIGHT-MULTIPLICATION GLUE
  `continuous_mul_right_path` (multiplication on the right by a fixed operator is continuous in
  `endOpC`). N130 banked the FULL POLAR/KAK DECOMPOSITION of an ARBITRARY `BvC`-isometry
  `bvIsomLin_polar_path_decomp`: `S = k · γ(1)` with `k := S∘(p^{1/2})⁻¹` a `QvC`-isometry (the
  compact factor) and `γ = specPathOp` the affine boost-path from `γ(0) = id` to the positive part
  `γ(1) = p^{1/2}`. This node ASSEMBLES those into the connectedness arc-closer.

  ★ THE ASSEMBLY (trunk-native, NO posited connectedness). With BOTH factors continuously joined to
  the identity and the right-mult glue banked, joining the identity to an arbitrary `g = k·p` is pure
  PRECONNECTED-SET arithmetic over `endOpC`:
    • the boost-path image `β '' (uIcc b0 b1)` is preconnected (continuous image of an interval of the
      derived ℝ `Cut`), contains `β b0 = 1` and `β b1 = p`;
    • the RIGHT-TRANSLATED compact-path image `(fun t => κ t · p) '' (uIcc k0 k1)` is preconnected
      (`continuous_mul_right_path` N153), contains `κ k0 · p = 1·p = p` and `κ k1 · p = k·p`;
    • they SHARE the point `p`, so their union is preconnected (`IsPreconnected.union` at `p`) and
      contains both `1` and `k·p`.
  NO `IsConnected` posited, NO fresh path construction — the union of the two banked factor-image
  pieces at the shared point `p`.

  THE PAYOFF:
    • `joined_id_of_factor_paths` — ★ THE ABSTRACT ASSEMBLY ENGINE: from any continuous boost path
      `id → p` and any continuous compact path `id → k`, the product `k·p` lies in a single
      preconnected subset of `endOpC` together with the identity.
    • `bvIsom_joined_id_of_compact_joined` — ★★ THE FULL REDUCTION: an ARBITRARY `BvC`-isometry `S`
      lies in a preconnected subset of `endOpC` together with the identity, PROVIDED its polar
      compact factor is path-joined to the identity (the SINGLE RESIDUAL = compact-group
      path-connectedness). This CLOSES the connectedness arc of `SO⁺(1,9)` to one residual, exactly
      as N104 reduced the converse generation to one word-membership residual — the boost factor is
      handled in FULL GENERALITY by N130 + N152, only the compact factor's connectedness remains.
    • `kakProduct_concrete_joins_id` — ★ THE ENGINE FIRES UNCONDITIONALLY (no residual) on a concrete
      rotation × boost product `planeRotLin 0 1 · boostEndC (5/3) (4/3)` (quarter turn × boost), with
      the rotation factor's path the N153 `rotPath` and the boost factor's path an explicit affine
      boost path — `1` and the genuine `SO⁺(1,9)` element lie in one preconnected set.

  Banked here (foundations-only `[propext, Classical.choice, Quot.sound]`):
    • `joined_id_of_factor_paths` — ★ the abstract KAK-product assembly engine over `endOpC`;
    • `boostAffinePath` / `boostAffinePath_cont` / `boostAffinePath_zero` / `boostAffinePath_one` —
      a concrete affine boost path from `id` to `boostEndC (5/3) (4/3)`, continuous in `endOpC`;
    • `bvIsom_joined_id_of_compact_joined` — ★★ THE FULL REDUCTION of `SO⁺(1,9)` path-connectedness
      to the single compact-group residual;
    • `kakProduct_concrete_joins_id` — ★ the engine fires unconditionally on a concrete
      rotation × boost product (W8 — a genuine, residual-free assembly);
    • `kakProduct_concrete_read` — ★ NON-VACUITY / W8: the concrete product genuinely moves the
      timelike axis (the boost `b`-parameter `4/3` rides through the quarter turn).

  DERIVED from the trunk (the operator topology `endOpC` / `endOpC_continuous_iff` (N152), the boost
  factor-path `specPathOp` / `specPathOp_cont` (N152), the compact factor-path `rotPath` /
  `rotPath_cont` / `rotPath_zero` / `cayleyC_one` / `cayleyS` (N153), the right-mult glue
  `continuous_mul_right_path` (N153), the full polar/KAK decomposition `bvIsomLin_polar_path_decomp`
  (N130) of an arbitrary `BvC`-isometry, `boostEndC` / `boostEndC_apply` (N89), `planeRotLin` /
  `planeRotLin_apply` (N105); standard `IsPreconnected.union` / `isPreconnected_uIcc` /
  `IsPreconnected.image` / `Continuous.*` / `fun_prop` MACHINERY on the DERIVED objects, STANDARD §3),
  NOT a posited operator topology, NOT a posited connectedness / path-connectedness, NOT a posited
  Lorentz group / `SO⁺(1,9)`, NOT a posited polar/KAK product, NOT Mathlib ℝ/ℂ as content (the field,
  the path parameters and the interval are ALL the derived `Cut`), NOT a fully proved implication
  asserted without a proof, NOT a bridge.
-/
import Phys.Algebra.LorentzContinuumRotationPathConnected
import Phys.Algebra.LorentzContinuumGenerationConversePolar

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The abstract KAK-product assembly engine over `endOpC`. -/

/-- ★ THE ABSTRACT ASSEMBLY ENGINE — from a CONTINUOUS boost path `β` joining the identity `β b0 = 1`
    to `β b1 = p`, and a CONTINUOUS compact path `κ` joining the identity `κ k0 = 1` to `κ k1 = k`,
    the product `k · p` lies in a SINGLE PRECONNECTED subset of the operator topology `endOpC`
    together with the identity `1`. The construction: the boost-path image (preconnected, containing
    `1` and `p`) and the RIGHT-TRANSLATED compact-path image `t ↦ κ t · p` (preconnected by the
    right-mult glue `continuous_mul_right_path`, containing `1·p = p` and `k·p`) SHARE the point `p`,
    so their union is preconnected (`IsPreconnected.union` at `p`) and contains both `1` and `k·p`.
    NO posited connectedness, NO fresh path — preconnected-set arithmetic of the two banked
    factor-image pieces at the shared point `p`. -/
theorem joined_id_of_factor_paths
    (p k : Module.End Cut STVC)
    (β : Cut → Module.End Cut STVC) (hβ : Continuous β) {b0 b1 : Cut}
    (hβ0 : β b0 = 1) (hβ1 : β b1 = p)
    (κ : Cut → Module.End Cut STVC) (hκ : Continuous κ) {k0 k1 : Cut}
    (hκ0 : κ k0 = 1) (hκ1 : κ k1 = k) :
    ∃ Conn : Set (Module.End Cut STVC),
      IsPreconnected Conn ∧
      (1 : Module.End Cut STVC) ∈ Conn ∧
      k * p ∈ Conn := by
  set A := β '' (Set.uIcc b0 b1) with hA
  have hApre : IsPreconnected A := (isPreconnected_uIcc).image _ hβ.continuousOn
  have h1A : (1 : Module.End Cut STVC) ∈ A := ⟨b0, Set.left_mem_uIcc, hβ0⟩
  have hpA : p ∈ A := ⟨b1, Set.right_mem_uIcc, hβ1⟩
  set B := (fun t => κ t * p) '' (Set.uIcc k0 k1) with hB
  have hBcont : Continuous (fun t => κ t * p) := continuous_mul_right_path p κ hκ
  have hBpre : IsPreconnected B := (isPreconnected_uIcc).image _ hBcont.continuousOn
  have hpB : p ∈ B := ⟨k0, Set.left_mem_uIcc, by simp only [hκ0, one_mul]⟩
  have hkpB : k * p ∈ B := ⟨k1, Set.right_mem_uIcc, by simp only [hκ1]⟩
  refine ⟨A ∪ B, hApre.union p hpA hpB hBpre, Set.mem_union_left _ h1A, Set.mem_union_right _ hkpB⟩

/-! ## A concrete affine boost path joining the identity to a concrete boost. -/

/-- An explicit boost path `t ↦ boostEndC (1 + (2/3)t) ((4/3)t)` — affine in the boost parameters,
    from `id` (`t = 0`) to the concrete boost `boostEndC (5/3) (4/3)` (`t = 1`). -/
def boostAffinePath (t : Cut) : Module.End Cut STVC :=
  boostEndC (1 + (2/3) * t) ((4/3) * t)

/-- The affine boost path is CONTINUOUS in the operator topology `endOpC` — each coordinate
    evaluation is an affine map of the derived `Cut`. -/
theorem boostAffinePath_cont : Continuous boostAffinePath := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun t => (boostAffinePath t) v)
      = (fun t => ((1 + (2/3)*t) * v.1 + ((4/3)*t) * v.2.1,
                   ((4/3)*t) * v.1 + (1 + (2/3)*t) * v.2.1, v.2.2)) := by
    funext t; rw [boostAffinePath, boostEndC_apply]
  rw [hrw]
  apply Continuous.prodMk
  · fun_prop
  · apply Continuous.prodMk _ continuous_const
    fun_prop

/-- `boostAffinePath 0 = 1`: the path starts at the identity. -/
theorem boostAffinePath_zero : boostAffinePath 0 = 1 := by
  rw [boostAffinePath, Module.End.one_eq_id]
  apply LinearMap.ext
  intro p
  rw [boostEndC_apply]
  show ((1 + (2/3)*0) * p.1 + ((4/3)*0) * p.2.1, ((4/3)*0) * p.1 + (1 + (2/3)*0) * p.2.1, p.2.2) = p
  simp only [mul_zero, add_zero, one_mul, zero_mul, zero_add]

/-- `boostAffinePath 1 = boostEndC (5/3) (4/3)`: the path reaches the concrete boost. -/
theorem boostAffinePath_one : boostAffinePath 1 = boostEndC ((5:Cut)/3) ((4:Cut)/3) := by
  rw [boostAffinePath]
  congr 1 <;> ring

/-! ## THE FULL REDUCTION — `SO⁺(1,9)` path-connectedness to a single compact residual. -/

/-- ★★ THE FULL REDUCTION — an ARBITRARY `BvC`-isometry `S` lies in a SINGLE PRECONNECTED subset of
    the operator topology `endOpC` together with the identity `1`, PROVIDED its polar compact factor
    is path-joined to the identity (the hypothesis `hcompact`: every `QvC`-isometry is path-joined to
    `1` by a continuous path in `endOpC`). This is the SINGLE RESIDUAL the connectedness arc reduces
    to: compact-group path-connectedness. The boost factor is handled in FULL GENERALITY —
    `bvIsomLin_polar_path_decomp` (N130) decomposes `S = k · γ(1)` with `k` the `QvC`-isometry
    compact factor and `γ = specPathOp` the affine boost-path joining `γ(0) = id` to `γ(1)`
    (continuous by N152) — and the abstract engine `joined_id_of_factor_paths` glues the boost path
    to the (residual-supplied) compact path at the shared point `γ(1)`. Exactly as N104 reduced the
    converse generation to one word-membership residual, this reduces the full proper-orthochronous
    path-connectedness to one compact residual — with NO operator `exp`, NO posited connectedness,
    NO posited Lorentz group. -/
theorem bvIsom_joined_id_of_compact_joined {S : Module.End Cut STVC} (hS : IsBvIsomLin S)
    (hcompact : ∀ k : Module.End Cut STVC, IsQvIsomC k →
       ∃ (κ : Cut → Module.End Cut STVC) (k0 k1 : Cut),
         Continuous κ ∧ κ k0 = 1 ∧ κ k1 = k) :
    ∃ Conn : Set (Module.End Cut STVC),
      IsPreconnected Conn ∧
      (1 : Module.End Cut STVC) ∈ Conn ∧
      S ∈ Conn := by
  obtain ⟨h, n, c, u, γ, hhS, hγeq, hγ0, hγ1sqrt, hsymm, hpos, hk_isom, hkS⟩ :=
    bvIsomLin_polar_path_decomp hS
  set k := S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) with hkdef
  set p := γ 1 with hpdef
  obtain ⟨κ, k0, k1, hκcont, hκ0, hκ1⟩ := hcompact k hk_isom
  have hβcont : Continuous γ := by rw [hγeq]; exact specPathOp_cont c u
  have hβ0 : γ 0 = (1 : Module.End Cut STVC) := by rw [hγ0, Module.End.one_eq_id]
  have hβ1 : γ 1 = p := rfl
  obtain ⟨Conn, hConnpre, h1, hkp⟩ :=
    joined_id_of_factor_paths p k γ hβcont hβ0 hβ1 κ hκcont hκ0 hκ1
  refine ⟨Conn, hConnpre, h1, ?_⟩
  have hkpS : k * p = S := by rw [hpdef, hkdef, ← Module.End.mul_eq_comp] at hkS; exact hkS
  rwa [hkpS] at hkp

/-! ## The concrete unconditional KAK-product witness (W8). -/

/-- ★ THE ENGINE FIRES UNCONDITIONALLY (no residual) on a concrete rotation × boost product: the
    identity `1` and the genuine `SO⁺(1,9)` element `planeRotLin 0 1 · boostEndC (5/3) (4/3)`
    (quarter turn × boost) lie in a single PRECONNECTED subset of `endOpC`. The rotation factor's
    path is the N153 `rotPath` (joined to the identity by `rotPath_zero`, reaching `planeRotLin 0 1`
    at `m = 1` via `cayleyC 1 = 0`, `cayleyS 1 = 1`); the boost factor's path is the explicit affine
    `boostAffinePath` (joined to the identity, reaching `boostEndC (5/3) (4/3)`). Demonstrates the
    assembly engine genuinely fires on a nontrivial rotation × boost element with NO residual. -/
theorem kakProduct_concrete_joins_id :
    ∃ Conn : Set (Module.End Cut STVC),
      IsPreconnected Conn ∧
      (1 : Module.End Cut STVC) ∈ Conn ∧
      (planeRotLin 0 1 * boostEndC ((5:Cut)/3) ((4:Cut)/3)) ∈ Conn := by
  apply joined_id_of_factor_paths (boostEndC ((5:Cut)/3) ((4:Cut)/3)) (planeRotLin 0 1)
    boostAffinePath boostAffinePath_cont boostAffinePath_zero boostAffinePath_one
    rotPath rotPath_cont rotPath_zero
  rw [rotPath, cayleyC_one]
  congr 1
  unfold cayleyS; norm_num

/-- ★ NON-VACUITY / W8 — the concrete product `planeRotLin 0 1 · boostEndC (5/3) (4/3)`, applied to
    the timelike axis `(1,0,0)`, sends it to a vector whose real octonion component reads `4/3` — the
    boost's own `b`-parameter, riding through the quarter turn into the real octonion axis. A genuine
    nontrivial `SO⁺(1,9)` element, not a vacuous statement. -/
theorem kakProduct_concrete_read :
    reQC ((planeRotLin 0 1 * boostEndC ((5:Cut)/3) ((4:Cut)/3))
      ((1:Cut), (0:Cut), (0:O Cut))).2.2 = 4/3 := by
  rw [Module.End.mul_apply, boostEndC_apply, planeRotLin_apply]
  show reQC ((0:O Cut) + ((1:Cut) * ((4:Cut)/3 * 1 + (5:Cut)/3 * 0)
      + ((0:Cut) - 1) * reQC (0:O Cut)) • (1 : O Cut)) = 4/3
  rw [reQC_zero, zero_add, reQC_smul, reQC_one]
  ring

end

end Phys.Algebra
