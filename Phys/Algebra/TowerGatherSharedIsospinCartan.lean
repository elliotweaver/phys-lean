/-
  Phys.Algebra.TowerGatherSharedIsospinCartan — N259.
  ==================================================================================================
  THE SHARED ISOSPIN CARTAN: the two derived Standard-Model reductive factors are NOT a direct
  product — they OVERLAP in exactly the one-dimensional isospin Cartan line.

  Over the derived octonion rung `O ℚ = CD (H ℚ)`, the fundamental 7 = `ImO`, inside the single
  derived `so(7)`, the chain has banked TWO reductive Lie subalgebras of `Module.End ℚ ImO`,
  both split across the SAME gather tear `so(7) = 14 (Der O = range imRepL) ⊕ 7 (range crossEmb)`:
    • `chargeColourLie = chargeLine ⊔ colourImg`  (u(1)_Q in the 7, su(3)_c in the 14; dim 9, N247);
    • `electroweakLie  = isospinImg ⊔ hyperLine`   (su(2)_L in the 14, u(1)_Y in the 7; dim 4, N258).

  The field POSITS `SU(3)_c × SU(2)_L × U(1)_Y` as a DIRECT PRODUCT: the factors commute, share no
  generator, act on disjoint indices. THIS NODE DERIVES the theory's contrary, forced fact: both
  non-abelian factors are subalgebras of the SAME rank-2 `g₂ = Der(O ℚ)`, which cannot independently
  hold `su(3)` (rank 2) and `su(2)` (rank 1) — so they MUST overlap. The overlap is EXACTLY the
  1-dimensional isospin Cartan line, and it is UNIQUE:

    ★★★ `shared_cartan` : `chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
                              = Submodule.span ℚ {imRepL DI}`   (= the isospin Cartan `T3`);
    ★★  `finrank_inf_sharedCartan` : `finrank (chargeColourLie ⊓ electroweakLie) = 1`;
    ★★★ `finrank_sup_sharedCartan` : `finrank (chargeColourLie ⊔ electroweakLie) = 12`
        (= 9 + 4 − 1, inclusion–exclusion — the two factors span 12 of the 21 dimensions of so(7));
    W8 TEETH — NOT A DIRECT PRODUCT / the shared line is PROPER:
      `inf_ne_bot_sharedCartan` (the intersection is NONtrivial — the factors genuinely share T3, so
        they are NOT independent), and
      `chargeOp_not_mem_sharedCartan` (the gather charge `chargeOp`, in the colour-charge factor by
        N247, is ABSENT from the shared line — the overlap is neither factor, exactly the 1-dim T3).

  THE ONE CAUSE (docs/STANDARD §0, "one cause, many terminations"). The shared generator is forced by
  the single fold-root `u1` (the derived √−1): its OWN inner derivation `DI` annihilates `u1`
  (`DI_u1`, N197), so `DI` commutes with the charge complex structure and lies in the colour
  centralizer (`DI_mem_colour`, N202); hence `imRep DI` lies in BOTH `colourImg` and `isospinImg`.
  The same `u1` that gives the charge DIRECTION (`chargeOp = crossOp u1`) is what puts `T3 = imRep DI`
  into colour — one element, both sectors. And the SAME `inter_eq_bot` (`range imRepL ⊓ range crossEmb
  = ⊥`, the simplicity of `Der(O ℚ)`, N225) that split each reductive factor into its 14- and
  7-summands now forces the two factors' 7-parts (`chargeOp`, `hyperOp`) to drop out of the
  intersection, leaving only the shared 14-part `span{imRep DI}`.

  THE DISSOLUTION (docs/STANDARD §0). The field's independent-direct-product picture DISSOLVES: there
  is ONE simple `so(7)`, and the two reductive factors are overlapping subalgebras of it, meeting in
  the isospin Cartan. This shared `T3` is precisely the structural HINGE the deferred electroweak
  mixing angle needs — a third neutral generator connecting the colour-charge and electroweak
  sectors (Gell-Mann–Nishijima relates a colour-sector charge `Q` to the shared `T3` and an
  electroweak-sector `Y`). The RUNBOOK-named ★2 ascent asked for "a structure larger than the neutral
  plane `{Q,Y}`"; the shared Cartan supplies that third neutral generator, WITHOUT positing the angle.

  ⚠ SCOPE — HONESTY CLAUSE. Banks the intersection `= span{imRep DI}` + finrank `1` + finrank(sum) `12`
  + the not-a-direct-product teeth ONLY. Does NOT claim: the full so(7)-GENERATION (the bracket
  closure of the two factors is all of so(7) — 12 → 21 — a heavier separate node); the weak MIXING
  ANGLE / coupling ratio / Gell-Mann–Nishijima (structurally blocked; the shared Cartan is the hinge
  it needs, but the angle itself stays deferred).

  THE MOAT / free-floating check (docs/SOUL). Every headline TYPE mentions the banked tower objects
  (`chargeColourLie`/`electroweakLie`/`colourImg`/`isospinImg`/`chargeLine`/`hyperLine`/`imRepL`/`DI`
  on the derived `O ℚ`); the intersection is the CONCRETE meet of the two banked LieSubalgebras, NOT
  a carrier-agnostic construction. Ground = derived `ℚ`, no Mathlib ℝ/ℂ as content, nothing posited,
  no bridge. All proofs at the submodule / finrank level — NO octonion coordinate bash, NO
  kernel-bypass decision tactics, NO proof-kernel `maxHeartbeats` raise (the `synthInstance` bump is
  instance-search only, banked precedent).

  Physics-words-removable: delete colour/isospin/hypercharge/charge/gauge/weak/electroweak — the pure
  statement that the two banked Lie subalgebras `chargeColourLie` (dim 9) and `electroweakLie` (dim 4)
  of `Module.End ℚ ImO` meet in `span ℚ {imRepL DI}` (finrank 1), their sup has finrank 12, the meet
  is nonzero, and `chargeOp ∉` the meet — stands as pure mathematics.

  IMPORTS ONLY banked N258 (`TowerGatherElectroweakReductiveLie`, transitively N257/N247/N225/N202/N22/…).
