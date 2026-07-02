/-
  RECON (manager takeover, N251 consolidation) — ISOLATED, NOT wired to Phys.lean.
  Goal: verify the theory-native SINGLE-CAUSE capstone compiles entirely from banked lemmas.
  The claim: u1 (the derived fold-root √−1, N2) is ONE cause wearing four faces, and the whole
  colour-rep structure on the charged matter descends from it — faithful + ℂ-linear + dim-8,
  with ℂ-linearity FORCED (not coincidental) because colour is DEFINED as the centralizer of u1.
-/
import Phys.Algebra.TowerGatherImageColourSubalgebra

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

noncomputable section

-- FACE 1 & 2: the fold-root u1 IS the charge operator input (definitional).
example : chargeOp = crossOp u1 := rfl

-- FACE 3: the charge operator is a genuine complex structure on the charged 6-space.
example : chargeOpV.comp chargeOpV = -LinearMap.id := chargeOpV_sq_id

-- FACE 4: colour su(3) is EXACTLY the g₂-stabilizer of the u1-charge operator (definitional rfl).
example : chargeStabilizer = colourCentralizer := chargeStabilizer_eq_colour

-- THE FORCED ℂ-LINEARITY: colour commutes with the charge complex structure.
-- This is NOT a separate coincidence — it is forced because colour = centralizer of u1.
example (D : colourCentralizer) : Commute (colourRepV D) chargeOpV := colourRepV_commute D

-- FAITHFUL, and its dim-8 image, both descend from simplicity of Der(O) (imRep_injective).
example : Function.Injective colourRepV := colourRepV_faithful
example : Module.finrank ℚ colourRepImg.toSubmodule = 8 := finrank_colourRepImg

/-- ★★★ THE SINGLE-CAUSE CAPSTONE (recon). The one derived element `u1` (the fold-root √−1, N2)
    simultaneously: (a) IS the charge-operator input `chargeOp = crossOp u1`; (b) squares to the
    complex structure `chargeOpV² = −id` on the charged 6-space; (c) has centralizer EXACTLY
    colour `su(3)`; and (d) the induced colour rep on the charged matter is FAITHFUL and commutes
    with the charge complex structure (ℂ-linear) — the dim-8 image landing in its commutant.
    One cause, many terminations: (d)'s ℂ-linearity is FORCED by (c) — colour is DEFINED as what
    commutes with `u1` — and (d)'s faithfulness is the parent 7-rep faithfulness (simplicity of
    Der(O)) read through the u1-charge eigenspace split. No separate coincidences. -/
theorem colour_charge_one_cause_u1_recon :
    chargeOp = crossOp u1 ∧
    chargeOpV.comp chargeOpV = -LinearMap.id ∧
    chargeStabilizer = colourCentralizer ∧
    (∀ D : colourCentralizer, Commute (colourRepV D) chargeOpV) ∧
    Function.Injective colourRepV ∧
    Module.finrank ℚ colourRepImg.toSubmodule = 8 ∧
    (∀ M ∈ colourRepImg, Commute M chargeOpV) :=
  ⟨rfl, chargeOpV_sq_id, chargeStabilizer_eq_colour, colourRepV_commute,
   colourRepV_faithful, finrank_colourRepImg, colourRepImg_le_commutant⟩

#print axioms colour_charge_one_cause_u1_recon

end

end Phys.Algebra
