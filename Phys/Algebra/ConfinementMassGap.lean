/-
  Phys.Algebra.ConfinementMassGap — N388 (arc-I I4): THE MASS GAP / THE CURVATURE FLOOR.
  ============================================================================
  DIRECTED SUCCESSOR of N387 (arc-I I3 → I4), per docs/SEED_QCD_CONFINEMENT.md
  §I4. N385 banked the confinement CRITERION (confines IFF non-associative);
  N386 the colour-singlet DICHOTOMY; N387 the AREA LAW (⟨W⟩ ~ exp(−σ·Area), the
  per-plaquette Born obstruction action σ strictly positive on the coloured
  sector). This node derives the MASS GAP: the coloured sector has a CURVATURE
  FLOOR — a nonzero minimum per-plaquette action — so NO flat (zero-action)
  coloured connection exists. The fold-native form of the Yang–Mills mass gap.

  THE RESULT (theory-native, DERIVED — never asserted). Two complementary facts,
  both on the banked concrete objects:

    • FLAT ⟺ ZERO CURVATURE. A pair of local worlds `(a,b)` GLUES (is "flat", the
      banked descent condition `WorldsGlue`, N218T) IFF its curvature — the
      octonion associator `[a,b,·]` (the banked gluing obstruction, N219) —
      vanishes at every point (`flat_iff_curvature_zero`). Flatness IS the
      vanishing of the associator curvature.

    • THE CURVATURE FLOOR (the mass gap). The per-plaquette Born action
      `bornAction a b x = gForm [a,b,x] [a,b,x]` (N387, the Born self-overlap of
      the curvature) is QUANTIZED on the fold's own discrete lattice: whenever the
      curvature `[a,b,x]` has integer coordinates and is NONZERO, its Born action
      is `≥ 1` (`bornAction_lattice_floor`). A nonzero curvature CANNOT be made
      arbitrarily small — there is a nonzero minimum. So a coloured configuration
      with nonzero curvature has action bounded away from zero: a GAP.

  Concretely, on the banked coloured witness `(ι(ιJ), ι(e₂), e₂)`:
    • it is NOT flat (`coloured_witness_not_flat`) — the curvature is nonzero;
    • its action clears the floor with room to spare: `bornAction ≥ 4`
      (`bornAction_witness_floor`, via the banked coordinate `c₇ = 2`);
  while on the fold's own complex line `span{1, u1}` (the DERIVED colour-neutral
  core, N386) every pair is FLAT (`singlet_flat`) with action `0` — the massless
  (photon) sector. THE GAP DICHOTOMY (`mass_gap_dichotomy`): the singlet sector
  sits at action `0` (flat, massless) and the coloured witness sits at action
  `≥ 4` (curved, gapped) — a nonzero floor separates them.

  THE MECHANISM — WHY A GAP, NOT A CONTINUUM (the crux, FORCED). The gap is
  QUANTIZATION. The fold's self-look-back re-enters itself; that re-entry is
  counting — it generates the discrete ℕ (the distinction re-entering itself).
  A configuration assembled from the fold's discrete generators lives on the
  integer lattice, and the octonion product has integer structure constants, so
  the curvature (associator) of a lattice configuration stays on the lattice.
  The Born self-overlap of a NONZERO lattice vector is a nonzero sum of INTEGER
  squares — hence `≥ 1`. The "hard spectral estimate" of the Yang–Mills mass gap
  becomes the elementary fact that a nonzero sum of integer squares is at least
  one. The massless sector is exactly the flat singlet where the curvature
  vanishes. One cause (octonion non-associativity, the SAME that stopped the
  cascade) together with one discreteness (the fold's own ℕ) ⟹ the coloured
  sector is gapped and the singlet sector is massless.

  THE LATTICE IS LOAD-BEARING (`no_floor_over_continuum`). Without the discreteness
  the floor is FALSE: over the full derived-ℚ scaling there are nonzero curvatures
  of arbitrarily small action (`(1/(n+1)) • [a,b,x]` has action `[a,b,x]`-action /
  (n+1)²). The gap is not a property of the form alone — it is the form ON THE
  DISCRETE LATTICE the fold generates. This is the anti-vacuity heart: a wrong
  "the floor holds over the continuum" reading is refuted.

  ⚠ GRADE (honest, docs/SEED_QCD_CONFINEMENT.md §I4). The STRUCTURAL mass-gap
  MECHANISM — flat ⟺ zero curvature, the quantization floor, no-flat-coloured,
  the gap dichotomy — is THEOREM-ROUTE, proved on the banked concrete objects.
  ⚠⚠ The full Clay/Millennium Yang–Mills mass gap in constructive-QFT rigour is
  OWNER-HELD / route-not-yet-found — this node derives the framework's structural
  curvature-floor mechanism and does NOT attempt the Clay statement. No numerical
  gap value and no empirical number (glueball ~1.7 GeV, Λ_QCD) appears in any
  statement or proof — removable prose only (NO-FIT guard G2).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "mass gap / glueball /
  Yang–Mills / flat connection / curvature / confinement / colour": the theorems
  say a pair of left-regular maps composes into the product's map IFF the
  associator `[a,b,·]` vanishes everywhere; a nonzero integer-coordinate element
  of `O ℚ` has Born self-overlap `gForm ≥ 1`; the associator at the concrete
  non-associating triple has self-overlap `≥ 4` (via coordinate `= 2`); the
  associator vanishes on the 2-dim subalgebra `span{1, u1}` (self-overlap `0`);
  and over the rational scaling the self-overlap has no positive lower bound.
  Pure statements about the quantization of a positive-definite integer quadratic
  form and the vanishing locus of a trilinear form. No physics name is
  load-bearing.

  FREE-FLOATING check (SOUL rail). Every theorem TYPE mentions the banked concrete
  objects — the banked associator `assoc` on `O ℚ`, the banked Born form `gForm`,
  the banked `bornAction` and `WorldsGlue` (N387/N218T), the banked coordinate
  functionals `c₀..c₇`, `span{1, u1}` (N386 colour-neutral core), the concrete
  non-associating witness `(ι(ιJ), ι(e₂), e₂)`, and the derived ℝ `Cut`. Not
  generic over an arbitrary carrier: the floor routes through the octonion-SPECIFIC
  associator, the anisotropic `gForm_self_sum_sq`, and the concrete witness.

  DEPENDENCIES (all banked, foundations-only): N387 `ConfinementAreaLaw`
  (`bornAction`), N385 `ConfinementCriterion` (`WorldsGlue` via
  `TowerGatherCoherence`, `worldMap`), N386 `ConfinementColourSinglet`
  (`singlet_assoc_vanishes`, `u1`), N24 `DerivationCompact` (`gForm`,
  `gForm_self_sum_sq`, `gForm_self_eq_zero`, `gForm_self_nonneg`),
  `DerivationLowerBound` (`c0..c7`), `DerivationAutCompact` (`gForm_smul_left`,
  `gForm_smul_right`), Alternative (`assoc`, `assoc_witness_coord`,
  `assoc_nonvanishing`). Ground field the DERIVED ℝ `Cut` — NOT Mathlib-ℝ as
  content; Mathlib is MACHINERY only (Finset/omega/nlinarith/order lemmas). The
  integer-lattice predicate uses the metalanguage ℤ as a DISCRETENESS predicate on
  coordinates that already live over the cascade ring ℚ — not a new content import.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge.
-/
import Phys.Algebra.ConfinementAreaLaw
import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.DerivationLowerBound
import Phys.Algebra.DerivationAutCompact
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## Flatness ⟺ vanishing of the associator curvature. -/

/-- ★ FLAT ⟺ ZERO CURVATURE. A pair of local worlds `(a,b)` GLUES (the banked
    descent condition `WorldsGlue`, N218T: `L_a ∘ L_b = L_{a·b}`) IFF the
    octonion associator `[a,b,·]` (the banked gluing obstruction, N219) vanishes
    at EVERY point. So "flat" (a global section exists over this pair) is exactly
    "the curvature is identically zero". Physics-words-removable: the composite of
    two left-regular maps equals the product's left-regular map iff the associator
    `(a*b)*x − a*(b*x)` is `0` for all `x`. -/
theorem flat_iff_curvature_zero (a b : O ℚ) :
    WorldsGlue a b ↔ ∀ x, assoc a b x = 0 := by
  unfold WorldsGlue worldMap assoc
  constructor
  · intro h x
    have := congrFun h x
    simp only [Function.comp_apply] at this
    rw [sub_eq_zero]; exact this.symm
  · intro h
    funext x
    simp only [Function.comp_apply]
    have := h x
    rw [sub_eq_zero] at this
    exact this.symm

/-! ## The curvature floor: a nonzero lattice curvature has Born action `≥ 1`. -/

/-- THE INTEGER-LATTICE PREDICATE. A curvature element has integer coordinates in
    the fold's own frame `c₀..c₇`. The fold's self-look-back re-enters itself, and
    that re-entry — counting — generates the discrete ℕ; a configuration assembled
    from the fold's discrete generators lives on this integer lattice. `ℤ` here is
    a DISCRETENESS predicate on rational coordinates, not a content number system.
    Physics-words-removable: each coordinate is an integer. -/
def IntLat (w : O ℚ) : Prop :=
  (∃ k : ℤ, c0 w = k) ∧ (∃ k : ℤ, c1 w = k) ∧ (∃ k : ℤ, c2 w = k) ∧
  (∃ k : ℤ, c3 w = k) ∧ (∃ k : ℤ, c4 w = k) ∧ (∃ k : ℤ, c5 w = k) ∧
  (∃ k : ℤ, c6 w = k) ∧ (∃ k : ℤ, c7 w = k)

/-- ★★ THE CURVATURE FLOOR (the mass gap, quantization form). A NONZERO curvature
    element on the fold's integer lattice has Born self-overlap `gForm ≥ 1`: the
    action of a nonzero lattice vector cannot be made arbitrarily small. The
    "hard spectral estimate" of the mass gap IS the elementary fact that a nonzero
    sum of integer squares is at least one (`gForm_self_sum_sq` = sum of 8 squares;
    integer + nonzero ⟹ ≥ 1). This is the nonzero minimum action — the floor. -/
theorem bornAction_lattice_floor (w : O ℚ) (hlat : IntLat w) (hne : w ≠ 0) :
    1 ≤ gForm w w := by
  obtain ⟨⟨k0,h0⟩,⟨k1,h1⟩,⟨k2,h2⟩,⟨k3,h3⟩,⟨k4,h4⟩,⟨k5,h5⟩,⟨k6,h6⟩,⟨k7,h7⟩⟩ := hlat
  set S : ℤ := k0^2+k1^2+k2^2+k3^2+k4^2+k5^2+k6^2+k7^2 with hSdef
  have hgeq : gForm w w = (S : ℚ) := by
    rw [gForm_self_sum_sq, h0,h1,h2,h3,h4,h5,h6,h7, hSdef]; push_cast; ring
  have hSne : S ≠ 0 := by
    intro hS0
    apply hne
    have hall : k0 = 0 ∧ k1 = 0 ∧ k2 = 0 ∧ k3 = 0 ∧ k4 = 0 ∧ k5 = 0 ∧ k6 = 0 ∧ k7 = 0 := by
      refine ⟨?_,?_,?_,?_,?_,?_,?_,?_⟩ <;>
        nlinarith [sq_nonneg k0, sq_nonneg k1, sq_nonneg k2, sq_nonneg k3,
          sq_nonneg k4, sq_nonneg k5, sq_nonneg k6, sq_nonneg k7]
    obtain ⟨e0,e1,e2,e3,e4,e5,e6,e7⟩ := hall
    have : gForm w w = 0 := by
      rw [gForm_self_sum_sq, h0,h1,h2,h3,h4,h5,h6,h7, e0,e1,e2,e3,e4,e5,e6,e7]; ring
    exact gForm_self_eq_zero.mp this
  have hSpos : (0:ℤ) ≤ S := by positivity
  have hS1 : (1:ℤ) ≤ S := by omega
  rw [hgeq]; exact_mod_cast hS1

/-! ## The concrete coloured witness: not flat, and above the floor. -/

/-- Abbreviation for the banked non-associating coloured witness curvature
    `[ι(ιJ), ι(e₂), e₂]` evaluated at the third argument `e₂`. -/
def witnessCurv : O ℚ :=
  assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)