-/
import Phys.Algebra.TowerGatherElectroweakReductiveLie

open scoped Classical
noncomputable section

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

set_option synthInstance.maxHeartbeats 400000

/-! ## The two component intersections. -/

/-- ★★ COLOUR ⊓ ISOSPIN = the isospin Cartan line, at the adjoint-14 level. Both `colourImg` and
    `isospinImg` are images under the injective `imRepL` (N22 `imRep_injective`), so their meet is
    the image of the meet of their preimages `colourCentralizer.toSubmodule ⊓ isospinSpan`
    (`Submodule.map_inf`), which is EXACTLY `span ℚ {DI}` (the banked `meet_eq_span_DI`, N202: the
    embedded `su(2)` and the colour centralizer meet in the 1-dim Cartan line). So the shared 14-part
    is `span ℚ {imRepL DI}`. -/
theorem colourImg_inf_isospinImg :
    colourImg ⊓ isospinImg = Submodule.span ℚ {imRepL DI} := by
  rw [colourImg, isospinImg,
      ← Submodule.map_inf imRepL imRep_injective,
      inf_comm, meet_eq_span_DI, Submodule.map_span]
  simp

/-- ★★ THE TWO CHARGE LINES MEET TRIVIALLY: `chargeLine ⊓ hyperLine = ⊥`. Any common element is
    `a • chargeOp = b • hyperOp`; pairing against `chargeOp` in the g₂-invariant trace form and using
    the banked N257 gather-isometry Gram (`traceForm7 chargeOp chargeOp = −6`,
    `traceForm7 chargeOp hyperOp = 0`) forces `a·(−6) = 0`, hence `a = 0` and the element is `0`. The
    two forced U(1)s are trace-orthogonal, so their lines are transverse. -/
