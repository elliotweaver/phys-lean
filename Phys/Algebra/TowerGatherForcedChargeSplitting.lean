/-
  Phys.Algebra.TowerGatherForcedChargeSplitting — N241.
  ===========================================================================
  THE FORCED CHARGE SPLITTING of the two triplets `3 = Uhol` vs `3̄ = Uah` (N42c), derived FROM
  the gather-obstruction charge operator `chargeOp = crossOp u1` (N240). Owner-authorized
  gather-side hypercharge front, under the TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner
  authorization 2026-07-01). This is a gather-native forward step, NOT the parked invariant-tower
  ascent.

  THE JOINT (the deliverable). N240 banked the forced charge operator `chargeOp := crossOp u1`
  (the gather tear on the branching's distinguished singlet `u1`), and showed its square is
  `chargeOp²(y) = ⟨u1,y⟩•u1 − y` — a complex structure on the branching complement
  `V = 3 ⊕ 3̄` (Born-orthogonal to `u1`), zero on the singlet `1`. N42c banked the branching
  lever `JO = L_{u1}` (`JO x = u1·x`) and proved it SWAPS the two triplets
  (`Uhol.map JO ≤ Uah`, `Uah.map JO ≤ Uhol`, `JO.comp JO = −id`).

  THE NEW STRUCTURAL FACT: the gather tear `crossOpO u1` and the branching lever `JO` COINCIDE on
  the branching complement `V`. The gather-obstruction cross product unfolds as
    `octCross u1 y = u1·y + ⟨u1,y⟩•1  =  JO y + ⟨u1,y⟩•1`,
  and every `v ∈ V` is Born-orthogonal to `u1` (`⟨u1,v⟩ = 0` on `V`, since `V` is spanned by the
  imaginary generators `e₂,…,e₇`, each orthogonal to `u1`). So the correction term vanishes and
    ★ `crossOpO u1 v = JO v`  for every `v ∈ Vsub`.
  Therefore the GATHER-OBSTRUCTION charge operator INHERITS the branching lever's `3 ↔ 3̄` swap —
  and we SHARPEN N42c's inclusions to EQUALITIES: `crossOpO u1` maps `Uhol` ONTO `Uah` and `Uah`
  ONTO `Uhol`. The two triplets are genuinely EXCHANGED by the charge operator, never fixed
  (`Uhol.map (crossOpO u1) ⊓ Uhol = ⊥`): they are a conjugate pair under the charge complex
  structure, occupying the `±i` eigen-directions of `chargeOp|_V` — the OPPOSITE charge
  assignment of the `3` vs the `3̄`, the particle/antiparticle split — DERIVED from the gather
  obstruction, not posited.

  WHAT THIS FILE BANKS (all foundations-only):
    gForm_u1_e3O … gForm_u1_e7O — the singlet axis `u1` is Born-orthogonal to each complement
                                  generator (coordinate `simp`, the banked `gForm_u1_u2` pattern;
                                  `gForm u1 e2O = 0` is banked as `gForm_u1_u2` since `u2 = e2O`).
    gForm_u1_vanish_Vsub        — ★ `u1 ⟂ V`: `gForm u1 v = 0` for all `v ∈ Vsub`
                                  (span-induction + Born bilinearity).
    crossOpO_u1_eq_JO_on_Vsub   — ★★ THE CRUX / THE JOINT: `crossOpO u1 v = JO v` for `v ∈ Vsub`.
                                  The gather tear and the branching lever coincide on the
                                  complement — the correction term `⟨u1,v⟩•1` vanishes.
    chargeOp_coe_eq_JO_on_Vsub  — the subtype-native tie: for `y : ImO` with `(y:O ℚ) ∈ Vsub`,
                                  `((chargeOp y : ImO) : O ℚ) = JO (y : O ℚ)`.
    JO_JO                       — `JO (JO x) = −x` (pointwise `J² = −1`, banked `JO_sq`).
    Uhol_map_crossOpO_eq_Uah    — ★★★ `Uhol.map (crossOpO u1) = Uah` (EQUALITY, sharper than N42c's
                                  `≤`): the gather charge operator maps the `3` ONTO the `3̄`.
    Uah_map_crossOpO_eq_Uhol    — ★★★ `Uah.map (crossOpO u1) = Uhol`: and the `3̄` ONTO the `3`.
    Uhol_crossOpO_disj          — ★★ W8 TEETH: `Uhol.map (crossOpO u1) ⊓ Uhol = ⊥` — the charge
                                  operator EXCHANGES the triplets, never fixes one (a genuine
                                  swap, not the identity).
    forced_charge_splitting_structure — the capstone: `crossOpO u1` coincides with `JO` on `V`,
                                  exchanges the two triplets `Uhol ↔ Uah`, never fixes `Uhol`, and
                                  squares to `−id` on `V`.

  THE MOAT (docs/STANDARD §0). The field POSITS a hypercharge / particle-antiparticle assignment.
  Here the OPPOSITE-charge structure of the two triplets is FORCED: the gather-obstruction charge
  operator IS the branching complex structure on `V`, and that complex structure demonstrably
  swaps the two triplets. ONE cause — `u1`, the fold's √−1, simultaneously the gather-tear input
  AND the left-multiplication complex structure — MANY faces: the charge operator (N240) and the
  conjugation swap of the `3 ↔ 3̄` (N42c) are the SAME map on `V`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / triplet /
  antitriplet / particle / antiparticle / colour / conjugate": over the derived field ℚ and
  `O ℚ = CD (H ℚ)`, the cross-product endomorphism `crossOpO u1` agrees with left-multiplication
  `JO = L_{u1}` on the span `Vsub` of `e₂,…,e₇`, and maps the span `Uhol = ⟨e₂,e₄,e₆⟩` onto the
  span `Uah = ⟨e₃,e₅,e₇⟩` and back, with `Uhol.map (crossOpO u1) ⊓ Uhol = ⊥`. No theorem
  STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N240 (`chargeOp`/`crossOpO`), N223 (`crossOpO`/`crossOpO_apply`),
  N42c (`JO`/`JO_sq`/`Uhol`/`Uah`/`Vsub`/`Uhol_le_Vsub`/`Uah_le_Vsub`/`Uhol_map_JO_le_Uah`/
  `Uah_map_JO_le_Uhol`/`Uhol_disj_Uah`), N206/N24 (`octCross`/`gForm`), and the coordinate
  generators `e₂,…,e₇`/`u1`. Ground = derived ℚ; nothing posited; no Mathlib number/algebra as
  content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherForcedChargeDirection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The singlet axis `u1` is Born-orthogonal to every generator of the complement `V`. -/

/-- `⟨u1, e₃⟩ = 0` (`u1` is Born-orthogonal to `e₃`), coordinate `simp` (the `gForm_u1_u2`
    pattern; `⟨u1,e₂⟩ = 0` is the banked `gForm_u1_u2`, as `u2 = e2O`). -/
theorem gForm_u1_e3O : gForm u1 e3O = 0 := by
  show reQ (u1 * star e3O) = 0
  simp only [reQ, u1, e3O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num

/-- `⟨u1, e₄⟩ = 0`. -/
theorem gForm_u1_e4O : gForm u1 e4O = 0 := by
  show reQ (u1 * star e4O) = 0
  simp only [reQ, u1, e4O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num

/-- `⟨u1, e₅⟩ = 0`. -/
theorem gForm_u1_e5O : gForm u1 e5O = 0 := by
  show reQ (u1 * star e5O) = 0
  simp only [reQ, u1, e5O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num

/-- `⟨u1, e₆⟩ = 0`. -/
theorem gForm_u1_e6O : gForm u1 e6O = 0 := by
  show reQ (u1 * star e6O) = 0
  simp only [reQ, u1, e6O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num

/-- `⟨u1, e₇⟩ = 0`. -/
theorem gForm_u1_e7O : gForm u1 e7O = 0 := by
  show reQ (u1 * star e7O) = 0
  simp only [reQ, u1, e7O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num

/-- ★ `u1 ⟂ V`: the singlet axis is Born-orthogonal to the ENTIRE branching complement
    `V = 3 ⊕ 3̄ = Vsub` — `gForm u1 v = 0` for all `v ∈ Vsub`. By span-induction over the
    generators `e₂,…,e₇` (each orthogonal to `u1`) and the Born bilinearity
    (`gForm_add_right`/`gForm_smul_right`, N31). -/
theorem gForm_u1_vanish_Vsub : ∀ v ∈ Vsub, gForm u1 v = 0 := by
  intro v hv
  rw [Vsub] at hv
  refine Submodule.span_induction (p := fun y _ => gForm u1 y = 0) ?_ ?_ ?_ ?_ hv
  · rintro _ ⟨i, rfl⟩
    fin_cases i
    · exact gForm_u1_u2
    · exact gForm_u1_e3O
    · exact gForm_u1_e4O
    · exact gForm_u1_e5O
    · exact gForm_u1_e6O
    · exact gForm_u1_e7O
  · show gForm u1 (0 : O ℚ) = 0
    simp only [gForm, star_zero, mul_zero, reQ, CD.zero_re, Dbl.zero_re]
  · intro a b _ _ ha hb; rw [gForm_add_right, ha, hb, add_zero]
  · intro r a _ ha; rw [gForm_smul_right, ha, mul_zero]

/-! ## ★★ THE CRUX / THE JOINT — the gather tear coincides with the branching lever on `V`. -/

/-- ★★ THE JOINT: the gather-obstruction charge operator `crossOpO u1` (N223/N240) and the
    branching complex structure `JO = L_{u1}` (N42c) COINCIDE on the branching complement `V`:
    `crossOpO u1 v = JO v` for every `v ∈ Vsub`. The gather tear unfolds as
    `octCross u1 v = u1·v + ⟨u1,v⟩•1 = JO v + ⟨u1,v⟩•1`, and `⟨u1,v⟩ = 0` on `V`
    (`gForm_u1_vanish_Vsub`), so the correction term vanishes. This is why the covariant gather
    charge operator INHERITS the branching lever's `3 ↔ 3̄` swap — the OPPOSITE-charge structure
    of the two triplets is a gather-obstruction fact, not a posit. -/
theorem crossOpO_u1_eq_JO_on_Vsub : ∀ v ∈ Vsub, crossOpO u1 v = JO v := by
  intro v hv
  show octCross u1 v = u1 * v
  unfold octCross
  rw [gForm_u1_vanish_Vsub v hv, zero_smul, add_zero]

/-- The subtype-native tie to the N240 charge operator: for `y : ImO` whose underlying vector lies
    in the branching complement `V`, the N240 charge operator `chargeOp = crossOp u1` acts as the
    branching complex structure `JO`: `((chargeOp y : ImO) : O ℚ) = JO (y : O ℚ)`. -/
theorem chargeOp_coe_eq_JO_on_Vsub (y : ImO) (hy : (y : O ℚ) ∈ Vsub) :
    ((chargeOp y : ImO) : O ℚ) = JO (y : O ℚ) := by
  show octCross u1 (y : O ℚ) = u1 * (y : O ℚ)
  have h := crossOpO_u1_eq_JO_on_Vsub (y : O ℚ) hy
  rw [crossOpO_apply] at h
  rw [h]; rfl

/-! ## `JO² = −1` pointwise, and the FORCED EXCHANGE of the two triplets. -/

/-- `JO (JO x) = −x` for every `x` (pointwise form of the banked `JO_sq : JO.comp JO = −id`,
    N42c — from left-alternativity). -/
theorem JO_JO (x : O ℚ) : JO (JO x) = -x := by
  have h : (JO.comp JO) x = (-LinearMap.id : O ℚ →ₗ[ℚ] O ℚ) x := by rw [JO_sq]
  simpa using h

/-- ★★★ THE GATHER CHARGE OPERATOR MAPS THE `3` ONTO THE `3̄`: `Uhol.map (crossOpO u1) = Uah`,
    an EQUALITY sharper than N42c's inclusion `Uhol.map JO ≤ Uah`. `≤` is the coincidence on `V`
    plus the banked JO-swap. `≥` is surjectivity: for `w ∈ Uah`, the preimage `−(JO w) ∈ Uah.map
    JO ≤ Uhol` maps to `crossOpO u1 (−JO w) = JO(−JO w) = −JO(JO w) = w` (using `JO² = −1`). -/
theorem Uhol_map_crossOpO_eq_Uah : Uhol.map (crossOpO u1) = Uah := by
  apply le_antisymm
  · rintro _ ⟨v, hv, rfl⟩
    rw [crossOpO_u1_eq_JO_on_Vsub v (Uhol_le_Vsub hv)]
    exact Uhol_map_JO_le_Uah ⟨v, hv, rfl⟩
  · intro w hw
    have hJw : JO w ∈ Uhol := Uah_map_JO_le_Uhol ⟨w, hw, rfl⟩
    have hv : -(JO w) ∈ Uhol := Submodule.neg_mem _ hJw
    refine ⟨-(JO w), hv, ?_⟩
    rw [crossOpO_u1_eq_JO_on_Vsub _ (Uhol_le_Vsub hv)]
    show JO (-(JO w)) = w
    rw [map_neg, JO_JO, neg_neg]

/-- ★★★ AND THE `3̄` ONTO THE `3`: `Uah.map (crossOpO u1) = Uhol`. Together with the previous
    lemma, the gather charge operator genuinely EXCHANGES the two triplets. -/
theorem Uah_map_crossOpO_eq_Uhol : Uah.map (crossOpO u1) = Uhol := by
  apply le_antisymm
  · rintro _ ⟨v, hv, rfl⟩
    rw [crossOpO_u1_eq_JO_on_Vsub v (Uah_le_Vsub hv)]
    exact Uah_map_JO_le_Uhol ⟨v, hv, rfl⟩
  · intro w hw
    have hJw : JO w ∈ Uah := Uhol_map_JO_le_Uah ⟨w, hw, rfl⟩
    have hv : -(JO w) ∈ Uah := Submodule.neg_mem _ hJw
    refine ⟨-(JO w), hv, ?_⟩
    rw [crossOpO_u1_eq_JO_on_Vsub _ (Uah_le_Vsub hv)]
    show JO (-(JO w)) = w
    rw [map_neg, JO_JO, neg_neg]

/-- ★★ W8 TEETH — THE SWAP IS GENUINE, NEVER A FIX: the image of the `3` under the charge operator
    is DISJOINT from the `3` itself, `Uhol.map (crossOpO u1) ⊓ Uhol = ⊥`. Because that image is
    exactly `Uah` (`Uhol_map_crossOpO_eq_Uah`) and the two triplets are disjoint (banked
    `Uhol_disj_Uah`, N42c). So the charge operator EXCHANGES `Uhol ↔ Uah` — it does not fix a
    triplet; the `3` and the `3̄` are a genuine conjugate pair (opposite charge), never the same
    direction. -/
theorem Uhol_crossOpO_disj : Uhol.map (crossOpO u1) ⊓ Uhol = ⊥ := by
  rw [Uhol_map_crossOpO_eq_Uah]
  exact (disjoint_comm.mp Uhol_disj_Uah).eq_bot

/-! ## THE CAPSTONE. -/

/-- ★★★ THE FORCED CHARGE SPLITTING of the two triplets, from the gather obstruction. Over the
    derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the gather-obstruction
    cross-product operator `crossOpO u1` (N223/N240), the branching complex structure
    `JO = L_{u1}` (N42c), and the two triplets `Uhol` (the `3`), `Uah` (the `3̄`) and their span
    `Vsub` (the `6 = 3 ⊕ 3̄`):
    (i)   `crossOpO u1` COINCIDES with the branching lever `JO` on the complement `V = Vsub`;
    (ii)  it maps `Uhol` ONTO `Uah` and `Uah` ONTO `Uhol` (the two triplets are EXCHANGED);
    (iii) that exchange is genuine — the image of `Uhol` is disjoint from `Uhol`
          (`Uhol.map (crossOpO u1) ⊓ Uhol = ⊥`), never a fixed triplet;
    (iv)  it squares to `−id` on `V` (`JO (JO v) = −v`) — the charge complex structure whose
          `±i` eigen-directions the two triplets occupy.
    The OPPOSITE-charge / particle–antiparticle structure of the `3` vs the `3̄` is DERIVED from
    the gather-obstruction charge operator (it IS the branching complex structure on `V`), not
    posited or normalized. -/
theorem forced_charge_splitting_structure :
    (∀ v ∈ Vsub, crossOpO u1 v = JO v) ∧
    Uhol.map (crossOpO u1) = Uah ∧
    Uah.map (crossOpO u1) = Uhol ∧
    Uhol.map (crossOpO u1) ⊓ Uhol = ⊥ ∧
    (∀ v ∈ Vsub, JO (JO v) = -v) :=
  ⟨crossOpO_u1_eq_JO_on_Vsub, Uhol_map_crossOpO_eq_Uah, Uah_map_crossOpO_eq_Uhol,
   Uhol_crossOpO_disj, fun v _ => JO_JO v⟩

end

end Phys.Algebra
