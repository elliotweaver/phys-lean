/-
  Counterexamples.ForcedStopGenericNormCostume — N2d STOP costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming the GENERIC self-overlap norm `Nrm` STAYS
  multiplicative at the terminal algebra `S ℚ = CD (O ℚ)` — i.e. that the composition
  law `Nrm (x y) = Nrm x · Nrm y` survives past `𝕆` on the canonical N2c witnesses.
  The whole content of N2d's deepening is that the generic norm DIES at the stop
  (`Phys/Cascade/ForcedStop.lean` `genNrm_not_mul_at_S`: `Nrm (zdX · zdY) ≠ Nrm zdX ·
  Nrm zdY`, left side `0`, right side projects to `4`). Claiming the law holds on the
  witnesses is FALSE: the kernel must REJECT it. If it ever COMPILES, the generic
  composition law would survive past `𝕆` — exactly the WRONG STOP the battery exists
  to catch (and it would mean the concrete N2c stop was a scalar-projection artifact,
  which `genNrm_not_mul_at_S` refutes).

  The manifest's PASS_SIGNATURE matches the elaboration error below (the false core
  `0 = 4` after projecting through `.re.re.re` and reducing with the proved facts).
-/
import Phys.Cascade.ForcedStop
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

/-- WRONG STOP: claiming the GENERIC norm's composition law holds at the stop on the
    canonical witnesses (`Nrm (zdX · zdY) = Nrm zdX · Nrm zdY`). False: projecting
    both sides to the base scalar gives `0` on the left (`Nrm` of the vanished
    product) and `4` on the right. Reducing with the proved facts leaves the false
    core `0 = 4`, so this must FAIL to elaborate. -/
theorem forcedstop_generic_norm_holds_BOGUS :
    (CD.Nrm (zdX * zdY)).re.re.re = (CD.Nrm zdX * CD.Nrm zdY).re.re.re := by
  rw [Nrm_zd_prod, Nrm_prod_proj]
  simp only [CD.zero_re, Dbl.zero_re]
