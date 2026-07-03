/-
# N262 — THE SPIN GENERATORS: the antisymmetric worldMap part rotates the vectors (so(7))

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)`, imaginary part `ImO`. N261 mined the SYMMETRIC
half of the gather worldMap composition — `L_a∘L_b + L_b∘L_a = -(2·gForm a b)·id`, the CLIFFORD
relation, so `O ℚ` is a spinor. THIS node mines the OTHER half: the ANTISYMMETRIC part

    `spinGen a b := leftReg a * leftReg b - leftReg b * leftReg a`   (= [L_a, L_b])

which is exactly the gather GLUING OBSTRUCTION (N219 associator: distinct fold-generated inner
worlds glue iff this commutator-type obstruction vanishes; on `O ℚ` the worlds FAIL to glue). We
prove that this obstruction IS the SPIN GENERATOR of the spinor:

  ⭐⭐⭐ `spinGen_act` — it acts on the generator space `{L_c : c ∈ ImO} ≅ ImO` (the fundamental 7)
       as the elementary rotation in the `(a,b)` plane:
         `[spinGen a b, leftReg c] = (4·gForm a c)•leftReg b − (4·gForm b c)•leftReg a`.
  ⭐⭐⭐ `spinGen_bracket` — the generators CLOSE into a Lie algebra: the commutator of two spin
       generators is again a combination of spin generators (the `so(7)` structure relation)
         `[S_ab, S_cd] = 4gForm(a,c)•S_bd − 4gForm(b,c)•S_ad − 4gForm(a,d)•S_bc + 4gForm(b,d)•S_ac`.

THE DISSOLUTION (STANDARD §0). The field IMPORTS an external Clifford algebra `Cl(V,q)`, isolates
the bivector Lie subalgebra `Λ²V`, proves it `≅ so(V)` and acts on the spinor module — a multi-step
import, with octonion non-associativity treated as an OBSTACLE to a clean Clifford structure. The
theory INVERTS + DISSOLVES it: no external algebra is built. The "gamma matrices" ARE the fold's own
worldMap `L_a` (N44/N218T); the "bivectors" ARE the antisymmetric part of their composition = the
gather gluing obstruction (N219); "bivectors rotate vectors" is the ONE identity `spinGen_act`, and
"bivectors close into `so(n)`" is `spinGen_bracket` — both closed by `noncomm_ring` over the banked
Clifford anticommutators (`cliff_mul`, from N261's `leftReg_clifford`) and `module`. NO octonion
coordinate bash. ONE CAUSE MANY TERMINATIONS: the SAME octonion alternativity that (via
left-alternativity `mul_mul_left`, N5b) forces the Clifford relation (N261) makes the antisymmetric
part a genuine rotation generator. The obstruction to gluing worlds is not a defect — it IS the
rotational symmetry acting on matter. And this `so(7)` is the SAME `so(7)` the gather TEAR built for
gauge (`skewAdjointLieSubalgebra bornBil = 14 ⊕ 7`, N225–N260): one `so(7)`, two faces — the gauge
tear and the spinor rotation.

THE OBJECTS (all derived, foundations-only):
  ⭐   `cliff_mul`               — the `*`/`1` form of N261's `leftReg_clifford`.
  ⭐⭐  `spinGen`                — the antisymmetric worldMap part `[L_a, L_b]` (= the obstruction).
  ⭐⭐  `spinGen_antisymm`/`spinGen_self` — antisymmetry and `spinGen a a = 0`.
  ⭐⭐⭐ `spinGen_act`            — the rotation of the generators (the fundamental 7).
  ⭐⭐⭐ `spinGen_bracket`        — the `so(7)` closure of the spin generators.
  ⭐⭐  `leftReg_frame_ne_zero`  — a frame worldMap `L_(imBasis j)` is nonzero (`L 1 = imBasis j ≠ 0`).
  ⭐⭐  `spinGen_frame_ne_zero`  — W8: `i ≠ j ⟹ spinGen (imBasis i) (imBasis j) ≠ 0` (genuine rotation,
        not a vacuous `∀`-triviality — a frame generator moves a third frame vector).
  ⭐⭐⭐ `worldMap_spin_generators` — capstone: the rotation action + the `so(7)` closure + non-vacuity.

⚠ FREE-FLOATING check (SOUL rail): every headline TYPE mentions the banked tower objects — the
banked `leftReg` (N261), the banked Born form `gForm` (N261/N257), the banked orthonormal frame
`imBasis` — on the derived `O ℚ`/`ImO`. `spinGen` is the CONCRETE antisymmetric part of the banked
worldMap composition, NOT a carrier-agnostic "bivectors of a Clifford module".
PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "spin / rotation / bivector / Dirac / matter / gauge /
so(7)" — the pure statement "for the banked `leftReg` on the derived `O ℚ`, the antisymmetric part of
composition acts on the generators as `[S_ab, L_c] = 4·gForm(a,c)·L_b − 4·gForm(b,c)·L_a`, its
commutators close into combinations of itself, and it is nonzero on an orthonormal frame pair" stands
as pure mathematics with every property proved.

⚠ SCOPE — HONESTY CLAUSE. Banks the spin generator + its rotation action + the `so(7)` closure +
non-vacuity ONLY. Does NOT claim the full `Cl(0,7)` algebra isomorphism, `Spin(7)`, or the
identification of `O` with a specific SM matter multiplet (all downstream). The weak MIXING ANGLE
remains a ≥9× NAMED deferred blocker (needs the ASCENT invariant tower — a separate route-finding
node), untouched here.

Everything is over ℚ (pure algebra — NO continuum, NO Mathlib ℝ/ℂ/Clifford as content). `LinearMap`/
`Module.End`/`*` (= comp) are MACHINERY on the DERIVED `O ℚ` (STANDARD §3). NO posited Clifford
algebra, NO bridge. Foundations-only: `[propext, Classical.choice, Quot.sound]`.
-/
import Phys.Algebra.TowerWorldMapCliffordModule

open scoped Classical BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-search budget bump (instance search only, NOT the proof kernel) — the banked
-- N255/N257/N258/N259/N260/N261 precedent for the End-of-O / octonion-tower instance diamonds.
set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-! ## (A) The Clifford anticommutation relation in `*`/`1` form. -/

/-- ★ The N261 Clifford relation `leftReg_clifford` restated with the `End`-ring multiplication `*`
    (= `.comp`) and unit `1` (= `id`), the convenient form for the ring manipulations below:
    `leftReg a * leftReg b + leftReg b * leftReg a = (-(2·gForm a b)) • 1`. -/
theorem cliff_mul (a b : ImO) :
    leftReg a * leftReg b + leftReg b * leftReg a
      = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • (1 : Module.End ℚ (O ℚ)) := by
  have h := leftReg_clifford a b
  simpa [Module.End.mul_eq_comp, Module.End.one_eq_id] using h

/-! ## (B) The spin generator = the antisymmetric part of the worldMap composition. -/

/-- ★★ THE SPIN GENERATOR: the ANTISYMMETRIC part of the gather worldMap composition,
    `spinGen a b := leftReg a * leftReg b - leftReg b * leftReg a` (= the commutator `[L_a, L_b]`).
    This is exactly the gather GLUING OBSTRUCTION (N219 associator: the worlds glue iff the
    antisymmetric part vanishes); on `O ℚ` it is nonzero (`spinGen_frame_ne_zero`). -/
def spinGen (a b : ImO) : Module.End ℚ (O ℚ) :=
  leftReg a * leftReg b - leftReg b * leftReg a

/-- ★★ ANTISYMMETRY of the spin generator: `spinGen a b = - spinGen b a`. -/
theorem spinGen_antisymm (a b : ImO) : spinGen a b = - spinGen b a := by
  unfold spinGen; abel

/-- ★★ The diagonal spin generator vanishes: `spinGen a a = 0`. -/
theorem spinGen_self (a : ImO) : spinGen a a = 0 := by
  unfold spinGen; abel

/-! ## (C) The spin generator rotates the Clifford generators (the fundamental 7). -/

/-- ★★★ THE CROWN — the spin generator acts on the generator space `{leftReg c : c ∈ ImO} ≅ ImO`
    (the fundamental 7) as the elementary rotation in the `(a,b)` plane:
      `[spinGen a b, leftReg c] = (4·gForm a c)•leftReg b − (4·gForm b c)•leftReg a`.
    Route: `noncomm_ring` expands the double commutator `[[L_a,L_b], L_c]` into the two
    anticommutators `{L_b,L_c}` and `{L_a,L_c}`, substitute `cliff_mul` (which are scalar multiples
    of `1`), close by `module`. NO octonion coordinate bash. This is the `so(V)`-on-`V` vector
    representation, read directly off the banked Clifford relation. -/
theorem spinGen_act (a b c : ImO) :
    spinGen a b * leftReg c - leftReg c * spinGen a b
      = (4 * gForm (a : O ℚ) (c : O ℚ)) • leftReg b
        - (4 * gForm (b : O ℚ) (c : O ℚ)) • leftReg a := by
  have hac := cliff_mul a c
  have hbc := cliff_mul b c
  set La := leftReg a
  set Lb := leftReg b
  set Lc := leftReg c
  unfold spinGen
  have key : (La * Lb - Lb * La) * Lc - Lc * (La * Lb - Lb * La)
      = La * (Lb * Lc + Lc * Lb) - (La * Lc + Lc * La) * Lb
        - (Lb * (La * Lc + Lc * La) - (Lb * Lc + Lc * Lb) * La) := by
    noncomm_ring
  rw [key, hbc, hac]
  simp only [smul_mul_assoc, mul_smul_comm, mul_one, one_mul]
  module

/-! ## (D) The spin generators close into a Lie algebra (the `so(7)` structure relation). -/

/-- ★★★ THE `so(7)` CLOSURE — the commutator of two spin generators is again a combination of spin
    generators (the antisymmetric worldMap parts form a Lie algebra, the `so(V)` structure relation):
      `[S_ab, S_cd] = 4gForm(a,c)•S_bd − 4gForm(b,c)•S_ad − 4gForm(a,d)•S_bc + 4gForm(b,d)•S_ac`.
    Route (THE ONE LAW / no coordinate bash): the derivation identity — expand `[[L_a,L_b], [L_c,L_d]]`
    via a `noncomm_ring` Leibniz split into `[[L_a,L_b], L_c]` and `[[L_a,L_b], L_d]` conjugated by
    `L_d`/`L_c`, substitute `spinGen_act` twice, close by `module`. The bivectors close on themselves
    because the spin generator acts on the generators as a rotation — the obstruction IS the algebra. -/
theorem spinGen_bracket (a b c d : ImO) :
    spinGen a b * spinGen c d - spinGen c d * spinGen a b
      = (4 * gForm (a : O ℚ) (c : O ℚ)) • spinGen b d
        - (4 * gForm (b : O ℚ) (c : O ℚ)) • spinGen a d
        - (4 * gForm (a : O ℚ) (d : O ℚ)) • spinGen b c
        + (4 * gForm (b : O ℚ) (d : O ℚ)) • spinGen a c := by
  have hc := spinGen_act a b c
  have hd := spinGen_act a b d
  simp only [spinGen] at hc hd ⊢
  set La := leftReg a
  set Lb := leftReg b
  set Lc := leftReg c
  set Ld := leftReg d
  have key : (La * Lb - Lb * La) * (Lc * Ld - Ld * Lc)
        - (Lc * Ld - Ld * Lc) * (La * Lb - Lb * La)
      = ((La * Lb - Lb * La) * Lc - Lc * (La * Lb - Lb * La)) * Ld
          - Ld * ((La * Lb - Lb * La) * Lc - Lc * (La * Lb - Lb * La))
        + Lc * ((La * Lb - Lb * La) * Ld - Ld * (La * Lb - Lb * La))
          - ((La * Lb - Lb * La) * Ld - Ld * (La * Lb - Lb * La)) * Lc := by
    noncomm_ring
  rw [key, hc, hd]
  simp only [smul_mul_assoc, mul_smul_comm, smul_sub, mul_sub, sub_mul]
  module

/-! ## (E) W8 non-vacuity teeth: a frame spin generator genuinely rotates. -/

/-- ★★ A frame worldMap is nonzero: `leftReg ⟨imBasis j, _⟩ ≠ 0` — it sends `1 ↦ imBasis j`, and
    `imBasis j ≠ 0` because the frame is `gForm`-orthonormal (`gForm (imBasis j) (imBasis j) = 1`,
    banked `gForm_imBasis`, N257). -/
theorem leftReg_frame_ne_zero (j : Fin 7) :
    leftReg ⟨imBasis j, imBasis_mem_ImO j⟩ ≠ 0 := by
  intro h0
  have hval := congrArg (fun (f : Module.End ℚ (O ℚ)) => f 1) h0
  simp only [leftReg_apply, mul_one, LinearMap.zero_apply] at hval
  have hg := gForm_imBasis j j
  rw [if_pos rfl, hval] at hg
  rw [gForm] at hg
  simp only [star_zero, mul_zero] at hg
  rw [show reQ (0 : O ℚ) = 0 by simp [reQ]] at hg
  norm_num at hg

/-- ★★ W8 NON-VACUITY: for `i ≠ j`, the frame spin generator is NONZERO —
    `spinGen ⟨imBasis i, _⟩ ⟨imBasis j, _⟩ ≠ 0`. If it were `0`, then by `spinGen_act` (at
    `c = imBasis i`, with the orthonormal `gForm (imBasis i) (imBasis i) = 1`,
    `gForm (imBasis j) (imBasis i) = 0`) we would get `4 • leftReg ⟨imBasis j, _⟩ = 0`, forcing the
    frame worldMap `leftReg ⟨imBasis j, _⟩ = 0`, contradicting `leftReg_frame_ne_zero`. So a frame
    spin generator GENUINELY rotates a third frame vector — the rotation action is not a vacuous
    `∀`-triviality. -/
theorem spinGen_frame_ne_zero {i j : Fin 7} (hij : i ≠ j) :
    spinGen ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩ ≠ 0 := by
  intro h
  have hact := spinGen_act ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩
                 ⟨imBasis i, imBasis_mem_ImO i⟩
  rw [h] at hact
  simp only [zero_mul, mul_zero, sub_zero] at hact
  rw [gForm_imBasis, gForm_imBasis, if_pos rfl, if_neg (Ne.symm hij)] at hact
  simp only [mul_one, mul_zero, zero_smul, sub_zero] at hact
  have h4 : (4 : ℚ) • leftReg ⟨imBasis j, imBasis_mem_ImO j⟩ = 0 := hact.symm
  have : leftReg ⟨imBasis j, imBasis_mem_ImO j⟩ = 0 := by
    rcases smul_eq_zero.mp h4 with h | h
    · norm_num at h
    · exact h
  exact leftReg_frame_ne_zero j this

/-! ## (F) The capstone. -/

/-- ★★★ THE CAPSTONE — the antisymmetric part of the gather worldMap composition (the gather gluing
    obstruction) is a SPIN GENERATOR: it acts on the Clifford generators (the fundamental 7) as the
    elementary `so(7)` rotation (`spinGen_act`), its commutators close into combinations of itself
    (the `so(7)` structure relation, `spinGen_bracket`), and it is nonzero on an orthonormal frame
    pair (`spinGen_frame_ne_zero` — non-vacuity). DERIVED from the gather worldMap, forced by
    octonion alternativity — not posited. The obstruction to gluing worlds IS the rotational symmetry
    acting on the spinor `O ℚ`. -/
theorem worldMap_spin_generators :
    (∀ a b c : ImO,
      spinGen a b * leftReg c - leftReg c * spinGen a b
        = (4 * gForm (a : O ℚ) (c : O ℚ)) • leftReg b
          - (4 * gForm (b : O ℚ) (c : O ℚ)) • leftReg a)
    ∧ (∀ a b c d : ImO,
      spinGen a b * spinGen c d - spinGen c d * spinGen a b
        = (4 * gForm (a : O ℚ) (c : O ℚ)) • spinGen b d
          - (4 * gForm (b : O ℚ) (c : O ℚ)) • spinGen a d
          - (4 * gForm (a : O ℚ) (d : O ℚ)) • spinGen b c
          + (4 * gForm (b : O ℚ) (d : O ℚ)) • spinGen a c)
    ∧ (∀ i j : Fin 7, i ≠ j →
      spinGen ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩ ≠ 0) :=
  ⟨spinGen_act, spinGen_bracket, fun _ _ hij => spinGen_frame_ne_zero hij⟩

end

end Phys.Algebra
