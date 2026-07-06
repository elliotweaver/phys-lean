import Phys.Algebra.ContinuumExpAntideriv

namespace Phys.Algebra.SlowRollProbe3

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- Work in terms of the abstract variable u (= cutExp(-(c*φ))) to isolate the algebra.
-- ε = 2c²u²/(1-u)²,  η = (-2c²u+4c²u²)/(1-u)² = 2c²u(2u-1)/(1-u)²
-- slow-roll dictionary: n_s = 1 + 2η - 6ε,  r = 16ε
-- N_lead = 1/(2c²u)  (from suppression 2c²u·N_lead=1)

-- EXACT identity 1: (n_s - 1) * N_lead = -2(1+u)/(1-u)²
-- (n_s-1) = 2η-6ε = [2(-2c²u+4c²u²) - 6·2c²u²]/(1-u)² = [-4c²u+8c²u²-12c²u²]/(1-u)²
--         = [-4c²u -4c²u²]/(1-u)² = -4c²u(1+u)/(1-u)²
-- times N_lead=1/(2c²u): = -4c²u(1+u)/(1-u)² · 1/(2c²u) = -2(1+u)/(1-u)²  ✓
example (c u : Cut) (hc : c ≠ 0) (hu : u ≠ 0) (h1u : (1:Cut)-u ≠ 0) :
    let ns1 := (2*(-2*c^2*u+4*c^2*u^2)/(1-u)^2) - (6*(2*c^2*u^2/(1-u)^2))
    let Nlead := 1/(2*c^2*u)
    ns1 * Nlead = -2*(1+u)/(1-u)^2 := by
  intro ns1 Nlead
  simp only [ns1, Nlead]
  have hc2 : (2:Cut)*c^2*u ≠ 0 := by
    have : c^2 ≠ 0 := pow_ne_zero 2 hc
    intro h; rcases mul_eq_zero.mp h with h' | h'
    · rcases mul_eq_zero.mp h' with h'' | h''
      · norm_num at h''
      · exact this h''
    · exact hu h'
  have h1u2 : (1-u)^2 ≠ 0 := pow_ne_zero 2 h1u
  field_simp
  ring

-- EXACT identity 2: r * (c² * N_lead²) = 8/(1-u)²
-- r = 16ε = 16·2c²u²/(1-u)² = 32c²u²/(1-u)²
-- c²·N_lead² = c²/(4c⁴u²) = 1/(4c²u²)
-- product = 32c²u²/(1-u)² · 1/(4c²u²) = 8/(1-u)²  ✓
example (c u : Cut) (hc : c ≠ 0) (hu : u ≠ 0) (h1u : (1:Cut)-u ≠ 0) :
    let r := 16*(2*c^2*u^2/(1-u)^2)
    let Nlead := 1/(2*c^2*u)
    r * (c^2 * Nlead^2) = 8/(1-u)^2 := by
  intro r Nlead
  simp only [r, Nlead]
  have hc2 : c^2 ≠ 0 := pow_ne_zero 2 hc
  have hu2 : u^2 ≠ 0 := pow_ne_zero 2 hu
  have h1u2 : (1-u)^2 ≠ 0 := pow_ne_zero 2 h1u
  field_simp
  ring

-- CORRECTION tie 1: n_s - 1 = (nsPlateau Nlead - 1) * corrNs u,  corrNs u = (1+u)/(1-u)²
-- nsPlateau Nlead - 1 = -2/Nlead = -2·2c²u = -4c²u
-- (n_s-1) = -4c²u(1+u)/(1-u)²  = (-4c²u)·(1+u)/(1-u)²  ✓  so corrNs u = (1+u)/(1-u)²
example (c u : Cut) (hc : c ≠ 0) (hu : u ≠ 0) (h1u : (1:Cut)-u ≠ 0) :
    let ns1 := (2*(-2*c^2*u+4*c^2*u^2)/(1-u)^2) - (6*(2*c^2*u^2/(1-u)^2))
    let Nlead := 1/(2*c^2*u)
    ns1 = (- (2/Nlead)) * ((1+u)/(1-u)^2) := by
  intro ns1 Nlead
  simp only [ns1, Nlead]
  have hc2 : c^2 ≠ 0 := pow_ne_zero 2 hc
  have h1u2 : (1-u)^2 ≠ 0 := pow_ne_zero 2 h1u
  field_simp
  ring

-- CORRECTION tie 2: r = rPlateau c Nlead * corrR u,  rPlateau c N = 8/(c²N²), corrR u = 1/(1-u)²
-- rPlateau c Nlead = 8/(c²·1/(4c⁴u²)) = 8·4c⁴u²/c² = 32c²u²
-- r = 32c²u²/(1-u)² = 32c²u² · 1/(1-u)²  ✓
example (c u : Cut) (hc : c ≠ 0) (hu : u ≠ 0) (h1u : (1:Cut)-u ≠ 0) :
    let r := 16*(2*c^2*u^2/(1-u)^2)
    let Nlead := 1/(2*c^2*u)
    r = (8/(c^2*Nlead^2)) * (1/(1-u)^2) := by
  intro r Nlead
  simp only [r, Nlead]
  have hc2 : c^2 ≠ 0 := pow_ne_zero 2 hc
  have hu2 : u^2 ≠ 0 := pow_ne_zero 2 hu
  have h1u2 : (1-u)^2 ≠ 0 := pow_ne_zero 2 h1u
  field_simp
  ring

-- corrNs, corrR at u=0 (attractor value 1)
example : ((1+(0:Cut))/(1-0)^2) = 1 := by norm_num
example : ((1:Cut)/(1-0)^2) = 1 := by norm_num
-- corrNs at u=1/2 = 6 (W8 non-constant teeth)
example : ((1+(1/2:Cut))/(1-1/2)^2) = 6 := by norm_num

end

end Phys.Algebra.SlowRollProbe3
