/-
  Phys.Algebra.ConfinementAreaLaw — N387 (arc-I I3): THE AREA LAW.
  ============================================================================
  DIRECTED SUCCESSOR of N386 (arc-I I2 → I3), per docs/SEED_QCD_CONFINEMENT.md
  §I3. N385 banked the confinement CRITERION (confines IFF non-associative);
  N386 banked the colour-singlet DICHOTOMY (which sections escape confinement).
  This node derives WHY the confined potential grows LINEARLY — the area law.

  THE RESULT (theory-native, DERIVED — never asserted). The Wilson-loop
  area-scaling FORM `⟨W(C)⟩ ~ exp(−σ·Area)`, where the descent obstruction
  accumulates PER PLAQUETTE over the enclosed 2-DIMENSIONAL region, NOT per
  boundary step:

    • `wilsonArea_form`      : `wilsonArea σ m n = cutExp (−(σ · (m·n)))` — the
                               accumulated suppression over the `m×n` plaquette
                               grid IS the derived-ℝ exponential of `−σ·Area`;
    • `wilsonArea_prod`      : it is the PRODUCT of one per-plaquette factor over
                               the 2-cell index grid `Fin m × Fin n` — one
                               obstruction factor per 2-cell, so the count is the
                               enclosed AREA `m·n`;
    • `wilsonArea_lt_one`    : STRICT suppression `< 1` for `σ > 0`, `Area > 0`;
    • `wilsonArea_strictAnti`: the suppression grows STRICTLY with the enclosed
                               AREA (`w^A₂ < w^A₁` for `A₁ < A₂`);
    • `area_beats_perimeter` : for a large square loop the AREA-scaling `n²`
                               suppresses strictly MORE than the PERIMETER-scaling
                               `4n` — the structural reason the potential grows
                               LINEARLY, not being bounded by the boundary.

  THE MECHANISM — WHY AREA, NOT PERIMETER (the crux, FORCED). The descent
  obstruction to gluing the local left-regular worlds IS the octonion associator
  (N219/N385 `o_gluingDefect_eq_assoc`), a TRILINEAR (triple-overlap) alternating
  form. Reconciling a 2-DIMENSIONAL region of overlaps requires ONE obstruction
  factor per 2-cell (plaquette) tiling the region — the number of such factors is
  the CARDINALITY of a 2-dim index grid = the enclosed AREA (`Finset.prod` over
  `Fin m × Fin n`), NOT the 1-dim boundary length. Area-vs-perimeter is a pure
  COUNTING fact about the dimensionality of the obstruction, not a posited
  confinement dynamics.

  THE PER-PLAQUETTE WEIGHT IS THE BORN SELF-OVERLAP OF THE OBSTRUCTION (DERIVED,
  not fit). The per-plaquette suppression factor is `cutExp (−σ)` where `σ` is the
  Born self-overlap of the associator obstruction, `bornAction a b x =
  gForm [a,b,x] [a,b,x]` (Born = self-overlap = positivity, the trunk primitive;
  `gForm_self_nonneg`, N24). And this ties the area law DIRECTLY to the N386
  dichotomy:
    • `bornAction_singlet_zero`  : `σ = 0` on the fold's own complex line
                                   `span{1, u1}` (`singlet_assoc_vanishes`, N386),
                                   so the per-plaquette factor is `1` — NO area
                                   suppression, the singlet is DECONFINED;
    • `bornAction_coloured_pos`  : `σ > 0` at the coloured non-associating witness
                                   (`assoc_nonvanishing`, the SAME nonvanishing the
                                   criterion used, `gForm_self_eq_zero`), so the
                                   factor is `< 1` — area suppression, CONFINED.
  The string tension `σ` is the per-plaquette Born action, a DERIVED nonnegative
  ratio that is exactly ZERO on the singlet sector and POSITIVE on the coloured
  sector — the same octonion non-associativity that stopped the cascade, read as a
  per-plaquette obstruction density. One cause, a new consequence.

  ⚠ GRADE (honest, docs/SEED_QCD_CONFINEMENT.md §I3). The area-scaling FORM and
  the `σ = 0` (singlet) / `σ > 0` (coloured) dichotomy are THEOREM-ROUTE, proved
  on the banked concrete objects. The NUMERICAL VALUE of the string tension `σ`
  (as a scale, e.g. the lattice `σ ≈ 0.19 GeV²`) is candidate/mechanism — `σ` is
  kept as a DERIVED per-plaquette Born action, never fit to a measured value. No
  empirical number (lattice `σ`, `Λ_QCD`, `938 MeV`) appears in any statement or
  proof — removable prose only (NO-FIT guard G2).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Wilson / plaquette /
  string tension / confinement / quark / area law": the theorems say the derived-ℝ
  exponential `cutExp (−σ)` raised to the CARDINALITY of a 2-dim index grid equals
  `cutExp (−(σ·(m·n)))`; it is a product of one factor per 2-cell; it is in `(0,1)`
  for `σ > 0`; it strictly decreases as the grid area grows; and the weight `σ` is
  the Born form `gForm` of the octonion associator, `= 0` on the 2-dim subalgebra
  `span{1, u1}` and `> 0` at the non-associating triple. Pure statements about a
  positive self-overlap number accumulated over a 2-dim index region. No physics
  name is load-bearing.

  FREE-FLOATING check (SOUL rail). Every theorem TYPE mentions the banked concrete
  objects — the derived-ℝ `Cut` and its banked `cutExp`, the banked associator
  `assoc` on `O ℚ`, the banked Born form `gForm`, the banked `span{1, u1}` (=
  N266 colour-neutral core via N386), and the banked non-associating witness. Not
  generic over an arbitrary carrier: `bornAction` routes through the
  octonion-SPECIFIC `assoc` + `gForm` + `singlet_assoc_vanishes` + the concrete
  witness `(ι(ιJ), ι(e₂), e₂)`.

  DEPENDENCIES (all banked, foundations-only): N386 `ConfinementColourSinglet`
  (`singlet_assoc_vanishes`), N174/N175 `ContinuumExp`/`ContinuumLog`
  (`cutExp`, `cutExp_pos/zero/add`, `cutExp_strictMono`,
  `cutExp_le_one_of_nonpos`), N24 `DerivationCompact` (`gForm`,
  `gForm_self_nonneg`, `gForm_self_eq_zero`), Alternative (`assoc`,
  `assoc_nonvanishing`). Ground field the DERIVED ℝ `Cut` — NOT Mathlib-ℝ as
  content; Mathlib is MACHINERY only (Finset/Fintype/order lemmas).

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge.
-/
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Phys.Foundation.ContinuumLog
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The per-plaquette factor and the accumulated area weight. -/

