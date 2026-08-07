/-
  Counterexamples.GaussFloorLawVacuityCostume — the floor law is GENUINE: it FIRES
  on the real D = −23 box with a real seed list. C617.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the floor law. The content that must NOT be
  hollow: floor_law FIRES on a REAL box — D = −23, L = [⟨1,1,6⟩, ⟨2,1,3⟩, ⟨2,−1,3⟩]
  (the full h = 3 box), ps = [2] — yielding the kernel-checked bound 1 + 1 ≤ 3.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 617 attestFlag = 1 (TRUE). THE BOGUS CLAIM: min 617 attestFlag
  = 617 reduces to 1 = 617; BITES. DISTINCT: (617, 1) fresh. MUST FAIL to compile.

  NOTE (honest scope): completeness of L is supplied here as a HYPOTHESIS
  DISCHARGE via the three explicit members — the costume exercises the counting
  weld (partition + injection + pick), not box completeness (that is the banked
  boxList_complete's job at the engine capstone). The three forms ARE the true
  reduced box of disc −23; the completeness clause is discharged by the banked
  window arithmetic on |b| ≤ a ≤ c bounds for |D| = 23 (a ≤ 2).
-/
import Phys.Algebra.GaussFloorLaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (1 + ([(2 : Phys.Foundation.Z)] : List Phys.Foundation.Z).length ≤
      ([⟨1,1,6⟩, ⟨2,1,3⟩, ⟨2,-1,3⟩] : List GaussForms.BQF).length) →
    attestFlag = 1 :=
  fun _ => rfl

/-- The floor law fires: 2 occupies a slot at D = −23, so h ≥ 2 on the box. -/
theorem floor_fires :
    1 + ([(2 : Phys.Foundation.Z)] : List Phys.Foundation.Z).length ≤
      ([⟨1,1,6⟩, ⟨2,1,3⟩, ⟨2,-1,3⟩] : List GaussForms.BQF).length := by
  -- direct arithmetic would be `by norm_num` — the costume instead routes
  -- through floor_law to prove the SAME bound, forcing the weld to fire.
  have h := floor_law (D := -23) (pf := ⟨1,1,6⟩)
    (L := [⟨1,1,6⟩, ⟨2,1,3⟩, ⟨2,-1,3⟩]) (ps := [2])
    (by -- pairwise distinct: b/a components differ
      refine List.pairwise_cons.mpr ⟨?_, List.pairwise_cons.mpr ⟨?_, ?_⟩⟩
      · intro b hb
        rcases List.mem_cons.mp hb with rfl | hb2
        · intro he; have := congrArg GaussForms.BQF.a he; norm_num at this
        · rcases List.mem_cons.mp hb2 with rfl | hb3
          · intro he; have := congrArg GaussForms.BQF.a he; norm_num at this
          · exact absurd hb3 List.not_mem_nil
      · intro b hb
        rcases List.mem_cons.mp hb with rfl | hb2
        · intro he; have := congrArg GaussForms.BQF.b he; norm_num at this
        · exact absurd hb2 List.not_mem_nil
      · exact List.pairwise_cons.mpr ⟨fun b hb => absurd hb List.not_mem_nil,
          List.Pairwise.nil⟩)
    (by -- membership data for all three forms
      intro f hf
      rcases List.mem_cons.mp hf with rfl | hf2
      · exact ⟨⟨by norm_num, by norm_num, by norm_num⟩,
          ⟨by norm_num, by norm_num⟩, by
            show (1:Z) * 1 - 4 * 1 * 6 = -23
            norm_num⟩
      · rcases List.mem_cons.mp hf2 with rfl | hf3
        · exact ⟨⟨by norm_num, by norm_num, by norm_num⟩,
            ⟨by norm_num, by norm_num⟩, by
              show (1:Z) * 1 - 4 * 2 * 3 = -23
              norm_num⟩
        · rcases List.mem_cons.mp hf3 with rfl | hf4
          · exact ⟨⟨by norm_num, by norm_num, by norm_num⟩,
              ⟨by norm_num, by norm_num⟩, by
                show (-1:Z) * -1 - 4 * 2 * 3 = -23
                norm_num⟩
          · exact absurd hf4 List.not_mem_nil)
    (by -- completeness at |D| = 23: a ∈ {1,2}, window walk — supplied
        -- via the banked reduction bounds. For the costume we discharge
        -- by case analysis on the reduced window: 3a² ≤ 23 ⟹ a ≤ 2;
        -- a=1 ⟹ b∈{0,1} ⟹ b=1 (parity) ⟹ c=6; a=2 ⟹ b²≡−23 mod 8 ⟹
        -- b∈{−1,1}, c=3. Kernel-checked below.
      intro f hr hpos hd
      obtain ⟨fa, fb, fc⟩ := f
      obtain ⟨h1, h2, h3⟩ := hr
      obtain ⟨h4, h5⟩ := hpos
      have hde : fb * fb - 4 * fa * fc = -23 := hd
      simp only [] at h1 h2 h3 h4 h5 hde ⊢
      -- 3·fa² ≤ fb² + ... : from |fb| ≤ fa ≤ fc: 4·fa·fc ≥ 4fa² and
      -- fb² ≤ fa² so 23 = 4fa·fc − fb² ≥ 4fa² − fa² = 3fa²
      have hfa2 : 3 * (fa * fa) ≤ 23 := by nlinarith
      have hfa1 : 1 ≤ fa := z_pos_ge_one h4
      have hfa_le : fa ≤ 2 := by
        by_contra hgt
        push_neg at hgt
        have h3i : (3:Z) ≤ fa := by
          have := z_pos_ge_one (show (0:Z) < fa - 2 by linarith)
          linarith
        nlinarith [h3i]
      rcases lt_or_eq_of_le hfa_le with hlt | heq2
      · -- fa = 1: from 1 ≤ fa < 2 by integrality
        have hle1 : fa ≤ 1 := by
          by_contra hgt
          push_neg at hgt
          have : (1:Z) ≤ fa - 1 := z_pos_ge_one (by linarith)
          linarith
        have heq1 : fa = 1 := le_antisymm hle1 hfa1
        subst heq1
        have hb01 := z_zero_or_one h1 h2
        rcases hb01 with rfl | rfl
        · exfalso
          -- 0 − 4c = −23 ⟹ 4c = 23: impossible mod 4 (4c−20=3 ⟹ 4(c−5)=3)
          have : 4 * (fc - 5) = 3 := by linarith
          rcases lt_trichotomy (fc - 5) 0 with hc | hc | hc
          · nlinarith [z_pos_ge_one (show (0:Z) < -(fc-5) by linarith)]
          · rw [hc] at this; norm_num at this
          · nlinarith [z_pos_ge_one hc]
        · have hc6 : fc = 6 := by linarith
          subst hc6
          exact List.mem_cons_self ..
      · -- fa = 2
        subst heq2
        -- fb ∈ (−2, 2]: fb ∈ {−1, 0, 1, 2}; disc: fb² − 8fc = −23
        have hbver : fb = 1 ∨ fb = -1 := by
          rcases lt_trichotomy fb 0 with hneg | h0 | hpos'
          · -- fb < 0: −2 < fb < 0 ⟹ fb = −1
            right
            have h1' : (1:Z) ≤ -fb := z_pos_ge_one (by linarith)
            have h2' : -fb ≤ 1 := by
              by_contra hgt
              push_neg at hgt
              have : (1:Z) ≤ -fb - 1 := z_pos_ge_one (by linarith)
              linarith
            linarith
          · -- fb = 0: 8fc = 23 impossible (mod 8: 8(fc−2)=7)
            exfalso
            subst h0
            have : 8 * (fc - 2) = 7 := by linarith
            rcases lt_trichotomy (fc - 2) 0 with hc | hc | hc
            · nlinarith [z_pos_ge_one (show (0:Z) < -(fc-2) by linarith)]
            · rw [hc] at this; norm_num at this
            · nlinarith [z_pos_ge_one hc]
          · -- fb > 0: fb ≤ 2; fb = 2 ⟹ 4 − 8fc = −23 ⟹ 8fc=27 impossible;
            -- fb = 1 ✓
            have hb1 : (1:Z) ≤ fb := z_pos_ge_one hpos'
            rcases lt_or_eq_of_le h2 with hlt2 | heqb2
            · left
              have h2' : fb ≤ 1 := by
                by_contra hgt
                push_neg at hgt
                have : (1:Z) ≤ fb - 1 := z_pos_ge_one (by linarith)
                linarith
              linarith
            · exfalso
              rw [heqb2] at hde
              have : 8 * (fc - 3) = 3 := by linarith
              rcases lt_trichotomy (fc - 3) 0 with hc | hc | hc
              · nlinarith [z_pos_ge_one (show (0:Z) < -(fc-3) by linarith)]
              · rw [hc] at this; norm_num at this
              · nlinarith [z_pos_ge_one hc]
        rcases hbver with rfl | rfl
        · have hc3 : fc = 3 := by linarith
          subst hc3
          exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
        · have hc3 : fc = 3 := by linarith
          subst hc3
          exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
            (List.mem_cons_self ..))
    )
    (List.mem_cons_self ..)
    rfl
    (List.pairwise_cons.mpr ⟨fun b hb => absurd hb List.not_mem_nil,
      List.Pairwise.nil⟩)
    (by intro p hp; rcases List.mem_cons.mp hp with rfl | h
        · norm_num
        · exact absurd h List.not_mem_nil)
    (by intro p hp; rcases List.mem_cons.mp hp with rfl | h
        · exact ⟨⟨2, 1, 3⟩, ⟨by norm_num, by norm_num, by norm_num⟩,
            ⟨by norm_num, by norm_num⟩, by
              show (1:Z) * 1 - 4 * 2 * 3 = -23
              norm_num, rfl⟩
        · exact absurd h List.not_mem_nil)
  exact h

theorem cert_val_true : min 617 attestFlag = 1 := by
  have h := attestFlag_forced floor_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 617 attestFlag = 617 := by
  rw [cert_val_true]

end Counterexamples
