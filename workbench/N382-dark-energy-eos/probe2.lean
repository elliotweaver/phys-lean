import Phys.Algebra.SpacetimeCovariantDerivative
import Phys.Foundation.ContinuumExpDeriv
import Phys.Foundation.ContinuumLog
import Mathlib.Tactic

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

namespace ProbeN382

def cosmoStress (Λ : Cut) : MetricEnd := Λ • sigOpC
def cosmoDensity (Λ : Cut) : Cut := ((cosmoStress Λ) (1,0,0)).1
def cosmoPressure (Λ : Cut) : Cut := ((cosmoStress Λ) (0,1,0)).2.1
def scaleFactor (H t : Cut) : Cut := cutExp (H * t)

-- growth (W8 non-vacuity)
example (H t₁ t₂ : Cut) (hH : 0 < H) (ht : t₁ < t₂) :
    scaleFactor H t₁ < scaleFactor H t₂ := by
  unfold scaleFactor
  apply cutExp_strictMono
  exact (mul_lt_mul_left hH).mpr ht

-- also verify covariantly-constant link expresses via N357 cosmoTerm_covDeriv_zero
-- (cosmoStress Λ = Λ • sigOpC ; N357 uses Λ • sigOpC as the metric term)
example (Λ : Cut) (k : MetricEnd) :
    (Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0 :=
  (cosmoTerm_covDeriv_zero Λ k).2

end ProbeN382
