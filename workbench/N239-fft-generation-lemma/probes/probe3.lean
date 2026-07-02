/-
  N239 probe3 — MEASURE the two riskiest pieces of the abs-irred (End_{g₂}(ImO)=ℚ) route:
  (A) the subalgebra-module field tower `finrank ℚ (adjoin ℚ {X}) * finrank (adjoin) ImO = 7`
      — the W9 diamond risk (DerivationSimpleCollapse flagged `SMul A (Fin n → S)` blowup);
  (B) `fieldOfFiniteDimensional` on `adjoin ℚ {X}` given it's a domain.

  Sorries allowed for the domain-ness (measured separately); this probe measures whether the
  MODULE-TOWER machinery over a subalgebra of `End ℚ ImO` elaborates at all.
-/
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.RingTheory.Adjoin.Field

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- MEASURE (A)+(B): given `X : End ℚ ImO` whose adjoin algebra is a domain, form the field
    `K := adjoin ℚ {X}`, make ImO a K-module by restriction, and run the field tower. Test
    whether the subalgebra-module diamond elaborates. -/
example (X : Module.End ℚ ImO)
    (hdom : IsDomain (Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO)))) :
    (Module.finrank ℚ (Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO)))) ∣ 7 := by
  set K := Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO)) with hKdef
  -- K is a field (finite-dim domain algebra over ℚ)
  haveI : IsDomain K := hdom
  letI : Field K := fieldOfFiniteDimensional ℚ K
  -- ImO is a module over End ℚ ImO (tautological), restrict scalars to K
  letI : Module K ImO := Module.compHom ImO (K.val : K →+* Module.End ℚ ImO)
  -- wait: Module.End ℚ ImO acts on ImO; need the ring hom K → End. K.val is the subalgebra incl.
  sorry

end

end Phys.Algebra
