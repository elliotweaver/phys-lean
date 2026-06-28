/-
  Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion — N123: THE GLOBAL OCTONION-BLOCK
  EXHAUSTION — THE FINRANK-STRONG-RECURSION SKELETON (the abstract Cartan–Dieudonné descent on the
  fixed-subspace codimension, built on N121's subspace-preserving reflection + N122's derived-`Cut`
  finrank tower / depth bound `8`).

  ===========================================================================
  CONTEXT. N117/N118 banked the octonion-block deflation STEP + REASSEMBLY; N119 banked the
  rank-DROP RESTRICTION engine (`ePerp` / `ePerp_finrank` / `isom_fixes_mapsTo_ePerp` /
  `isomRestrict` / `isomRestrict_gFormC_isom`); N120 banked the connective tissue + the BOUNDED
  two-axis exhaustion; N121 banked THE SUBSPACE-PRESERVATION CORE (`octReflBlock` /
  `octReflBlock_gFormC_diag` / `octReflBlock_mapsTo_ePerp` / `octReflBlockRestrict` /
  `octReflBlockRestrict_gFormC_isom`); N122 banked THE DERIVED-`Cut` FINRANK TOWER
  (`finrank_O_eq_eight_Cut = 8`, `finrank_STVC = 10`, `ePerp_finrank_value = 7`,
  `finrank_End_O_Cut = 64`) — the explicit termination depth.

  EVERY per-peel ingredient AND the explicit depth `8` are now in hand. The ROADMAP §N123 FORWARD
  FRONTIER names the global octonion-block exhaustion's priority-(i) scaffold: a
  `Nat.strong_induction` / `Submodule.finrank`-well-founded recursion that, given an octonion-block
  `gFormC`-isometry, peels a moved axis with `octReflBlock`, recurses on the codim-1 complement, and
  assembles the isometry as a finite bisector-reflection product. THIS node banks exactly that
  recursion — the abstract finrank-strong-recursion SKELETON over the derived `Cut`, reducing the
  ENTIRE global surjectivity to a single local peel step.

  ── THE W1 REFRAME (THE ONE LAW) — dissolving the "resistant piece" ──
  N121/N122 flagged the resistant obstruction as: "does the MOVED-AXIS hypothesis transport cleanly
  to the restricted operator — is there always a moved unit-imaginary axis INSIDE the complement
  (the `gFormC`-ISOMETRY strand has no analogue of N85's `submodule_selfadj_has_eigenvalue`)?".
  REFRAMED THROUGH THE TRUNK: the recursion does NOT need a moved axis to EXIST as a separate
  theorem. The descent dichotomy is the classical tautology — at each operator `T`, EITHER `T` is
  already the identity (TERMINATE — the base case, where the fixed subspace is full-rank `8`), OR
  `T ≠ id` and a single PEEL produces a reflection `R` with `R · T` an isometry of STRICTLY LARGER
  fixed subspace. NO eigenvalue-existence analogue is needed; the well-foundedness rides entirely on
  the codimension `8 − finrank (fixSubmodule T)` strictly DECREASING, bounded below by `0`. The
  genuine remaining content splits cleanly: (a) the recursion SKELETON + the base case + the
  closure-membership reassembly `T = R · (R · T)` — banked HERE, abstract over the peel; (b) the
  CONSTRUCTION of the peel (a reflection at a general moved vector strictly growing the fixed
  subspace, with the real/imaginary handling and the bisector geometry) — the genuine HEAVY
  group-manifold remainder, childed N124.

  ── WHAT THIS NODE BANKS (the abstract recursion skeleton, over the derived `Cut`) ──
  `fixSubmodule S := ker (S − id)` — THE FIXED SUBSPACE of an operator (the invariant the descent
    grows toward full rank).
  `mem_fixSubmodule` — `v ∈ fixSubmodule S ↔ S v = v`.
  `fixSubmodule_finrank_le` — `finrank Cut (fixSubmodule S) ≤ 8` (a subspace of `O Cut`,
    `finrank_O_eq_eight_Cut` N122), so the codimension `8 − finrank` is a well-defined `ℕ` descent.
  `fixSubmodule_id` / `fixSubmodule_id_finrank` — the identity's fixed subspace is `⊤`, finrank `8`.
  ★★ `isom_fix_full_eq_id` — THE BASE CASE / TERMINATION: an operator whose fixed subspace is
    full-rank (`finrank = 8`) is the identity (`Submodule.eq_top_of_finrank_eq` at the now-banked
    `finrank_O_eq_eight_Cut`). The descent terminates exactly when the fixed subspace fills `O Cut`.
  `IsGFormCIsom S := ∀ u v, gFormC (S u) (S v) = gFormC u v` — the bilinear Born-isometry predicate.
  ★ `octReflBlock_isGFormCIsom` — THE CONCRETE ALPHABET GROUNDING: the banked bisector reflection's
    octonion-block v-block `octReflBlock e w` (N121) IS a bilinear `gFormC`-isometry — its DIAGONAL
    preservation `octReflBlock_gFormC_diag` (N121) polarized to bilinear by the banked Born
    polarization `gFormC_polarize` (N112). The alphabet members are genuine isometries, not posited.
  ★★ `reflection_exhaustion_aux` / `reflection_exhaustion` — THE FINRANK-STRONG-RECURSION SKELETON:
    given a peel ORACLE (for any non-identity isometry `T`, a reflection `R` from the alphabet `refl`
    with `R · R = 1`, `R · T` an isometry, and `finrank (fixSubmodule T) < finrank (fixSubmodule
    (R · T))`), EVERY `gFormC`-isometry `S` lies in `Submonoid.closure refl` — a finite product of
    reflections. By `Nat.strong_induction_on` the codimension `m = 8 − finrank (fixSubmodule S)`:
    `m = 0` ⟹ `S = id` (base case) ⟹ `S = 1 ∈ closure`; else peel `R`, the codimension of `R · S`
    strictly drops (`fixSubmodule_finrank_le` keeps it `≤ 8`), the IH puts `R · S ∈ closure`, and the
    involution reassembly `S = R · (R · S)` closes membership. The abstract Cartan–Dieudonné
    structure theorem over the derived field, DERIVED — the global surjectivity REDUCED to the single
    local peel step.
  W8 teeth: `octReflBlock_witness_mem_fix` — the concrete banked reflection `octReflBlock e₂ je2`
    FIXES the unit-imaginary axis `ke2je2` (`octReflBlock_witness`, N121), so `ke2je2` lies in its
    `fixSubmodule` — the abstract fixed subspace tied to a concrete alphabet member, non-vacuously.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the fixed subspace `ker (S − id)` (`LinearMap.ker`); the terminal
  dimension `finrank_O_eq_eight_Cut = 8` (N122, via the cascade's own doubling `oProdEquivCut` N76);
  the alphabet reflection `octReflBlock` and its diagonal isometry `octReflBlock_gFormC_diag` (N121);
  the Born POLARIZATION `gFormC_polarize` (N112, diagonal ⟹ bilinear by completing the square over
  `Cut`); the concrete units `e₂` / `je2` / `ke2je2` and the witnessed fix `octReflBlock_witness`
  (N108–N121). `Nat.strong_induction_on` / `Submodule.eq_top_of_finrank_eq` / `Submodule.finrank_le`
  / `Submonoid.closure` / `Submonoid.mul_mem` standard Mathlib MACHINERY on the DERIVED objects
  (STANDARD §3), over the derived ℝ `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  NOT a posited Lorentz group / SO⁺(1,9), NOT a posited reflection/Clifford group, NOT a posited
  orthogonal-group structure theorem, NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content,
  NOT a bridge. The peel ORACLE is a fully-explicit HYPOTHESIS (a fully proved implication, not a
  fact taken without a proof): the theorem proves the recursion well-founded and assembling GIVEN the
  local peel, reducing — not asserting — the global content.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full `Spin(8)` /
  `SO(8)` and reads off the Cartan–Dieudonné structure theorem (every orthogonal map is a finite
  product of reflections, by induction on the orthogonal complement of a fixed vector) as the
  standard fact. Here the recursion is CONSTRUCTED forward from the trunk: the descent variable is
  the codimension of the kernel of the trunk's own `S − id`, bounded by the cascade-COUNTED dimension
  `8`; the termination is `Submodule.eq_top_of_finrank_eq` at that counted dimension; the reassembly
  is the banked involution; and the alphabet members are the banked bisector reflections, proved
  isometries by the banked Born polarization. The entire global surjectivity is REDUCED to the single
  local peel step by a forced, witnessed recursion, not a posited group-theoretic structure theorem.

  ── THE FORWARD REMAINDER (childed N124) ──
  The PEEL ORACLE construction — for a non-identity `gFormC`-isometry `T` with a moved vector `v`
  (`T v ≠ v`), the bisector reflection `octReflBlock` at the (real/imaginary-handled) bisector of
  `v` and `T v` composed into `R` with `R · T` fixing everything `T` fixed PLUS `v`'s direction
  (the fixed subspace strictly growing) — together with the lift of the descent through N121's
  `octReflBlockRestrict` on the codim-1 complement, is the genuine HEAVY group-manifold core, plus
  the literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)`, which Mathlib
  lacks over the derived `Cut`). THIS node banks the recursion SKELETON — the immediately-bankable
  structural piece ROADMAP §N123 priority (i) names — reducing the global surjectivity to that peel.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / reflection / isometry / compact / orthogonal / SO(8) / Spin /
  Clifford / Cartan / Dieudonné / bisector / axis / deflation / exhaustion / surjectivity /
  generation / recursion / depth / complement / octonion-block": what remains is pure linear algebra
  over the derived complete ordered field `Cut` — for `fixSubmodule S := ker (S − id)` on `O Cut`,
  if a `Cut`-linear `S` preserving the diagonal-then-bilinear form `gFormC` admits, whenever `S ≠ id`,
  a `refl`-member `R` with `R · R = 1`, `R · S` form-preserving, and `finrank (fixSubmodule S) <
  finrank (fixSubmodule (R · S))`, then `S ∈ Submonoid.closure refl`; the base case is
  `finrank (fixSubmodule S) = 8 ⟹ S = id`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationSO8FinrankTower

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The fixed submodule of an operator and the codimension bookkeeping. -/

/-- THE FIXED SUBSPACE of a `Cut`-linear operator on the terminal algebra: `ker (S − id)`, the
    subspace of vectors `S` leaves untouched. The invariant the Cartan–Dieudonné descent grows
    toward full rank — each peel strictly enlarges it, the recursion terminating when it fills
    `O Cut`. -/
def fixSubmodule (S : O Cut →ₗ[Cut] O Cut) : Submodule Cut (O Cut) :=
  LinearMap.ker (S - LinearMap.id)

/-- Membership in the fixed subspace: `v ∈ fixSubmodule S ↔ S v = v`. -/
theorem mem_fixSubmodule (S : O Cut →ₗ[Cut] O Cut) (v : O Cut) :
    v ∈ fixSubmodule S ↔ S v = v := by
  unfold fixSubmodule
  rw [LinearMap.mem_ker, LinearMap.sub_apply, LinearMap.id_apply, sub_eq_zero]

/-- The fixed subspace has `finrank ≤ 8` (it is a submodule of `O Cut`, `finrank_O_eq_eight_Cut`
    N122), so the codimension `8 − finrank (fixSubmodule S)` is a well-defined `ℕ` descent
    variable. -/
theorem fixSubmodule_finrank_le (S : O Cut →ₗ[Cut] O Cut) :
    Module.finrank Cut (fixSubmodule S) ≤ 8 := by
  rw [← finrank_O_eq_eight_Cut]
  exact Submodule.finrank_le (fixSubmodule S)

/-- The identity's fixed subspace is the whole space `⊤`. -/
theorem fixSubmodule_id : fixSubmodule (LinearMap.id : O Cut →ₗ[Cut] O Cut) = ⊤ := by
  rw [Submodule.eq_top_iff']
  intro v
  rw [mem_fixSubmodule, LinearMap.id_apply]

/-- The identity's fixed subspace has finrank `8` (the full terminal dimension, N122). -/
theorem fixSubmodule_id_finrank :
    Module.finrank Cut (fixSubmodule (LinearMap.id : O Cut →ₗ[Cut] O Cut)) = 8 := by
  rw [fixSubmodule_id, finrank_top, finrank_O_eq_eight_Cut]

/-! ## THE BASE CASE / TERMINATION of the descent. -/

/-- ★★ THE BASE CASE / TERMINATION: a `Cut`-linear operator whose fixed subspace is full-rank
    (`finrank = 8`) is the identity. The fixed subspace equals `⊤` (`Submodule.eq_top_of_finrank_eq`
    at the now-banked `finrank_O_eq_eight_Cut`, N122), so every vector is fixed. The descent
    terminates exactly when the fixed subspace fills the terminal algebra — the explicit depth `8`
    the global octonion-block exhaustion bottoms out at. -/
theorem isom_fix_full_eq_id (S : O Cut →ₗ[Cut] O Cut)
    (hfix : Module.finrank Cut (fixSubmodule S) = 8) :
    S = LinearMap.id := by
  have htop : fixSubmodule S = ⊤ :=
    Submodule.eq_top_of_finrank_eq (by rw [hfix, finrank_O_eq_eight_Cut])
  apply LinearMap.ext
  intro v
  have hv : v ∈ fixSubmodule S := htop ▸ Submodule.mem_top
  rw [mem_fixSubmodule] at hv
  rw [hv, LinearMap.id_apply]

/-! ## The bilinear Born-isometry predicate and the concrete alphabet grounding. -/

/-- The bilinear `gFormC`-isometry predicate on `O Cut` operators:
    `∀ u v, gFormC (S u) (S v) = gFormC u v`. -/
def IsGFormCIsom (S : O Cut →ₗ[Cut] O Cut) : Prop :=
  ∀ u v : O Cut, gFormC (S u) (S v) = gFormC u v

/-- ★ THE CONCRETE ALPHABET GROUNDING: the banked bisector reflection's octonion-block v-block
    `octReflBlock e w` (N121) IS a bilinear `gFormC`-isometry. Its DIAGONAL preservation
    `octReflBlock_gFormC_diag` (N121, from the three-factor Born composition at the Born-unit
    bisector) polarized to the bilinear form by the banked Born polarization `gFormC_polarize`
    (N112, completing the square over `Cut`). The alphabet members the global exhaustion's reflection
    product is drawn from are genuine isometries, DERIVED — not posited. -/
theorem octReflBlock_isGFormCIsom {e w : O Cut} (hne : e - w ≠ 0) :
    IsGFormCIsom (octReflBlock e w) :=
  fun u v => gFormC_polarize (octReflBlock e w) (fun x => octReflBlock_gFormC_diag hne x) u v

/-! ## THE FINRANK-STRONG-RECURSION SKELETON — the abstract Cartan–Dieudonné descent. -/

/-- THE RECURSION HELPER, by `Nat.strong_induction_on` the fixed-subspace codimension
    `m = 8 − finrank (fixSubmodule S)`. Given a peel ORACLE — for any non-identity isometry `T`
    there is a reflection `R` from the alphabet `refl` with `R · R = 1`, `R · T` again an isometry,
    and `finrank (fixSubmodule T) < finrank (fixSubmodule (R · T))` (the fixed subspace STRICTLY
    grows) — every `gFormC`-isometry `S` lies in `Submonoid.closure refl`. The descent: `m = 0` ⟹
    `finrank (fixSubmodule S) = 8` ⟹ `S = id = 1 ∈ closure` (base case `isom_fix_full_eq_id`); else
    peel `R`, the codimension of `R · S` strictly drops (`fixSubmodule_finrank_le` keeps it `≤ 8`),
    the strong-IH puts `R · S ∈ closure`, and the involution reassembly `S = R · (R · S)` closes
    membership. The Cartan–Dieudonné structure theorem reduced to the single local peel step. -/
theorem reflection_exhaustion_aux
    (refl : Set (Module.End Cut (O Cut)))
    (oracle : ∀ T : O Cut →ₗ[Cut] O Cut, IsGFormCIsom T → T ≠ LinearMap.id →
        ∃ R ∈ refl, R * R = 1 ∧ IsGFormCIsom (R * T) ∧
          Module.finrank Cut (fixSubmodule T)
            < Module.finrank Cut (fixSubmodule (R * T))) :
    ∀ (m : ℕ) (S : O Cut →ₗ[Cut] O Cut), IsGFormCIsom S →
      8 - Module.finrank Cut (fixSubmodule S) = m →
      S ∈ Submonoid.closure refl := by
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
    intro S hS hm
    by_cases hid : S = LinearMap.id
    · rw [hid]
      have hone : (LinearMap.id : O Cut →ₗ[Cut] O Cut) = (1 : Module.End Cut (O Cut)) := rfl
      rw [hone]; exact Submonoid.one_mem _
    · obtain ⟨R, hRmem, hRinv, hRT, hlt⟩ := oracle S hS hid
      have hle : Module.finrank Cut (fixSubmodule (R * S)) ≤ 8 := fixSubmodule_finrank_le _
      set m' := 8 - Module.finrank Cut (fixSubmodule (R * S)) with hm'
      have hm'lt : m' < m := by rw [← hm, hm']; omega
      have hRSmem : (R * S) ∈ Submonoid.closure refl := ih m' hm'lt (R * S) hRT rfl
      have hRclos : R ∈ Submonoid.closure refl := Submonoid.subset_closure hRmem
      have hkey : S = R * (R * S) := by rw [← mul_assoc, hRinv, one_mul]
      rw [hkey]
      exact Submonoid.mul_mem _ hRclos hRSmem

/-- ★★ THE GLOBAL OCTONION-BLOCK EXHAUSTION (abstract form, over the derived `Cut`): given the peel
    ORACLE, every `gFormC`-isometry on the terminal algebra `O Cut` is a finite product of
    reflections from the alphabet `refl` (`Submonoid.closure refl`). The
    `m = 8 − finrank (fixSubmodule S)` specialization of the recursion skeleton — the well-founded
    descent on the fixed-subspace codimension, terminating at the cascade-COUNTED depth
    `finrank (O Cut) = 8` (N122). The entire `SO(8)` surjectivity REDUCED to the single local peel
    step (childed N124: the construction of the oracle, the genuine heavy group-manifold core).
    DERIVED from the banked N49–N122 + the derived ℝ `Cut` + the terminal algebra `O Cut`. -/
theorem reflection_exhaustion
    (refl : Set (Module.End Cut (O Cut)))
    (oracle : ∀ T : O Cut →ₗ[Cut] O Cut, IsGFormCIsom T → T ≠ LinearMap.id →
        ∃ R ∈ refl, R * R = 1 ∧ IsGFormCIsom (R * T) ∧
          Module.finrank Cut (fixSubmodule T)
            < Module.finrank Cut (fixSubmodule (R * T)))
    (S : O Cut →ₗ[Cut] O Cut) (hS : IsGFormCIsom S) :
    S ∈ Submonoid.closure refl :=
  reflection_exhaustion_aux refl oracle _ S hS rfl

/-! ## W8 teeth — the abstract fixed subspace tied to a concrete banked alphabet member. -/

/-- ★ W8 — THE FIXED SUBSPACE IS CONCRETELY NON-VACUOUS. The banked bisector reflection
    `octReflBlock e₂ je2` (a genuine bilinear isometry, `octReflBlock_isGFormCIsom`) FIXES the
    unit-imaginary axis `ke2je2` (`octReflBlock_witness`, N121, because `ke2je2 ⊥ e₂ − je2`), so
    `ke2je2` lies in its `fixSubmodule` — the abstract fixed subspace of the recursion realized on a
    concrete alphabet member, not a vacuous one. -/
theorem octReflBlock_witness_mem_fix :
    (ke2je2 : O Cut) ∈ fixSubmodule (octReflBlock (CD.e2 : O Cut) (je2 : O Cut)) := by
  rw [mem_fixSubmodule]
  exact octReflBlock_witness

end

end Phys.Algebra
