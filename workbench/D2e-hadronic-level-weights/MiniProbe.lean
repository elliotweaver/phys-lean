import Phys.Algebra.HadronicSpectrum
import Phys.Algebra.DerivationAutCompact
import Mathlib.Tactic

namespace Phys.Algebra.MiniProbe
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
noncomputable section
attribute [local instance] CD.narCD CD.srCD

theorem fwd (w : O ℚ) (hlat : IntLat w) :
    ∀ k : Fin 8, ∃ m : ℤ, coordO w k = (m : ℚ) := by
  obtain ⟨⟨k0,h0⟩,⟨k1,h1⟩,⟨k2,h2⟩,⟨k3,h3⟩,⟨k4,h4⟩,⟨k5,h5⟩,⟨k6,h6⟩,⟨k7,h7⟩⟩ := hlat
  intro k
  fin_cases k
  · exact ⟨k0, by exact_mod_cast h0⟩
  · exact ⟨k1, by exact_mod_cast h1⟩
  · exact ⟨k2, by exact_mod_cast h2⟩
  · exact ⟨k3, by exact_mod_cast h3⟩
  · exact ⟨k4, by exact_mod_cast h4⟩
  · exact ⟨k5, by exact_mod_cast h5⟩
  · exact ⟨k6, by exact_mod_cast h6⟩
  · exact ⟨k7, by exact_mod_cast h7⟩

end
end Phys.Algebra.MiniProbe
