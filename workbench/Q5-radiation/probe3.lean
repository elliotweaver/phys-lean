import Mathlib.Tactic
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.Measurement

open Phys.Quantum
open Phys.Foundation.ContinuumQ

namespace ProbeRad3

noncomputable def radGather (p : StateFibre) : StateFibre := gatherIn p
noncomputable def lc (t x : Cut) : StateFibre := (t + x, t - x)
/-- inverse lightcone map `(u,v) ↦ ((u+v)/2, (u−v)/2)`. -/
noncomputable def unLc (p : StateFibre) : Cut × Cut := ((p.1 + p.2)/2, (p.1 - p.2)/2)

/-- ★ THE LIGHTCONE WELD: the retarded gather of a spacetime event's null coordinates keeps the
    outgoing coordinate `u = t+x` and zeroes the incoming `v = t−x`. -/
theorem radGather_lc (t x : Cut) : radGather (lc t x) = (t + x, 0) := by
  unfold radGather lc; rw [gatherIn_apply]

/-- ★★ OUTGOING RAY SELECTION (spacetime reading): the recovered event lies on the outgoing null
    ray `t = x` (equal time and space parts) — the retarded gather sends any event to the future
    light cone's outgoing generator. -/
theorem radGather_selects_outgoing_ray (t x : Cut) :
    (unLc (radGather (lc t x))).1 = (unLc (radGather (lc t x))).2 := by
  rw [radGather_lc]; unfold unLc; ring

end ProbeRad3
