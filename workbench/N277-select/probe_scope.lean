import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

def Kmat : M7 :=
  ![![0, -2, 0, 0, 0, 0, 0],![2, 0, 0, 0, 0, 0, 0],![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],![0, 0, 0, 0, 0, -2, 0],![0, 0, 0, 0, 2, 0, 0],![0, 0, 0, 0, 0, 0, 0]]

-- T1 = span{e1O=u1, e2O, e3O} as members of ImO. Need u1 ∈ ImO.
-- Irreducibility strategy in the qI calculus: For an invariant W containing nonzero w = a•e1+b•e2+c•e3,
-- Imat, Jmat, Kmat and their products recover e1,e2,e3. Concretely from probe:
--   qI Jmat maps e1 -> -2 e3? ... The cleanest: show span{e1,e2,e3} has NO proper (I,J,K)-invariant subspace.
-- MEASURE the core extraction: on the 3-block, (qI Cmat/Imat...) Actually let me just measure whether
-- the whole node WITHOUT irreducibility (invariance + Casimir + doubling id + transversality) is light,
-- and measure irreducibility separately as an OPTIONAL hardening.

-- Measure: T-block invariance under imRep DI (=qI Imat). e2O ∈ ImO, imRep DI e2O = 2 e3O (banked-style).
-- We already know imRep_DI_e2I from N276. Test the invariance direction quickly via qI action on e5O:
--   imRep DJ e5O should be 2 e7O (T2 invariant). Check Jmat col? Jmat row4(e5 output) from e5 input...
-- Just confirm the matrices multiply as claimed and Casimir decide is the real cost; that's already EXIT0.

-- The real question: is Q-irreducibility of a 3-dim so(3) vector rep provable cheaply?
-- Use: the rep is the standard so(3) on Q^3; irreducible over Q because the enveloping algebra is M_3(Q).
-- A clean Lean route: any invariant submodule is I3,J3,K3-invariant; use that I3(I3 v) extracts coords.
-- Let me measure the extraction identity in the REAL qI calculus on ImO restricted, via the block.

-- Simplest measured fact for irreducibility: the standard rep has the property that for v≠0,
-- span{v, I3 v, J3 v, K3 v, ...} = whole. Equivalent: the matrix [v | Iv | Jv | Kv | I²v...] has rank 3
-- for every v≠0. That's a case-split — heavier. DEFER irreducibility to optional hardening / downstream.

-- MEASURE instead the Casimir-scalar route as the "multiplet content" certificate (lighter, forced):
-- Casimir C = qI(Imat²+Jmat²+Kmat²) acts as -8 on T1,T2 and 0 on the singlet e4=κO1.
-- This is decide on integer matrices (already EXIT0). Good enough for the node's spine.
theorem casimir_matrix_val : ∀ i j : Fin 7,
    (mul7 Imat Imat i j + mul7 Jmat Jmat i j + mul7 Kmat Kmat i j)
      = (![![(-8:ℤ),0,0,0,0,0,0],![0,-8,0,0,0,0,0],![0,0,-8,0,0,0,0],
          ![0,0,0,0,0,0,0],![0,0,0,0,-8,0,0],![0,0,0,0,0,-8,0],![0,0,0,0,0,0,-8]] i j) := by
  decide

end
end Phys.Algebra
