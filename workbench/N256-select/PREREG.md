# PREREG — N256: THE UNIQUE ISOSPIN-FIXED AXIS = span{κO 1}

FROZEN BEFORE PRODUCTION COMPUTE. Selection via docs/NODE_SELECTION.md (S1–S5, anti-bullshit gate
passed — see kanban comment thread on t_ffe26c90). Owner-authorized gather-side hypercharge front,
under the LOCK; does NOT resume the parked J₃(O) invariant-tower ASCENT (gather-native: imRep/crossOp,
banked integer-matrix calculus — NOT invariant towers).

## THE TARGET (the vector-level TWIN of N252's unique colour-fixed axis)
Over the fundamental 7 = ImO of the derived octonion rung O ℚ = CD (H ℚ), bank that the su(2)_L
branching singlet κO 1 is the UNIQUE isospin-fixed direction — the DUAL of N252 (unique colour-fixed
axis span{u1}). This upgrades N255's forced hyperOp COMMUTES (existence) to hyperOp is the UNIQUE
isospin-commuting gather generator (uniqueness, within the faithful gather-embedded 7).

  isospinInvariants := ⨅ D ∈ {DI,DJ,DK}, ker (imRep D)   : Submodule ℚ ImO   [the joint kernel of
                                                            weak isospin su(2)_L on the fundamental 7]

HEADLINE (unique isospin-fixed axis):
  ★★★ isospinInvariants_eq_span_kap : isospinInvariants = span{kap1'}   (kap1' = ⟨κO 1⟩ ∈ ImO)
  ★★  finrank_isospinInvariants : finrank ℚ isospinInvariants = 1        (W8 teeth: not 0, not larger)
