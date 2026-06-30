/-
  Phys.Algebra.DerivationDblIntoH — N188: THE LOWER RUNG OF THE INCLUSION TOWER
  `u(1) ↪ su(2)` — the Cayley–Dickson doubling intertwiner between the hypercharge
  phase rotation on `Dbl ℚ` and the weak-isospin inner derivation on `H ℚ`.
  ===========================================================================
  COMPLETING THE TOWER. N187 (`DerivationHIntoO.lean`) banked the UPPER rung
  `su(2) = Der(H ℚ) ↪ g₂ = Der(O ℚ)`, the Lie embedding induced by the doubling
  `H ℚ ↪ O ℚ = CD (H ℚ)`. THIS node banks the LOWER rung: the relation between the
  U(1) HYPERCHARGE phase rotation `L_J` on the complex-unit rung `Dbl ℚ` (N186) and
  the WEAK-ISOSPIN inner derivation `adQ hI` on the quaternion rung `H ℚ = CD (Dbl ℚ)`
  (N184/N185), where `hI = ι J` is the embedded complex unit.

  ★ THE KEY MEASUREMENT (docs/RUNBOOK.md W9 measure-first, frozen in PREREG). `Dbl ℚ` is
  COMMUTATIVE so its INNER derivations VANISH — the U(1) is the SKEW-ROTATION `L_J = (·J)`,
  NOT an inner derivation, while the SU(2) factor on `H ℚ` IS inner-derivation. So the
  relation is between DIFFERENT KINDS of object. The honest, theory-faithful connection is
  an INTERTWINER along the doubling's new-dimension embedding `κ : Dbl ℚ → H ℚ`, `b ↦ ⟨0,b⟩`:
  the doubling `H ℚ = CD (Dbl ℚ)` splits `H ℚ` into the OLD line `ι(Dbl ℚ)` (`a ↦ ⟨a,0⟩`,
  where `hI = ι J` lives) and the NEW plane `κ(Dbl ℚ)`. Componentwise on the forced CD
  product (`star J = −J`, the same non-self-conjugacy that lost commutativity at rung 2):

    • `adQ hI (ι a) = ⟨J·a − a·J, 0⟩ = 0`   — the SU(2) generator ANNIHILATES the U(1) line;
    • `adQ hI (κ b) = ⟨0, 2·(b·J)⟩ = κ ((2:ℚ) • L_J b)` — on the new plane the SU(2)
        generator is exactly TWICE the U(1) phase rotation, transported by `κ`.

  Hence the PROVED operator intertwiner `adQ hI ∘ κ = κ ∘ (2 • L_J)`: the U(1) generator
  `L_J` REAPPEARS — up to the factor `2` the doubling forces — as the restriction of the
  SU(2) generator `adQ hI` to the new plane, and is annihilated on the old line. This is a
  genuine map between two DISTINCT banked algebras (`L_J` on `Dbl ℚ`, N186; `adQ hI` on
  `H ℚ`, N184/N185), NOT a re-pin of either and NOT a juxtaposition: the lower rung
  `u(1) ↪ su(2)` of the inclusion tower, derived from the cascade's OWN doubling.

  WHAT IS BANKED HERE (forward, foundations-only):
    kappa              — the new-dimension embedding `κ : Dbl ℚ →ₗ[ℚ] H ℚ`, `b ↦ ⟨0,b⟩`.
    kappa_injective    — `κ` is injective (a genuine copy of the rung below).
    adQ_hI_iota        — ★ the SU(2) generator annihilates the embedded U(1) line `ι(Dbl ℚ)`.
    adQ_hI_kappa       — ★ the pointwise relation `adQ hI (κ b) = κ (2 • L_J b)`.
    isospin_intertwines_hypercharge — ★★ THE INTERTWINER `adQ hI ∘ κ = κ ∘ (2 • L_J)`
                         (the lower rung `u(1) ↪ su(2)`).
    intertwiner_coord  — the witnessing coordinate `(adQ hI (κ 1)).im.im = 2`, the genuine
                         relational coefficient.
    isospin_intertwines_hypercharge_ne_zero — ★★ W8: the intertwiner is GENUINELY NONZERO
                         (a real relation, not the zero map / a vacuous juxtaposition).

  THE MOAT — THE UNBROKEN-STRAND NOVELTY (docs/STANDARD.md §0). The division-algebra-physics
  field (Furey, Dixon, Günaydin–Gürsey) POSITS the algebras as DISCONNECTED ISLANDS and reads
  each gauge factor off by hand. Here the inclusion tower `u(1) ↪ su(2) ↪ g₂` is DERIVED from
  the SAME Cayley–Dickson doubling that builds the cascade: N187 nested `su(2) ↪ g₂` via the
  upper doubling `H ↪ O`, and THIS node nests `u(1) ↪ su(2)` via the lower doubling
  `Dbl ↪ H` — the U(1) phase generator IS (up to the doubling factor `2`) the new-plane
  restriction of the SU(2) generator. One cause (the doubling), the connection between two
  physical structures — a PROVED non-trivial intertwiner, NOT a juxtaposition.

  NO posited u(1)/su(2)/U(1)/SU(2)/Lie-group map, NO Mathlib ℝ/ℂ as content (ℚ is the
  coefficient field the `Module.End`/`LinearMap` statements are WRITTEN IN, the
  N6/N16/N42/N184/N185/N186/N187 precedent; the OBJECTS are the derived rungs `Dbl ℚ` (N2)
  and `H ℚ = CD (Dbl ℚ)` (N3)).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "hypercharge / U(1) / isospin / SU(2)
  / su(2) / u(1) / gauge": what remains is the pure statement that for the Cayley–Dickson
  double `H ℚ = CD (Dbl ℚ)`, the inner derivation `ad_{⟨J,0⟩}` annihilates the
  first-coordinate embedding `a ↦ ⟨a,0⟩` and, on the second-coordinate embedding
  `b ↦ ⟨0,b⟩`, equals twice the multiplication-by-`J` map transported by that embedding —
  pure algebra over the derived field ℚ. No theorem statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationHDim
