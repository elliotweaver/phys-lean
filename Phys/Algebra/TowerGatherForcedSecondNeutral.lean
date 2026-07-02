/-
  Phys.Algebra.TowerGatherForcedSecondNeutral — N254.
  ===========================================================================
  THE FORCED SECOND NEUTRAL DIRECTION: the gather charge Q and the doubling weak-isospin T3
  form a RANK-2 ABELIAN TORUS in so(7) whose gradings of the fundamental 7 are MISALIGNED.

  Over the fundamental 7 = `ImO` of the derived octonion rung `O ℚ = CD (H ℚ)`, the two derived
  neutral operators the SINGLE fold-root `u1` carries —
    • the GATHER charge operator `chargeOp = crossOp u1` (N240, fundamental-7 summand of
      `so(7) = 14 ⊕ 7`, N225/N246), and
    • the DOUBLING weak-isospin Cartan image `imRep DI`, `DI = ⟨innerDerivQ hI⟩` (N202, adjoint-14
      = g₂ summand) —
  jointly satisfy:

    (1) COMMUTING   `charge_isospin_commute` : `Commute chargeOp (imRep DI)` — they generate an
        ABELIAN subalgebra (a torus of so(7)).
    (2) INDEPENDENT `charge_isospin_independent` : `a • chargeOp + b • imRep DI = 0 → a = 0 ∧ b = 0`
        — so `span{chargeOp, imRep DI}` is a genuine 2-DIMENSIONAL abelian subalgebra: a RANK-2
        TORUS, not one line. (Route: the N253 invariant TRACE FORM — orthogonality `B(chargeOp,
        imRep DI) = 0` with nonzero self-lengths `−6`, `−16` FORCES linear independence. The same
        form that gave the 3:8 ratio witnesses the independence — no coordinate bash.)
    (3) MISALIGNED GRADINGS `grading_misaligned` : the isospin singlet `kap1 = kappaO 1 = ⟨0,1⟩`
        (N189) is isospin-NEUTRAL (`imRep_DI_kappaO` : `imRep DI kap1 = 0`) but charge-NONZERO
        (`chargeOp_kappaO_ne_zero` : `chargeOp kap1 ≠ 0`, witness coordinate `c5 = 1`). Hence
        `ker (imRep DI) ⊄ ker chargeOp`: weak isospin ALONE does NOT determine the charge grading
        of the 7. A SECOND, independent neutral generator (hypercharge) is FORCED, not posited.
    (4) UNIQUE DOUBLY-NEUTRAL AXIS `joint_neutral_kernel` : `ker chargeOp ⊓ ker (imRep DI) =
        span{sgl}` — the ONLY direction neutral under BOTH is exactly the fold-root branching
        singlet `u1` (N244 `chargeOp_ker` + `imRep_DI_sgl`).

  ONE CAUSE MANY TERMINATIONS. The single fold-root `u1 = ιO hI` (N202/N251) re-enters TWO ways —
  as the gather cross-product it forces `chargeOp` (N240), as the inner-derivation commutator it
  forces `imRep DI` (N202). ONE root, two neutral generators; and because their gradings of the
  same 7 MISALIGN, the fold FORCES a second independent neutral direction. The field POSITS `U(1)_Y`
  as a separate factor and CHOOSES `Q = T₃ + Y/2` by convention; here the second neutral direction
  is a DERIVED consequence of two forced operators' misaligned gradings — computable, not chosen.

  THE ROUTE (THE ONE LAW / W9-LIGHT: integer 7×7 matrix arithmetic + the banked invariant form, NO
  coordinate bash of octonion products). Reuse N253's bridges `chargeOp_eq_qI` (`chargeOp = qI Cmat`)
  and `imRep_DI_eq_qI` (`imRep DI = qI Imat`): the commute reduces through `qI_comp` to the integer
  matrix identity `mul7 Cmat Imat = mul7 Imat Cmat` (`decide`); the independence reduces to the
  banked trace values `−6`/`−16`/`0` via trace bilinearity + `LinearMap.trace_mul_comm`; the
  misalignment coordinate to a `simp` on the explicit `qZ`/`Cmat`/`kappaO`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / isospin / hypercharge / weak-mixing /
  neutral / gauge / Cartan / torus / Standard Model": what remains is — over the derived field ℚ and
  the Cayley–Dickson double `O ℚ = CD (H ℚ)`, two specific skew-adjoint endomorphisms of the
  fundamental 7-module `ImO`, the cross-product operator `crossOp u1` and the fundamental-7 image
  `imRep DI` of `innerDerivQ hI` — COMMUTE, are ℚ-LINEARLY INDEPENDENT, grade `ImO` DIFFERENTLY
  (`∃ v, imRep DI v = 0 ∧ chargeOp v ≠ 0`), and have joint kernel `span{sgl}`. No theorem STATEMENT
  needs a physics word.

  ⚠ SCOPE (do NOT overclaim). This banks PURELY the mathematical structure: two commuting,
  linearly-independent endomorphisms with misaligned gradings and a common 1-dim kernel. It does NOT
  claim the physical weak MIXING ANGLE or the `Q = T₃ + Y/2` NORMALIZATION (couplings, running, the
  full generation embedding are a SEPARATE downstream node). It banks the posit-free ANCHOR the
  normalization sits on — that a second independent neutral generator is FORCED — NOT the
  normalization itself. (Respects the ≥5× hypercharge-normalization deferral.)

  DERIVED from the trunk (the banked charge operator `chargeOp = crossOp u1` N240/N223; the
  weak-isospin Cartan `DI = ⟨innerDerivQ hI⟩` N202/N184; the fundamental 7-representation `imRep` /
  `ImO` N22; the N253 bridges `chargeOp_eq_qI` / `imRep_DI_eq_qI` / `traceForm7` / `B_*`; the integer
  matrix calculus `qI` / `qI_comp` / `mul7` N234; the isospin singlet `kappaO 1` /
  `innerDeriv_kappaO_one` N189; the charge kernel `chargeOp_ker` N244; `innerDeriv_hI_u1` N202;
  `LinearMap.trace` / `LinearMap.trace_mul_comm` / `LinearMap.mem_ker` / `Submodule.span` standard
  Mathlib MACHINERY on the DERIVED objects, STANDARD §3), NOT a posited su(2)/su(3)/so(7)/U(1)_Y/
  GUT-embedding/normalization as content, NOT Mathlib ℝ/ℂ as content (ℚ is the coefficient field the
  statements are WRITTEN IN; the OBJECTS are the derived rung `O ℚ`, the fundamental 7 `ImO`, the
  gather charge `chargeOp`, the isospin image `imRep DI`), NOT a bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no bridge.