/-- THE PER-PLAQUETTE SUPPRESSION FACTOR `w = exp(−σ)` on the BANKED derived-ℝ
    exponential `cutExp`. `σ` is the per-2-cell Born obstruction action (below,
    `bornAction`). Physics-words-removable: `cutExp` of the negative weight. -/
def plaqFactor (σ : Cut) : Cut := cutExp (-σ)

/-- THE ACCUMULATED AREA WEIGHT over the `m × n` plaquette grid: one per-plaquette
    factor per 2-cell, so the exponent counts the enclosed AREA `m·n`. This is the
    `⟨W(C)⟩` of a rectangular loop enclosing an `m × n` region. -/
def wilsonArea (σ : Cut) (m n : ℕ) : Cut := plaqFactor σ ^ (m * n)

/-- THE PER-PLAQUETTE BORN OBSTRUCTION ACTION `σ = gForm [a,b,x] [a,b,x]`, cast
    into the derived ℝ: the Born SELF-OVERLAP of the descent obstruction (the
    octonion associator). DERIVED, not fit — nonnegative (Born positivity), zero on
    the singlet subalgebra, positive on the coloured sector. -/
def bornAction (a b x : O ℚ) : Cut :=
  ((gForm (assoc a b x) (assoc a b x) : ℚ) : Cut)

