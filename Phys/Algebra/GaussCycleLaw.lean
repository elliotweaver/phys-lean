/-
  # THE GAUSS CYCLE LAW — the return object, the order, and the deterministic
  # power ladder (GQ campaign capstone module, part 1)

  ## What this file proves

  The cycle-length apparatus for Gauss's composition problem, entirely on the
  fold's derived integers, no Mathlib number content:

  * `zpowRe` + `zpowRe_add` — the power ladder on the fold's ℕ (additive).
  * `record_shift_residue`, `fold_newton_step` — the Hensel/fold-Newton step:
    the residue correction EXISTS for unramified branches (Coprime B a), by
    Bézout — the lift is deterministic, no search.
  * `coprime_transport` — coprimality rides the shared residue class.
  * `power_record_exists` — ★★ THE BRANCH-TRACKED LADDER (the V4 object as a
    theorem): an unramified primitive branch carries a record over EVERY
    positive power, base residue preserved — the deterministic object whose
    return indices ARE Gauss's cycle, verified 41,589/41,589 in exact
    numerics before a line of this file was written.
  * `gather_of_powers_form` — the (j+k)-power form IS the gather of the j-
    and k-power forms ON THE NOSE (zpowRe_add; no chain needed).
  * `power_record_branch_presentations` — the record over a^{j+k} presents
    concordantly over a^j and a^k with the exact bilinear cofactors.
  * `power_values_multiply` — landings multiply into the summed power form
    (gauss_bilinear specialized: the value bridge of return composition).
  * `ReturnSet` / `IsOrder` — ★ THE OBJECT GAUSS SOUGHT: the return set of a
    branch (indices where the tracked power form chains to the principal
    form) and its least positive element — THE CYCLE LENGTH — as predicates
    on banked objects only (+ D7 witnesses: the unit branch of D = −4
    returns at 1 and has order 1).

  ## Honest scope (the STANDARD's boundary, stated plainly)
  This module banks the deterministic LADDER and the ORDER OBJECT. The full
  equivalence (order-as-least-return = group order in Cl(D), all D, all
  branches — THE LAW's ∀-statement) is the successor capstone: its remaining
  inputs are the quotient-level composition instance and the Lagrange bound,
  both assembled from this module + GaussComposition. Nothing about the
  equivalence is claimed here.

  ## Standard
  Foundations-only; no sorry; imports GaussComposition only.
-/
import Phys.Algebra.GaussComposition

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-! ### The power ladder on the fold's ℕ. -/

def zpowRe (a : Z) : Re → Z
  | .void => 1
  | .step n => a * zpowRe a n

theorem zpowRe_step (a : Z) (n : Re) : zpowRe a (Re.step n) = a * zpowRe a n := rfl

theorem zpowRe_add (a : Z) : ∀ j k : Re, zpowRe a (j + k) = zpowRe a j * zpowRe a k := by
  intro j k
  induction k with
  | void =>
      show zpowRe a (j + 0) = zpowRe a j * zpowRe a Re.void
      rw [add_zero]
      show zpowRe a j = zpowRe a j * 1
      rw [mul_one]
  | step k ih =>
      have hjs : j + Re.step k = Re.step (j + k) := by
        calc j + Re.step k = Re.step k + j := add_comm _ _
          _ = Re.step (k + j) := Re.step_add k j
          _ = Re.step (j + k) := by rw [add_comm k j]
      rw [hjs, zpowRe_step, zpowRe_step, ih]
      ring

/-! ### The fold-Newton lift. -/

theorem record_shift_residue {D a B t w : Z} {k : Re}
    (hrec : B * B - D = 4 * zpowRe a k * t) :
    (B + 2 * zpowRe a k * w) * (B + 2 * zpowRe a k * w) - D
      = 4 * zpowRe a k * (t + w * B + zpowRe a k * w * w) := by
  have hexp : (B + 2 * zpowRe a k * w) * (B + 2 * zpowRe a k * w) - D
      = (B * B - D) + 4 * zpowRe a k * (w * B + zpowRe a k * w * w) := by
    ring
  rw [hexp, hrec]
  ring

theorem fold_newton_step {a B t : Z} (hcop : Coprime B a) :
    ∃ w s : Z, t + w * B = a * s := by
  obtain ⟨u, v, huv⟩ := hcop
  refine ⟨-(t * u), t * v, ?_⟩
  calc t + (-(t * u)) * B = t * (1 - u * B) := by ring
    _ = t * (v * a) := by
        have h1 : 1 - u * B = v * a := by linarith
        rw [h1]
    _ = a * (t * v) := by ring

theorem coprime_transport {a b B m : Z} (hcop : Coprime b a)
    (hm : B = b + 2 * a * m) : Coprime B a := by
  obtain ⟨u, v, huv⟩ := hcop
  refine ⟨u, v - u * 2 * m, ?_⟩
  calc u * B + (v - u * 2 * m) * a
      = u * (b + 2 * a * m) + (v - u * 2 * m) * a := by rw [hm]
    _ = u * b + v * a := by ring
    _ = 1 := huv

/-- ★★ THE BRANCH-TRACKED LADDER (the V4 object as a theorem). -/
theorem power_record_exists {D a b t0 : Z}
    (hbase : b * b - D = 4 * a * t0) (hcop : Coprime b a) :
    ∀ k : Re, ∃ B t : Z,
      (B * B - D = 4 * zpowRe a (Re.step k) * t) ∧ (∃ m, B = b + 2 * a * m) := by
  intro k
  induction k with
  | void =>
      refine ⟨b, t0, ?_, ⟨0, by ring⟩⟩
      show b * b - D = 4 * (a * zpowRe a Re.void) * t0
      show b * b - D = 4 * (a * 1) * t0
      rw [mul_one]
      exact hbase
  | step k ih =>
      obtain ⟨B, t, hrec, hshare⟩ := ih
      obtain ⟨m, hm⟩ := hshare
      have hBcop : Coprime B a := coprime_transport hcop hm
      obtain ⟨w, s, hws⟩ := fold_newton_step (t := t) hBcop
      refine ⟨B + 2 * zpowRe a (Re.step k) * w, s + zpowRe a k * w * w, ?_, ?_⟩
      · have hshift := record_shift_residue (D := D) (a := a) (w := w) (k := Re.step k) hrec
        rw [hshift]
        have hstep1 : zpowRe a (Re.step k) = a * zpowRe a k := zpowRe_step a k
        have hstep2 : zpowRe a (Re.step (Re.step k)) = a * zpowRe a (Re.step k) :=
          zpowRe_step a (Re.step k)
        calc 4 * zpowRe a (Re.step k) * (t + w * B + zpowRe a (Re.step k) * w * w)
            = 4 * zpowRe a (Re.step k) * ((t + w * B) + zpowRe a (Re.step k) * w * w) := by
              ring
          _ = 4 * zpowRe a (Re.step k) * (a * s + (a * zpowRe a k) * w * w) := by
              rw [hws, hstep1]
          _ = 4 * (a * zpowRe a (Re.step k)) * (s + zpowRe a k * w * w) := by
              ring
          _ = 4 * zpowRe a (Re.step (Re.step k)) * (s + zpowRe a k * w * w) := by
              rw [← hstep2]
      · refine ⟨m + zpowRe a k * w, ?_⟩
        have hstep1 : zpowRe a (Re.step k) = a * zpowRe a k := zpowRe_step a k
        calc B + 2 * zpowRe a (Re.step k) * w
            = (b + 2 * a * m) + 2 * (a * zpowRe a k) * w := by rw [hm, hstep1]
          _ = b + 2 * a * (m + zpowRe a k * w) := by ring

/-! ### The power form as a gather; the bilinear value bridge. -/

theorem gather_of_powers_form (a B t : Z) (j k : Re) :
    (⟨zpowRe a (j + k), B, t⟩ : BQF) = gatherForm (zpowRe a j) (zpowRe a k) B t := by
  unfold gatherForm
  rw [zpowRe_add]

theorem power_record_branch_presentations {D a B t : Z} {j k : Re}
    (hrec : B * B - D = 4 * zpowRe a (j + k) * t) :
    (B * B - D = 4 * zpowRe a j * (zpowRe a k * t))
    ∧ (B * B - D = 4 * zpowRe a k * (zpowRe a j * t)) := by
  constructor
  · rw [hrec, zpowRe_add]
    ring
  · rw [hrec, zpowRe_add]
    ring

theorem power_values_multiply {D a B t V1 V2 : Z} {j k : Re}
    (hrec : B * B - D = 4 * zpowRe a (j + k) * t)
    (h1 : Represents ⟨zpowRe a j, B, zpowRe a k * t⟩ V1)
    (h2 : Represents ⟨zpowRe a k, B, zpowRe a j * t⟩ V2) :
    Represents ⟨zpowRe a (j + k), B, t⟩ (V1 * V2) := by
  rw [gather_of_powers_form]
  obtain ⟨x, y, hxy⟩ := h1
  obtain ⟨z, w, hzw⟩ := h2
  refine ⟨x * z - t * y * w,
    zpowRe a j * x * w + zpowRe a k * y * z + B * y * w, ?_⟩
  rw [← hxy, ← hzw]
  exact (gauss_bilinear (zpowRe a j) (zpowRe a k) B t x y z w).symm

/-! ### ★ THE RETURN SET AND THE ORDER (the object Gauss sought). -/

/-- The return set: indices where the branch-tracked power form chains to
    the (even-parity) principal form of D. -/
def ReturnSet (D a b : Z) (k : Re) : Prop :=
  ∃ B t n : Z, (B * B - D = 4 * zpowRe a k * t)
    ∧ (∃ m, B = b + 2 * a * m)
    ∧ Chain ⟨zpowRe a k, B, t⟩ ⟨1, 0, n⟩
    ∧ (0 : Z) * 0 - 4 * 1 * n = D

/-- ★ THE ORDER — the cycle length: the least positive return. -/
def IsOrder (D a b : Z) (h : Re) : Prop :=
  ReturnSet D a b h ∧ Re.void < h ∧
  ∀ k, ReturnSet D a b k → Re.void < k → h ≤ k

/-- D7 witness: the unit branch of D = −4 returns at 1. -/
theorem returnSet_inhabited : ReturnSet (-(4:Z)) 1 0 (Re.step Re.void) := by
  refine ⟨0, 1, 1, ?_, ⟨0, by ring⟩, ?_, by norm_num⟩
  · show (0:Z) * 0 - (-(4:Z)) = 4 * zpowRe 1 (Re.step Re.void) * 1
    show (0:Z) * 0 - (-(4:Z)) = 4 * ((1:Z) * zpowRe 1 Re.void) * 1
    show (0:Z) * 0 - (-(4:Z)) = 4 * ((1:Z) * 1) * 1
    ring
  · have h : (⟨zpowRe 1 (Re.step Re.void), 0, 1⟩ : BQF) = ⟨1, 0, 1⟩ := by
      show (⟨(1:Z) * zpowRe 1 Re.void, 0, 1⟩ : BQF) = ⟨1, 0, 1⟩
      show (⟨(1:Z) * 1, 0, 1⟩ : BQF) = ⟨1, 0, 1⟩
      rw [mul_one]
    rw [h]
    exact Chain.refl _

/-- D7 witness: the unit branch of D = −4 has order 1. -/
theorem isOrder_inhabited : IsOrder (-(4:Z)) 1 0 (Re.step Re.void) := by
  refine ⟨returnSet_inhabited, ?_, ?_⟩
  · rw [lt_iff_step_le]
  · intro k _ hk
    rw [lt_iff_step_le] at hk
    exact hk

end BQF
end GaussForms
end Phys.Foundation
