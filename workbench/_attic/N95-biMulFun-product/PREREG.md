# N95 PREREG — A FINITE PRODUCT OF biMulFun GENERATORS: a 2-plane rotation in a NEW (imaginary) plane

FROZEN before compute. Node t_c527e543. Parent N94 (the concrete biMulFun half-turn).

## THE TARGET (ROADMAP §N95 priority (i), MEASURE-FIRST)
N94 banked the FIRST concrete biMulFun 2-plane half-turn `biMulFun u u` for a unit-imaginary `u`:
an INVOLUTION negating the plane `span{1,u}` (which CONTAINS the real axis), fixing the
anticommuting complement, ∈ genIsomMonoidC2. The forced forward structural step is the
**finite PRODUCT** of two such half-turns about two ANTICOMMUTING unit-imaginaries `u, w`:

    C := biMulFun w w ∘ biMulFun u u   (= biMulFun w w * biMulFun u u in Function.End STVC)

acting on the space component `v ↦ w·((u·(v·u))·w)`. Structurally (all derived from the N94
half-turn lemmas composed — NO coordinate grind):
  • C(1) = 1     — FIXES the real axis (each single half-turn NEGATES 1; the composite does NOT).
  • C(u) = −u    — negates u.
  • C(w) = −w    — negates w.
  • C(z) = z     — fixes every z anticommuting with BOTH u and w.
So C negates the PURELY-IMAGINARY plane `span{u,w}` and fixes 1 + the common complement — a
2-plane rotation in a plane NOT containing the real axis, a plane NEITHER single half-turn reaches.
And C ∈ genIsomMonoidC2 (product of two members, Submonoid.mul_mem). This is the structural
exhaustion step: generic 2-plane rotations (in imaginary planes) are reached as finite products.

## DERIVATION (unbroken, from the banked chain)
From N94 `LorentzContinuumSpin9Reach.lean`:
  biMulFun_imag_negates_one  (half-turn(0,0,1) = (0,0,−1))
  biMulFun_imag_negates_self (half-turn(0,0,u) = (0,0,−u))
  biMulFun_imag_fixes_anticomm (anticommuting w fixed)
  biMulFun_imag_mem_gen2     (each half-turn ∈ genIsomMonoidC2)
From N55 `LorentzContinuumSpin9.lean`: biMulFun, genIsomMonoidC2.
From N5b Alternative.lean: mul_flex, mul_mul_right (already used in N94 core).
Concrete e₂ + ιe₂ over Cut: e2_alt, e2_imag, e2_gFormC_self (banked);
ιe₂ unit-imaginary facts (prove: iotaE2 sq/alt/gFormC over Cut via L_sq_imag + Nrm) and the
e₂/ιe₂ anticommutation (already proved inline in N94 biMulFun_e2_fixes_j: `ext <;> simp [CD.e2,CD.iota]`).

## GO / NO-GO
GO if: the composite geometry lemmas (fixes 1, negates u, negates w, fixes common complement) +
membership ∈ genIsomMonoidC2 + the concrete e₂/ιe₂ realization compile foundations-only
[propext, Classical.choice, Quot.sound], the costume bites, gate D0–D6 green.
NO-GO / fall back to priority (ii) spectral-power path or (iii) connectedness W1 ticket if the
composite algebra does NOT dissolve cleanly through the N94 lemmas within KILL budget.

## KILL BUDGET (W9 — instrument-failure line)
Each obligation KILL = 180s. The N94 lemmas are pure rewrite chains (no grind); the composite is
4 short rewrite compositions + 1 Submonoid.mul_mem. If ANY single lemma exceeds 180s compile, that
is an INSTRUMENT failure (framing wrong) → reframe, do NOT inflate maxHeartbeats. Expected: each
lemma < 15s (rewrite-only, warm oleans). Total production build expected < 30s warm.
maxHeartbeats: DEFAULT (200000). If a proof needs more, it is the wrong proof — STOP.

## W8 COSTUME (next id C127) — MUST BITE
A WRONG composite claim: that the product of two half-turns NEGATES the real axis like a single
half-turn (i.e. C(1) = −1 instead of the genuine C(1) = 1), at the concrete e₂/ιe₂ realization.
The genuine real-axis-fixing reads a coordinate = 1; the wrong "negates" claim forces a false
numeric DISTINCT from C115 1=7 … C126 1=9. Target false numeric: e.g. 1 = 4 or 1 = 11 (pick one
distinct from every banked value once the concrete coordinate is computed). The WRONG file MUST
fail to compile (unsolved goals: <genuine> = <wrong>).

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/boost/rotation/half-turn/2-plane/plane/SO(9)/Spin/isometry/generator/Moufang/
bimultiplication/product/exhaustion/imaginary-plane/real-axis": what remains is the theorem that
over the derived complete ordered field Cut and the Cayley–Dickson double³ O Cut, for u,w with
u·u=w·w=−1, u·(u·v)=−v, w·(w·v)=−v, u·w=−(w·u): the map (t,x,v) ↦ (t,x, w·((u·(v·u))·w)) sends
1↦1, u↦−u, w↦−w, fixes every z with u·z=−(z·u) and w·z=−(z·w), and lies in genIsomMonoidC2. No
theorem STATEMENT needs a physics word.

## NEW FILE
Phys/Algebra/LorentzContinuumSpin9Product.lean (wire Phys.lean + Audits/AxiomAudit.lean import at
END of import list + #print axioms lines). Check name collisions before finalize.