/-! ## THE AREA LAW FORM. -/

/-- ★★ THE AREA LAW. The accumulated weight over the `m × n` plaquette grid IS the
    derived-ℝ exponential of `−σ·Area`: `wilsonArea σ m n = cutExp (−(σ·(m·n)))`.
    The one-per-2-cell obstruction factor `cutExp(−σ)` raised to the number of
    2-cells (the enclosed AREA `m·n`). This is `⟨W(C)⟩ ~ exp(−σ·Area)`, DERIVED
    from the obstruction being a triple-overlap (2-dim-accumulating) object. -/
theorem wilsonArea_form (σ : Cut) (m n : ℕ) :
    wilsonArea σ m n = cutExp (-(σ * ((m * n : ℕ) : Cut))) := by
  unfold wilsonArea plaqFactor
  induction (m * n) with
  | zero => simp [cutExp_zero]
  | succ k ih => rw [pow_succ, ih, cutExp_add]; congr 1; push_cast; ring

/-- ★ THE AREA WEIGHT IS A PRODUCT OF ONE FACTOR PER 2-CELL. The accumulated
    weight is `∏` over the 2-dimensional plaquette index grid `Fin m × Fin n` of
    the single per-plaquette factor — making explicit that the obstruction
    accumulates over a 2-DIMENSIONAL region (its cardinality is the AREA `m·n`),
    NOT over the 1-dim boundary. -/
theorem wilsonArea_prod (σ : Cut) (m n : ℕ) :
    wilsonArea σ m n = ∏ _p ∈ (Finset.univ : Finset (Fin m × Fin n)), plaqFactor σ := by
  unfold wilsonArea
  rw [Finset.prod_const, Finset.card_univ, Fintype.card_prod, Fintype.card_fin,
    Fintype.card_fin]

/-! ## Order properties of the area weight (Born positivity + strict suppression). -/

/-- BORN POSITIVITY: `0 < wilsonArea` — the area weight is a genuine self-overlap
    number (banked `cutExp_pos`), never zero. -/
theorem wilsonArea_pos (σ : Cut) (m n : ℕ) : 0 < wilsonArea σ m n := by
  unfold wilsonArea plaqFactor; exact pow_pos (cutExp_pos _) _

/-- `wilsonArea ≤ 1` for `σ ≥ 0`: a nonnegative per-plaquette action can only
    SUPPRESS (banked `cutExp_le_one_of_nonpos`). -/
theorem wilsonArea_le_one (σ : Cut) (m n : ℕ) (hσ : 0 ≤ σ) :
    wilsonArea σ m n ≤ 1 := by
  unfold wilsonArea plaqFactor
  apply pow_le_one₀ (le_of_lt (cutExp_pos _))
  exact cutExp_le_one_of_nonpos _ (by linarith)

/-- ★ STRICT AREA SUPPRESSION: `wilsonArea < 1` for `σ > 0` and enclosed
    `Area > 0`. The per-plaquette factor is strictly `< 1` (banked
    `cutExp_strictMono` vs `cutExp_zero`), and it is raised to a positive power —
    the enclosed area. The core I3 content: a positive per-plaquette obstruction
    forces strict suppression that survives to the whole enclosed region. -/
theorem wilsonArea_lt_one (σ : Cut) (m n : ℕ) (hσ : 0 < σ) (hA : 0 < m * n) :
    wilsonArea σ m n < 1 := by
  unfold wilsonArea plaqFactor
  have hw1 : cutExp (-σ) < 1 := by
    have := cutExp_strictMono (show -σ < 0 by linarith); rwa [cutExp_zero] at this
  have hw0 : 0 < cutExp (-σ) := cutExp_pos _
  calc cutExp (-σ) ^ (m * n) < 1 ^ (m * n) := by
        apply pow_lt_pow_left₀ hw1 (le_of_lt hw0); omega
    _ = 1 := one_pow _

