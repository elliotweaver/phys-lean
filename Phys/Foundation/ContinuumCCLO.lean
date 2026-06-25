/-
  # N33 — The order-completeness of the DERIVED continuum, in Mathlib's standard idiom

  N6/N10–N14 banked the derived ℝ `ContinuumQ.Cut` as the completion of the
  gather-of-closures of the derived rationals `Q`: a `Field`, a `LinearOrder`, an
  `IsStrictOrderedRing`, Dedekind ORDER-COMPLETE in the bespoke form
  `completion_coherence_closed` (every gather `T : Cut → Prop` has a coherence point —
  the union cut). That bespoke completeness is exactly the standard order-theoretic
  least-upper-bound property in disguise; this file re-expresses it in Mathlib's STANDARD
  `IsLUB s (sSup s)` idiom and assembles `ConditionallyCompleteLinearOrder Cut`.

  WHY THIS NODE (the analytic sub-tower the N32 measurement forced). The automorphism
  group of the terminal Cayley–Dickson algebra is COMPACT because the definite Born form
  bounds its coordinate entries (N32 `aut_entry_abs_le_one`) — but "bounded + closed ⟹
  compact" (Heine–Borel) is a TOPOLOGICAL statement, and the derived ℝ carried no topology.
  This file supplies the missing rung: with `ConditionallyCompleteLinearOrder Cut`, the
  standard ORDER TOPOLOGY makes the derived ℝ a `CompactIccSpace`
  (`ConditionallyCompleteLinearOrder.toCompactIccSpace`), so `isCompact_Icc` — Heine–Borel
  on the derived continuum — becomes available as MACHINERY on the DERIVED object (STANDARD
  §3: a property OF the derived ℝ, never a posited number system / topology). This is the
  reframe-through-the-trunk: completeness IS the banked C6 eternal-approach / the
  gather-of-closures completion one level up (the SAME engine that built the cut), now
  spoken in the dialect the standard analytic/topology library understands.

  ★ NO posited ℝ / topology / exp / G₂. The carrier `Cut`, its order, and its completeness
  are all DERIVED (N6/N10–N14). Mathlib's `ConditionallyCompleteLattice` /
  `conditionallyCompleteLatticeOfLatticeOfsSup` / `IsLUB` are standard order MACHINERY
  applied to the derived object — the metalanguage in which "this derived ℝ is complete"
  is a theorem, not a borrowed number system.

  PHYSICS-WORDS-REMOVABLE: there are NO physics words in this file. It is the pure
  order-completeness of the completion of the gather-of-closures of the derived rationals.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import, NO posited ℝ.
-/
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Order.ConditionallyCompleteLattice.Basic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ
open scoped Classical

noncomputable section

/-! ## The supremum of a set of cuts = the union of their lower sets. -/

/-- The UNION lower-set of a set of cuts: a derived rational `q` lies in it iff SOME
    cut of the set already contains `q`. The candidate least upper bound — the SAME
    union-of-closures the banked `completion_coherence_closed` used for a gather,
    now over an arbitrary `Set Cut`. -/
def sSupCutS (s : Set Cut) (q : Q) : Prop := ∃ x ∈ s, x.S q

/-- For a NONEMPTY, BOUNDED-ABOVE set of cuts, the union lower-set is a genuine gather
    (a Dedekind cut): a verbatim port of the `hgather` block of
    `completion_coherence_closed`. `ne` from nonemptiness, `proper` from the upper bound,
    `down`/`nomax` inherited from the member cuts (the `nomax` up-step IS C6 eternal
    approach). -/
