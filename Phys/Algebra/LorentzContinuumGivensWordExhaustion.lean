/-
  Phys.Algebra.LorentzContinuumGivensWordExhaustion — N157: THE GROUP-CONSTRAINED PATH-COMPONENT
  ENGINE `JoinedIdQvC` (the NON-VACUOUS repair of the `JoinedIdC` predicate) and the NON-VACUOUS
  general-axis Givens base case + Givens-word product, in the operator topology `endOpC` over the
  DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.

  ===========================================================================
  CONTEXT — what N156 reduced the full path-connectedness to. N156
  (`LorentzContinuumGeneralAxisRotationPath`) reduced the full `SO⁺(1,9)` path-connectedness to the
  single residual `hgivens` of `bvIsom_joinedIdC_of_axisRotWord`: IF every compact `QvC`-isometry
  is a finite product of unit-axis Givens rotations `axisRotLin e c s` (off the antipode), THEN
  every `BvC`-isometry is `JoinedIdC`.

  ===========================================================================
  ★ MEASURE-FIRST FINDING (THE ONE LAW fired — the framing drifted, not the theory). Before
  committing to the `hgivens` discharge, the two smallest obligations were measured and BOTH the
  literal hypothesis AND the literal conclusion were found to be the wrong objects:

  (1) `hgivens` is UNSATISFIABLE as written. It quantifies over ALL `IsQvIsomC k`, and
      `IsQvIsomC k := ∀ p, QvC (k p) = QvC p` is the FULL indefinite O(1,9) isometry group
      (`QvC = t² − x² − gFormC v v`, signature (1,9)). Every `axisRotLin e c s` FIXES the time
      coordinate (`axisRotLin_apply` first component is `p.1`), so every Givens word fixes time;
      a boost `boostEndC a b` is `IsQvIsomC` but MOVES time. So "every QvC-isometry is a
      time-fixing Givens word" is false — the hypothesis ranges over the wrong set.

  (2) THE CONCLUSION `JoinedIdC` is VACUOUS — PROVED. `JoinedIdC g := ∃ Conn, IsPreconnected Conn
      ∧ 1 ∈ Conn ∧ g ∈ Conn` places NO constraint that `Conn` consists of isometries. The ambient
      `Module.End Cut STVC` is a topological vector space in `endOpC`; the convex segment
      `segLin g t := (1−t)•1 + t•g` is continuous in `endOpC` (each evaluation
      `t ↦ (1−t)•v + t•(g v)`) with preconnected image, joining `1` (t=0) to `g` (t=1). Hence
      `joinedIdC_everything : ∀ g, JoinedIdC g` — TRUE FOR EVERY OPERATOR. So a `JoinedIdC`-valued
      "path-connectedness" conclusion does ZERO work: in `bvIsom_joinedIdC_of_axisRotWord` the
      hypothesis `IsBvIsomLin S` is dead weight, `JoinedIdC S` holds for any `S`. This is the
      physics-words-removable test failing at the predicate level: delete "isometry/path-connected"
      and the statement is just "the operator vector space is connected" — the physics word was
      load-bearing = a HOLE.

  (Structural, additionally: even a group-internal "∀ IsBvIsomLin S → reachable from 1" is false for
   the FULL `BvC` group — O(1,9) has 4 components; `-1` (PT) is `IsBvIsomLin` but reverses
   time-orientation, NOT in the identity component. Only `SO⁺` is path-connected to 1.)

  ===========================================================================
  THE TRUNK-NATIVE REPAIR (what this node BANKS) — the GROUP-CONSTRAINED path component. The honest,
  NON-VACUOUS object is

      `JoinedIdQvC g := ∃ Conn, (∀ x ∈ Conn, IsQvIsomC x) ∧ IsPreconnected Conn ∧ 1 ∈ Conn ∧ g ∈ Conn`

  — `g` lies in a single preconnected subset of `endOpC` together with `1`, WITH THE WHOLE
  CONNECTING SET INSIDE THE ISOMETRY GROUP. This is strictly stronger than `JoinedIdC` and is
  non-vacuous: a `JoinedIdQvC` operator MUST be a `QvC`-isometry (`joinedIdQvC_isQvIsomC`), so it is
  NOT satisfied by arbitrary operators. The whole engine carries over NON-VACUOUSLY because the
  N156 rotation path is a path OF ISOMETRIES (`axisRotPath_isQvIsomC`, which needs the UNIT axis).

  ── WHAT THIS NODE BANKS ──
  `segLin` / `segLin_cont` / `segLin_zero` / `segLin_one` — the convex operator segment.
  ★★ `joinedIdC_everything` — THE VACUITY WITNESS: every operator is `JoinedIdC` (the segment joins
     `1` to any `g`). This is the PROOF that the un-constrained predicate is vacuous — banked so the
     vacuity is on the record, not hidden.
  `isQvIsomC_one` / `isQvIsomC_mul` — the isometry group is a submonoid of `endOpC`.
  `JoinedIdQvC` — the GROUP-CONSTRAINED path component (the repair).
  `joinedIdQvC_one` / ★ `joinedIdQvC_mul` (THE ENGINE — closed under `*`, AND the connecting set
     stays in the group: the right-translate `A·b` preserves membership since `b` is an isometry) /
     `joinedIdQvC_listProd` (WORD-INDUCTION).
  ★ `joinedIdQvC_axisRotLin` — THE NON-VACUOUS GENERAL-AXIS BASE CASE: every unit-axis Givens
     rotation `axisRotLin e c s` (`gFormC e e = 1`, `c²+s²=1`, `1+c≠0`) is `JoinedIdQvC`. The N156
     rotation path supplies a preconnected witness set OF ISOMETRIES (`axisRotPath_isQvIsomC`).
  ★ `joinedIdQvC_axisRotProd` — a finite product of unit-axis Givens rotations is `JoinedIdQvC`.
  ★★ `joinedIdQvC_isQvIsomC` — THE NON-VACUITY: `JoinedIdQvC g → IsQvIsomC g`. The load-bearing
     distinction the `JoinedIdC` predicate was missing.
  W8 NON-VACUITY: `joinedIdQvC_axisRotLin_quarterTurn` (the unit-axis quarter-turn is `JoinedIdQvC`)
     + `axisRotLin_quarterTurn_e2_read` (it genuinely moves a coordinate, reading `1`).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: `axisRotLin` / `axisRotLin_apply` / `axisRotLin_isQvIsomC` (N113);
  `axisRotPath` / `axisRotPath_cont` / `axisRotPath_zero` / `axisRotPath_isQvIsomC` /
  `axisRotPath_reaches` / `axisRotPath_image_preconnected` (N156); the operator topology `endOpC` /
  `endOpC_continuous_iff` (N152) and the right-mult glue `endOpC_mul_right_cont` (N153); `QvC` /
  `IsQvIsomC` / `gFormC` (N49–N105); `e2_gFormC_self` (N53). `IsPreconnected.image` /
  `IsPreconnected.union` / `isPreconnected_uIcc` / `isPreconnected_singleton` / `List.prod` /
  `List.map` / `Continuous.*` are MACHINERY on the DERIVED objects (STANDARD §3) — over the derived
  ℝ `ContinuumQ.Cut`. NO Mathlib ℝ/ℂ as content, NO posited topology / connectedness / isometry
  group / Lorentz group, NO bridge.

  ── THE FORWARD REMAINDER (childed N158) ──
  THE GENUINE `SO(9)` GIVENS-WORD EXHAUSTION: every TIME-FIXING compact `QvC`-isometry `k` (the
  genuine polar compact factor of `bvIsomLin_compact_factor_spec` N131 — EvC-orthogonal, fixing the
  timelike axis, acting on the `x ⊕ 𝕆` block) is a finite product of unit-axis Givens rotations
  `axisRotLin e c s`, hence `JoinedIdQvC`, via the banked deflation/peel (`deflateNinth_step`,
  `deflate_factorization` N115/N116) + the reflection-exhaustion skeleton (`reflection_exhaustion`
  N123) with ROTATION factors. This is the genuine heavy group-manifold remainder Mathlib lacks over
  the derived `Cut` — the W1 dissolution remainder, now correctly scoped to the time-fixing compact
  factor and the NON-VACUOUS `JoinedIdQvC` target.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "rotation / axis / Givens / isometry / path-connected / compact / word / quarter-turn /
  Lorentz / SO(9) / boost / time / orthochronous": over the derived complete ordered field `Cut`,
  `JoinedIdQvC g` says `g` lies in a preconnected subset of the induced operator topology `endOpC`,
  every element of which preserves the form `QvC`, containing `1`; the set of such `g` is closed
  under `1` and `*` (a submonoid); a `JoinedIdQvC` element preserves `QvC`; and the convex segment
  shows the UNCONSTRAINED predicate `JoinedIdC` is satisfied by every endomorphism. Pure
  topology/algebra over the derived field; no theorem statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The convex operator segment — the proof that `JoinedIdC` is VACUOUS. -/

