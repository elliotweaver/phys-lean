/- PROBE (run 67): jdef E B = 0 for nuclear E via DIRECTED associators (no simp loop).
   jdef E B = jb(jb E B)(jb E E) - jb E (jb B (jb E E)). With E nuclear, EVERY product
   in which E meets a parenthesis re-associates. Route: express jdef E B as a combination
   that abel-cancels once all E-associations are normalized by rw, one direction at a time.
   We use the master identity backward: jdef A E = E*G_A - G_A*E (2nd arg nuclear). For
   jdef E B (1st arg nuclear) there's no master; instead show jdef E B = 0 directly by the
   nuclear rewrites applied as `conv`/`rw` in a fixed order, keeping E*E opaque. -/
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe67Spine
open Phys.Algebra Matrix
section Abstract
variable {S : Type*} [NonAssocRing S] {n : ℕ}

-- Try: generalize the square E*E = P (opaque), then the nuclear rewrites + abel.
set_option maxHeartbeats 1000000 in
theorem jdef_nuc_first (E B : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E))
    (CC : ∀ P : Matrix (Fin n) (Fin n) S, E * P = P * E) :
    jdef E B = 0 := by
  unfold jdef jb
  -- normalize: replace all E*E by a generalized P after first distributing
  simp only [mul_add, add_mul]
  -- push E through using nuclearity + centrality in a terminating way: rewrite (E*E) leftmost
  simp only [LA, MA, RA, CC]
  abel

end Abstract
end Probe67Spine