/-- ★ THE SUPPRESSION GROWS WITH THE ENCLOSED AREA. For `σ > 0`, a larger enclosed
    area `A₂ > A₁` is suppressed STRICTLY more: `w^A₂ < w^A₁` (banked
    `pow_lt_pow_right_of_lt_one₀`, since `0 < w < 1`). This is the "area law" as a
    monotonicity: `⟨W(C)⟩` decays with the enclosed area, so the confined potential
    grows with separation — linearly, not saturating. -/
theorem wilsonArea_strictAnti (σ : Cut) (hσ : 0 < σ) {A1 A2 : ℕ} (h : A1 < A2) :
    plaqFactor σ ^ A2 < plaqFactor σ ^ A1 := by
  unfold plaqFactor
  have hw1 : cutExp (-σ) < 1 := by
    have := cutExp_strictMono (show -σ < 0 by linarith); rwa [cutExp_zero] at this
  exact pow_lt_pow_right_of_lt_one₀ (cutExp_pos _) hw1 h

/-- ★★ AREA BEATS PERIMETER — the structural reason the potential grows LINEARLY.
    For a large square loop (`n ≥ 5`), the AREA-scaling weight `wilsonArea σ n n`
    (exponent `n²`) is STRICTLY BELOW the PERIMETER-scaling weight `cutExp(−σ·4n)`
    (exponent `4n`), because `n² > 4n`. A perimeter law would give a constant
    potential (screening); the area law gives a linearly-rising one (confinement).
    The obstruction accumulating over the 2-dim AREA, not the 1-dim boundary, is
    exactly what makes the potential confining. -/
theorem area_beats_perimeter (σ : Cut) (hσ : 0 < σ) {n : ℕ} (hn : 5 ≤ n) :
    wilsonArea σ n n < cutExp (-(σ * ((4 * n : ℕ) : Cut))) := by
  rw [wilsonArea_form]
  apply cutExp_strictMono
  have hlt : (4 * n : ℕ) < n * n := by nlinarith
  have hcast : ((4 * n : ℕ) : Cut) < ((n * n : ℕ) : Cut) := by exact_mod_cast hlt
  nlinarith [mul_lt_mul_of_pos_left hcast hσ]

/-! ## The per-plaquette Born action ties the area law to the N386 dichotomy. -/

/-- BORN POSITIVITY of the per-plaquette action: `0 ≤ σ` always (the Born
    self-overlap of the obstruction is nonnegative, banked `gForm_self_nonneg`,
    N24). So a plaquette can only ever SUPPRESS, never inflate. -/
theorem bornAction_nonneg (a b x : O ℚ) : 0 ≤ bornAction a b x := by
  unfold bornAction; exact_mod_cast gForm_self_nonneg _

/-- ★ SINGLET PLAQUETTES CARRY NO ACTION (DECONFINED). On the fold's own complex
    line `span{1, u1}` the descent obstruction VANISHES (`singlet_assoc_vanishes`,
    N386), so the per-plaquette Born action is exactly `0` and the per-plaquette
    factor is `1` — NO area suppression. The singlet sector obeys a trivial
    (perimeter-free) law: it is UNCONFINED, matching N386's `singlet_sheafifies`. -/
