/-
  Phys.Algebra.LorentzContinuumGenerationSO8RankInduction — N111: THE GENERAL `SO(8)`-GENERATION
  RANK-INDUCTION (the ABSTRACT, arbitrary-length octonion-block word — the explicit-witness ladder
  having TOPPED OUT at rank 8). N100/N103 banked the single block (`genTwoPlaneLin`, rank ≥ 2);
  N108/N109/N110 banked the explicit ladder rank ≥ 4 → ≥ 6 → ≥ 8 (`doubleBlockLin` / `tripleBlockLin`
  / `quadBlockLin`, the quad block reaching the FULL rank on the 8-dimensional octonion space
  `O Cut`). Since `O Cut` is 8-dimensional and four orthogonal 2-planes exhaust it, the explicit
  ladder has TOPPED OUT — the immediately-bankable next piece is NO LONGER another explicit rung
  but the ABSTRACT rank-induction: the arbitrary-length octonion-block word and its generation /
  isometry / rank-fixes / rank-step-negation structure, proved by LIST INDUCTION, generalizing the
  hand-unrolled fixed-length witnesses (`block1/2/3_fixes_*`, `double/triple/quadBlock_negates_*`,
  `*BlockLin_mem_genLin`) to ALL lengths `k` at once.

  ===========================================================================
  THE STRUCTURAL FACT (NO operator topology, NO posited Lorentz group, NO Mathlib ℝ/ℂ as content).

  The explicit ladder hand-unrolls FIXED-length composites: `genTwoPlaneLin u w` (one block),
  `doubleBlockLin u w a b = genTwoPlaneLin a b * genTwoPlaneLin u w` (two), `tripleBlockLin` (three),
  `quadBlockLin` (four). The ABSTRACT word folds an arbitrary LIST of generator-pairs:

      `blockWordLin []            := 1`
      `blockWordLin ((u,w)::rest) := genTwoPlaneLin u w * blockWordLin rest`,

  an arbitrary-length `biMulLin` word — a `Module.End Cut STVC`. Each of the explicit ladder rungs
  is `blockWordLin` at a fixed length (the single block is the singleton list, the quad block is
  the length-4 list). The abstract lemmas below prove, by ONE list induction each (over the banked
  per-block lemmas), the structure that the explicit ladder proves by hand at each `k`:

    • `blockWordLin_mem_genLin` — EVERY arbitrary-length word with Born-unit pairs lies in the
      `Module.End` generated two-sided submonoid `genIsomMonoidLin` (list induction: nil → `one_mem`,
      cons → `mul_mem` of `genTwoPlaneLin_mem_genLin` and the tail). THE FULL GENERATION REACH at
      arbitrary length — the generalization of the k≤4 explicit membership lemmas.
    • `blockWordLin_isQvIsomC` — every such word is a `QvC`-isometry at arbitrary length (list
      induction over `genTwoPlaneLin_isQvIsomC` N103).
    • `blockWordLin_mem_gen2` — the bridge transport (N100) applied to the arbitrary word.
    • `blockWordFun_apply` — the bridge applies as the nested `biMulFun` composite, one cons step.
    • ★★ `blockWordLin_fixes_anticomm` (THE RANK-FIXES) — if `z` anticommutes with every unit in the
      list (with the left-square laws), the WHOLE word FIXES `(0,0,z)`. Arbitrary length, ONE list
      induction over `biMulFun_imag_fixes_anticomm` (N94). The abstract generalization of
      `block1_fixes_ke2je2` / `block2_fixes_ii4` / `block3_fixes_ii5`.
    • ★★ `blockWordLin_negates` (THE RANK-STEP) — prepend a `z`-block onto a word that FIXES `z`;
      the (k+1)-block word NEGATES `(0,0,z)` (`biMulComp_negates_u` N95). The abstract generalization
      of `doubleBlock_e2je2_negates_ke2je2` / `tripleBlock_negates_ii4` / `quadBlock_negates_ii5`.

  THE W8 NON-VACUITY (rank ≥ 8 witness recovered abstractly). The CONCRETE length-4 word
  `blockWordLin [(ii5,e₂),(ii4,e₂),(ke2je2,e₂),(ιe₂,e₂)]` applied to `(0,0,ii5)` reads `(0,0,−ii5)`:
  the inner 3-block word FIXES `ii5` (it lies in the common anticommuting complement of all three
  lower 2-planes, `biMulFun_imag_fixes_anticomm`), and the prepended fourth `ii5`-block NEGATES it
  (`blockWordLin_negates`). The distinguishing deep coordinate `(−ii5).2.2.re.im.im = −1` — the
  rank-≥8 read-off, recovering N110's `quadBlock_ii5_coord` as the length-4 instance of the abstract
  word. So the abstract rank-induction is NOT vacuous: it reproduces the entire explicit ladder.

  ── WHAT THIS NODE BANKS ──

  `blockWordLin` / `blockWordLin_nil` / `blockWordLin_cons` — the arbitrary-length octonion-block
    word and its fold unfolds.
  ★ `blockWordLin_mem_genLin` — arbitrary-length membership in `genIsomMonoidLin` (list induction).
  ★ `blockWordLin_isQvIsomC` — arbitrary-length `QvC`-isometry (list induction).
  `blockWordLin_mem_gen2` — the bridge transport at arbitrary length.
  `blockWordFun_apply` — the bridge applies as the nested `biMulFun` composite (one cons step).
  ★★ `blockWordLin_fixes_anticomm` — THE RANK-FIXES, arbitrary length (list induction).
  ★★ `blockWordLin_negates` — THE RANK-STEP NEGATION (prepend a fixed-`z` block).
  `blockWord_ii5_concrete` / `blockWord_ii5_coord` — W8 non-vacuity: the concrete length-4 word
    recovers the rank-≥8 witness, deep slot `−1`.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──

  Every object is DERIVED: `genTwoPlaneLin` / `genTwoPlaneLin_apply` / `genTwoPlaneLin_mem_genLin`
  / `endToFunEnd_genIsomMonoidLin_mem_gen2` (N100); `genTwoPlaneLin_isQvIsomC` (N103); `biMulFun`
  / `biMulFun_imag_fixes_anticomm` (N94); `biMulComp_negates_u` (N95); the concrete units
  `ii5`/`ii4`/`ke2je2`/`je2`/`e₂` and their anticommutators (N108–N110); the `Module.End` /
  `Submonoid` / `map_mul` MACHINERY on the DERIVED objects (STANDARD §3) — over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group /
  SO⁺(1,9), NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  ── PHYSICS-WORDS-REMOVABLE ──

  Delete every physics word (Lorentz / rotation / rank / generation / SO(8) / isometry / octonion-
  block / KAK / compact / ...) and the file stands as pure mathematics about `blockWordLin` (a
  `List`-fold of `genTwoPlaneLin` products), its membership in the algebraic submonoid
  `genIsomMonoidLin`, its preservation of the quadratic form `QvC`, and its action on `(0,0,z)`
  for an anticommuting `z`, over the derived `Cut` and `O Cut`. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationOctonionBlockQuad

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The arbitrary-length octonion-block word (a `List`-fold of `genTwoPlaneLin` products). -/

