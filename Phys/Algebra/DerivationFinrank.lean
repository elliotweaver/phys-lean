/-
  Phys.Algebra.DerivationFinrank — N19 (i): the FINITE-DIMENSIONALITY SCAFFOLD on
  the terminal algebra `O ℚ`, and `Der(O ℚ)` as a finite-dimensional ℚ-submodule
  of its endomorphism ring — the well-typed home of `dim_ℚ Der(O ℚ)`.
  ===========================================================================
  N6 (`Derivation.lean`) banked `Der(𝕆)` as a Lie algebra; N16/N17/N18 banked the
  COMPLETE qualitative so(7) characterization (every derivation kills the unit, is
  skew for the Born form `⟹ Der ⊆ so(7)`, is trace-free / maps into the imaginary
  subspace, and commutes with conjugation), all COORDINATE-FREE. The faithful
  exact-rational numerics (workbench/N16-g2-dimension) compute `dim_ℚ Der(O ℚ) = 14`
  (rank 50 / nullity 14 of the 512×64 Leibniz ℚ-system), with an explicit
  14-element integer-sparse basis.

  THIS MODULE banks the PREREQUISITE INFRASTRUCTURE the exact count needs — N18's
  FINDINGS flagged it as "the real first blocker, a node of its own": a
  finite-dimensionality scaffold on `O ℚ` making `Module.finrank ℚ Der(O ℚ)` a
  well-typed statement at all, derived FORWARD with NO posited `G₂` import.

  ★ THE STRUCTURAL ROUTE (docs/RUNBOOK.md W9.4 — structure over coordinate
  expansion). The literature/numerics establish `finrank = 8` by an explicit
  8-coordinate basis matrix (the W9 coordinate-expansion signature). Here it is
  STRUCTURAL: the Cayley–Dickson double is, AS A ℚ-MODULE, the product of its two
  components — `CD A ≃ₗ[ℚ] A × A` (`cdProdEquiv`, componentwise re/im). Chaining
  `Module.finrank_prod` + `Module.finrank_self` through the two doublings gives
  `finrank ℚ (O ℚ) = 8` with NO 8×8 basis matrix, NO coordinate rank — the W9
  monolith avoided exactly as N17/N18 avoided the 512×64 kernel. The compiled cost
  is bounded (≈7s/obligation, well under the frozen 90s KILL budget).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0; N3–N6/N16/N17/N18 held it). The
  ℚ-module / finrank / submodule structure is MACHINERY on the DERIVED object
  `O ℚ` (docs/STANDARD.md §3 — the OBJECT is the derived octonions, ℚ is the
  coefficient field the `finrank` statement is *written in*, exactly as N17 banked
  `Module ℚ (O ℚ)` and N3/N4 used `Matrix`/`Module`/`Subring`), NOT a posited number
  system. No Mathlib `LieAlgebra.g2` / `G₂` is imported to ASSERT the count.

  WHAT IS BANKED HERE (forward, foundations-only):
    cdProdEquiv / dblProdEquiv  — the ℚ-LINEAR product equivalences (the structural
                       route): `CD A ≃ₗ[ℚ] A × A`, `Dbl ℚ ≃ₗ[ℚ] ℚ × ℚ`.
    instFiniteDbl/H/O — `Module.Finite ℚ` for `Dbl ℚ`, `H ℚ`, `O ℚ` (transported
                       along the product equivs — the terminal algebra is a
                       finite-dimensional ℚ-vector space).
    finrank_dbl_eq_two / finrank_H_eq_four / finrank_O_eq_eight
                     — ★★ `finrank ℚ (O ℚ) = 8`, the rung dimensions 2 → 4 → 8,
                       STRUCTURAL (no coordinate basis matrix).
    qsmul_mul_left / qsmul_mul_right — the ℚ-scalar/product compatibility on `O ℚ`
                       (componentwise; what the submodule's `smul_mem` needs).
    IsDerivQ          — the ℚ-LINEAR Leibniz-derivation predicate.
    toEndQ            — every ℤ-linear endomorphism of the ℚ-vector space `O ℚ` is
                       canonically ℚ-linear (`map_rat_smul`); lifts N6's `Der` into
                       `Module.End ℚ (O ℚ)`.
    toEndQ_isDerivQ  — an `IsDeriv` (N6, ℤ) lifts to an `IsDerivQ` (ℚ): the ℚ-linear
                       derivations capture ALL of `Der(O ℚ)`.
    derivationQ      — ★ `Der(O ℚ)` as a `Submodule ℚ (Module.End ℚ (O ℚ))`. NOW
                       `Module.finrank ℚ derivationQ` is a well-typed natural number.
    instFiniteDerivationQ — `Der(O ℚ)` is finite-dimensional.
    finrank_derivationQ_le — ★ `finrank ℚ derivationQ ≤ 64` (a submodule of the
                       64-dimensional endomorphism ring).
    witnessDerivQ + _isDerivQ + _ne_zero + _mem — the banked NONZERO witness (N6)
                       as a ℚ-derivation living in `derivationQ` (anti-vacuity).
    derivationQ_ne_bot / finrank_derivationQ_pos — ★ `0 < finrank ℚ derivationQ`:
                       the dimension is a genuine positive number (NOT 0).

  So the scaffold pins `1 ≤ dim_ℚ Der(O ℚ) ≤ 64` as well-typed proved bounds. The
  EXACT `dim = 14` (lower bound: the 14 explicit independent derivations; upper
  bound: the so(7)→g₂ cut 21→14, the rep-theoretic W9-prime half) and the `g₂`
  structure constants + the `≅ g₂` Lie isomorphism are the dedicated downstream
  W1/W9 dissolution child (N20), NOT this node — never asserted, never a bridge.
  The numerics + explicit 14-element basis are banked (workbench/N16-g2-dimension,
  re-verified at N17/N18/N19) as that child's starting point.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "gauge / g₂ / automorphism":
  what remains is the pure statement that the Cayley–Dickson double of a double of a
  double is an 8-dimensional ℚ-vector space, and its Leibniz-derivations form a
  finite-dimensional ℚ-submodule (dimension between 1 and 64) of its endomorphism
  ring. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationTraceFree
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## THE STRUCTURAL ROUTE — the Cayley–Dickson double is the product of its
    components as a ℚ-module. -/

/-- The rung-1 algebra `Dbl ℚ`, as a ℚ-vector space, is the product `ℚ × ℚ`
    (componentwise re/im). The base of the finite-dimensionality tower. -/
def dblProdEquiv : Dbl ℚ ≃ₗ[ℚ] ℚ × ℚ where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [Dbl.add_re, Dbl.add_im]
  map_smul' q z := by ext <;> simp [Dbl.smul_re, Dbl.smul_im]
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

/-- ★ THE STRUCTURAL EQUIVALENCE: the Cayley–Dickson double is, as a ℚ-vector
    space, the product of its two components — `CD A ≃ₗ[ℚ] A × A`. This is the
    route the dimension count descends WITHOUT a coordinate basis matrix (W9.4). -/
def cdProdEquiv (A : Type*) [NonAssocRing A] [StarRing A] [Module ℚ A] :
    CD A ≃ₗ[ℚ] A × A where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [CD.add_re, CD.add_im]
  map_smul' q z := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

/-- `Dbl ℚ` is a finite-dimensional ℚ-vector space. -/
instance instFiniteDbl : Module.Finite ℚ (Dbl ℚ) :=
  Module.Finite.equiv dblProdEquiv.symm

/-- `H ℚ` is a finite-dimensional ℚ-vector space. -/
instance instFiniteH : Module.Finite ℚ (H ℚ) :=
  Module.Finite.equiv (cdProdEquiv (Dbl ℚ)).symm

/-- ★ `O ℚ` — THE TERMINAL ALGEBRA — is a finite-dimensional ℚ-vector space. -/
instance instFiniteO : Module.Finite ℚ (O ℚ) :=
  Module.Finite.equiv (cdProdEquiv (H ℚ)).symm

/-- The rung-1 dimension: `finrank ℚ (Dbl ℚ) = 2`. -/
theorem finrank_dbl_eq_two : Module.finrank ℚ (Dbl ℚ) = 2 := by
  rw [dblProdEquiv.finrank_eq, Module.finrank_prod, Module.finrank_self]

/-- The rung-2 dimension: `finrank ℚ (H ℚ) = 4`. -/
theorem finrank_H_eq_four : Module.finrank ℚ (H ℚ) = 4 := by
  rw [(cdProdEquiv (Dbl ℚ)).finrank_eq, Module.finrank_prod, finrank_dbl_eq_two]

/-- ★★ THE TERMINAL DIMENSION: `finrank ℚ (O ℚ) = 8`. The octonion shape is an
    8-dimensional ℚ-vector space — derived STRUCTURALLY through the two product
    equivalences (`2 → 4 → 8`), with NO coordinate basis matrix and NO coordinate
    rank (the W9 expansion avoided, docs/RUNBOOK.md W9.4). -/
theorem finrank_O_eq_eight : Module.finrank ℚ (O ℚ) = 8 := by
  rw [(cdProdEquiv (H ℚ)).finrank_eq, Module.finrank_prod, finrank_H_eq_four]

/-- THE ENDOMORPHISM-RING DIMENSION: `finrank ℚ (Module.End ℚ (O ℚ)) = 64`. The
    ambient the derivation submodule lives inside; `Der` is cut out of it. -/
theorem finrank_End_eq_64 : Module.finrank ℚ (Module.End ℚ (O ℚ)) = 64 := by
  rw [Module.finrank_linearMap, finrank_O_eq_eight]

/-! ## THE ℚ-SCALAR / PRODUCT COMPATIBILITY on `O ℚ` (componentwise).

    `O ℚ` has no `IsScalarTower ℚ (O ℚ) (O ℚ)` synthesized, so the submodule's
    `smul_mem` needs the explicit compatibility `(c • x) · y = c • (x · y)` and
    `x · (c • y) = c • (x · y)` — proved componentwise on the DERIVED module. -/

/-- `(c • x) · y = c • (x · y)`: a ℚ-scalar pulls out of the left factor. -/
theorem qsmul_mul_left (c : ℚ) (x y : O ℚ) : (c • x) * y = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

/-- `x · (c • y) = c • (x · y)`: a ℚ-scalar pulls out of the right factor. -/
theorem qsmul_mul_right (c : ℚ) (x y : O ℚ) : x * (c • y) = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

/-! ## `Der(O ℚ)` AS A ℚ-SUBMODULE OF THE ENDOMORPHISM RING. -/

/-- THE ℚ-LINEAR LEIBNIZ-DERIVATION PREDICATE: a ℚ-linear endomorphism `D` of the
    terminal algebra satisfying `D (x · y) = D x · y + x · D y`. Physics-words-
    removable: this is exactly the Leibniz law for the derived product, now over
    the ℚ-linear endomorphisms (so the dimension lives over the field ℚ). -/
def IsDerivQ (D : Module.End ℚ (O ℚ)) : Prop :=
  ∀ x y, D (x * y) = D x * y + x * D y

/-- ★ `Der(O ℚ)` — THE DERIVATION ℚ-SUBMODULE of the endomorphism ring. Carving
    the ℚ-linear derivations out of `Module.End ℚ (O ℚ)` makes
    `Module.finrank ℚ derivationQ` a well-typed natural number — the object the
    exact dimension count is about. The closure laws are the Leibniz law's
    bilinearity (the same trunk reframe as N6's `isDeriv_add`/`isDeriv_smul`); the
    `smul_mem` uses the banked componentwise ℚ-scalar compatibility. -/
def derivationQ : Submodule ℚ (Module.End ℚ (O ℚ)) where
  carrier := { D | IsDerivQ D }
  add_mem' := by
    intro f g hf hg x y
    simp only [LinearMap.add_apply]
    rw [hf x y, hg x y]; simp only [add_mul, mul_add]; abel
  zero_mem' := by intro x y; simp
  smul_mem' := by
    intro c f hf x y
    show (c • f) (x * y) = (c • f) x * y + x * (c • f) y
    simp only [LinearMap.smul_apply]
    rw [hf x y, smul_add, qsmul_mul_left, qsmul_mul_right]

@[simp] theorem mem_derivationQ {D : Module.End ℚ (O ℚ)} :
    D ∈ derivationQ ↔ IsDerivQ D := Iff.rfl

/-- `Der(O ℚ)` is a finite-dimensional ℚ-vector space (a submodule of the
    64-dimensional endomorphism ring). -/
noncomputable instance instFiniteDerivationQ : Module.Finite ℚ derivationQ :=
  inferInstance

/-- ★ THE UPPER FRAME `dim_ℚ Der(O ℚ) ≤ 64`. The derivation algebra is a submodule
    of the 64-dimensional endomorphism ring, so its dimension is bounded by 64.
    (The sharp upper bound `≤ 14` — the so(7)→g₂ cut 21→14 — is the downstream
    W9-prime child N20, never asserted here.) -/
theorem finrank_derivationQ_le : Module.finrank ℚ derivationQ ≤ 64 := by
  have h1 : Module.finrank ℚ derivationQ ≤ Module.finrank ℚ (Module.End ℚ (O ℚ)) :=
    Submodule.finrank_le derivationQ
  rw [finrank_End_eq_64] at h1
  exact h1

/-! ## THE ℤ→ℚ CORRESPONDENCE — `Der(O ℚ)` (N6, over ℤ) lifts into `derivationQ`. -/

/-- Every ℤ-linear endomorphism of the ℚ-vector space `O ℚ` is canonically
    ℚ-linear: a ℤ-linear map between ℚ-vector spaces automatically respects the
    ℚ-action (`map_rat_smul`). This lifts N6's `Der(O ℚ) ⊆ Module.End ℤ (O ℚ)`
    into `Module.End ℚ (O ℚ)`. -/
noncomputable def toEndQ (D : Module.End ℤ (O ℚ)) : Module.End ℚ (O ℚ) where
  toFun := D
  map_add' := D.map_add
  map_smul' := fun q x => map_rat_smul D q x

@[simp] theorem toEndQ_apply (D : Module.End ℤ (O ℚ)) (x : O ℚ) :
    toEndQ D x = D x := rfl

/-- ★ AN ℤ-DERIVATION LIFTS TO A ℚ-DERIVATION: `IsDeriv D → IsDerivQ (toEndQ D)`.
    The ℚ-linear derivations capture ALL of N6's `Der(O ℚ)` — the Leibniz law is
    the same equation, only the linearity is upgraded ℤ → ℚ. -/
theorem toEndQ_isDerivQ (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) :
    IsDerivQ (toEndQ D) := fun x y => hD x y

/-- An ℤ-derivation, lifted, is a member of `derivationQ`. -/
theorem toEndQ_mem (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) :
    toEndQ D ∈ derivationQ := toEndQ_isDerivQ D hD

/-! ## ANTI-VACUITY (docs/RUNBOOK.md W8) — `Der(O ℚ)` is non-trivial, so its
    dimension is a genuine positive number. -/

/-- THE BANKED NONZERO WITNESS (N6 `witnessDeriv = innerDeriv e₂`) as a ℚ-linear
    derivation. -/
noncomputable def witnessDerivQ : Module.End ℚ (O ℚ) := toEndQ witnessDeriv

/-- `witnessDerivQ` is a ℚ-linear derivation. -/
theorem witnessDerivQ_isDerivQ : IsDerivQ witnessDerivQ :=
  toEndQ_isDerivQ witnessDeriv witnessDeriv_isDeriv

/-- `witnessDerivQ` is a member of `derivationQ`. -/
theorem witnessDerivQ_mem : witnessDerivQ ∈ derivationQ :=
  witnessDerivQ_isDerivQ

/-- ★ `witnessDerivQ` IS NONZERO — the banked N6 nonvanishing transported to the
    ℚ-linear setting. The derivation submodule has teeth (it is not `⊥`). -/
theorem witnessDerivQ_ne_zero : witnessDerivQ ≠ 0 := by
  intro h
  apply witnessDeriv_ne_zero
  refine LinearMap.ext (fun x => ?_)
  have hx := congrArg (fun (D : Module.End ℚ (O ℚ)) => D x) h
  simp only [witnessDerivQ, toEndQ_apply, LinearMap.zero_apply] at hx
  rw [LinearMap.zero_apply]
  exact hx

/-- ★ `Der(O ℚ)` IS NOT THE TRIVIAL SUBMODULE — it contains the nonzero witness. -/
theorem derivationQ_ne_bot : derivationQ ≠ ⊥ := by
  intro h
  apply witnessDerivQ_ne_zero
  have hmem : witnessDerivQ ∈ derivationQ := witnessDerivQ_mem
  rw [h] at hmem
  exact (Submodule.mem_bot ℚ).mp hmem

/-- ★★ THE LOWER FRAME `0 < dim_ℚ Der(O ℚ)`. The derivation algebra is non-trivial
    (it contains the banked nonzero witness), so its dimension is a genuine
    positive number — NOT the zero algebra. Together with `finrank_derivationQ_le`
    this pins the well-typed bounds `1 ≤ dim_ℚ Der(O ℚ) ≤ 64`; the exact value 14
    (the so(7)→g₂ cut) is the downstream child N20. -/
theorem finrank_derivationQ_pos : 0 < Module.finrank ℚ derivationQ := by
  have hnt : Nontrivial derivationQ :=
    (Submodule.nontrivial_iff_ne_bot).mpr derivationQ_ne_bot
  exact (Module.finrank_pos_iff_of_free ℚ (M := derivationQ)).mpr hnt

end Phys.Algebra
