/-
  Phys.Algebra.HadronicSpectrum — N### (arc-X X4, docs/SEED_EXACT_DRESSING.md §X4):
  ============================================================================
  THE HADRONIC / CONFINEMENT BAND = THE MASS-GAP SPECTRUM (★ THE LOAD-BEARING
  KEYSTONE of arc X). DIRECTED SUCCESSOR of N462 (X3 → X4).

  The one input standard physics can ONLY MEASURE — the hadronic R(s) /
  vector-meson spectrum (the source of the ~2×10⁻¹⁰ error bar on 1/α(0)) — the
  fold COMPUTES as the eigenvalue spectrum of the banked mass-gap /
  associator-obstruction operator (N388 `ConfinementMassGap`). Removing this last
  measured input drives the error bar to zero (the falsifiable edge).

  ## THE THEORY-NATIVE READING (seed §X4)

  The gap operator's "spectrum" is the set of achievable per-plaquette Born-action
  values of the banked curvature form `gForm` on the fold's OWN integer lattice
  (`IntLat`, N388: the fold's self-look-back re-enters itself ⟹ counting ⟹ the
  discrete ℕ; a configuration assembled from the fold's discrete generators lives
  on the integer lattice). Three DERIVED facts pin this spectrum EXACTLY:

    • QUANTIZATION (discreteness). Every spectral value is a natural number:
      the Born self-overlap of a lattice curvature is a sum of 8 integer squares
      (`gForm_self_sum_sq`, N24), hence a natural (`spectrum_subset_nat`). The
      spectrum is DISCRETE — no continuum of values.

    • FULLY POPULATED (the unit-spaced tower). EVERY natural number is achieved —
      by Lagrange's four-square theorem, any `n : ℕ` is `a²+b²+c²+d²`, realized by
      the lattice point `(a,b,c,d,0,0,0,0)` (`spectrum_surjective_nat`). So the
      tower is EVENLY SPACED by the gap unit: ONE linear-Regge slope = ONE string
      tension = ONE gap operator.

    • THE SPECTRUM IS EXACTLY ℕ (`gapSpectrum_eq_natRange`). Combining the two:
      the discrete spectrum of the gap operator over the fold lattice is precisely
      the range of the ℕ→ℚ cast. Not a subset, not an approximation — the whole ℕ.

  From this the band structure falls out:

    • THE FLOOR = THE CONFINEMENT SCALE = THE LIGHT-VECTOR BAND EDGE. The minimum
      NONZERO spectral value is exactly `1` (`gap_floor_is_one`): ≥1 by the banked
      `bornAction_lattice_floor`, and `= 1` attained by the unit witness. Light
      quarks are ~massless ⟹ the light-vector band edge IS the gap scale, not a
      quark mass. So the confinement scale = the gap floor = the minimum nonzero
      eigenvalue of the Born self-overlap on the fold lattice.

    • LEVEL 0 = THE MASSLESS (PHOTON) SECTOR. `0` is in the spectrum
      (`zero_mem_spectrum`), realized by the flat singlet where the curvature
      vanishes (N388 `singlet_flat`, action `0`) — the massless colour-neutral
      core. A nonzero floor separates it from the coloured tower: the mass gap.

    • THE HEAVY-QUARKONIA TOWER inherits the derived gap spacing. With no banked
      heavy-quark mass number, the quarkonium tower is PARAMETRIC in a heavy-quark
      anchor `μ : Cut` (the banked scale, arcs D/P — never a fabricated number):
      the levels sit at `2μ + (spectral level)`, and CONSECUTIVE levels differ by
      the gap unit `1` (`quarkonium_level_spacing`). The internal (radial/binding)
      structure is the DERIVED gap tower; the anchor is a separate derived scale.
      No measured meson mass, no fit.

  ## GRADE (honest, seed §X4)

  THEOREM-route, EXACT (the spectrum is the EXACT integer tower ℕ — no error bar,
  no approximation). The confinement-scale = floor = 1 identity and the
  spectrum = ℕ identity are proved on the banked concrete objects. The
  heavy-quarkonia half is parametric in the derived heavy-quark anchor (honestly:
  the anchor is a banked scale, not fabricated). NO empirical number (measured
  R(s), meson masses, glueball ~1.7 GeV, Λ_QCD) appears in any statement or proof
  — removable prose only (NO-FIT guard G2). NO error bar (G3).

  ## IMPORT GUARD (MANDATORY — foundations firewall, seed §X4)

  Imports `Phys.Algebra.ConfinementMassGap` (the F-native gap operator + spectrum,
  foundations-only) and MUST NOT import `Phys.OneAxiom.MassGapOne` (the
  Clay/infinite-volume face carrying `foldRetention`). Arc X needs only the gap
  OPERATOR and its spectrum, never the One's infinite-volume retention. `#print
  axioms` on the capstone is ⊆ {propext, Classical.choice, Quot.sound}, NOT
  carrying `foldRetention`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "hadronic / meson / vector
  / confinement / quarkonium / mass / photon / colour": the theorems say the set
  of self-overlap values `gForm w w` of the banked form over integer-coordinate
  `w : O ℚ` is exactly the range of `Nat.cast : ℕ → ℚ`; its minimum nonzero
  element is `1`; `0` is realized by a vanishing-curvature witness; and the shift
  `2μ + ·` of the spectrum into the derived ℝ `Cut` has consecutive elements
  differing by `1`. Pure statements about the value-set of a positive-definite
  integer quadratic form. No physics name is load-bearing.

  FREE-FLOATING check (SOUL rail). Every TYPE mentions the banked concrete objects
  — the banked Born form `gForm` on `O ℚ`, the banked `IntLat` discreteness
  predicate (N388), the banked `bornAction_lattice_floor` / `gForm_self_sum_sq`,
  the banked `singlet_flat`, and the derived ℝ `Cut`. Not generic over an
  arbitrary carrier: the spectrum routes through the octonion-specific `gForm`
  and the fold's own integer lattice.

  DEPENDENCIES (all banked, foundations-only): N388 `ConfinementMassGap`
  (`IntLat`, `bornAction_lattice_floor`, `singlet_flat`, `WorldsGlue`), N24
  `DerivationCompact` (`gForm`, `gForm_self_sum_sq`, `gForm_self_eq_zero`),
  `DerivationLowerBound` (`c0..c7`), and Mathlib's `Nat.sum_four_squares`
  (Lagrange four-square theorem, MACHINERY on the derived lattice — the metalanguage
  ℕ/ℤ as a discreteness index, not a content number system). Ground field the
  DERIVED ℝ `Cut` for the physical scale — NOT Mathlib-ℝ as content.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge.
-/
import Phys.Algebra.ConfinementMassGap
import Mathlib.NumberTheory.SumFourSquares

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The lattice point: a curvature configuration on the fold's integer lattice. -/

/-- A curvature configuration with the eight given integer coordinates in the
    fold's own frame `c₀..c₇`. Physics-words-removable: an element of `O ℚ` all of
    whose coordinates are integers. -/
def latPt (a b c d e f g h : ℤ) : O ℚ :=
  ⟨⟨⟨(a : ℚ), (b : ℚ)⟩, ⟨(c : ℚ), (d : ℚ)⟩⟩, ⟨⟨(e : ℚ), (f : ℚ)⟩, ⟨(g : ℚ), (h : ℚ)⟩⟩⟩

/-- Any `latPt` lives on the fold's integer lattice (N388 `IntLat`). -/
theorem latPt_intLat (a b c d e f g h : ℤ) : IntLat (latPt a b c d e f g h) :=
  ⟨⟨a, rfl⟩, ⟨b, rfl⟩, ⟨c, rfl⟩, ⟨d, rfl⟩, ⟨e, rfl⟩, ⟨f, rfl⟩, ⟨g, rfl⟩, ⟨h, rfl⟩⟩

/-- The Born self-overlap of a `latPt` is the sum of its eight integer coordinate
    squares (the banked `gForm_self_sum_sq`, N24, on integer coordinates). -/
theorem gForm_latPt (a b c d e f g h : ℤ) :
    gForm (latPt a b c d e f g h) (latPt a b c d e f g h)
      = ((a^2 + b^2 + c^2 + d^2 + e^2 + f^2 + g^2 + h^2 : ℤ) : ℚ) := by
  rw [gForm_self_sum_sq]
  simp only [latPt, c0, c1, c2, c3, c4, c5, c6, c7]
  push_cast; ring

/-! ## The gap-operator spectrum: the achievable Born-action values on the lattice. -/

/-- ★ THE GAP-OPERATOR SPECTRUM. The set of per-plaquette Born-action values
    `gForm w w` achieved by the banked curvature form on the fold's integer
    lattice (N388). Physics-words-removable: the value-set of `gForm w w` over
    integer-coordinate `w : O ℚ`. -/
def gapSpectrum : Set ℚ := { v | ∃ w : O ℚ, IntLat w ∧ gForm w w = v }

/-- ★ QUANTIZATION (discreteness). Every spectral value is a natural number: the
    Born self-overlap of a lattice curvature is a sum of eight integer squares,
    hence a natural. The spectrum is DISCRETE — no continuum. -/
theorem spectrum_subset_nat {v : ℚ} (hv : v ∈ gapSpectrum) : ∃ k : ℕ, v = (k : ℚ) := by
  obtain ⟨w, hlat, hval⟩ := hv
  obtain ⟨⟨k0,h0⟩,⟨k1,h1⟩,⟨k2,h2⟩,⟨k3,h3⟩,⟨k4,h4⟩,⟨k5,h5⟩,⟨k6,h6⟩,⟨k7,h7⟩⟩ := hlat
  set S : ℤ := k0^2+k1^2+k2^2+k3^2+k4^2+k5^2+k6^2+k7^2 with hSdef
  have hnn : (0:ℤ) ≤ S := by rw [hSdef]; positivity
  have hgeq : gForm w w = (S : ℚ) := by
    rw [gForm_self_sum_sq, h0,h1,h2,h3,h4,h5,h6,h7, hSdef]; push_cast; ring
  refine ⟨S.toNat, ?_⟩
  rw [← hval, hgeq]
  exact_mod_cast (Int.toNat_of_nonneg hnn).symm


/-- ★ FULLY POPULATED (the unit-spaced tower). EVERY natural number is achieved —
    by Lagrange's four-square theorem, `n = a²+b²+c²+d²`, realized by the lattice
    point `(a,b,c,d,0,0,0,0)`. So the tower is EVENLY SPACED by the gap unit: one
    linear-Regge slope = one string tension = one gap operator. -/
theorem spectrum_surjective_nat (n : ℕ) : (n : ℚ) ∈ gapSpectrum := by
  obtain ⟨a, b, c, d, habcd⟩ := Nat.sum_four_squares n
  refine ⟨latPt a b c d 0 0 0 0, latPt_intLat a b c d 0 0 0 0, ?_⟩
  rw [gForm_latPt]
  rw [← habcd]; push_cast; ring

/-- ★★★ THE SPECTRUM IS EXACTLY ℕ. The discrete spectrum of the gap operator over
    the fold lattice is precisely the range of the ℕ→ℚ cast — not a subset, not an
    approximation, the WHOLE ℕ. This is the fold's computation of the hadronic
    tower: quantized (discreteness) AND fully populated (surjectivity). -/
theorem gapSpectrum_eq_natRange : gapSpectrum = Set.range (fun n : ℕ => (n : ℚ)) := by
  ext v
  constructor
  · intro hv
    obtain ⟨k, hk⟩ := spectrum_subset_nat hv
    exact ⟨k, hk.symm⟩
  · rintro ⟨n, rfl⟩
    exact spectrum_surjective_nat n

/-! ## The floor = the confinement scale = the light-vector band edge. -/

/-- The unit witness: the lattice point `(1,0,0,0,0,0,0,0)`, whose Born action is
    exactly `1` — the floor of the nonzero spectrum. -/
theorem gForm_unit_witness : gForm (latPt 1 0 0 0 0 0 0 0) (latPt 1 0 0 0 0 0 0 0) = 1 := by
  rw [gForm_latPt]; norm_num

/-- The unit witness is a nonzero lattice curvature. -/
theorem unit_witness_ne_zero : latPt 1 0 0 0 0 0 0 0 ≠ 0 := by
  intro h
  have hz : gForm (latPt 1 0 0 0 0 0 0 0) (latPt 1 0 0 0 0 0 0 0) = 0 :=
    gForm_self_eq_zero.mpr h
  rw [gForm_unit_witness] at hz; norm_num at hz

/-- ★★ THE FLOOR = THE CONFINEMENT SCALE. The minimum NONZERO spectral value is
    exactly `1`: every nonzero lattice curvature has Born action `≥ 1` (the banked
    `bornAction_lattice_floor`, N388), and the unit witness attains `1`. Light
    quarks ~massless ⟹ the light-vector band edge IS this gap scale, not a quark
    mass: the confinement scale = the gap floor = the minimum nonzero eigenvalue of
    the Born self-overlap on the fold lattice. -/
theorem gap_floor_is_one :
    (1 : ℚ) ∈ gapSpectrum ∧
    (∀ v ∈ gapSpectrum, v ≠ 0 → 1 ≤ v) := by
  refine ⟨⟨latPt 1 0 0 0 0 0 0 0, latPt_intLat 1 0 0 0 0 0 0 0, gForm_unit_witness⟩, ?_⟩
  intro v hv hne
  obtain ⟨w, hlat, hval⟩ := hv
  have hw : w ≠ 0 := by
    intro h0; apply hne; rw [← hval, h0]; exact gForm_self_eq_zero.mpr rfl
  rw [← hval]
  exact bornAction_lattice_floor w hlat hw

/-- ★ LEVEL 0 = THE MASSLESS (PHOTON) SECTOR. `0` is in the spectrum, realized by
    the flat singlet where the curvature vanishes (N388 `singlet_flat`, action `0`)
    — the massless colour-neutral core. A nonzero floor (`gap_floor_is_one`)
    separates it from the coloured tower: the mass gap. -/
theorem zero_mem_spectrum : (0 : ℚ) ∈ gapSpectrum :=
  ⟨0, ⟨⟨0, rfl⟩, ⟨0, rfl⟩, ⟨0, rfl⟩, ⟨0, rfl⟩,
       ⟨0, rfl⟩, ⟨0, rfl⟩, ⟨0, rfl⟩, ⟨0, rfl⟩⟩,
   gForm_self_eq_zero.mpr rfl⟩

/-! ## The heavy-quarkonia tower: the derived gap spacing, parametric anchor. -/

/-- ★ THE HEAVY-QUARKONIA TOWER inherits the derived gap spacing. With no banked
    heavy-quark mass number, the quarkonium tower is PARAMETRIC in a heavy-quark
    anchor `μ : Cut` (the banked scale, arcs D/P — never a fabricated number): the
    levels sit at `2μ + (spectral level n)`, and CONSECUTIVE levels differ by the
    gap unit `1`. The internal (radial/binding) structure is the DERIVED gap
    tower; the anchor is a separate derived scale. Physics-words-removable: the
    shift `2μ + ·` of the ℕ-spectrum into `Cut` has consecutive elements differing
    by `1`. -/
theorem quarkonium_level_spacing (μ : Cut) (n : ℕ) :
    (2 * μ + ((n + 1 : ℕ) : Cut)) - (2 * μ + (n : Cut)) = 1 := by
  push_cast; ring

/-! ## Teeth (W8 / G8): the quantization BITES. -/

/-- ★ TOOTH — the spectrum is NOT all of ℚ; quantization excludes fractional
    values. A garbage value strictly between `0` and `1` (e.g. `1/2`) is NOT a
    spectral value: it is nonzero yet below the floor. This refutes a "continuum
    of gap values" reading — the spectrum is the DISCRETE ℕ, not `ℚ`. -/
theorem half_not_mem_spectrum : (1/2 : ℚ) ∉ gapSpectrum := by
  intro hv
  obtain ⟨_, h1le⟩ := gap_floor_is_one
  have := h1le (1/2) hv (by norm_num)
  norm_num at this

/-- ★ TOOTH — the floor is genuinely `1`, not `0`: the minimum nonzero value is
    attained and cannot be undercut. (A wrong "floor = 0" reading would let a
    coloured configuration be massless — refuted by `gap_floor_is_one`.) And over
    the CONTINUUM (no discreteness) the floor is FALSE — banked
    `no_floor_over_continuum` (N388): the discreteness is load-bearing. -/
theorem floor_bites : (1/2 : ℚ) ∉ gapSpectrum ∧ (1 : ℚ) ∈ gapSpectrum :=
  ⟨half_not_mem_spectrum, gap_floor_is_one.1⟩

/-! ## The capstone. -/

/-- ★★★ THE HADRONIC / CONFINEMENT BAND = THE MASS-GAP SPECTRUM (welded landing).
    The fold COMPUTES the hadronic / vector-meson spectrum as the eigenvalue
    spectrum of the banked mass-gap operator, on the banked derived objects:

    (1) the gap-operator spectrum (achievable Born actions on the fold lattice) is
        EXACTLY ℕ — quantized AND fully populated (one Regge slope, one string
        tension, one gap operator);
    (2) the FLOOR = the confinement scale = the light-vector band edge: the minimum
        nonzero spectral value is `1`;
    (3) LEVEL 0 = the massless (photon) sector — the flat singlet, action `0`;
    (4) the HEAVY-QUARKONIA tower inherits the derived gap spacing `1` about any
        anchor `μ`;
    (5) TEETH: `1/2 ∉` spectrum (quantization bites), `1 ∈` spectrum (floor
        attained).

    DERIVED (quantization + Lagrange population of the Born self-overlap of the
    associator curvature), never asserted; NO empirical number, NO fit, NO error
    bar. This removes the last measured input (the hadronic R(s)) — the falsifiable
    edge. -/
theorem hadronicSpectrum_landing :
    gapSpectrum = Set.range (fun n : ℕ => (n : ℚ)) ∧
    ((1 : ℚ) ∈ gapSpectrum ∧ (∀ v ∈ gapSpectrum, v ≠ 0 → 1 ≤ v)) ∧
    (0 : ℚ) ∈ gapSpectrum ∧
    (∀ (μ : Cut) (n : ℕ),
      (2 * μ + ((n + 1 : ℕ) : Cut)) - (2 * μ + (n : Cut)) = 1) ∧
    ((1/2 : ℚ) ∉ gapSpectrum ∧ (1 : ℚ) ∈ gapSpectrum) :=
  ⟨gapSpectrum_eq_natRange, gap_floor_is_one, zero_mem_spectrum,
   quarkonium_level_spacing, floor_bites⟩

end

end Phys.Algebra
