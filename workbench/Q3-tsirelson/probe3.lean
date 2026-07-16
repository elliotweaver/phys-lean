import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Composite

namespace Phys.Quantum.Q3Probe
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

theorem cs (a b : StateFibre) : (bornForm a b)^2 ≤ bornForm a a * bornForm b b := by
  unfold bornForm; nlinarith [sq_nonneg (a.1*b.2 - a.2*b.1)]

noncomputable def chsh (a1 a2 b1 b2 : StateFibre) : Cut :=
  bornForm a1 b1 + bornForm a1 b2 + bornForm a2 b1 - bornForm a2 b2

-- rewrite chsh as bornForm a1 (b1+b2) + bornForm a2 (b1-b2)
theorem chsh_regroup (a1 a2 b1 b2 : StateFibre) :
    chsh a1 a2 b1 b2 = bornForm a1 (b1+b2) + bornForm a2 (b1-b2) := by
  unfold chsh bornForm; simp [Prod.add_def, Prod.sub_def]; ring

-- The Tsirelson bound squared: chsh^2 ≤ 8 for unit settings
theorem chsh_sq_le_eight (a1 a2 b1 b2 : StateFibre)
    (ha1 : bornForm a1 a1 = 1) (ha2 : bornForm a2 a2 = 1)
    (hb1 : bornForm b1 b1 = 1) (hb2 : bornForm b2 b2 = 1) :
    (chsh a1 a2 b1 b2)^2 ≤ 8 := by
  rw [chsh_regroup]
  set u := b1 + b2 with hu
  set v := b1 - b2 with hv
  -- p = bornForm a1 u, q = bornForm a2 v
  have hp : (bornForm a1 u)^2 ≤ bornForm u u := by
    have := cs a1 u; rw [ha1] at this; linarith
  have hq : (bornForm a2 v)^2 ≤ bornForm v v := by
    have := cs a2 v; rw [ha2] at this; linarith
  -- parallelogram: bf u u + bf v v = 2 + 2 = 4
  have hpar : bornForm u u + bornForm v v = 4 := by
    have : bornForm u u + bornForm v v = 2 * bornForm b1 b1 + 2 * bornForm b2 b2 := by
      rw [hu, hv]; unfold bornForm; simp [Prod.add_def, Prod.sub_def]; ring
    rw [this, hb1, hb2]; norm_num
  nlinarith [hp, hq, hpar, sq_nonneg (bornForm a1 u - bornForm a2 v)]

end Phys.Quantum.Q3Probe