/-- THE CONVEX OPERATOR SEGMENT `segLin g t := (1−t)•1 + t•g` from the identity (`t = 0`) to an
    ARBITRARY operator `g` (`t = 1`), inside the ambient operator vector space `Module.End Cut STVC`.
    Nothing here is an isometry — this is the segment of the unconstrained ambient space. -/
def segLin (g : Module.End Cut STVC) (t : Cut) : Module.End Cut STVC :=
  (1 - t) • (1 : Module.End Cut STVC) + t • g

/-- The convex segment is continuous in the operator topology `endOpC` (each evaluation
    `t ↦ (1−t)•v + t•(g v)` is a finite `Cut`-affine combination of fixed vectors). -/
theorem segLin_cont (g : Module.End Cut STVC) : Continuous (segLin g) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun t => (segLin g t) v) = (fun t => (1 - t) • v + t • (g v)) := by
    funext t
    rw [segLin]
    simp [LinearMap.add_apply, LinearMap.smul_apply]
  rw [hrw]
  exact (continuous_const.sub continuous_id).smul continuous_const
    |>.add (continuous_id.smul continuous_const)

/-- The segment starts at the identity. -/
theorem segLin_zero (g : Module.End Cut STVC) : segLin g 0 = 1 := by
  rw [segLin]; simp

