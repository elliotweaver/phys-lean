/-
  N160 — THE OCTONION-BLOCK SO(8) EXHAUSTION CORE: THE EVEN-PAIR (BIREFLECTION) = PLANE
  HALF-TURN IDENTITY, lifting the BANKED Householder reflection word into the NON-VACUOUS
  `JoinedIdQvC`.

  N159 (`LorentzContinuumOctBlockSO8Word`) banked the octonion-block 2-plane rotation GENERATORS
  `octPlaneRot e f c s` (orthonormal `e,f`, circle point `(c,s)`) lifted to the NON-VACUOUS
  path-component predicate `JoinedIdQvC` (`joinedIdQvC_octBlockEndC_octPlaneRot`), and the finite
  product `joinedIdQvC_octPlaneRotWord` (a word of lifted generators is `JoinedIdQvC`). N124
  (`LorentzContinuumGenerationSO8PeelOracle`) banked `gFormC_isom_mem_closure`: EVERY
  `gFormC`-isometry of the terminal algebra `O Cut` is a finite product of Householder reflections
  `houseHolder a` (`Submonoid.closure houseHolderSet`) — the Cartan–Dieudonné structure theorem
  CLOSED over the derived ℝ `Cut`. THIS node closes the genuine residual the ROADMAP §N160 (i)
  names: the rotation = EVEN-REFLECTION-PAIR identification, lifting the reflection word into the
  rotation generators.

  ── THE MEASURE-FIRST FINDING (THE ONE LAW, off the literal exhaustion) ──
  The smallest obligation: does an orthogonal bireflection EQUAL a plane rotation generator? IT
  EQUALS THE PLANE HALF-TURN. For ORTHONORMAL `a,b` (`gFormC a a = gFormC b b = 1`,
  `gFormC a b = 0`), `houseHolder a` is `v ↦ v − 2·(gFormC a v)•a` (unit `a`), so
  `houseHolder a · houseHolder b = octPlaneRot a b (−1) 0` — the half-turn of `span{a,b}`
  (`houseHolder_bireflection_eq_octPlaneRot`, ONE `module` after the orthonormal collapse). A
  single Householder reflection has det −1 (NOT in the identity component, NOT `JoinedIdQvC`); the
  EVEN PAIR is the det +1 half-turn rotation. This is exactly the rotation = even-reflection-pair
  identification — the genuine link the chain needed, DERIVED.

  ── THE HALF-TURN IS REACHED VIA THE QUARTER-TURN (off the cayley antipode) ──
  The half-turn `octPlaneRot a b (−1) 0` is at the cayley ANTIPODE (`c = −1`, `1 + c = 0`), so the
  N159 path cannot reach it directly. THE TRUNK ROUTE: the half-turn is the SQUARE of the
  quarter-turn, `octPlaneRot a b 0 1 · octPlaneRot a b 0 1 = octPlaneRot a b (−1) 0`
  (`octPlaneRot_quarter_sq`, orthonormal `a,b`), and the quarter-turn `octPlaneRot a b 0 1` is OFF
  the antipode (`c = 0`, `1 + 0 ≠ 0`), a circle point (`0² + 1² = 1`), hence its lift is
  `JoinedIdQvC` (N159 `joinedIdQvC_octBlockEndC_octPlaneRot`). With the lift MULTIPLICATIVE
  (`octBlockEndC_mul`) and `JoinedIdQvC` closed under `·` (`joinedIdQvC_mul`, N157), the lifted
  orthogonal bireflection `octBlockEndC (houseHolder a · houseHolder b)` is `JoinedIdQvC`
  NON-vacuously (`joinedIdQvC_octBlockEndC_orthoBireflection`).

  ── WHAT THIS NODE BANKS ──
  `octBlockEndC_mul` / `octBlockEndC_one` — the octonion-block lift is a monoid homomorphism
    (`octBlockEndC (R·S) = octBlockEndC R · octBlockEndC S`, `octBlockEndC 1 = 1`).
  ★ `houseHolder_bireflection_eq_octPlaneRot` — THE EVEN-PAIR = HALF-TURN identity: for orthonormal
    `a,b`, `houseHolder a · houseHolder b = octPlaneRot a b (−1) 0`.
  `octPlaneRot_quarter_sq` — the quarter-turn squared is the half-turn (orthonormal `a,b`).
  ★★ `joinedIdQvC_octBlockEndC_orthoBireflection` — THE CORE: the lifted orthogonal bireflection
    `octBlockEndC (houseHolder a · houseHolder b)` is `JoinedIdQvC` (non-vacuously), for orthonormal
    `a,b`. The reflection word's EVEN factors lift into the NON-VACUOUS rotation path component.
  W8: `orthoBireflection_e2je2_moves` (the concrete `e₂,je2` bireflection sends `e₂ ↦ −e₂`) +
    `joinedIdQvC_octBlockEndC_orthoBireflection_e2je2` (it is `JoinedIdQvC`) — reading `−1` on the
    moved slot (`octBlockEndC_orthoBireflection_e2je2_moves_read`), a non-trivial det +1 isometry,
    not decoration.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the Householder reflection `houseHolder` / `houseHolder_apply` (N124) on
  the positive-definite Born form `gFormC` (Born = self-overlap = positivity, the trunk); the
  octonion-block generator `octPlaneRot` / `octPlaneRot_apply` and its lift to the NON-VACUOUS
  `JoinedIdQvC` (`joinedIdQvC_octBlockEndC_octPlaneRot`, N159); the embedding `octBlockEndC` (N129);
  the engine `joinedIdQvC_mul` (N157); the orthonormal octonion units `e2_gFormC_self` /
  `je2_gFormC_self` / `octDeflate_e2_je2_gFormC_zero`; `gFormC` bilinearity (`gFormC_add/smul/symm`,
  N-LieAlgebra), `LinearMap.ext` / `Module.End.mul_apply` / `module` MACHINERY on the DERIVED
  objects (STANDARD §3) — over the derived ℝ `ContinuumQ.Cut` and the terminal algebra `O Cut`. NOT
  a posited rotation group, NOT a posited reflection group, NOT a posited connectedness, NOT a
  posited topology, NOT a posited Lorentz / Pin / Spin / gauge / G₂ / SO(8) group, NOT Mathlib ℝ/ℂ
  as content, NOT a regression to the vacuous `JoinedIdC`, NOT a fully proved implication asserted
  without a proof, NOT a bridge.

  ── THE FORWARD REMAINDER (childed N161) ──
  THE FULL CLOSURE-INDUCTION WORD: every det +1 (`SO(8)`) `gFormC`-isometry of `O Cut` is a finite
  product of `octPlaneRot` generators (hence `JoinedIdQvC`), by inducting on the
  `Submonoid.closure houseHolderSet` word (N124), pairing reflections into bireflections (this node)
  and handling the even-length / det-parity bookkeeping. The genuine heavy group-manifold remainder
  Mathlib lacks over the derived `Cut`; this node banks its single missing structural link (the
  even-pair = rotation identity, lifted non-vacuously).

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "rotation / reflection / Householder / bireflection / half-turn / quarter-turn / isometry /
  SO(8) / Cartan / Dieudonné / path-connected / Lorentz / det / even-pair": over the derived
  complete ordered field `Cut` the lemmas say — the block-embedding `R ↦ octBlockEndC R` is a monoid
  hom; for `gFormC`-orthonormal `a,b` the composite `houseHolder a · houseHolder b` equals the
  explicit linear map `octPlaneRot a b (−1) 0`, which is the square of `octPlaneRot a b 0 1`; and the
  embedding of that composite lies in a preconnected set of `gFormC`-form-preserving operators
  containing `1`. Pure linear algebra over the derived field; no theorem statement needs a physics
  word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumOctBlockSO8Word