theorem chargeLine_inf_hyperLine : chargeLine ⊓ hyperLine = ⊥ := by
  rw [eq_bot_iff]
  intro x hx
  rw [Submodule.mem_inf] at hx
  obtain ⟨hxc, hxh⟩ := hx
  rw [chargeLine, Submodule.mem_span_singleton] at hxc
  rw [hyperLine, Submodule.mem_span_singleton] at hxh
  obtain ⟨a, ha⟩ := hxc
  obtain ⟨b, hb⟩ := hxh
  have hax : x = a • chargeOp := ha.symm
  have hbx : x = b • hyperOp := hb.symm
  have key : a * (-6 : ℚ) = 0 := by
    have e1 : traceForm7 x chargeOp = a * traceForm7 chargeOp chargeOp := by
      rw [hax]; simp [traceForm7, map_smul]
    have e2 : traceForm7 x chargeOp = b * traceForm7 hyperOp chargeOp := by
      rw [hbx]; simp [traceForm7, map_smul]
    rw [B_chargeOp_chargeOp_via_isometry] at e1
    rw [traceForm7_symm hyperOp chargeOp, B_chargeOp_hyperOp] at e2
    rw [e1] at e2; simpa using e2.symm
  have ha0 : a = 0 := by
    have h6 : (-6 : ℚ) ≠ 0 := by norm_num
    rcases mul_eq_zero.mp key with h | h
    · exact h
    · exact absurd h h6
  rw [hax, ha0, zero_smul]; exact Submodule.zero_mem _

/-! ## Summand locations (re-exported for the intersection argument). -/

theorem chargeLine_le_P7 : chargeLine ≤ LinearMap.range crossEmb := chargeLine_le_range_crossEmb
theorem colourImg_le_P14 : colourImg ≤ LinearMap.range imRepL := colourImg_le_range_imRep
theorem isospinImg_le_P14 : isospinImg ≤ LinearMap.range imRepL := isospinImg_le_range_imRep
theorem hyperLine_le_P7 : hyperLine ≤ LinearMap.range crossEmb := hyperLine_le_range_crossEmb

/-! ## THE HEADLINE: the shared isospin Cartan. -/

/-- ★★★ THE SHARED ISOSPIN CARTAN. The two banked reductive Lie subalgebras of `Module.End ℚ ImO`
    meet in EXACTLY the 1-dimensional isospin Cartan line:
      `chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule = span ℚ {imRepL DI}`.
    Proof (all at the submodule level, NO coordinate bash). ⊇: `imRepL DI ∈ colourImg`
    (`DI ∈ colourCentralizer`, N202) so `∈ chargeColourLie`; and `imRepL DI ∈ isospinImg`
    (`DI ∈ isospinSpan`) so `∈ electroweakLie`. ⊆: for `x` in the meet, write `x = c + k`
    (`c ∈ chargeLine ⊆ 7`, `k ∈ colourImg ⊆ 14`) and `x = i + h` (`i ∈ isospinImg ⊆ 14`,
    `h ∈ hyperLine ⊆ 7`). Then `k − i = h − c` lies in `range imRepL ⊓ range crossEmb = ⊥`
    (`inter_eq_bot`, N225), so `k = i` and `h = c`. Then `c ∈ chargeLine ⊓ hyperLine = ⊥` gives
    `c = 0`, and `k ∈ colourImg ⊓ isospinImg = span{imRepL DI}` gives `x = k ∈ span{imRepL DI}`. -/