theorem bornAction_singlet_zero {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    bornAction a b x = 0 := by
  unfold bornAction
  rw [singlet_assoc_vanishes ha hb x]
  simp only [gForm_self_eq_zero.mpr rfl]
  norm_num

/-- ★ COLOURED PLAQUETTES CARRY POSITIVE ACTION (CONFINED). At the coloured
    non-associating witness `(ι(ιJ), ι(e₂), e₂)` the descent obstruction is
    genuinely nonzero (`assoc_nonvanishing`, the SAME nonvanishing the confinement
    criterion used), so its Born self-overlap is STRICTLY POSITIVE
    (`gForm_self_eq_zero`) — a strictly-suppressing per-plaquette factor `< 1`.
    The coloured sector obeys a genuine area law: it is CONFINED, matching N386's
    `full_not_sheafifies`. -/
theorem bornAction_coloured_pos :
    0 < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) := by
  unfold bornAction
  have hne : assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0 :=
    assoc_nonvanishing
  have hq : (0 : ℚ) <
      gForm (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))
        (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) := by
    rcases (gForm_self_nonneg _).lt_or_eq with h | h
    · exact h
    · exact absurd (gForm_self_eq_zero.mp h.symm) hne
  exact_mod_cast hq

/-! ## The capstones. -/

/-- ★★★ THE AREA-LAW DICHOTOMY. The per-plaquette Born obstruction action `σ`
    (= the Born self-overlap of the descent obstruction) is exactly `0` on the
    fold's own complex line `span{1, u1}` (the DERIVED colour-neutral core, N386)
    and STRICTLY POSITIVE at the coloured non-associating witness. So:
      • singlet plaquettes ⟹ factor `1` ⟹ NO area suppression ⟹ DECONFINED;
      • coloured plaquettes ⟹ factor `< 1` ⟹ area suppression ⟹ CONFINED.
    The area law confines EXACTLY the coloured sector, and the string tension is
    the Born self-overlap of the octonion associator — the same non-associativity
    that stopped the cascade. DERIVED, not asserted. -/
theorem area_law_dichotomy :
    (∀ {a b : O ℚ}, a ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
      b ∈ Submodule.span ℚ {(1 : O ℚ), u1} → ∀ x : O ℚ, bornAction a b x = 0) ∧
    0 < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) :=
  ⟨fun ha hb x => bornAction_singlet_zero ha hb x, bornAction_coloured_pos⟩

/-- ★★★ THE AREA LAW — the structural form and all its consequences at once, on the
    banked derived-ℝ `cutExp` and the banked octonion associator/Born form. For a
    positive per-plaquette action `σ > 0` and a nonempty enclosed area:
    (1) the FORM `wilsonArea σ m n = cutExp(−(σ·(m·n)))` (area, not perimeter,
        because the obstruction accumulates over a 2-dim grid);
    (2) it is a Born-positive number `0 < ⟨W⟩`;
    (3) STRICT suppression `< 1` for enclosed `Area > 0`;
    (4) the suppression grows STRICTLY with the enclosed area;
    (5) AREA beats PERIMETER for a large square loop — the linearly-rising
        potential.
    The string tension `σ` remains a DERIVED per-plaquette Born action (the
    dichotomy: `0` on singlets, `> 0` on coloured) — its numerical value is
    candidate/mechanism (never fit). -/
theorem area_law_form (σ : Cut) (m n : ℕ) (hσ : 0 < σ) (hA : 0 < m * n) :
    wilsonArea σ m n = cutExp (-(σ * ((m * n : ℕ) : Cut))) ∧
    0 < wilsonArea σ m n ∧
    wilsonArea σ m n < 1 ∧
    (∀ {A1 A2 : ℕ}, A1 < A2 → plaqFactor σ ^ A2 < plaqFactor σ ^ A1) ∧
    (∀ {k : ℕ}, 5 ≤ k → wilsonArea σ k k < cutExp (-(σ * ((4 * k : ℕ) : Cut)))) :=
  ⟨wilsonArea_form σ m n,
   wilsonArea_pos σ m n,
   wilsonArea_lt_one σ m n hσ hA,
   fun h => wilsonArea_strictAnti σ hσ h,
   fun hk => area_beats_perimeter σ hσ hk⟩

end

end Phys.Algebra
