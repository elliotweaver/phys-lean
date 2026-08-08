/-
  # THE GROWTH LAW — the complete box holds the whole realized q-tower
  (GQ SG-aj)

  ## What this file proves (SEED-GROWTH campaign, THE INERT-ARM FLOOR)

  The composition closing audit weld (2) end-to-end: the odd
  occupation (N656) + completeness + distinct-picks counting
  (picks_bound N644):

  * `zqpow_step_lt` / `zqpow_lt` — strict tower monotonicity (q ≥ 3).
  * `growth_law` — ★★★ THE LAW (∀D): q touching split odd prime
    (Re-witnessed, q ∤ D), box complete + duplicate-free, J a
    pairwise-distinct list of deep levels (1 ≤ j, 4·q^(2j) ≤ A) ⟹
    J.length ≤ box.length. h(D) ≥ #deep q-levels ~ log_q √(A) — THE
    INERT-ARM FLOOR with NO record dependence. Choice picks the
    realized form per level; distinct levels give distinct a-values
    (strict monotonicity), so the picks are pairwise distinct.

  With N654 (2-adic occupation) + N655 (odd lift) + N656 (odd
  occupation): BOTH arms of the X_m confinement are unconditional
  ∀D kernel theorems — X_m explicit at every m.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussOddOccupation

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- Single step: zqpow q n < zqpow q (n+1) at q ≥ 3. -/
theorem zqpow_step_lt {q : Z} (hq3 : 3 ≤ q) (n : Nat) :
    zqpow q n < zqpow q (n + 1) := by
  have hp := zqpow_pos3 hq3 n
  have hshape : zqpow q (n + 1) = q * zqpow q n := rfl
  rw [hshape]
  nlinarith [mul_pos (show (0:Z) < q - 1 by linarith) hp]

/-- ★ Strict tower monotonicity at q ≥ 3. -/
theorem zqpow_lt {q : Z} (hq3 : 3 ≤ q) :
    ∀ {j j' : Nat}, j < j' → zqpow q j < zqpow q j' := by
  intro j j' hjj
  obtain ⟨d, rfl⟩ : ∃ d, j' = j + (d + 1) := ⟨j' - j - 1, by omega⟩
  clear hjj
  induction d with
  | zero => exact zqpow_step_lt hq3 j
  | succ dd ih =>
      have hidx : j + (dd + 1 + 1) = (j + (dd + 1)) + 1 := by omega
      calc zqpow q j < zqpow q (j + (dd + 1)) := ih
        _ < zqpow q ((j + (dd + 1)) + 1) := zqpow_step_lt hq3 _
        _ = zqpow q (j + (dd + 1 + 1)) := by rw [hidx]

/-- ★★★ THE GROWTH LAW (∀D): the complete box is floored by the number
    of deep q-levels. -/
theorem growth_law {q c₀ A x w : Z} {p : Re}
    (hA : A = 4 * c₀ - 1) (hq : q = Z.ofRe p) (hprime : PrimeRe p)
    (hq3 : 3 ≤ q)
    (htouch : x * x + x + c₀ = q * w)
    (hqndD : ¬ ZDvd q (1 - 4 * c₀))
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = 1 - 4 * c₀ →
      f ∈ box)
    (J : List Nat)
    (hJpw : List.Pairwise (· ≠ ·) J)
    (hJdeep : ∀ j ∈ J, 1 ≤ j ∧ 4 * (zqpow q j * zqpow q j) ≤ A) :
    J.length ≤ box.length := by
  -- choice: for each deep level pick the realized form
  have hex : ∀ j ∈ J, ∃ f : BQF, Reduced f ∧ PosDef f ∧
      disc f = 1 - 4 * c₀ ∧ f.a = zqpow q j := by
    intro j hj
    obtain ⟨h1, h2⟩ := hJdeep j hj
    exact odd_tower_realized hA hq hprime hq3 htouch hqndD j h1 h2
  classical
  let pick : Nat → BQF := fun j =>
    if h : ∃ f : BQF, Reduced f ∧ PosDef f ∧
        disc f = 1 - 4 * c₀ ∧ f.a = zqpow q j
    then h.choose else ⟨1, 0, 1⟩
  have hpick : ∀ j ∈ J, Reduced (pick j) ∧ PosDef (pick j) ∧
      disc (pick j) = 1 - 4 * c₀ ∧ (pick j).a = zqpow q j := by
    intro j hj
    have h := hex j hj
    simp only [pick, dif_pos h]
    exact h.choose_spec
  refine picks_bound J box pick ?_ ?_ hboxpw
  · intro j hj
    obtain ⟨hred, hpos, hdisc, _⟩ := hpick j hj
    exact hcomplete _ hred hpos hdisc
  · -- pairwise-distinct picks: distinct levels ⟹ distinct a-values
    refine List.Pairwise.imp_of_mem ?_ hJpw
    intro j j' hj hj' hne heq
    have ha := (hpick j hj).2.2.2
    have ha' := (hpick j' hj').2.2.2
    rw [heq] at ha
    rw [ha] at ha'
    -- zqpow q j' = zqpow q j with j ≠ j': kill by strict monotonicity
    rcases Nat.lt_or_ge j j' with hlt | hge
    · have := zqpow_lt hq3 hlt
      rw [ha'] at this
      exact lt_irrefl _ this
    · rcases Nat.eq_or_lt_of_le hge with heqj | hgt
      · exact hne heqj.symm
      · have := zqpow_lt hq3 hgt
        rw [ha'] at this
        exact lt_irrefl _ this


#print axioms zqpow_step_lt
#print axioms zqpow_lt
#print axioms growth_law

end BQF
end GaussForms
end Phys.Foundation
