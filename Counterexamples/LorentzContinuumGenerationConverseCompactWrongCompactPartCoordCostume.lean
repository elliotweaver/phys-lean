import Phys.Algebra.LorentzContinuumGenerationConverseCompact

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C134): A BOGUS COMPACT-SECTOR CONVERSE-GENERATION COMPACT-PART COORDINATE CLAIM —
-- "THE POLAR/KAK COMPACT PART OF THE CONCRETE TWO-SIDED HALF-TURN biMulLin e₂ e₂ READS DEEP-SCALAR
-- COORDINATE 41 AT THE REAL AXIS (0,0,1)".
-- N102 banks the CONVERSE generation on the COMPACT (rotation) sector: a two-sided half-turn
-- g := biMulLin u u (a unit-imaginary u, gFormC u u=1, u·u=−1) is EvC-self-adjoint AND an involution
-- (g∘g=id), so its polar positive part p = g*∘g = g∘g = id, hence p^{1/2}=id, and the polar/KAK
-- compact part k := g∘(p^{1/2})⁻¹ = g∘id = g ITSELF (biMulLin_imag_compact_part_eq_self) — a NONTRIVIAL
-- single two-sided generator. Hence the concrete e₂ half-turn's compact part = itself, which NEGATES the
-- real axis (0,0,1) ↦ (0,0,−1) (since e₂·(1·e₂)=e₂·e₂=−1), so its deep-scalar coordinate re.re.re is the
-- genuine −1 (biMulLin_e2_compact_part_neg_coord). The structural content: a genuinely-compact (rotation)
-- generator IS its own compact part — the DUAL of the boost, whose compact part is the trivial identity
-- (reading +1 at the real axis, N101). The BOGUS claim that this coordinate is 41 (a stand-in for ANY
-- wrong "the half-turn's compact part is trivial / fixes the real axis / reads +1 like the boost"
-- reading) forces −1 = 41, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `biMulLin_e2_compact_part_neg_coord` is a banked
-- theorem, so the coordinate genuinely IS −1, and the costume's claim of 41 is genuinely FALSE.
--   The false numeric `-1 = 41` is DISTINCT from the banked battery (… C130 −1=17, C131 −1=29,
-- C132 1=23, C133 1=31).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/half-turn/isometry/compact/polar/KAK/
-- positive-part/spectral/generation/involution/Spin/SO(9)": over the derived complete ordered field
-- `Cut` and `O Cut := CD(H Cut)`, the EvC-self-adjoint Cut-linear operator biMulLin e₂ e₂ (which squares
-- to LinearMap.id) composed with the inverse-spectral-root of its own square equals itself, so applied to
-- (0,0,1) the deep-scalar coordinate re.re.re is −1; claiming 41 forces −1 = 41. The bite is a false
-- NUMERIC, name-independent.

/-- BOGUS: the polar/KAK compact part of the concrete two-sided half-turn `biMulLin e₂ e₂` IS the
    half-turn itself, which negates the real axis `(0,0,1)`, so its deep-scalar coordinate `re.re.re`
    is `−1` (`biMulLin_e2_compact_part_neg_coord`); the WRONG claim that this coordinate is `41` (the
    half-turn's compact part is trivial / fixes the real axis like the boost) forces the false numeric
    `−1 = 41`, so this must NOT compile. -/
theorem compact_converse_generation_wrong_compact_part_coord_BOGUS :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (((biMulLin (CD.e2 : O Cut) (CD.e2 : O Cut)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (41 : Cut) := by
  obtain ⟨n, c, uu, hcoord⟩ := biMulLin_e2_compact_part_neg_coord
  exact ⟨n, c, uu, by rw [hcoord]⟩

end

end Counterexamples
