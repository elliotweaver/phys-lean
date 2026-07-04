# N295 — PREREG (SELECT + execute)

## DECISION (fresh-context SELECT, anti-bullshit gate passed IN FULL — comments 221/222)
**N295 — THE SPECTRUM-MOVING SECTOR BEYOND f₄: the traceless Jordan left-multiplications
L₀(J) MOVE the identity that every derivation fixes (the first rung of the reduced
structure algebra e₆ ⊃ f₄).**

REDIRECT off the handed-forward lateral rigidity (Z_{f4}(flavour)=colour, a commutant
characterization INSIDE the spectrum-preserving f₄). The REPEATED-DEFERRAL SIGNAL is loud:
★2 (mixing) / ★5 (mass texture) route-not-yet-found ~10 nodes, ALWAYS blocked by the SAME
proved ceiling — N269: all of f₄ preserves the arena's spectrum (cubic norm jN); N275: "the
★5 texture PROVED un-forceable from the arena." Per SOUL REPEATED-DEFERRAL: NAME the ceiling,
CHILD the ASCENT to the richer (spectrum-MOVING) structure, derived FORWARD from banked
objects — NOT posited.

THE STRUCTURE (theory-native, forced, MEASURED exact): the Jordan LEFT-MULTIPLICATION
`Lmul A X = jb A X` (banked N274) is the fold's own multiplication act. For A ≠ 0 it MOVES
the identity: `Lmul A 1 = A + A ≠ 0`. Every derivation `T ∈ derH3 = f₄` (N285/286) instead
KILLS the identity (`T 1 = 0`, forced by the Leibniz law at (1,1): T(jb 1 1)=T(2•1)=2•T1 must
equal jb(T1)1+jb 1(T1)=4•T1 ⟹ 2•T1=0 ⟹ T1=0). So the traceless left-mults L₀ are the
spectrum-MOVERS strictly outside the spectrum-PRESERVING f₄. Their brackets close BACK into
f₄ (`[Lmul A,Lmul B]=innerMul A B ∈ derH3`, banked N286), so {f₄ ∪ L₀} closes to a single
larger derived algebra — dim 78 = 52 + 26 = e₆ (the reduced structure algebra), MEASURED EXACT.

