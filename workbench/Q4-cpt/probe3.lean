import Mathlib.Tactic
import Phys.Quantum.BornRule
import Phys.Algebra.ParityMirrorObstruction
import Phys.Algebra.ChiralGenerationAnomalyCancellation

namespace Phys.Quantum.CPTProbe3
open Phys.Foundation Phys.Cascade Phys.Quantum
open Phys.Foundation.ContinuumQ

noncomputable def cP (p : StateFibre) : StateFibre := (-p.1, p.2)
noncomputable def cT (p : StateFibre) : StateFibre := (p.1, -p.2)
noncomputable def cC (p : StateFibre) : StateFibre := (-p.1, -p.2)

-- Klein-4 relation: P∘T = C
example (p : StateFibre) : cP (cT p) = cC p := by unfold cP cT cC; simp
example (p : StateFibre) : cT (cP p) = cC p := by unfold cP cT cC; simp
-- THE HEART: C∘P∘T = id
example (p : StateFibre) : cC (cP (cT p)) = p := by unfold cP cT cC; simp
-- pairwise commute
example (p : StateFibre) : cC (cP p) = cP (cC p) := by unfold cP cC; simp
example (p : StateFibre) : cC (cT p) = cT (cC p) := by unfold cT cC; simp

-- composite ω sign: CP = cC∘cP reverses ω
example (x y : StateFibre) :
    kahlerForm (cC (cP x)) (cC (cP y)) = - kahlerForm x y := by
  rw [kahlerForm_apply, kahlerForm_apply]; unfold cC cP; ring
-- CT = cC∘cT reverses ω
example (x y : StateFibre) :
    kahlerForm (cC (cT x)) (cC (cT y)) = - kahlerForm x y := by
  rw [kahlerForm_apply, kahlerForm_apply]; unfold cC cT; ring
-- PT = cP∘cT preserves ω
example (x y : StateFibre) :
    kahlerForm (cP (cT x)) (cP (cT y)) = kahlerForm x y := by
  rw [kahlerForm_apply, kahlerForm_apply]; unfold cP cT; ring
-- CPT preserves ω (the composite symmetry)
example (x y : StateFibre) :
    kahlerForm (cC (cP (cT x))) (cC (cP (cT y))) = kahlerForm x y := by
  rw [kahlerForm_apply, kahlerForm_apply]; unfold cC cP cT; ring

#check @Phys.Algebra.chirality_operator_is_selfblind_fold

-- CPT preserves bornProb
example (x y : StateFibre) :
    bornProb (cC (cP (cT x))) (cC (cP (cT y))) = bornProb x y := by
  unfold bornProb; unfold cC cP cT bornForm; rw [kahlerForm_apply, kahlerForm_apply]; ring

end Phys.Quantum.CPTProbe3
