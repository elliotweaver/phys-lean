# N245 PREREG — THE FORCED COMMUTING SU(3)×U(1) STRUCTURE ON THE FUNDAMENTAL 7

## Front (self-authored, worker-body STEP 5; ONE target, no menu)
Combine N240 (`chargeOp_stabilizer_iff`: the g₂-stabilizer of the charge operator is EXACTLY
colour `su(3) = colourCentralizer`) with N244 (the explicit eigenspace decomposition
`ImO = ker chargeOp ⊕ complement = 1 ⊕ (3⊕3̄)`) into the NEXT forced gather-native joint:

**COLOUR su(3) COMMUTES WITH THE U(1) CHARGE OPERATOR, HENCE PRESERVES ITS EIGENSPACE
DECOMPOSITION AND ANNIHILATES THE CHARGE-0 SINGLET.** The abelian charge factor and the
non-abelian colour factor commute on the fundamental 7 (the SU(3)×U(1) commuting-gauge
structure): colour maps the 0-eigenspace (the neutral singlet) and the charged complement
(`range chargeOp`, dim 6) each into itself, and acts as `0` on the singlet — the "1" is a
colour singlet AND a charge singlet (doubly neutral), the complement a colour-invariant
6-space. DERIVED from the gather obstruction, not posited.

This is genuinely FORWARD (not a re-pin of N240–N244): N40c/N240/N244 never connect the
DERIVATION action `imRep D` on the eigenspaces to the charge operator's grading. The commuting
structure + eigenspace preservation + doubly-neutral singlet is new content.

## Arena (W9): `chargeOp`/`imRep`/`colourCentralizer`/`ImO`(dim 7)/`sgl` — the ImO level ONLY.
NOT the two-level End-of-End space; NOT crossOpO/Vsub-in-`O ℚ` (that is the N242 layer; stay
in `ImO` to avoid the ascent-drift). `Vsub`/`crossOpV` used only if a coe lands cleanly.

## Levers (all banked)
- N240 `chargeOp_stabilizer_iff (D) : ⁅imRep D, chargeOp⁆ = 0 ↔ D ∈ colourCentralizer`.
- N201 `mem_colourCentralizer` / `commutes_JO_iff` : `D ∈ colour ↔ D u1 = 0`.
- N22 `imRep_coe (D) (x) : (imRep D x : O ℚ) = D (x : O ℚ)`; `sgl = ⟨u1, u1_mem_ImO⟩`.
- N244 `chargeOp_ker : ker chargeOp = span{sgl}`; `finrank_ker_chargeOp = 1`.
- Mathlib: `Ring.lie_def`/`sub_eq_zero` (⁅a,b⁆=0 ↔ Commute), `LinearMap.finrank_range_add_finrank_ker`,
  range/comp map machinery.

## Targets (ONE node; capstone bundles)
1. `colour_commute_chargeOp (D) (hD : D ∈ colourCentralizer) : Commute (imRep D) chargeOp`  — the headline.
2. `colour_kills_sgl (D) (hD) : imRep D sgl = 0`  — colour annihilates the neutral singlet.
3. `colour_mapsTo_ker_chargeOp (D) (hD) : Set.MapsTo (imRep D) ↑(ker chargeOp) ↑(ker chargeOp)`.
4. `colour_mapsTo_range_chargeOp (D) (hD) : Set.MapsTo (imRep D) ↑(range chargeOp) ↑(range chargeOp)`.
5. `finrank_range_chargeOp : finrank ℚ (range chargeOp) = 6`  — W8: charged complement is exactly 6-dim (3+3̄).
6. `range_chargeOp_ne_bot` (nontrivial) / capstone `forced_colour_charge_commuting_structure`.

## GO / NO-GO
- GO iff probe0 (targets 1–4) elaborates EXIT 0 net-of-import ≤ ~30s and target 5 (rank-nullity) closes.
- NO-GO / reframe (W5) if: any target needs skew-adjointness of D not banked; if range chargeOp
  ≠ complement forces a coordinate bash; if the ℚ[i] ground creeps in. Then NAME the missing fact
  and child a gather-side route-finding node — do NOT posit, do NOT weaken.

## KILL classes (W9)
- KILL-A: any single obligation > 90s net-of-import → decompose or reframe (instrument wall).
- KILL-B: a `ring`/`decide`/`simp` over expanded `O ℚ` coordinates for the commute/map → STOP,
  the structural route (Commute → comp/range map) is being skipped.
- KILL-C: needing `Algebra ℚ (Dbl ℚ)` / `TensorProduct` / `ℚ[i]` as ground → reframe (drift).

## Compile-cost budget
Imports ~26s baseline. Net-of-import target ≤ 30s for the whole module. Production whole-module
olean ≤ ~25s expected. NO maxHeartbeats raise. If a single lemma needs > 90s, KILL and decompose.

## Recon-with-teeth
Costume C276: the load-bearing NEW quantity is `finrank ℚ (range chargeOp) = 6` (the charged
complement dimension). Bogus `min 276 (finrank ℚ (range chargeOp)) = 276` must reduce to `6 = 276`
and FAIL to compile. (6 distinct from prior RHS values; anchors the N245 charged-complement dim.)

## Next-node (decide at end, single-flight tail, max_retries=25).
