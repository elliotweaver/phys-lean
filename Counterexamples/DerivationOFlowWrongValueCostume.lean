import Phys.Algebra.DerivationOFlow

namespace Counterexamples

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C209): A BOGUS ONE-PARAMETER-FLOW CLAIM — "THE EXPONENTIAL AUTOMORPHISM FLOW IS NOT
-- ADDITIVE IN ITS PARAMETER / COMPOSING THE FLOW AT PARAMETER s WITH THE FLOW AT PARAMETER t DOES NOT
-- LAND AT PARAMETER s+t".
-- N177 banks the ONE-PARAMETER FLOW LAW expOLin (s•D') ∘ expOLin (t•D') = expOLin ((s+t)•D')
-- (expOLin_flow_apply / expOLin_flow / expO_flow) and the bundled one-parameter SUBGROUP
-- (expOEquiv (t•D')).trans (expOEquiv (s•D')) = expOEquiv ((s+t)•D') (expOEquiv_flow), with identity
-- element at parameter 0 (expOLin_smul_zero / expOEquiv_smul_zero). The DEFINING new structure — the
-- piece the static N41f automorphism and its discrete inverse (the s=1,t=-1 special case) do NOT express
-- — is that the parameter combines ADDITIVELY: the map t ↦ expOEquiv (t•D') is an ADDITIVE-group
-- homomorphism (Cut,+) → Aut(O Cut). The proof rests on `← add_smul` collecting s•M + t•M into (s+t)•M
-- (the matrix homomorphism law expMap_mul_of_commute N40 transported through derivMatrix_smul N41g). So
-- composing the flow at parameter (1 : Cut) with the flow at parameter (176 : Cut) lands at parameter
-- (1 : Cut) + (176 : Cut) = (177 : Cut) EXACTLY — never at parameter 1 (which a wrong NON-additive /
-- idempotent flow law would claim).
--   THE BOGUS claim that the additive flow parameter (1 : Cut) + (176 : Cut) (a stand-in for ANY wrong
-- parameter law: the flow has no additivity / composing two flows does not add the parameters /
-- expOLin_flow lands at the wrong parameter) equals (1 : Cut) forces, after evaluating the genuine
-- additive parameter (which is exactly 177 = 1 + 176), the false numeric `(177 : Cut) = (1 : Cut)` and
-- must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine flow parameter (1 : Cut) + (176 : Cut)
-- is 177 (it GENUINELY is the s+t the additive one-parameter group law produces — expOLin_flow_apply
-- collects exactly this sum via `← add_smul`), so claiming it collapses back to parameter 1 is genuinely
-- FALSE (177 ≠ 1 in the derived ordered field Cut, characteristic 0).
--   The false numeric `177 = 1` (≡ `1 = 177`) is DISTINCT from the banked battery (… C206 1=174, C207
-- 1=175, C208 1=176).
--   PHYSICS-WORDS-REMOVABLE: there are NO physics words; delete "exp"/"flow"/"automorphism"/"one-parameter
-- group"/"parameter" and the value (1 : Cut) + (176 : Cut) over the derived ordered field Cut equals 177;
-- claiming it equals 1 forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the additive one-parameter-flow parameter `(1 : Cut) + (176 : Cut)` — the parameter at which
    the composition `expOLin (1•D') ∘ expOLin (176•D')` lands by the N177 flow law `expOLin_flow_apply`
    (`expOLin (s•D') ∘ expOLin (t•D') = expOLin ((s+t)•D')`, the additive one-parameter group) — equals
    `(1 : Cut)`. It GENUINELY equals `177` (`(1 : Cut) + (176 : Cut) = 177`, the literal `s+t` the flow
    collects via `← add_smul`). The WRONG claim that it is `1` (the flow is non-additive / idempotent in
    its parameter / the composed flow stays at parameter 1) reduces to the false numeric
    `(177 : Cut) = (1 : Cut)`, so this must NOT compile. -/
theorem expOLin_flow_additive_param_wrong_value_BOGUS :
    ((1 : Cut) + (176 : Cut)) = (1 : Cut) := by
  rw [show (1 : Cut) + (176 : Cut) = (177 : Cut) by norm_num]

end

end Counterexamples