/-- THE ARBITRARY-LENGTH OCTONION-BLOCK WORD — the `List`-fold generalizing the explicit ladder.
    Each generator-pair `(u, w)` contributes a `genTwoPlaneLin u w` factor:
    `blockWordLin [] = 1`, `blockWordLin ((u,w)::rest) = genTwoPlaneLin u w * blockWordLin rest`.
    The single block is the singleton list; the quad block is the length-4 list. -/
def blockWordLin : List (O Cut × O Cut) → Module.End Cut STVC
  | [] => 1
  | (u, w) :: rest => genTwoPlaneLin u w * blockWordLin rest

/-- The empty word is the identity. -/
theorem blockWordLin_nil : blockWordLin [] = 1 := rfl

/-- The cons unfold: a word is the leading 2-plane rotation times the tail word. -/
theorem blockWordLin_cons (u w : O Cut) (rest : List (O Cut × O Cut)) :
    blockWordLin ((u, w) :: rest) = genTwoPlaneLin u w * blockWordLin rest := rfl

/-! ## The arbitrary-length word lies in the generated submonoid and is a `QvC`-isometry. -/

/-- ★ THE FULL GENERATION REACH (arbitrary length): every word whose every pair is a pair of
    Born-units lies in the `Module.End` generated two-sided submonoid `genIsomMonoidLin`. ONE list
    induction: the empty word is `one_mem`, and a cons is the `mul_mem` of `genTwoPlaneLin_mem_genLin`
    (the leading 2-plane rotation) and the tail word's membership. The abstract generalization of the
    k≤4 explicit membership lemmas (`genTwoPlaneLin_mem_genLin` / `doubleBlockLin_mem_genLin` /
    `tripleBlockLin_mem_genLin` / `quadBlockLin_mem_genLin`) to ALL lengths at once. -/
