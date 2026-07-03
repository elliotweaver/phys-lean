# PREREG — N255: THE FORCED HYPERCHARGE DIRECTION = crossOp(κO 1)

FROZEN BEFORE PRODUCTION COMPUTE. Selection via docs/NODE_SELECTION.md (S1–S5, anti-bullshit gate
passed — see kanban comment thread on t_07e04e69). Owner-authorized gather-side hypercharge front,
under the LOCK; does NOT resume the parked J₃(O) invariant-tower ASCENT.

## THE TARGET
Over the fundamental 7 = ImO of the derived octonion rung O ℚ = CD (H ℚ), bank the FORCED
isospin-commuting neutral generator — the twin of chargeOp = crossOp u1:

  hyperOp := crossOp (κO 1) : Module.End ℚ ImO     [κO 1 = the su(2)_L branching singlet, N189;
                                                    = basis index e4, the isospin-FIXED direction]

HEADLINE (isospin-commuting): hyperOp commutes with the WHOLE weak isospin su(2)_L = {DI,DJ,DK}:
  ⁅imRep D, hyperOp⁆ = 0 and Commute (imRep D) hyperOp for D ∈ {DI,DJ,DK}.
CONTRAST (W8 teeth, the twin asymmetry): chargeOp does NOT commute with all su(2)_L
  (⁅imRep DJ, chargeOp⁆ ≠ 0, banked chargeOp_stabilizer_proper N240) — the two U(1)s are genuinely
  different operators. hyperOp is isospin-neutral; chargeOp is not.
NONZERO (W8): hyperOp ≠ 0, witnessed by (hyperOp ⟨u1⟩).c5 = −1 (octCross(κO 1, u1) = −e5).
UNIQUENESS (the crown — MEASURE-FIRST, include-or-child): the so(7)-centralizer of su(2)_L is
  EXACTLY 1-dim = span{hyperOp} (numeric-confirmed: Z_{g2}(su2L)=0, Fix_{su2L}(7)=span{κO 1}).

## SCOPE — HONESTY CLAUSE (respects the ≥5× hypercharge-normalization deferral)
Banks the forced isospin-commuting DIRECTION crossOp(κO 1) (+ uniqueness if it lands clean). Does
NOT claim the weak MIXING ANGLE, coupling NORMALIZATION, or Gell-Mann–Nishijima Q = T3 + Y/2
(numerically FALSE as a span relation: chargeOp ∉ span{imRep DI, hyperOp}). Twins N254's
forced-existence with a forced IDENTITY; the normalization stays a separate downstream node.

## ROUTE (THE ONE LAW / W9-LIGHT — no coordinate bash of the non-associative O ℚ product)
Headline: the banked g₂-intertwiner crossOp_imRep_intertwine (N225) turns ⁅imRep D, crossOp(κO 1)⁆
into crossOp(D(κO 1)); the banked singlet annihilation innerDeriv_kappaO_one (N189) gives
D(κO 1)=0; crossOp_zero closes it. Three rewrites. CONFIRMED foundations-only, EXIT 0 ~13s for all
three DI/DJ/DK via one generic lemma (workbench/N255-select/scratch_full.lean).
Nonzero: octCross_antisymm + octCross_u1_u2-style coordinate witness at c5 (mirrors N254
chargeOp_kappaO_coord). CONFIRMED route (workbench/N255-select/scratch_nonzero.lean; only kappaO_one
coordinate spelling remains — a `simp`/`decide`-free `ext` on the concrete O ℚ element).
Uniqueness: centralizer(su2L) in so(7) = Z_{g2}(su2L) ⊕ crossOp(Fix_{su2L}(7)). The Fix half is
Fix_{su2L}(7)=span{κO 1} (dim 1). The Z_{g2} half (=0) is the measure-risk (joint kernel over g₂).

## LOCAL-INSTANCE FIX (W9 synth context — REQUIRED, recorded)
The O ℚ module-synth needs `attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ`
inside the namespace (the standard banked gather-module header, e.g. N225). Without it the
`AddCommMonoid (O ℚ)` instance fails fast — an instrument detail, NOT a route problem. With it,
EXIT 0.

## GO / NO-GO
GO if: the headline (all three su(2)_L generators commute with hyperOp) + contrast + nonzero
compile foundations-only [propext, Classical.choice, Quot.sound] in the production module. (Headline
+ contrast already de-risked GREEN in scratch; contrast is a banked citation.)
UNIQUENESS DECISION POINT: MEASURE the Z_{g2}(su2L)=0 obligation in a bounded scratch probe FIRST.
  - If it compiles clean and light (< KILL budget), INCLUDE `centralizer_su2L_eq_span_hyperOp` /
    `finrank = 1` as the uniqueness headline (the crown that makes the DIRECTION unique — the
    twin of N252's unique colour-fixed axis).
  - If it is genuinely heavy (joint-kernel over 14-dim g₂ needing a decide/coordinate bash), do
    NOT grind: bank headline+contrast+nonzero THIS node and CHILD a dedicated uniqueness node
    (W1 — never bypass, never shrink). A stalled uniqueness with a queued child is correct.

## KILL (per obligation)
- Any single obligation exceeding 120s / 400000 heartbeats OR needing maxHeartbeats (proof-kernel)
  raised above default → STOP, declare instrument failure, decompose or child (W9). The
  synthInstance bump is instance-search only (precedented), NOT a kernel raise — allowed.
- The uniqueness Z_{g2}=0 half is the ONLY expected KILL candidate → measure first, child if heavy.
- NO native_decide, NO coordinate bash of O ℚ products, NO scope reduction of the headline.

## STANDARD (to verify at wind-down)
UNBROKEN (all objects banked N225/N240/N202/N189/N254/N22; ground derived ℚ; O ℚ = CD (H ℚ); no
Mathlib number/algebra as content). COMPLETE (foundations-only, no sorry/axiom/native_decide).
WORDS-REMOVABLE (delete hypercharge/isospin/charge/gauge: "crossOp(κO 1) commutes with every element
of the derived 3-dim subalgebra {DI,DJ,DK} ⊂ g₂ whereas crossOp u1 does not; it is nonzero; it
generates the 1-dim centralizer of that subalgebra in so(7)" — pure math survives). FREE-FLOATING
check: every headline TYPE mentions the banked tower objects (hyperOp/crossOp/κO 1/imRep/DI/DJ/DK/ImO
on the derived O ℚ) — the concrete operators, NOT a carrier-agnostic construction.

## COSTUME (a WRONG reading forced through a banked witness)
Cid C286 (next free — MEMORY says C283 next but N252=C283, N253=C284, N254=C285; verify next-free
before writing). A WRONG reading — "hyperOp does NOT commute with all su(2)_L / the isospin-commuting
direction is not crossOp(κO 1) / the two U(1)s coincide" — forces a false numeric through the banked
nonzero witness (hyperOp ⟨u1⟩).c5 = −1. Pick RHS distinct from every prior right-hand value.

## PRODUCTION FILE
Phys/Algebra/TowerGatherForcedHyperchargeDirection.lean (grep-clean: hyperOp / forced_hypercharge /
TowerGatherForcedHypercharge have 0 hits in Phys/).