theorem shared_cartan :
    chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      = Submodule.span ℚ {imRepL DI} := by
  rw [chargeColourLie_toSubmodule, electroweakLie_toSubmodule]
  apply le_antisymm
  · intro x hx
    rw [Submodule.mem_inf] at hx
    obtain ⟨hxcc, hxew⟩ := hx
    rw [Submodule.mem_sup] at hxcc
    obtain ⟨c, hc, k, hk, hxck⟩ := hxcc
    rw [Submodule.mem_sup] at hxew
    obtain ⟨i, hi, h, hh, hxih⟩ := hxew
    have hsum : c + k = i + h := by rw [hxck, hxih]
    have hcombine : k - i = h - c := by
      rw [sub_eq_sub_iff_add_eq_add, add_comm k c, add_comm h i]; exact hsum
    have hki_P14 : k - i ∈ LinearMap.range imRepL :=
      Submodule.sub_mem _ (colourImg_le_P14 hk) (isospinImg_le_P14 hi)
    have hhc_P7 : h - c ∈ LinearMap.range crossEmb :=
      Submodule.sub_mem _ (hyperLine_le_P7 hh) (chargeLine_le_P7 hc)
    have hmem_bot : k - i ∈ (⊥ : Submodule ℚ (Module.End ℚ ImO)) := by
      rw [← inter_eq_bot, Submodule.mem_inf]
      refine ⟨hki_P14, ?_⟩
      rw [hcombine]; exact hhc_P7
    rw [Submodule.mem_bot] at hmem_bot
    have hki : k = i := by rw [← sub_eq_zero]; exact hmem_bot
    have hhc : h = c := by
      have hz : h - c = 0 := by rw [← hcombine, hki]; exact sub_self i
      rw [← sub_eq_zero]; exact hz
    have hc0 : c = 0 := by
      have hcmem : c ∈ chargeLine ⊓ hyperLine := by
        rw [Submodule.mem_inf]; exact ⟨hc, hhc ▸ hh⟩
      rw [chargeLine_inf_hyperLine, Submodule.mem_bot] at hcmem
      exact hcmem
    have hkmem : k ∈ colourImg ⊓ isospinImg := by
      rw [Submodule.mem_inf]; exact ⟨hk, hki ▸ hi⟩
    rw [colourImg_inf_isospinImg] at hkmem
    have hxk : x = k := by rw [← hxck, hc0, zero_add]
    rw [hxk]; exact hkmem
  · rw [Submodule.span_le, Set.singleton_subset_iff]
    have hDI_col : imRepL DI ∈ colourImg := by
      rw [colourImg, Submodule.mem_map]
      exact ⟨DI, by rw [LieSubalgebra.mem_toSubmodule]; exact DI_mem_colour, rfl⟩
    have hDI_iso : imRepL DI ∈ isospinImg := by
      rw [isospinImg, Submodule.mem_map]
      exact ⟨DI, Submodule.subset_span (by simp), rfl⟩
    rw [SetLike.mem_coe, Submodule.mem_inf]
    exact ⟨Submodule.mem_sup_right hDI_col, Submodule.mem_sup_left hDI_iso⟩

/-! ## The dimensions and the W8 teeth. -/

/-- `imRepL DI ≠ 0` — the shared generator is nonzero (`imRepL` injective, N22; `DI ≠ 0`, N202). -/
theorem imRepL_DI_ne_zero : imRepL DI ≠ 0 := by
  intro h
  exact DI_ne_zero ((injective_iff_map_eq_zero imRepL).mp imRep_injective DI h)

/-- ★★ THE SHARED LINE IS 1-DIMENSIONAL: `finrank (chargeColourLie ⊓ electroweakLie) = 1`. The meet
    is the line `span{imRepL DI}` with `imRepL DI ≠ 0`. -/
theorem finrank_inf_sharedCartan :
    Module.finrank ℚ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO)) = 1 := by
  rw [shared_cartan, finrank_span_singleton imRepL_DI_ne_zero]

/-- ★★★ THE TWO FACTORS SPAN 12 DIMENSIONS: `finrank (chargeColourLie ⊔ electroweakLie) = 12`. By
    inclusion–exclusion `finrank(sup) + finrank(inf) = finrank(cc) + finrank(ew) = 9 + 4`
    (`chargeColourLie_finrank`, `electroweakLie_finrank`), and `finrank(inf) = 1`
    (`finrank_inf_sharedCartan`), so `finrank(sup) = 12` — the two SM reductive factors together
    occupy 12 of the 21 dimensions of the single `so(7)`, overlapping in the shared isospin Cartan. -/
