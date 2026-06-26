# N62 PREREG — frozen GO/NO-GO + KILL (before compute)

## Node
N62 — the next forced node after N61's 2-block (non-scalar) operator square root
(`blockDiag_op_sqrt`). The ticket TARGET is the FULL SPECTRAL operator square root over a
general non-block-diagonal `g*g` → global reverse KAK surjectivity + full Spin(9)→SO(9)
exhaustion. Per the ROADMAP §N62 FORWARD FRONTIER MEASURE-FIRST priority (i), the
immediately-bankable structural piece is: extend N61's 2-block (which kept the whole 8-dim
octonion block `v` as ONE eigenblock) by DIAGONALIZING **WITHIN** the octonion block — the
first diagonalization inside `O Cut`.

## The W1 reframe (THE ONE LAW) + W4.5 sufficiency
- W4.5 GUARD: a 3-block operator that merely separates `t` from `x` (both still scalar on
  the time/x plane in N61) would be re-pinning the SAME pattern. The genuinely-NEW content
  is diagonalizing INSIDE the octonion `O Cut = CD (H Cut)` for the FIRST time — N61 never
  touched the internal structure of the octonion block.
- THE REFRAME: `O Cut = CD (H Cut)`, so `v = ⟨v.re, v.im⟩` with `v.re, v.im : H Cut`. The
  Cayley–Dickson re/im halves are EvC-ORTHOGONAL under the Born self-overlap (the reQC
  unfolding splits `gFormC v w` into a re-half term + an im-half term, no cross terms). So
  the recursive 2-block operator on the octonion `octBlock b₁ b₂ : v ↦ ⟨b₁ • v.re, b₂ • v.im⟩`
  is EvC-self-adjoint and diagonal in this banked re/im splitting; its positive operator
  square root is the SCALAR `cutSqrt` applied half-by-half: `cutSqrt b₁` on `v.re`,
  `cutSqrt b₂` on `v.im`. Lifted to STVC: `coordDiag3 a b₁ b₂ : (t,x,v) ↦ (a•t, a•x, octBlock b₁ b₂ v)`,
  a genuine 3-distinct-eigenvalue diagonal operator (vs N61's 2). NO Mathlib spectral theory;
  the spectral root WITHIN the octonion dissolves into the scalar `cutSqrt` per re/im half.

## GO / NO-GO (frozen)
- GO if: (a) the re/im split `gFormC v w = (v.re * star w.re).re.re + (star w.im * v.im).re.re`
  (or an equivalent bilinear split with NO cross terms) compiles cheaply (same simp+ring
  engine as the banked `gFormC_sumOfSquares`); AND (b) `octBlock b₁ b₂` is a Cut-linear map
  whose EvC-self-adjointness, composition, positivity, and square root all reduce to the
  banked `cutSqrt` (N57) + the bilinear split + `gFormC_nonneg` (N56). Target decls:
  `octBlock`, `octBlock_apply`, `octBlock_scalar` (octBlock c c = c•·, the scalar collapse),
  `octBlock_comp`, `octBlock_isEvCSymm` (or via coordDiag3), `coordDiag3`,
  `coordDiag3_isEvCSymm`, `coordDiag3_comp`, `coordDiag3_nonneg`, `coordDiag3_op_sqrt` (THE
  HEART), `coordDiag3_op_sqrt_unique`, witnesses.
- NO-GO / DECOMPOSE if: the re/im split or the H-layer bilinearity needs heavy new octonion
  infrastructure (an H-form, projection linear maps) that does not reduce to banked facts in
  ≤ a couple of clean lemmas. Then bank whatever cleanly compiles + child the remainder.
- The FULL spectral root over an ARBITRARY (non-coordinate-diagonal) `g*g` — needing the
  change-of-basis / simultaneous diagonalization of an arbitrary EvC-self-adjoint operator
  over `Cut` with no Mathlib spectral theory — is the GENUINE HEAVY sub-node and is an honest
  W1 dissolution child regardless (NOT closed here).

## KILL (instrument-failure budget, W9)
- KILL = 60s for any single obligation's compile (the N57–N61 engine ran ≤9s; anything
  approaching 60s is an INSTRUMENT signal, not a theory signal — STOP, decompose, do NOT
  inflate maxHeartbeats, do NOT throw a monolithic brute at expanded coordinates).
- If the polarized re/im split needs a giant `simp ... ; ring` over fully-expanded nested
  CD/Dbl coordinates and that single tactic approaches KILL: that is the W9 wall → measure
  the smallest piece, decompose, prefer the banked bilinear gFormC API (gFormC_smul_left/right,
  gFormC_add_*, gFormC_symm) over coordinate expansion.
- maxHeartbeats: NEVER inflated. native_decide: NEVER. sorry: NEVER.

## Costume (W8, next id C93)
Must bite a WRONG octonion-internal-diagonal / coordinate-diagonal square-root claim, reducing
to a false numeric DISTINCT from the banked battery (C84 8=4, C85 0=2, C86 27=9, C87 10=8,
C88 9=4, C89 50=0, C90 1=-1, C91 25=7, C92 9=10). Plan: a wrong octBlock/coordDiag3 root —
e.g. `octBlock 2 3` (or coordDiag3) claimed an operator square root of a target whose im-half
eigenvalue is NOT 9 → forces e.g. `9 = 11` or similar fresh false numeric.

## Physics-words-removable
Delete "Lorentz/boost/rotation/Spin/SO(9)/spectral/eigenspace/eigenvalue/diagonal/block/
Cartan/polar/KAK/square-root/self-adjoint/isometry" → must stand as pure math about the banked
gFormC/EvC/cutSqrt/IsEvCOpSqrt + the derived ℝ Cut + the terminal algebra O Cut = CD(H Cut).

## Bank-as-you-go + anti-timeout
Production file: `Phys/Algebra/LorentzContinuumOpSqrtCoord.lean`. The instant the core compiles
clean → move to production, wire (Phys.lean + AxiomAudit.lean import AT END + #print axioms),
commit BEFORE chasing extras. Run gate D0–D6 in BACKGROUND. Checkpoint at ~50% turns.
