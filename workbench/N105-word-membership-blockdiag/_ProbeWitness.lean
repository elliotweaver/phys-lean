import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def xNegLin : Module.End Cut STVC where
  toFun p := (p.1, -p.2.1, p.2.2)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ rfl)
    show -(p.2.1 + q.2.1) = -p.2.1 + -q.2.1
    ring
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext ?_ rfl)
    show -(c • p.2.1) = c • (-p.2.1)
    simp

theorem xNegLin_apply (p : STVC) : xNegLin p = (p.1, -p.2.1, p.2.2) := rfl

-- EvC-self-adjoint: EvC (xNegLin p) q = EvC p (xNegLin q)
theorem xNegLin_isEvCAdjoint_self : IsEvCAdjoint xNegLin xNegLin := by
  intro p q
  obtain ⟨t, x, v⟩ := p
  obtain ⟨t', x', v'⟩ := q
  show EvC (t, -x, v) (t', x', v') = EvC (t, x, v) (t', -x', v')
  unfold EvC
  show t*t' + (-x)*x' + gFormC v v' = t*t' + x*(-x') + gFormC v v'
  ring

-- involution: xNegLin ∘ xNegLin = id  (so h∘g = id, EvC-orthogonal)
theorem xNegLin_comp_self : xNegLin.comp xNegLin = LinearMap.id := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  show xNegLin (xNegLin (t, x, v)) = (t, x, v)
  show (t, -(-x), v) = (t, x, v)
  rw [neg_neg]

theorem xNegLin_isQvIsomC : IsQvIsomC xNegLin := by
  intro p
  obtain ⟨t, x, v⟩ := p
  show QvC (t, -x, v) = QvC (t, x, v)
  unfold QvC QformC
  show t^2 - (-x)^2 - gFormC v v = t^2 - x^2 - gFormC v v
  ring

-- THE LEVER applies: compact part = xNegLin itself.
theorem xNegLin_compact_part_eq_self :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i j, EvC (uu i) (uu j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      xNegLin.comp xNegLin = specOpN c uu ∧
      xNegLin.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = xNegLin :=
  evCOrthogonal_compact_part_eq_self xNegLin xNegLin
    xNegLin_isQvIsomC xNegLin_isEvCAdjoint_self xNegLin_comp_self

-- rigidity invariant (x-fixing of all words)
theorem genIsomMonoidLin_fixes_snd {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLin) : ∀ p : STVC, (K p).2.1 = p.2.1 := by
  induction hK using Submonoid.closure_induction with
  | mem K hK => obtain ⟨u, u', _, _, rfl⟩ := hK; intro p; rfl
  | one => intro p; rfl
  | mul A B _ _ ihA ihB => intro p; show (A (B p)).2.1 = p.2.1; rw [ihA (B p), ihB p]

-- THE OBSTRUCTION: xNegLin ∉ genIsomMonoidLin (it moves x).
theorem xNegLin_not_mem_genIsomMonoidLin : xNegLin ∉ genIsomMonoidLin := by
  intro hmem
  have hfix := genIsomMonoidLin_fixes_snd hmem ((0:Cut), (1:Cut), (0:O Cut))
  -- hfix : (xNegLin (0,1,0)).2.1 = 1, but LHS = -1
  rw [show (xNegLin ((0:Cut),(1:Cut),(0:O Cut))).2.1 = (-1 : Cut) from rfl] at hfix
  -- hfix : -1 = 1 over Cut
  have : (-1 : Cut) = 1 := hfix
  have h2 : (2 : Cut) = 0 := by linarith [this]
  exact two_ne_zero h2

end

end Phys.Algebra
