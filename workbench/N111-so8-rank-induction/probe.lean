import Phys.Algebra.LorentzContinuumGenerationOctonionBlockQuad

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- THE ARBITRARY-LENGTH octonion-block word. -/
def blockWordLin : List (O Cut × O Cut) → Module.End Cut STVC
  | [] => 1
  | (u, w) :: rest => genTwoPlaneLin u w * blockWordLin rest

theorem blockWordLin_nil : blockWordLin [] = 1 := rfl

theorem blockWordLin_cons (u w : O Cut) (rest : List (O Cut × O Cut)) :
    blockWordLin ((u, w) :: rest) = genTwoPlaneLin u w * blockWordLin rest := rfl

/-- ★ MEASURE 1: arbitrary-length membership in genIsomMonoidLin by list induction. -/
theorem blockWordLin_mem_genLin (L : List (O Cut × O Cut))
    (hL : ∀ p ∈ L, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1) :
    blockWordLin L ∈ genIsomMonoidLin := by
  induction L with
  | nil => rw [blockWordLin_nil]; exact one_mem _
  | cons hd tl ih =>
      obtain ⟨u, w⟩ := hd
      rw [blockWordLin_cons]
      have hhd := hL (u, w) (List.mem_cons_self)
      exact mul_mem (genTwoPlaneLin_mem_genLin u w hhd.1 hhd.2)
        (ih (fun p hp => hL p (List.mem_cons_of_mem _ hp)))

/-- ★ MEASURE 2: arbitrary-length QvC-isometry by list induction. -/
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
      have hhd := hL (u, w) (List.mem_cons_self)
      rw [blockWordLin_cons, Module.End.mul_apply]
      rw [genTwoPlaneLin_isQvIsomC u w hhd.1 hhd.2 (blockWordLin tl p)]
      exact ih (fun q hq => hL q (List.mem_cons_of_mem _ hq)) p

/-- ★ MEASURE 3: the bridge applies as the nested biMulFun composite (arbitrary length). -/
theorem blockWordFun_apply (u w : O Cut) (rest : List (O Cut × O Cut)) (p : STVC) :
    endToFunEnd (blockWordLin ((u, w) :: rest)) p
      = biMulFun w w (biMulFun u u (endToFunEnd (blockWordLin rest) p)) := by
  rw [blockWordLin_cons, map_mul]
  show (endToFunEnd (genTwoPlaneLin u w)) ((endToFunEnd (blockWordLin rest)) p) = _
  rw [genTwoPlaneLin_apply]

/-- ★★ MEASURE 4: THE RANK-FIXES — arbitrary-length generalization of block1/2/3_fixes. -/
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
      have hhd := hz (u, w) (List.mem_cons_self)
      rw [blockWordFun_apply]
      rw [ih (fun p hp => hz p (List.mem_cons_of_mem _ hp))]
      rw [biMulFun_imag_fixes_anticomm u z hhd.1 hhd.2.2.1]
      rw [biMulFun_imag_fixes_anticomm w z hhd.2.1 hhd.2.2.2]

/-- ★ MEASURE 5: bridge transport at arbitrary length. -/
theorem blockWordLin_mem_gen2 (L : List (O Cut × O Cut))
    (hL : ∀ p ∈ L, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1) :
    endToFunEnd (blockWordLin L) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2 (blockWordLin_mem_genLin L hL)

/-- ★★ MEASURE 6: THE RANK-STEP NEGATION — prepend a `z`-block onto a word that fixes `z`; the
    longer word NEGATES `(0,0,z)`. The abstract generalization of double/triple/quadBlock_negates. -/
theorem blockWordLin_negates (z w : O Cut) (rest : List (O Cut × O Cut))
    (hsqz : z * z = -1) (hLw : ∀ y : O Cut, w * (w * y) = -y)
    (hac : z * w = -(w * z))
    (hfix : endToFunEnd (blockWordLin rest) ((0 : Cut), (0 : Cut), z)
              = ((0 : Cut), (0 : Cut), z)) :
    endToFunEnd (blockWordLin ((z, w) :: rest)) ((0 : Cut), (0 : Cut), z)
      = ((0 : Cut), (0 : Cut), -z) := by
  rw [blockWordFun_apply, hfix]
  exact biMulComp_negates_u z w hsqz hLw hac

/-- ★ MEASURE 7 (W8 non-vacuity): the CONCRETE 4-block word on `ii5` recovers the explicit
    quad-block negation — the abstract word at length 4 reproduces the rank-≥8 witness. -/
theorem blockWord_ii5_concrete :
    endToFunEnd (blockWordLin [((ii5 : O Cut), (CD.e2 : O Cut)), ((ii4 : O Cut), (CD.e2 : O Cut)),
        ((ke2je2 : O Cut), (CD.e2 : O Cut)), ((je2 : O Cut), (CD.e2 : O Cut))])
        ((0 : Cut), (0 : Cut), (ii5 : O Cut))
      = ((0 : Cut), (0 : Cut), -(ii5 : O Cut)) := by
  apply blockWordLin_negates ii5 (CD.e2 : O Cut) _ ii5_sq e2_alt
  · ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]
  · -- the inner 3-block word fixes (0,0,ii5): each block anticommutes with ii5
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

/-- ★ MEASURE 8 (W8 teeth): the concrete deep-slot coordinate read-off. -/
theorem blockWord_ii5_coord :
    (endToFunEnd (blockWordLin [((ii5 : O Cut), (CD.e2 : O Cut)), ((ii4 : O Cut), (CD.e2 : O Cut)),
        ((ke2je2 : O Cut), (CD.e2 : O Cut)), ((je2 : O Cut), (CD.e2 : O Cut))])
        ((0 : Cut), (0 : Cut), (ii5 : O Cut))).2.2.re.im.im = (-1 : Cut) := by
  rw [blockWord_ii5_concrete]
  simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

end

end Phys.Algebra
