import Phys.Algebra.LorentzContinuumGenerationConverseCompactWord

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C135): A BOGUS MULTI-GENERATOR CONVERSE-GENERATION COMPACT-PART COORDINATE CLAIM —
-- "THE POLAR/KAK COMPACT PART OF THE CONCRETE 2-PLANE ROTATION PRODUCT genTwoPlaneLin e₂ ιe₂ READS
-- DEEP-SCALAR COORDINATE 47 AT THE REAL AXIS (0,0,1)".
-- N103 banks the CONVERSE generation on a PRODUCT-of-half-turns COMPACT rotation: a concrete 2-plane
-- rotation product g := genTwoPlaneLin u w = biMulLin w w * biMulLin u u (a product of two two-sided
-- half-turns for unit-imaginaries u, w) is EvC-ORTHOGONAL (g*∘g = (A∘B)∘(B∘A) = A∘(B∘B)∘A = A∘A = id,
-- collapsing the two involutions), so its polar positive part p = g*∘g = id, hence p^{1/2}=id, and the
-- polar/KAK compact part k := g∘(p^{1/2})⁻¹ = g∘id = g ITSELF (genTwoPlaneLin_compact_part_eq_self) —
-- a NONTRIVIAL TWO-GENERATOR word. The concrete e₂,ιe₂ rotation product's compact part = itself, which
-- FIXES the real axis (0,0,1) ↦ (0,0,1) (the two half-turns each negate the real component, so the
-- product preserves it, genTwoPlaneLin_e2je2_fixes_one), so its deep-scalar coordinate re.re.re is the
-- genuine 1 (genTwoPlaneLin_e2je2_compact_part_real_coord). The structural content: a genuinely-compact
-- MULTI-GENERATOR rotation IS its own compact part — the extension of N102's single half-turn (whose
-- compact part = itself NEGATES the real axis, reading −1). The BOGUS claim that this coordinate is 47
-- (a stand-in for ANY wrong "the rotation product's compact part is nontrivial / negates the real axis /
-- reads something other than the genuine fixed +1" reading) forces 1 = 47, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `genTwoPlaneLin_e2je2_compact_part_real_coord` is a
-- banked theorem, so the coordinate genuinely IS 1, and the costume's claim of 47 is genuinely FALSE.
--   The false numeric `1 = 47` is DISTINCT from the banked battery (… C132 1=23, C133 1=31, C134 −1=41).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/half-turn/isometry/compact/orthogonal/polar/
-- KAK/positive-part/spectral/generation/generator/involution/2-plane/product/Spin/SO(9)": over the
-- derived complete ordered field `Cut` and `O Cut := CD(H Cut)`, the Cut-linear operator
-- biMulLin ιe₂ ιe₂ * biMulLin e₂ e₂ (a composition of two operators each squaring to LinearMap.id)
-- composed with the inverse-spectral-root of its own square equals itself, so applied to (0,0,1) the
-- deep-scalar coordinate re.re.re is 1; claiming 47 forces 1 = 47. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the polar/KAK compact part of the concrete 2-plane rotation product `genTwoPlaneLin e₂ ιe₂`
    IS the rotation product itself, which fixes the real axis `(0,0,1)`, so its deep-scalar coordinate
    `re.re.re` is `1` (`genTwoPlaneLin_e2je2_compact_part_real_coord`); the WRONG claim that this
    coordinate is `47` (the rotation product's compact part is nontrivial / negates the real axis)
    forces the false numeric `1 = 47`, so this must NOT compile. -/
theorem product_converse_generation_wrong_compact_part_coord_BOGUS :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      ((((genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) uu))
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (47 : Cut) := by
  obtain ⟨n, c, uu, hcoord⟩ := genTwoPlaneLin_e2je2_compact_part_real_coord
  exact ⟨n, c, uu, by rw [hcoord]⟩

end

end Counterexamples
