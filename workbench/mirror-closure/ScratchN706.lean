/-
  # N706 — RATIONAL GROUND WELD (the referee's provenance finding)

  THE FINDING: the continuum `Cut` is built over the DERIVED rational field
  `Phys.Foundation.Q` (RationalTower: `Q := Quotient ratSetoid`, the field of
  fractions of the derived `Z`), but the algebra tree runs on Mathlib's `ℚ`
  with no banked bridge. THE FIX — ONE WELD: the canonical map `ℚ → Q` (the
  prime-field cast), proved to be
    • a RING HOM (bundled: `Rat.castHom Q` — `Q` is a `Field` of char 0,
      char-zero DERIVED from the banked order `Q.isStrictOrderedRing`),
    • INJECTIVE (`Rat.cast_injective` over the derived `CharZero`),
    • ORDER-PRESERVING (`Rat.cast_strictMono` over the banked derived order),
    • SURJECTIVE — the REAL content, proved HONESTLY through the tower itself:
      every derived rational is `ofZ p / ofZ d`, every derived integer is an
      `ℤ`-cast (induction up the re-entry tower `Re`), so every element of `Q`
      is the image of an actual `ℚ` numeral `m / k`. NO named successor needed:
      the ℤ-tower weld is DERIVED here (`ofRe_natCast` / `intCast_surjective`).
    • UNIQUE (`Rat.subsingleton_ringHom`): there is NO CHOICE in how the two
      rational worlds connect — ℚ is the prime field, any two ring homs
      `ℚ →+* Q` are equal.
  THE CAST FACTORIZATION (free from uniqueness): the Mathlib coercion
  `((q : ℚ) : Cut)` (through `Cut`'s own derived `Field` instance) EQUALS the
  derived route `Qcut (foldOfRat q)` — both are ring homs `ℚ →+* Cut`, and
  `ℚ →+* Cut` is a subsingleton. For that, `Qcut : Q → Cut` is bundled here as
  a ring hom (`QcutHom`): additivity was banked (`Qcut_add`); THE NEW WORK is
  multiplicativity `Qcut_mul`, proved on the positive cone against the banked
  `pmul` (approximant construction) and sign-extended through the banked
  negation (`Qcut_neg`, itself free from `Qcut_add`).

  CAPSTONE `rational_ground_welded`: ring hom ∧ injective ∧ strictly monotone ∧
  surjective ∧ unique ∧ the Cut-cast factorization — every `((q:ℚ):Cut)` in the
  algebra tree is PROVABLY the fold-derived rational entering `Cut` under its
  canonical name. Bonus: the full ring equivalence `foldEquiv : ℚ ≃+* Q`.

  Teeth: `foldOfRat 1 = 1 ≠ 0`; `foldOfRat (1/2) ≠ foldOfRat (1/3)`.
  No sorry, no axiom, no new instance posited — everything rides the banked
  derived structures (Q.field, Q.linearOrder, Q.isStrictOrderedRing,
  ContinuumQ.field, Qcut_add, Qcut_strictMono, pmul/mul_of_nonneg).
-/
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Tactic

namespace Phys.Foundation
namespace RationalGroundWeld

open ContinuumQ

/-! ## §1 The canonical map: ℚ is the prime field.

`Q` (the DERIVED rationals) is a `Field` (banked `Q.field`, N9) with a derived
linear order making it a strict ordered ring (banked `Q.linearOrder` /
`Q.isStrictOrderedRing`, OrderedTower). Mathlib's instance chain
`IsStrictOrderedRing → CharZero` then makes `Rat.cast : ℚ → Q` the canonical
(prime-field) ring hom — nothing is posited. -/

/-- THE CANONICAL MAP `ℚ → Q_Fold`: the prime-field cast into the derived
    rationals. -/
noncomputable def foldOfRat : ℚ → Q := Rat.cast

/-- The canonical map, bundled as a RING HOM (`Q` is a characteristic-zero
    division ring — char zero DERIVED from the banked strict-ordered-ring
    structure, not posited). -/
noncomputable def foldOfRatHom : ℚ →+* Q := Rat.castHom Q

@[simp] theorem foldOfRatHom_apply (q : ℚ) : foldOfRatHom q = foldOfRat q := rfl

theorem foldOfRat_add (q r : ℚ) : foldOfRat (q + r) = foldOfRat q + foldOfRat r :=
  map_add foldOfRatHom q r

theorem foldOfRat_mul (q r : ℚ) : foldOfRat (q * r) = foldOfRat q * foldOfRat r :=
  map_mul foldOfRatHom q r

theorem foldOfRat_one : foldOfRat 1 = 1 := map_one foldOfRatHom

theorem foldOfRat_zero : foldOfRat 0 = 0 := map_zero foldOfRatHom

/-! ## §2 Injectivity and order preservation. -/

/-- INJECTIVE: the prime-field cast into the derived `Q` is injective
    (char zero from the DERIVED order). -/
theorem foldOfRat_injective : Function.Injective foldOfRat :=
  Rat.cast_injective

/-- ORDER-PRESERVING: the weld is a STRICT ORDER embedding into the banked
    derived order (`Q.linearOrder` / `Q.isStrictOrderedRing`). -/
theorem foldOfRat_strictMono : StrictMono foldOfRat :=
  Rat.cast_strictMono

theorem foldOfRat_lt {q r : ℚ} (h : q < r) : foldOfRat q < foldOfRat r :=
  foldOfRat_strictMono h

theorem foldOfRat_le_iff {q r : ℚ} : foldOfRat q ≤ foldOfRat r ↔ q ≤ r :=
  foldOfRat_strictMono.le_iff_le

/-! ## §3 SURJECTIVITY — the honest route THROUGH THE TOWER.

An element of the derived `Q` is `mk p d` with `p : Z`, `d` a nonzero derived
integer. We derive the ℤ-tower weld on the spot: every `Re` count is a
`ℕ`-cast image in `Z` (induction up the re-entry tower), hence every derived
integer is an `ℤ`-cast, hence every derived rational is the image of an
actual rational numeral `m / k`. -/

/-- `step` is `+1` — the re-entry step is the ring's successor. -/
theorem Re.step_eq_add_one (x : Re) : Re.step x = x + 1 := by
  rw [show (1 : Re) = Re.step 0 from rfl, Re.add_step, add_zero]

/-- `ofRe` commutes with the step: `ofRe (step a) = ofRe a + 1`. -/
theorem ofRe_step (a : Re) : Z.ofRe (Re.step a) = Z.ofRe a + 1 := by
  show Z.mk (Re.step a) 0 = Z.mk a 0 + Z.mk 1 0
  rw [Z.mk_add_mk, Z.mk_eq, Re.step_eq_add_one]
  ring

/-- ★ THE ℕ-RUNG OF THE WELD: every count's image in `Z` is a `ℕ`-cast —
    induction up the re-entry tower, `void ↦ 0`, `step ↦ +1`. -/
theorem ofRe_natCast : ∀ a : Re, ∃ n : ℕ, Z.ofRe a = (n : Z) := by
  intro a
  induction a with
  | void => exact ⟨0, by simpa using Z.ofRe_zero⟩
  | step a ih =>
    obtain ⟨n, hn⟩ := ih
    exact ⟨n + 1, by rw [ofRe_step, hn]; push_cast; ring⟩

/-- Every signed count is the difference of its two count images. -/
theorem Z.mk_eq_sub (a b : Re) : Z.mk a b = Z.ofRe a - Z.ofRe b := by
  rw [Z.ofRe_def, Z.ofRe_def, sub_eq_add_neg, Z.neg_mk, Z.mk_add_mk, Z.mk_eq]
  ring

/-- ★ THE ℤ-RUNG OF THE WELD: every DERIVED integer is an `ℤ`-cast. This is
    the "ℤ-tower weld" the surjectivity needs — derived here, not owed. -/
theorem intCast_surjective : ∀ z : Z, ∃ m : ℤ, ((m : ℤ) : Z) = z := by
  refine Z.ind fun a b => ?_
  obtain ⟨n, hn⟩ := ofRe_natCast a
  obtain ⟨k, hk⟩ := ofRe_natCast b
  refine ⟨(n : ℤ) - (k : ℤ), ?_⟩
  rw [Z.mk_eq_sub, hn, hk]
  push_cast
  ring

/-- The banked embedding `Z ↪ Q` (`Q.ofZ`, N9), bundled as a RING HOM. -/
noncomputable def ofZHom : Z →+* Q where
  toFun := Q.ofZ
  map_one' := Q.ofZ_one
  map_mul' := Q.ofZ_mul
  map_zero' := Q.ofZ_zero
  map_add' := Q.ofZ_add

/-- A fraction IS the division of its numerator's image by its denominator's
    image — the quotient carrier meets the field's own `/`. -/
theorem mk_eq_div (p : Z) (d : NZ) : Q.mk p d = Q.ofZ p / Q.ofZ d.1 := by
  have hd : Q.ofZ d.1 ≠ 0 := fun h => d.2 (Q.ofZ_injective (by rw [h, Q.ofZ_zero]))
  rw [eq_div_iff hd]
  show Q.mk p d * Q.mk d.1 NZ.one = Q.mk p NZ.one
  rw [Q.mk_mul_mk]
  apply Q.sound
  simp only [NZ.mul_val, NZ.one_val]
  ring

/-- ★★ SURJECTIVE: every element of the derived `Q` is the image of an actual
    `ℚ` numeral. The witness for `mk p d` is `m / k` where `m, k` are the
    `ℤ`-cast preimages of numerator and denominator (`intCast_surjective`). -/
theorem foldOfRat_surjective : Function.Surjective foldOfRat := by
  refine Q.ind fun p d => ?_
  obtain ⟨m, hm⟩ := intCast_surjective p
  obtain ⟨k, hk⟩ := intCast_surjective d.1
  have h1 : Q.ofZ p = ((m : ℤ) : Q) := by
    rw [← hm]; exact (map_intCast ofZHom m : ofZHom ((m : ℤ) : Z) = _)
  have h2 : Q.ofZ d.1 = ((k : ℤ) : Q) := by
    rw [← hk]; exact (map_intCast ofZHom k : ofZHom ((k : ℤ) : Z) = _)
  refine ⟨(m : ℚ) / (k : ℚ), ?_⟩
  show (((m : ℚ) / (k : ℚ) : ℚ) : Q) = Q.mk p d
  rw [Rat.cast_div, Rat.cast_intCast, Rat.cast_intCast, mk_eq_div, h1, h2]

/-- ★★ BIJECTIVE — hence THE RING EQUIVALENCE `ℚ ≃+* Q_Fold`: the two rational
    worlds are canonically the same field. -/
noncomputable def foldEquiv : ℚ ≃+* Q :=
  RingEquiv.ofBijective foldOfRatHom ⟨Rat.cast_injective, foldOfRat_surjective⟩

/-! ## §4 UNIQUENESS — the prime-field property: NO CHOICE in the weld. -/

/-- ★ UNIQUENESS INTO THE DERIVED ℚ: any two ring homs `ℚ →+* Q` are equal —
    ℚ is the prime field, the weld is the ONLY possible connection. -/
theorem ratHom_unique (f g : ℚ →+* Q) : f = g := Subsingleton.elim f g

/-- Uniqueness into the CONTINUUM: any two ring homs `ℚ →+* Cut` are equal
    (the engine of the cast factorization below). -/
theorem ratHomCut_unique (f g : ℚ →+* Cut) : f = g := Subsingleton.elim f g

/-! ## §5 THE CUT-CAST FACTORIZATION.

`Qcut : Q → Cut` (the principal-cut embedding, ContinuumDerived) was banked
ADDITIVE (`Qcut_add`) and strictly monotone (`Qcut_strictMono`), with
`0 = Qcut 0`, `1 = Qcut 1` definitional. THE NEW WORK: multiplicativity —
on the nonnegative cone against the banked approximant product `pmul`, then
sign-extended through negation. That bundles `Qcut` as a ring hom, and the
factorization of Mathlib's coercion `ℚ → Cut` through the derived route is
then FREE from §4's uniqueness. -/

/-- Negation rides through the principal cut (free from the banked additivity). -/
theorem Qcut_neg (a : Q) : Qcut (-a) = -Qcut a := by
  have h : Qcut a + Qcut (-a) = 0 := by rw [Qcut_add, add_neg_cancel]; rfl
  exact eq_neg_of_add_eq_zero_right h

/-- Monotonicity at the cone: nonnegative rationals give nonnegative cuts. -/
theorem Qcut_nonneg {a : Q} (ha : 0 ≤ a) : (0 : Cut) ≤ Qcut a := by
  have sm : StrictMono Qcut := fun _ _ h => Qcut_strictMono h
  rw [show (0 : Cut) = Qcut 0 from rfl]
  exact sm.le_iff_le.mpr ha

/-- ★ THE CONE PRODUCT MEETS THE PRINCIPAL CUT: for nonnegative `a, b`,
    `pmul (Qcut a) (Qcut b) = Qcut (a·b)`. Forward: an approximant pair
    `s < a`, `t < b` has `s·t < a·b`. Backward: for `0 ≤ q < a·b` shrink both
    factors by `m/2` where `m = min (min a b) ((a·b − q)/(a+b))` — the banked
    order arithmetic of the derived `Q` closes it. -/
theorem pmul_Qcut {a b : Q} (ha : 0 ≤ a) (hb : 0 ≤ b) :
    pmul (Qcut a) (Qcut b) = Qcut (a * b) := by
  apply Cut.ext'
  intro q
  rw [pmul_S]
  show (q < 0 ∨ ∃ s t, 0 ≤ s ∧ 0 ≤ t ∧ s < a ∧ t < b ∧ q < s * t) ↔ q < a * b
  constructor
  · rintro (hq | ⟨s, t, hs, ht, hsa, htb, hq⟩)
    · exact lt_of_lt_of_le hq (mul_nonneg ha hb)
    · nlinarith
  · intro hq
    rcases lt_or_ge q 0 with h0 | h0
    · exact Or.inl h0
    · right
      have hab : 0 < a * b := lt_of_le_of_lt h0 hq
      have ha' : 0 < a := by
        rcases ha.lt_or_eq with h | h
        · exact h
        · exfalso; rw [← h, zero_mul] at hab; exact lt_irrefl 0 hab
      have hb' : 0 < b := by
        rcases hb.lt_or_eq with h | h
        · exact h
        · exfalso; rw [← h, mul_zero] at hab; exact lt_irrefl 0 hab
      have hd : 0 < (a * b - q) / (a + b) := div_pos (by linarith) (by linarith)
      set m : Q := min (min a b) ((a * b - q) / (a + b)) with hmdef
      have hm0 : 0 < m := lt_min (lt_min ha' hb') hd
      have hma : m ≤ a := le_trans (min_le_left _ _) (min_le_left a b)
      have hmb : m ≤ b := le_trans (min_le_left _ _) (min_le_right a b)
      have hmd : m ≤ (a * b - q) / (a + b) := min_le_right _ _
      have hmd' : m * (a + b) ≤ a * b - q :=
        (le_div_iff₀ (by linarith : (0 : Q) < a + b)).mp hmd
      refine ⟨a - m / 2, b - m / 2, by linarith, by linarith, by linarith,
        by linarith, ?_⟩
      nlinarith [sq_nonneg m, mul_pos hm0 (add_pos ha' hb')]

/-- The sign-extended product agrees on the cone. -/
theorem Qcut_mul_nonneg {a b : Q} (ha : 0 ≤ a) (hb : 0 ≤ b) :
    Qcut a * Qcut b = Qcut (a * b) := by
  rw [mul_of_nonneg (Qcut_nonneg ha) (Qcut_nonneg hb), pmul_Qcut ha hb]

/-- ★ `Qcut` IS MULTIPLICATIVE — all signs, reduced to the cone through the
    reflection (`Qcut_neg`). -/
theorem Qcut_mul (a b : Q) : Qcut a * Qcut b = Qcut (a * b) := by
  rcases le_total 0 a with ha | ha <;> rcases le_total 0 b with hb | hb
  · exact Qcut_mul_nonneg ha hb
  · have hb' : (0 : Q) ≤ -b := neg_nonneg.mpr hb
    calc Qcut a * Qcut b
        = Qcut a * -Qcut (-b) := by rw [Qcut_neg, neg_neg]
      _ = -(Qcut a * Qcut (-b)) := by ring
      _ = -Qcut (a * -b) := by rw [Qcut_mul_nonneg ha hb']
      _ = Qcut (-(a * -b)) := (Qcut_neg _).symm
      _ = Qcut (a * b) := by rw [show -(a * -b) = a * b from by ring]
  · have ha' : (0 : Q) ≤ -a := neg_nonneg.mpr ha
    calc Qcut a * Qcut b
        = -Qcut (-a) * Qcut b := by rw [Qcut_neg, neg_neg]
      _ = -(Qcut (-a) * Qcut b) := by ring
      _ = -Qcut (-a * b) := by rw [Qcut_mul_nonneg ha' hb]
      _ = Qcut (-(-a * b)) := (Qcut_neg _).symm
      _ = Qcut (a * b) := by rw [show -(-a * b) = a * b from by ring]
  · have ha' : (0 : Q) ≤ -a := neg_nonneg.mpr ha
    have hb' : (0 : Q) ≤ -b := neg_nonneg.mpr hb
    calc Qcut a * Qcut b
        = -Qcut (-a) * -Qcut (-b) := by rw [Qcut_neg, Qcut_neg, neg_neg, neg_neg]
      _ = Qcut (-a) * Qcut (-b) := by ring
      _ = Qcut (-a * -b) := Qcut_mul_nonneg ha' hb'
      _ = Qcut (a * b) := by rw [show (-a) * -b = a * b from by ring]

/-- ★ THE PRINCIPAL-CUT EMBEDDING AS A RING HOM `Q →+* Cut`: `0 ↦ 0` and
    `1 ↦ 1` definitional, additivity banked (`Qcut_add`), multiplicativity
    new (`Qcut_mul`). -/
noncomputable def QcutHom : Q →+* Cut where
  toFun := Qcut
  map_one' := rfl
  map_mul' := fun a b => (Qcut_mul a b).symm
  map_zero' := rfl
  map_add' := fun a b => (Qcut_add a b).symm

@[simp] theorem QcutHom_apply (a : Q) : QcutHom a = Qcut a := rfl

/-- ★★ THE CAST FACTORIZATION — FREE FROM UNIQUENESS: Mathlib's coercion
    `((q : ℚ) : Cut)` (via `Cut`'s derived `Field` instance) IS the derived
    route `foldOfRat` followed by the principal-cut embedding. Both sides are
    ring homs `ℚ →+* Cut`; `ℚ` is the prime field, so they are EQUAL — no
    computation, pure provenance. -/
theorem cut_cast_factors (q : ℚ) : ((q : ℚ) : Cut) = Qcut (foldOfRat q) :=
  DFunLike.congr_fun
    (Subsingleton.elim (Rat.castHom Cut) (QcutHom.comp foldOfRatHom)) q

/-! ## §6 Capstone and teeth. -/

/-- ★★★ THE RATIONAL GROUND IS WELDED: the canonical `ℚ → Q_Fold` is a ring
    hom, injective, strictly order-preserving, SURJECTIVE (through the derived
    tower — no owed successor), UNIQUE (prime field: no choice), and every
    `((q : ℚ) : Cut)` in the algebra tree factors through it — the imported
    rational entering the continuum IS the fold-derived rational under its
    canonical name. -/
theorem rational_ground_welded :
    (∀ q r : ℚ, foldOfRat (q + r) = foldOfRat q + foldOfRat r) ∧
    (∀ q r : ℚ, foldOfRat (q * r) = foldOfRat q * foldOfRat r) ∧
    foldOfRat 1 = 1 ∧
    Function.Injective foldOfRat ∧
    StrictMono foldOfRat ∧
    Function.Surjective foldOfRat ∧
    (∀ f g : ℚ →+* Q, f = g) ∧
    (∀ q : ℚ, ((q : ℚ) : Cut) = Qcut (foldOfRat q)) :=
  ⟨foldOfRat_add, foldOfRat_mul, foldOfRat_one, foldOfRat_injective,
    foldOfRat_strictMono, foldOfRat_surjective, ratHom_unique, cut_cast_factors⟩

/-- TEETH (non-degeneracy): the weld hits the derived unit, and the unit is
    not the zero — the target field is really there. -/
theorem foldOfRat_one_ne_zero : foldOfRat 1 = 1 ∧ (foldOfRat 1 : Q) ≠ 0 :=
  ⟨foldOfRat_one, by rw [foldOfRat_one]; exact one_ne_zero⟩

/-- TEETH (genuine separation): the weld distinguishes distinct rationals —
    `1/2` and `1/3` land on different derived rationals. -/
theorem foldOfRat_separates : foldOfRat (1 / 2) ≠ foldOfRat (1 / 3) := by
  intro h
  have := foldOfRat_injective h
  norm_num at this

/-- The equivalence agrees with the map (sanity: `foldEquiv` is `foldOfRat`). -/
theorem foldEquiv_apply (q : ℚ) : foldEquiv q = foldOfRat q := rfl

end RationalGroundWeld
end Phys.Foundation