-/
import Phys.Algebra.TowerGatherChargeIsospinRatio
import Phys.Algebra.DerivationRep7IsospinBranching
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-resolver budget (W9-LIGHT, NOT a proof-kernel bound): the derived rung
-- `O ℚ = CD (CD (Dbl ℚ))` carries a deep typeclass tower, so elaborating linear combinations
-- `a • chargeOp + b • imRep DI` of endomorphisms of `ImO` crosses the default 20000
-- `synthInstance` ceiling during INSTANCE SEARCH only. This raises the INSTANCE-search budget;
-- it does NOT touch `maxHeartbeats` (proof kernel) and does NOT weaken the trust base
-- (`#print axioms` unaffected — foundations-only). Measured GO in workbench/probe_synth.
set_option synthInstance.maxHeartbeats 400000

/-! ## (A) The two neutral operators COMMUTE (an abelian torus of so(7)). -/

/-- ★ THE COMMUTE: the gather charge operator and the doubling weak-isospin Cartan image COMMUTE.
    Via the N253 bridges `chargeOp = qI Cmat`, `imRep DI = qI Imat` and `qI_comp` (composition =
    matrix product `mul7`), reduced to the integer matrix identity `mul7 Cmat Imat = mul7 Imat Cmat`
    (`decide`). No coordinate bash of the non-associative `O ℚ` product. -/
theorem charge_isospin_commute : Commute chargeOp (imRep DI) := by
  show chargeOp * imRep DI = imRep DI * chargeOp
  rw [chargeOp_eq_qI, imRep_DI_eq_qI, qI_comp, qI_comp]
  congr 1
  decide

/-! ## (B) The two neutral operators are ℚ-LINEARLY INDEPENDENT (a genuine RANK-2 torus). -/

/-- The N253 trace form is symmetric: `B(X,Y) = B(Y,X)` (via `LinearMap.trace_mul_comm`). -/
theorem traceForm7_symm (X Y : Module.End ℚ ImO) : traceForm7 X Y = traceForm7 Y X := by
  unfold traceForm7
  rw [LinearMap.trace_mul_comm]

/-- The N253 trace form is linear in its LEFT argument on the two banked operators:
    `B(a•chargeOp + b•imRep DI, X) = a·B(chargeOp,X) + b·B(imRep DI,X)`. -/
