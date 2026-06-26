/-
  Phys.Algebra.LorentzIsometry — N45: THE ISOMETRY STRUCTURE of the Born determinant form
  on the self-adjoint 2×2 matrices over the terminal algebra — the transformations preserving
  the banked Lorentzian (1,9) form, DERIVED as the `Qform`-preserving structure.
  ===========================================================================
  THE NEXT FORCED NODE after the spacetime-signature node (N43) and the chirality block (N44).
  N43 banked the Born determinant form `Qv (t,x,v) = t² − x² − gForm v v` on the coordinate space
  `STV = ℚ × ℚ × O ℚ`, with Sylvester signature `(1, 9)` (`signature_one_nine`). This module banks
  the natural NEXT structure that form forces: the linear transformations that PRESERVE it — the
  isometry structure of the `(1,9)` form. NOT a posited Lorentz group / `O(1,9)`; the preservers
  are DERIVED, and the structure is shown NON-TRIVIAL and honestly Lorentzian (it contains a
  genuine hyperbolic boost mixing the time and space directions).

  THE TRUNK INPUT. Two banked facts carry every isometry here, with NO matrix determinant and NO
  Mathlib ℝ/ℂ:
    (1) The HYPERBOLIC structure of the `t² − x²` block: a rational point `(a, b)` on the unit
        hyperbola `a² − b² = 1` gives a shear `(t, x) ↦ (a t + b x, b t + a x)` preserving
        `t² − x²` by PURE ℚ RING ARITHMETIC. This is the boost — the non-compact, time-mixing
        Lorentz transformation, here forced from the indefinite SIGN of the banked form, not posited.
    (2) The BORN MULTIPLICATIVITY of the space block: the banked `Nrm_mul_on_O`
        (`Phys/Cascade/ForcedStop.lean`: `Nrm (x·y) = Nrm x · Nrm y`, the composition law surviving
        at the last associative rung `𝕆`) gives the gForm COMPOSITION LAW
        `gForm (u·v) (u·v) = gForm u u · gForm v v` (`gForm_comp`), so left-multiplication by a
        UNIT `u` (`gForm u u = 1`) preserves `gForm v v` — a rotation of the nine space directions.

  WHY NOT THE MATRIX `M ↦ A M A†` ROUTE (the W1 reframe). The natural-looking object is the
  `SL(2,𝕆)`-style action `M ↦ A M A†` on the `herm2` carrier with `det(A M A†) = |det A|² det M`.
  But over the NON-ASSOCIATIVE `O ℚ` the matrix-product determinant multiplicativity
  `det(AB) = det A · det B` FAMOUSLY FAILS for general matrices, and a genuine boost matrix needs
  IRRATIONAL entries (the derived ℝ). That is the HEAVY connection (the `SL(2,𝕆) ↠ SO⁺(1,9)` cover,
  the general det-multiplicativity), childed onto the chain tail. The isometry STRUCTURE of `Qv`
  itself does NOT need it: the preservers form a submonoid, and the boost / rotation generators are
  pure ring arithmetic + the banked Born multiplicativity — the difficulty DISSOLVES when attacked
  from the trunk (the form and its sign) rather than from the non-associative matrix determinant.

  THE DERIVATION (each a theorem, foundations-only, forward from banked objects):
    IsQvIsom            — the isometry predicate `∀ p, Qv (T p) = Qv p`.
    isQvIsom_id / _comp — id and composition preserve `Qv` (closure).
    qvIsomMonoid        — ★ THE STRUCTURE: the `Qv`-preservers as a `Submonoid (STV →ₗ[ℚ] STV)`.
    boost / boost_isom  — ★★ THE BOOST: `(t,x,v) ↦ (a t + b x, b t + a x, v)` with `a² − b² = 1`
                          preserves `Qv`, by pure ℚ ring arithmetic (the indefinite sign).
    boost_mem           — the boost lives in the isometry monoid.
    boost_ne_id / _mixes — ★ NON-TRIVIALITY (W8 teeth): a boost with `b ≠ 0` is NOT the identity and
                          genuinely mixes time and space — the structure is strictly larger than `{id}`
                          and honestly Lorentzian (a non-compact direction).
    gForm_comp          — ★ THE BORN COMPOSITION LAW, from the banked `Nrm_mul_on_O`.
    rot / rot_isom      — ★ A SPACE ROTATION: `(t,x,v) ↦ (t, x, u·v)` with `gForm u u = 1` preserves
                          `Qv` (preserving the nine space directions), via `gForm_comp`.
    rot_mem             — the rotation lives in the isometry monoid.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That `H₂(𝕆)` carries an `SO(1,9)` action is
  standard (Sudbery, Manogue–Dray, Baez). Here the isometry structure is DERIVED from the banked
  Lorentzian form (N43) + the banked Born multiplicativity (the cascade's own composition law) — NO
  posited Lorentz group, NO Mathlib ℝ/ℂ as content (the whole development is over the cascade ground
  ring ℚ; the boost is a rational hyperbola point, the rotation a Born-unit). The non-compact boost
  is FORCED by the indefinite sign of the banked form, not chosen.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / isometry /
  spacetime / time / space / spin": what remains is the theorem that the ℚ-linear self-maps of
  `ℚ × ℚ × O ℚ` preserving the quadratic form `t² − x² − gForm v v` form a submonoid of the
  endomorphism monoid, which is strictly larger than `{id}` because the shear
  `(t,x,v) ↦ (a t + b x, b t + a x, v)` with `a² − b² = 1` preserves the form by ring arithmetic, and
  also contains the maps `(t,x,v) ↦ (t,x,u·v)` for any `u` with `gForm u u = 1` (Born composition).
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.SpacetimeSignature
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The isometry predicate and the isometry monoid. -/

/-- THE ISOMETRY PREDICATE for the banked Born determinant form `Qv` on `STV = ℚ × ℚ × O ℚ`:
    a ℚ-linear self-map `T` is a `Qv`-isometry iff `Qv (T p) = Qv p` for all `p`. -/
def IsQvIsom (T : STV →ₗ[ℚ] STV) : Prop := ∀ p : STV, Qv (T p) = Qv p

/-- The identity preserves `Qv`. -/
theorem isQvIsom_id : IsQvIsom (LinearMap.id) := fun _ => rfl

/-- A composite of two `Qv`-isometries is a `Qv`-isometry (the structure is closed under `∘`). -/
theorem isQvIsom_comp {S T : STV →ₗ[ℚ] STV} (hS : IsQvIsom S) (hT : IsQvIsom T) :
    IsQvIsom (S.comp T) := by
  intro p
  show Qv (S (T p)) = Qv p
  rw [hS (T p), hT p]

/-- ★ THE ISOMETRY STRUCTURE: the `Qv`-preserving ℚ-linear maps form a submonoid of the
    endomorphism monoid `(STV →ₗ[ℚ] STV)` under composition. The `O(1,9)` isometry structure of
    the banked Lorentzian form, DERIVED — not a posited Lorentz group. -/
def qvIsomMonoid : Submonoid (Module.End ℚ STV) where
  carrier := {T | IsQvIsom T}
  one_mem' := isQvIsom_id
  mul_mem' hS hT := isQvIsom_comp hS hT

@[simp] theorem mem_qvIsomMonoid {T : Module.End ℚ STV} :
    T ∈ qvIsomMonoid ↔ IsQvIsom T := Iff.rfl

/-! ## THE BOOST — the non-compact, time-mixing generator from the indefinite sign. -/

/-- THE RATIONAL HYPERBOLIC BOOST in the time–space plane:
    `(t, x, v) ↦ (a t + b x, b t + a x, v)`, leaving the nine space directions `v` fixed.
    ℚ-linear by construction. -/
def boost (a b : ℚ) : STV →ₗ[ℚ] STV where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by
    simp only [Prod.fst_add, Prod.snd_add]
    ext <;> simp <;> ring
  map_smul' c p := by
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, RingHom.id_apply]
    ext <;> simp <;> ring