import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## THE LIFT IS A MONOID HOMOMORPHISM. -/

/-- The octonion-block embedding is MULTIPLICATIVE: `octBlockEndC (R·S) = octBlockEndC R ·
    octBlockEndC S`. Both act componentwise on the octonion slot, fixing `(t,x)`. -/
theorem octBlockEndC_mul (R S : O Cut →ₗ[Cut] O Cut) :
    octBlockEndC (R * S) = octBlockEndC R * octBlockEndC S := by
  apply LinearMap.ext; intro p
  rw [Module.End.mul_apply, octBlockEndC_apply, octBlockEndC_apply, octBlockEndC_apply]
  rfl

/-- The octonion-block embedding sends the identity to the identity. -/
theorem octBlockEndC_one : octBlockEndC (1 : O Cut →ₗ[Cut] O Cut) = 1 := by
  apply LinearMap.ext; intro p
  rw [octBlockEndC_apply]; rfl

/-! ## THE EVEN-PAIR = HALF-TURN IDENTITY. -/

/-- ★ THE EVEN-PAIR = PLANE HALF-TURN IDENTITY. For ORTHONORMAL `a,b` (`gFormC a a = gFormC b b = 1`,
    `gFormC a b = 0`), the orthogonal bireflection equals the half-turn of `span{a,b}`:
    `houseHolder a · houseHolder b = octPlaneRot a b (−1) 0`. Each `houseHolder` is
    `v ↦ v − 2·(gFormC · v)•·` (the unit-norm inverse collapses, `gFormC a a = 1`); the inner
    cross term `gFormC a (houseHolder b v)` collapses to `gFormC v a` by orthogonality
    (`gFormC b a = 0`); one `module` closes the resulting vector identity. The rotation =
    even-reflection-pair identification the ROADMAP §N160 (i) names, DERIVED — a single reflection
    has det −1, the EVEN pair is the det +1 half-turn rotation. -/