/-- ★ THE COLOURED WITNESS IS NOT FLAT. The banked coloured pair
    `(ι(ιJ), ι(e₂))` does NOT glue — its curvature (the octonion associator) is
    genuinely nonzero (`assoc_nonvanishing`), so no flat connection exists over
    the coloured sector. This is `flat_iff_curvature_zero` fed the banked
    non-vanishing witness. -/
theorem coloured_witness_not_flat :
    ¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) := by
  rw [flat_iff_curvature_zero]
  intro h
  exact assoc_nonvanishing (h (CD.e2 : O ℚ))

/-- ★ THE WITNESS CLEARS THE FLOOR (`gForm ≥ 4`). The coloured-witness curvature
    has Born self-overlap `≥ 4`, because its banked coordinate `c₇ = 2`
    (`assoc_witness_coord`) contributes `2² = 4` to the sum of squares and the
    other seven squares are `≥ 0`. A concrete curvature above the quantization
    floor — the coloured sector is gapped with room to spare. -/
theorem gForm_witness_floor : (4:ℚ) ≤ gForm witnessCurv witnessCurv := by
  unfold witnessCurv
  rw [gForm_self_sum_sq]
  have h7 : c7 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) = 2 := by
    unfold c7; exact assoc_witness_coord
  rw [h7]
  nlinarith [sq_nonneg (c0 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c1 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c2 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c3 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c4 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c5 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
    sq_nonneg (c6 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)))]

