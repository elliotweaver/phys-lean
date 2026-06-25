/-
  N33 SCRATCH 2 — assemble ConditionallyCompleteLinearOrder Cut + confirm Heine-Borel
  machinery (CompactIccSpace / isCompact_Icc) becomes reachable on the derived ℝ.
-/
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Topology.Order.Compact

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ
open scoped Classical

noncomputable section

def sSupCutS (s : Set Cut) (q : Q) : Prop := ∃ x ∈ s, x.S q

theorem sSupCutGather {s : Set Cut} (hne : s.Nonempty) (hbdd : BddAbove s) :
    IsGather (sSupCutS s) := by
  obtain ⟨x0, hx0⟩ := hne
  obtain ⟨xb, hxb⟩ := hbdd
  have hbound : ∀ y ∈ s, y ≤ xb := fun y hy => hxb hy
  refine ⟨?_, ?_, ?_, ?_⟩
  · obtain ⟨q, hq⟩ := x0.isG.ne; exact ⟨q, x0, hx0, hq⟩
  · obtain ⟨b, hb⟩ := xb.isG.proper
    refine ⟨b, ?_⟩; rintro ⟨y, hy, hyb⟩; exact hb (hbound y hy b hyb)
  · rintro p q ⟨y, hy, hyq⟩ hpq; exact ⟨y, hy, y.isG.down hyq hpq⟩
  · rintro q ⟨y, hy, hyq⟩
    obtain ⟨r, hyr, hqr⟩ := y.isG.nomax q hyq
    exact ⟨r, ⟨y, hy, hyr⟩, hqr⟩

def csSupCut (s : Set Cut) : Cut :=
  if h : s.Nonempty ∧ BddAbove s then ⟨sSupCutS s, sSupCutGather h.1 h.2⟩ else 0

noncomputable instance : SupSet Cut := ⟨csSupCut⟩

theorem csSupCut_eq {s : Set Cut} (hne : s.Nonempty) (hbdd : BddAbove s) :
    (sSup s : Cut) = ⟨sSupCutS s, sSupCutGather hne hbdd⟩ := by
  show csSupCut s = _; rw [csSupCut, dif_pos ⟨hne, hbdd⟩]

theorem csSupCut_eq_zero {s : Set Cut} (h : ¬ (s.Nonempty ∧ BddAbove s)) :
    (sSup s : Cut) = 0 := by
  show csSupCut s = 0; rw [csSupCut, dif_neg h]

theorem isLUB_csSupCut (s : Set Cut) (hbdd : BddAbove s) (hne : s.Nonempty) :
    IsLUB s (sSup s) := by
  rw [csSupCut_eq hne hbdd]
  constructor
  · intro x hx; rw [Cut.le_def]; intro q hq; exact ⟨x, hx, hq⟩
  · intro ub hub; rw [Cut.le_def]; rintro q ⟨x, hx, hxq⟩; exact hub hx q hxq

/-- The derived ℝ has NO greatest element: `univ` is unbounded above (for any `c`,
    `c + 1 > c`). Needed for the junk-value convention of `sInf`. -/
theorem not_bddAbove_univ : ¬ BddAbove (Set.univ : Set Cut) := by
  rintro ⟨c, hc⟩
  have hle : c + 1 ≤ c := hc (Set.mem_univ _)
  have h1 : (0 : Cut) < 1 := zero_lt_one
  linarith

/-- ★★ THE DERIVED ℝ IS CONDITIONALLY COMPLETE in Mathlib's standard idiom. -/
noncomputable instance condCompleteLinearOrder : ConditionallyCompleteLinearOrder Cut where
  __ := conditionallyCompleteLatticeOfLatticeOfsSup Cut isLUB_csSupCut
  le_total := le_total
  toDecidableLE := Classical.decRel _
  csSup_of_not_bddAbove := by
    intro s hs
    rw [csSupCut_eq_zero (fun h => hs h.2),
        csSupCut_eq_zero (fun h => Set.not_nonempty_empty h.1)]
  csInf_of_not_bddBelow := by
    intro s hs
    show sSup (lowerBounds s) = sSup (lowerBounds ∅)
    rw [csSupCut_eq_zero (fun h => hs h.1),
        csSupCut_eq_zero (fun h => not_bddAbove_univ (by simpa using h.2))]

-- Confirm the order topology + Heine-Borel become reachable on the DERIVED ℝ:
example : True := by
  letI : TopologicalSpace Cut := Preorder.topology Cut
  haveI : OrderTopology Cut := ⟨rfl⟩
  haveI : CompactIccSpace Cut := ConditionallyCompleteLinearOrder.toCompactIccSpace Cut
  have : ∀ a b : Cut, IsCompact (Set.Icc a b) := fun _ _ => isCompact_Icc
  trivial

end
end ContinuumQ
end Phys.Foundation