theorem houseHolder_bireflection_eq_octPlaneRot (a b : O Cut)
    (haa : gFormC a a = 1) (hbb : gFormC b b = 1) (hab : gFormC a b = 0) :
    houseHolder a * houseHolder b = octPlaneRot a b (-1) 0 := by
  have hba : gFormC b a = 0 := by rw [gFormC_symm]; exact hab
  apply LinearMap.ext; intro v
  rw [Module.End.mul_apply, houseHolder_apply a (houseHolder b v), houseHolder_apply b v,
      octPlaneRot_apply, haa, hbb]
  simp only [inv_one, mul_one]
  have hinner : gFormC a (v - (2 * gFormC b v) • b) = gFormC v a := by
    rw [gFormC_symm a, gFormC_sub_left, gFormC_smul_left, hba]; ring
  rw [hinner, gFormC_symm b v]
  module

/-- The quarter-turn squared is the half-turn, for ORTHONORMAL `e,f`:
    `octPlaneRot e f 0 1 · octPlaneRot e f 0 1 = octPlaneRot e f (−1) 0`. Pure `gFormC` bilinearity
    with the orthonormality collapse, then `module`. The half-turn is at the cayley antipode
    (`1 + (−1) = 0`), so it is reached as the square of the OFF-antipode quarter-turn. -/
theorem octPlaneRot_quarter_sq (e f : O Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0) :
    octPlaneRot e f 0 1 * octPlaneRot e f 0 1 = octPlaneRot e f (-1) 0 := by
  have hfe : gFormC f e = 0 := by rw [gFormC_symm]; exact hef
  apply LinearMap.ext; intro v
  rw [Module.End.mul_apply, octPlaneRot_apply e f 0 1 (octPlaneRot e f 0 1 v),
      octPlaneRot_apply e f 0 1 v, octPlaneRot_apply e f (-1) 0 v]
  simp only [gFormC_add_left, gFormC_smul_left, hee, hff, hef, hfe]
  module

/-! ## THE CORE — the lifted orthogonal bireflection is `JoinedIdQvC` (non-vacuous). -/

/-- ★★ THE CORE — the lifted orthogonal bireflection `octBlockEndC (houseHolder a · houseHolder b)`
    (x-fixing, time-fixing, acting purely on `𝕆`) is `JoinedIdQvC` (NON-vacuously) for ORTHONORMAL
    `a,b`. The bireflection equals the half-turn (`houseHolder_bireflection_eq_octPlaneRot`), which
    is the quarter-turn squared (`octPlaneRot_quarter_sq`); the lift is multiplicative
    (`octBlockEndC_mul`), so the lifted bireflection is `octBlockEndC (octPlaneRot a b 0 1) ·
    octBlockEndC (octPlaneRot a b 0 1)`. Each lifted quarter-turn is `JoinedIdQvC`
    (`joinedIdQvC_octBlockEndC_octPlaneRot`, off the antipode `1 + 0 ≠ 0`, circle point `0²+1²=1`);
    the product is `JoinedIdQvC` by the engine `joinedIdQvC_mul` (N157). The reflection word's EVEN
    factors lift into the NON-VACUOUS rotation path component. -/
