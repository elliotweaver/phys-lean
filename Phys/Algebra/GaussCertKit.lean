/-
  Phys.Algebra.GaussCertKit — generic list plumbing for fiber certificates:
  strictly-increasing chains give duplicate-freedom. Proved once.
-/
import Phys.Algebra.GaussCertificate

namespace Phys.Foundation
namespace GaussForms
namespace BQF
/-- Sorted-< (IsChain) lists are pairwise-<. -/
theorem ischain_lt_pairwise : ∀ {l : List Z},
    List.IsChain (· < ·) l → List.Pairwise (· < ·) l := by
  intro l
  induction l with
  | nil => intro _; exact List.Pairwise.nil
  | cons a t ih =>
      intro h
      match t, h with
      | [], _ =>
          exact List.pairwise_cons.mpr
            ⟨fun b hb => absurd hb List.not_mem_nil, List.Pairwise.nil⟩
      | b :: t', h =>
          cases h with
          | cons_cons hab hch =>
              have hp := ih hch
              refine List.pairwise_cons.mpr ⟨?_, hp⟩
              intro c hc
              rcases List.mem_cons.mp hc with rfl | hc2
              · exact hab
              · exact lt_trans hab ((List.pairwise_cons.mp hp).1 c hc2)

/-- IsChain-< yields the pairwise-≠ the exclusion schema consumes. -/
theorem chain_lt_pairwise_ne {l : List Z}
    (h : List.IsChain (· < ·) l) : List.Pairwise (· ≠ ·) l :=
  (ischain_lt_pairwise h).imp (fun hlt => ne_of_lt hlt)

#print axioms chain_lt_pairwise_ne

end BQF
end GaussForms
end Phys.Foundation