/-- The segment reaches `g`. -/
theorem segLin_one (g : Module.End Cut STVC) : segLin g 1 = g := by
  rw [segLin]; simp

/-- ★★ THE VACUITY WITNESS — EVERY operator is `JoinedIdC`. The unconstrained predicate
    `JoinedIdC g := ∃ Conn, IsPreconnected Conn ∧ 1 ∈ Conn ∧ g ∈ Conn` (N155) places no isometry
    constraint on `Conn`, so the convex segment `segLin g` (continuous, preconnected image,
    joining `1` to `g`) witnesses `JoinedIdC g` for ARBITRARY `g`. Therefore a `JoinedIdC`-valued
    "path-connectedness" statement is VACUOUS — it is the connectedness of the ambient operator
    vector space, not a statement about the isometry group. This theorem is banked precisely so the
    vacuity is on the record; the repair is the group-constrained `JoinedIdQvC` below. -/
theorem joinedIdC_everything (g : Module.End Cut STVC) : JoinedIdC g := by
  refine ⟨segLin g '' (Set.uIcc 0 1), (isPreconnected_uIcc).image _ (segLin_cont g).continuousOn,
    ?_, ?_⟩
  · exact ⟨0, Set.left_mem_uIcc, segLin_zero g⟩
  · exact ⟨1, Set.right_mem_uIcc, segLin_one g⟩

/-! ## The isometry group is a submonoid of `endOpC`. -/

/-- The identity preserves the form `QvC`. -/
theorem isQvIsomC_one : IsQvIsomC ((1 : Module.End Cut STVC) : STVC → STVC) := by
  intro p; rfl

