# N241 — PREREG (frozen BEFORE production compute)

## The node (owner-authorized gather-side hypercharge front, under the LOCK)
THE FORCED CHARGE SPLITTING of the two triplets `3 = Uhol` vs `3̄ = Uah` (N42c): derive HOW the
banked gather-obstruction charge operator `chargeOp = crossOp u1` (N240) grades the two triplets
— the opposite-eigenvalue / particle–antiparticle structure — FROM the gather object on the
banked branching. Owner authorization 2026-07-01 (ROADMAP §TEMPORARY PRIORITY LOCK): gauge-looking
results reached FROM THE GATHER OBJECT are welcome, INCLUDING hypercharge; the still-forbidden
thing is the invariant-tower ASCENT METHOD (parked N218 J₃(O) trace-form route) — NOT resumed here.

## THE FRONT (chosen autonomously; ONE target, no menu)
N240 banked `chargeOp := crossOp u1 ∈ so(7)`, the gather tear on the branching's distinguished
singlet `u1`, with `chargeOp²(y) = ⟨u1,y⟩•u1 − y` (a complex structure on the complement
`V = 3 ⊕ 3̄`, 0 on the singlet). N42c banked the branching lever `JO = L_{u1}` (`JO x = u1·x`),
proving it SWAPS the two triplets (`Uhol.map JO ≤ Uah`, `Uah.map JO ≤ Uhol`, `JO² = −id`).

THE NEW JOINT (the deliverable): the gather tear `crossOp u1` and the branching lever `JO`
COINCIDE on the branching complement `V`. Because
  `octCross u1 y = u1·y + ⟨u1,y⟩•1 = JO y + ⟨u1,y⟩•1`,
and every `y ∈ V` is Born-orthogonal to `u1` (`⟨u1,y⟩ = 0` on V), the correction term vanishes:
  ★ `crossOpO u1 v = JO v` for all `v ∈ Vsub`   (THE CRUX).
Therefore the GATHER-OBSTRUCTION charge operator INHERITS the branching lever's `3 ↔ 3̄` swap —
the opposite-charge / particle–antiparticle structure is realized INSIDE the gather `so(7)`, not
merely on the whole algebra. This CONNECTS N240 (gather charge operator) to N42c (branching swap):
one cause (`u1` as both the gather-tear input AND the left-mult complex structure), one map on V.

## WHAT I WILL PROVE (magnitude theorem; TYPE mentions banked tower objects)
File `Phys/Algebra/TowerGatherForcedChargeSplitting.lean`, over derived ℚ, `O ℚ = CD (H ℚ)`,
`ImO`, `crossOpO`/`crossOp`/`chargeOp`/`u1` (N223/N240), `JO`/`Uhol`/`Uah`/`Vsub` (N42c):

1. `gForm_u1_eKO` for K = 3,4,5,6,7 (`gForm u1 e2O = 0` is banked `gForm_u1_u2` since `u2 = e2O`):
   the singlet axis `u1` is Born-orthogonal to each generator of the complement. Coordinate simp
   (same pattern as `gForm_u1_u2`).
2. `gForm_u1_vanish_Vsub : ∀ v ∈ Vsub, gForm u1 v = 0` — u1 ⟂ V, by span_induction + bilinearity.
3. ★ `crossOpO_u1_eq_JO_on_Vsub : ∀ v ∈ Vsub, crossOpO u1 v = JO v` — THE CRUX (coincidence).
   `octCross u1 v = u1·v + ⟨u1,v⟩•1`, `⟨u1,v⟩ = 0` on V, `u1·v = JO v`.
4. `chargeOp_coe_eq_JO_on_Vsub : ∀ y : ImO, (y:O ℚ) ∈ Vsub → ((chargeOp y : ImO):O ℚ) = JO (y:O ℚ)`
   — the subtype-native form tying `chargeOp` (N240) to `JO` on V.
5. ★★ `Uhol_map_crossOpO_eq_Uah : Uhol.map (crossOpO u1) = Uah` and
   `Uah_map_crossOpO_eq_Uhol : Uah.map (crossOpO u1) = Uhol` — the gather charge operator maps each
   triplet ONTO the other (EQUALITY, sharper than N42c's ≤). Via coincidence on Vsub ⊇ Uhol,Uah,
   the banked JO swap ≤, and JO² = −id upgrading ≤ to =.
6. ★★★ `chargeOp_swaps_triplets` / capstone `forced_charge_splitting_structure`: the FORCED
   opposite-charge structure — `crossOpO u1` (a) coincides with `JO` on `V`, (b) maps `Uhol` onto
   `Uah` and `Uah` onto `Uhol` (the two triplets are exchanged, never fixed:
   `Uhol.map (crossOpO u1) ⊓ Uhol = ⊥`), (c) squares to `−id` on `V`. A conjugate pair under the
   charge complex structure: the two triplets occupy the `±i` eigen-directions of `chargeOp|_V`
   (opposite charge), the particle/antiparticle split — DERIVED from the gather obstruction.

## GO / NO-GO
- GO iff the CRUX (3) compiles cheaply in a bounded probe (pointwise, no coordinate bash on End).
- NO-GO / reframe (W5): if the coincidence does NOT hold (correction term nonzero on some v ∈ V),
  the framing is wrong — STOP, return to trunk, do NOT weaken to "a splitting exists".
- If a not-yet-banked gather-structure fact is needed: NAME it, child a route-finding node that
  STILL derives FROM THE GATHER OBJECT; do NOT fall back to the ascent method.

## KILL CLASSES (W9 instrument budget)
- KILL if any single obligation needs `maxHeartbeats` above default (200000) — reframe/decompose.
- KILL if the compile arena drifts to `End ℚ (End ℚ ImO)` / 2401-dim (the ascent method) — STOP.
- Arena: `O ℚ` (dim 8) / `ImO` (dim 7) / the banked submodules `Uhol`/`Uah`/`Vsub` / pointwise
  banked identities. Probe budget: crux must measure < 30s standalone.

## STANDARD gate (necessary AND the second gate)
- UNBROKEN: every object from N240/N42c/N223/N206/N24 or standard Mathlib; nothing posited.
- COMPLETE: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; no sorry/axiom/native_decide.
- WORDS-REMOVABLE: delete charge/hypercharge/triplet/antitriplet/particle/antiparticle/colour —
  the statements stand as pure math about `crossOpO u1`, `JO`, `Uhol`, `Uah`, `Vsub`.
- Costume next id C272. Gate via scripts/gate-fast.sh (background, non-blocking poll).
