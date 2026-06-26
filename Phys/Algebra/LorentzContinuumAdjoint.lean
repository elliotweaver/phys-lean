/-
  Phys.Algebra.LorentzContinuumAdjoint — N59: THE OPERATOR FORM-ADJOINT w.r.t. the positive-
  definite Euclidean reference form `EvC` (N58) — lifting the N58 INFINITESIMAL `IsEvCSymm`/
  `IsEvCSkew` split to the OPERATOR (group-level) adjoint, with the form-adjoint composite `g*∘g`
  proved EvC-SELF-ADJOINT and EvC-POSITIVE-SEMIDEFINITE — the trunk-positivity heart of the
  polar/KAK `g = k·exp(p)` reverse direction.
  ===========================================================================
  THE NEXT FORCED NODE after the infinitesimal-Cartan-decomposition node (N58). N49–N58 banked,
  over the derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`:
    • the continuum Born form `QvC = t² − x² − gFormC v v`, the isometry monoid `qvIsomMonoidC`
      (N49), the Born composition law `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + the polarized Minkowski form `BvC` + the
      infinitesimal boost `boostGenC` and rotation `rotGenC a` generators + the polarized SKEW
      identity `gFormC_skew` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` (N52–N55);
    • the BORN POSITIVITY foundation `gFormC_nonneg`/`gFormC_eq_zero_iff` + the (1,9) signature
      split (N56);
    • the POSITIVE-DEFINITE scalar square root `cutSqrt` over `Cut` (N57);
    • the INFINITESIMAL CARTAN DECOMPOSITION — the positive-definite Euclidean reference form `EvC`,
      `EvC_nonneg`/`EvC_eq_zero_iff`, and the compact/noncompact (`EvC`-skew / `EvC`-symmetric)
      split of the tangent generators (N58).

  ── THE TARGET (N59) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the GLOBAL reverse KAK surjectivity at the OPERATOR level —
  `qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`, that EVERY orientation/time-
  preserving continuum isometry IS a finite product of the banked generators, via the polar/KAK
  `g = k·exp(p)`. That global theorem is a genuine MULTI-NODE arc: it requires (besides the N58
  infinitesimal split) the OPERATOR form-adjoint `g*`, `g*∘g` self-adjoint + positive-semidefinite,
  the OPERATOR square root over the 10-dim form space (the operator analogue of N57 `cutSqrt` — no
  Mathlib spectral theory over `Cut`), the compact part `k` via CONNECTEDNESS (no Mathlib topology
  of `SO⁺(1,9)` over `Cut`), and the full `Spin(9)→SO(9)` exhaustion. None of the last three is
  bankable in one run. So — the W3 pattern the ROADMAP §N59 anticipates — the global reverse
  surjectivity is childed (N60) and THIS node banks the immediately-available, theory-native
  STRUCTURAL piece: the OPERATOR FORM-ADJOINT and the self-adjointness + positive-semidefiniteness
  of `g*∘g`, the operator-level lift of the N58 infinitesimal Cartan split.

  ── THE TRUNK REFRAME (THE ONE LAW): `g*g ⪰ 0` IS the Born positivity at operator level ──
  The polar/KAK `g = k·exp(p)` extracts the positive part `exp(p) = √(g*g)`. For that square root
  to exist (positive-semidefinite ⟹ has a positive root, the operator analogue of N57 `cutSqrt`),
  the composite `g*∘g` must be EvC-SELF-ADJOINT and EvC-POSITIVE-SEMIDEFINITE. Both DISSOLVE through
  the trunk: relative to the positive-definite reference form `EvC` (N58), define `h` to be the
  EvC-ADJOINT of `g` (`∀ p q, EvC (g p) q = EvC p (h q)`). Then `h∘g` is EvC-symmetric by a
  two-step adjunction (`EvC ((h∘g) p) q = EvC p ((h∘g) q)`), and — the heart — its diagonal value
  is `EvC ((h∘g) p) p = EvC (g p)(g p) ≥ 0` by N58 `EvC_nonneg`, which is itself the N56 Born
  self-overlap positivity (`gFormC_nonneg`) plus two coordinate squares. The operator-level
  positivity the polar boost part rests on is LITERALLY the trunk's "Born = self-overlap =
  positivity," read through the reference form. NO Mathlib spectral theory, NO posited adjoint, NO
  analysis.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    EvC_neg_right       — `EvC` is odd in the right slot (`EvC p (−q) = − EvC p q`), the bilinearity
                          fact the skew-adjoint rotation needs.
    IsEvCAdjoint        — THE OPERATOR FORM-ADJOINT relation `IsEvCAdjoint g h := ∀ p q,
                          EvC (g p) q = EvC p (h q)` — `h` is the EvC-adjoint of `g`.
    IsEvCAdjoint.symm   — adjunction is symmetric (`h` adjoint of `g` ⟹ `g` adjoint of `h`), by the
                          symmetry of `EvC`.
    IsEvCAdjoint.comp_isEvCSymm — ★★ `h∘g` (the form-adjoint composite `g*g`) is EvC-SYMMETRIC
                          (self-adjoint), by two adjunction steps.
    IsEvCAdjoint.comp_nonneg — ★★ `0 ≤ EvC ((h∘g) p) p` — `g*g` is EvC-POSITIVE-SEMIDEFINITE,
                          reducing to `EvC (g p)(g p) ≥ 0` via N58 `EvC_nonneg` (THE TRUNK
                          POSITIVITY at the operator level — the existence-of-the-positive-root
                          hypothesis the polar boost part needs).
    boostGenC_self_adjoint — the infinitesimal boost is its own EvC-adjoint (it IS EvC-symmetric,
                          N58 `boostGenC_EvC_symm`) — the noncompact/self-adjoint generator.
    boostGenC_comp_symm / boostGenC_comp_nonneg — `boostGenC∘boostGenC` is self-adjoint + nonneg.
    boostGenC_comp_pos_witness — ★ NON-VACUITY (W8): a concrete STRICTLY positive value
                          `EvC ((boostGenC∘boostGenC)(3,0,0))(3,0,0) = 9` — the composite is not the
                          trivial zero operator.
    rotGenC_adjoint     — ★★ for imaginary `a` (`gFormC a 1 = 0`), `−rotGenC a` is the EvC-adjoint
                          of `rotGenC a` (SKEW-adjoint, `g* = −g`, via N58 `rotGenC_EvC_skew` +
                          `EvC_neg_right`) — the compact generator's operator adjoint.
    rotGenC_comp_symm / rotGenC_comp_nonneg — `(−rotGenC a)∘(rotGenC a)` is self-adjoint + nonneg.
    rotGenC_e2_not_EvC_symm — ★ NON-VACUITY (W8 teeth): `rotGenC e₂` is NOT EvC-symmetric — the
                          compact rotation is genuinely SKEW-adjoint (`g* = −g ≠ g`), the operator
                          analogue of N58 `boostGenC_not_EvC_skew`; the self-adjoint (noncompact)
                          and skew-adjoint (compact) parts are genuinely DISTINCT.

  ── THE W1 HEAVY REMAINDER (childed N60, an honest dissolution ticket, NOT closed here) ──
  The global reverse surjectivity — `qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`,
  via the OPERATOR-level polar/KAK `g = k·exp(p)` — still needs the OPERATOR square root over the
  10-dim form space (a positive-definite self-adjoint operator's positive root, lifting the scalar
  `cutSqrt`), the polar assembly `g = k·exp(p)`, the compact part `k` via CONNECTEDNESS, and the
  full `Spin(9)→SO(9)` exhaustion (every spacelike rotation a finite product of `biMulFun`). That
  global Lie-group machinery has no Mathlib analogue over `Cut`; it is the genuine HEAVY core,
  childed onto the chain tail as an honest W1 dissolution ticket. THIS node banks the operator
  form-adjoint and the self-adjointness + positive-semidefiniteness of `g*g` — the structural lift
  of the N58 infinitesimal split and the operator-level positivity the square root will consume.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That the polar decomposition of a connected
  Lie-group element extracts a positive-definite self-adjoint `g*g` whose square root is the boost
  part is standard (Helgason, Knapp, the KAK/Cartan literature). Here the form-adjoint, the
  self-adjointness of `g*g`, and — the heart — its POSITIVE-SEMIDEFINITENESS DESCEND from the
  banked positive-definite reference form `EvC` (N58) and the continuum Born positivity
  `gFormC_nonneg`/`EvC_nonneg` (N56/N58) over the DERIVED ℝ `Cut` — NO posited adjoint, NO posited
  inner product, NO Mathlib spectral theory, NO Mathlib ℝ/ℂ as content. The W1 reframe (`g*g ⪰ 0`
  IS the trunk's Born positivity read through the reference form, dissolving the
  existence-of-the-positive-root hypothesis into ordered-field arithmetic) is exactly what lets the
  operator core of the polar direction re-ground over the continuum without any spectral theory.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / adjoint /
  self-adjoint / skew-adjoint / Cartan / KAK / polar / compact / noncompact / positive-
  semidefinite / Spin / SO(9) / isometry": what remains is the theorem that, over the derived
  complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for the symmetric positive-
  definite bilinear form `EvC` and `Cut`-linear self-maps `g, h` with `∀ p q, EvC (g p) q =
  EvC p (h q)`, the composite `h∘g` satisfies `EvC ((h∘g) p) q = EvC p ((h∘g) q)` and
  `0 ≤ EvC ((h∘g) p) p`; that `(t,x,v)↦(x,t,0)` is its own such partner with
  `EvC ((T∘T)(3,0,0))(3,0,0) = 9`; that for every `a` with `gFormC a 1 = 0`, `−(t,x,v)↦(0,0,a·v)`
  is the partner of `(t,x,v)↦(0,0,a·v)`; and that `(t,x,v)↦(0,0,e₂·v)` does NOT satisfy
  `EvC (T p) q = EvC p (T q)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited adjoint / inner product, NO Mathlib spectral theory.