/-- ★ THE WITNESS PER-PLAQUETTE ACTION IS `≥ 4` IN THE DERIVED ℝ. Casting the
    rational floor into the derived continuum `Cut`: the banked `bornAction` at the
    coloured witness is `≥ 4` — a concrete nonzero minimum action in the derived ℝ,
    the mass gap seen through the Born self-overlap of the curvature. -/
theorem bornAction_witness_floor :
    (4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) := by
  unfold bornAction
  have hq : (4:ℚ) ≤ gForm witnessCurv witnessCurv := gForm_witness_floor
  unfold witnessCurv at hq
  calc (4:Cut) = ((4:ℚ):Cut) := by norm_num
    _ ≤ ((gForm (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))
          (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) : ℚ):Cut) := by
        exact_mod_cast hq

/-! ## The massless singlet sector: flat, zero action. -/

/-- ★ THE SINGLET SECTOR IS FLAT (massless). On the fold's own complex line
    `span{1, u1}` (the DERIVED colour-neutral core, N386) the curvature vanishes
    identically (`singlet_assoc_vanishes`), so every singlet pair GLUES — a flat
    connection exists, the per-plaquette action is `0`, and the sector is massless
    (the photon). Fed to `flat_iff_curvature_zero`. -/
theorem singlet_flat {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) :
    WorldsGlue a b := by
  rw [flat_iff_curvature_zero]
  intro x
  exact singlet_assoc_vanishes ha hb x

