# N439 (arc-Q Q5) — THE RADIATION ARROW as the gather's irreversible cone-half selection

## TARGET
The electromagnetic (radiation) arrow — why causes precede effects in field propagation
(Wheeler–Feynman), distinct from G3's thermodynamic arrow — DERIVED as: the banked null cone
carries two halves; the banked J4 gather (N394, a many→one, phase-blind, IRREVERSIBLE
totalization) selects the OUTGOING half; the reverse (advanced = un-gather) does not exist
(non-injective) and, as the initial gap of the banked C6 eternal-approach flow, is never
recovered. Grade: MECHANISM, flagged.

## MODULE
`Phys/Quantum/RadiationArrow.lean`, ns `Phys.Quantum.Radiation`.

## BANKED OBJECTS USED (all cited, none re-proved)
- `StateFibre = Cut × Cut`, `eInward`,`eOutward`,`bornForm`, `eInward_ne_eOutward` (N391 PrimitiveFibre)
- `gatherIn`,`gatherOut`,`gatherIn_apply`,`gatherOut_apply`,`gather_resolves_unity`,`gatherIn_idem`,
  `gatherIn_gatherOut`,`gatherOut_gatherIn`,`wOut`,`wOut_eq`,`coherence`,`coherence_real_blind`,
  `coherence_diag` (N394 Measurement, the J4 gather)
- `coherenceGap`,`heat_death_never_reached`,`fixed_point_unreachable` (N383 CosmicFateEternalApproach, C6)

## KEY DECLS (measured clean in probe/probe2/probe3, all EXIT 0)
- nullForm/minkForm/lc + mink_eq_nullForm_lc + nullForm_zero_iff + minkForm_zero_iff (the (1,1) null cone, two halves = unit-slope rays t=±x)
- OutHalf/InHalf; radGather := gatherIn
- radGather_in_outHalf, radGather_null (SELECTION: image on the outgoing half, on the cone)
- radGather_kills_inHalf (gather kills the incoming half — banked gatherIn_gatherOut)
- two_halves_resolve (resolution of unity — banked gather_resolves_unity)
- radGather_not_injective (★★ no un-gather — non-injective)
- radGather_idem (repeatability)
- discardedWeight/discardedWeight_eq/discardedWeight_nonvacuous (the discarded incoming weight = wOut, W8 nonzero)
- radGather_discards_real_coherence (★★ cross fact: real-blind to a genuinely-nonzero coherence)
- radGather_lc, radGather_selects_outgoing_ray (★ the lightcone weld: any event → outgoing null generator t=x)
- discarded_weight_never_recovered, ungather_forbidden (★★ C6 tie: discarded weight never recovered)
- radiation_arrow (★★★ capstone)

## HOLLOW-AND BAN
The capstone is NOT a bare ∧ of "cone has two halves ∧ gather irreversible ∧ C6". The genuine
content is (a) the SELECTION (image=outgoing half via radGather_in_outHalf + kernel=incoming half
via radGather_kills_inHalf, with two_halves_resolve reconstructing the whole), (b) the WELD
(radGather ≡ banked gatherIn; radGather_lc sends any event to the outgoing null generator), and
(c) the never-co-stated cross fact (radGather_discards_real_coherence: forward gather discards a
genuinely-nonzero coherence) + the C6 tie (discarded_weight_never_recovered: the discarded weight,
as the C6 flow's initial gap, is strictly positive at every finite epoch — the un-gather is
forbidden).

## GUARDS
- G1 no asserted value (the selection DERIVED; no posited retarded boundary condition)
- G2 no empirical number (measured radiation/causality data = removable prose)
- G3 derived not posited (from banked gather irreversibility + C6, not "retarded BCs")
- G4 words-removable (delete radiation/retarded/advanced/cause/effect/arrow → an indefinite (1,1)
  form's two null rays; an idempotent non-injective many→one endomorphism projecting onto one and
  annihilating the other; the annihilated weight as the never-zero initial gap of a banked positive
  exponential flow)
- G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; derived Cut only, NO Mathlib-ℝ/ℂ as content
- W8 non-vacuity: next Cid = C464
- W4.5 exactly Q5

## COST BUDGET / KILL
Probes LIGHT (33–49s, simp/ring/banked-cites). KILL=90s per obligation. Production expected ~1 file, LIGHT.

## COSTUME
C464 `Counterexamples/RadiationArrowVacuityCostume.lean`, min 464 cFlag, bites 1 = 464, cFlag_forced
tied to radGather_in_outHalf ∧ radGather_kills_inHalf ∧ two_halves_resolve ∧ radGather_not_injective
∧ radGather_discards_real_coherence ∧ discarded_weight_never_recovered ∧ radGather_lc ∧ radiation_arrow.

## SUCCESSOR (ONE)
arc-Q Q6 (geodesic motion from the field equations, consumes P5) — SEED_OWED_FACES §Q6.