/-- ★★ THE BOOST IS A `Qv`-ISOMETRY when `(a, b)` is a rational point on the unit hyperbola
    `a² − b² = 1`. The space block `v` is untouched; the `t² − x²` block is preserved by PURE ℚ
    RING ARITHMETIC — the indefinite SIGN of the banked form (the source of the `(1,9)` signature)
    is exactly what a hyperbolic shear, not a circular rotation, preserves. No octonion product, no
    matrix determinant, no ℝ. -/
theorem boost_isom {a b : ℚ} (h : a^2 - b^2 = 1) : IsQvIsom (boost a b) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  show Qform _ _ _ = Qform _ _ _
  unfold boost Qform
  simp only [LinearMap.coe_mk, AddHom.coe_mk]
  linear_combination (t^2 - x^2) * h

/-- The boost with `a² − b² = 1` lives in the isometry monoid. -/
theorem boost_mem {a b : ℚ} (h : a^2 - b^2 = 1) : boost a b ∈ qvIsomMonoid :=
  boost_isom h

/-- ★ NON-TRIVIALITY (W8 teeth): a boost with `b ≠ 0` is NOT the identity — it sends the pure-time
    vector `(1, 0, 0)` to `(a, b, 0)` with nonzero space component `b`. The isometry structure is
    STRICTLY larger than `{id}`: it contains a genuine time–space-mixing (non-compact) element. -/
