import Phys.Algebra.LorentzContinuumEigenBasis

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section

-- identity A: (m+R)c² + (m-R)s² = a   with c=b/nrm, s=(R-δ)/nrm
example (a b d R nrm : Cut)
    (hRR : R * R = ((a-d)/2)*((a-d)/2) + b*b)
    (hN : nrm * nrm = 2 * R * (R - (a-d)/2)) (hnrm : nrm ≠ 0) :
    ((a+d)/2 + R) * (b/nrm) * (b/nrm)
      + ((a+d)/2 - R) * ((R-(a-d)/2)/nrm) * ((R-(a-d)/2)/nrm) = a := by
  have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
  have key : ((a+d)/2 + R)*b*b + ((a+d)/2 - R)*(R-(a-d)/2)*(R-(a-d)/2) = a*(nrm*nrm) := by
    rw [hN]; linear_combination (-((a+d)/2 + R)) * hRR
  calc ((a+d)/2 + R) * (b/nrm) * (b/nrm)
        + ((a+d)/2 - R) * ((R-(a-d)/2)/nrm) * ((R-(a-d)/2)/nrm)
      = (((a+d)/2 + R)*b*b + ((a+d)/2 - R)*(R-(a-d)/2)*(R-(a-d)/2))/(nrm*nrm) := by ring
    _ = (a*(nrm*nrm))/(nrm*nrm) := by rw [key]
    _ = a := by rw [mul_div_assoc, div_self hN2, mul_one]

-- identity B: (l₁-l₂)cs = b  (no hRR needed)
example (a b d R nrm : Cut)
    (hN : nrm * nrm = 2 * R * (R - (a-d)/2)) (hnrm : nrm ≠ 0) :
    (((a+d)/2 + R) - ((a+d)/2 - R)) * (b/nrm) * ((R-(a-d)/2)/nrm) = b := by
  have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
  have key : (((a+d)/2 + R) - ((a+d)/2 - R))*b*(R-(a-d)/2) = b*(nrm*nrm) := by
    rw [hN]; ring
  calc (((a+d)/2 + R) - ((a+d)/2 - R)) * (b/nrm) * ((R-(a-d)/2)/nrm)
      = ((((a+d)/2 + R) - ((a+d)/2 - R))*b*(R-(a-d)/2))/(nrm*nrm) := by ring
    _ = (b*(nrm*nrm))/(nrm*nrm) := by rw [key]
    _ = b := by rw [mul_div_assoc, div_self hN2, mul_one]

-- identity D: (m+R)s² + (m-R)c² = d
example (a b d R nrm : Cut)
    (hRR : R * R = ((a-d)/2)*((a-d)/2) + b*b)
    (hN : nrm * nrm = 2 * R * (R - (a-d)/2)) (hnrm : nrm ≠ 0) :
    ((a+d)/2 + R) * ((R-(a-d)/2)/nrm) * ((R-(a-d)/2)/nrm)
      + ((a+d)/2 - R) * (b/nrm) * (b/nrm) = d := by
  have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
  have key : ((a+d)/2 + R)*(R-(a-d)/2)*(R-(a-d)/2) + ((a+d)/2 - R)*b*b = d*(nrm*nrm) := by
    rw [hN]; linear_combination (-((a+d)/2 - R)) * hRR
  calc ((a+d)/2 + R) * ((R-(a-d)/2)/nrm) * ((R-(a-d)/2)/nrm)
        + ((a+d)/2 - R) * (b/nrm) * (b/nrm)
      = (((a+d)/2 + R)*(R-(a-d)/2)*(R-(a-d)/2) + ((a+d)/2 - R)*b*b)/(nrm*nrm) := by ring
    _ = (d*(nrm*nrm))/(nrm*nrm) := by rw [key]
    _ = d := by rw [mul_div_assoc, div_self hN2, mul_one]

end
end Phys.Algebra