theorem blockWordLin_mem_genLin (L : List (O Cut × O Cut))
    (hL : ∀ p ∈ L, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1) :
    blockWordLin L ∈ genIsomMonoidLin := by
  induction L with
  | nil => rw [blockWordLin_nil]; exact one_mem _
  | cons hd tl ih =>
      obtain ⟨u, w⟩ := hd
      rw [blockWordLin_cons]
      have hhd := hL (u, w) List.mem_cons_self
      exact mul_mem (genTwoPlaneLin_mem_genLin u w hhd.1 hhd.2)
        (ih (fun p hp => hL p (List.mem_cons_of_mem _ hp)))

/-- ★ The arbitrary-length word is a `QvC`-isometry — ONE list induction over the per-block isometry
    `genTwoPlaneLin_isQvIsomC` (N103). The empty word is the identity (preserves `QvC` trivially);
    a cons applies the leading 2-plane isometry to the tail's image, which the inductive hypothesis
    leaves `QvC`-invariant. The abstract generalization of the k≤4 explicit isometry lemmas. -/
theorem blockWordLin_isQvIsomC (L : List (O Cut × O Cut))
    (hL : ∀ p ∈ L, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1) :
    IsQvIsomC ((blockWordLin L : Module.End Cut STVC) : STVC → STVC) := by
  induction L with
  | nil =>
      intro p
      show QvC ((blockWordLin [] : Module.End Cut STVC) p) = QvC p
      rw [blockWordLin_nil]
      rfl
  | cons hd tl ih =>
      obtain ⟨u, w⟩ := hd
      intro p
      have hhd := hL (u, w) List.mem_cons_self
      rw [blockWordLin_cons, Module.End.mul_apply]
      rw [genTwoPlaneLin_isQvIsomC u w hhd.1 hhd.2 (blockWordLin tl p)]
      exact ih (fun q hq => hL q (List.mem_cons_of_mem _ hq)) p

/-- ★ The bridged arbitrary-length word lands in `genIsomMonoidC2` — the N100 transport applied to
    the abstract word: an arbitrary-length `Cut`-linear octonion-block rotation, pushed across the
    bridge, IS a member of the `Function.End` generated isometry submonoid. -/
theorem blockWordLin_mem_gen2 (L : List (O Cut × O Cut))
    (hL : ∀ p ∈ L, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1) :
    endToFunEnd (blockWordLin L) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2 (blockWordLin_mem_genLin L hL)

/-! ## The bridge applies as the nested `biMulFun` composite (one cons step). -/

