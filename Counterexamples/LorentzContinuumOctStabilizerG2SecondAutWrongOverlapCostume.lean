import Phys.Algebra.LorentzContinuumOctStabilizerG2SecondAut

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C172): A BOGUS SECOND-AUTOMORPHISM / INDEPENDENCE / GAUGE-STRUCTURE / G₂ / AUTOMORPHISM
-- / NON-IDENTITY / STABILIZER / OCTONION-BLOCK / SO(8)/G₂ / SO⁺(1,9)-STRUCTURE CLAIM — "THE SECOND
-- NON-IDENTITY OCTONION AUTOMORPHISM's e₂ SELF-OVERLAP READ-OFF IS 140, NOT 1".
-- N140 banks A SECOND INDEPENDENT NON-IDENTITY G₂ AUTOMORPHISM: the INNER Cayley–Dickson involution
-- octInnerNeg ⟨a,b⟩ = ⟨hTopNeg a, hTopNeg b⟩ on the terminal algebra O Cut = CD (H Cut), applying the
-- H-rung top-half negation hTopNeg ⟨p,q⟩ = ⟨p,−q⟩ componentwise — it is multiplicative + unital
-- (octInnerNeg_isAlgAut : IsAlgAutCut octInnerNeg), genuinely MOVES the INNER generator
-- (octInnerNeg innerGen = −innerGen, octInnerNeg_innerGen) so it is NOT the identity (octInnerNeg_ne_refl),
-- and it FIXES the OUTER generator e₂ (octInnerNeg e₂ = e₂, octInnerNeg_e2) — OPPOSITE to N139's octTopNeg
-- (which negates e₂) — so the two are DISTINCT (octInnerNeg_ne_octTopNeg), a SECOND independent
-- non-identity direction; its octonion-block embedding lands in the gauge stabilizer octStab
-- (octBlockEndC_octInnerNeg_mem_octStab) — the gauge group G₂ = Aut(O) ⊂ SO(8) ⊂ stabilizer of SO⁺(1,9)
-- is STRICTLY LARGER THAN ℤ/2 (≥ 3 elements: id, octTopNeg, octInnerNeg).
--   THE READ-OFF: the SECOND non-identity gauge automorphism octInnerNeg FIXES e₂ and preserves its Born
-- self-overlap, gFormC (octInnerNeg e₂)(octInnerNeg e₂) = gFormC e₂ e₂ = 1 (octInnerNeg_gFormC_e2_eq_one
-- — the unit octonion e₂ has Born norm 1, and the automorphism fixes it).
--   The BOGUS claim that this self-overlap is 140 (a stand-in for ANY wrong second-automorphism /
-- independence / gauge-structure / G₂ / non-identity / stabilizer / octonion-block / SO(8)/G₂ /
-- SO⁺(1,9)-structure claim: the second automorphism fails to preserve the Born form / is not a
-- gFormC-isometry / fails to land in the stabilizer / is not actually distinct from octTopNeg / the
-- fixed axis e₂ is mis-read) forces (1 : Cut) = 140, and must NOT compile.
--   The bite is a true counterexample, not vacuous: octInnerNeg_gFormC_e2_eq_one is a banked theorem (the
-- second automorphism's e₂ self-overlap GENUINELY reads 1 over the derived field), so the costume's claim
-- of 140 is genuinely FALSE.
--   The false numeric `(1 : Cut) = 140` is DISTINCT from the banked battery (… C169 1=137, C170 1=138,
-- C171 1=139).
--   PHYSICS-WORDS-REMOVABLE: delete "gauge/G₂/SO(8)/Spin(7)/automorphism/derivation/Aut/Lorentz/
-- stabilizer/octonion/observer/internal-symmetry/isometry/independence/non-triviality": over the derived
-- complete ordered field `Cut`, O Cut := CD (H Cut), H Cut := CD (Dbl Cut), the Born form gFormC, and the
-- multiplicative-unital Cut-linear self-equiv octInnerNeg (⟨⟨p,q⟩,⟨r,s⟩⟩ ↦ ⟨⟨p,−q⟩,⟨r,−s⟩⟩, which fixes
-- ⟨0,1⟩), the scalar gFormC (octInnerNeg ⟨0,1⟩) (octInnerNeg ⟨0,1⟩) = 1; claiming 140 forces the false
-- numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the SECOND non-identity octonion algebra-automorphism `octInnerNeg` (the inner Cayley–Dickson
    involution) FIXES `e₂` and preserves its Born self-overlap read-off `1` (`octInnerNeg_gFormC_e2_eq_one`).
    The WRONG claim that it reads `140` (the second automorphism fails to preserve the form / is not a
    `gFormC`-isometry / fails to land in the gauge stabilizer / is not distinct from `octTopNeg` / the
    fixed axis is mis-read) forces the false numeric `(1 : Cut) = 140`, so this must NOT compile. -/
theorem oct_stabilizer_g2_second_aut_wrong_overlap_BOGUS :
    gFormC (octInnerNeg (CD.e2 : O Cut)) (octInnerNeg (CD.e2 : O Cut)) = (140 : Cut) := by
  rw [octInnerNeg_gFormC_e2_eq_one]

end

end Counterexamples
