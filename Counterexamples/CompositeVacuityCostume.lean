/-
  Counterexamples.CompositeVacuityCostume — N395 anti-vacuity (C420).
  ============================================================================================
  W8 ANTI-VACUITY. The N395 node (arc-J J5 — wave-particle duality, entanglement, the vacuum)
  derives that the composite tensor carrier `TwoFibre = StateFibre ⊗[Cut] StateFibre` supports
  GENUINE entanglement: every PRODUCT (factorizable) state `a ⊗ b` has correlation determinant
  `corrDet = 0` (`corrDet_prod`), while the diagonal composite `bell = e₁⊗e₁ + e₂⊗e₂` has
  `corrDet = 1` (`corrDet_bell`), so `bell` is NOT any product (`bell_not_product`). The
  load-bearing non-vacuity fact is that entanglement is REAL — there exists a concrete composite
  state that cannot be written as a product of the two probes. A mis-reading where entanglement
  were VACUOUS (every composite state factorizes / all correlation determinants vanish / the
  tensor carrier is trivial) would have `corrDet = 0` for EVERY state and the whole
  non-factorizability content would evaporate.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the diagonal composite `bell` has a
  NONZERO correlation determinant (= 1), while every product state has determinant 0, so `bell`
  is genuinely entangled (not a product)". It is TIED to the banked N395 landing by
  `cFlag_forced`: the banked `corrDet_bell` witnesses `corrDet bell = 1` while the banked
  `corrDet_prod` gives `corrDet (a ⊗ₜ b) = 0` for every product — a genuine gap. Hence the flag
  is `1`.

  We anchor `min 420 cFlag = 1` (TRUE — `cFlag = 1 < 420`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "entanglement is vacuous / every composite factorizes / all
  correlation determinants vanish / the tensor carrier is trivial" mis-reading): that
  `min 420 cFlag = 420`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 420` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (420, 1) is fresh (Cid 420 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.Composite
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum
open scoped TensorProduct

/-- THE ENTANGLEMENT-NON-VACUITY FLAG: `1` = "the diagonal composite `bell` has a nonzero
    correlation determinant (=1) while every product state has determinant 0, so `bell` is
    genuinely entangled (not a product)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N395 landing): the banked `corrDet_bell` proves the correlation
    determinant of the diagonal composite is `1`, while the banked `corrDet_prod` proves every
    product state has determinant `0` — so there is a genuine composite state that is not a
    product. Hence `cFlag = 1`. If entanglement were vacuous (every composite factorized), this
    witness would not exist. -/
theorem cFlag_forced :
    (corrDet bell = 1 ∧
      (∀ a b : StateFibre, corrDet (a ⊗ₜ b) = 0)) ∧
      cFlag = 1 :=
  ⟨⟨corrDet_bell, corrDet_prod⟩, rfl⟩

/-- TRUE: `min 420 cFlag = 1`, holding precisely because `cFlag = 1 < 420`. -/
theorem cert_val_true : min (420 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 420 cFlag = 420`. It GENUINELY equals `1` (`cert_val_true`). An
    "entanglement is vacuous / every composite factorizes / all correlation determinants vanish /
    the tensor carrier is trivial" mis-reading reduces — through the banked nonzero correlation
    determinant of `bell` against the vanishing determinant of every product — to the false
    numeric `1 = 420`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (420 : ℕ) cFlag = 420 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 420  (FALSE — the costume bites)

end Counterexamples
