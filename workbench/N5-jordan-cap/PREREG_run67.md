# PREREG — run 67, task t_2dec6051 (N5g pieceB: jdef(Hm, Xz) = 0)

## STATE INHERITED (runs 64-66, all timed out at 2700s WALL-CLOCK, but BANKED progress)
- Reduction.lean: jdef_master (spine), Dg + Dg_assocL/M/R (diagonal nuclear). BANKED, olean current.
- PieceA.lean: jdef_Hm_Dg : jdef (Hm…) (Dg…) = 0. BANKED, olean current. Plus the abstract
  framework: assoc, Gmat, gmat_eq_assoc, assoc_add1/2/3, gmat_drop_abstract, Hm_split, gmat_Hm,
  gxz_offdiag, diag_comm_offzero.
- Core.lean: jdef_Xz_core (zero-diag core =0, all six gens). bb1/bb2/bb3. BANKED.
- Linear.lean: jdef_add_right (defect additive in 2nd arg). BANKED.
- Build is clean no-op (183MB). Gate green at parent handoff (21/21 costumes, 190 thms).

## TARGET (unchanged, a THEOREM): jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0 over O ℚ.
Assembly: jdef(Hm,Hm) = jdef(Hm, Dg e) + jdef(Hm, Xz p q r)   [jdef_add_right, Hm₂ = Dg + Xz]
  pieceA jdef(Hm, Dg e) = 0   — BANKED (jdef_Hm_Dg).
  pieceB jdef(Hm, Xz p q r) = 0   — THIS RUN. The sole remaining piece.
Then jdef_H3 := the above; jordan_cap_pinned_at_three := ⟨jdef_H3, jordan_fails_H4⟩.

## MEASURED STRUCTURE OF pieceB (run 67, pieceB_central_decisive.py)
jdef(D+X, Y) − jdef(X, Y) with D entries REAL/CENTRAL, X,Y FREE nonassoc octonion, zero-diag
Hermitian: 16–24 monomials survive PER ENTRY. So pieceB GENUINELY needs octonion alternativity
on the X,Y entries; D-centrality/nuclearity ALONE is INSUFFICIENT (matches run-62 verdict).
EXACT-IDENTITY check: jdef(A,B) = (B·G_A − G_A·B) + Σ_{6 perms}[·,·,·](A,B,S), S=jb(A,A) — exact,
no nuclearity. With gmat_Hm (G_Hm = G_Xz, banked) the commutator part of the Dg-drop cancels,
leaving Σ-associators(Xz, B, ΔS_off) where ΔS_off = 2(Dg·Xz + Xz·Dg) — off-diagonal octonion
matrix associators = exactly the per-entry alternativity content. NO abstract shortcut exists.

## ROUTE (W9.4 structural; per-block, per-entry, commit-as-you-go W9.8)
pieceB via jdef_add_right on Xz p q r = Xz p00 + Xz 0q0 + Xz 00r (Xz_split, banked):
  jdef(Hm, Xz pqr) = jdef(Hm, Xz p00) + jdef(Hm, Xz 0q0) + jdef(Hm, Xz 00r).
Each block jdef(Hm, Xz <one gen>) = 0 proved PER ENTRY. Two candidate per-entry routes; MEASURE
first which is viable:
  (R-coord) unfold jdef jb Hm Xz; entrysimp; ext <;> cdsimp0 <;> ring — the bb1 route but with
    ocR on the diagonal. RISK: ocR coordinate expansion blowup (run-62 whnf wall). MEASURE on
    smallest entry FIRST.
  (R-struct) keep ocR OPAQUE; entrysimp leaves ocR e_i as atoms; close per entry by a
    linear_combination of ka-style associator-transport levers + ocR_comm/assoc rewrites + abel
    (the e22 pattern). Bespoke per entry.

## COST BUDGET / KILL (W9, frozen)
- KILL any single entry probe at 90s wall / 3.5GB RSS. If (R-coord) on the smallest entry
  exceeds KILL → (R-coord) is DEAD for pieceB, switch to (R-struct).
- Per file (block) own commit (PieceB1/PieceB2/PieceB3.lean), bank the instant it compiles.
- maxHeartbeats: do NOT exceed 4000000 (the bb1 ceiling — a correct coordinate entry needs no
  more). If an entry needs more, the route is wrong (W9 — instrument failure, reframe).
- WALL-CLOCK DISCIPLINE: this run has ≤2700s. 3 prior runs died at the wall banking nothing NEW.
  Reserve the last ~400s to DECOMPOSE: commit whatever blocks compiled, child the remainder with
  the measured route, link onto the tail, complete this task as "decomposed". NEVER run an
  unbounded compile inside the turn budget. NEVER end by running out of turns mid-compile.

## GO / NO-GO
GO if: a per-entry route closes the smallest pieceB entry within KILL, foundations-only.
NO-GO (decompose) if: both routes exceed KILL on the smallest entry → this is a W1 dissolution
  ticket (creative theory-native attack on the off-diagonal associator sum), childed; do NOT
  grind. Bank the exact-identity spine + framework regardless (cheap, reusable, advances chain).

## COSTUME (anti-vacuity, required at DONE)
Full-H3 wrong-cap costume: a general defect-entry coordinate asserted ≠ its true value → false
core (guards jdef_H3 itself, beyond the C20/C21 base/block costumes). 1 row in costume_manifest.tsv.
