import Phys.Algebra.LorentzContinuumRotationPathConnected

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- PROBE A: the abstract KAK-product assembly engine over endOpC.
-- From a continuous boost path id→p and a continuous compact path id→k, the product k*p
-- lies in a single preconnected subset of endOpC together with the identity.
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
  -- The boost-path image: preconnected, contains 1 (= β b0) and p (= β b1).
  set A := β '' (Set.uIcc b0 b1) with hA
  have hApre : IsPreconnected A := (isPreconnected_uIcc).image _ hβ.continuousOn
  have h1A : (1 : Module.End Cut STVC) ∈ A := ⟨b0, Set.left_mem_uIcc, hβ0⟩
  have hpA : p ∈ A := ⟨b1, Set.right_mem_uIcc, hβ1⟩
  -- The right-translated compact-path image: preconnected, contains p (= κ k0 * p) and k*p.
  set B := (fun t => κ t * p) '' (Set.uIcc k0 k1) with hB
  have hBcont : Continuous (fun t => κ t * p) := continuous_mul_right_path p κ hκ
  have hBpre : IsPreconnected B := (isPreconnected_uIcc).image _ hBcont.continuousOn
  have hpB : p ∈ B := ⟨k0, Set.left_mem_uIcc, by simp only [hκ0, one_mul]⟩
  have hkpB : k * p ∈ B := ⟨k1, Set.right_mem_uIcc, by simp only [hκ1]⟩
  -- Glue A and B at the shared point p.
  refine ⟨A ∪ B, hApre.union p hpA hpB hBpre, Set.mem_union_left _ h1A, Set.mem_union_right _ hkpB⟩

end

end Phys.Algebra