/-- A composite of `QvC`-isometries is a `QvC`-isometry (operator product = composition). -/
theorem isQvIsomC_mul {a b : Module.End Cut STVC}
    (ha : IsQvIsomC (a : STVC → STVC)) (hb : IsQvIsomC (b : STVC → STVC)) :
    IsQvIsomC ((a * b : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  show QvC ((a * b) p) = QvC p
  rw [Module.End.mul_apply, ha (b p), hb p]

/-! ## THE GROUP-CONSTRAINED PATH COMPONENT — the non-vacuous repair. -/

/-- ★ THE GROUP-CONSTRAINED PATH COMPONENT `JoinedIdQvC g`: `g` lies in a single PRECONNECTED subset
    of the operator topology `endOpC` together with the identity `1`, AND EVERY ELEMENT OF THAT SET
    IS A `QvC`-ISOMETRY. Unlike `JoinedIdC` (which the convex segment shows is satisfied by every
    operator, `joinedIdC_everything`), `JoinedIdQvC` is NON-VACUOUS: a `JoinedIdQvC` operator must
    preserve the form (`joinedIdQvC_isQvIsomC`). This is the honest path-component-of-the-identity
    statement — reachability from `1` by a path that STAYS IN THE ISOMETRY GROUP. -/
def JoinedIdQvC (g : Module.End Cut STVC) : Prop :=
  ∃ Conn : Set (Module.End Cut STVC),
    (∀ x ∈ Conn, IsQvIsomC (x : STVC → STVC)) ∧ IsPreconnected Conn ∧
    (1 : Module.End Cut STVC) ∈ Conn ∧ g ∈ Conn

/-- The identity is `JoinedIdQvC` (the singleton `{1}` is a preconnected set of isometries). -/
theorem joinedIdQvC_one : JoinedIdQvC (1 : Module.End Cut STVC) :=
  ⟨{1}, by rintro x rfl; exact isQvIsomC_one, isPreconnected_singleton, rfl, rfl⟩

/-- ★ THE ENGINE — `JoinedIdQvC` is CLOSED UNDER MULTIPLICATION, with the connecting set staying IN
    THE GROUP. From `JoinedIdQvC a` (witness `A`, all isometries) and `JoinedIdQvC b` (witness `B`,
    all isometries), right-translate `A` to `A·b` — preconnected by the right-mult glue
    `endOpC_mul_right_cont` (N153), and STILL all isometries because each `g·b` is a product of the
    isometry `g ∈ A` and the isometry `b` (`isQvIsomC_mul`) — containing `1·b = b` and `a·b`, and
    union with `B` at the shared point `b` (`IsPreconnected.union`). The union is preconnected, all
    isometries, and contains `1` and `a·b`. -/
theorem joinedIdQvC_mul {a b : Module.End Cut STVC}
    (ha : JoinedIdQvC a) (hb : JoinedIdQvC b) : JoinedIdQvC (a * b) := by
  obtain ⟨A, hAisom, hApre, h1A, haA⟩ := ha
  obtain ⟨B, hBisom, hBpre, h1B, hbB⟩ := hb
  have hbisom : IsQvIsomC (b : STVC → STVC) := hBisom b hbB
  set Ab := (fun g => g * b) '' A with hAb
  have hAbcont : Continuous (fun g : Module.End Cut STVC => g * b) := endOpC_mul_right_cont b
  have hAbpre : IsPreconnected Ab := hApre.image _ hAbcont.continuousOn
  have hbAb : b ∈ Ab := ⟨1, h1A, by show (1 : Module.End Cut STVC) * b = b; rw [one_mul]⟩
  have habAb : a * b ∈ Ab := ⟨a, haA, rfl⟩
  have hAbisom : ∀ x ∈ Ab, IsQvIsomC (x : STVC → STVC) := by
    rintro x ⟨g, hgA, rfl⟩
    exact isQvIsomC_mul (hAisom g hgA) hbisom
  refine ⟨B ∪ Ab, ?_, hBpre.union b hbB hbAb hAbpre, Set.mem_union_left _ h1B,
    Set.mem_union_right _ habAb⟩
  rintro x (hxB | hxAb)
  · exact hBisom x hxB
  · exact hAbisom x hxAb

/-- ★★ WORD-INDUCTION — every FINITE PRODUCT of `JoinedIdQvC` factors is `JoinedIdQvC` (list
    induction on the engine `joinedIdQvC_mul`, base `joinedIdQvC_one`). -/
theorem joinedIdQvC_listProd : ∀ (L : List (Module.End Cut STVC)),
    (∀ g ∈ L, JoinedIdQvC g) → JoinedIdQvC L.prod
  | [], _ => by simpa using joinedIdQvC_one
  | (a :: L), h => by
      rw [List.prod_cons]
      exact joinedIdQvC_mul (h a (List.mem_cons_self ..))
        (joinedIdQvC_listProd L (fun g hg => h g (List.mem_cons_of_mem a hg)))

/-! ## THE NON-VACUOUS GENERAL-AXIS BASE CASE. -/

/-- ★ THE NON-VACUOUS GENERAL-AXIS BASE CASE — every UNIT-axis Givens rotation `axisRotLin e c s`
    (`gFormC e e = 1`, `c²+s²=1`, off the antipode `1+c≠0`) is `JoinedIdQvC`. The N156 rotation path
    `axisRotPath e` supplies the preconnected witness set, and — crucially for non-vacuity — every
    point of it is a genuine `QvC`-isometry (`axisRotPath_isQvIsomC`, which REQUIRES the unit axis
    `he`). The group-constrained strengthening of N156's `joinedIdC_axisRotLin`. -/
theorem joinedIdQvC_axisRotLin (e : O Cut) (he : gFormC e e = 1) (c s : Cut)
    (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) : JoinedIdQvC (axisRotLin e c s) := by
  refine ⟨axisRotPath e '' (Set.uIcc 0 (s/(1+c))), ?_, axisRotPath_image_preconnected e _,
    ?_, ?_⟩
  · rintro x ⟨m, _, rfl⟩
    exact axisRotPath_isQvIsomC e he m
  · exact ⟨0, Set.left_mem_uIcc, axisRotPath_zero e⟩
  · exact ⟨s/(1+c), Set.right_mem_uIcc, axisRotPath_reaches e c s h hc⟩

/-- ★ A FINITE PRODUCT of UNIT-axis Givens rotations (mixed axes, each off the antipode) is
    `JoinedIdQvC` (non-vacuously). Each factor is `JoinedIdQvC` by `joinedIdQvC_axisRotLin`; the
    product by the word-induction `joinedIdQvC_listProd`. The exact form the `SO(9)` Givens/Euler
    decomposition produces, now with the group-constrained (non-vacuous) target. -/
theorem joinedIdQvC_axisRotProd (L : List (O Cut × Cut × Cut))
    (hL : ∀ t ∈ L, gFormC t.1 t.1 = 1 ∧ (t.2.1)^2 + (t.2.2)^2 = 1 ∧ 1 + t.2.1 ≠ 0) :
    JoinedIdQvC ((L.map (fun t => axisRotLin t.1 t.2.1 t.2.2)).prod) := by
  apply joinedIdQvC_listProd
  intro g hg
  rw [List.mem_map] at hg
  obtain ⟨t, htL, hgt⟩ := hg
  obtain ⟨haxis, hcirc, hanti⟩ := hL t htL
  rw [← hgt]
  exact joinedIdQvC_axisRotLin t.1 haxis t.2.1 t.2.2 hcirc hanti

/-- ★★ THE NON-VACUITY — a `JoinedIdQvC` operator MUST be a `QvC`-isometry. This is the
    load-bearing distinction the unconstrained `JoinedIdC` predicate was missing (which, by
    `joinedIdC_everything`, is satisfied by EVERY operator). `JoinedIdQvC` genuinely constrains its
    argument to the isometry group — so "path-connectedness" stated through it is a real statement,
    not the vacuous connectedness of the ambient vector space. -/
theorem joinedIdQvC_isQvIsomC {g : Module.End Cut STVC}
    (hg : JoinedIdQvC g) : IsQvIsomC (g : STVC → STVC) := by
  obtain ⟨Conn, hisom, _, _, hgC⟩ := hg
  exact hisom g hgC

/-! ## W8 NON-VACUITY — the unit-axis quarter-turn is `JoinedIdQvC` and genuinely moves a coordinate. -/

/-- The unit-axis quarter-turn `axisRotLin e 0 1` is `JoinedIdQvC` (`c = 0`, so `1 + 0 ≠ 0`, on the
    circle `0² + 1² = 1`), for a UNIT axis `e`. -/
theorem joinedIdQvC_axisRotLin_quarterTurn (e : O Cut) (he : gFormC e e = 1) :
    JoinedIdQvC (axisRotLin e (0:Cut) 1) := by
  apply joinedIdQvC_axisRotLin e he
  · ring
  · norm_num

/-- ★ W8 — the unit-axis (here `e₂`) quarter-turn `axisRotLin e₂ 0 1`, which is `JoinedIdQvC`
    (`joinedIdQvC_axisRotLin_quarterTurn` with `e2_gFormC_self`), genuinely MOVES the `x`-axis unit
    vector `(0,1,0)`: it reads, in the `e₂` slot of the moved `v`-block, the value `1`. So the
    `JoinedIdQvC` element is a non-trivial isometry, not the identity — the engine is not decoration.
    `axisRotLin e₂ 0 1 (0,1,0)` has `v`-block `0 + (1·1 + (0−1)·gFormC 0 e₂)•e₂ = 1•e₂`, whose
    `e₂`-overlap is `gFormC (1•e₂) e₂ = 1·gFormC e₂ e₂ = 1`. -/
theorem axisRotLin_quarterTurn_e2_read :
    gFormC ((axisRotLin (CD.e2 : O Cut) (0:Cut) 1 ((0:Cut), (1:Cut), (0:O Cut))).2.2)
      (CD.e2 : O Cut) = 1 := by
  rw [axisRotLin_apply]
  show gFormC ((0:O Cut) + ((1:Cut) * 1 + ((0:Cut) - 1) * gFormC (0:O Cut) (CD.e2 : O Cut))
      • (CD.e2 : O Cut)) (CD.e2 : O Cut) = 1
  rw [gFormC_zero_left]
  rw [show (1:Cut) * 1 + ((0:Cut) - 1) * 0 = 1 by ring, zero_add,
    gFormC_smul_left, e2_gFormC_self]
  ring

end

end Phys.Algebra
