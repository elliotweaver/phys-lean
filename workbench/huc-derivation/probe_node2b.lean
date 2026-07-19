import Phys.Algebra.HucBornSquareAnchor
import Phys.Algebra.ScaleTowerDischargeArcM
import Mathlib.Tactic

/-! PROBE 2 — the sharp discriminator lemmas for N578. -/

open Phys.Algebra
open Phys.Algebra.DischargeArcM
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.HucBornSquareAnchor
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

def insertionChain (insertions : List Cut) : Cut := ewClosureRatio * insertions.prod

/-- ★ THE SHARP DISCRIMINATOR (biconditional): a cascade member sits EXACTLY at the electroweak anchor
    IFF its insertion product is trivial (`= 1`). Since `ewClosureRatio ≠ 0`, `insertionChain L =
    ewClosureRatio ⟺ L.prod = 1`. So "at the anchor" is EQUIVALENT to "zero-insertion (empty product)",
    not an independent assertion — the top's zero cascade depth FORCES it to the anchor and conversely. -/
example (L : List Cut) : insertionChain L = ewClosureRatio ↔ L.prod = 1 := by
  unfold insertionChain
  have hne : ewClosureRatio ≠ 0 := ne_of_gt ewClosureRatio_pos
  constructor
  · intro h
    have h' : ewClosureRatio * L.prod = ewClosureRatio * 1 := by rw [mul_one]; exact h
    exact mul_left_cancel₀ hne h'
  · intro h; rw [h, mul_one]

/-- ★ ONE SUB-UNIT SUPPRESSING INSERTION LANDS BELOW THE ANCHOR (structural, not target-shaped): for a
    single insertion factor `c` with `0 < c < 1`, `insertionChain [c] < ewClosureRatio`. Any genuine
    (sub-unit, positive) cascade insertion strictly suppresses below the anchor — so a NON-zero
    insertion depth cannot land at the anchor. The discriminator is forced by the sub-unit structure of
    Born factors, never by where 137 sits. -/
example (c : Cut) (hcpos : 0 < c) (hclt : c < 1) : insertionChain [c] < ewClosureRatio := by
  unfold insertionChain
  rw [List.prod_cons, List.prod_nil, mul_one]
  have h1 : 0 < ewClosureRatio := ewClosureRatio_pos
  calc ewClosureRatio * c < ewClosureRatio * 1 := by
        exact mul_lt_mul_of_pos_left hclt h1
    _ = ewClosureRatio := mul_one _

end
