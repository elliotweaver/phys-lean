# N85 PREREG — THE FULL n-DIM SPECTRAL EXISTENCE `∀ g, ∃ c u, g = specOpN c u`

Frozen BEFORE compute (W9). Over the derived ℝ `Cut` + terminal algebra `O Cut` + banked N49–N84.

## TARGET
`∀ (g : Module.End Cut STVC), IsEvCSymm g → ∃ (n : ℕ) (l : Fin n → Cut) (u : Fin n → STVC),
   (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧ g = specOpN l u`

i.e. every EvC-self-adjoint operator on STVC has an EvC-orthonormal eigenbasis, so equals `specOpN l u`.

## THE REFRAME (W1) — reconstruction dissolves
`deflateC h μ u = h - μ • projC u`. So `g = specOpN l u` ⟺ `g - ∑ lᵢ projC uᵢ = 0`. The "forward
ΣλᵢPᵢ reconstruction" (subtle part (a)) is NOT a fresh sum: it is the snoc-accumulation
`specOpN (snoc l μ) (snoc u uₖ) = specOpN l u + μ • projC uₖ`, peeled in reverse by deflateC. The
nested-complement bookkeeping (subtle part (b)) is carried by the support invariant `image(h) ⊆ W`
with `W` shrinking by `W ⊓ uPerp u` each rung — every prior peeled direction is EvC-orthogonal to
the current W by construction.

## THE INDUCTION (strong induction on `m = finrank W`)
Helper `specExists_aux`:
  `∀ (m:ℕ) (h:Module.End Cut STVC), IsEvCSymm h → ∀ (W:Submodule Cut STVC),
     finrank Cut W = m → (∀ p, h p ∈ W) →
     ∃ n l u, (∀ i, u i ∈ W) ∧ (orthonormal family) ∧ h = specOpN l u`

- BASE m=0: finrank W = 0 ⟹ W = ⊥ ⟹ h p ∈ ⊥ ⟹ h = 0 = specOpN ![] ![] (n=0). Orthonormality vacuous.
- STEP m=k+1: W nontrivial. h(W)⊆W (image⊆W), restrict T:=h.restrict : End W, IsEvCSymmSub T,
  `submodule_selfadj_has_eigenvalue` ⟹ real eigenvalue μ, eigenvector w∈W, w≠0; normalize unit u∈W
  (EvC u u=1, h u = μ•u). Deflate h' := deflateC h μ u. Claims:
    • IsEvCSymm h' (deflateC_isEvCSymm)
    • image(h') ⊆ W' := W ⊓ uPerp u  (h'p = h p − (μ·EvC u p)•u ∈ W since u∈W; and ⊥uPerp via deflateC_image_orth)
    • finrank W' = k  [NEW LEMMA: codim-one drop WITHIN W]
  IH at m'=k ⟹ h' = specOpN l' u', u' i ∈ W' ⊆ uPerp u. Then
    h = h' + μ•projC u = specOpN l' u' + μ•projC u = specOpN (snoc l' μ) (snoc u' u)  [NEW snoc lemma]
  Orthonormality: u' mutually orthonormal (IH); u' i ⊥ u (∈uPerp u); u unit. snoc preserves.

## NEW PIECES TO BANK (W9 bank-as-you-go, freeze each on compile)
1. `specOpN_snoc`: `specOpN (Fin.snoc l μ) (Fin.snoc u uₖ) = specOpN l u + μ • projC uₖ`  [Fin.sum_univ_castSucc — EASY]
2. `finrank_inf_uPerp_within` : unit u∈W ⟹ `finrank (W ⊓ uPerp u) = finrank W − 1`  [rank-nullity on (EvCRight u)∘W.subtype — the genuine new technical piece]
3. `specExists_aux` : the strong induction helper
4. `stvc_selfadj_specExists` : `∀ g, IsEvCSymm g → ∃ n l u, orthonormal ∧ g = specOpN l u`  (W=⊤)

## GO / NO-GO
GO if pieces 1 & 2 each compile in a bounded probe (< 60s) AND the induction skeleton type-checks.
NO-GO (decompose, W3): if finrank-within-W (piece 2) resists after measure+reframe, BANK pieces 1
(+ 2 if it lands) as structural levers, child the full induction + global polar/KAK.

## KILL BUDGET (W9)
- Any single obligation > 180s compile = INSTRUMENT failure → measure/decompose, do NOT grind.
- No `maxHeartbeats` inflation. No monolithic brute on expanded coords.
- `lake build Phys` cached ~5-35s; if a probe file alone takes > 90s, decompose it.
- Checkpoint/commit at ~50% turns; finalize (commit + child + complete) with turns to spare.

## COSTUME (C116) — must BITE a wrong existence/reconstruction claim
Reuse banked mix family. Candidate: snoc-decomposition with a WRONG eigenvalue forces a false
numeric DISTINCT from the battery (C115 1=7, C114 2=5, C113 1=15). e.g. specOpN_snoc read on a unit
direction pins eigenvalue = correct; a bogus value forces e.g. `3 = 9` (pick distinct from battery).

## WORDS-REMOVABLE
Delete spectral/eigen*/self-adjoint/deflation/rank/dimension/orthonormal/diagonal/seed/re-seed/
existence/complement → pure math: over the derived complete ordered field Cut and the positive-
definite symmetric form EvC, every EvC-symmetric endomorphism of STVC equals ∑ lᵢ projC uᵢ for an
EvC-orthonormal family. No theorem STATEMENT needs a physics word.
