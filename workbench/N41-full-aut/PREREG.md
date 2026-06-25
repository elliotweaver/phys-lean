# N41 PREREG — FROZEN before compute (run 171)

## Node
N41 — the FULL `O Cut` ALGEBRA-AUTOMORPHISM + `d/dt exp(tD)|₀ = D` completing
`Der(𝕆) → Aut(𝕆)` over the derived ℝ `ContinuumQ.Cut`.

## State at entry (W6 verified)
Clean tree, HEAD `9f7a947` (N40 finalize). NOT a crime scene — fresh N41 start.
N40 banked: `expMap D := ∑' n, expTerm D n` (matrix exp), `expMap_mul_of_commute`
(exp(A)·exp(B)=exp(A+B) for Commute A B), `expMap_mul_neg`/`_neg_mul` (invertible),
`expMap_zero`, `expTerm_antidiagonal` (matrix binomial crux). All over `Matrix (Fin 8)(Fin 8) Cut`.
Banked algebra: `IsDeriv (D : Module.End ℤ (CD (CD B)))` := ∀ x y, D(xy)=Dx·y+x·Dy
(`Phys/Algebra/Derivation.lean`, closed under +,-,•,bracket). `O R = CD (H R) = CD (CD (Dbl R))`.
`Dbl Cut` is CommRing+StarRing ⇒ `IsDeriv` applies to `Module.End ℤ (O Cut)`.
ℚ-side coordinatization `coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)`, basis `bO` (`DerivationCompact.lean`).
Cut-side coordinatization: NOT banked (ℚ-only).

## THE FULL TARGET (decomposes — W3/W9)
exp(D)(xy) = exp(D)(x)·exp(D)(y) over `O Cut` + `d/dt exp(tD)|₀ = D`. The chain:
  (1) ALGEBRAIC CORE — iterated Leibniz: `Dⁿ(xy) = ∑_{k+l=n} C(n,k)•(Dᵏx · Dˡy)` for a
      Leibniz endomorphism D of `O Cut`. PURE ALGEBRA (bilinearity + Leibniz + Pascal); NO
      associativity, NO topology, NO coordinates. The algebra-side analogue of the banked
      matrix `expTerm_antidiagonal`. ← THIS RUN's target if it banks clean.
  (2) Cut-side coordinatization `O Cut ≃ₗ[Cut] (Fin 8 → Cut)` + matrix↔endomorphism link.
  (3) Analytic integration: pass the per-n identity to the limit by the Cauchy product over
      the topological ring `O Cut` (continuity of `*`), concluding product-preservation.
  (4) `d/dt exp(tD)|₀ = D` — trunk-native Tendsto of the difference quotient over N36 uniform
      structure (NOT Mathlib HasDerivAt/NormedField = ℝ-content trap).

## GO / NO-GO (decided by the bounded MEASUREMENT below)
- GO (this run): bank step (1), the iterated Leibniz identity, as a production olean in
  `Phys/Algebra/` over `O Cut` (and generically `CD (CD B)`), foundations-only, costume biting
  a WRONG binomial (missing the derivation hypothesis or wrong coefficient), gate green.
  Child steps (2)+(3)+(4) onto the chain tail as N41b.
- If step (1) ALSO banks cheaply and step (2) coordinatization is fast, extend the GO to
  include the Cut coordinate equiv. Decide by measurement, never by hope.

## KILL / compile-cost budget (W9)
- KILL: any single proof obligation that does not elaborate in ≤ 60 s in a bounded probe is an
  INSTRUMENT failure → decompose / reframe through the trunk, NEVER inflate maxHeartbeats.
- The iterated-Leibniz induction step: the risk is the Pascal reindexing of the antidiagonal
  sum. If `Finset.sum_antidiagonal`/`Finset.antidiagonal_succ` manipulation is painful, fall
  back to the `Finset.range (n+1)` + `Nat.choose` Pascal form, or prove via `Commute`-free
  bilinear expansion. MEASURE the n→n+1 step in isolation first.
- TURN CHECKPOINT ~55%: if step (1) is not yet committed by then, FINALIZE EARLY — bank
  whatever compiles, child the remainder, complete as "decomposed".

## ANTI-VACUITY (W8)
The costume MUST bite: a wrong iterated-Leibniz claim — e.g. asserting the binomial identity
for an endomorphism that is NOT a derivation (drop `hD`), or a wrong coefficient (C(n,k) → 1),
or n+1 indexing error — must FAIL to compile. Reuse banked `IsDeriv`/`O Cut`; NEVER a fresh table.

## PHYSICS-WORDS-REMOVABLE
Delete "derivation/automorphism/gauge/exp": the file is a pure proof that for a Leibniz
endomorphism D of the Cayley–Dickson double-of-double-of-double, the n-th iterate of D on a
product expands by the binomial law `Dⁿ(xy)=∑ C(n,k) Dᵏx·Dˡy`. No physics name load-bearing.

## ROUTES ATTEMPTED (anti-circling log — append as we go)
- (pending) Probe A: iterated Leibniz induction over `O Cut` / generic `CD (CD B)`.