Operator corollary (grounds N255):
  ★★  hyperOp_unique_isospin_commuting : within the faithful crossEmb, the isospin-commuting gather
      generators are EXACTLY span{hyperOp} — hyperOp = crossEmb kap1' is the UNIQUE (up to scale)
      isospin-commuting cross-product generator, because kap1' is the unique isospin-fixed axis and
      crossEmb is injective (N225). [phrasing: the preimage under crossEmb of the isospin-commuting
      operators = isospinInvariants = span{kap1'}, so their crossEmb-image = span{hyperOp}.]
CONTRAST (W8, the twin duality): the isospin-fixed axis span{κO 1}=span{e4} is a DIFFERENT line from
  the colour-fixed axis span{u1}=span{e1} (N252) — the two U(1) directions are genuinely distinct
  (dual to N255's different-commutants; charge↔colour, hypercharge↔isospin).

## SCOPE — HONESTY CLAUSE (respects the ≥5× hypercharge-normalization deferral)
Banks the forced unique isospin-fixed DIRECTION span{κO 1} (+ the operator uniqueness within the
faithful gather-embedded 7). Does NOT claim the weak MIXING ANGLE, coupling NORMALIZATION, or
Gell-Mann–Nishijima. Does NOT claim the FULL so(7)-operator-centralizer uniqueness (N255 front (A):
Z_{g2}(su2L)=0 over the 14-dim g₂ — HEAVIER, stays a separate deferred W1 child, NOT needed for this
vector-level result). Upgrades N255's COMMUTES to the seed's UNIQUENESS; the full-so(7) uniqueness
and the normalization stay downstream nodes.

## MEASURED (workbench/N256-select/*.py + probe_djbridge.lean — FROZEN)
- Joint ker of su(2)_L={DI,DJ,DK} on the 7 = EXACTLY 1-dim = span{e4}=span{κO 1} (scale 1).
- No single generator pins it (each ker is 3-dim; su(2)_L rank 1); ANY PAIR {DI,DJ} pins to 1-dim.
- My exact-ℚ model reproduces the BANKED Imat byte-for-byte; Jmat = clean integer matrix (below).
- imRep_DJ_eq_qI bridge COMPILES foundations-only [propext, Classical.choice, Quot.sound], EXIT 0,
  via the banked simp;ring template (twin of imRep_DI_eq_qI), simp set hJ=CD.e2 (NOT CD.iota/Dbl.J).
- All candidate decl names grep-clean (0 hits): isospinInvariants, isospinInvariants_eq_span_kap,
  imRep_DJ_eq_qI, Jmat, unique_isospin_fixed_axis, hyperOp_unique_isospin_commuting.

Jmat (imRep DJ on ImO, integer 7×7):
  [0,0,2,0,0,0,0],[0,0,0,0,0,0,0],[-2,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,2],[0,0,0,0,0,0,0],[0,0,0,0,-2,0,0]

## ROUTE (THE ONE LAW / W9-LIGHT — no coordinate bash of the non-associative O ℚ product)
Mirrors N252 EXACTLY, but with a PAIR of banked integer matrices instead of one Dreg:
  (1) Jmat def + imRep_DJ_eq_qI (twin of banked imRep_DI_eq_qI; DE-RISKED GREEN in probe_djbridge.lean).
  (2) isospinInvariants ⊇ span{kap1'} : kap1' ∈ ker(imRep DI) and ker(imRep DJ) and ker(imRep DK).
      imRep_D_kappaO_one already banked (D_kappaO_one_zero, N255 / innerDeriv_kappaO_one N189) — every
      isospin generator kills κO 1. So kap1' ∈ each ker ⟹ ⊇.
  (3) isospinInvariants ⊆ span{kap1'} (THE CRUX): x fixed by DI AND DJ ⟹ via imRep_DI_eq_qI=qI Imat +
      imRep_DJ_eq_qI=qI Jmat, the 6 nonzero rows of {Imat,Jmat} force c1=c2=c3=c5=c6=c7 = 0 (using
      reQ_ImO_zero for c0=0); x ∈ ImO leaves only c4 = the κO-1 coordinate ⟹ x = c4·κO1 ∈ span{kap1'}.
      linarith on the banked integer rows — the N252 ker_qI_MH_le_span_sgl template on the PAIR.
      [κO 1 = e4 = index-3 coordinate; check exact coordinate spelling of kap1' in production — N255's
       kap1' := ⟨kappaO 1, kappaO_one_mem_ImO⟩; κO 1 = ⟨0,1⟩ ∈ O = CD(H), the e4 basis vector.]
  (4) finrank_isospinInvariants = 1 via finrank_span_singleton kap1'_ne_zero (banked N255).
  (5) operator corollary: crossEmb injective (N225) + the joint-kernel = span{kap1'} ⟹ the preimage
      of isospin-commuting operators is span{kap1'}, image span{hyperOp}. hyperOp = crossEmb kap1'
      (rewrite of hyperOp = crossOp (kappaO 1)). Use crossEmb_injective + Submodule.map_span.

## LOCAL-INSTANCE HEADER (W9 synth context — REQUIRED)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ   (the banked gather-module header,
exactly as N252/N255). Namespace Phys.Algebra; open Phys.Cascade Phys.Cascade.CD.

## GO / NO-GO
GO if: (1)+(2)+(3)+(4) compile foundations-only in the production module (all de-risked; the PAIR
⊆ is the only genuinely-new proof, and it is the N252 linarith template on two banked matrices).
If the operator corollary (5) fights (crossEmb preimage plumbing), BANK (1)-(4) [the unique
isospin-fixed axis + finrank — the theory-native headline] and CHILD (5) as optional hardening (W3);
(1)-(4) is the sufficient deliverable. Do NOT grind (5); it is a corollary, not the headline.

## KILL (per obligation)
- Any single obligation exceeding 120s / 400000 heartbeats OR needing maxHeartbeats (proof-kernel)
  raised above default → STOP, decompose or child (W9). The DJ bridge already measured light.
- NO native_decide, NO decide on O ℚ products, NO coordinate bash, NO scope reduction of the headline.

## STANDARD (verify at wind-down)
UNBROKEN (objects banked: N253/N254 Imat/qI/qZ/M7 calculus; N252 template; N255 kap1'/hyperOp/crossEmb;
N189 innerDeriv_kappaO_one; N208 reQ_ImO_zero; N22 imRep; ground derived ℚ; O ℚ = CD (H ℚ); no Mathlib
number/algebra as content; nothing posited but the fold). COMPLETE (foundations-only, no
sorry/axiom/native_decide). WORDS-REMOVABLE (delete isospin/hypercharge/weak/gauge/su(2): "the joint
kernel of {imRep DI, imRep DJ, imRep DK} ⊂ g₂ on ImO is exactly span{⟨κO 1⟩}, finrank 1, a DIFFERENT
line from span{u1}" — pure math survives). FREE-FLOATING check: every headline TYPE mentions the banked
tower objects (isospinInvariants over imRep DI/DJ/DK on ImO of the derived O ℚ; kap1'; hyperOp) — the
CONCRETE joint kernel of the banked operators, NOT a carrier-agnostic construction.

## COSTUME (a WRONG reading forced through a banked witness)
Cid C287 (next free — N255=C286 confirmed; C287 grep-clean). A WRONG reading — "the isospin-fixed axis
is NOT 1-dimensional / is larger than span{κO 1} / the charged complement has an isospin-fixed
direction / the isospin-fixed axis coincides with the colour axis" — forces a false numeric through the
banked witness (finrank_isospinInvariants = 1, or the coordinate reading that κO 1's e4-coordinate
survives while the others vanish). Pick RHS = 287, LHS distinct from every prior left-hand value.

## PRODUCTION FILE
Phys/Algebra/TowerGatherUniqueIsospinFixedAxis.lean (namespace Phys.Algebra). Imports: the N253 ratio
file (Imat/qI/qZ/M7/imRep_DI_eq_qI/traceForm), N255 hypercharge-direction file (kap1'/hyperOp/crossEmb/
D_kappaO_one_zero), N252 unique-colour-axis file (for reQ_ImO_zero / c_i / template if needed).