/-- The bridge of a cons word applies as the leading 2-plane composite `biMulFun w w ∘ biMulFun u u`
    on the tail word's bridge-image (`map_mul` then `genTwoPlaneLin_apply`) — the cons step for the
    `Function.End` self-map composite. -/
theorem blockWordFun_apply (u w : O Cut) (rest : List (O Cut × O Cut)) (p : STVC) :
    endToFunEnd (blockWordLin ((u, w) :: rest)) p
      = biMulFun w w (biMulFun u u (endToFunEnd (blockWordLin rest) p)) := by
  rw [blockWordLin_cons, map_mul]
  show (endToFunEnd (genTwoPlaneLin u w)) ((endToFunEnd (blockWordLin rest)) p) = _
  rw [genTwoPlaneLin_apply]

/-! ## THE RANK-FIXES and THE RANK-STEP NEGATION (the abstract generalizations). -/

/-- ★★ THE RANK-FIXES — the abstract generalization of `block1_fixes_ke2je2` / `block2_fixes_ii4` /
    `block3_fixes_ii5`. If `z` anticommutes with every unit in the list `L` (with the left-square
    laws on each), the WHOLE arbitrary-length word FIXES `(0,0,z)`. ONE list induction over
    `biMulFun_imag_fixes_anticomm` (N94): the empty word fixes everything, and each cons block — both
    its half-turns anticommuting with `z` — leaves the tail's fixed `(0,0,z)` unchanged. The rank
    structure (a word fixes the common anticommuting complement of all its 2-planes) proved at ALL
    lengths by a single induction, where the explicit ladder proves it by hand at each `k`. -/
theorem blockWordLin_fixes_anticomm (z : O Cut) (L : List (O Cut × O Cut))
    (hz : ∀ p ∈ L, (∀ y : O Cut, p.1 * (p.1 * y) = -y) ∧ (∀ y : O Cut, p.2 * (p.2 * y) = -y)
          ∧ p.1 * z = -(z * p.1) ∧ p.2 * z = -(z * p.2)) :
    endToFunEnd (blockWordLin L) ((0 : Cut), (0 : Cut), z) = ((0 : Cut), (0 : Cut), z) := by
  induction L with
  | nil =>
      rw [blockWordLin_nil, map_one]
      rfl
  | cons hd tl ih =>
      obtain ⟨u, w⟩ := hd
      have hhd := hz (u, w) List.mem_cons_self
      rw [blockWordFun_apply]
      rw [ih (fun p hp => hz p (List.mem_cons_of_mem _ hp))]
      rw [biMulFun_imag_fixes_anticomm u z hhd.1 hhd.2.2.1]
      rw [biMulFun_imag_fixes_anticomm w z hhd.2.1 hhd.2.2.2]

/-- ★★ THE RANK-STEP NEGATION — the abstract generalization of `doubleBlock_e2je2_negates_ke2je2` /
    `tripleBlock_negates_ii4` / `quadBlock_negates_ii5`. Prepend a `z`-block `(z, w)` onto any word
    that FIXES `(0,0,z)`; the longer word NEGATES `(0,0,z)`. The leading block's `biMulFun z z`
    half-turn negates `z` while the `w`-half-turn fixes it (`biMulComp_negates_u`, N95). The
    rank-increment step (each extra block reaching one more 2-plane the shorter word fixes) as ONE
    abstract lemma — feeding `blockWordLin_fixes_anticomm` into it climbs the whole ladder. -/
theorem blockWordLin_negates (z w : O Cut) (rest : List (O Cut × O Cut))
    (hsqz : z * z = -1) (hLw : ∀ y : O Cut, w * (w * y) = -y)
    (hac : z * w = -(w * z))
    (hfix : endToFunEnd (blockWordLin rest) ((0 : Cut), (0 : Cut), z)
              = ((0 : Cut), (0 : Cut), z)) :
    endToFunEnd (blockWordLin ((z, w) :: rest)) ((0 : Cut), (0 : Cut), z)
      = ((0 : Cut), (0 : Cut), -z) := by
  rw [blockWordFun_apply, hfix]
  exact biMulComp_negates_u z w hsqz hLw hac

