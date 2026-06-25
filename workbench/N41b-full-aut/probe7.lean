import Phys.Algebra.DerivationSkew
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Topology.Constructions

open Phys.Cascade Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

-- Does cdSmulQ exist as a GLOBAL instance that would diamond a generic SMul Cut?
-- cdSmulQ : [SMul ℚ A] → SMul ℚ (CD A).  My scalar is Cut, not ℚ.
-- Check: is there SMul Cut (O Cut) already?  (via Dbl's SMul R (Dbl R) chain)
attribute [local instance] CD.narCD CD.srCD

-- Dbl Cut has SMul Cut (Dbl Cut) from ComplexUnit's `SMul R (Dbl R)`.
example : SMul Cut (Dbl Cut) := inferInstance

-- generic CD SMul reusing base scalar
namespace CDtest
variable {A : Type*}
instance instSMulC {R : Type*} [SMul R A] : SMul R (CD A) := ⟨fun r z => ⟨r • z.re, r • z.im⟩⟩
end CDtest

-- Does SMul Cut (O Cut) now synthesize (O Cut = CD (CD (Dbl Cut)))?
example : SMul Cut (O Cut) := inferInstance

-- Does it diamond with cdSmulQ for ℚ?  Check SMul ℚ (O ℚ) still resolves.
example : SMul ℚ (O ℚ) := inferInstance

end
