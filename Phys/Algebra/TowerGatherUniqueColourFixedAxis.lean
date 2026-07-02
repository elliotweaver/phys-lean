/-
  Phys.Algebra.TowerGatherUniqueColourFixedAxis — N252.
  ===========================================================================
  THE UNIQUE COLOUR-FIXED AXIS: the colour-invariant subspace of the fundamental 7 is EXACTLY the
  1-dimensional branching singlet `span{sgl} = span{u1}`, DERIVED from the gather-obstruction
  structure. Owner-authorized gather-side hypercharge front, under the TEMPORARY PRIORITY LOCK
  (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT the parked invariant-tower
  ascent.

  THE DELIVERABLE. N240 fed the branching's distinguished element `u1` (the fold's √−1) into the
  gather tear BECAUSE the branching "singles it out"; N251 FACE 3 banked the stabilizer side
  (`chargeStabilizer = colourCentralizer` — colour su(3) is exactly the stabilizer of `u1`). But
  the CONVERSE was never proved: that `u1` is the UNIQUE colour-fixed direction in the fundamental
  7. THIS node banks that converse and closes the stabilizer↔fixed-line loop:

    ★★★ `colourInvariants_eq_span_sgl : colourInvariants = span{sgl}` — the subspace of the
        fundamental 7 `ImO` fixed by EVERY colour derivation (the joint kernel
        `⨅ D : colourCentralizer, ker (imRep D)`) is EXACTLY the 1-dimensional branching singlet.
        There is NO other colour-invariant direction: the charged complement `Vsub = 3 ⊕ 3̄`
        carries none.
    ★★  `finrank_colourInvariants : finrank ℚ colourInvariants = 1` — W8 TEETH: not 0 (the singlet
        IS fixed, `colour_kills_sgl` N245), not larger (the charged complement has no fixed vector).
    ★★  `colourInvariants_map_eq_singlet` — pushing the joint kernel through `ImO.subtype` recovers
        the banked `O ℚ`-level branching singlet `singlet = span{u1}` (N42c). Anchors the
        colour-fixed axis on the already-banked `7 = 1 ⊕ (3 ⊕ 3̄)`.
    ★★  THE DUALITY (the moat) `unique_colour_fixed_axis_structure` — with N251 FACE 3
        (`chargeStabilizer = colourCentralizer`) the charge axis `u1` and colour su(3) MUTUALLY
        DETERMINE each other: colour is exactly the stabilizer of the line `span{u1}` (banked
        converse: FACE 3), and that line is exactly the colour-fixed axis (this node). The u(1)
        charge DIRECTION is FORCED, not a chosen embedding.

  THE CRUX — HOW THE `Vsub^colour = 0` OBSTRUCTION DISSOLVES (THE ONE LAW / no `decide`, no
  joint-kernel search). The `⊆` direction ("no colour-fixed direction outside the singlet") does
  NOT require scanning all of colour su(3): ONE regular colour element suffices. `Dreg := DL 0 +
  DL 13` is a colour derivation (both `DL 0`, `DL 13` annihilate `u1`, so `Dreg ∈ colourCentralizer`
  = stab(u1), N201) whose fundamental-7 action `imRep Dreg = qI MHmat` (the banked integer-matrix
  calculus, N234) has kernel EXACTLY `span{sgl}`: its 6 imaginary rows force `c2 = ⋯ = c7 = 0`, and
  `x ∈ ImO` forces `c0 = 0` (`reQ_ImO_zero`), so `x = c1(x)·u1 = c1(x)·sgl`. The joint kernel over
  ALL of colour is contained in this single element's kernel, hence in `span{sgl}`; the reverse is
  `colour_kills_sgl`. THE ONE LAW: a single explicit derivation dissolves the obstruction — no
  coordinate bash over the non-associative `O ℚ`, no decidable rank certificate.

  THE MOAT / DISSOLUTION (docs/STANDARD §0). The field treats the U(1) as an INDEPENDENT factor of
  `SU(3) × U(1)`, with WHICH direction is hypercharge a chosen embedding. The theory DISSOLVES the
  DIRECTION/EMBEDDING choice: the colour-fixed subspace of the fundamental is EXACTLY 1-dimensional
  (`span{u1}`), so the charge axis is UNIQUE — there is nothing to choose about which direction the
  u(1) points. (SCOPE: this dissolves the hypercharge DIRECTION/embedding ambiguity only, NOT the
  NORMALIZATION — the coupling scale / weak mixing angle — which is a separate question this node
  does not touch.) ONE cause — `u1`, the fold's √−1 = the gather-tear input = the branching singlet
  = the charge-`0` eigenspace (N244) — is ALSO the unique colour-fixed axis: the stabilizer↔fixed-
  line duality closes on the single derived element.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / su(3) / charge / hypercharge / gauge
  / singlet / axis / fixed": over the derived field ℚ and the banked octonion rung `O ℚ = CD (H ℚ)`,
  for the Leibniz-derivation representation `imRep` (N22) and the operator centralizer
  `colourCentralizer` of `JO = L_{u1}` (N201), the joint kernel `⨅ D : colourCentralizer,
  ker (imRep D)` on `ImO` equals the 1-dimensional `span{⟨u1⟩}`, has finrank 1, and pushes through
  `ImO.subtype` to the banked `span{u1}`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N251 (`colourCentralizer`/`chargeStabilizer_eq_colour`/`colour_kills_sgl`
  chain), N234 (`DL`/`dm`/`qI`/`imRep_DL_0`/`imRep_DL_13`/`qI_add`/`qI_coe`/integer matrix calculus),
  N42c (`sgl`/`sgl_ne_zero`/`singlet`), N201 (`colourCentralizer_eq_stab`/`mem_stabLieQ`), N208
  (`reQ_ImO_zero`), and standard Mathlib kernel/iInf/finrank/span machinery. Ground = derived ℚ;
  nothing posited; no Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation, no compiled-decision-procedure bypass.