theorem finrank_sup_sharedCartan :
    Module.finrank ℚ (chargeColourLie.toSubmodule ⊔ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO)) = 12 := by
  have hie := Submodule.finrank_sup_add_finrank_inf_eq
    chargeColourLie.toSubmodule electroweakLie.toSubmodule
  rw [chargeColourLie_finrank, electroweakLie_finrank, finrank_inf_sharedCartan] at hie
  omega

/-- W8 TEETH — NOT A DIRECT PRODUCT. The intersection is NONtrivial (`≠ ⊥`): the two SM reductive
    factors genuinely SHARE the isospin Cartan `T3`, so they are NOT independent commuting factors of
    a direct product. -/
theorem inf_ne_bot_sharedCartan :
    (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO)) ≠ ⊥ := by
  rw [shared_cartan]
  intro h
  rw [Submodule.span_singleton_eq_bot] at h
  exact imRepL_DI_ne_zero h

/-- W8 TEETH — THE SHARED LINE IS PROPER. The gather charge `chargeOp` (placed INSIDE the
    colour-charge factor by N247) is ABSENT from the shared line: `chargeOp ∉ chargeColourLie ⊓
    electroweakLie` — because `chargeOp ∉ electroweakLie` (N258 `chargeOp_not_mem_electroweakLie`).
    So the overlap is neither the whole colour-charge factor nor the electroweak factor: it is
    exactly the 1-dim isospin Cartan `T3`, the unique shared generator. -/
theorem chargeOp_not_mem_sharedCartan :
    chargeOp ∉ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO)) := by
  intro h
  rw [Submodule.mem_inf] at h
  have h2 := h.2
  rw [electroweakLie_toSubmodule] at h2
  exact chargeOp_not_mem_electroweakLie h2

/-! ## THE CAPSTONE. -/

/-- ★★★ THE SHARED ISOSPIN CARTAN STRUCTURE. Over the derived `ℚ` and the banked octonion rung
    `O ℚ = CD (H ℚ)`, the two derived Standard-Model reductive Lie subalgebras of `Module.End ℚ ImO`
    — the colour-charge factor `chargeColourLie` (dim 9, N247) and the electroweak factor
    `electroweakLie` (dim 4, N258) — are NOT a direct product: they MEET in EXACTLY the 1-dimensional
    isospin Cartan line `span{imRepL DI}` (`shared_cartan`, `finrank_inf_sharedCartan`), their sup has
    finrank `12` (`finrank_sup_sharedCartan`), the meet is nonzero (`inf_ne_bot_sharedCartan`), and
    the gather charge `chargeOp` is absent from it (`chargeOp_not_mem_sharedCartan`). The shared
    generator is forced by the single fold-root `u1` (via `DI_mem_colour`) and the tear separation
    `inter_eq_bot` — one cause, both sectors. -/
theorem shared_isospin_cartan_structure :
    chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
        = Submodule.span ℚ {imRepL DI}
    ∧ Module.finrank ℚ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
        : Submodule ℚ (Module.End ℚ ImO)) = 1
    ∧ Module.finrank ℚ (chargeColourLie.toSubmodule ⊔ electroweakLie.toSubmodule
        : Submodule ℚ (Module.End ℚ ImO)) = 12
    ∧ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
        : Submodule ℚ (Module.End ℚ ImO)) ≠ ⊥
    ∧ chargeOp ∉ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
        : Submodule ℚ (Module.End ℚ ImO)) :=
  ⟨shared_cartan, finrank_inf_sharedCartan, finrank_sup_sharedCartan,
   inf_ne_bot_sharedCartan, chargeOp_not_mem_sharedCartan⟩

end Phys.Algebra