## MEASUREMENTS (workbench/N295/probe1,2,3.py exact-Fraction octonion + numpy, all EXIT 0)
- dim f₄ = Der(J₃(O)) = 52 (revalidated); jN(0,0,0,1,1,1)=2 (N269 W8 revalidated).
- CEILING: max|d jTr|, |d jS|, |d jN| over f₄ basis = 5e-15/5e-10/4e-9 ≈ 0 — f₄ preserves the WHOLE spectrum.
- Lmul A 1 = A: ‖L_A(Id)−A‖ = 0.0 (T3); max‖D(Id)‖ over f₄ = 6.8e-16 (T4, every derivation kills the identity).
- L₀ MOVES the spectrum: max|d jTr| = 2–4, |d jS| = 6–20 for traceless left-mults (contrast f₄'s ~0).
- Splitting the degenerate point: t·Lmul(Dg 1 −1 0) on 1 sends eigs {1,1,1}→{1−t,1,1+t} (jTr, jN fixed; jS moves) — a pure spectrum-SPLIT with fixed trace+determinant, the mass-texture generator.
- CLOSURE: [Lmul A,Lmul B] projected off f₄ residual 1.9e-15 (T5) — closes into f₄ (=innerMul, N286).
- ASCENT: dim span{f₄ ∪ L₀} = 78 = 52+26 EXACT (T6) — the reduced structure algebra e₆.
- Born tie: jTr(Lmul A applied to A) = jTr(A∘A) = tr(A²) = 2 (T2, > 0) — the motion's size = the positive-definite trace form (N270).

## DE-RISK (workbench/N295/ProbeN295.lean, `$LAKE env lean`, EXIT 0 foundations-only)
P1 `Lmul A 1 = A + A` (mul_one/one_mul); P2 concrete slotA-witness shape; P3 derH3 Leibniz
accessible on Hermitian args (hT.2); P4 `innerMul A B ∈ derH3` (innerMul_mem_derH3, N286);
P5 `0 ≤ jQ (Hm …)` (jQ_Hm_nonneg, N270). All compile.

## SCOPE (banked-lever, W9-free, forward, non-vacuous)
BANK (Phys/Algebra/OctonionJordanSpectrumMovingSector.lean, ns Phys.Algebra.HJ):
1. `Lmul_one` — `Lmul A 1 = A + A` (the identity-motion law; left-mult moves the unit).
2. `derH3_kills_one` — `∀ T ∈ derH3, T 1 = 0` (the spectrum-preserving signature of f₄:
   every derivation fixes the identity, hence the maximally-degenerate spectral point).
   Proof: hT.2 1 1 (conjTranspose_one) gives T(jb 1 1)=jb(T1)1+jb 1(T1); jb 1 1 = 2•1,
   both jb(·)1 and jb 1(·) double, so 2•T1 = 4•T1 ⟹ T1 = 0 (ℚ char 0).
3. `Lmul_moves_one_ne` — for the concrete Hermitian witness A = slotA 1, `Lmul A 1 ≠ 0`
   (via the (0,1)-entry certificate: (slotA 1 + slotA 1) 0 1 = 2 ≠ 0).
4. `Lmul_notMem_derH3` — the spectrum-mover is genuinely OUTSIDE f₄: `Lmul (slotA 1) ∉ derH3`
   (from 2 + 3: if it were in derH3 it would kill 1, contradicting Lmul(slotA 1)1 ≠ 0).
5. `innerMul_closes_into_derH3` (re-exposed N286) — `[Lmul A,Lmul B]=innerMul A B ∈ derH3`
   for Hermitian A,B: the spectrum-movers' brackets ARE the spectrum-preservers ([L₀,L₀]⊆f₄).
6. `spectrum_motion_positive` (Born tie) — `reQ (jTraceForm A A) = 2 * jQ A` with `0 ≤ jQ (Hm…)`
   (N270 re-exposed): the size of the L_A spectrum-motion = the fold's positive-definite trace form.
7. capstone `spectrum_moving_sector_member` — bundles: Lmul-one-motion ∧ derH3-kills-one ∧
   Lmul(slotA 1)∉derH3 ∧ innerMul-closure ∧ Born-positivity ∧ jordan_fails_H4 in the TYPE.

CHILD (the ONE successor, a directed route-finder): the full e₆ = f₄ ⊕ L₀ dim-78 reduced
structure algebra as a bundled LieSubalgebra (needs the 78-dim span handle) + its action on
the spectrum (the jTr/jS grading = the mass-texture module). The FIRST spectrum-mover does
not need the 78-dim handle; the closed algebra does.

NOT banked: the full 78-dim e₆ closure (childed); the ★5 mass texture VALUE (route-not-yet-
found — the e₆ climb is the named ascent toward it); the ★2 mixing VALUE (route-not-yet-found);
"= physical Yukawa/mass sector" (removable prose); Z_{f4}(flavour)=colour rigidity (the handed
target — DEFERRED as lateral; can be optional hardening later).

## COSTUME
Next BID C324. Bites at the identity-motion non-triviality: e.g.
`((Lmul (slotA (1:O ℚ)) 1) 0 1).re.re.re = 2` (via Lmul_one; a WRONG reading — the spectrum-mover
kills the identity like a derivation / Lmul ⊆ f₄ / there is no structure beyond f₄ — reduces to
`2 = 324` or the min-packaged false numeric). Pair fresh, RHS 324 distinct from every prior.

## FILE
Phys/Algebra/OctonionJordanSpectrumMovingSector.lean (ns Phys.Algebra.HJ)
