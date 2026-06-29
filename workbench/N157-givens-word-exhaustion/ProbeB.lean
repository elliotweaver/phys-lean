import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## PROBE B — the CORRECTED group-constrained path-component predicate (non-vacuous).
    `JoinedIdQvC g` : g lies in a single preconnected subset of `endOpC` together with 1, AND
    THE WHOLE CONNECTING SET CONSISTS OF QvC-ISOMETRIES. This is strictly stronger than `JoinedIdC`
    and is NON-vacuous: it genuinely asserts g is reachable from 1 by a path that stays in the
    isometry group. -/

def JoinedIdQvC (g : Module.End Cut STVC) : Prop :=
  ∃ Conn : Set (Module.End Cut STVC),
    (∀ x ∈ Conn, IsQvIsomC x) ∧ IsPreconnected Conn ∧
    (1 : Module.End Cut STVC) ∈ Conn ∧ g ∈ Conn

theorem isQvIsomC_one : IsQvIsomC (1 : Module.End Cut STVC) := by
  intro p; rfl

theorem isQvIsomC_mul {a b : Module.End Cut STVC}
    (ha : IsQvIsomC (a : STVC → STVC)) (hb : IsQvIsomC (b : STVC → STVC)) :
    IsQvIsomC ((a * b : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  show QvC ((a * b) p) = QvC p
  rw [Module.End.mul_apply, ha (b p), hb p]

theorem joinedIdQvC_one : JoinedIdQvC (1 : Module.End Cut STVC) :=
  ⟨{1}, by rintro x rfl; exact isQvIsomC_one, isPreconnected_singleton, rfl, rfl⟩

/-- THE ENGINE — closed under `*`, AND the connecting set stays in the group. -/
theorem joinedIdQvC_mul {a b : Module.End Cut STVC}
    (ha : JoinedIdQvC a) (hb : JoinedIdQvC b) : JoinedIdQvC (a * b) := by
  obtain ⟨A, hAisom, hApre, h1A, haA⟩ := ha
  obtain ⟨B, hBisom, hBpre, h1B, hbB⟩ := hb
  -- b is an isometry (it is in B)
  have hbisom : IsQvIsomC b := hBisom b hbB
  set Ab := (fun g => g * b) '' A with hAb
  have hAbcont : Continuous (fun g : Module.End Cut STVC => g * b) := endOpC_mul_right_cont b
  have hAbpre : IsPreconnected Ab := hApre.image _ hAbcont.continuousOn
  have hbAb : b ∈ Ab := ⟨1, h1A, by show (1 : Module.End Cut STVC) * b = b; rw [one_mul]⟩
  have habAb : a * b ∈ Ab := ⟨a, haA, rfl⟩
  have hAbisom : ∀ x ∈ Ab, IsQvIsomC x := by
    rintro x ⟨g, hgA, rfl⟩
    exact isQvIsomC_mul (hAisom g hgA) hbisom
  refine ⟨B ∪ Ab, ?_, hBpre.union b hbB hbAb hAbpre, Set.mem_union_left _ h1B,
    Set.mem_union_right _ habAb⟩
  rintro x (hxB | hxAb)
  · exact hBisom x hxB
  · exact hAbisom x hxAb

theorem joinedIdQvC_listProd : ∀ (L : List (Module.End Cut STVC)),
    (∀ g ∈ L, JoinedIdQvC g) → JoinedIdQvC L.prod
  | [], _ => by simpa using joinedIdQvC_one
  | (a :: L), h => by
      rw [List.prod_cons]
      exact joinedIdQvC_mul (h a (List.mem_cons_self ..))
        (joinedIdQvC_listProd L (fun g hg => h g (List.mem_cons_of_mem a hg)))

/-- ★ THE NON-VACUOUS GENERAL-AXIS BASE CASE — every unit-axis Givens rotation is `JoinedIdQvC`:
    the rotation path `axisRotPath e` is a genuine path OF ISOMETRIES (`axisRotPath_isQvIsomC`,
    needs the unit axis), so the whole connecting set lies in the group. -/
theorem joinedIdQvC_axisRotLin (e : O Cut) (he : gFormC e e = 1) (c s : Cut)
    (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) : JoinedIdQvC (axisRotLin e c s) := by
  refine ⟨axisRotPath e '' (Set.uIcc 0 (s/(1+c))), ?_, axisRotPath_image_preconnected e _,
    ?_, ?_⟩
  · rintro x ⟨m, _, rfl⟩
    exact axisRotPath_isQvIsomC e he m
  · exact ⟨0, Set.left_mem_uIcc, axisRotPath_zero e⟩
  · exact ⟨s/(1+c), Set.right_mem_uIcc, axisRotPath_reaches e c s h hc⟩

/-- A finite product of UNIT-axis Givens rotations is `JoinedIdQvC` (non-vacuously). -/
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

/-- NON-VACUITY of `JoinedIdQvC`: a `JoinedIdQvC` operator MUST be a QvC-isometry — so unlike
    `JoinedIdC` it is NOT satisfied by arbitrary operators. -/
theorem joinedIdQvC_isQvIsomC {g : Module.End Cut STVC} (hg : JoinedIdQvC g) : IsQvIsomC g := by
  obtain ⟨Conn, hisom, _, _, hgC⟩ := hg
  exact hisom g hgC

end

end Phys.Algebra

#print axioms Phys.Algebra.joinedIdQvC_axisRotProd
#print axioms Phys.Algebra.joinedIdQvC_isQvIsomC
