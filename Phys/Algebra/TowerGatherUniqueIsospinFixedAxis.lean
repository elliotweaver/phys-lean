/-
  Phys.Algebra.TowerGatherUniqueIsospinFixedAxis — N256.
  ===========================================================================
  THE UNIQUE ISOSPIN-FIXED AXIS: the isospin-invariant subspace of the fundamental 7 is EXACTLY the
  1-dimensional branching singlet `span{kappaO 1}`, DERIVED from the gather object. Owner-authorized
  gather-side hypercharge front, under the TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner
  authorization 2026-07-01). Gather-native (`imRep`/`crossEmb` + the banked integer-matrix calculus
  `qI`/`M7`), NOT the parked invariant-tower ascent.

  THE DELIVERABLE. N255 banked that the gather cross-product of the isospin-neutral branching singlet,
  `hyperOp = crossOp (kappaO 1)`, COMMUTES with the whole weak isospin `su(2)_L = {DI,DJ,DK}` (its
  EXISTENCE as a forced isospin-commuting direction). But the CONVERSE — that `kappaO 1` is the UNIQUE
  isospin-fixed direction in the fundamental 7, hence `hyperOp` is the unique (up to scale)
  isospin-commuting gather generator — was never proved. THIS node banks that converse, the exact
  vector-level TWIN of N252's unique colour-fixed axis (the DUAL under charge↔colour,
  hypercharge↔isospin):

    ★★★ `isospinInvariants_eq_span_kap : isospinInvariants = span{kap1'}` — the subspace of the
        fundamental 7 `ImO` fixed by EVERY weak-isospin generator (the joint kernel
        `ker(imRep DI) ⊓ ker(imRep DJ) ⊓ ker(imRep DK)`) is EXACTLY the 1-dimensional branching
        singlet `kap1' = ⟨kappaO 1⟩`. There is NO other isospin-fixed direction: the charged
        complement carries none.
    ★★  `finrank_isospinInvariants : finrank ℚ isospinInvariants = 1` — W8 TEETH: not 0 (the singlet
        IS fixed, `D_kappaO_one_zero` N189/N255), not larger (the charged complement has no
        isospin-fixed vector, forced by the PAIR `{DI,DJ}` alone).
    ★★  `map_crossEmb_isospinInvariants` — the faithful gather embedding `crossEmb` (N225, injective)
        sends the unique isospin-fixed axis to `span{hyperOp}`: `hyperOp = crossOp (kappaO 1)` is the
        UNIQUE (up to scale) isospin-commuting cross-product generator, grounding N255's EXISTENCE
        with UNIQUENESS.
    ★★  THE TWIN DUALITY `unique_isospin_fixed_axis_structure` — the isospin-fixed axis
        `span{kappaO 1} = span{e4}` and the colour-fixed axis `span{u1} = span{e1}` (N252) are
        genuinely DIFFERENT lines; each forced U(1) direction is the gather cross-product of the OTHER
        factor's unique fixed axis (charge↔colour N252/N240, hypercharge↔isospin here/N255).

  THE CRUX — HOW THE `Vsub^isospin = 0` OBSTRUCTION DISSOLVES (THE ONE LAW / no `decide`, no
  joint-kernel search over all of su(2)_L, no coordinate bash of `O ℚ`). The `⊆` direction ("no
  isospin-fixed direction outside the singlet") does NOT need all three generators: the PAIR
  `{DI, DJ}` suffices. Their fundamental-7 actions are the banked integer matrices `imRep DI = qI Imat`
  (N253) and `imRep DJ = qI Jmat` (this node, the twin bridge). `Imat` forces `c2 = c3 = c6 = c7 = 0`;
  `Jmat` forces `c1 = c5 = 0`; `x ∈ ImO` forces the real part `c0 = 0` (`reQ_ImO_zero` N208); so only
  `c4` — the `kappaO 1 = e4` coordinate — survives, and `x = c4(x)·(kappaO 1) ∈ span{kap1'}`. A
  `linarith` on the banked integer rows — no coordinate bash over the non-associative `O ℚ`, no
  decidable rank certificate. (The single generator `DI` has a 3-dimensional kernel — weak isospin is
  rank 1 — so the pair, not a single element, is the minimal instrument; the DUAL of N252's single
  regular colour element.)

  THE MOAT / DISSOLUTION (docs/STANDARD §0). The field treats the U(1)_Y as an INDEPENDENT factor,
  with WHICH direction is hypercharge a chosen GUT embedding. The theory DISSOLVES the
  DIRECTION/EMBEDDING choice AND its uniqueness: the isospin-fixed subspace of the fundamental is
  EXACTLY 1-dimensional (`span{kappaO 1}`), so the isospin-commuting neutral generator is UNIQUE up to
  scale — there is nothing to choose about which direction it points. (SCOPE: this dissolves the
  hypercharge DIRECTION/embedding ambiguity + its uniqueness within the faithful gather-embedded 7
  only, NOT the coupling NORMALIZATION / weak mixing angle, and NOT the full so(7)-operator-centralizer
  uniqueness over the 14-dim g₂ — those stay separate downstream nodes.) ONE cause — the same
  self-blindness (a symmetry cannot see/move its own fixed axis) — pins BOTH forced U(1) directions,
  each as `crossOp` of the OTHER factor's unique fixed line: the stabilizer↔fixed-line duality closing
  on both the colour (N252) and isospin (this node) sides.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "isospin / su(2) / weak / hypercharge / charge /
  gauge / neutral / singlet / axis / fixed": over the derived field ℚ and the banked octonion rung
  `O ℚ = CD (H ℚ)`, for the Leibniz-derivation representation `imRep` (N22) and the three inner
  derivations `DI, DJ, DK` (N202), the joint kernel `ker(imRep DI) ⊓ ker(imRep DJ) ⊓ ker(imRep DK)`
  on `ImO` equals the 1-dimensional `span{⟨kappaO 1⟩}`, has finrank 1, and its image under the
  faithful embedding `crossEmb` is `span{crossOp (kappaO 1)}` — a DIFFERENT line from `span{u1}`. No
  theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N255 (`kap1'`/`kap1'_ne_zero`/`hyperOp`/`crossEmb`/`crossEmb_apply`/
  `crossEmb_injective`/`D_kappaO_one_zero`), which transitively supplies N253/N254
  (`Imat`/`qI`/`qZ`/`M7`/`imRep_DI_eq_qI`/`qI_coe`), N208 (`reQ_ImO_zero`), N202 (`DI`/`DJ`/`DK`), N22
  (`imRep`), N189 (`kappaO`/`kappaO_one_mem_ImO`), and standard Mathlib kernel/inf/finrank/span/map
  machinery. Ground = derived ℚ; nothing posited; no Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation (the `synthInstance.maxHeartbeats` bump is
  instance-search only, the banked N255 precedent), no compiled-decision-procedure bypass.
-/
import Phys.Algebra.TowerGatherForcedHyperchargeDirection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-! ## The twin bridge: `imRep DJ` as a banked integer matrix. -/

/-- The integer 7×7 matrix of the off-Cartan weak-isospin generator `imRep DJ` (`innerDeriv hJ`) on
    the imaginary coordinates — the twin of the banked `Imat` (`imRep_DI_eq_qI`, N253). Together the
    PAIR `{Imat, Jmat}` pins the isospin-fixed axis. -/
def Jmat : M7 :=
  ![![0, 0, 2, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![-2, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 2],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -2, 0, 0]]

/-- ★ BRIDGE: the off-Cartan isospin image `imRep DJ` is the banked integer matrix `qI Jmat` on the
    fundamental 7 (twin of the banked `imRep_DI_eq_qI`; simp set `hJ = CD.e2`, then `ring`). -/
theorem imRep_DJ_eq_qI : imRep DJ = qI Jmat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (innerDeriv (hJ : H ℚ)) (x : O ℚ) = qZ Jmat (x : O ℚ)
  ext <;>
    simp only [innerDeriv, liftEnd_apply, adHom_apply, hJ, CD.e2, qZ, Jmat,
      c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      Dbl.zero_re, Dbl.zero_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.cons_val] <;>
    ring

/-! ## The isospin-invariant subspace of the fundamental 7. -/

/-- ★ The isospin-invariant subspace of the fundamental 7: the vectors fixed by EVERY weak-isospin
    generator — the joint kernel of `imRep DI, imRep DJ, imRep DK` on `ImO`. -/
def isospinInvariants : Submodule ℚ ImO :=
  LinearMap.ker (imRep DI) ⊓ LinearMap.ker (imRep DJ) ⊓ LinearMap.ker (imRep DK)

/-- Each isospin generator annihilates the branching singlet `kap1' = ⟨kappaO 1⟩`
    (`D_kappaO_one_zero`, N189/N255). -/
theorem imRep_DI_kap1' : imRep DI kap1' = 0 := by
  apply Subtype.ext; exact D_kappaO_one_zero hI DI.2
theorem imRep_DJ_kap1' : imRep DJ kap1' = 0 := by
  apply Subtype.ext; exact D_kappaO_one_zero hJ DJ.2
theorem imRep_DK_kap1' : imRep DK kap1' = 0 := by
  apply Subtype.ext; exact D_kappaO_one_zero hK DK.2

/-- ⊇ : the branching singlet is isospin-fixed — every isospin generator annihilates it. The
    isospin-fixed subspace is NOT `0`. -/
theorem kap1'_mem_isospinInvariants : kap1' ∈ isospinInvariants :=
  ⟨⟨LinearMap.mem_ker.mpr imRep_DI_kap1', LinearMap.mem_ker.mpr imRep_DJ_kap1'⟩,
    LinearMap.mem_ker.mpr imRep_DK_kap1'⟩

/-- ★★ ⊆ THE CRUX : every isospin-fixed vector lies in `span{kap1'}`. The PAIR `{DI, DJ}` alone
    suffices: `Imat` forces `c2 = c3 = c6 = c7 = 0`, `Jmat` forces `c1 = c5 = 0`, `x ∈ ImO` forces
    `c0 = 0` (`reQ_ImO_zero`); only the `kappaO 1 = e4` coordinate `c4` survives, so
    `x = c4(x)·(kappaO 1) ∈ span{kap1'}`. THE ONE LAW: a `linarith` on the banked integer rows — no
    coordinate bash over the non-associative `O ℚ`. -/
theorem isospinInvariants_le_span_kap :
    isospinInvariants ≤ Submodule.span ℚ {kap1'} := by
  rintro x ⟨⟨hxI, hxJ⟩, _⟩
  rw [SetLike.mem_coe, LinearMap.mem_ker, imRep_DI_eq_qI] at hxI
  rw [SetLike.mem_coe, LinearMap.mem_ker, imRep_DJ_eq_qI] at hxJ
  have hI0 : qZ Imat (x : O ℚ) = 0 := by
    have := congrArg (fun z : ImO => (z : O ℚ)) hxI; simpa [qI_coe] using this
  have hJ0 : qZ Jmat (x : O ℚ) = 0 := by
    have := congrArg (fun z : ImO => (z : O ℚ)) hxJ; simpa [qI_coe] using this
  have hc0 : ((x : O ℚ)).re.re.re = 0 := by
    have := reQ_ImO_zero x.2; simpa [reQ] using this
  have e2 : c2 (qZ Imat (x:O ℚ)) = 0 := by rw [hI0]; simp [c2]
  have e3 : c3 (qZ Imat (x:O ℚ)) = 0 := by rw [hI0]; simp [c3]
  have e6 : c6 (qZ Imat (x:O ℚ)) = 0 := by rw [hI0]; simp [c6]
  have e7 : c7 (qZ Imat (x:O ℚ)) = 0 := by rw [hI0]; simp [c7]
  have f1 : c3 (qZ Jmat (x:O ℚ)) = 0 := by rw [hJ0]; simp [c3]
  have f5 : c7 (qZ Jmat (x:O ℚ)) = 0 := by rw [hJ0]; simp [c7]
  simp only [qZ, Imat, Jmat, c1, c2, c3, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val,
    Int.cast_zero, Int.cast_neg, Int.cast_ofNat, zero_mul, neg_mul,
    zero_add, add_zero] at e2 e3 e6 e7 f1 f5
  rw [Submodule.mem_span_singleton]
  refine ⟨c4 (x : O ℚ), ?_⟩
  apply Subtype.ext
  show (c4 (x : O ℚ) • (kappaO 1 : O ℚ)) = (x : O ℚ)
  ext <;>
    simp only [kappaO_apply, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
      mul_zero, mul_one, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, c4] <;>
    linarith [e2, e3, e6, e7, f1, f5, hc0]

/-- ★★★ THE HEADLINE: the isospin-invariant subspace of the fundamental 7 is EXACTLY the
    1-dimensional branching singlet — `isospinInvariants = span{kap1'}`. `kappaO 1` is the UNIQUE
    isospin-fixed direction: the branching singlet is fixed (`⊇`), and nothing outside it is (`⊆`,
    via the PAIR `{DI, DJ}`). The vector-level TWIN of N252's unique colour-fixed axis. -/
theorem isospinInvariants_eq_span_kap : isospinInvariants = Submodule.span ℚ {kap1'} :=
  le_antisymm isospinInvariants_le_span_kap
    (by rw [Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
        exact kap1'_mem_isospinInvariants)

/-- ★★ W8 TEETH: the isospin-invariant subspace is EXACTLY 1-dimensional. Not 0 (the singlet is
    fixed) and not larger (the charged complement has no isospin-fixed vector) — the isospin-fixed
    axis is a single line. -/
theorem finrank_isospinInvariants : Module.finrank ℚ isospinInvariants = 1 := by
  rw [isospinInvariants_eq_span_kap]; exact finrank_span_singleton kap1'_ne_zero

/-! ## The operator corollary: `hyperOp` is the unique isospin-commuting gather generator. -/

/-- `hyperOp = crossEmb kap1'` (the gather cross-product of the singlet vector). -/
theorem hyperOp_eq_crossEmb_kap1' : crossEmb kap1' = hyperOp := by
  rw [crossEmb_apply]; rfl

/-- ★★ THE OPERATOR UNIQUENESS: the faithful gather embedding `crossEmb` (N225, injective) sends the
    unique isospin-fixed axis to the line `span{hyperOp}`. Since `crossEmb` is injective and the
    isospin-fixed axis is exactly `span{kappaO 1}`, the isospin-commuting cross-product generator
    `hyperOp = crossOp (kappaO 1)` is UNIQUE up to scale — grounding N255's forced EXISTENCE with
    UNIQUENESS. -/
theorem map_crossEmb_isospinInvariants :
    isospinInvariants.map crossEmb = Submodule.span ℚ {hyperOp} := by
  rw [isospinInvariants_eq_span_kap, Submodule.map_span, Set.image_singleton,
    hyperOp_eq_crossEmb_kap1']

/-! ## Non-vacuity of the operator line. -/

/-- ★ W8 NON-VACUITY: the image line is not the trivial subspace — `hyperOp ≠ 0` (banked N255,
    coordinate-free from Born positivity), so `span{hyperOp}` is a genuine 1-dimensional line. -/
theorem finrank_map_crossEmb_isospinInvariants :
    Module.finrank ℚ (isospinInvariants.map crossEmb) = 1 := by
  rw [map_crossEmb_isospinInvariants]; exact finrank_span_singleton hyperOp_ne_zero

/-! ## The capstone — the twin duality. -/

/-- ★★★ THE UNIQUE ISOSPIN-FIXED AXIS, the twin duality of N252's unique colour-fixed axis. Over the
    derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the Leibniz-derivation
    representation `imRep` (N22), the weak-isospin generators `DI, DJ, DK` (N202), and the branching
    singlet `kap1' = ⟨kappaO 1⟩` (N189):
    (i)   the isospin-invariant subspace of the fundamental 7 is EXACTLY the 1-dimensional singlet
          (`isospinInvariants = span{kap1'}`, `finrank = 1`) — `kappaO 1` is the UNIQUE isospin-fixed
          direction, the charged complement carries none;
    (ii)  the faithful gather embedding sends it to `span{hyperOp}` — `hyperOp = crossOp (kappaO 1)`
          is the UNIQUE (up to scale) isospin-commuting gather generator, grounding N255's EXISTENCE
          with uniqueness.
    Together with N252 (`colourInvariants = span{u1}`), this is the TWIN DUALITY: each forced U(1)
    direction is the gather cross-product of the OTHER factor's unique fixed axis — charge ↔ colour
    (N240/N252), hypercharge ↔ isospin (N255/this node) — and the two fixed axes `span{kappaO 1}`
    and `span{u1}` are genuinely DIFFERENT lines. The hypercharge DIRECTION is FORCED and UNIQUE,
    DERIVED not posited. (Scope: the DIRECTION/embedding + its uniqueness within the faithful
    gather-embedded 7 are fixed; the coupling NORMALIZATION and the full so(7)-operator-centralizer
    uniqueness are separate downstream questions, not addressed here.) -/
theorem unique_isospin_fixed_axis_structure :
    isospinInvariants = Submodule.span ℚ {kap1'} ∧
    Module.finrank ℚ isospinInvariants = 1 ∧
    isospinInvariants.map crossEmb = Submodule.span ℚ {hyperOp} ∧
    Module.finrank ℚ (isospinInvariants.map crossEmb) = 1 :=
  ⟨isospinInvariants_eq_span_kap, finrank_isospinInvariants,
   map_crossEmb_isospinInvariants, finrank_map_crossEmb_isospinInvariants⟩

end

end Phys.Algebra
