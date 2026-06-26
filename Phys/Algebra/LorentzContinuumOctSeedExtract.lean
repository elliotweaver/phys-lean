/-
  Phys.Algebra.LorentzContinuumOctSeedExtract — N72: THE CONSTRUCTED SEED EIGENPAIR EXTRACTION FROM
  AN OCTONION-COUPLING COORDINATE OPERATOR — the characteristic-equation / discriminant-radical route
  building the eigenvector for an operator that TOUCHES THE OCTONION BLOCK (escalating N65's
  (t,x)-only construction and N71's given-rational-eigenbasis firing), then FIRING the N70 deflation
  engine on the CONSTRUCTED seed. Over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the SEED EIGENPAIR EXTRACTION node (N71). N49–N71 banked, over the
  derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` + `EvC_symm`/`EvC_smul_*` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` + `comp_nonneg` (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + the scalar root (N60);
    • the 2-block / octonion-internal coordinate-diagonal operator square roots (N61–N62);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the rank-2 rotated-basis spectral operator `specOp`
      + `specOp_apply`/`specOp_op_sqrt`/`specOp_read₁`/`specOp_read₂` (N63);
    • ★ the GENERAL/EQUAL/FULL-UNEQUAL-diagonal `(t,x)`-plane eigenbasis `txOp` — the CROWN
      `txOp_eq_specOp_rot` constructing the eigenbasis from the discriminant radical `R = cutSqrt(δ²+b²)`
      via `rotA`/`rotB`/`rotEig_normalized` (N64–N65);
    • the FIRST concrete polar factorization `g = k·exp(p)` (N66);
    • the FIRST 10-dim-MIXING spectral square root + the RANK-3 spectral operator `specOp3` (N67);
    • ★ the GENERAL RANK-`n` spectral operator `specOpN` + `specOpN_op_sqrt`/`specOpN_read` (N68);
    • ★ the CONCRETE EIGENBASIS-EXISTENCE WITNESS `txMix = specOpN ![9,4,25] mix3` (N69);
    • ★ the DEFLATION / PEEL-OFF ENGINE `deflateC g l u := g − l • projC u` with `deflateC_eigen_kills`
      (kills a UNIT eigenpair), `deflateC_image_orth` (the recursion enabler) (N70);
    • ★ the SEED EIGENPAIR EXTRACTION — the genuine VECTOR eigen-equation `specOpN_eigen`, the concrete
      VECTOR eigenpairs of `txMix` over its GIVEN rational eigenbasis, and the FIRST NON-VACUOUS firing
      of the deflation engine on a concrete operator (`txMix_deflate_*`) (N71).

  ── THE TARGET (N72) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the FULL n-dim spectral EXISTENCE for an
  ARBITRARY operator with NO given eigenbasis (the characteristic-equation / fixed-point seed
  extraction at general dimension), the full deflation induction to general `n`, the GLOBAL polar/KAK
  assembly, CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and the full `Spin(9)→SO(9)`
  exhaustion. MEASURE-FIRST (ROADMAP §N72 priority (i)) confirms: producing the seed eigenpair at
  GENERAL dimension, the Lie-group integration / topology of `SO⁺(1,9)`, and the octonionic spinor
  cover each need group-manifold machinery Mathlib lacks over `Cut` — the genuine HEAVY sub-nodes
  (childed N73).

  ── THE IMMEDIATELY-BANKABLE STRUCTURAL ESCALATION (ROADMAP §N72 priority (i)) ──
  N71 fired the deflation engine on `txMix`, a coordinate operator whose eigenbasis `{mixA,mixB,mixW3}`
  was a FIXED RATIONAL frame GIVEN in advance — the eigenvector was not CONSTRUCTED, it was handed
  over. N65's `txOp_eq_specOp_rot` constructs the eigenbasis from the discriminant radical
  `R = cutSqrt(δ²+b²)` but only for a `(t,x)`-plane operator `txOp` that LEAVES the octonion block
  fixed. The ROADMAP §N72 priority (i) names the exact lever: "extend that construction to an operator
  that ALSO touches the octonion block." This node does precisely that: it defines the coordinate
  symmetric operator `toMix a b d` that COUPLES the time axis to the octonion-real direction `1₍O₎`
  (the genuine 10-dim mixing, `toMix_octBlock`), CONSTRUCTS its EvC-orthonormal eigenbasis from the
  discriminant radical `R = cutSqrt(δ²+b²)` over the octonion-coupling rotation pair `omixA`/`omixB`
  (NO fixed eigenbasis — the eigenvectors ROTATE with the parameters through `cutSqrt`), proves the
  CROWN `toMix_eq_specOp_omix`, reads off the constructed VECTOR seed eigenpair `toMix u₊ = λ₊ • u₊`
  (`toMix_seed_eigen`), and FIRES the N70 deflation engine on that CONSTRUCTED seed
  (`toMix_deflate_kills_seed`/`toMix_deflate_image_orth`). The escalation over N71: the seed eigenpair
  is now CONSTRUCTED from the characteristic-equation discriminant of an operator NOT pre-identified
  with `specOpN`, for an operator that genuinely mixes the time and octonion sectors — exactly the
  "seed eigenpair EXTRACTION from a coordinate-given operator" the existence induction needs as its
  entry, on the hardest (octonion-coupling) block.

  ── THE TRUNK REFRAME (THE ONE LAW): the discriminant radical IS the banked scalar `cutSqrt` ──
  The classical eigenproblem for the symmetric `[[a,b],[b,d]]` block (here on the
  (time, octonion-real) 2-plane, NOT (t,x)) needs the discriminant radical `√((a−d)²+4b²)` — no
  Mathlib analogue over `Cut`. The trunk supplies it as the banked positive-definite scalar square
  root `cutSqrt` (N57). With `δ = (a−d)/2`, `R = cutSqrt(δ²+b²)`, the eigenvalues are `λ± = (a+d)/2 ± R`
  and the eigenvector directions `(b, ±(R−δ))` (in the (time, octonion-real) coordinates) have common
  positive squared EvC-norm `2R(R−δ)`; normalizing by `nrm = cutSqrt(2R(R−δ))` (the same
  `rotEig_normalized` lever banked in N65) gives the EvC-orthonormal eigenbasis. The octonion-real
  component `gFormC 1 v` enters the EvC reference form linearly (`gFormC_smul_left`/`_right`/`_symm`),
  so every eigenbasis/diagonalization identity closes by `ring`/`linear_combination` over the derived
  `Cut` exactly as N65 — NO Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    omixA c s / omixB c s — the octonion-coupling rotation eigenbasis pair `(c,0,s•1₍O₎)`,
                            `(−s,0,c•1₍O₎)` — parameter-dependent, COUPLING time to the octonion-real
                            unit `1₍O₎` (escalating N65's `(t,x)`-plane `rotA`/`rotB`).
    omixA_norm/omixB_norm/omixAB_orth — for `c²+s²=1` it is EvC-orthonormal (always EvC-orthogonal).
    toMix a b d           — ★ THE OCTONION-COUPLING COORDINATE OPERATOR: a symmetric `Cut`-linear map
                            written PURELY IN COORDINATES, coupling time ↔ octonion-real (shared
                            off-diagonal `b`), NOT presented as a sum of eigenprojections.
    toMix_isEvCSymm       — `toMix a b d` is EvC-self-adjoint for ALL `a,b,d` (via `gFormC_symm`).
    toMix_octBlock        — ★ THE GENUINE COUPLING: `toMix` sends the pure-time unit into the octonion
                            block (`b•1₍O₎`) — impossible for any block-separated operator.
    specOp_omix_eq_toMix  — ★★ THE FORWARD DECOMPOSITION: the rotated-basis spectral operator over the
                            octonion-coupling eigenbasis IS a `toMix` (the whole parametrized family).
    specOp_eigen₁/_eigen₂ — the rank-2 VECTOR eigen-equation `specOp l₁ l₂ u₁ u₂ u₁ = l₁ • u₁` (the
                            seed the N70 deflation engine consumes), from orthonormality.
    toMix_eq_specOp_omix  — ★★ THE CROWN — THE CONSTRUCTED OCTONION-COUPLING EIGENBASIS EXISTENCE: for
                            EVERY `a,b,d` with `b ≠ 0`, `toMix a b d` is diagonalized by the
                            EvC-orthonormal eigenbasis built from the discriminant radical
                            `R = cutSqrt(δ²+b²)` — the eigenvectors ROTATE with the parameters, NO fixed
                            eigenbasis, for an operator TOUCHING the octonion block (the octonion-sector
                            analogue of N65's `(t,x)`-plane crown).
    toMix_op_sqrt_gen     — ★★ THE GENERAL OPERATOR SQUARE ROOT via the constructed octonion-coupling
                            eigenbasis (N63 `specOp_op_sqrt` through the crown).
    toMix_seed_eigen      — ★★ THE CONSTRUCTED SEED EIGENPAIR IN VECTOR FORM: `toMix a b d u₊ = λ₊ • u₊`
                            with `u₊` CONSTRUCTED from the discriminant radical — the seed the deflation
                            engine consumes, now EXTRACTED (not given) from a coordinate operator.
    toMix_deflate_kills_seed — ★★ N70 `deflateC_eigen_kills` FIRES on the CONSTRUCTED seed: `deflateC
                            (toMix a b d) λ₊ u₊ u₊ = 0` for the constructed `u₊`.
    toMix_deflate_image_orth — ★★ N70 `deflateC_image_orth` FIRES on the CONSTRUCTED seed: the deflated
                            operator's image is EvC-orthogonal to the constructed `u₊` — the
                            EvC-orthogonal complement is INVARIANT, the inductive descent realized on a
                            CONSTRUCTED eigenbasis (escalating N71's given-eigenbasis firing).
    toMix_73_36_52_diag/_seed_eigen/_deflate_kills/_witness/_read_seed — NON-VACUITY (W8): a concrete
                            octonion-coupling member `toMix 73 36 52` (off-diagonal `36 ≠ 0`) over the
                            constructed rational eigenbasis `omixA (4/5)(3/5)` (eigenvalues `100,25`),
                            its constructed seed eigenpair, the deflation firing, and the positive
                            operator square root `specOp 10 5`.

  ── THE W1 HEAVY REMAINDER (childed N73, an honest dissolution ticket, NOT closed here) ──
  Producing the seed eigenpair at GENERAL dimension `n` (the characteristic-equation route beyond a
  single 2×2 block) + assembling the full deflation induction over `deflateC` to general `n`
  (existence) + the GLOBAL polar/KAK assembly for an arbitrary `g` + the compact part via CONNECTEDNESS
  + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion are the genuine HEAVY
  group-manifold core, childed onto the chain tail. THIS node banks the CONSTRUCTED seed eigenpair from
  an octonion-COUPLING coordinate operator and FIRES the deflation engine on the constructed seed — the
  hardest-block escalation of N71's given-eigenbasis firing toward the full existence entry.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a 2×2 symmetric block is diagonalized by an
  orthogonal rotation with eigenvalues `(a+d)/2 ± √(((a−d)/2)²+b²)`, and that deflation peels an
  eigenpair, is standard linear algebra. Here the octonion-coupling operator, the constructed
  parameter-dependent rotating eigenbasis (its amplitude the trunk discriminant radical `cutSqrt`), the
  eigendecomposition, the constructed vector seed eigenpair, and the non-vacuous firing of the
  deflation engine on that constructed seed DESCEND from the banked scalar `cutSqrt` (N57) + the
  reference form `EvC` (N58, itself the Born self-overlap positivity N56) + the N63 spectral machinery
  (`specOp`/`specOp_op_sqrt`/`specOp_read₁`) + the N65 normalization lever `rotEig_normalized` + the N70
  deflation engine (`deflateC`/`deflateC_eigen_kills`/`deflateC_image_orth`) over the DERIVED ℝ `Cut`
  and `O Cut` — NO posited operator calculus, NO Mathlib spectral theory, NO posited inner product, NO
  Mathlib ℝ/ℂ as content. `Module.End`, `LinearMap`, `gFormC` bilinearity are standard Mathlib
  MACHINERY operating on the DERIVED objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenvector / eigenpair / eigenbasis / eigen-equation / deflation /
  peel-off / diagonal / orthonormal / self-adjoint / positive-semidefinite / isometry / Spin / SO(9) /
  KAK / polar / Cartan / invariant / mixing / coupling / discriminant / seed / extraction / descent":
  what remains is the theorem that, over the derived complete ordered field `Cut` and the
  Cayley–Dickson double³ `O Cut`, for the symmetric bilinear form `EvC`, the `Cut`-linear map
  `toMix a b d := (t,x,v) ↦ (a·t + b·gFormC 1 v, 0, (b·t + d·gFormC 1 v)•1₍O₎)`, and the pair
  `omixA c s := (c,0,s•1₍O₎)`, `omixB c s := (−s,0,c•1₍O₎)`: for `c²+s²=1` `{omixA,omixB}` is
  EvC-orthonormal; `specOp l₁ l₂ (omixA c s)(omixB c s) = toMix (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)`; for
  `b ≠ 0`, with `R := cutSqrt(((a−d)/2)²+b²)` and `nrm := cutSqrt(2R(R−(a−d)/2))`,
  `toMix a b d = specOp ((a+d)/2+R)((a+d)/2−R) (omixA (b/nrm)((R−δ)/nrm))(omixB …)`,
  `toMix a b d (omixA (b/nrm)((R−δ)/nrm)) = ((a+d)/2+R) • omixA (b/nrm)((R−δ)/nrm)`, and the deflated
  map sends that vector to `0` with its image `EvC`-orthogonal to it; and concretely
  `toMix 73 36 52 = specOp 100 25 (omixA (4/5)(3/5))(omixB (4/5)(3/5))` with positive square root
  `specOp 10 5 …`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumEigenExtract

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-! ## The octonion-coupling rotation eigenbasis — parameter-dependent, COUPLING time to `1₍O₎`. -/

/-- The first octonion-coupling rotation eigenbasis vector `(c,0,s•1₍O₎)` — a parameter-DEPENDENT
    direction COUPLING the time component `c` to the octonion-real unit `s•1₍O₎` (escalating N65's
    `(t,x)`-plane `rotA c s := (c,s,0)`, which left the octonion block untouched). For a unit `(c,s)`
    it is an EvC-unit. -/
def omixA (c s : Cut) : STVC := (c, (0 : Cut), s • (1 : O Cut))

/-- The second octonion-coupling rotation eigenbasis vector `(−s,0,c•1₍O₎)` — EvC-orthogonal to
    `omixA c s` for ALL `c,s`, again coupling time to `1₍O₎`. -/
def omixB (c s : Cut) : STVC := (-s, (0 : Cut), c • (1 : O Cut))

/-- `omixA c s` is an EvC-unit when `c² + s² = 1`: `c² + s²·gFormC 1 1 = c² + s² = 1`. -/
theorem omixA_norm {c s : Cut} (h : c*c + s*s = 1) : EvC (omixA c s) (omixA c s) = 1 := by
  show c * c + (0:Cut) * 0 + gFormC (s • (1:O Cut)) (s • (1:O Cut)) = 1
  rw [gFormC_smul_left, gFormC_smul_right, gFormC_one]; linear_combination h

/-- `omixB c s` is an EvC-unit when `c² + s² = 1`. -/
theorem omixB_norm {c s : Cut} (h : c*c + s*s = 1) : EvC (omixB c s) (omixB c s) = 1 := by
  show (-s) * (-s) + (0:Cut) * 0 + gFormC (c • (1:O Cut)) (c • (1:O Cut)) = 1
  rw [gFormC_smul_left, gFormC_smul_right, gFormC_one]; linear_combination h

/-- `omixA c s` and `omixB c s` are EvC-orthogonal for ALL `c,s`: `c(−s) + sc·gFormC 1 1 = 0`. -/
theorem omixAB_orth (c s : Cut) : EvC (omixA c s) (omixB c s) = 0 := by
  show c * (-s) + (0:Cut) * 0 + gFormC (s • (1:O Cut)) (c • (1:O Cut)) = 0
  rw [gFormC_smul_left, gFormC_smul_right, gFormC_one]; ring

/-! ## The octonion-coupling coordinate operator. -/

/-- ★ THE OCTONION-COUPLING COORDINATE OPERATOR. With `r := gFormC 1 v` the octonion-real part of `v`,
    `toMix a b d (t,x,v) := (a·t + b·r, 0, (b·t + d·r)•1₍O₎)` — a symmetric `Cut`-linear map written
    PURELY IN COORDINATES (NO `projC`), genuinely coupling the time axis to the octonion-real
    direction `1₍O₎` (shared off-diagonal `b`). The "arbitrary operator" side of the existence lever
    on the HARDEST block (time ↔ octonion-real), escalating N65's `txOp` which mixed only `(t,x)`:
    it is NOT presented as a sum of scaled eigenprojections; that it equals one — over an eigenbasis
    CONSTRUCTED from the discriminant radical — is the content of the CROWN below. -/
def toMix (a b d : Cut) : Module.End Cut STVC where
  toFun p := (a * p.1 + b * gFormC 1 p.2.2, (0:Cut),
              (b * p.1 + d * gFormC 1 p.2.2) • (1 : O Cut))
  map_add' p q := by
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (t + t') + b * gFormC 1 (v + v')
         = (a * t + b * gFormC 1 v) + (a * t' + b * gFormC 1 v')
      rw [gFormC_add_right]; ring
    · simp
    · show (b * (t + t') + d * gFormC 1 (v + v')) • (1 : O Cut)
         = (b * t + d * gFormC 1 v) • (1 : O Cut) + (b * t' + d * gFormC 1 v') • (1 : O Cut)
      rw [gFormC_add_right, ← add_smul]; congr 1; ring
  map_smul' c p := by
    obtain ⟨t, x, v⟩ := p
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (c * t) + b * gFormC 1 (c • v) = c * (a * t + b * gFormC 1 v)
      rw [gFormC_smul_right]; ring
    · simp
    · show (b * (c * t) + d * gFormC 1 (c • v)) • (1 : O Cut)
         = c • ((b * t + d * gFormC 1 v) • (1 : O Cut))
      rw [gFormC_smul_right, smul_smul]; congr 1; ring

/-- The octonion-coupling coordinate operator acts as
    `(t,x,v) ↦ (a·t + b·gFormC 1 v, 0, (b·t + d·gFormC 1 v)•1₍O₎)`. -/
theorem toMix_apply (a b d : Cut) (p : STVC) :
    toMix a b d p = (a * p.1 + b * gFormC 1 p.2.2, (0:Cut),
                     (b * p.1 + d * gFormC 1 p.2.2) • (1 : O Cut)) := rfl

/-- `toMix a b d` is EvC-self-adjoint for ALL `a,b,d` — directly, via the symmetry of the
    octonion form `gFormC_symm`. -/
theorem toMix_isEvCSymm (a b d : Cut) : IsEvCSymm (toMix a b d) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show (a * t + b * gFormC 1 v) * t' + (0:Cut) * x'
        + gFormC ((b * t + d * gFormC 1 v) • (1:O Cut)) v'
      = t * (a * t' + b * gFormC 1 v') + x * 0
        + gFormC v ((b * t' + d * gFormC 1 v') • (1:O Cut))
  rw [gFormC_smul_left, gFormC_smul_right, gFormC_symm v (1:O Cut)]
  ring

/-- ★ THE GENUINE COUPLING: `toMix a b d` sends the pure-time unit `(1,0,0)` to a vector whose
    OCTONION component is `b•1₍O₎` — the time axis maps INTO the octonion block. Impossible for any
    block-separated operator (`coordDiag3`, `blockDiag`, `txOp`, `boostC` all fix the time/octonion
    split); the genuine 10-dim mixing, on the time ↔ octonion-real plane. -/
theorem toMix_octBlock (a b d : Cut) :
    (toMix a b d ((1:Cut),(0:Cut),(0:O Cut))).2.2 = (b • (1 : O Cut)) := by
  rw [toMix_apply]
  show (b * 1 + d * gFormC 1 (0:O Cut)) • (1:O Cut) = b • (1:O Cut)
  rw [gFormC_zero_right']; congr 1; ring

/-! ## The forward decomposition — the whole parametrized family in its octonion-coupling eigenbasis. -/

/-- ★★ THE FORWARD DECOMPOSITION: for ALL `l₁,l₂,c,s`, the rotated-basis spectral operator
    `specOp l₁ l₂ (omixA c s)(omixB c s)` (N63) over the octonion-coupling eigenbasis equals the
    octonion-coupling coordinate operator `toMix (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)` — the eigenvalues
    `l₁,l₂` on the octonion-coupling rotation eigenbasis produce a symmetric coordinate operator that
    couples time to `1₍O₎` (escalating N65's `(t,x)`-plane `specOp_rot_eq_txOp`). Holds for EVERY `c,s`
    (the FORM needs no orthonormality; orthonormality enters only the composition / square-root laws). -/
theorem specOp_omix_eq_toMix (l₁ l₂ c s : Cut) :
    specOp l₁ l₂ (omixA c s) (omixB c s)
      = toMix (l₁*c*c + l₂*s*s) ((l₁-l₂)*c*s) (l₁*s*s + l₂*c*c) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [specOp_apply, toMix_apply]
  have eA : EvC (omixA c s) (t, x, v) = c*t + s*gFormC 1 v := by
    show c * t + (0:Cut) * x + gFormC (s • (1:O Cut)) v = c*t + s*gFormC 1 v
    rw [gFormC_smul_left]; ring
  have eB : EvC (omixB c s) (t, x, v) = -s*t + c*gFormC 1 v := by
    show (-s) * t + (0:Cut) * x + gFormC (c • (1:O Cut)) v = -s*t + c*gFormC 1 v
    rw [gFormC_smul_left]; ring
  rw [eA, eB]
  simp only [omixA, omixB, Prod.smul_mk, smul_eq_mul, Prod.mk_add_mk, add_zero,
    mul_zero, smul_smul]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show l₁ * (c*t + s*gFormC 1 v) * c + l₂ * (-s*t + c*gFormC 1 v) * -s
       = (l₁*c*c + l₂*s*s) * t + (l₁-l₂)*c*s * gFormC 1 v
    ring
  · show (0:Cut) = 0; rfl
  · show (l₁ * (c*t + s*gFormC 1 v) * s) • (1:O Cut)
       + (l₂ * (-s*t + c*gFormC 1 v) * c) • (1:O Cut)
       = ((l₁-l₂)*c*s * t + (l₁*s*s + l₂*c*c) * gFormC 1 v) • (1:O Cut)
    rw [← add_smul]; congr 1; ring

/-! ## The rank-2 vector eigen-equation — the seed the deflation engine consumes. -/

/-- THE RANK-2 VECTOR EIGEN-EQUATION (first eigenvector): for an EvC-orthonormal pair,
    `specOp l₁ l₂ u₁ u₂ u₁ = l₁ • u₁`. The genuine vector eigenpair the N70 deflation engine consumes
    (`g u = l • u`), at rank 2 — the analogue of N71's `specOpN_eigen` for the constructed pair. -/
theorem specOp_eigen₁ {l₁ l₂ : Cut} {u₁ u₂ : STVC}
    (h11 : EvC u₁ u₁ = 1) (h12 : EvC u₁ u₂ = 0) :
    specOp l₁ l₂ u₁ u₂ u₁ = l₁ • u₁ := by
  rw [specOp_apply, h11, EvC_symm u₂ u₁, h12]
  simp

/-- THE RANK-2 VECTOR EIGEN-EQUATION (second eigenvector): `specOp l₁ l₂ u₁ u₂ u₂ = l₂ • u₂`. -/
theorem specOp_eigen₂ {l₁ l₂ : Cut} {u₁ u₂ : STVC}
    (h22 : EvC u₂ u₂ = 1) (h12 : EvC u₁ u₂ = 0) :
    specOp l₁ l₂ u₁ u₂ u₂ = l₂ • u₂ := by
  rw [specOp_apply, h22, h12]
  simp

/-! ## THE CROWN — the constructed octonion-coupling eigenbasis from the discriminant radical. -/

/-- ★★ THE CROWN — THE CONSTRUCTED OCTONION-COUPLING EIGENBASIS EXISTENCE: for EVERY `a,b,d` with
    `b ≠ 0`, the octonion-coupling coordinate operator `toMix a b d` is diagonalized by the
    EvC-orthonormal eigenbasis `u± = omixA/B (b/nrm)((R−δ)/nrm)` built from the discriminant radical
    `R = cutSqrt(δ²+b²)` (the trunk scalar root N57) and `nrm = cutSqrt(2R(R−δ))`, with eigenvalues
    `λ± = (a+d)/2 ± R`:
        `toMix a b d = specOp ((a+d)/2 + R) ((a+d)/2 − R) u₊ u₋`.
    The eigenvectors ROTATE with the parameters through the discriminant `cutSqrt` — NO fixed
    eigenbasis — for an operator that TOUCHES THE OCTONION BLOCK (the octonion-sector analogue of
    N65's `(t,x)`-plane `txOp_eq_specOp_rot`). The normalization `2R(R−δ)` is positive exactly because
    `b ≠ 0` forces `R − δ > 0`; the proof reuses the banked `rotEig_normalized` lever and the same
    `cutSqrt` algebra as N65, transported to the octonion-coupling block. NO Mathlib spectral theory. -/
theorem toMix_eq_specOp_omix (a b d : Cut) (hb : b ≠ 0) :
    let δ := (a-d)/2
    let R := cutSqrt (δ*δ + b*b)
    let nrm := cutSqrt (2*R*(R-δ))
    toMix a b d = specOp ((a+d)/2 + R) ((a+d)/2 - R) (omixA (b/nrm) ((R-δ)/nrm))
                                                     (omixB (b/nrm) ((R-δ)/nrm)) := by
  intro δ R nrm
  have hbb : (0:Cut) < b*b := mul_self_pos.mpr hb
  have hdisc : (0:Cut) < δ*δ + b*b := add_pos_of_nonneg_of_pos (mul_self_nonneg δ) hbb
  have hRpos : 0 < R := cutSqrt_pos hdisc
  have hRR : R * R = δ*δ + b*b := cutSqrt_sq (le_of_lt hdisc)
  have hRmd : 0 < R - δ := by
    have hRsq_gt : δ*δ < R*R := by rw [hRR]; linarith [hbb]
    nlinarith [hRpos, hRsq_gt]
  have hNpos : (0:Cut) < 2*R*(R-δ) := mul_pos (mul_pos (by norm_num) hRpos) hRmd
  have hN : nrm * nrm = 2*R*(R-δ) := cutSqrt_sq (le_of_lt hNpos)
  have hnrm : nrm ≠ 0 := ne_of_gt (cutSqrt_pos hNpos)
  have hN2 : nrm * nrm ≠ 0 := mul_ne_zero hnrm hnrm
  rw [specOp_omix_eq_toMix]
  congr 1
  · symm
    have key : ((a+d)/2 + R)*b*b + ((a+d)/2 - R)*(R-δ)*(R-δ) = a*(nrm*nrm) := by
      rw [hN]; linear_combination (-((a+d)/2 + R)) * hRR
    calc ((a+d)/2 + R) * (b/nrm) * (b/nrm) + ((a+d)/2 - R) * ((R-δ)/nrm) * ((R-δ)/nrm)
        = (((a+d)/2 + R)*b*b + ((a+d)/2 - R)*(R-δ)*(R-δ))/(nrm*nrm) := by ring
      _ = (a*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = a := by rw [mul_div_assoc, div_self hN2, mul_one]
  · symm
    have key : (((a+d)/2 + R) - ((a+d)/2 - R))*b*(R-δ) = b*(nrm*nrm) := by rw [hN]; ring
    calc (((a+d)/2 + R) - ((a+d)/2 - R)) * (b/nrm) * ((R-δ)/nrm)
        = ((((a+d)/2 + R) - ((a+d)/2 - R))*b*(R-δ))/(nrm*nrm) := by ring
      _ = (b*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = b := by rw [mul_div_assoc, div_self hN2, mul_one]
  · symm
    have key : ((a+d)/2 + R)*(R-δ)*(R-δ) + ((a+d)/2 - R)*b*b = d*(nrm*nrm) := by
      rw [hN]; linear_combination (-((a+d)/2 - R)) * hRR
    calc ((a+d)/2 + R) * ((R-δ)/nrm) * ((R-δ)/nrm) + ((a+d)/2 - R) * (b/nrm) * (b/nrm)
        = (((a+d)/2 + R)*(R-δ)*(R-δ) + ((a+d)/2 - R)*b*b)/(nrm*nrm) := by ring
      _ = (d*(nrm*nrm))/(nrm*nrm) := by rw [key]
      _ = d := by rw [mul_div_assoc, div_self hN2, mul_one]

/-! ## The general operator square root — N63 `specOp_op_sqrt` through the CROWN eigendecomposition. -/

/-- ★★ THE GENERAL OPERATOR SQUARE ROOT: for `b ≠ 0` and the positive-semidefinite slice
    `(a+d)/2 − R ≥ 0`, `specOp (cutSqrt((a+d)/2+R)) (cutSqrt((a+d)/2−R)) u₊ u₋` is a positive operator
    square root of the octonion-coupling `toMix a b d`. N63 `specOp_op_sqrt` through the CROWN
    `toMix_eq_specOp_omix` — the octonion-coupling analogue of N65's `txOp_op_sqrt_gen`, the scalar
    `cutSqrt` per eigenvalue on the constructed octonion-coupling EvC-orthogonal eigenprojection. -/
theorem toMix_op_sqrt_gen (a b d : Cut) (hb : b ≠ 0)
    (hpos : 0 ≤ (a+d)/2 - cutSqrt ((a-d)/2*((a-d)/2) + b*b)) :
    let δ := (a-d)/2
    let R := cutSqrt (δ*δ + b*b)
    let nrm := cutSqrt (2*R*(R-δ))
    IsEvCOpSqrt (specOp (cutSqrt ((a+d)/2 + R)) (cutSqrt ((a+d)/2 - R))
                  (omixA (b/nrm) ((R-δ)/nrm)) (omixB (b/nrm) ((R-δ)/nrm)))
                (toMix a b d) := by
  intro δ R nrm
  have hbb : (0:Cut) < b*b := mul_self_pos.mpr hb
  have hdisc : (0:Cut) < δ*δ + b*b := add_pos_of_nonneg_of_pos (mul_self_nonneg δ) hbb
  have hRpos : 0 < R := cutSqrt_pos hdisc
  have hRR : R * R = δ*δ + b*b := cutSqrt_sq (le_of_lt hdisc)
  have hRmd : 0 < R - δ := by
    have hRsq_gt : δ*δ < R*R := by rw [hRR]; linarith [hbb]
    nlinarith [hRpos, hRsq_gt]
  have hNpos : (0:Cut) < 2*R*(R-δ) := mul_pos (mul_pos (by norm_num) hRpos) hRmd
  have hN : nrm * nrm = 2*R*(R-δ) := cutSqrt_sq (le_of_lt hNpos)
  have hnrm : nrm ≠ 0 := ne_of_gt (cutSqrt_pos hNpos)
  have hn1 : (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm) = 1 :=
    rotEig_normalized b R δ nrm hRR hN hnrm
  have hpos' : 0 ≤ (a+d)/2 - R := hpos
  have hpos2 : 0 ≤ (a+d)/2 + R := by linarith [hpos', hRpos]
  have h := specOp_op_sqrt (c₁ := (a+d)/2 + R) (c₂ := (a+d)/2 - R) hpos2 hpos'
    (omixA_norm hn1) (omixB_norm hn1) (omixAB_orth (b/nrm) ((R-δ)/nrm))
  rwa [← toMix_eq_specOp_omix a b d hb] at h

/-! ## The constructed seed eigenpair in vector form — the seed the deflation engine consumes. -/

/-- ★★ THE CONSTRUCTED SEED EIGENPAIR IN VECTOR FORM: `toMix a b d u₊ = λ₊ • u₊`, where `u₊` is
    CONSTRUCTED from the discriminant radical `R = cutSqrt(δ²+b²)` (NOT a given rational frame, NOT
    pre-identified with `specOpN`) and `λ₊ = (a+d)/2 + R`. The seed eigenpair the N70 deflation engine
    consumes (`g u = l • u`), now EXTRACTED from an octonion-coupling coordinate operator via the
    characteristic-equation discriminant — the escalation over N71's `txMix_eigen_mixA` (whose
    eigenvector `mixA` was a fixed rational frame given in advance). Through the CROWN
    `toMix_eq_specOp_omix` + the rank-2 vector eigen-equation `specOp_eigen₁`. -/
theorem toMix_seed_eigen (a b d : Cut) (hb : b ≠ 0) :
    let δ := (a-d)/2
    let R := cutSqrt (δ*δ + b*b)
    let nrm := cutSqrt (2*R*(R-δ))
    toMix a b d (omixA (b/nrm) ((R-δ)/nrm)) = ((a+d)/2 + R) • (omixA (b/nrm) ((R-δ)/nrm)) := by
  intro δ R nrm
  have hbb : (0:Cut) < b*b := mul_self_pos.mpr hb
  have hdisc : (0:Cut) < δ*δ + b*b := add_pos_of_nonneg_of_pos (mul_self_nonneg δ) hbb
  have hRpos : 0 < R := cutSqrt_pos hdisc
  have hRR : R * R = δ*δ + b*b := cutSqrt_sq (le_of_lt hdisc)
  have hRmd : 0 < R - δ := by
    have hRsq_gt : δ*δ < R*R := by rw [hRR]; linarith [hbb]
    nlinarith [hRpos, hRsq_gt]
  have hNpos : (0:Cut) < 2*R*(R-δ) := mul_pos (mul_pos (by norm_num) hRpos) hRmd
  have hN : nrm * nrm = 2*R*(R-δ) := cutSqrt_sq (le_of_lt hNpos)
  have hnrm : nrm ≠ 0 := ne_of_gt (cutSqrt_pos hNpos)
  have hn1 : (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm) = 1 :=
    rotEig_normalized b R δ nrm hRR hN hnrm
  rw [toMix_eq_specOp_omix a b d hb]
  exact specOp_eigen₁ (omixA_norm hn1) (omixAB_orth (b/nrm) ((R-δ)/nrm))

/-! ## The N70 deflation engine FIRES non-vacuously on the CONSTRUCTED seed. -/

/-- ★★ N70 `deflateC_eigen_kills` FIRES on the CONSTRUCTED seed: `deflateC (toMix a b d) λ₊ u₊ u₊ = 0`
    for the eigenvector `u₊` CONSTRUCTED from the discriminant radical. The deflation engine of N70 took
    `g u = l • u` as a hypothesis; the constructed seed `toMix_seed_eigen` SATISFIES it, so the peeled
    eigenvector genuinely leaves the picture on an octonion-coupling operator with a CONSTRUCTED (not
    given) eigenbasis — the inductive step's rank-drop, realized on the hardest block. -/
theorem toMix_deflate_kills_seed (a b d : Cut) (hb : b ≠ 0) :
    let δ := (a-d)/2
    let R := cutSqrt (δ*δ + b*b)
    let nrm := cutSqrt (2*R*(R-δ))
    deflateC (toMix a b d) ((a+d)/2 + R) (omixA (b/nrm) ((R-δ)/nrm))
        (omixA (b/nrm) ((R-δ)/nrm)) = 0 := by
  intro δ R nrm
  have hbb : (0:Cut) < b*b := mul_self_pos.mpr hb
  have hdisc : (0:Cut) < δ*δ + b*b := add_pos_of_nonneg_of_pos (mul_self_nonneg δ) hbb
  have hRpos : 0 < R := cutSqrt_pos hdisc
  have hRR : R * R = δ*δ + b*b := cutSqrt_sq (le_of_lt hdisc)
  have hRmd : 0 < R - δ := by
    have hRsq_gt : δ*δ < R*R := by rw [hRR]; linarith [hbb]
    nlinarith [hRpos, hRsq_gt]
  have hNpos : (0:Cut) < 2*R*(R-δ) := mul_pos (mul_pos (by norm_num) hRpos) hRmd
  have hN : nrm * nrm = 2*R*(R-δ) := cutSqrt_sq (le_of_lt hNpos)
  have hnrm : nrm ≠ 0 := ne_of_gt (cutSqrt_pos hNpos)
  have hn1 : (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm) = 1 :=
    rotEig_normalized b R δ nrm hRR hN hnrm
  have hu : EvC (omixA (b/nrm) ((R-δ)/nrm)) (omixA (b/nrm) ((R-δ)/nrm)) = 1 := omixA_norm hn1
  exact deflateC_eigen_kills hu (toMix_seed_eigen a b d hb)

/-- ★★ N70 `deflateC_image_orth` FIRES on the CONSTRUCTED seed: the ENTIRE IMAGE of the deflated
    operator is EvC-orthogonal to the CONSTRUCTED `u₊` — `EvC u₊ (deflateC (toMix a b d) λ₊ u₊ w) = 0`
    for ALL `w`. So the EvC-orthogonal complement of the constructed `u₊` is an INVARIANT subspace of
    the deflated octonion-coupling operator — the recursion enabler / inductive descent, realized on a
    CONSTRUCTED eigenbasis (escalating N71's `txMix_deflate_image_orth`, whose eigenvector was given). -/
theorem toMix_deflate_image_orth (a b d : Cut) (hb : b ≠ 0) (w : STVC) :
    let δ := (a-d)/2
    let R := cutSqrt (δ*δ + b*b)
    let nrm := cutSqrt (2*R*(R-δ))
    EvC (omixA (b/nrm) ((R-δ)/nrm))
        (deflateC (toMix a b d) ((a+d)/2 + R) (omixA (b/nrm) ((R-δ)/nrm)) w) = 0 := by
  intro δ R nrm
  have hbb : (0:Cut) < b*b := mul_self_pos.mpr hb
  have hdisc : (0:Cut) < δ*δ + b*b := add_pos_of_nonneg_of_pos (mul_self_nonneg δ) hbb
  have hRpos : 0 < R := cutSqrt_pos hdisc
  have hRR : R * R = δ*δ + b*b := cutSqrt_sq (le_of_lt hdisc)
  have hRmd : 0 < R - δ := by
    have hRsq_gt : δ*δ < R*R := by rw [hRR]; linarith [hbb]
    nlinarith [hRpos, hRsq_gt]
  have hNpos : (0:Cut) < 2*R*(R-δ) := mul_pos (mul_pos (by norm_num) hRpos) hRmd
  have hN : nrm * nrm = 2*R*(R-δ) := cutSqrt_sq (le_of_lt hNpos)
  have hnrm : nrm ≠ 0 := ne_of_gt (cutSqrt_pos hNpos)
  have hn1 : (b/nrm)*(b/nrm) + ((R-δ)/nrm)*((R-δ)/nrm) = 1 :=
    rotEig_normalized b R δ nrm hRR hN hnrm
  have hu : EvC (omixA (b/nrm) ((R-δ)/nrm)) (omixA (b/nrm) ((R-δ)/nrm)) = 1 := omixA_norm hn1
  exact deflateC_image_orth (toMix_isEvCSymm a b d) hu (toMix_seed_eigen a b d hb) w

/-! ## Non-vacuity (W8) — a concrete octonion-coupling member, constructed-seed eigenpair, deflation. -/

/-- NON-VACUITY (W8): a concrete octonion-coupling member — `toMix 73 36 52` (off-diagonal `36 ≠ 0`,
    coupling time to `1₍O₎`) equals `specOp 100 25` over the constructed rational eigenbasis
    `omixA (4/5)(3/5)`/`omixB (4/5)(3/5)` (eigenvalues `100,25`; the clean rational-discriminant case,
    half-discriminant `R = 75/2`). The costume target. -/
theorem toMix_73_36_52_diag :
    toMix (73:Cut) 36 52 = specOp 100 25 (omixA (4/5) (3/5)) (omixB (4/5) (3/5)) := by
  rw [specOp_omix_eq_toMix]; norm_num

/-- NON-VACUITY (W8): the CONSTRUCTED seed eigenpair, concretely — `toMix 73 36 52 (omixA (4/5)(3/5))
    = 100 • omixA (4/5)(3/5)`. The constructed octonion-coupling eigenvector with its eigenvalue `100`,
    in genuine vector form. -/
theorem toMix_73_36_52_seed_eigen :
    toMix (73:Cut) 36 52 (omixA (4/5) (3/5)) = (100:Cut) • omixA (4/5) (3/5) := by
  have hn : (4/5:Cut)*(4/5) + (3/5)*(3/5) = 1 := by norm_num
  rw [toMix_73_36_52_diag]
  exact specOp_eigen₁ (omixA_norm hn) (omixAB_orth (4/5) (3/5))

/-- NON-VACUITY (W8): the deflation engine FIRES on the concrete constructed seed — `deflateC
    (toMix 73 36 52) 100 (omixA (4/5)(3/5)) (omixA (4/5)(3/5)) = 0`. The peeled constructed eigenvector
    leaves the picture on a concrete octonion-coupling operator. -/
theorem toMix_73_36_52_deflate_kills :
    deflateC (toMix (73:Cut) 36 52) 100 (omixA (4/5) (3/5)) (omixA (4/5) (3/5)) = 0 := by
  have hn : (4/5:Cut)*(4/5) + (3/5)*(3/5) = 1 := by norm_num
  exact deflateC_eigen_kills (omixA_norm hn) toMix_73_36_52_seed_eigen

/-- ★ NON-VACUITY (W8): the general operator square root, concretely — `specOp 10 5` over the
    constructed octonion-coupling eigenbasis `omixA (4/5)(3/5)`/`omixB (4/5)(3/5)` is the positive
    operator square root of the octonion-coupling `toMix 73 36 52` (eigenvalues `100,25`). A concrete
    octonion-coupling operator rooted in its CONSTRUCTED eigenbasis. -/
theorem toMix_73_36_52_witness :
    IsEvCOpSqrt (specOp (10:Cut) 5 (omixA (4/5) (3/5)) (omixB (4/5) (3/5))) (toMix 73 36 52) := by
  have hn : (4/5:Cut)*(4/5) + (3/5)*(3/5) = 1 := by norm_num
  have h := specOp_op_sqrt (c₁ := (100:Cut)) (c₂ := (25:Cut)) (by norm_num) (by norm_num)
    (omixA_norm hn) (omixB_norm hn) (omixAB_orth (4/5) (3/5))
  rw [toMix_73_36_52_diag]
  rwa [show cutSqrt (100:Cut) = 10 from (cutSqrt_unique (by norm_num) (by norm_num)).symm,
       show cutSqrt (25:Cut) = 5 from (cutSqrt_unique (by norm_num) (by norm_num)).symm] at h

/-- NON-VACUITY / COSTUME TARGET (W8): the constructed `λ₊` eigenblock of `toMix 73 36 52` at its
    constructed `omixA (4/5)(3/5)` eigendirection reads `100` — through `specOp_read₁`. The genuine
    constructed-seed eigenvalue; a costume claiming it reads `40` reduces to `100 = 40`. -/
theorem toMix_73_36_52_read_seed :
    EvC (toMix (73:Cut) 36 52 (omixA (4/5) (3/5))) (omixA (4/5) (3/5)) = 100 := by
  have hn : (4/5:Cut)*(4/5) + (3/5)*(3/5) = 1 := by norm_num
  rw [toMix_73_36_52_diag]
  exact specOp_read₁ (omixA_norm hn) (omixAB_orth (4/5) (3/5))

end

end Phys.Algebra