theorem sSupCutGather {s : Set Cut} (hne : s.Nonempty) (hbdd : BddAbove s) :
    IsGather (sSupCutS s) := by
  obtain ⟨x0, hx0⟩ := hne
  obtain ⟨xb, hxb⟩ := hbdd
  have hbound : ∀ y ∈ s, y ≤ xb := fun y hy => hxb hy
  refine ⟨?_, ?_, ?_, ?_⟩
  · obtain ⟨q, hq⟩ := x0.isG.ne
    exact ⟨q, x0, hx0, hq⟩
  · obtain ⟨b, hb⟩ := xb.isG.proper
    refine ⟨b, ?_⟩
    rintro ⟨y, hy, hyb⟩
    exact hb (hbound y hy b hyb)
  · rintro p q ⟨y, hy, hyq⟩ hpq
    exact ⟨y, hy, y.isG.down hyq hpq⟩
  · rintro q ⟨y, hy, hyq⟩
    obtain ⟨r, hyr, hqr⟩ := y.isG.nomax q hyq
    exact ⟨r, ⟨y, hy, hyr⟩, hqr⟩

/-- THE SUPREMUM of a set of cuts: the union cut when the set is nonempty & bounded
    above, else the junk value `0` (the standard `sSup`-of-unbounded convention). -/
def csSupCut (s : Set Cut) : Cut :=
  if h : s.Nonempty ∧ BddAbove s then ⟨sSupCutS s, sSupCutGather h.1 h.2⟩ else 0

noncomputable instance : SupSet Cut := ⟨csSupCut⟩

theorem csSupCut_eq {s : Set Cut} (hne : s.Nonempty) (hbdd : BddAbove s) :
    (sSup s : Cut) = ⟨sSupCutS s, sSupCutGather hne hbdd⟩ := by
  show csSupCut s = _
  rw [csSupCut, dif_pos ⟨hne, hbdd⟩]

theorem csSupCut_eq_zero {s : Set Cut} (h : ¬ (s.Nonempty ∧ BddAbove s)) :
    (sSup s : Cut) = 0 := by
  show csSupCut s = 0
  rw [csSupCut, dif_neg h]

/-- ★★ THE COMPLETENESS THEOREM in Mathlib's STANDARD form: every nonempty,
    bounded-above set of cuts has its union cut as LEAST UPPER BOUND. This is the banked
    Dedekind completeness (`completion_coherence_closed`) re-expressed so the standard
    order machinery applies to the DERIVED ℝ. Both directions are immediate from the
    cut order = lower-set inclusion: a member's lower set is contained in the union
    (upper bound), and any upper bound's lower set contains the union (least). -/
theorem isLUB_csSupCut (s : Set Cut) (hbdd : BddAbove s) (hne : s.Nonempty) :
    IsLUB s (sSup s) := by
  rw [csSupCut_eq hne hbdd]
  constructor
  · intro x hx
    rw [Cut.le_def]
    intro q hq
    exact ⟨x, hx, hq⟩
  · intro ub hub
    rw [Cut.le_def]
    rintro q ⟨x, hx, hxq⟩
    exact hub hx q hxq

/-- The derived ℝ has NO greatest element: `univ` is unbounded above (for any candidate
    bound `c`, `c + 1 > c` escapes it). Needed for the junk-value convention of `sInf`. -/
theorem not_bddAbove_univ : ¬ BddAbove (Set.univ : Set Cut) := by
  rintro ⟨c, hc⟩
  have hle : c + 1 ≤ c := hc (Set.mem_univ _)
  have h1 : (0 : Cut) < 1 := zero_lt_one
  linarith

/-! ## The derived ℝ is conditionally complete (Mathlib's standard structure). -/

/-- ★★ THE DERIVED ℝ IS A `ConditionallyCompleteLinearOrder`. The completion of the
    gather-of-closures of the derived rationals — with the banked `LinearOrder`, the
    union-cut supremum, and the standard-form completeness `isLUB_csSupCut` — is
    conditionally complete: every nonempty bounded set has a least upper bound and a
    greatest lower bound. `sInf` is the supremum of the lower bounds (Mathlib's default
    from `conditionallyCompleteLatticeOfLatticeOfsSup`). This is the analytic-tower rung
    the N32 compactness measurement forced: it unlocks the standard order topology and
    Heine–Borel (`isCompact_Icc`) on the DERIVED ℝ as machinery (STANDARD §3). NO posited
    ℝ / topology. -/
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

end
end ContinuumQ
end Phys.Foundation
