# N252 PREREG — THE UNIQUE COLOUR-FIXED AXIS: `ImO^colour = span{u1}`

**Status:** SELECT complete (target chosen + justified, ticket rewritten). PREREG written. Paused
for MANAGER WATCH review before heavy execution (first run of the selection architecture).

## TARGET (magnitude theorem, TYPE mentions banked tower objects — no free-floating result)
`ImO_colour_invariants_eq_span_u1`: the subspace of the fundamental 7 (`ImO`) fixed by every
`imRep D` for `D ∈ colourCentralizer` equals the branching singlet `singlet = span{u1}`.
Joint-kernel form: `⨅ D ∈ colourCentralizer, LinearMap.ker (imRep D) = singlet` on `ImO`.

Teeth: `finrank ℚ (ImO^colour) = 1` (W8 — not 0: the singlet IS fixed by `colour_kills_sgl`;
not >1: the charged complement `Vsub = 3 ⊕ 3̄` carries no colour-fixed vector).

Duality corollary (the moat): with N251 FACE 3 `chargeStabilizer = colourCentralizer`, colour and
the charge axis `u1` MUTUALLY DETERMINE each other — colour = stabilizer of the line `L_{u1}`,
the line = the colour-fixed axis. The u(1) charge direction is FORCED, not a chosen embedding.

## WHY THIS NODE (theory-native — full reasoning in the ticket comment thread S1–S4)
Closes the FORCEDNESS gap N240 left latent (`u1` fed into the gather tear because the branching
"singles it out" — converse never proved). Breaks the N240–N250 characterization drift N251's
manager takeover explicitly named. Dissolves the field's hypercharge-embedding/normalization
choice: the colour-fixed subspace of the fundamental is exactly 1-dimensional.

## PROOF PLAN
- ⊇ `singlet ≤ ImO^colour`: banked `colour_kills_sgl` (N245: `imRep D sgl = 0` for `D ∈ colour`).
- ⊆ CRUX `ImO^colour ≤ singlet`: via banked `singlet_sup_Vsub_eq_ImO` + `singlet_disj_Vsub`
  (N42c), reduce to `Vsub` carries NO nonzero colour-fixed vector (`Vsub^colour = 0`). The
  `3 ⊕ 3̄` has no colour-invariant direction — the fundamental/antifundamental of su(3) are
  nontrivial irreducibles.
  Route A (decidable, preferred): the N234 integer-matrix machinery `imRep (DL k) = qI (dm k)`
  (k ∈ Fin 14). A vector fixed by all colour generators lies in the joint kernel of the colour
  subset of `{qI (dm k)}`; a `decide`d integer rank/kernel certificate pins it to the u1 line.
  Route B (structural): the banked colour rep on Vsub (N248) + no-trivial-subrep; if the `3`'s
  irreducibility is banked, `Vsub^colour = 0` follows directly.
- Teeth: `finrank_span_singleton u1_ne_zero = 1`.

## ROUTE FOUND (STEP 1 numeric probe — probe_kernel.py, bounded, done)
The crux COLLAPSES to exhibiting ONE regular colour element (the N28/N234 "exhibit an explicit
algebra element" instrument, W9-safe — no `decide`, no joint-kernel search). Numeric findings:
- `dm 0`, `dm 1`, `dm 2`, `dm 13` are all COLOUR (column-0 = 0 ⟺ kills `u1` ⟺ `∈ stab(u1) =
  colourCentralizer`); each has a 3-dim kernel individually.
- `Dreg := DL 0 + DL 13` (colour, col0=0) has `imRep Dreg = qI (add7 (dm 0) (dm 13)) = qI MH`
  with `ker (qI MH) = span{e0} = span{u1} = span{sgl}` EXACTLY (dim 1). The 6 imaginary rows of
  `MH` force `c2=c3=c4=c5=c6=c7=0` (a `linarith`-solvable 6×6 integer system), and `x∈ImO` gives
  `c0=0`, so `x = c1(x)•u1 = c1(x)•sgl ∈ span{sgl}`.
- coordinate convention: `u1` ↔ index-0 imaginary unit (`c1(u1)=1`, `c2..c7(u1)=0`); `qZ M z`
  output coord `i+1` = row-`i` · (c1..c7)(z), so col-0 of `M` = image of `u1`.

Proof shape (⊆ CRUX): `colourInvariants ≤ ker (imRep Dreg)` (Dreg is ONE colour term of the ⨅)
`= ker (qI MH) = span{sgl}`. ⊇: `colour_kills_sgl` (N245). Teeth: `finrank_span_singleton
sgl_ne_zero = 1`.

## W9 COMPILE-COST BUDGET + KILL
Only compute: the `qI MH` kernel coordinate solve (7×7 integer matrix, 6 linear equations — CHEAP,
no `decide`/`native_decide`, no maxHeartbeats raise). KILL: if any single coordinate `ext`/`simp`
obligation needs a heartbeat raise or >60s, DECOMPOSE the row-equations into separately-banked
`have`s. The route uses only `ext`/`simp [qZ, c_k]`/`linarith` — same family as banked `qI_comp`.
If (contra the probe) it fights, reframe via banked colour-rep structure; still hard ⟹ W1
dissolution child. NEVER shrink to "Vsub has some structure," NEVER bridge.

## COSTUME
C283 (next id), biting at the finrank-1 / span-u1 field (a wrong finrank value MUST fail to
compile).

## FILE
`Phys/Algebra/TowerGatherUniqueColourFixedAxis.lean`. Imports banked N245/N42c/N251/N234-qI
modules. USE banked lemmas, build nothing new. No Mathlib number/algebra as content. UNBROKEN —
extends the strand, never forks.

## STANDARD (applied at gate-green before complete)
UNBROKEN (every object derived back to the fold or banked); COMPLETE (foundations-only
`#print axioms ⊆ {propext, Classical.choice, Quot.sound}`, no sorry/axiom/native_decide);
PHYSICS-WORDS-REMOVABLE (delete colour/charge/hypercharge/gauge/su(3): the statement is
"the joint kernel of a derived Lie subalgebra's action on a derived module equals a fixed line,
dim 1" — no theorem STATEMENT needs a physics word).

## LOCK
Owner-authorized gather-side hypercharge front under the TEMPORARY PRIORITY LOCK. Gather-native.
⛔ The invariant-tower ASCENT method stays FORBIDDEN.
