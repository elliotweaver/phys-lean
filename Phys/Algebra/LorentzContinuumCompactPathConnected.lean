/-
  Phys.Algebra.LorentzContinuumCompactPathConnected — N155: THE COMPACT WORD-INDUCTION ASSEMBLY
  — the SET-FORM path-component engine `JoinedIdC`, its SUBMONOID structure, and the CONDITIONAL
  FULL `SO⁺(1,9)` path-connectedness, in the operator topology `endOpC` over the DERIVED ℝ `Cut`
  and the terminal algebra `O Cut := CD (H Cut)`.

  ===========================================================================
  THE FORWARD FRONTIER (N155). N154 (`LorentzContinuumPathConnectedFull`) reduced the FULL
  `SO⁺(1,9)` path-connectedness to ONE residual via `bvIsom_joined_id_of_compact_joined`: an
  arbitrary `BvC`-isometry `S` lies in a preconnected subset of `endOpC` with the identity,
  PROVIDED its polar compact factor `k := S∘(p^{1/2})⁻¹` is joined to the identity by a CONTINUOUS
  PATH (the `hcompact` hypothesis, in path-FUNCTION form `∃ κ k0 k1, Continuous κ ∧ κ k0 = 1 ∧
  κ k1 = k`). The genuinely-new open structure: discharge that residual for the GENERAL compact
  factor.

  ── MEASURE-FIRST FINDING (THE ONE LAW — what the chain ACTUALLY produced) ──
  N105 (`...WordMembershipObstruction`) PROVED the literal residual (R) "every EvC-orthogonal
  `QvC`-isometry IS a `biMulLin` word" is FALSE for the `biMulLin` alphabet — the ninth-direction
  (`x ↔ 𝕆`) rotations are not reached (`xNegLin_not_mem_genIsomMonoidLin`,
  `planeRotLin_not_mem_genIsomMonoidLin`). N106 (`...EnlargedAlphabet`) enlarged the alphabet by
  `planeRotLin`; N114/N116 (`...FullSO9Assembly`/`...ExhaustionAssembly`) left the FULL `SO(9)`
  exhaustion — every compact `QvC`-isometry as a finite PRODUCT of joined 2-plane rotation factors
  — as the explicit CHILDED HEAVY remainder, NOT banked. And the single Cayley chart `rotPath`
  reaches only the circle MINUS the antipode (`rotPath_joins_id_rotation` requires `1 + c ≠ 0`).
  ∴ the UNCONDITIONAL discharge of `hcompact` rests on the heavy open word-membership/exhaustion
  residual — a genuine W1/W9 HEAVY node, NOT a one-run grind.

  ── THE REFRAME (THE ONE LAW / trunk-native — what THIS node BANKS) ──
  N154's `hcompact` is in PATH-FUNCTION form, which does NOT compose under products: there is no
  `Path.trans`/`unitInterval` over the derived `Cut`, so "compact factor = a product of joined
  rotations" cannot be glued path-by-path. The trunk-native object is the PRECONNECTED-SET form:

      `JoinedIdC g := ∃ Conn, IsPreconnected Conn ∧ 1 ∈ Conn ∧ g ∈ Conn`

  — "g lies in a single preconnected subset of `endOpC` together with the identity". This form IS
  closed under multiplication: `JoinedIdC a → JoinedIdC b → JoinedIdC (a*b)`, by right-translating
  `a`'s witness set `A` to `A·b` (preconnected by the right-mult glue `endOpC_mul_right_cont` N153),
  which contains `1·b = b` and `a·b`, and unioning with `b`'s witness set `B` at the SHARED point
  `b` (`IsPreconnected.union`). So the path-component of the identity is a SUBMONOID of
  `Module.End Cut STVC` (`joinedIdSubmonoid`), and a FINITE PRODUCT of `JoinedIdC` factors is
  `JoinedIdC` (`joinedIdC_listProd`, list induction). This dissolves the non-composability of the
  path form — pure `IsPreconnected.union` arithmetic, NO `Path`, NO posited connectedness.

  THE PAYOFF:
    • `JoinedIdC` / `joinedIdC_one` / `joinedIdC_mul` — ★ THE ENGINE: the identity's path component
      is closed under `1` and `*`.
    • `joinedIdSubmonoid` — ★ the SUBMONOID structure (the path-component of the identity IS a
      submonoid of the operator ring — trunk-native group-theoretic content).
    • `joinedIdC_listProd` — ★★ WORD-INDUCTION: every finite product of `JoinedIdC` factors is
      `JoinedIdC`.
    • `joinedIdC_planeRotLin` — every `rotPath`-reachable 2-plane rotation (`c²+s²=1`, `1+c≠0`) is
      `JoinedIdC` (the per-factor base case, N153 `rotPath_joins_id_rotation`).
    • `bvIsom_joinedIdC_of_compact_joinedSet` — ★★ THE FULL REDUCTION (set form, strictly cleaner
      than N154's path form): an arbitrary `BvC`-isometry is `JoinedIdC` provided its compact polar
      factor is `JoinedIdC` (the single residual, now in the COMPOSABLE set form). The boost factor
      handled in FULL GENERALITY by `bvIsomLin_polar_path_decomp` (N130) + `specPathOp_cont` (N152).
    • `bvIsom_joinedIdC_of_compact_word` — ★★ THE CONDITIONAL FULL PATH-CONNECTEDNESS: IF every
      compact `QvC`-isometry is a finite product of `JoinedIdC` factors (the childed word residual),
      THEN every `BvC`-isometry is `JoinedIdC` — the full `SO⁺(1,9)` path-connectedness assembled
      entirely from the engine. The remaining gap is the word residual ALONE.
    • `joinedIdC_quarterTurn` / `joinedIdC_halfTurn` — ★ W8 NON-VACUITY: the ANTIPODE half-turn
      `planeRotLin (-1) 0` — which is NOT reachable by the single Cayley chart `rotPath` (`1+(-1)=0`,
      `halfTurn_antipode_not_cayley`) — IS `JoinedIdC`, as the product of two quarter-turns
      (`planeRotLin 0 1 * planeRotLin 0 1 = planeRotLin (-1) 0`, `planeRotLin_mul` N96). The
      word-induction genuinely EXTENDS the reach beyond the single chart — the engine is not
      decoration.

  ── THE CHILDED RESIDUAL (N156) ──
  THE COMPACT WORD-MEMBERSHIP: every compact `QvC`-isometry `k` is a finite product of `JoinedIdC`
  factors (e.g. of `rotPath`-reachable 2-plane rotations + their products). This is the full `SO(9)`
  exhaustion the N114/N116 strand isolated as HEAVY. Once banked, `bvIsom_joinedIdC_of_compact_word`
  fires UNCONDITIONALLY → the full `SO⁺(1,9)` path-connectedness with NO residual.

  DERIVED from the trunk (the operator topology `endOpC` / `endOpC_continuous_iff` /
  `endOpC_mul_right_cont` (N152/N153), the boost factor-path `specPathOp` / `specPathOp_cont`
  (N152), the compact factor-path `rotPath` / `rotPath_joins_id_rotation` (N153), the full polar/KAK
  decomposition `bvIsomLin_polar_path_decomp` (N130), `planeRotLin` / `planeRotLin_apply` (N105),
  `planeRotLin_mul` (N96); standard `IsPreconnected.union` / `IsPreconnected.image` /
  `isPreconnected_uIcc` / `isPreconnected_singleton` / `List.prod` / `Submonoid` MACHINERY on the
  DERIVED objects, STANDARD §3), NOT a posited operator topology, NOT a posited connectedness /
  path-connectedness, NOT a posited Lorentz group / `SO⁺(1,9)` / compact group / `SO(9)` / `Spin(9)`,
  NOT a posited polar/KAK product, NOT Mathlib ℝ/ℂ as content (the field, the path parameters and the
  interval are ALL the derived `Cut`), NOT a fully proved implication asserted without a proof, NOT a
  bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / isometry /
  compact / orthogonal / path-connected / connectedness / topology / half-turn / quarter-turn /
  Cayley / circle / word / KAK / polar / SO / Spin / antipode": what remains is pure topology +
  algebra over the derived complete ordered field `Cut` — `JoinedIdC g` says g lies in a preconnected
  subset of the induced topology `endOpC` on `Module.End Cut STVC` together with `1`; this set is
  closed under `1` and `*` (a submonoid); a finite product of such elements is such an element; and
  an `S` with `∀ p q, BvC (S p)(S q) = BvC p q` lies in this set provided its banked polar
  decomposition's compact factor does. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumPathConnectedFull

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The set-form path-component engine over `endOpC`. -/

/-- `JoinedIdC g` — `g` lies in a SINGLE PRECONNECTED subset of the operator topology `endOpC`
    together with the identity `1`. The set-form of "joined to the identity"; unlike a path
    function it COMPOSES under multiplication (`joinedIdC_mul`). -/
def JoinedIdC (g : Module.End Cut STVC) : Prop :=
  ∃ Conn : Set (Module.End Cut STVC),
    IsPreconnected Conn ∧ (1 : Module.End Cut STVC) ∈ Conn ∧ g ∈ Conn

/-- The identity is joined to itself: the singleton `{1}` is preconnected. -/
theorem joinedIdC_one : JoinedIdC (1 : Module.End Cut STVC) :=
  ⟨{1}, isPreconnected_singleton, rfl, rfl⟩

/-- ★ THE ENGINE — the identity's path component is CLOSED UNDER MULTIPLICATION. From `JoinedIdC a`
    (witness `A`) and `JoinedIdC b` (witness `B`), right-translate `A` to `A·b` — preconnected by the
    right-mult glue `endOpC_mul_right_cont` (N153), containing `1·b = b` and `a·b` — and union with
    `B` at the SHARED point `b` (`IsPreconnected.union`): the union is preconnected and contains both
    `1` and `a·b`. NO posited connectedness, NO `Path` — preconnected-set arithmetic. -/
theorem joinedIdC_mul {a b : Module.End Cut STVC}
    (ha : JoinedIdC a) (hb : JoinedIdC b) : JoinedIdC (a * b) := by
  obtain ⟨A, hApre, h1A, haA⟩ := ha
  obtain ⟨B, hBpre, h1B, hbB⟩ := hb
  set Ab := (fun g => g * b) '' A with hAb
  have hAbcont : Continuous (fun g : Module.End Cut STVC => g * b) := endOpC_mul_right_cont b
  have hAbpre : IsPreconnected Ab := hApre.image _ hAbcont.continuousOn
  have hbAb : b ∈ Ab := ⟨1, h1A, by show (1 : Module.End Cut STVC) * b = b; rw [one_mul]⟩
  have habAb : a * b ∈ Ab := ⟨a, haA, rfl⟩
  refine ⟨B ∪ Ab, hBpre.union b hbB hbAb hAbpre, Set.mem_union_left _ h1B,
    Set.mem_union_right _ habAb⟩

/-- ★ THE SUBMONOID STRUCTURE — the path-component of the identity in `endOpC` is a SUBMONOID of the
    operator ring `Module.End Cut STVC` (closed under `1` and `*`). The trunk-native group-theoretic
    content: the identity component is a multiplicative subobject, NOT a posited subgroup. -/
def joinedIdSubmonoid : Submonoid (Module.End Cut STVC) where
  carrier := {g | JoinedIdC g}
  mul_mem' := joinedIdC_mul
  one_mem' := joinedIdC_one

/-- ★★ WORD-INDUCTION — every FINITE PRODUCT of `JoinedIdC` factors is `JoinedIdC` (list induction
    on the engine `joinedIdC_mul`, base case `joinedIdC_one`). This is what dissolves the
    non-composability of the path form: a compact factor presented as a finite product of joined
    rotations is itself joined to the identity. -/
theorem joinedIdC_listProd : ∀ (L : List (Module.End Cut STVC)),
    (∀ g ∈ L, JoinedIdC g) → JoinedIdC L.prod
  | [], _ => by simpa using joinedIdC_one
  | (a :: L), h => by
      rw [List.prod_cons]
      exact joinedIdC_mul (h a (List.mem_cons_self ..))
        (joinedIdC_listProd L (fun g hg => h g (List.mem_cons_of_mem a hg)))

/-! ## The per-factor base case — an `rotPath`-reachable 2-plane rotation is `JoinedIdC`. -/

/-- Every `rotPath`-reachable 2-plane rotation `planeRotLin c s` (`c²+s²=1`, `1+c≠0`) is `JoinedIdC`
    — the N153 packaged connectedness `rotPath_joins_id_rotation` supplies the preconnected witness
    set directly. -/
theorem joinedIdC_planeRotLin (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    JoinedIdC (planeRotLin c s) := by
  obtain ⟨γ, _, _, hpre, h1, hrot⟩ := rotPath_joins_id_rotation c s h hc
  exact ⟨_, hpre, h1, hrot⟩

/-! ## THE FULL REDUCTION (set form) — strictly cleaner than N154's path form. -/

/-- ★★ THE FULL REDUCTION (set form) — an ARBITRARY `BvC`-isometry `S` is `JoinedIdC`, PROVIDED its
    polar compact factor `k := S∘(p^{1/2})⁻¹` is `JoinedIdC`. The boost factor `p = γ 1` is handled
    in FULL GENERALITY: `bvIsomLin_polar_path_decomp` (N130) gives `S = k·p` with `γ = specPathOp`
    the affine boost path joining `γ 0 = id` to `γ 1 = p` (continuous in `endOpC` by N152), so
    `JoinedIdC p` follows directly, and `JoinedIdC S = JoinedIdC (k*p)` by the engine `joinedIdC_mul`.
    Strictly cleaner than N154's `bvIsom_joined_id_of_compact_joined`: the residual is now in the
    COMPOSABLE set form `JoinedIdC k`, not the non-composable path-function form. -/
theorem bvIsom_joinedIdC_of_compact_joinedSet {S : Module.End Cut STVC} (hS : IsBvIsomLin S)
    (hcompact : ∀ k : Module.End Cut STVC, IsQvIsomC k → JoinedIdC k) :
    JoinedIdC S := by
  obtain ⟨h, n, c, u, γ, hhS, hγeq, hγ0, hγ1sqrt, hsymm, hpos, hk_isom, hkS⟩ :=
    bvIsomLin_polar_path_decomp hS
  set k := S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) with hkdef
  set p := γ 1 with hpdef
  have hβcont : Continuous γ := by rw [hγeq]; exact specPathOp_cont c u
  have hβ0 : γ 0 = (1 : Module.End Cut STVC) := by rw [hγ0, Module.End.one_eq_id]
  have hpJoined : JoinedIdC p :=
    ⟨γ '' (Set.uIcc 0 1), (isPreconnected_uIcc).image _ hβcont.continuousOn,
      ⟨0, Set.left_mem_uIcc, hβ0⟩, ⟨1, Set.right_mem_uIcc, rfl⟩⟩
  have hkJoined : JoinedIdC k := hcompact k hk_isom
  have hSeq : S = k * p := by rw [hpdef, hkdef, ← Module.End.mul_eq_comp] at hkS; exact hkS.symm
  rw [hSeq]
  exact joinedIdC_mul hkJoined hpJoined

/-! ## THE CONDITIONAL FULL `SO⁺(1,9)` PATH-CONNECTEDNESS. -/

/-- ★★ THE CONDITIONAL FULL PATH-CONNECTEDNESS — IF every compact `QvC`-isometry `k` is a FINITE
    PRODUCT of `JoinedIdC` factors (the childed word-membership residual, N156 — the full `SO(9)`
    exhaustion the N114/N116 strand isolated as HEAVY), THEN every `BvC`-isometry `S` is `JoinedIdC`:
    the FULL `SO⁺(1,9)` path-connectedness, assembled entirely from the engine
    (`joinedIdC_listProd` discharges the compact factor, `bvIsom_joinedIdC_of_compact_joinedSet`
    assembles with the boost factor). The remaining gap is the word residual ALONE — once it is
    banked, this fires unconditionally. -/
theorem bvIsom_joinedIdC_of_compact_word {S : Module.End Cut STVC} (hS : IsBvIsomLin S)
    (hword : ∀ k : Module.End Cut STVC, IsQvIsomC k →
       ∃ L : List (Module.End Cut STVC), (∀ g ∈ L, JoinedIdC g) ∧ k = L.prod) :
    JoinedIdC S := by
  apply bvIsom_joinedIdC_of_compact_joinedSet hS
  intro k hk
  obtain ⟨L, hL, hkeq⟩ := hword k hk
  rw [hkeq]
  exact joinedIdC_listProd L hL

/-! ## W8 NON-VACUITY — the antipode half-turn (outside the single Cayley chart) IS `JoinedIdC`. -/

/-- The quarter turn `planeRotLin 0 1` is `JoinedIdC` (`c = 0`, so `1 + 0 ≠ 0`, on the circle
    `0² + 1² = 1`). -/
theorem joinedIdC_quarterTurn : JoinedIdC (planeRotLin (0:Cut) 1) := by
  apply joinedIdC_planeRotLin
  · ring
  · norm_num

/-- `1 + (-1) = 0` — the antipode `(c,s) = (-1,0)` is EXACTLY the point the single Cayley chart
    `rotPath` MISSES (`rotPath_joins_id_rotation` requires `1 + c ≠ 0`). -/
theorem halfTurn_antipode_not_cayley : (1 : Cut) + (-1) = 0 := by ring

/-- ★ W8 NON-VACUITY — the ANTIPODE half-turn `planeRotLin (-1) 0` IS `JoinedIdC`, even though it is
    NOT reachable by the single Cayley chart `rotPath` (`1 + (-1) = 0`, `halfTurn_antipode_not_cayley`):
    it is the PRODUCT of two quarter-turns (`planeRotLin 0 1 * planeRotLin 0 1 = planeRotLin (-1) 0`
    by the angle-addition law `planeRotLin_mul` N96), each `JoinedIdC`, so it is `JoinedIdC` by the
    engine. The word-induction genuinely EXTENDS the reach beyond the single chart — the engine is
    not decoration. -/
theorem joinedIdC_halfTurn : JoinedIdC (planeRotLin (-1 : Cut) 0) := by
  have hmul : planeRotLin (0:Cut) 1 * planeRotLin (0:Cut) 1 = planeRotLin (-1:Cut) 0 := by
    rw [planeRotLin_mul]; congr 1 <;> ring
  rw [← hmul]
  exact joinedIdC_mul joinedIdC_quarterTurn joinedIdC_quarterTurn

end

end Phys.Algebra
