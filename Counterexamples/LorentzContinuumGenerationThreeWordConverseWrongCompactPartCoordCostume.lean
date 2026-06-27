import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C136): A BOGUS THREE-GENERATOR CONVERSE-GENERATION COMPACT-PART COORDINATE CLAIM —
-- "THE POLAR/KAK COMPACT PART OF THE CONCRETE THREE-HALF-TURN WORD triHalfTurnLin e₂ ιe₂ e₂ READS
-- DEEP-SCALAR COORDINATE 53 AT THE REAL AXIS (0,0,1)".
-- N104 banks THE GENERAL EvC-ORTHOGONAL LEVER: an EvC-ORTHOGONAL (h∘g = id) QvC-isometry g is its own
-- polar/KAK compact part (p = h∘g = id ⟹ p^{1/2}=id ⟹ k = g∘id = g), WORD-LENGTH-INDEPENDENT
-- (evCOrthogonal_compact_part_eq_self). Demonstrated past length two with a concrete THREE-half-turn word
-- triHalfTurnLin u w x := biMulLin x x * genTwoPlaneLin u w (built ON the banked two-word): it is a
-- QvC-isometry, EvC-adjoint to genTwoPlaneLin w u * biMulLin x x, and EvC-ORTHOGONAL (the middle
-- involution C∘C=id collapses, then the banked two-word orthogonality finishes), so by the lever its
-- compact part = the three-word itself (triHalfTurnLin_compact_part_eq_self). The concrete e₂,ιe₂,e₂
-- three-word's compact part = itself NEGATES the real axis (0,0,1): the banked two-word FIXES it (+1),
-- then the outer half-turn biMulLin e₂ e₂ negates the real component (e₂·(1·e₂) = e₂·e₂ = −1), so its
-- deep-scalar coordinate re.re.re is the genuine −1 (triHalfTurnLin_e2je2e2_compact_part_real_coord). The
-- structural content: a genuinely-compact THREE-GENERATOR word IS its own compact part — the lever past
-- N103's length two. The BOGUS claim that this coordinate is 53 (a stand-in for ANY wrong "the three-word's
-- compact part reads something other than the genuine −1 / fixes the real axis / is the two-word value +1"
-- reading) forces −1 = 53, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `triHalfTurnLin_e2je2e2_compact_part_real_coord` is a
-- banked theorem, so the coordinate genuinely IS −1, and the costume's claim of 53 is genuinely FALSE.
--   The false numeric `−1 = 53` is DISTINCT from the banked battery (… C133 1=31, C134 −1=41, C135 1=47).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/half-turn/isometry/compact/orthogonal/polar/
-- KAK/positive-part/spectral/generation/generator/involution/3-plane/word/product/Spin/SO(9)": over the
-- derived complete ordered field `Cut` and `O Cut := CD(H Cut)`, the Cut-linear operator
-- biMulLin e₂ e₂ * (biMulLin ιe₂ ιe₂ * biMulLin e₂ e₂) (a composition of operators each squaring to
-- LinearMap.id) composed with the inverse-spectral-root of its own square equals itself, so applied to
-- (0,0,1) the deep-scalar coordinate re.re.re is −1; claiming 53 forces −1 = 53. The bite is a false
-- NUMERIC, name-independent.

/-- BOGUS: the polar/KAK compact part of the concrete three-half-turn word `triHalfTurnLin e₂ ιe₂ e₂`
    IS the three-word itself, which negates the real axis `(0,0,1)`, so its deep-scalar coordinate
    `re.re.re` is `−1` (`triHalfTurnLin_e2je2e2_compact_part_real_coord`); the WRONG claim that this
    coordinate is `53` (the three-word's compact part fixes the real axis / reads the two-word value)
    forces the false numeric `−1 = 53`, so this must NOT compile. -/
theorem three_word_converse_generation_wrong_compact_part_coord_BOGUS :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      ((((triHalfTurnLin (CD.e2 : O Cut) (je2 : O Cut) (CD.e2 : O Cut)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) uu))
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (53 : Cut) := by
  obtain ⟨n, c, uu, hcoord⟩ := triHalfTurnLin_e2je2e2_compact_part_real_coord
  exact ⟨n, c, uu, by rw [hcoord]⟩

end

end Counterexamples
