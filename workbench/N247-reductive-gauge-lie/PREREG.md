# N247 PREREG — THE REDUCTIVE GAUGE LIE ALGEBRA u(1) ⊕ su(3) AS ONE LIE SUBALGEBRA OF so(7)

FROZEN before production compute. Gather-side, owner-authorized hypercharge front, under the
TEMPORARY PRIORITY LOCK. NOT the parked J₃(O) invariant-tower ascent.

## THE TARGET (ONE, no menu)
N246 banked chargeLine (dim 1) and colourImg (dim 8) as COMPLEMENTARY SUBMODULE summands of the
concrete so(7) = 14 ⊕ 7, meeting only in ⊥, forming a dim-9 direct sum, with the two factors
element-wise `Commute` (N245). N247 PROMOTES that submodule direct sum to the genuine
LIE-ALGEBRA structure it forces: the joint `chargeLine ⊔ colourImg` is a LIE SUBALGEBRA of so(7),
with the u(1) charge line a CENTRAL Lie ideal and colour su(3) a Lie subalgebra — the reductive
gauge algebra u(1) ⊕ su(3) as ONE Lie object inside the single so(7) the gather tear produces.

Production file: `Phys/Algebra/TowerGatherReductiveGaugeLie.lean`.

Headline decls (magnitude theorems; TYPE mentions banked tower objects chargeOp/chargeLine/
colourImg/imRep/imRepL/colourCentralizer/bornBil/crossEmb — UNBROKEN, not carrier-agnostic):
1. `chargeOp_lie_colourImg_eq_zero` : ∀ y ∈ colourImg, ⁅chargeOp, y⁆ = 0 (u(1) commutes with su(3)
   at the Lie-bracket level — the Commute recast into the End Lie bracket; extends N245 from the
   `Commute` predicate to the ⁅·,·⁆ = 0 Lie statement across the WHOLE colour submodule).
2. `colourImg_lie_closed` : x,y ∈ colourImg → ⁅x,y⁆ ∈ colourImg (colour su(3) is BRACKET-CLOSED —
   via LieHom.map_lie imRep + colourCentralizer.lie_mem; N246 never bracketed).
3. `joint_lie_mem` : x,y ∈ chargeLine ⊔ colourImg → ⁅x,y⁆ ∈ chargeLine ⊔ colourImg (the joint is
   bracket-closed — the four-term expansion collapses: three terms vanish by u(1) centrality, the
   last lands in colourImg).
4. `chargeColourLie : LieSubalgebra ℚ (Module.End ℚ ImO)` with toSubmodule = chargeLine ⊔ colourImg
   (THE OBJECT — the reductive gauge Lie algebra) + `chargeColourLie_le_so7`
   (≤ skewAdjointLieSubalgebra bornBil — it lives inside so(7)).
5. `chargeColourLie_finrank` : finrank ℚ chargeColourLie.toSubmodule = 9 (= N246 sup, transported
   to the NEW Lie object — W8 anchor).
6. `chargeLine_lie_joint_eq_zero` : ∀ x ∈ chargeLine, ∀ y ∈ chargeColourLie, ⁅x,y⁆ = 0 (the u(1)
   charge line is CENTRAL in the joint — a genuine central Lie ideal).
7. `joint_derived_le_colourImg` : ⁅x,y⁆ ∈ colourImg for x,y ∈ joint (THE DERIVED SUBALGEBRA lands
   in colour — the abelian u(1) is LOST under bracketing; the semisimple part is colour su(3)).
8. Capstone `reductive_gauge_lie_structure` bundling: LieSubalgebra + ≤ so(7) + finrank 9 +
   u(1) central + derived ⊆ colour + colourImg lie-closed + chargeOp ∉ range imRepL (N246 crux).