theorem traceForm7_left (a b : ℚ) (X : Module.End ℚ ImO) :
    traceForm7 (a • chargeOp + b • imRep DI) X
      = a * traceForm7 chargeOp X + b * traceForm7 (imRep DI) X := by
  unfold traceForm7
  rw [add_mul, smul_mul_assoc, smul_mul_assoc, map_add, map_smul, map_smul, smul_eq_mul,
    smul_eq_mul]

/-- ★★ INDEPENDENCE: `chargeOp` and `imRep DI` are ℚ-linearly independent. If
    `a • chargeOp + b • imRep DI = 0` then `a = 0` and `b = 0`.

    THE ONE LAW / theory-native route: the N253 invariant TRACE FORM does the work. Pairing the
    vanishing combination against `chargeOp` gives `a·(−6) + b·0 = 0` (orthogonality
    `B(chargeOp, imRep DI) = 0`, self-length `B(chargeOp,chargeOp) = −6`), forcing `a = 0`; pairing
    against `imRep DI` gives `a·0 + b·(−16) = 0`, forcing `b = 0`. The SAME form that gave the 3:8
    ratio (N253) witnesses the linear independence — no coordinate bash. -/
def ChargeIsospinIndependent : Prop :=
  ∀ a b : ℚ, a • chargeOp + b • imRep DI = (0 : Module.End ℚ ImO) → a = 0 ∧ b = 0

theorem charge_isospin_independent : ChargeIsospinIndependent := by
  intro a b h
  have hA : traceForm7 (a • chargeOp + b • imRep DI) chargeOp = 0 := by
    rw [h]; unfold traceForm7; rw [zero_mul, map_zero]
  have hB : traceForm7 (a • chargeOp + b • imRep DI) (imRep DI) = 0 := by
    rw [h]; unfold traceForm7; rw [zero_mul, map_zero]
  rw [traceForm7_left, B_chargeOp_chargeOp,
    show traceForm7 (imRep DI) chargeOp = 0 from by
      rw [traceForm7_symm]; exact B_chargeOp_imRep_DI] at hA
  rw [traceForm7_left, B_imRep_DI,
    show traceForm7 chargeOp (imRep DI) = 0 from B_chargeOp_imRep_DI] at hB
  constructor
  · have : a * (-6 : ℚ) = 0 := by linarith [hA]
    linarith [this]
  · have : b * (-16 : ℚ) = 0 := by linarith [hB]
    linarith [this]

/-! ## (C) The two gradings of the fundamental 7 are MISALIGNED. -/

/-- The isospin singlet `kap1 = κO 1 = ⟨0,1⟩` (N189) as an element of the fundamental 7 `ImO`. -/
noncomputable def kap1 : ImO := ⟨kappaO 1, kappaO_one_mem_ImO⟩

/-- The isospin singlet is ISOSPIN-NEUTRAL: `imRep DI kap1 = 0` (the weak-isospin Cartan
    annihilates it, `innerDeriv_kappaO_one` N189). -/
theorem imRep_DI_kappaO : imRep DI kap1 = 0 := by
  apply Subtype.ext
  rw [imRep_coe]
  change innerDerivQ hI (kappaO 1) = 0
  rw [innerDerivQ_apply]
  exact innerDeriv_kappaO_one hI

/-- The explicit charge coordinate of the isospin singlet: `(chargeOp kap1).c5 = 1`. The gather
    charge operator `chargeOp = qI Cmat` moves `κO 1` (supported on `c4`) onto the `c5` axis. This
    is the load-bearing numeric of the misalignment (a WRONG reading — the gradings coincide, the
    isospin singlet is charge-neutral — would give `0`). -/
theorem chargeOp_kappaO_coord : ((chargeOp kap1 : ImO) : O ℚ).im.re.im = 1 := by
  rw [chargeOp_eq_qI]
  show (qZ Cmat (kappaO 1)).im.re.im = 1
  simp only [qZ, Cmat, kappaO,
    c1, c2, c3, c4, c5, c6, c7,
    CD.zero_im, Dbl.zero_im, CD.one_im, Dbl.one_re,
    LinearMap.coe_mk, AddHom.coe_mk,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]
  norm_num

/-- ★★ THE MISALIGNMENT WITNESS: the isospin singlet is CHARGE-NONZERO — `chargeOp kap1 ≠ 0`.
    Its `c5` coordinate (`.im.re.im`) is `1` (`chargeOp_kappaO_coord`): `chargeOp = qI Cmat` moves
    `κO 1` (supported on `c4`) onto `c5`. So the isospin-neutral direction `kap1` is charged: the
    two gradings MISALIGN. -/
