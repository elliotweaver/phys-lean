/-
  VERIFIED forced sub-lemmas for the polarization core (N2d-MIDDLE child node).
  Compiled foundations-only this run (run 30); ready to LIFT into production by the
  child node that closes `H : Nrm mult on CD A ⟹ scaling law on CD A`.

    star_add_self : z + star z = iota (bilin z 1)
        — the conjugation-TRACE relation: the trace lands in the base. Structural
          (H-free), foundations-only [propext, Quot.sound]. Used to express the
          adjoint identity's centrality via the trace.

    P2_polar : H ⟹ bilin (z*x) (w*y) + bilin (w*x) (z*y) = bilin z w * bilin x y
        — the FULL POLARIZATION of the banked P2 (left composition identity), in BOTH
          the z- and w-slots. Derived from banked P2 + Nrm_add + add_mul' + bilin
          biadditivity, by additive-group cancellation (`abel`). Foundations-only
          [propext, Quot.sound]. This is the bilinear composition identity the adjoint
          identity is read off from.

  Both verified in workbench/N2d-forced-stop/ScrCore6.lean this run.
-/
import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {A : Type*} [Ring A] [StarRing A]

/-- The conjugation-trace relation: `z + star z` lands in the base, equal to
    `iota (bilin z 1)`. Structural (no multiplicativity hypothesis). -/
theorem star_add_self (z : CD A) : z + star z = iota (bilin z 1) := by
  ext
  · simp [bilin, iota, mul_re, star_re, star_im]
  · simp [iota]

/-- The FULL POLARIZATION of P2 (both slots). Forced by multiplicativity `H`. -/
theorem P2_polar
    (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z w : CD A) :
    bilin (z * x) (w * y) + bilin (w * x) (z * y) = bilin z w * bilin x y := by
  have key := P2 H x y (z + w)
  rw [add_mul', add_mul'] at key
  rw [bilin_add_left, bilin_add_right, bilin_add_right] at key
  rw [P2 H x y z, P2 H x y w] at key
  rw [Nrm_add, add_mul, add_mul] at key
  have h2 : bilin (z*x) (w*y) + bilin (w*x) (z*y) = bilin z w * bilin x y := by
    have e : (bilin (z*x) (w*y) + bilin (w*x) (z*y))
           = (Nrm z * bilin x y + bilin (z*x) (w*y) + (bilin (w*x) (z*y) + Nrm w * bilin x y))
             - (Nrm z * bilin x y + Nrm w * bilin x y) := by abel
    rw [e, key]; abel
  exact h2

#print axioms star_add_self
#print axioms P2_polar
end Phys.Cascade.CD