import Phys.Algebra.DerivationDblPhase
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- THE NEW-DIMENSION EMBEDDING `κ : Dbl ℚ → H ℚ`, `b ↦ ⟨0, b⟩` — the orthogonal plane the
    doubling `H ℚ = CD (Dbl ℚ)` adds, complementary to the old line `ι : a ↦ ⟨a, 0⟩`. -/
def kappa : Dbl ℚ →ₗ[ℚ] H ℚ where
  toFun b := ⟨0, b⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

@[simp] theorem kappa_apply (b : Dbl ℚ) : kappa b = (⟨0, b⟩ : H ℚ) := rfl

/-- `κ` is injective: a genuine copy of the rung below sits inside `H ℚ`. -/
theorem kappa_injective : Function.Injective kappa := by
  intro a b h
  have := congrArg CD.im h
  simpa [kappa] using this

/-- ★ THE SU(2) GENERATOR ANNIHILATES THE EMBEDDED U(1) LINE `ι(Dbl ℚ)`: `adQ hI (ι a) = 0`.
    (`hI = ι J` commutes with everything on the old line, since `Dbl ℚ` is commutative.) -/
theorem adQ_hI_iota (a : Dbl ℚ) : adQ hI (CD.iota a) = 0 := by
  rw [adQ_apply]
  ext <;>
    simp [hI, CD.iota, sub_eq_add_neg, CD.mul_re, CD.mul_im, Dbl.J,
      Dbl.mul_re, Dbl.mul_im]

/-- ★ THE POINTWISE RELATION: on the new plane `κ`, the SU(2) generator is TWICE the U(1)
    phase rotation — `adQ hI (κ b) = κ ((2:ℚ) • L_J b)`. -/
theorem adQ_hI_kappa (b : Dbl ℚ) : adQ hI (kappa b) = kappa ((2 : ℚ) • L_J b) := by
  rw [adQ_apply]
  ext <;>
    simp [hI, kappa, L_J, CD.iota, sub_eq_add_neg, CD.mul_re, CD.mul_im, Dbl.J,
      Dbl.mul_re, Dbl.mul_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- ★★ THE INTERTWINER — the LOWER rung `u(1) ↪ su(2)` of the inclusion tower:
    `adQ hI ∘ κ = κ ∘ (2 • L_J)`. The U(1) hypercharge phase generator `L_J` on `Dbl ℚ`
    REAPPEARS (up to the doubling factor `2`) as the new-plane restriction of the SU(2)
    weak-isospin generator `adQ hI` on `H ℚ = CD (Dbl ℚ)`. -/
theorem isospin_intertwines_hypercharge :
    (adQ hI).comp kappa = kappa.comp ((2 : ℚ) • L_J) := by
  refine LinearMap.ext fun b => ?_
  rw [LinearMap.comp_apply, LinearMap.comp_apply, adQ_hI_kappa, LinearMap.smul_apply]

/-- The witnessing coordinate `(adQ hI (κ 1)).im.im = 2` — the genuine relational coefficient
    the doubling forces (the `2` of `2 • L_J`). -/
theorem intertwiner_coord : (adQ hI (kappa 1)).im.im = 2 := by
  rw [adQ_hI_kappa]
  simp [kappa, L_J, Dbl.J, cd_qsmul_im, Dbl.smul_im]

/-- ★★ W8 NON-VACUITY: the intertwiner is GENUINELY NONZERO — a REAL relation between the
    two banked algebras, not the zero map / a vacuous juxtaposition. -/
theorem isospin_intertwines_hypercharge_ne_zero :
    (adQ hI).comp kappa ≠ 0 := by
  intro h
  have hc : (adQ hI (kappa 1)).im.im = 2 := intertwiner_coord
  rw [show adQ hI (kappa 1) = ((adQ hI).comp kappa) 1 from rfl, h] at hc
  simp at hc

end

end Phys.Algebra
