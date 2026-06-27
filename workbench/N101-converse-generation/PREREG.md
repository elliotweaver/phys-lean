# N101 PREREG — THE CONVERSE GENERATION (boost-sector): a boost's polar compact part IS the identity (an empty biMulLin word) ∈ genIsomMonoidLin → bridged ∈ genIsomMonoidC2

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## THE TARGET (priority (i), MEASURE-FIRST, NO topology)
N100 banked the FORWARD transport (every Module.End biMulLin word, bridged, ∈ genIsomMonoidC2).
The CONVERSE `qvIsomMonoidC ≤ genIsomMonoidC2` needs: an isometry's polar compact part k IS a
finite biMulLin product (k ∈ genIsomMonoidLin). The ticket's priority (i) asks literally:
"is a concrete boost's compact part the identity / a specific biMulLin / genTwoPlaneLin?"

ANSWER (theory-native, the KAK structure): a PROPER ORTHOCHRONOUS BOOST g = boostEndC a b
(a²−b²=1, a+b≥0, a−b≥0, i.e. a≥|b|) is EvC-SELF-ADJOINT (boostEndC_isEvCAdjoint_self) AND
EvC-POSITIVE-DEFINITE (boostC_nonneg, boostEndC ≡ boostC defeq) — so it IS its OWN polar
positive part p^{1/2} = √(g*g). Hence its polar compact part
        k := g ∘ (p^{1/2})⁻¹ = g ∘ g⁻¹ = IDENTITY = the empty biMulLin word ∈ genIsomMonoidLin,
whence by the N100 transport endToFunEnd k ∈ genIsomMonoidC2. This DISCHARGES the converse
generation `qvIsomMonoidC ≤ genIsomMonoidC2` on the ENTIRE BOOST (non-compact) SECTOR — the
first converse-direction result, NO operator topology, NO Lie-group integration, NO posited group.

The deep structural content (genuinely NEW, not a re-pin): a pure boost contributes the TRIVIAL
element to the compact-generation problem. It has no "rotation content"; all generated rotations
come from the genuinely-compact isometries. KAK: g = k·p, and for a pure boost k = id.

## THE PROOF (each step a banked-lemma application — NO coordinate grind, NO heavy compile)
Obtain ⟨n,c,u,horth,hcpos,heq,_⟩ := isometry_compact_part_isQvIsom (boostEndC_isQvIsomC hab)
        (boostEndC_isEvCAdjoint_self a b)   -- heq : (boostEndC a b).comp (boostEndC a b) = specOpN c u
Goal: (boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) = LinearMap.id.
  1. h₁ : IsEvCOpSqrt (specOpN (cutSqrt∘c) u) (specOpN c u) := specOpN_op_sqrt (·.le∘hcpos) horth.
  2. h₂ : IsEvCOpSqrt (boostEndC a b) (specOpN c u)
        := ⟨boostEndC_isEvCAdjoint_self a b (=IsEvCSymm, defeq), boostEndC_nonneg hpos hpos', heq⟩.
     (boostEndC_nonneg: helper, 0 ≤ EvC (boostEndC a b p) p, = boostC_nonneg via defeq.)
  3. hg_inj := linIsom_injective (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b).
     hqinj : Injective (specOpN c u) := heq ▸ comp_injective_of_adjoint (…self) hg_inj.
  4. hsqrt_eq : specOpN (cutSqrt∘c) u = boostEndC a b := op_sqrt_unique_of_injective hqinj h₁ h₂.
  5. hres : ∑ projC (u i) = id := specOpN_resolution_of_injective horth hqinj.
     hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i)).
  6. rw [← hsqrt_eq]; exact specOpN_inverse horth hres hsq_ne.   -- p^{1/2} ∘ (p^{1/2})⁻¹ = id

PAYOFF decls:
  • boostEndC_nonneg (helper: 0 ≤ EvC (boostEndC a b p) p for a±b≥0).
  • boostEndC_compact_part_eq_id  — ★★ THE CONVERSE CORE: ∃ n c u, horth ∧ hcpos ∧ heq ∧
      (boostEndC a b).comp (specOpN (cutSqrt c)⁻¹ u) = LinearMap.id.
  • boostEndC_compact_part_mem_genLin — the compact part (= id) ∈ genIsomMonoidLin (one_mem).
  • boostEndC_compact_part_mem_gen2  — bridged: endToFunEnd k ∈ genIsomMonoidC2 (= one_mem, or
      endToFunEnd_genIsomMonoidLin_mem_gen2 of the genLin membership). THE CONVERSE GENERATION on
      the boost sector.
  • W8: boostEndC_compact_part_id_coord — the concrete boost (5/3,4/3) compact part = id reads
      time coordinate 1 at (1,0,0). teeth.

## GO / NO-GO
GO if all payoff decls compile foundations-only [propext, Classical.choice, Quot.sound], the
boost-compact-part-eq-id closes via the 6-step banked route, gate D0–D6 green, costume C133 bites.
NO-GO → decompose: bank boostEndC_nonneg + boostEndC_compact_part_eq_id alone; child the
mem_genLin/mem_gen2/converse-on-arbitrary-isometry remainder.

## KILL BUDGET (W9 — instrument-failure line)
Each new decl is a structural application of banked lemmas; EXPECTED < 10s each (warm oleans).
KILL = any single obligation > 90s OR the file build > 6 min cold. If hit: the route is an
INSTRUMENT issue (likely a defeq mismatch boostEndC vs boostC / a specOpN family rewrite) —
MEASURE the offending sub-obligation, do NOT inflate maxHeartbeats, decompose. NEVER run an
unbounded compile inside the turn budget.

## ANTI-DRIFT (THE ONE LAW)
If the eq_id fight resists, the framing is wrong, not the theory: a boost IS its own positive
part — return to that. Do NOT weaken to "k is an isometry" (already N93) or add a hypothesis.

## W8 / COSTUME C133 (must bite, distinct false numeric)
The boost's polar compact part = id fixes the time axis: k(1,0,0)=(1,0,0), time coord .1 = 1.
Costume C133: a WRONG converse-generation compact-part coordinate — the bogus claim that the
boost's compact part reads time coordinate 31 at (1,0,0), forcing 1 = 31, fails to compile.
Distinct from C115 1=7 … C130 −1=17, C131 −1=29, C132 1=23.

## PHYSICS-WORDS-REMOVABLE
Delete boost/Lorentz/isometry/compact/polar/KAK/positive-part/spectral/generation/Spin/SO(9):
pure linear algebra over Cut — the self-adjoint positive-definite operator boostEndC a b
(a²−b²=1, a±b≥0) composed with the inverse-spectral-root of its square equals the identity
(it IS its own positive operator square root); the identity ∈ the generated submonoid; its
bridge-image ∈ the Function.End generated submonoid. NO statement needs a physics word.