-/
import Phys.Algebra.LorentzContinuumCartan

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The reference form is odd in the right slot. -/

/-- `EvC` is odd in the right slot: `EvC p (−q) = − EvC p q`. The bilinearity fact the
    skew-adjoint rotation generator needs. -/
theorem EvC_neg_right (p q : STVC) : EvC p (-q) = - EvC p q := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * (-t') + x * (-x') + gFormC v (-v') = -(t * t' + x * x' + gFormC v v')
  rw [show gFormC v (-v') = - gFormC v v' by
        rw [gFormC_symm v (-v'), gFormC_neg_left, gFormC_symm v' v]]
  ring

/-! ## The operator form-adjoint w.r.t. the positive-definite reference form `EvC`. -/

/-- ★ THE OPERATOR FORM-ADJOINT relation: `h` is the EvC-adjoint of `g` iff
    `∀ p q, EvC (g p) q = EvC p (h q)`. The group/operator-level lift of the N58 infinitesimal
    `IsEvCSymm`/`IsEvCSkew` split: a self-adjoint `g` (`g* = g`) is the noncompact part, a
    skew-adjoint `g` (`g* = −g`) the compact part. -/
def IsEvCAdjoint (g h : Module.End Cut STVC) : Prop := ∀ p q : STVC, EvC (g p) q = EvC p (h q)

/-- Adjunction is symmetric: if `h` is the EvC-adjoint of `g`, then `g` is the EvC-adjoint of `h`.
    By the symmetry of the reference form `EvC`. -/
theorem IsEvCAdjoint.symm {g h : Module.End Cut STVC} (H : IsEvCAdjoint g h) :
    IsEvCAdjoint h g := by
  intro p q
  rw [EvC_symm (h p) q, ← H q p, EvC_symm (g q) p]

/-- ★★ THE FORM-ADJOINT COMPOSITE `h∘g` (= `g*g`) IS EvC-SELF-ADJOINT: `EvC ((h∘g) p) q =
    EvC p ((h∘g) q)`. Two adjunction steps — `EvC ((h∘g) p) q = EvC (g p)(g q) = EvC p ((h∘g) q)`.
    The self-adjointness the polar positive part requires. -/
theorem IsEvCAdjoint.comp_isEvCSymm {g h : Module.End Cut STVC} (H : IsEvCAdjoint g h) :
    IsEvCSymm (h.comp g) := by
  intro p q
  rw [LinearMap.comp_apply, LinearMap.comp_apply]
  rw [H.symm (g p) q, H p (g q)]

/-- ★★ THE FORM-ADJOINT COMPOSITE `h∘g` (= `g*g`) IS EvC-POSITIVE-SEMIDEFINITE:
    `0 ≤ EvC ((h∘g) p) p`. Reduces, by one adjunction step, to `EvC (g p)(g p) ≥ 0`, which is N58
    `EvC_nonneg` — the trunk's Born = self-overlap = positivity (N56 `gFormC_nonneg`) read through
    the positive-definite reference form. THE TRUNK POSITIVITY at the operator level: exactly the
    existence-of-the-positive-root hypothesis the polar/KAK boost part `exp(p) = √(g*g)` consumes. -/
theorem IsEvCAdjoint.comp_nonneg {g h : Module.End Cut STVC} (H : IsEvCAdjoint g h) (p : STVC) :
    0 ≤ EvC ((h.comp g) p) p := by
  rw [LinearMap.comp_apply, H.symm (g p) p]
  exact EvC_nonneg (g p)

/-! ## The boost (noncompact / self-adjoint) generator's operator adjoint. -/

/-- The infinitesimal boost is its OWN EvC-adjoint — it is EvC-symmetric (N58
    `boostGenC_EvC_symm`), `g* = g`, the noncompact/self-adjoint generator of the Cartan split. -/
theorem boostGenC_self_adjoint : IsEvCAdjoint boostGenC boostGenC := boostGenC_EvC_symm

/-- `boostGenC∘boostGenC` (= `g*g` for the self-adjoint boost) is EvC-self-adjoint. -/
theorem boostGenC_comp_symm : IsEvCSymm (boostGenC.comp boostGenC) :=
  boostGenC_self_adjoint.comp_isEvCSymm

/-- `boostGenC∘boostGenC` is EvC-positive-semidefinite. -/
theorem boostGenC_comp_nonneg (p : STVC) : 0 ≤ EvC ((boostGenC.comp boostGenC) p) p :=
  boostGenC_self_adjoint.comp_nonneg p

/-- ★ NON-VACUITY (W8): the form-adjoint composite is STRICTLY positive on a concrete vector —
    `EvC ((boostGenC∘boostGenC)(3,0,0))(3,0,0) = 9`. So `g*g` is not the trivial zero operator;
    the positive-semidefiniteness has genuine content. -/
theorem boostGenC_comp_pos_witness :
    EvC ((boostGenC.comp boostGenC) ((3 : Cut), (0 : Cut), (0 : O Cut)))
        ((3 : Cut), (0 : Cut), (0 : O Cut)) = 9 := by
  rw [LinearMap.comp_apply]
  show EvC (boostGenC (boostGenC ((3:Cut),(0:Cut),(0:O Cut)))) ((3:Cut),(0:Cut),(0:O Cut)) = 9
  simp only [boostGenC, LinearMap.coe_mk, AddHom.coe_mk, EvC,
    show gFormC (0 : O Cut) 0 = 0 from gFormC_zero_left 0]
  norm_num

/-! ## The rotation (compact / skew-adjoint) generator's operator adjoint. -/

/-- ★★ THE COMPACT GENERATOR'S OPERATOR ADJOINT: for IMAGINARY `a` (`gFormC a 1 = 0`), `−rotGenC a`
    is the EvC-adjoint of `rotGenC a` — the rotation is SKEW-adjoint (`g* = −g`), via N58
    `rotGenC_EvC_skew` (the polarized Born skew identity) + `EvC_neg_right`. The operator-level lift
    of the N58 infinitesimal EvC-skewness. -/
theorem rotGenC_adjoint {a : O Cut} (ha : gFormC a 1 = 0) :
    IsEvCAdjoint (rotGenC a) (-rotGenC a) := by
  intro p q
  have hsk := rotGenC_EvC_skew ha p q
  rw [show ((-rotGenC a) : Module.End Cut STVC) q = -(rotGenC a q) from LinearMap.neg_apply _ _,
    EvC_neg_right]
  linarith [hsk]

/-- `(−rotGenC a)∘(rotGenC a)` (= `g*g` for the skew-adjoint rotation) is EvC-self-adjoint. -/
theorem rotGenC_comp_symm {a : O Cut} (ha : gFormC a 1 = 0) :
    IsEvCSymm (((-rotGenC a)).comp (rotGenC a)) :=
  (rotGenC_adjoint ha).comp_isEvCSymm

/-- `(−rotGenC a)∘(rotGenC a)` is EvC-positive-semidefinite. -/
theorem rotGenC_comp_nonneg {a : O Cut} (ha : gFormC a 1 = 0) (p : STVC) :
    0 ≤ EvC ((((-rotGenC a)).comp (rotGenC a)) p) p :=
  (rotGenC_adjoint ha).comp_nonneg p

/-- ★ NON-VACUITY (W8 teeth): the imaginary rotation `rotGenC e₂` is NOT EvC-symmetric — it is
    genuinely SKEW-adjoint (`g* = −g ≠ g`), the operator analogue of N58 `boostGenC_not_EvC_skew`.
    The self-adjoint (noncompact, boost) and skew-adjoint (compact, rotation) parts of the operator
    Cartan split are genuinely DISTINCT. Read at `p=(0,0,1)`, `q=(0,0,e₂)`:
    `EvC (T p) q = gFormC (e₂·1) e₂ = gFormC e₂ e₂ = 1`, while `EvC p (T q) = gFormC 1 (e₂·e₂) =
    gFormC 1 (−1) = −1`, so EvC-symmetry would force `1 = −1`. -/
theorem rotGenC_e2_not_EvC_symm : ¬ IsEvCSymm (rotGenC (CD.e2 : O Cut)) := by
  intro h
  have hw := h ((0:Cut), (0:Cut), (1 : O Cut)) ((0:Cut), (0:Cut), (CD.e2 : O Cut))
  simp only [rotGenC, LinearMap.coe_mk, AddHom.coe_mk, EvC] at hw
  rw [mul_one] at hw
  have he2sq : (CD.e2 : O Cut) * (CD.e2 : O Cut) = -1 := by
    have := e2_alt (1 : O Cut); rw [mul_one] at this; exact this
  rw [he2sq, e2_gFormC_self] at hw
  rw [show gFormC (1 : O Cut) (-1) = -1 by
        rw [gFormC_symm 1 (-1 : O Cut), gFormC_neg_left, gFormC_symm 1 1, gFormC_one]] at hw
  norm_num at hw

end

end Phys.Algebra