/-! ## W8 non-vacuity — the concrete length-4 word recovers the rank-≥8 witness. -/

/-- ★ W8 NON-VACUITY — the CONCRETE length-4 word reproduces the explicit quad-block negation. The
    abstract word `blockWordLin [(ii5,e₂),(ii4,e₂),(ke2je2,e₂),(ιe₂,e₂)]` applied to `(0,0,ii5)`
    reads `(0,0,−ii5)`: the inner 3-block word FIXES `ii5` (common anticommuting complement of the
    three lower 2-planes) and the prepended `ii5`-block NEGATES it (`blockWordLin_negates`). The
    abstract rank-induction is NOT vacuous — at length 4 it recovers N110's rank-≥8 witness. -/
theorem blockWord_ii5_concrete :
    endToFunEnd (blockWordLin [((ii5 : O Cut), (CD.e2 : O Cut)), ((ii4 : O Cut), (CD.e2 : O Cut)),
        ((ke2je2 : O Cut), (CD.e2 : O Cut)), ((je2 : O Cut), (CD.e2 : O Cut))])
        ((0 : Cut), (0 : Cut), (ii5 : O Cut))
      = ((0 : Cut), (0 : Cut), -(ii5 : O Cut)) := by
  apply blockWordLin_negates ii5 (CD.e2 : O Cut) _ ii5_sq e2_alt
  · ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
  · -- the inner 3-block word FIXES (0,0,ii5): each block anticommutes with ii5
    rw [blockWordFun_apply, blockWordFun_apply, blockWordFun_apply]
    rw [blockWordLin_nil, map_one]
    show biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
          (biMulFun (ii4 : O Cut) (ii4 : O Cut)
            (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
              (biMulFun (ke2je2 : O Cut) (ke2je2 : O Cut)
                (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
                  (biMulFun (je2 : O Cut) (je2 : O Cut)
                    ((0 : Cut), (0 : Cut), (ii5 : O Cut))))))) = _
    rw [biMulFun_imag_fixes_anticomm (je2 : O Cut) (ii5 : O Cut) je2_alt je2_ii5_anticomm]
    rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii5 : O Cut) e2_alt e2_ii5_anticomm]
    rw [biMulFun_imag_fixes_anticomm (ke2je2 : O Cut) (ii5 : O Cut) ke2je2_alt ke2je2_ii5_anticomm]
    rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii5 : O Cut) e2_alt e2_ii5_anticomm]
    rw [biMulFun_imag_fixes_anticomm (ii4 : O Cut) (ii5 : O Cut) ii4_alt ii4_ii5_anticomm]
    rw [biMulFun_imag_fixes_anticomm (CD.e2 : O Cut) (ii5 : O Cut) e2_alt e2_ii5_anticomm]

/-- ★ W8 TEETH — the concrete deep-slot coordinate read-off `.2.2.re.im.im = −1`. The length-4
    abstract word negates `ii5` (deep slot `−1`); the inner 3-block word fixes it (`+1`). The
    distinguishing rank-≥8 value, recovered through the abstract `blockWordLin` rather than the
    hand-unrolled `quadBlockLin`. -/
theorem blockWord_ii5_coord :
    (endToFunEnd (blockWordLin [((ii5 : O Cut), (CD.e2 : O Cut)), ((ii4 : O Cut), (CD.e2 : O Cut)),
        ((ke2je2 : O Cut), (CD.e2 : O Cut)), ((je2 : O Cut), (CD.e2 : O Cut))])
        ((0 : Cut), (0 : Cut), (ii5 : O Cut))).2.2.re.im.im = (-1 : Cut) := by
  rw [blockWord_ii5_concrete]
  simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

end

end Phys.Algebra
