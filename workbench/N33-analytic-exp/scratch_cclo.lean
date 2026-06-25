/-
  N33 SCRATCH — ConditionallyCompleteLinearOrder Cut (the order-completeness of the
  derived ℝ in Mathlib's STANDARD IsLUB form). Test isolated before production.
-/
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Order.ConditionallyCompleteLattice.Basic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ
open scoped Classical

noncomputable section

/-- The UNION lower-set of a set of cuts: a derived rational `q` lies in it iff SOME
    cut of the set already contains `q`. The candidate supremum (least upper bound).
    The SAME union-of-closures as the banked `completion_coherence_closed`, now over an
    arbitrary `Set Cut`. -/
def sSupCutS (s : Set Cut) (q : Q) : Prop := ∃ x ∈ s, x.S q

/-- For a NONEMPTY, BOUNDED-ABOVE set of cuts, the union lower-set is a genuine gather.
    A verbatim port of the `hgather` block of `completion_coherence_closed`: `ne` from
    nonemptiness, `proper` from the upper bound, `down`/`nomax` from the member cuts. -/
theorem sSupCutGather {s : Set Cut} (hne : s.Nonempty) (hbdd : BddAbove s) :
    IsGather (sSupCutS s) := by
  obtain ⟨x0, hx0⟩ := hne
  obtain ⟨xb, hxb⟩ := hbdd   -- xb ∈ upperBounds s : ∀ y ∈ s, y ≤ xb
  have hbound : ∀ y ∈ s, y ≤ xb := fun y hy => hxb hy
  refine ⟨?_, ?_, ?_, ?_⟩
  · -- ne
    obtain ⟨q, hq⟩ := x0.isG.ne
    exact ⟨q, x0, hx0, hq⟩
  · -- proper
    obtain ⟨b, hb⟩ := xb.isG.proper
    refine ⟨b, ?_⟩
    rintro ⟨y, hy, hyb⟩
    exact hb (hbound y hy b hyb)
  · -- down
    rintro p q ⟨y, hy, hyq⟩ hpq
    exact ⟨y, hy, y.isG.down hyq hpq⟩
  · -- nomax
    rintro q ⟨y, hy, hyq⟩
    obtain ⟨r, hyr, hqr⟩ := y.isG.nomax q hyq
    exact ⟨r, ⟨y, hy, hyr⟩, hqr⟩

/-- The SUPREMUM of a set of cuts: the union cut when nonempty & bounded above, else a
    junk value (0). -/
def csSupCut (s : Set Cut) : Cut :=
  if h : s.Nonempty ∧ BddAbove s then ⟨sSupCutS s, sSupCutGather h.1 h.2⟩ else 0

noncomputable instance : SupSet Cut := ⟨csSupCut⟩

theorem csSupCut_eq {s : Set Cut} (hne : s.Nonempty) (hbdd : BddAbove s) :
    (sSup s : Cut) = ⟨sSupCutS s, sSupCutGather hne hbdd⟩ := by
  show csSupCut s = _
  rw [csSupCut, dif_pos ⟨hne, hbdd⟩]

/-- ★★ THE COMPLETENESS THEOREM in Mathlib's STANDARD form: every nonempty bounded-above
    set of cuts has its union cut as LEAST UPPER BOUND. The banked Dedekind completeness
    (`completion_coherence_closed`) re-expressed so the standard order machinery applies
    to the DERIVED ℝ. -/
theorem isLUB_csSupCut (s : Set Cut) (hbdd : BddAbove s) (hne : s.Nonempty) :
    IsLUB s (sSup s) := by
  rw [csSupCut_eq hne hbdd]
  constructor
  · -- upper bound: every x ∈ s is ≤ the union cut
    intro x hx
    rw [Cut.le_def]
    intro q hq
    exact ⟨x, hx, hq⟩
  · -- least: any upper bound ub dominates the union cut
    intro ub hub
    rw [Cut.le_def]
    rintro q ⟨x, hx, hxq⟩
    exact hub hx q hxq

end
end ContinuumQ
end Phys.Foundation