theorem boost_ne_id {a b : ℚ} (hb : b ≠ 0) : boost a b ≠ LinearMap.id := by
  intro hcontra
  have := congrArg (fun T => (T ((1 : ℚ), (0 : ℚ), (0 : O ℚ))).2.1) hcontra
  simp only [boost, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.id_coe, id_eq] at this
  -- this : b * 1 + a * 0 = 0
  rw [mul_one, mul_zero, add_zero] at this
  exact hb this

/-- ★ THE BOOST GENUINELY MIXES TIME AND SPACE: the pure-time vector `(1, 0, 0)` is sent to
    `(a, b, 0)`, acquiring a space component `b`. With `b ≠ 0` this is a nonzero space component —
    the honest hallmark of a Lorentz boost (a non-compact direction), not a space rotation. -/
theorem boost_mixes_time_space (a b : ℚ) :
    boost a b ((1 : ℚ), (0 : ℚ), (0 : O ℚ)) = (a, b, (0 : O ℚ)) := by
  show (a * 1 + b * 0, b * 1 + a * 0, _) = _
  simp

/-! ## THE BORN COMPOSITION LAW and a SPACE ROTATION generator. -/

/-- ★ THE gForm COMPOSITION LAW, derived from the banked Born multiplicativity `Nrm_mul_on_O`
    (the composition law surviving at the last associative rung `𝕆`): the Born self-overlap of a
    product is the product of the self-overlaps. `gForm (u·v) (u·v) = gForm u u · gForm v v`. -/
theorem gForm_comp (x y : O ℚ) : gForm (x * y) (x * y) = gForm x x * gForm y y := by
  have hnrm := Nrm_mul_on_O x y          -- Nrm (x*y) = Nrm x * Nrm y  (in H ℚ)
  have key : ∀ z : O ℚ, gForm z z = (CD.Nrm z).re.re := fun z => rfl
  have hsm : ∀ z : O ℚ, CD.Nrm z = (gForm z z) • (1 : H ℚ) := by
    intro z
    have h := selfMul_eq_smul z          -- z * star z = (gForm z z) • (1 : O ℚ)
    show (z * star z).re = _
    rw [h]; rfl
  rw [key, hnrm, hsm x, hsm y, smul_mul_smul_comm, mul_one]
  simp only [cd_qsmul_re, Dbl.smul_re]
  show gForm x x * gForm y y * (1 : ℚ) = _
  ring

/-- A SPACE ROTATION generator: `(t, x, v) ↦ (t, x, u·v)`, left-multiplying the nine space
    directions by a fixed `u`, leaving the time–space `(t, x)` block fixed. ℚ-linear (the banked
    distributivity / scalar laws of the terminal product). -/
def rot (u : O ℚ) : STV →ₗ[ℚ] STV where
  toFun p := (p.1, p.2.1, u * p.2.2)
  map_add' p q := by
    apply Prod.ext
    · rfl
    apply Prod.ext
    · rfl
    · exact CD.mul_add_na u p.2.2 q.2.2
  map_smul' c p := by
    apply Prod.ext
    · rfl
    apply Prod.ext
    · rfl
    · exact qsmul_mul_right c u p.2.2

/-- ★ THE SPACE ROTATION IS A `Qv`-ISOMETRY when `u` is a Born-unit (`gForm u u = 1`): the
    `(t, x)` block is untouched, and the space block `gForm (u·v) (u·v) = gForm u u · gForm v v =
    gForm v v` is preserved by the banked Born composition law — a norm-preserving rotation of the
    nine space directions. -/
theorem rot_isom {u : O ℚ} (hu : gForm u u = 1) : IsQvIsom (rot u) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  show Qform _ _ _ = Qform _ _ _
  unfold rot Qform
  simp only [LinearMap.coe_mk, AddHom.coe_mk]
  rw [gForm_comp, hu, one_mul]

/-- A Born-unit space rotation lives in the isometry monoid. -/
theorem rot_mem {u : O ℚ} (hu : gForm u u = 1) : rot u ∈ qvIsomMonoid :=
  rot_isom hu

end

end Phys.Algebra