-/
import Phys.Algebra.TowerGatherColourChargeOneCause
import Phys.Algebra.TowerGatherIrreducible27
import Phys.Algebra.OctonionAssociative3Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## THE SINGLE REGULAR COLOUR ELEMENT that dissolves the obstruction. -/

/-- The explicit integer 7×7 matrix `MHmat = dm 0 + dm 13` of the regular colour element on the
    imaginary coordinates. Its 6 imaginary rows have joint kernel exactly the `u1` line. -/
def MHmat : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, -1, 0, -1, 0, 0],
     ![0, 1, 0, 1, 0, 0, 0],
     ![0, 0, -1, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -1],
     ![0, 0, 0, 0, 0, 1, 0]]

/-- `MHmat` is literally the integer-matrix sum `add7 (dm 0) (dm 13)` (entrywise check). -/
theorem add7_dm0_dm13 : add7 (dm 0) (dm 13) = MHmat := by
  funext i j
  fin_cases i <;> fin_cases j <;> rfl

/-- ★ THE REGULAR COLOUR ELEMENT: the sum of two banked colour generators `DL 0 + DL 13`. A single
    derivation whose fundamental-7 kernel is exactly the colour-fixed line — the instrument that
    dissolves the `Vsub^colour = 0` obstruction without scanning all of su(3). -/
def Dreg : derivationLieQ := DL 0 + DL 13

/-- The fundamental-7 action of `Dreg` is the banked integer matrix `qI MHmat`
    (via `imRep_DL_0`, `imRep_DL_13`, `qI_add`, N234). -/
theorem imRep_Dreg : imRep Dreg = qI MHmat := by
  rw [Dreg, map_add, imRep_DL_0, imRep_DL_13, ← qI_add, add7_dm0_dm13]

