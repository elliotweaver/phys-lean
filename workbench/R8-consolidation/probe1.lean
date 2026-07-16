import Phys.Algebra.StandpointStratum
import Phys.Algebra.StandpointResidual
import Phys.Algebra.StandpointChannel
import Phys.Algebra.StandpointTower
import Phys.Algebra.StandpointCompletion
import Phys.Algebra.StandpointLattice
import Phys.Algebra.StandpointArity
import Phys.Algebra.StandpointArtin
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra.StandpointArcConsolidation

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.StandpointStratum
open Phys.Algebra.StandpointResidual
open Phys.Algebra.StandpointChannel
open Phys.Algebra.StandpointTower
open Phys.Algebra.StandpointCompletion
open Phys.Algebra.StandpointLattice
open Phys.Quantum (StateFibre foldComplex)

noncomputable section

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable local instance oIsScalarTower : IsScalarTower ℚ (O ℚ) (O ℚ) :=
  ⟨fun c x y => by rw [smul_eq_mul, smul_eq_mul, qsmul_mul_left]⟩
noncomputable local instance oSMulCommClass : SMulCommClass ℚ (O ℚ) (O ℚ) :=
  ⟨fun c x y => by rw [smul_eq_mul, smul_eq_mul, qsmul_mul_right]⟩

/-! ## §1 — THE SELF-BLINDNESS SPINE (the marquee new weld). -/

-- The spine: R2 (miss), R3 (conserved blindness), R4 (cover) are ONE banked lemma
-- `fold_self_blind` (N1) at THREE carriers.
theorem selfblind_one_engine
    {lookO : O Cut → O Cut} (hO : IsFold lookO)
    {lookF : StateFibre → StateFibre} (hF : IsFold lookF)
    {lookP : O Cut × O Cut → O Cut × O Cut} (hP : IsFold lookP) :
    (∀ x : O Cut, lookO x = x → x = 0)
    ∧ (∀ p : StateFibre, lookF p = p → p = 0)
    ∧ (∀ w : O Cut × O Cut, lookP w = w → w = 0) :=
  ⟨fun x hx => fold_self_blind hO oCut_two_torsion_free x hx,
   fun p hp => fold_self_blind hF fibre_two_torsion_free p hp,
   fun w hw => fold_self_blind hP prod_two_torsion_free w hw⟩

/-! ## §2 — the eight banked faces, each projected from its capstone. -/

-- R1 face
theorem face_R1 :
    (∃ s : Standpoint, s.loc = 1) ∧ (¬ ∀ a : O ℚ, GluesGlobally a) :=
  ⟨standpoint_stratum.1, standpoint_stratum.2.1⟩

-- R2 face
theorem face_R2 {lookO : O Cut → O Cut} (hO : IsFold lookO) :
    (∀ x : O Cut, foldResidual lookO x = 0 ↔ x = 0)
    ∧ (∀ x : O Cut, x ≠ 0 → 0 < gFormC (foldResidual lookO x) (foldResidual lookO x)) :=
  ⟨(foldResidual_structure hO).1, (foldResidual_structure hO).2.2.2.1⟩

-- R3 face
theorem face_R3 :
    (∀ {β : Type} (g : O Cut → β) (p q : O Cut × O Cut), p.1 = q.1 →
        (g ∘ Prod.fst) p = (g ∘ Prod.fst) q)
    ∧ (∀ {look : O Cut × O Cut → O Cut × O Cut}, IsFold look →
        ∀ x : O Cut × O Cut, look x = x → x = 0) :=
  ⟨channel_quotient.1, channel_quotient.2.2.1⟩

-- R4 face
theorem face_R4 {lookF : StateFibre → StateFibre} (hF : IsFold lookF) :
    (∀ p : StateFibre, lookF p = p → p = 0)
    ∧ (∀ p, foldComplex (foldComplex p) = lookF p) :=
  ⟨(tower_termination hF).2.1, (tower_termination hF).2.2.1⟩

-- R5 face
theorem face_R5 (a : Cut) :
    ∀ C : Set Cut, (∃ p, p ∈ presentation C ∧ p ∉ C) ↔ ¬ GapFree C :=
  (completion_excess a).2.1

-- R6 face
theorem face_R6 :
    ((Finset.univ : Finset (Fin 5)).powerset.filter Coherent).card = 10
    ∧ (∀ S : Finset (Fin 5), Coherent S →
        ((closure ∈ S ∧ gather ∈ S ∧ gluing ∈ S) ↔ S = Finset.univ)) :=
  ⟨component_lattice.1, component_lattice.2.2.1⟩

-- R7 face
theorem face_R7 :
    (∀ a b : O ℚ, gluingDefect a b = fun x => assoc a b x)
    ∧ (∃ x y z : O ℚ, assoc x y z ≠ 0) :=
  ⟨arity_signature.1, arity_signature.2.2.2⟩

-- R7b face
theorem face_R7b (u v : O ℚ) :
    (∀ {x y z : O ℚ}, x ∈ NonUnitalAlgebra.adjoin ℚ ({u, v} : Set (O ℚ)) →
      y ∈ NonUnitalAlgebra.adjoin ℚ ({u, v} : Set (O ℚ)) →
      z ∈ NonUnitalAlgebra.adjoin ℚ ({u, v} : Set (O ℚ)) → assoc x y z = 0)
    ∧ (∃ x y z : O ℚ, assoc x y z ≠ 0) :=
  ⟨(generatedSubalgebra_artin u v).2.1, (generatedSubalgebra_artin u v).2.2⟩

end

end Phys.Algebra.StandpointArcConsolidation
