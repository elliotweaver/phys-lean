/-
  # THE CLASS-SIDE WALL — records returning to principal are deep (GQ L4c)

  ## What this file proves (INVERSE-ENGINE port, production node)

  The weld that turns the depth wall into a CLASS statement. With the
  banked ladder machinery (power records ARE PowRel powers) and
  ReturnSetR (the cycle-theorem return object: PowRel g k h ∧ Chain h e
  ∧ e.a = 1), this closes recon P2 in class form: a split prime whose
  class returns at step k obeys 4·p^k ≥ |D|.

  * `form_rep_self_prim` — every form primitively represents its own
    leading coefficient (the (1,0) witness).
  * `record_return_deep` — ★★★ THE CLASS-SIDE WALL: the power-record
    form ⟨p^(k+1), B, t⟩ chaining to a principal-shape form of negative
    disc forces 4·p^(k+1) ≥ |D| — self-representation + primitive chain
    transport (unimodular witnesses) + the wall.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussDepthWall

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Any form primitively represents its leading coefficient. -/
theorem form_rep_self_prim (f : BQF) :
    ∃ x y α β : Z, eval f x y = f.a ∧ α * x + β * y = 1 := by
  refine ⟨1, 0, 1, 0, ?_, by norm_num⟩
  unfold eval
  ring

/-- ★★★ THE CLASS-SIDE WALL: a record form returning to principal is deep. -/
theorem record_return_deep {p B t : Z} {k : Re} {e : BQF}
    (hp : 2 ≤ p)
    (hch : Chain (⟨zpowRe p (Re.step k), B, t⟩ : BQF) e)
    (hea : e.a = 1)
    (hDneg : disc e < 0) :
    -(disc e) ≤ 4 * zpowRe p (Re.step k) := by
  -- the record form primitively represents p^(k+1) = its own a
  have hrep := form_rep_self_prim (⟨zpowRe p (Re.step k), B, t⟩ : BQF)
  -- transport along Chain e ⟨...⟩ (symm) to e
  have hrepe : ∃ x y α β : Z,
      eval e x y = zpowRe p (Re.step k) ∧ α * x + β * y = 1 := by
    obtain ⟨x, y, α, β, hxy, hprim⟩ := hrep
    have := chain_represents_prim (chainSymm hch) (zpowRe p (Re.step k))
      ⟨x, y, α, β, by exact hxy, hprim⟩
    exact this
  exact principal_rep_deep hea hDneg hp hrepe


#print axioms form_rep_self_prim
#print axioms record_return_deep

end BQF
end GaussForms
end Phys.Foundation