/-- `Dreg` annihilates the branching generator `u1` (both `DL 0` and `DL 13` do). -/
theorem Dreg_u1 : (Dreg : Module.End ℚ (O ℚ)) u1 = 0 := by
  show ((DL 0 + DL 13 : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
  rw [AddSubmonoid.coe_add, LinearMap.add_apply]
  show D0E u1 + D13E u1 = 0
  ext <;> simp [D0E, D13E, u1, c2, c3, c4, c5, c6, c7]

/-- ★ `Dreg` is a COLOUR derivation: it stabilizes `u1`, so it lies in `colourCentralizer`
    (= stab(u1), N201 `colourCentralizer_eq_stab`). -/
theorem Dreg_mem_colour : Dreg ∈ colourCentralizer := by
  rw [colourCentralizer_eq_stab, mem_stabLieQ]
  exact Dreg_u1

/-! ## THE SINGLE-ELEMENT KERNEL is exactly the singlet. -/

/-- ⊇ : the singlet lies in the kernel of the regular colour element's matrix. -/
theorem sgl_mem_ker_qI_MH : sgl ∈ LinearMap.ker (qI MHmat) := by
  rw [LinearMap.mem_ker]
  apply Subtype.ext
  rw [qI_coe]
  show qZ MHmat u1 = 0
  ext <;> simp [qZ, MHmat, u1, c1, c2, c3, c4, c5, c6, c7]

/-- ★★ ⊆ THE CRUX : the kernel of the regular colour element's matrix lies in `span{sgl}`. The 6
    imaginary rows of `MHmat` force `c2 = ⋯ = c7 = 0`; `x ∈ ImO` forces the real part `c0 = 0`
    (`reQ_ImO_zero`); so `x = c1(x)·u1 = c1(x)·sgl ∈ span{sgl}`. THE ONE LAW: a `linarith` on the
    six banked integer rows — no coordinate bash over the non-associative `O ℚ`. -/
theorem ker_qI_MH_le_span_sgl :
    LinearMap.ker (qI MHmat) ≤ Submodule.span ℚ {sgl} := by
  intro x hx
  rw [LinearMap.mem_ker] at hx
  have hcoe : qZ MHmat (x : O ℚ) = 0 := by
    have := congrArg (fun z : ImO => (z : O ℚ)) hx
    simpa [qI_coe] using this
  have hc0 : ((x : O ℚ)).re.re.re = 0 := by
    have := reQ_ImO_zero x.2; simpa [reQ] using this
  have e2 : c2 (qZ MHmat (x : O ℚ)) = 0 := by rw [hcoe]; simp [c2]
  have e3 : c3 (qZ MHmat (x : O ℚ)) = 0 := by rw [hcoe]; simp [c3]
  have e4 : c4 (qZ MHmat (x : O ℚ)) = 0 := by rw [hcoe]; simp [c4]
  have e5 : c5 (qZ MHmat (x : O ℚ)) = 0 := by rw [hcoe]; simp [c5]
  have e6 : c6 (qZ MHmat (x : O ℚ)) = 0 := by rw [hcoe]; simp [c6]
  have e7 : c7 (qZ MHmat (x : O ℚ)) = 0 := by rw [hcoe]; simp [c7]
  simp only [qZ, MHmat, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
    AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val, Int.cast_zero, Int.cast_one, Int.cast_neg, zero_mul, one_mul,
    neg_mul, zero_add, add_zero] at e2 e3 e4 e5 e6 e7
  rw [Submodule.mem_span_singleton]
  refine ⟨c1 (x : O ℚ), ?_⟩
  apply Subtype.ext
  show (c1 (x : O ℚ) • (sgl : O ℚ)) = (x : O ℚ)
  show c1 (x : O ℚ) • u1 = (x : O ℚ)
  ext <;>
    simp only [c1, u1, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
      mul_zero, mul_one] <;>
    linarith [e2, e3, e4, e5, e6, e7, hc0]

/-- ★★ THE SINGLE-ELEMENT HEADLINE: the kernel of the regular colour element on the fundamental 7
    is EXACTLY the singlet: `ker (imRep Dreg) = span{sgl}`. One colour derivation already pins the
    colour-fixed direction to the singlet line. -/
theorem ker_imRep_Dreg : LinearMap.ker (imRep Dreg) = Submodule.span ℚ {sgl} := by
  rw [imRep_Dreg]
  exact le_antisymm ker_qI_MH_le_span_sgl (by
    rw [Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
    exact sgl_mem_ker_qI_MH)

/-! ## THE FULL COLOUR-INVARIANT SUBSPACE. -/

/-- ★ The colour-invariant subspace of the fundamental 7: the vectors fixed by EVERY colour
    derivation — the joint kernel `⨅ D : colourCentralizer, ker (imRep D)` on `ImO`. -/
def colourInvariants : Submodule ℚ ImO :=
  ⨅ D : colourCentralizer, LinearMap.ker (imRep (D : derivationLieQ))

/-- ⊇ : the branching singlet is colour-invariant — every colour derivation annihilates it
    (`colour_kills_sgl`, N245). The colour-fixed subspace is NOT `0`. -/
theorem span_sgl_le_colourInvariants : Submodule.span ℚ {sgl} ≤ colourInvariants := by
  rw [Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe, colourInvariants,
      Submodule.mem_iInf]
  intro D
  rw [LinearMap.mem_ker]
  exact colour_kills_sgl (D : derivationLieQ) D.2

/-- ⊆ : every colour-invariant vector lies in `span{sgl}` — because it is in particular fixed by
    the single regular element `Dreg`, whose kernel is `span{sgl}`. No other colour-fixed
    direction exists; the charged complement `Vsub = 3 ⊕ 3̄` carries none. -/
theorem colourInvariants_le_span_sgl : colourInvariants ≤ Submodule.span ℚ {sgl} := by
  intro x hx
  rw [colourInvariants, Submodule.mem_iInf] at hx
  have hxD : x ∈ LinearMap.ker (imRep Dreg) := hx ⟨Dreg, Dreg_mem_colour⟩
  rwa [ker_imRep_Dreg] at hxD

/-- ★★★ THE HEADLINE: the colour-invariant subspace of the fundamental 7 is EXACTLY the
    1-dimensional branching singlet — `colourInvariants = span{sgl}`. `u1` is the UNIQUE
    colour-fixed direction: the branching singlet is fixed (`⊇`), and nothing outside it is
    (`⊆`, via the single regular element `Dreg`). The converse of N251 FACE 3
    (`chargeStabilizer = colourCentralizer`): colour not only stabilizes the `u1` line, that line
    is the ONLY thing colour fixes. -/
theorem colourInvariants_eq_span_sgl : colourInvariants = Submodule.span ℚ {sgl} :=
  le_antisymm colourInvariants_le_span_sgl span_sgl_le_colourInvariants

/-- ★★ W8 TEETH: the colour-invariant subspace is EXACTLY 1-dimensional
    (`finrank_span_singleton sgl_ne_zero`). Not 0 (the singlet is fixed) and not larger (the
    charged complement has no fixed vector) — the colour-fixed axis is a single line. -/
theorem finrank_colourInvariants : Module.finrank ℚ colourInvariants = 1 := by
  rw [colourInvariants_eq_span_sgl]; exact finrank_span_singleton sgl_ne_zero

/-- ★★ THE ANCHOR ON THE BANKED BRANCHING: pushing the colour-invariant subspace through the
    inclusion `ImO.subtype` recovers the banked `O ℚ`-level branching singlet `singlet = span{u1}`
    (N42c). The colour-fixed axis of the fundamental 7 IS the branching singlet line. -/
theorem colourInvariants_map_eq_singlet :
    colourInvariants.map (ImO.subtype) = singlet := by
  rw [colourInvariants_eq_span_sgl, Submodule.map_span, singlet, Set.image_singleton]
  rfl

/-! ## THE CAPSTONE — the stabilizer↔fixed-line DUALITY. -/

/-- ★★★ THE UNIQUE COLOUR-FIXED AXIS, the stabilizer↔fixed-line DUALITY closing N251 FACE 3.
    Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the Leibniz-derivation
    representation `imRep` (N22), colour `colourCentralizer = su(3)` (N201, the stabilizer of the
    branching generator `u1`), and the branching singlet `sgl = ⟨u1⟩` (N42c):
    (i)   the colour-invariant subspace of the fundamental 7 is EXACTLY the 1-dimensional singlet
          (`colourInvariants = span{sgl}`, `finrank = 1`) — `u1` is the UNIQUE colour-fixed
          direction, the charged complement `Vsub = 3 ⊕ 3̄` carries none;
    (ii)  that subspace pushes through `ImO.subtype` to the banked branching `singlet`;
    (iii) N251 FACE 3 `chargeStabilizer = colourCentralizer` — colour su(3) is exactly the
          stabilizer of the `u1` line.
    Together (i) and (iii) are the DUALITY: colour and the charge axis `u1` MUTUALLY DETERMINE
    each other — colour is the stabilizer of the line, and the line is the colour-fixed axis. The
    u(1) charge DIRECTION is FORCED as the unique colour-fixed axis, DERIVED not posited — there is
    no embedding to choose. (Scope: the DIRECTION/embedding is fixed; the coupling NORMALIZATION is
    a separate question, not addressed here.) -/
theorem unique_colour_fixed_axis_structure :
    colourInvariants = Submodule.span ℚ {sgl} ∧
    Module.finrank ℚ colourInvariants = 1 ∧
    colourInvariants.map (ImO.subtype) = singlet ∧
    chargeStabilizer = colourCentralizer :=
  ⟨colourInvariants_eq_span_sgl, finrank_colourInvariants, colourInvariants_map_eq_singlet,
   chargeStabilizer_eq_colour⟩

end

end Phys.Algebra
