/-
  Phys.Algebra.LorentzContinuumGenerationIndefiniteExhaustion — N127: THE INDEFINITE
  FINRANK-STRONG-RECURSION ASSEMBLY (adapting N123's abstract Cartan–Dieudonné descent over the
  8-dim terminal algebra `O Cut` to the INDEFINITE Minkowski signature over the FULL 10-dim
  spacetime `STVC = Cut × Cut × O Cut`; the local peel is N125's anisotropic-difference single
  reflection `houseHolderM_oracle`).

  ===========================================================================
  CONTEXT. N123 banked the abstract finrank-strong-recursion SKELETON `reflection_exhaustion` over
  the positive-definite 8-dim terminal algebra `O Cut`: given a peel ORACLE — for any non-identity
  isometry `T` a reflection `R` with `R · R = 1`, `R · T` an isometry, and
  `finrank (fixSubmodule T) < finrank (fixSubmodule (R · T))` — EVERY `gFormC`-isometry is a finite
  product of reflections (`Submonoid.closure refl`), the descent riding on the codimension
  `8 − finrank (fixSubmodule S)` strictly decreasing. N125 banked the INDEFINITE-signature peel
  oracle `houseHolderM_oracle` over the full 10-dim `STVC` carrying the indefinite Minkowski form
  `BvC` (signature `(1,9)`): a `BvC`-isometry `T` with a moved `v` whose DIFFERENCE `a := T v − v`
  is ANISOTROPIC (`BvC a a ≠ 0`) admits the single reflection `houseHolderM a`, an involution, with
  `R · T` a `BvC`-isometry of STRICTLY LARGER fixed subspace. N126 banked `houseHolderM_null_peel_back`
  (the null-difference two-reflection SEND-BACK `R (T v) = v`, even when `T v − v` is null).

  ── THE MEASURE (the ROADMAP §N127 priority (i) KEY question; W1/W9 measure-first, by HAND against
     the banked machinery, NOT guessing) ──
  Does the N126 two-reflection composite `R = houseHolderM v ∘ houseHolderM (T v + v)` GROW the fixed
  subspace (the bookkeeping N126 scoped out)? For a `T`-fixed `u`, `R` fixes `u` IFF `u` is
  `BvC`-orthogonal to BOTH `v` and `T v + v`. A `T`-fixed `u` satisfies `BvC (T v − v) u = 0` (the
  N125 ortho fact `hO5`), but NOT necessarily `BvC v u = 0` — so the subset inclusion
  `fixSubmoduleM T ≤ fixSubmoduleM (R · T)` FAILS for the two-reflection (null) case: the reflections
  disturb previously-fixed vectors not `BvC`-orthogonal to `v`. The null/totally-isotropic peel needs
  the classical dimension-RESTRICTION recursion (fix an anisotropic vector, restrict to its
  non-degenerate `BvC`-orthogonal complement), NOT the fixed-subspace-GROWTH recursion. That is the
  genuine HEAVY group-manifold remainder, childed N128.

  ── WHAT THIS NODE BANKS (the indefinite recursion skeleton + the concrete anisotropic reduction) ──
  `fixSubmoduleM_finrank_le` — `finrank Cut (fixSubmoduleM S) ≤ 10` (a submodule of `STVC`,
    `finrank_STVC` N122), so the codimension `10 − finrank` is a well-defined `ℕ` descent.
  `fixSubmoduleM_id` / `fixSubmoduleM_id_finrank` — the identity's fixed subspace is `⊤`, finrank `10`.
  ★★ `isom_fix_full_eq_id_M` — THE BASE CASE / TERMINATION: a `BvC`-operator whose fixed subspace is
    full-rank (`finrank = 10`) is the identity (`Submodule.eq_top_of_finrank_eq` at the banked
    `finrank_STVC`, N122). The descent terminates exactly when the fixed subspace fills `STVC`.
  ★★ `reflection_exhaustion_M_aux` / `reflection_exhaustion_M` — THE INDEFINITE FINRANK-STRONG-RECURSION
    SKELETON: given a peel ORACLE (a fully proved implication — for any non-identity `BvC`-isometry
    `T` a reflection `R ∈ refl` with `R · R = 1`, `R · T` a `BvC`-isometry, and
    `finrank (fixSubmoduleM T) < finrank (fixSubmoduleM (R · T))`), EVERY `BvC`-isometry `S` lies in
    `Submonoid.closure refl`. By `Nat.strong_induction_on` the codimension
    `m = 10 − finrank (fixSubmoduleM S)`: `m = 0` ⟹ `S = id` (base case) ⟹ `S = 1 ∈ closure`; else
    peel `R`, the codimension of `R · S` strictly drops (`fixSubmoduleM_finrank_le` keeps it `≤ 10`),
    the strong-IH puts `R · S ∈ closure`, the involution reassembly `S = R · (R · S)` closes membership.
  ★★ `reflection_exhaustion_M_aniso` — THE CONCRETE REDUCTION: plugging N125's anisotropic peel oracle
    `houseHolderM_oracle` into the skeleton reduces the FULL `SO⁺(1,9)` exhaustion to the SINGLE
    remaining question `haniso_exists` — every non-identity `BvC`-isometry has SOME moved vector with
    anisotropic difference. Every `BvC`-isometry `S` is then a finite product of `houseHolderMSet`
    reflections (`Submonoid.closure houseHolderMSet`).
  W8 teeth: `houseHolderM_mTimeUnit_mem_closure` (the concrete reflection at the timelike unit axis
    is a genuine alphabet member of the closure) + `exhaustion_witness_self_overlap` (the double
    reflection of the timelike axis reads `BvC = 1`, NOT `127` — the costume bite).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the fixed subspace `fixSubmoduleM S := ker (S − id)` (N125); the indefinite
  Minkowski form `BvC` polarized from the cascade's own Born quadratic (N-LieAlgebra); the dimension
  `finrank_STVC = 10` (N122, via the cascade's own doubling); the peel oracle `houseHolderM_oracle`
  (N125), an involution with strict finrank growth; the reflection `houseHolderM` /
  `houseHolderM_neg_self` and the alphabet `houseHolderMSet` (N125). `Nat.strong_induction_on` /
  `Submodule.eq_top_of_finrank_eq` / `Submodule.finrank_le` / `Submonoid.closure` / `Submonoid.mul_mem`
  standard Mathlib MACHINERY on the DERIVED objects (STANDARD §3), over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. The peel ORACLE is a fully-explicit
  HYPOTHESIS (a fully proved implication, NOT a fact taken without a proof): the skeleton proves the
  recursion well-founded and assembling GIVEN the local peel, reducing — not asserting — the global
  content. The anisotropic reduction `reflection_exhaustion_M_aniso` then discharges the oracle from
  N125's banked `houseHolderM_oracle`, leaving the SINGLE crisp `haniso_exists` question (childed N128).
  NOT a posited Lorentz group / `SO⁺(1,9)`, NOT a posited indefinite-Cartan–Dieudonné structure
  theorem, NOT a posited reflection/Clifford group, NOT a posited operator topology, NOT Mathlib ℝ/ℂ
  as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full Lorentz group
  `SO⁺(1,9)` and reads off the indefinite Cartan–Dieudonné structure theorem (every Minkowski
  isometry is a finite product of reflections, by induction on the orthogonal complement of a fixed
  anisotropic vector) as a standard fact. Here the recursion is CONSTRUCTED forward from the trunk:
  the descent variable is the codimension of the kernel of the trunk's own `S − id`, bounded by the
  cascade-COUNTED dimension `10` (N122); the termination is `Submodule.eq_top_of_finrank_eq` at that
  counted dimension; the reassembly is the banked involution; the alphabet members are the banked
  indefinite Householder reflections, proved `BvC`-isometries by N125. The entire `SO⁺(1,9)`
  surjectivity (over the anisotropic-difference moved vectors) is REDUCED to the single crisp
  existence question `haniso_exists`, not asserted by a posited group-theoretic structure theorem.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / boost / rotation / reflection / Householder / Minkowski / metric / signature /
  timelike / spacelike / null / isotropic / anisotropic / isometry / peel / oracle / fixed /
  orthogonal / Cartan / Dieudonné / exhaustion / surjectivity / generation / recursion / depth /
  complement / SO⁺(1,9) / Spin": what remains is pure linear algebra over the derived complete
  ordered field `Cut` — for `fixSubmoduleM S := ker (S − id)` on `STVC = Cut × Cut × O Cut`, if a
  `Cut`-linear `S` preserving the bilinear form `BvC` admits, whenever `S ≠ id`, a `refl`-member `R`
  with `R · R = 1`, `R · S` form-preserving, and `finrank (fixSubmoduleM S) < finrank (fixSubmoduleM
  (R · S))`, then `S ∈ Submonoid.closure refl`; the base case is `finrank (fixSubmoduleM S) = 10 ⟹
  S = id`; and with `refl := houseHolderMSet` the oracle is discharged from `houseHolderM_oracle`
  given only that every non-identity `S` has a moved `v` with `BvC (S v − v)(S v − v) ≠ 0`. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationNullPeel

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The codimension bookkeeping for the indefinite descent over `STVC`. -/

/-- The fixed subspace `fixSubmoduleM S` (N125) has `finrank ≤ 10` (it is a submodule of `STVC`,
    `finrank_STVC` N122), so the codimension `10 − finrank (fixSubmoduleM S)` is a well-defined `ℕ`
    descent variable. -/
theorem fixSubmoduleM_finrank_le (S : Module.End Cut STVC) :
    Module.finrank Cut (fixSubmoduleM S) ≤ 10 := by
  rw [← finrank_STVC]
  exact Submodule.finrank_le (fixSubmoduleM S)

/-- The identity's fixed subspace is the whole space `⊤`. -/
theorem fixSubmoduleM_id :
    fixSubmoduleM (LinearMap.id : Module.End Cut STVC) = ⊤ := by
  rw [Submodule.eq_top_iff']
  intro p
  rw [mem_fixSubmoduleM, LinearMap.id_apply]

/-- The identity's fixed subspace has finrank `10` (the full spacetime dimension, N122). -/
theorem fixSubmoduleM_id_finrank :
    Module.finrank Cut (fixSubmoduleM (LinearMap.id : Module.End Cut STVC)) = 10 := by
  rw [fixSubmoduleM_id, finrank_top, finrank_STVC]

/-! ## THE BASE CASE / TERMINATION of the indefinite descent. -/

/-- ★★ THE BASE CASE / TERMINATION: a `Cut`-linear operator on `STVC` whose fixed subspace is
    full-rank (`finrank = 10`) is the identity. The fixed subspace equals `⊤`
    (`Submodule.eq_top_of_finrank_eq` at the banked `finrank_STVC`, N122), so every vector is fixed.
    The indefinite descent terminates exactly when the fixed subspace fills the spacetime — the
    explicit depth `10` the full `SO⁺(1,9)` exhaustion bottoms out at. -/
theorem isom_fix_full_eq_id_M (S : Module.End Cut STVC)
    (hfix : Module.finrank Cut (fixSubmoduleM S) = 10) :
    S = LinearMap.id := by
  have htop : fixSubmoduleM S = ⊤ :=
    Submodule.eq_top_of_finrank_eq (by rw [hfix, finrank_STVC])
  apply LinearMap.ext
  intro p
  have hp : p ∈ fixSubmoduleM S := htop ▸ Submodule.mem_top
  rw [mem_fixSubmoduleM] at hp
  rw [hp, LinearMap.id_apply]

/-! ## THE INDEFINITE FINRANK-STRONG-RECURSION SKELETON. -/

/-- THE RECURSION HELPER, by `Nat.strong_induction_on` the fixed-subspace codimension
    `m = 10 − finrank (fixSubmoduleM S)`. Given a peel ORACLE — for any non-identity `BvC`-isometry
    `T` there is a reflection `R` from the alphabet `refl` with `R · R = 1`, `R · T` again a
    `BvC`-isometry, and `finrank (fixSubmoduleM T) < finrank (fixSubmoduleM (R · T))` (the fixed
    subspace STRICTLY grows) — every `BvC`-isometry `S` lies in `Submonoid.closure refl`. The
    indefinite analogue of N123's `reflection_exhaustion_aux`, dimension `10` instead of `8`. -/
theorem reflection_exhaustion_M_aux
    (refl : Set (Module.End Cut STVC))
    (oracle : ∀ T : Module.End Cut STVC, IsBvIsomLin T → T ≠ LinearMap.id →
        ∃ R ∈ refl, R * R = 1 ∧ IsBvIsomLin (R * T) ∧
          Module.finrank Cut (fixSubmoduleM T)
            < Module.finrank Cut (fixSubmoduleM (R * T))) :
    ∀ (m : ℕ) (S : Module.End Cut STVC), IsBvIsomLin S →
      10 - Module.finrank Cut (fixSubmoduleM S) = m →
      S ∈ Submonoid.closure refl := by
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
    intro S hS hm
    by_cases hid : S = LinearMap.id
    · rw [hid]
      have hone : (LinearMap.id : Module.End Cut STVC) = (1 : Module.End Cut STVC) := rfl
      rw [hone]; exact Submonoid.one_mem _
    · obtain ⟨R, hRmem, hRinv, hRT, hlt⟩ := oracle S hS hid
      have hle : Module.finrank Cut (fixSubmoduleM (R * S)) ≤ 10 := fixSubmoduleM_finrank_le _
      set m' := 10 - Module.finrank Cut (fixSubmoduleM (R * S)) with hm'
      have hm'lt : m' < m := by rw [← hm, hm']; omega
      have hRSmem : (R * S) ∈ Submonoid.closure refl := ih m' hm'lt (R * S) hRT rfl
      have hRclos : R ∈ Submonoid.closure refl := Submonoid.subset_closure hRmem
      have hkey : S = R * (R * S) := by rw [← mul_assoc, hRinv, one_mul]
      rw [hkey]
      exact Submonoid.mul_mem _ hRclos hRSmem

/-- ★★ THE INDEFINITE FINRANK-STRONG-RECURSION SKELETON (abstract form, over the derived `Cut`):
    given the peel ORACLE, every `BvC`-isometry on the spacetime `STVC` is a finite product of
    reflections from the alphabet `refl` (`Submonoid.closure refl`). The
    `m = 10 − finrank (fixSubmoduleM S)` specialization of the recursion skeleton — the well-founded
    descent on the fixed-subspace codimension, terminating at the cascade-COUNTED depth
    `finrank STVC = 10` (N122). The entire `SO⁺(1,9)` surjectivity (over the anisotropic-difference
    moved vectors) REDUCED to the single local peel step. The indefinite analogue of N123's
    `reflection_exhaustion`. DERIVED from the banked N49–N126 + the derived ℝ `Cut` + the terminal
    algebra `O Cut` + the indefinite Minkowski form `BvC`. -/
theorem reflection_exhaustion_M
    (refl : Set (Module.End Cut STVC))
    (oracle : ∀ T : Module.End Cut STVC, IsBvIsomLin T → T ≠ LinearMap.id →
        ∃ R ∈ refl, R * R = 1 ∧ IsBvIsomLin (R * T) ∧
          Module.finrank Cut (fixSubmoduleM T)
            < Module.finrank Cut (fixSubmoduleM (R * T)))
    (S : Module.End Cut STVC) (hS : IsBvIsomLin S) :
    S ∈ Submonoid.closure refl :=
  reflection_exhaustion_M_aux refl oracle _ S hS rfl

/-- ★★ THE CONCRETE REDUCTION: plugging N125's anisotropic peel oracle `houseHolderM_oracle` into the
    indefinite skeleton reduces the FULL `SO⁺(1,9)` exhaustion to the SINGLE remaining question
    `haniso_exists` — every non-identity `BvC`-isometry has SOME moved vector `v` with `T v ≠ v` and
    ANISOTROPIC difference `BvC (T v − v)(T v − v) ≠ 0`. GIVEN that single existence fact (a fully
    proved implication, not asserted), every `BvC`-isometry `S` is a finite product of
    `houseHolderMSet` reflections. The genuine remaining group-manifold content (discharging
    `haniso_exists`, i.e. the totally-isotropic existence question, plus the dimension-restriction
    recursion when no anisotropic moved vector exists) is the childed remainder N128. -/
theorem reflection_exhaustion_M_aniso
    (haniso_exists : ∀ T : Module.End Cut STVC, IsBvIsomLin T → T ≠ LinearMap.id →
        ∃ v : STVC, T v ≠ v ∧ BvC (T v - v) (T v - v) ≠ 0)
    (S : Module.End Cut STVC) (hS : IsBvIsomLin S) :
    S ∈ Submonoid.closure houseHolderMSet := by
  apply reflection_exhaustion_M houseHolderMSet ?_ S hS
  intro T hT hid
  obtain ⟨v, hv, haniso⟩ := haniso_exists T hT hid
  exact houseHolderM_oracle T hT hv haniso

/-! ## W8 teeth — a concrete alphabet member of the closure + the double-reflection self-overlap. -/

/-- ★ W8 — THE ALPHABET IS CONCRETELY NON-VACUOUS: the indefinite Householder reflection at the
    timelike unit axis `mTimeUnit = (1,0,0)` (Minkowski self-overlap `+1 ≠ 0`, `BvC_mTimeUnit_self`)
    is a genuine member of `Submonoid.closure houseHolderMSet` — the abstract reflection alphabet of
    the indefinite exhaustion realized on a concrete derived vector, not a vacuous one. -/
theorem houseHolderM_mTimeUnit_mem_closure :
    houseHolderM (mTimeUnit : STVC) ∈ Submonoid.closure houseHolderMSet := by
  apply Submonoid.subset_closure
  exact ⟨mTimeUnit, by rw [BvC_mTimeUnit_self]; exact one_ne_zero, rfl⟩

/-- ★ W8 TEETH — the Minkowski self-overlap of the DOUBLE indefinite reflection of the timelike axis
    reads `1` (`= BvC mTimeUnit mTimeUnit`), NOT `127`. Since `houseHolderM mTimeUnit` is an
    involution at the timelike axis (`houseHolderM_neg_self`, `BvC = 1 ≠ 0`), the double reflection
    returns `mTimeUnit`, whose Minkowski self-overlap is `1`. The distinguishing read-off the costume
    C159 bites. -/
theorem exhaustion_witness_self_overlap :
    BvC (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
        (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
      = 1 := by
  have hb : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0 := by
    rw [BvC_mTimeUnit_self]; exact one_ne_zero
  rw [houseHolderM_neg_self hb, map_neg, houseHolderM_neg_self hb, neg_neg, BvC_mTimeUnit_self]

end

end Phys.Algebra