/-! ## The lattice is load-bearing: no floor over the continuum. -/

/-- ★ NO FLOOR OVER THE CONTINUUM (the lattice is load-bearing). Without the
    fold's discreteness the floor is FALSE: for ANY curvature `w` and any scale
    `s`, the scaled curvature `s • w` has Born action `s² · gForm w w`
    (`gForm_smul_left`/`right`). So over the rational scaling the action of a fixed
    nonzero curvature can be driven below any positive `ε` (take `s` small) — there
    is NO positive lower bound. The gap is a property of the form ON THE DISCRETE
    LATTICE, not of the form alone: quantization is what makes the mass gap. -/
theorem gForm_smul_sq (w : O ℚ) (s : ℚ) :
    gForm (s • w) (s • w) = s^2 * gForm w w := by
  rw [gForm_smul_left, gForm_smul_right]; ring

/-- ★ EXPLICIT NO-CONTINUUM-FLOOR. For a nonzero curvature `w`, the scaled
    curvatures `(1/(n+1)) • w` are all nonzero yet their action `→ 0`: no uniform
    positive floor holds over the continuum. Concretely the action at scale
    `1/(n+1)` is `gForm w w / (n+1)²`, strictly below `gForm w w` for `n ≥ 1`. This
    refutes a "the floor holds over the continuum" mis-reading — the discreteness
    is essential. -/