theorem joinedIdQvC_octBlockEndC_orthoBireflection (a b : O Cut)
    (haa : gFormC a a = 1) (hbb : gFormC b b = 1) (hab : gFormC a b = 0) :
    JoinedIdQvC (octBlockEndC (houseHolder a * houseHolder b)) := by
  rw [houseHolder_bireflection_eq_octPlaneRot a b haa hbb hab,
      ← octPlaneRot_quarter_sq a b haa hbb hab, octBlockEndC_mul]
  have hq : JoinedIdQvC (octBlockEndC (octPlaneRot a b 0 1)) :=
    joinedIdQvC_octBlockEndC_octPlaneRot a b 0 1 haa hbb hab (by ring) (by norm_num)
  exact joinedIdQvC_mul hq hq

/-! ## W8 NON-VACUITY — the concrete `e₂,je2` orthogonal bireflection moves an axis and is `JoinedIdQvC`. -/

/-- The concrete orthogonal bireflection `houseHolder e₂ · houseHolder je2` sends `e₂ ↦ −e₂` (the
    half-turn negates the in-plane `e₂`, `c = −1`). It genuinely MOVES the axis — it is not the
    identity. -/
theorem orthoBireflection_e2je2_moves :
    (houseHolder (CD.e2 : O Cut) * houseHolder (je2 : O Cut)) (CD.e2 : O Cut)
      = -(CD.e2 : O Cut) := by
  rw [houseHolder_bireflection_eq_octPlaneRot (CD.e2 : O Cut) (je2 : O Cut)
        e2_gFormC_self je2_gFormC_self octDeflate_e2_je2_gFormC_zero,
      octPlaneRot_apply, e2_gFormC_self, octDeflate_e2_je2_gFormC_zero]
  rw [show ((-1 : Cut) - 1) * 1 - 0 * 0 = -2 by ring,
      show (0 : Cut) * 1 + ((-1) - 1) * 0 = 0 by ring]
  rw [zero_smul, add_zero]
  module

/-- ★ W8 TEETH — the lifted bireflection `octBlockEndC (houseHolder e₂ · houseHolder je2)` sends
    `(0,0,e₂)` to `(0,0,−e₂)`, reading `−1` on the moved slot:
    `gFormC ((…) (0,0,e₂)).2.2 e₂ = −1` (`orthoBireflection_e2je2_moves` + `e2_gFormC_self`). A
    non-trivial det +1 isometry that moves the axis — `gFormC (−e₂)(e₂) = −1`, NOT the identity's
    `+1`. -/
theorem octBlockEndC_orthoBireflection_e2je2_moves_read :
    gFormC ((octBlockEndC (houseHolder (CD.e2 : O Cut) * houseHolder (je2 : O Cut))
      ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.2) (CD.e2 : O Cut) = -1 := by
  rw [octBlockEndC_apply]
  show gFormC ((houseHolder (CD.e2 : O Cut) * houseHolder (je2 : O Cut)) (CD.e2 : O Cut))
        (CD.e2 : O Cut) = -1
  rw [orthoBireflection_e2je2_moves, gFormC_neg_left, e2_gFormC_self]

/-- ★ W8 — the concrete lifted orthogonal bireflection `octBlockEndC (houseHolder e₂ ·
    houseHolder je2)` is `JoinedIdQvC` (banked orthonormal pair `e₂,je2`). A genuine element of the
    NON-VACUOUS group-constrained path component, not the identity
    (`octBlockEndC_orthoBireflection_e2je2_moves_read` shows it moves `e₂`). -/
theorem joinedIdQvC_octBlockEndC_orthoBireflection_e2je2 :
    JoinedIdQvC (octBlockEndC (houseHolder (CD.e2 : O Cut) * houseHolder (je2 : O Cut))) :=
  joinedIdQvC_octBlockEndC_orthoBireflection (CD.e2 : O Cut) (je2 : O Cut)
    e2_gFormC_self je2_gFormC_self octDeflate_e2_je2_gFormC_zero

end
end Phys.Algebra
