import Phys.Algebra.MirrorTermLanguage
import Phys.Algebra.MirrorRootGlobal
import Phys.Algebra.MirrorSelfInsertionLaw

/-!
  # SCRATCH N676 — MirrorResidualWelded: the certified equation is DEFINITIONALLY the
  # assembled one (the 16/9-literal re-weld, H5 closed)
  PREREG: workbench/mirror-closure/PREREG-AIRTIGHT.md (N676).
-/

namespace Phys.Algebra
namespace MirrorFixedPoint
open Phys.Foundation.ContinuumQ
open Phys.Algebra.MirrorSelfInsertionLaw
open Set

noncomputable section

/-- ★ THE WELDED RESIDUAL: the fixed-point equation with the mirror coefficient ASSEMBLED
    (`mirrorCoeff = chargeTraceDepth · depthWeight`, the two banked theorems) rather than
    written as the literal `16/9`. The equation whose root is certified is now
    definitionally the assembled one — no downstream `rfl` hop. -/
noncomputable def residualWelded (a : Cut) : Cut :=
  a * F0 - mirrorCoeff * kappaLeading * a^3 - 1

/-- ★ THE WELD: the welded residual IS the banked residual (the coefficient evaluates to
    16/9 by `mirrorCoeff_eq`). -/
theorem residualWelded_eq (a : Cut) : residualWelded a = residual a := by
  rw [residualWelded, residual, mirrorCoeff_eq]

/-- ★★ The welded residual vanishes exactly where the banked one does. -/
theorem residualWelded_root_iff (a : Cut) : residualWelded a = 0 ↔ residual a = 0 := by
  rw [residualWelded_eq]

/-- The welded residual is continuous (through the weld). -/
theorem residualWelded_continuous : Continuous residualWelded := by
  have h : residualWelded = residual := funext residualWelded_eq
  rw [h]; exact residual_continuous

/-- ★★★ THE WELDED GLOBAL LANDING: the ASSEMBLED equation has exactly one root in the
    structural coupling domain (0,1), with the certified 11-digit bracket — the auditor's
    "the 16/9 is a literal in the residual" gap closed: the certified object is now the
    welded (assembled-coefficient) equation itself. -/
theorem invAlpha_certified_welded :
    ∃! a : Cut, a ∈ Ioo (0:Cut) 1 ∧ residualWelded a = 0
      ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
      ∧ 1/a ≤ 1370359990778029 / 10000000000000 := by
  obtain ⟨a, ⟨haIoo, hroot, hlo, hhi⟩, huniq⟩ := invAlpha_certified_global
  refine ⟨a, ⟨haIoo, (residualWelded_root_iff a).mpr hroot, hlo, hhi⟩, ?_⟩
  intro b ⟨hbIoo, hbr, hblo, hbhi⟩
  exact huniq b ⟨hbIoo, (residualWelded_root_iff b).mp hbr, hblo, hbhi⟩

end
end MirrorFixedPoint
end Phys.Algebra
