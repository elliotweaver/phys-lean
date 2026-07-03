/-
# N263 — THE TWO FACES OF so(7) ARE ONE: the vector rotation and the spinor spin generator

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)`, imaginary part `ImO` (the fundamental 7). Two
`so(7)`'s have been built from the ONE fold Born form `gForm`, on two different spaces, and the
project has ASSERTED — in the N262 docstring and in `docs/CONSTELLATION.md` (★1/★3) — that they are
"ONE `so(7)`, TWO FACES":

  · THE GAUGE (VECTOR) FACE. The gather TEAR (N225) makes `so(7) = skewAdjointLieSubalgebra bornBil`
    the skew-adjoint endomorphisms of the fundamental 7 `ImO` for the Born form `bornBil` — and
    `bornBil x y = gForm x y` (banked, `TowerGatherObstructionAdjointSo7.bornBil_apply`). This `so(7)`
    carries the whole derived Standard-Model gauge structure (N240–N260).

  · THE SPINOR FACE. The gather WORLDMAP `leftReg a = L_a = (a·)` makes `O ℚ` a spinor (N261, the
    Clifford relation), and the ANTISYMMETRIC part `spinGen a b = [L_a, L_b]` (= the gather gluing
    obstruction, N219) is its SPIN GENERATOR: it rotates the "gamma" frame `{L_c}` (N262 `spinGen_act`)
    and closes into `so(7)` (N262 `spinGen_bracket`) — but on the 8-dim spinor `O ℚ`.

This assertion had NO theorem behind it — a HOLE (STANDARD §1/§2). The moat lives at the JOINTS (the
PROVED connections), and this is the deepest joint on the ★1↔★3 seam: the gauge symmetry (acting on
the vector 7) and the matter-rotation symmetry (acting on the spinor 8) are ONE `so(7)` in its two
natural representations. THIS node proves it.

THE BRIDGE. Since `leftReg` is INJECTIVE (`leftReg_injective`: `L_a 1 = a`), the frame `{L_c}` is a
FAITHFUL copy of the fundamental 7 inside `End(O ℚ)`. On that faithful copy, the spin generator's
ad-action is EXACTLY the standard `so(V)` vector rotation for the SAME Born form:

    `spinGen a b * leftReg c − leftReg c * spinGen a b = leftReg ((4:ℚ) • elemRot a b c)`

where `elemRot a b : c ↦ (gForm a c)•b − (gForm b c)•a` is the elementary `so(V)` generator — and
`elemRot a b` is SKEW-ADJOINT for `bornBil`, i.e. `elemRot a b ∈ skewAdjointLieSubalgebra bornBil`,
THE VERY SAME BANKED GAUGE `so(7)` (N225). So the spinor spin generator, read on the faithful frame,
IS a gauge-`so(7)` rotation of the vector 7. And `elemRot` obeys the SAME `so(V)` structure relation
(up to the Clifford scale `4`) that N262 proved for `spinGen` — the two faces have the same Lie
structure.

THE DISSOLUTION (STANDARD §0). The field builds `so(V)` on `V`, SEPARATELY builds the Clifford
algebra `Cl(V,q)`, isolates the bivector Lie subalgebra `Λ²V`, proves the EXTERNAL isomorphism
`Λ²V ≅ so(V)`, and lets it act on the spinor module — a bridge between two independently-constructed
apparatuses, with octonion non-associativity treated as an obstacle. The theory INVERTS + DISSOLVES
it: there is only ONE Born form `gForm`; the "vector `so(7)`" (the `bornBil` skew-adjoints) and the
"spinor bivectors" (the antisymmetric worldMap parts) are TWO READINGS OF THE SAME OBJECT, and the
famous iso "bivector ≅ `so(V)` rotation" is the single banked identity `spinGen_act` composed with
`leftReg`'s injectivity — NO Clifford import, NO external isomorphism. ONE CAUSE MANY TERMINATIONS:
the same octonion alternativity that forces the Clifford relation (N261) and makes the antisymmetric
part a rotation generator (N262) also makes that rotation a genuine element of the gauge `so(7)` the
tear built (N225) — one `so(7)`, two faces.

THE OBJECTS (all derived, foundations-only):
  ⭐   `elemRot`                — the elementary `so(V)` rotation generator on the vector 7 `ImO`.
  ⭐⭐  `elemRot_skew`          — `elemRot a b ∈ skewAdjointLieSubalgebra bornBil` (the BANKED gauge `so(7)`).
  ⭐⭐  `elemRot_antisymm`/`elemRot_self` — antisymmetry and `elemRot a a = 0`.
  ⭐⭐⭐ `spinGen_vector_action` — THE BRIDGE: the spin generator's ad-action on the faithful frame
        `{L_c}` is `leftReg` of a gauge-`so(7)` rotation of the vector 7.
  ⭐⭐  `leftReg_injective`     — `{L_c}` is a FAITHFUL copy of the fundamental 7.
  ⭐⭐  `elemRot_bracket`       — `elemRot` closes by the SAME `so(V)` structure relation as `spinGen`.
  ⭐⭐  `elemRot_frame_ne_zero` — W8: `i ≠ j ⟹ elemRot (e_i) (e_j) ≠ 0` (a genuine rotation, not vacuous).
  ⭐⭐⭐ `two_faces_of_so7`      — capstone: the vector rotation lives in the banked gauge `so(7)`, the
        spinor spin generator acts on the faithful frame AS that gauge rotation, they share the `so(V)`
        closure, and the action is non-vacuous.

⚠ FREE-FLOATING check (SOUL rail): every headline TYPE mentions the banked tower objects — the banked
`bornBil`/`skewAdjointLieSubalgebra bornBil` (N225), the banked `leftReg`/`spinGen`/`spinGen_act`
(N261/N262), the banked Born form `gForm` (N257) and orthonormal frame `imBasis` — on the derived
`O ℚ`/`ImO`. `elemRot` is the CONCRETE `so(V)` generator for `bornBil` on the derived 7; the bridge
is the CONCRETE `spinGen`↔`elemRot` identity, NOT a carrier-agnostic "bivectors of a Clifford module
give so(V)".
PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "spin / gauge / rotation / bivector / vector / spinor /
Clifford / matter / so(7)" — the pure statement "for the banked injective `leftReg` on `O ℚ` and the
banked `bornBil = gForm|ImO`, `elemRot a b ∈ bornBil.skewAdjointSubmodule`, the antisymmetric part
`[leftReg a, leftReg b]` post/pre-composed with `leftReg c` equals `leftReg (4 • elemRot a b c)`,
`elemRot` obeys the structure relation `[elemRot a b, elemRot c d] = gForm(a,c)•elemRot b d − …`, and
`elemRot (e_i)(e_j) ≠ 0` for `i ≠ j`" stands as pure mathematics with every property proved.

⚠ SCOPE — HONESTY CLAUSE. Banks the vector↔spinor `so(7)` identification AT THE ACTION LEVEL (the
spin generator acts on the faithful 7 as a gauge rotation) + `elemRot ∈` the banked gauge `so(7)` +
the `so(V)` closure of `elemRot` + faithfulness + non-vacuity ONLY. Does NOT bundle a cross-dimensional
`LieAlgebra` ISOMORPHISM object (the spinor rep acts on the 8-dim `O ℚ`, the vector rep on the 7-dim
`ImO`; the honest content is that the VECTOR REPRESENTATION of the spin generators lands in and matches
the banked gauge `so(7)`), NOT `Spin(7)`, NOT the full `Cl(0,7)` algebra isomorphism (all downstream).
The weak MIXING ANGLE remains a ≥9× NAMED deferred blocker (needs the ASCENT invariant tower),
untouched here.

Everything is over ℚ (pure algebra — NO continuum, NO Mathlib ℝ/ℂ/Clifford as content). `LinearMap`/
`Module.End`/`BilinForm`/`skewAdjointLieSubalgebra` are MACHINERY on the DERIVED `O ℚ`/`ImO`
(STANDARD §3). NO posited Clifford algebra, NO bridge. Foundations-only: `[propext, Classical.choice,
Quot.sound]`.
-/
import Phys.Algebra.TowerWorldMapSpinGenerators
import Phys.Algebra.TowerGatherObstructionAdjointSo7

open scoped Classical BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-! ## (A) The elementary `so(V)` rotation generator on the vector 7 `ImO`. -/

/-- The elementary `so(V)` rotation generator on the fundamental 7 `ImO`, for the fold Born form:
    `c ↦ (gForm a c)•b − (gForm b c)•a`. This is the standard generator that rotates in the `(a,b)`
    plane and fixes the orthogonal complement. -/
def elemRot (a b : ImO) : Module.End ℚ ImO where
  toFun c := (gForm (a : O ℚ) (c : O ℚ)) • b - (gForm (b : O ℚ) (c : O ℚ)) • a
  map_add' c₁ c₂ := by
    simp only [Submodule.coe_add, gForm_add_right]
    module
  map_smul' r c := by
    simp only [SetLike.val_smul, gForm_smul_right, RingHom.id_apply]
    module

@[simp] theorem elemRot_apply (a b c : ImO) :
    elemRot a b c = (gForm (a : O ℚ) (c : O ℚ)) • b - (gForm (b : O ℚ) (c : O ℚ)) • a := rfl

/-- `elemRot` is antisymmetric: `elemRot a b = − elemRot b a`. -/
theorem elemRot_antisymm (a b : ImO) : elemRot a b = - elemRot b a := by
  apply LinearMap.ext; intro c
  simp only [elemRot_apply, LinearMap.neg_apply]
  module

/-- `elemRot a a = 0` (a rotation in a degenerate plane is trivial). -/
theorem elemRot_self (a : ImO) : elemRot a a = 0 := by
  apply LinearMap.ext; intro c
  simp only [elemRot_apply, LinearMap.zero_apply]
  module

/-! ## (B) THE VECTOR FACE: `elemRot` lives in the banked gauge `so(7)`. -/

/-- ⭐⭐ THE VECTOR FACE — `elemRot a b` is SKEW-ADJOINT for the Born form `bornBil`, hence lands in
    the BANKED gauge `so(7) = skewAdjointLieSubalgebra bornBil` (N225). The elementary vector rotation
    generator IS a genuine element of the gauge `so(7)` the gather tear built. Proof: expand both
    Born pairings by bilinearity and close by `gForm`-symmetry. -/
theorem elemRot_skew (a b : ImO) :
    elemRot a b ∈ skewAdjointLieSubalgebra bornBil := by
  show elemRot a b ∈ bornBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  intro y z
  show bornBil (elemRot a b y) z = bornBil y ((-elemRot a b) z)
  simp only [elemRot_apply, LinearMap.neg_apply, map_sub, map_smul, map_neg,
    LinearMap.sub_apply, LinearMap.smul_apply, smul_eq_mul, bornBil_apply]
  rw [gForm_symm (b : O ℚ) (y : O ℚ), gForm_symm (a : O ℚ) (y : O ℚ)]
  ring

/-! ## (C) THE FAITHFUL FRAME: `leftReg` is injective. -/

/-- ⭐⭐ THE "GAMMA" FRAME IS A FAITHFUL COPY OF THE VECTOR 7: `leftReg : ImO →ₗ End ℚ (O ℚ)` is
    INJECTIVE. Since `leftReg a 1 = a · 1 = a`, a worldMap vanishes only when its imaginary label
    does. So `{L_c : c ∈ ImO}` is a faithful embedded copy of the fundamental 7 inside `End(O ℚ)`,
    on which the spinor spin generator acts. -/
theorem leftReg_injective : Function.Injective (leftReg) := by
  rw [injective_iff_map_eq_zero]
  intro a ha
  have hval := congrArg (fun (f : Module.End ℚ (O ℚ)) => f 1) ha
  simp only [leftReg_apply, mul_one, LinearMap.zero_apply] at hval
  exact Subtype.ext hval

/-! ## (D) THE BRIDGE: the spinor spin generator acts on the faithful frame as the vector rotation. -/

/-- ⭐⭐⭐ THE BRIDGE — the spinor spin generator's ad-action on the faithful "gamma" frame `leftReg c`
    is `leftReg` of a gauge-`so(7)` rotation `4 • elemRot a b` of the vector 7:
      `spinGen a b * leftReg c − leftReg c * spinGen a b = leftReg ((4:ℚ) • elemRot a b c)`.
    This IS the classical isomorphism "bivectors `≅ so(V)` acting on vectors", but with NO external
    Clifford apparatus — it is the banked N262 `spinGen_act` re-expressed through `leftReg`'s
    linearity and `elemRot`. Composed with `leftReg_injective`, it identifies the spinor spin
    generator's vector action with the elementary gauge rotation `elemRot a b ∈` the banked `so(7)`
    (`elemRot_skew`): the spinor face and the vector face are the SAME `so(7)`. -/
theorem spinGen_vector_action (a b c : ImO) :
    spinGen a b * leftReg c - leftReg c * spinGen a b
      = leftReg ((4 : ℚ) • elemRot a b c) := by
  rw [spinGen_act a b c]
  simp only [elemRot_apply, smul_sub, smul_smul, map_sub, map_smul]

/-! ## (E) SAME `so(V)` STRUCTURE: `elemRot` closes as `spinGen` does. -/

set_option linter.unusedSimpArgs false in
/-- ⭐⭐ THE `so(V)` STRUCTURE RELATION FOR THE VECTOR FACE — `elemRot` closes by the SAME structure
    relation N262 proved for the spinor spin generators (`spinGen_bracket`), up to the Clifford scale
    `4`:
      `[elemRot a b, elemRot c d] = gForm(a,c)•elemRot b d − gForm(b,c)•elemRot a d
                                     − gForm(a,d)•elemRot b c + gForm(b,d)•elemRot a c`.
    Both faces carry the identical `so(V)` Lie structure — the final confirmation that they are ONE
    algebra in two representations. -/
theorem elemRot_bracket (a b c d : ImO) :
    elemRot a b * elemRot c d - elemRot c d * elemRot a b
      = (gForm (a : O ℚ) (c : O ℚ)) • elemRot b d
        - (gForm (b : O ℚ) (c : O ℚ)) • elemRot a d
        - (gForm (a : O ℚ) (d : O ℚ)) • elemRot b c
        + (gForm (b : O ℚ) (d : O ℚ)) • elemRot a c := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.add_apply,
    LinearMap.smul_apply, elemRot_apply, map_sub, map_smul, gForm_add_right, gForm_smul_right,
    Submodule.coe_sub, SetLike.val_smul, gForm_neg_right, gForm_smul_left, gForm_add_left]
  rw [gForm_symm (d : O ℚ) (b : O ℚ), gForm_symm (d : O ℚ) (a : O ℚ)]
  rw [gForm_symm (c : O ℚ) (b : O ℚ), gForm_symm (c : O ℚ) (a : O ℚ)]
  module

/-! ## (F) W8 non-vacuity: a frame vector rotation genuinely rotates. -/

/-- ⭐⭐ W8 NON-VACUITY — for `i ≠ j`, the frame vector rotation is NONZERO:
    `elemRot ⟨imBasis i, _⟩ ⟨imBasis j, _⟩ ≠ 0`. Applied to the frame vector `e_j`, it returns
    `g(e_i,e_j)•e_j − g(e_j,e_j)•e_i = −e_i` (orthonormal frame `gForm_imBasis`, N257), and
    `e_i ≠ 0`. So the identification is not a vacuous `∀`-triviality: a frame vector rotation genuinely
    moves a frame vector. -/
theorem elemRot_frame_ne_zero {i j : Fin 7} (hij : i ≠ j) :
    elemRot ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩ ≠ 0 := by
  intro h0
  have hval := congrArg (fun (f : Module.End ℚ ImO) => f ⟨imBasis j, imBasis_mem_ImO j⟩) h0
  simp only [elemRot_apply, LinearMap.zero_apply] at hval
  rw [gForm_imBasis i j, gForm_imBasis j j, if_neg hij, if_pos rfl] at hval
  simp only [zero_smul, one_smul, zero_sub, neg_eq_zero] at hval
  have hei : imBasis i = (0 : O ℚ) := congrArg Subtype.val hval
  have hg := gForm_imBasis i i
  rw [if_pos rfl, hei] at hg
  rw [gForm] at hg
  simp only [star_zero, mul_zero] at hg
  rw [show reQ (0 : O ℚ) = 0 by simp [reQ]] at hg
  norm_num at hg

/-! ## (G) Capstone — the two faces of `so(7)` are one. -/

/-- ⭐⭐⭐ CAPSTONE — THE TWO FACES OF `so(7)` ARE ONE. Bundles the identification asserted in the
    N262 docstring and `docs/CONSTELLATION.md`, now PROVED:
      (1) THE VECTOR FACE lives in the banked gauge `so(7)`: `elemRot a b ∈ skewAdjointLieSubalgebra
          bornBil` (`elemRot_skew`, N225 gauge `so(7)`);
      (2) THE FRAME IS FAITHFUL: `leftReg` is injective (`leftReg_injective`), so `{L_c}` is a faithful
          copy of the vector 7;
      (3) THE BRIDGE: the spinor spin generator's ad-action on the faithful frame IS `leftReg` of that
          gauge rotation `4 • elemRot a b` (`spinGen_vector_action`) — the spinor face acting through
          the vector face;
      (4) SAME `so(V)` CLOSURE: `elemRot` obeys the identical structure relation as `spinGen`
          (`elemRot_bracket`);
      (5) NON-VACUITY: the frame vector rotation is genuinely nonzero (`elemRot_frame_ne_zero`).
    The gauge symmetry (acting on the vector 7, N225–N260) and the matter-rotation symmetry (acting on
    the spinor 8, N262) are ONE `so(7)` in its two natural representations — the deepest joint on the
    ★1↔★3 seam, no external Clifford apparatus. -/
theorem two_faces_of_so7 :
    (∀ a b : ImO, elemRot a b ∈ skewAdjointLieSubalgebra bornBil) ∧
    Function.Injective (leftReg) ∧
    (∀ a b c : ImO,
      spinGen a b * leftReg c - leftReg c * spinGen a b
        = leftReg ((4 : ℚ) • elemRot a b c)) ∧
    (∀ a b c d : ImO,
      elemRot a b * elemRot c d - elemRot c d * elemRot a b
        = (gForm (a : O ℚ) (c : O ℚ)) • elemRot b d
          - (gForm (b : O ℚ) (c : O ℚ)) • elemRot a d
          - (gForm (a : O ℚ) (d : O ℚ)) • elemRot b c
          + (gForm (b : O ℚ) (d : O ℚ)) • elemRot a c) ∧
    (∀ {i j : Fin 7}, i ≠ j →
      elemRot ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩ ≠ 0) :=
  ⟨elemRot_skew, leftReg_injective, spinGen_vector_action, elemRot_bracket,
    fun hij => elemRot_frame_ne_zero hij⟩

end

end Phys.Algebra
