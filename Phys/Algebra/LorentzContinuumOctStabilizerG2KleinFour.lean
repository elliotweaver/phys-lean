/-
  Phys.Algebra.LorentzContinuumOctStabilizerG2KleinFour — N141: THE COMPOSITION GROUP
  ℤ/2 × ℤ/2 ⊂ G₂ — the KLEIN FOUR-GROUP the two banked involutions generate. The product
  `octCompNeg := octTopNeg * octInnerNeg` of N139's outer and N140's inner Cayley–Dickson
  top-half negations is a THIRD concrete series-free non-identity octonion algebra-automorphism
  of the terminal algebra `O Cut`, and the four maps `{1, octTopNeg, octInnerNeg, octCompNeg}`
  form a Klein four-group `kleinFour : Subgroup (O Cut ≃ₗ[Cut] O Cut)` — an explicit
  `ℤ/2 × ℤ/2 ⊂ G₂ = Aut(O) ⊂ SO(8) ⊂ stabilizer of SO⁺(1,9)`. Over the derived ℝ `Cut`, the
  terminal algebra `O Cut := CD (H Cut)`, `H Cut := CD (Dbl Cut)`, `STVC = Cut × Cut × O Cut`,
  the indefinite Minkowski form `BvC` (signature (1,9)).

  ===========================================================================
  CONTEXT. N139 SEEDED the gauge-group non-triviality with ONE concrete non-identity octonion
  algebra-automorphism (`octTopNeg`, the OUTER Cayley–Dickson top-half negation). N140 ADVANCED
  to a SECOND independent one (`octInnerNeg`, the INNER one), pinning the gauge group as STRICTLY
  LARGER THAN ℤ/2 (≥ 3 elements). But N140 banked only the THREE distinct elements with no group
  law among them — from what was banked the gauge group could have any structure ⊇ those 3 points.
  W4.5 SUFFICIENCY: this node does NOT re-pin "strictly more than ℤ/2" — it ADVANCES to the
  FORWARD joint the §N141 (i) frontier names: the abstract GROUP STRUCTURE the two involutions
  generate. It exhibits the FOURTH element (the product `octCompNeg`) and proves the four maps
  form a concrete `Subgroup` isomorphic to the Klein four-group ℤ/2 × ℤ/2 — NEW structure (a
  derived abelian subgroup of G₂ with a complete multiplication table), strictly more than the
  three structureless points N140 pinned.

  ── THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — no new construction, pure composition) ──
  NO `tsum`, NO exponential, NO W9 instrument-wall risk. `octCompNeg` is the GROUP product
  `octTopNeg * octInnerNeg` of two BANKED series-free involutions (in the automorphism group
  `O Cut ≃ₗ[Cut] O Cut`, `LinearEquiv.automorphismGroup`, where `(f * g) x = f (g x)` and
  `1 = refl`). It acts as `⟨a,b⟩ ↦ ⟨hTopNeg a, −hTopNeg b⟩` (negate the inner `im` of each
  `H`-component AND the outer `im`-half). It is an automorphism as the composition of two
  `IsAlgAutCut` maps (the general lever `isAlgAutCut_trans`: `IsAlgAutCut` is closed under
  `LinearEquiv.trans`). The two involutions COMMUTE (`hTopNeg` commutes with negation), so the
  generated group is ABELIAN, and since every generator squares to `1` it is the elementary
  abelian 2-group ℤ/2 × ℤ/2.

  ── THE FOUR DISTINCT ELEMENTS (distinctness via action on the two doubling generators) ──
  `octTopNeg`:   negates `e₂`,        fixes  `innerGen`.
  `octInnerNeg`: fixes  `e₂`,        negates `innerGen`.
  `octCompNeg`:  negates `e₂`,        negates `innerGen`  (the product of the two effects).
  `1`:           fixes  both.
  Each pair differs on `e₂` or `innerGen` (char `Cut` = 0, so `v ≠ −v` for the relevant unit
  axes) — four pairwise-distinct gauge elements.

  ── WHAT THIS NODE BANKS ──
  `isAlgAutCut_trans` — GENERAL LEVER: the composition (`LinearEquiv.trans`) of two octonion
    algebra-automorphisms is an octonion algebra-automorphism (closure of `IsAlgAutCut`).
  `octCompNeg` — the THIRD map (`octInnerNeg.trans octTopNeg`) + `octCompNeg_apply` /
    `octCompNeg_eq_mul` (`= octTopNeg * octInnerNeg` in the automorphism group).
  ★ `octCompNeg_isAlgAut` — THE HEADLINE: the third map is an octonion algebra-automorphism
    `IsAlgAutCut` (a third concrete member of G₂ = Aut(O)).
  `hTopNegFun_involution` — the H-rung negation squares to identity.
  `octCompNeg_e2` (`= −e₂`) / `octTopNeg_innerGen` (fixes) / `octCompNeg_innerGen` (`= −innerGen`)
    — the action read-offs.
  ★ `octCompNeg_ne_refl` / `octCompNeg_ne_octTopNeg` / `octCompNeg_ne_octInnerNeg` — the FOURTH
    element is distinct from `id`, `octTopNeg`, and `octInnerNeg` (four distinct gauge elements).
  `octTopNeg_mul_self` / `octInnerNeg_mul_self` / `octCompNeg_mul_self` — every non-identity
    element is an INVOLUTION (order 2).
  `octTopNeg_comm_octInnerNeg` — the two generators COMMUTE (the group is ABELIAN).
  `octTopNeg_inv` / `octInnerNeg_inv` / `octCompNeg_inv` — each element is its own inverse.
  the closure products `octInnerNeg_mul_octTopNeg` / `octCompNeg_mul_octTopNeg` /
    `octTopNeg_mul_octCompNeg` / `octCompNeg_mul_octInnerNeg` / `octInnerNeg_mul_octCompNeg` —
    the full Klein-four multiplication table (the product of any two distinct non-identity
    elements is the third).
  ★★ `kleinFour` — THE EXPLICIT SUBGROUP: the 4-element carrier `{1, octTopNeg, octInnerNeg,
    octCompNeg}` is a `Subgroup (O Cut ≃ₗ[Cut] O Cut)` (closed under `*` via the table, under
    inverse since each is self-inverse) — a concrete ℤ/2 × ℤ/2 ⊂ G₂ = Aut(O).
  ★ `kleinFour_eq_closure` — the subgroup is GENERATED by the two banked involutions
    `{octTopNeg, octInnerNeg}` (it is exactly `Subgroup.closure {octTopNeg, octInnerNeg}`).
  ★ `kleinFour_elem_involution` — EVERY element of `kleinFour` squares to `1` (elementary
    abelian 2-group — the abstract fingerprint of ℤ/2 × ℤ/2).
  ★★ `octBlockEndC_octCompNeg_mem_octStab` — the octonion-block embedding of the third concrete
    automorphism lands in the observer-plane gauge stabilizer `octStab` (a third real gauge
    element; the whole `kleinFour` sits in the gauge group).
  W8 (the costume anchor): `octCompNeg_gFormC_e2_eq_one` (the third automorphism preserves
    `e₂`'s Born self-overlap `= 1`).

  THE MOAT (docs/STANDARD.md §0). The literature POSITS the gauge group AND its dimension/structure
  as independent physical inputs. Here the gauge group is the DERIVED observer-plane stabilizer
  (N137), its G₂ subgroup the DERIVED octonion automorphism group (N138), N139/N140 SEEDED its
  non-triviality with two independent elements, and THIS node pins a concrete ℤ/2 × ℤ/2 SUBGROUP
  with a full multiplication table — the abstract group structure CONSTRUCTED from the cascade's
  OWN layered Cayley–Dickson doubling (the two involutions and their product), no posited gauge
  group, no posited G₂, no posited group structure, no Mathlib ℝ/ℂ as content, no bridge.

  Physics-words-removable: delete "gauge / G₂ / SO(8) / automorphism / Aut / Lorentz / stabilizer /
  octonion / observer / Klein-four / group / composition / independence" → over the derived complete
  ordered field `Cut`, `O Cut := CD (H Cut)`, `H Cut := CD (Dbl Cut)`, `STVC = Cut × Cut × O Cut`:
  the maps `⟨⟨p,q⟩,⟨r,s⟩⟩ ↦ ⟨⟨p,q⟩,⟨−r,−s⟩⟩` (outer), `↦ ⟨⟨p,−q⟩,⟨r,−s⟩⟩` (inner), and their
  composite `↦ ⟨⟨p,−q⟩,⟨−r,s⟩⟩` are multiplicative-and-unital `Cut`-linear self-equivs of `O Cut`,
  pairwise distinct, each squaring to the identity, commuting, and together with the identity forming
  a 4-element subgroup of the linear-equivalence group; their block embeddings lie in the submonoid of
  `BvC`-isometries fixing `(1,0,0)` and `(0,1,0)`. No theorem statement needs a physics word.
-/
import Phys.Algebra.LorentzContinuumOctStabilizerG2SecondAut

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## The general composition lever: `IsAlgAutCut` is closed under `LinearEquiv.trans`. -/

/-- GENERAL LEVER: the composition (`LinearEquiv.trans`) of two octonion algebra-automorphisms of
    the terminal algebra `O Cut` is an octonion algebra-automorphism. The automorphism group
    G₂ = Aut(O) is closed under composition. -/
theorem isAlgAutCut_trans {φ ψ : O Cut ≃ₗ[Cut] O Cut}
    (hφ : IsAlgAutCut φ) (hψ : IsAlgAutCut ψ) : IsAlgAutCut (φ.trans ψ) := by
  refine ⟨?_, ?_⟩
  · intro x y; show ψ (φ (x * y)) = ψ (φ x) * ψ (φ y); rw [hφ.1, hψ.1]
  · show ψ (φ 1) = 1; rw [hφ.2, hψ.2]

/-! ## The third involution `octCompNeg = octTopNeg ∘ octInnerNeg`. -/

/-- The THIRD Cayley–Dickson involution: the composition of N140's inner negation and N139's outer
    negation. Acts as `⟨a,b⟩ ↦ ⟨hTopNeg a, −hTopNeg b⟩` — negate the inner `im` of each
    `H`-component AND the outer `im`-half. No series, no exponential. -/
def octCompNeg : O Cut ≃ₗ[Cut] O Cut := octInnerNeg.trans octTopNeg

/-- ★ THE HEADLINE: the third map is an octonion algebra-automorphism (`IsAlgAutCut`) — a third
    concrete member of G₂ = Aut(O), built as the composition of two banked automorphisms. -/
theorem octCompNeg_isAlgAut : IsAlgAutCut octCompNeg :=
  isAlgAutCut_trans octInnerNeg_isAlgAut octTopNeg_isAlgAut

/-- The action of `octCompNeg`: apply the inner H-rung negation to `re`, and the negated inner
    H-rung negation to `im`. -/
theorem octCompNeg_apply (z : O Cut) :
    octCompNeg z = ⟨hTopNegFun z.re, -hTopNegFun z.im⟩ := by
  show octTopNegFun (octInnerNegFun z) = _; apply CD.ext <;> rfl

/-- `octCompNeg` is the GROUP product `octTopNeg * octInnerNeg` in the automorphism group
    (`(f * g) x = f (g x)`). -/
theorem octCompNeg_eq_mul : octCompNeg = octTopNeg * octInnerNeg := by
  refine LinearEquiv.ext (fun z => ?_); rfl

/-! ## The four distinct elements. -/

/-- The H-rung top-half negation squares to the identity. -/
theorem hTopNegFun_involution (p : H Cut) : hTopNegFun (hTopNegFun p) = p := by
  apply CD.ext
  · rfl
  · show -(-p.im) = p.im; rw [neg_neg]

/-- `octCompNeg` NEGATES `e₂` (octInnerNeg fixes it, octTopNeg negates it). -/
theorem octCompNeg_e2 : octCompNeg (CD.e2 : O Cut) = -(CD.e2 : O Cut) := by
  show octTopNeg (octInnerNeg (CD.e2 : O Cut)) = _; rw [octInnerNeg_e2, octTopNeg_e2]

/-- `octTopNeg` FIXES the inner generator `innerGen` (its outer `im`-half is `0`). -/
theorem octTopNeg_innerGen : octTopNeg innerGen = innerGen := by
  apply CD.ext
  · rfl
  · show -(innerGen.im) = innerGen.im; show -(0 : H Cut) = (0 : H Cut); simp

/-- `octCompNeg` NEGATES the inner generator `innerGen` (octInnerNeg negates it, octTopNeg fixes it). -/
theorem octCompNeg_innerGen : octCompNeg innerGen = -innerGen := by
  show octTopNeg (octInnerNeg innerGen) = _
  rw [octInnerNeg_innerGen, map_neg, octTopNeg_innerGen]

/-- ★ `octCompNeg ≠ id` (it negates `e₂`). -/
theorem octCompNeg_ne_refl : octCompNeg ≠ LinearEquiv.refl Cut (O Cut) := by
  intro h
  have he : octCompNeg (CD.e2 : O Cut) = (CD.e2 : O Cut) := by rw [h]; rfl
  rw [octCompNeg_e2] at he
  have him := congrArg (fun z => (z : O Cut).im) he
  simp only [CD.neg_im, CD.e2_im] at him
  have hc := congrArg (fun (q : H Cut) => q.re.re) him
  simp only at hc
  norm_num [CD.neg_re, CD.one_re, Dbl.neg_re, Dbl.one_re] at hc

/-- ★ `octCompNeg ≠ octTopNeg` (they differ on `innerGen`: octCompNeg negates it, octTopNeg fixes it). -/
theorem octCompNeg_ne_octTopNeg : octCompNeg ≠ octTopNeg := by
  intro h
  have he : octCompNeg innerGen = octTopNeg innerGen := by rw [h]
  rw [octCompNeg_innerGen, octTopNeg_innerGen] at he
  have hre := congrArg (fun z => (z : O Cut).re) he
  simp only [CD.neg_re] at hre
  have hgen : -(CD.e2 : H Cut) = (CD.e2 : H Cut) := by
    simpa [innerGen, CD.iota] using hre
  have him := congrArg (fun (p : H Cut) => p.im) hgen
  simp only [CD.neg_im, CD.e2_im] at him
  have hc := congrArg (fun (d : Dbl Cut) => d.re) him
  simp only at hc
  norm_num [Dbl.neg_re, Dbl.one_re] at hc

/-- ★ `octCompNeg ≠ octInnerNeg` (they differ on `e₂`: octCompNeg negates it, octInnerNeg fixes it). -/
theorem octCompNeg_ne_octInnerNeg : octCompNeg ≠ octInnerNeg := by
  intro h
  have he : octCompNeg (CD.e2 : O Cut) = octInnerNeg (CD.e2 : O Cut) := by rw [h]
  rw [octCompNeg_e2, octInnerNeg_e2] at he
  have him := congrArg (fun z => (z : O Cut).im) he
  simp only [CD.neg_im, CD.e2_im] at him
  have hc := congrArg (fun (q : H Cut) => q.re.re) him
  simp only at hc
  norm_num [CD.neg_re, CD.one_re, Dbl.neg_re, Dbl.one_re] at hc

/-! ## The Klein-four multiplication table. -/

/-- `octTopNeg` is an INVOLUTION: `octTopNeg * octTopNeg = 1`. -/
theorem octTopNeg_mul_self : octTopNeg * octTopNeg = 1 := by
  refine LinearEquiv.ext (fun z => ?_)
  show octTopNeg (octTopNeg z) = z
  apply CD.ext
  · rfl
  · show -(-z.im) = z.im; rw [neg_neg]

/-- `octInnerNeg` is an INVOLUTION: `octInnerNeg * octInnerNeg = 1`. -/
theorem octInnerNeg_mul_self : octInnerNeg * octInnerNeg = 1 := by
  refine LinearEquiv.ext (fun z => ?_)
  show octInnerNeg (octInnerNeg z) = z
  apply CD.ext <;> (apply CD.ext <;> simp [hTopNegFun, octInnerNegFun])

/-- `octCompNeg` is an INVOLUTION: `octCompNeg * octCompNeg = 1`. -/
theorem octCompNeg_mul_self : octCompNeg * octCompNeg = 1 := by
  refine LinearEquiv.ext (fun z => ?_)
  show octCompNeg (octCompNeg z) = z
  rw [octCompNeg_apply, octCompNeg_apply]
  apply CD.ext
  · show hTopNegFun (hTopNegFun z.re) = z.re; rw [hTopNegFun_involution]
  · show -hTopNegFun (-hTopNegFun z.im) = z.im
    rw [hTopNegFun_neg, neg_neg, hTopNegFun_involution]

/-- COMMUTATIVITY: the two generators commute — the generated group is ABELIAN. -/
theorem octTopNeg_comm_octInnerNeg : octTopNeg * octInnerNeg = octInnerNeg * octTopNeg := by
  refine LinearEquiv.ext (fun z => ?_)
  show octTopNeg (octInnerNeg z) = octInnerNeg (octTopNeg z)
  apply CD.ext
  · rfl
  · show -hTopNegFun z.im = hTopNegFun (-z.im); rw [hTopNegFun_neg]

/-- Each element is its own inverse (self-inverse involution). -/
theorem octTopNeg_inv : octTopNeg⁻¹ = octTopNeg := by
  rw [eq_comm, eq_inv_iff_mul_eq_one]; exact octTopNeg_mul_self
theorem octInnerNeg_inv : octInnerNeg⁻¹ = octInnerNeg := by
  rw [eq_comm, eq_inv_iff_mul_eq_one]; exact octInnerNeg_mul_self
theorem octCompNeg_inv : octCompNeg⁻¹ = octCompNeg := by
  rw [eq_comm, eq_inv_iff_mul_eq_one]; exact octCompNeg_mul_self

/-- The product of the two GENERATORS (the other order) is the third element. -/
theorem octInnerNeg_mul_octTopNeg : octInnerNeg * octTopNeg = octCompNeg := by
  rw [octCompNeg_eq_mul, octTopNeg_comm_octInnerNeg]

/-- Klein-four products: the product of any two distinct non-identity elements is the third. -/
theorem octCompNeg_mul_octTopNeg : octCompNeg * octTopNeg = octInnerNeg := by
  rw [octCompNeg_eq_mul, mul_assoc, ← octTopNeg_comm_octInnerNeg, ← mul_assoc,
    octTopNeg_mul_self, one_mul]
theorem octTopNeg_mul_octCompNeg : octTopNeg * octCompNeg = octInnerNeg := by
  rw [octCompNeg_eq_mul, ← mul_assoc, octTopNeg_mul_self, one_mul]
theorem octCompNeg_mul_octInnerNeg : octCompNeg * octInnerNeg = octTopNeg := by
  rw [octCompNeg_eq_mul, mul_assoc, octInnerNeg_mul_self, mul_one]
theorem octInnerNeg_mul_octCompNeg : octInnerNeg * octCompNeg = octTopNeg := by
  rw [octCompNeg_eq_mul, octTopNeg_comm_octInnerNeg, ← mul_assoc, octInnerNeg_mul_self, one_mul]

/-! ## THE EXPLICIT KLEIN FOUR-GROUP SUBGROUP. -/

/-- ★★ THE EXPLICIT SUBGROUP: the 4-element carrier `{1, octTopNeg, octInnerNeg, octCompNeg}` is a
    `Subgroup` of the automorphism group `O Cut ≃ₗ[Cut] O Cut` — a concrete ℤ/2 × ℤ/2 ⊂ G₂ = Aut(O).
    Closed under `*` (the Klein-four table) and inverse (each element is self-inverse). -/
def kleinFour : Subgroup (O Cut ≃ₗ[Cut] O Cut) where
  carrier := {1, octTopNeg, octInnerNeg, octCompNeg}
  one_mem' := by left; rfl
  mul_mem' := by
    intro a b ha hb
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at ha hb ⊢
    rcases ha with rfl | rfl | rfl | rfl <;> rcases hb with rfl | rfl | rfl | rfl <;>
      simp only [one_mul, mul_one, octTopNeg_mul_self, octInnerNeg_mul_self, octCompNeg_mul_self,
        ← octCompNeg_eq_mul, octInnerNeg_mul_octTopNeg, octCompNeg_mul_octTopNeg,
        octTopNeg_mul_octCompNeg, octCompNeg_mul_octInnerNeg, octInnerNeg_mul_octCompNeg] <;>
      tauto
  inv_mem' := by
    intro a ha
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at ha ⊢
    rcases ha with rfl | rfl | rfl | rfl <;>
      simp only [inv_one, octTopNeg_inv, octInnerNeg_inv, octCompNeg_inv] <;> tauto

/-- ★ `kleinFour` is GENERATED by the two banked involutions `{octTopNeg, octInnerNeg}` — it is
    exactly their subgroup closure. The composition group of N139's and N140's automorphisms. -/
theorem kleinFour_eq_closure :
    kleinFour = Subgroup.closure {octTopNeg, octInnerNeg} := by
  apply le_antisymm
  · intro x hx
    simp only [kleinFour, Subgroup.mem_mk] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact one_mem _
    · exact Subgroup.subset_closure (by left; rfl)
    · exact Subgroup.subset_closure (by right; rfl)
    · rw [octCompNeg_eq_mul]
      exact mul_mem (Subgroup.subset_closure (by left; rfl))
        (Subgroup.subset_closure (by right; rfl))
  · rw [Subgroup.closure_le]
    intro x hx
    rcases hx with rfl | rfl
    · show octTopNeg ∈ kleinFour
      simp only [kleinFour, Subgroup.mem_mk]; tauto
    · show octInnerNeg ∈ kleinFour
      simp only [kleinFour, Subgroup.mem_mk]; tauto

/-- ★ EVERY element of `kleinFour` squares to `1` — the elementary abelian 2-group fingerprint of
    ℤ/2 × ℤ/2 (every non-identity element has order 2). -/
theorem kleinFour_elem_involution (x : O Cut ≃ₗ[Cut] O Cut) (hx : x ∈ kleinFour) :
    x * x = 1 := by
  simp only [kleinFour, Subgroup.mem_mk] at hx
  rcases hx with rfl | rfl | rfl | rfl
  · rw [one_mul]
  · exact octTopNeg_mul_self
  · exact octInnerNeg_mul_self
  · exact octCompNeg_mul_self

/-! ## The third gauge element + W8. -/

/-- ★★ The octonion-block embedding of the third concrete automorphism `octCompNeg` lands in the
    observer-plane gauge stabilizer `octStab` (N137) — a third real gauge element. The whole
    `kleinFour ≅ ℤ/2 × ℤ/2` sits inside the gauge group G₂ = Aut(O) ⊂ SO(8) ⊂ the stabilizer
    of `SO⁺(1,9)`. -/
theorem octBlockEndC_octCompNeg_mem_octStab :
    IsOctStab (octBlockEndC ((octCompNeg : O Cut →ₗ[Cut] O Cut))) :=
  octBlockEndC_autC_mem_octStab octCompNeg_isAlgAut

/-- W8 anchor (the costume `C173` reads off this `1`): the third gauge automorphism preserves
    `e₂`'s Born self-overlap, which is `1`. -/
theorem octCompNeg_gFormC_e2_eq_one :
    gFormC (octCompNeg (CD.e2 : O Cut)) (octCompNeg (CD.e2 : O Cut)) = 1 := by
  rw [autC_gFormC octCompNeg_isAlgAut (CD.e2 : O Cut) (CD.e2 : O Cut)]
  simp [gFormC, reQC, CD.e2, CD.mul_re, CD.star_re, CD.star_im]

end

end Phys.Algebra