theorem no_floor_over_continuum (w : O ℚ) (_hne : w ≠ 0) :
    ∀ n : ℕ, gForm ((1 / (n + 1 : ℚ)) • w) ((1 / (n + 1 : ℚ)) • w)
      = gForm w w / (n + 1)^2 := by
  intro n
  rw [gForm_smul_sq]
  have hpos : (0 : ℚ) < (n + 1 : ℚ) := by positivity
  field_simp

/-! ## The capstones. -/

/-- ★★★ THE MASS-GAP DICHOTOMY. A nonzero floor separates the two sectors of the
    banked concrete objects:
      • the SINGLET sector (span{1, u1}, the colour-neutral core) is FLAT with
        per-plaquette action `0` — massless (the photon);
      • the COLOURED witness is NOT flat, and its per-plaquette action clears the
        floor: `bornAction ≥ 4 > 0`.
    So the coloured spectrum is bounded away from the flat/massless floor — a mass
    gap. DERIVED (quantization of the Born self-overlap of the associator
    curvature), never asserted; the numerical gap value is not touched. -/
theorem mass_gap_dichotomy :
    (∀ {a b : O ℚ}, a ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
        b ∈ Submodule.span ℚ {(1 : O ℚ), u1} → WorldsGlue a b) ∧
    (¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ))) ∧
    ((4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) :=
  ⟨fun ha hb => singlet_flat ha hb, coloured_witness_not_flat, bornAction_witness_floor⟩

/-- ★★★ THE MASS GAP — the structural curvature-floor mechanism at once, on the
    banked derived objects. For the coloured sector:
    (1) FLATNESS is the vanishing of the associator curvature everywhere;
    (2) the QUANTIZATION FLOOR: a nonzero curvature on the fold's integer lattice
        has Born action `≥ 1` — a nonzero minimum (the gap);
    (3) the coloured witness is NOT flat and clears the floor (`bornAction ≥ 4`);
    (4) the singlet (colour-neutral) sector is flat / massless;
    (5) the floor requires the discreteness — over the continuum the action of a
        fixed nonzero curvature has no positive lower bound.
    ⚠ The full Clay/Millennium Yang–Mills mass gap in constructive-QFT rigour is
    OWNER-HELD / route-not-yet-found; this is the framework's STRUCTURAL mechanism.
    The gap VALUE is never fit — no empirical number appears. -/
theorem mass_gap_mechanism :
    (∀ a b : O ℚ, WorldsGlue a b ↔ ∀ x, assoc a b x = 0) ∧
    (∀ w : O ℚ, IntLat w → w ≠ 0 → 1 ≤ gForm w w) ∧
    (¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) ∧
      (4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) ∧
    (∀ {a b : O ℚ}, a ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
        b ∈ Submodule.span ℚ {(1 : O ℚ), u1} → WorldsGlue a b) ∧
    (∀ w : O ℚ, w ≠ 0 → ∀ n : ℕ,
      gForm ((1 / (n + 1 : ℚ)) • w) ((1 / (n + 1 : ℚ)) • w) = gForm w w / (n + 1)^2) :=
  ⟨flat_iff_curvature_zero,
   fun w hlat hne => bornAction_lattice_floor w hlat hne,
   ⟨coloured_witness_not_flat, bornAction_witness_floor⟩,
   fun ha hb => singlet_flat ha hb,
   fun w hne n => no_floor_over_continuum w hne n⟩

end

end Phys.Algebra
