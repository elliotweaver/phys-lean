/-
  # THE CASE COMPOSITION — the ∀m theorem's two engines as single
  statements (GQ SG-v/w)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The boxed theorem's dichotomy, each case one kernel statement:

  * `inert_h_bound` — ★★★ THE INERT CASE (2 inert, trivial tower):
    box with a-values in [1] ++ bandList, |bandList| ≤ S, cap K ⟹
    h ≤ (1 + S)·K. Instantiation: S = 2^(m−1) (divisor census via
    band_signature_bound N642), K = 2 (root pairing) — PURE m.
  * `split_fiber_exit` — ★★★ THE SPLIT CASE (2 split, occupied tower;
    choice-free): a realized pick family of size H+1 forces the box
    past every fiber h ≤ H. Instantiation: the occupied 2-tower
    [2^0..2^H] (each a slot — banked tower machinery; A ≥ 3·4^(H+1)
    guarantees depth) — deferring split-D exit EXPLICITLY.

  Together: deferring D at level m are confined below explicit X(m);
  X_m reads off the sealed record table for m ≤ 7, the frontier
  engine beyond — the ∀m composition (xm_composition.md).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussTowerGrowth

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- ★★★ THE INERT CASE: with the trivial tower, h ≤ (1 + S)·K — pure m
    once S = 2^(m−1) and K = 2 are instantiated. -/
theorem inert_h_bound {S K : Nat} (bandList : List Z) (box : List BQF)
    (hb : bandList.length ≤ S)
    (hin : ∀ f ∈ box, f.a ∈ (1 : Z) :: bandList)
    (hcap : ∀ p ∈ (1 : Z) :: bandList,
      (box.filter (fun f => decide (f.a = p))).length ≤ K) :
    box.length ≤ (1 + S) * K := by
  have h := deferring_h_bound (T₂ := 1) (B := S) (K := K)
    [1] bandList box (by norm_num) hb
    (by simpa using hin) (by simpa using hcap)
  simpa using h

/-- ★★★ THE SPLIT CASE: a realized pick family of size H+1 forces the
    box past every fiber h ≤ H. -/
theorem split_fiber_exit {H : Nat} (idx : List Nat) (box : List BQF)
    (pick : Nat → BQF)
    (hlen : idx.length = H + 1)
    (hin : ∀ t ∈ idx, pick t ∈ box)
    (hpw : List.Pairwise (fun s t => pick s ≠ pick t) idx)
    (hboxpw : List.Pairwise (· ≠ ·) box) :
    H < box.length := by
  have h := tower_growth idx box pick hin hpw hboxpw
  omega


#print axioms inert_h_bound
#print axioms split_fiber_exit

end BQF
end GaussForms
end Phys.Foundation