theorem chargeOp_kappaO_ne_zero : chargeOp kap1 ≠ 0 := by
  intro hzero
  have hcoord := chargeOp_kappaO_coord
  rw [hzero] at hcoord
  simp only [ZeroMemClass.coe_zero, CD.zero_im, Dbl.zero_im] at hcoord
  exact one_ne_zero hcoord.symm

/-- ★★★ MISALIGNED GRADINGS: `ker (imRep DI) ⊄ ker chargeOp`. Weak isospin ALONE does NOT
    determine the charge grading of the fundamental 7 — the isospin singlet `kap1` is
    isospin-neutral yet charged. A SECOND independent neutral generator is FORCED, not posited. -/
theorem grading_misaligned :
    ¬ (LinearMap.ker (imRep DI) ≤ LinearMap.ker chargeOp) := by
  intro hle
  have h1 : kap1 ∈ LinearMap.ker (imRep DI) := by
    rw [LinearMap.mem_ker]; exact imRep_DI_kappaO
  have h2 : kap1 ∈ LinearMap.ker chargeOp := hle h1
  rw [LinearMap.mem_ker] at h2
  exact chargeOp_kappaO_ne_zero h2

/-! ## (D) The UNIQUE doubly-neutral axis: the joint kernel is exactly `span{sgl}`. -/

/-- The fold-root singlet is ISOSPIN-NEUTRAL too: `imRep DI sgl = 0` (`innerDeriv_hI_u1` N202). -/
theorem imRep_DI_sgl : imRep DI sgl = 0 := by
  apply Subtype.ext
  rw [imRep_coe]
  change innerDerivQ hI u1 = 0
  rw [innerDerivQ_apply]
  exact innerDeriv_hI_u1

/-- ★★★ THE UNIQUE DOUBLY-NEUTRAL AXIS: `ker chargeOp ⊓ ker (imRep DI) = span{sgl}`. The ONLY
    direction neutral under BOTH the charge and the isospin Cartan is exactly the fold-root
    branching singlet `u1`. (N244 `chargeOp_ker` pins `ker chargeOp = span{sgl}`; `imRep_DI_sgl`
    puts `sgl` in `ker (imRep DI)`, so the meet is `span{sgl}` itself.) -/
theorem joint_neutral_kernel :
    LinearMap.ker chargeOp ⊓ LinearMap.ker (imRep DI) = Submodule.span ℚ {sgl} := by
  rw [chargeOp_ker]
  apply le_antisymm
  · exact inf_le_left
  · refine le_inf le_rfl ?_
    rw [Submodule.span_singleton_le_iff_mem, LinearMap.mem_ker]
    exact imRep_DI_sgl

/-! ## (E) W8 non-vacuity + the capstone. -/

/-- ★ W8 TEETH: the structure is GENUINE, not degenerate. `chargeOp` and `imRep DI` COMMUTE, are
    LINEARLY INDEPENDENT (rank-2), their gradings MISALIGN, and their joint kernel is `span{sgl}`.
    None of these is vacuous: independence is genuine (`chargeOp ≠ 0`, since its self-length is
    `−6 ≠ 0`), and misalignment is witnessed by a specific charged isospin-singlet `kap1`. -/
theorem forced_second_neutral_nonvacuous :
    Commute chargeOp (imRep DI) ∧ ChargeIsospinIndependent ∧
    imRep DI kap1 = 0 ∧ chargeOp kap1 ≠ 0 :=
  ⟨charge_isospin_commute, charge_isospin_independent, imRep_DI_kappaO, chargeOp_kappaO_ne_zero⟩

/-- ★★★ CAPSTONE — THE FORCED SECOND NEUTRAL DIRECTION. The gather charge `chargeOp` and the
    doubling weak-isospin Cartan `imRep DI` (both born from the single fold-root `u1`) COMMUTE,
    are ℚ-LINEARLY INDEPENDENT (a rank-2 abelian torus of so(7)), grade the fundamental 7
    DIFFERENTLY (`ker (imRep DI) ⊄ ker chargeOp`), and meet only in the fold-root axis
    (`ker chargeOp ⊓ ker (imRep DI) = span{sgl}`) — so a second independent neutral generator is
    FORCED, not posited. -/
theorem forced_second_neutral_structure :
    Commute chargeOp (imRep DI) ∧ ChargeIsospinIndependent ∧
    ¬ (LinearMap.ker (imRep DI) ≤ LinearMap.ker chargeOp) ∧
    LinearMap.ker chargeOp ⊓ LinearMap.ker (imRep DI) = Submodule.span ℚ {sgl} :=
  ⟨charge_isospin_commute, charge_isospin_independent, grading_misaligned, joint_neutral_kernel⟩

end Phys.Algebra
