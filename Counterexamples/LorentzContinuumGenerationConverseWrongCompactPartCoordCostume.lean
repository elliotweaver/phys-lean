import Phys.Algebra.LorentzContinuumGenerationConverse

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C133): A BOGUS CONVERSE-GENERATION COMPACT-PART COORDINATE CLAIM — "THE POLAR/KAK
-- COMPACT PART OF THE CONCRETE BOOST (5/3, 4/3) READS TIME COORDINATE 31 AT THE PURE-TIME VECTOR
-- (1,0,0)".
-- N101 banks the CONVERSE generation on the boost (non-compact) sector: a proper orthochronous boost
-- boostEndC a b (a²−b²=1, a±b≥0) is EvC-self-adjoint AND EvC-positive-semidefinite, so it IS its own
-- polar positive part p^{1/2} = √(g*g); by positive-operator-root uniqueness on the injective square
-- the spectral root EQUALS the boost, so the polar compact part k := g∘(p^{1/2})⁻¹ = p^{1/2}∘(p^{1/2})⁻¹
-- = IDENTITY (boostEndC_compact_part_eq_id). Hence the concrete boost (5/3,4/3) — a point on the unit
-- hyperbola (5/3)²−(4/3)²=1 — has compact part = id, which fixes the pure-time vector (1,0,0), so its
-- time coordinate .1 is the genuine 1 (boostEndC_5343_compact_part_id_coord). The structural content:
-- a pure boost contributes the TRIVIAL element to the compact-generation problem — its compact part is
-- the identity, carrying no rotation content. The BOGUS claim that this time coordinate is 31 (a
-- stand-in for ANY wrong "the boost's compact part is a nontrivial rotation / the compact part
-- distorts the time axis" reading) forces 1 = 31, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `boostEndC_5343_compact_part_id_coord` is a banked
-- theorem, so the time coordinate genuinely IS 1, and the costume's claim of 31 is genuinely FALSE.
--   The false numeric `1 = 31` is DISTINCT from the banked battery (… C130 −1=17, C131 −1=29,
-- C132 1=23).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/isometry/compact/polar/KAK/positive-part/spectral/
-- generation/rotation/Spin/SO(9)": over the derived complete ordered field `Cut` and `O Cut := CD(H Cut)`,
-- the self-adjoint positive-semidefinite Cut-linear operator boostEndC (5/3)(4/3) composed with the
-- inverse-spectral-root of its own square equals LinearMap.id, so applied to (1,0,0) the first
-- coordinate is 1; claiming 31 forces 1 = 31. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the polar/KAK compact part of the concrete boost `(5/3, 4/3)` IS the identity, so applied
    to the pure-time vector `(1,0,0)` its first coordinate is `1`
    (`boostEndC_5343_compact_part_id_coord`); the WRONG claim that this coordinate is `31` (the boost's
    compact part is a nontrivial rotation / distorts the time axis) forces the false numeric `1 = 31`,
    so this must NOT compile. -/
theorem converse_generation_wrong_compact_part_coord_BOGUS :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      ((boostEndC ((5 : Cut)/3) ((4 : Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u) ((1 : Cut), (0 : Cut), (0 : O Cut))).1 = 31 := by
  obtain ⟨n, c, u, hcoord⟩ := boostEndC_5343_compact_part_id_coord
  exact ⟨n, c, u, by rw [hcoord]⟩

end

end Counterexamples