## W8 NON-VACUITY (teeth — a wrong reading MUST fail to compile)
- Costume C278: anchor on `min 278 (finrank ℚ chargeColourLie.toSubmodule) = 9`; the BOGUS `= 278`
  reduces to `9 = 278` (false). Bites: the reductive gauge Lie algebra is genuinely 9-dim, NOT
  collapsed (not 1 = colour absorbed, not 8 = charge absorbed).
- In-file teeth: `chargeOp_not_central_in_so7` — the charge is NOT central in ALL of so(7):
  ⁅imRep DJ, chargeOp⁆ ≠ 0 (banked `chargeOp_stabilizer_proper` N240 / N245 `chargeOp_commute_proper`).
  The centrality is PROPER (u(1) central in the joint u(1)⊕su(3), NOT in so(7)) — a garbage claim
  "chargeOp central in so(7)" / "everything commutes" fails.

## GO / NO-GO
GO iff: (a) `Module.End ℚ ImO` LieAlgebra ℚ instance + `⁅·,·⁆` = Ring.lie_def in scope [YES:
so(7) = skewAdjointLieSubalgebra bornBil is a LieSubalgebra of it, N223]; (b) Commute → bracket-0
step goes through [Ring.lie_def + Commute.eq]; (c) LieHom.map_lie imRep bridges colourImg closure
[N225 precedent line]; (d) LieSubalgebra constructor from a submodule + lie_mem' accepted.
NO-GO / reframe (W5): if the four-term collapse needs coordinate bash, STOP — every step must be a
banked submodule/commute/LieHom fact, THE ONE LAW. If LieSubalgebra packaging fights, NAME the
missing Mathlib API and child a route-finding node (still gather-side).

## KILL CLASSES (W9 instrument-wall tripwires — declare instrument failure, do NOT grind)
- K1: any single tactic > 60s net-of-import, or whole-probe net-of-import > 90s → decompose.
- K2: any `ring`/`decide`/`simp` over expanded O-ℚ coordinates (degree blowup) → forbidden here;
  reframe through banked facts. The proof is PURE Lie-bracket bookkeeping — NO coordinate expansion.
- K3: maxHeartbeats raise above default → instrument-wall signal, STOP.
- K4: ≥2 runs banking nothing → W1 dissolution ticket, not another grind.

## COMPILE-COST BUDGET
Imports ~30–45s (N246 chain → N225). Net-of-import target ≤ 90s for the whole module (N246 was
~18s net). Every lever is a banked submodule / Commute / LieHom fact; heaviest is the four-term
sup-decomposition bookkeeping in joint_lie_mem. Probe the LieSubalgebra construction + the
four-term collapse FIRST (riskiest); if net > budget, decompose joint_lie_mem into named sub-lemmas.

## STANDARD / RAILS
- UNBROKEN: imports only banked N246 (+ its chain) + Mathlib Lie machinery (LieSubalgebra,
  LieHom.map_lie, Ring.lie_def, Submodule.mem_sup). Ground = derived ℚ. No ℚ[i], no Algebra ℚ
  (Dbl ℚ), no TensorProduct — COMPLEX FIELD METALANGUAGE only.
- PHYSICS-WORDS-REMOVABLE: delete charge/colour/su(3)/u(1)/gauge/central/reductive → pure statement
  (span{crossOp u1} ⊔ (colourCentralizer).map imRepL is a Lie subalgebra of the skew-adjoints of
  bornBil, with span{crossOp u1} a central ideal, dim 9). No STATEMENT needs a physics word.
- W4.5 SUFFICIENCY: NOT a re-pin — N246 gave submodules + element-Commute; N247 gives the LIE
  SUBALGEBRA object + Lie-bracket centrality + derived subalgebra ⊆ colour. New structure the chain
  lacks (advances ★1: the gauge algebra as ONE derived Lie object). finrank 9 is transported to the
  NEW Lie object; the genuinely-new content is the Lie-algebra structure & centrality.
- Advances ★1 (the internal symmetry as one derived object — now the reductive Lie algebra u(1)⊕su(3)).
