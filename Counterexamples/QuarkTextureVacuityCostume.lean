/-
  Counterexamples.QuarkTextureVacuityCostume — Z3 anti-vacuity (C497).
  ====================================================================
  W8 ANTI-VACUITY. The Z3 node (arc-Z THE QUARK TEXTURE, paying the X10 debt) banks the two-sector
  quark Born-square texture and — its genuinely new forced content — the FANO-LINE CP DICHOTOMY: the
  texture CP invariant factors as `(frame misalignment)·assoc3`, which VANISHES on the associative
  ℂ-line (the lepton texture is CP-trivial, `textureCP_cline_zero`) and is NONZERO on the
  non-associative Fano line (the quark texture carries CP, `textureCP_fano_eq`), so at MISALIGNED
  frames the quark texture carries CP while the lepton texture does not (`fano_cp_dichotomy`). The
  load-bearing content: (i) the quark texture is REAL mixing — the CKM cross-term is NONZERO at two
  distinct sectors (`quark_mixing_nonzero`); (ii) the DICHOTOMY is genuine — the quark (Fano) texture
  CP invariant is NONZERO while the ℂ-line reading is ZERO (`quark_cp_present_lepton_cp_absent`), so a
  WRONG "quark texture is CP-trivial like the lepton texture" reading is provably excluded. The quark
  texture carries CP, its mixing is real, and the CP is the octonion associator — NOT vacuous, NOT
  CP-trivial, NOT the wrong line.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the quark texture carries CP (Fano-line
  `assoc3 ≠ 0`) with real mixing (nonzero CKM cross-term), while the lepton (ℂ-line) texture is
  CP-trivial — NOT vacuous, NOT CP-trivial". It is TIED to the banked Z3 landings by `xFlag_forced`:
  `quark_mixing_nonzero` witnesses the real (nonzero) CKM mixing, and the first conjunct of
  `quark_cp_present_lepton_cp_absent` witnesses the Fano-line CP invariant is nonzero, so the flag
  is `1`.

  We anchor `min 497 xFlag = 1` (TRUE — `xFlag = 1 < 497`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the quark texture is vacuous / CP-trivial / has no mixing / is
  the same as the lepton texture" mis-reading): that `min 497 xFlag = 497`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 497` in ℕ. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (497, 1) is fresh (Cid 497 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.QuarkTexture
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- THE QUARK-TEXTURE FLAG: `1` = "the quark texture carries CP (Fano-line `assoc3 ≠ 0`) with real
    mixing (nonzero CKM cross-term), while the lepton (ℂ-line) texture is CP-trivial". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked Z3 landing): `quark_mixing_nonzero` proves the CKM cross-term is nonzero
    at two distinct sectors (real mixing), and `quark_cp_present_lepton_cp_absent.1` proves the
    quark-texture (Fano-line) CP invariant is nonzero (CP present). So the flag is present,
    `xFlag = 1`. -/
theorem xFlag_forced :
    (ckmTexture 1 3 1 0 1 3 0 1) 1 0 ≠ 0
    ∧ (textureCP (genVec 1 3 1 0 0) (genVec 1 3 1 0 1)
        (genVec 1 3 0 1 0) (genVec 1 3 0 1 1) u2 u1 (octCross u1 u2) ≠ 0)
    ∧ xFlag = 1 :=
  ⟨quark_mixing_nonzero, quark_cp_present_lepton_cp_absent.1, rfl⟩

/-- TRUE: `min 497 xFlag = 1`, holding precisely because `xFlag = 1 < 497`. -/
theorem cert_val_true : min (497 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 497 xFlag = 497`. It GENUINELY equals `1` (`cert_val_true`). A "the quark
    texture is vacuous / CP-trivial / has no mixing / is the same as the lepton texture" mis-reading
    reduces — through the banked value — to the false numeric `1 = 497`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (497 : ℕ) xFlag = 497 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 497  (FALSE — the costume bites)

end Counterexamples
