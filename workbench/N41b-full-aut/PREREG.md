# N41b PREREG — FROZEN before compute (run 173)

## Node
N41b — completing the FULL `O Cut` ALGEBRA-AUTOMORPHISM `exp(D)(xy)=exp(D)(x)·exp(D)(y)`
+ `d/dt exp(tD)|₀ = D` over the derived ℝ `ContinuumQ.Cut`.

## State at entry (W6 verified)
Clean tree, HEAD `ec6035a` (N41a finalize). NOT a crime scene — no uncommitted/unfinalized WIP.
N41a banked (`Phys/Algebra/DerivationLeibnizPow.lean`, over `[CommRing B][StarRing B]`):
  iter_leibniz_range / iter_leibniz_antidiag : for `IsDeriv D` on `CD (CD B)`,
    `Dⁿ(x·y) = ∑_{k+l=n} C(n,k)•(Dᵏx · Dˡy)`.  Pure algebra; ℕ-smul.
N40 banked (`DerivationAutExpHom.lean`): `expMap D = ∑' n, expTerm D n` (MATRIX exp over
  `Matrix (Fin 8) (Fin 8) Cut`), `expMap_mul_of_commute`, `expMap_mul_neg/_neg_mul` (invertible),
  `expMap_zero`, `expTerm_antidiagonal`. N39 `expTerm_summable`. N37 CompleteSpace Cut, N36 uniform,
  N34 isTopologicalRing_cut (continuity of `*` on Cut), T2Space Cut.
`O Cut = CD (CD (Dbl Cut))`, `Dbl Cut` CommRing+StarRing ⇒ `narCD` gives `NonAssocRing (O Cut)`,
  `srCD` gives `StarRing (O Cut)`.  ℚ-side `coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)` + `bO` exist (ℚ-only).
Cut-side topology/coordinatization on `O Cut`: NOT banked. ← THE un-reconnoitered hard rung.

## THE FULL TARGET (decomposes — W3/W9)
`exp(D)(xy)=exp(D)(x)·exp(D)(y)` over `O Cut` + `d/dt exp(tD)|₀=D`. The analytic integration:
  exp(D)(xy) = ∑'_n (1/n!)•Dⁿ(xy)
             = ∑'_n (1/n!)•∑_{k+l=n} C(n,k)•(Dᵏx·Dˡy)         [N41a]
             = ∑'_n ∑_{k+l=n} ((1/k!)•Dᵏx)·((1/l!)•Dˡy)        [C(n,k)/n!=1/(k!l!), bilinearity]
             = (∑'_k (1/k!)•Dᵏx)·(∑'_l (1/l!)•Dˡy)             [Cauchy product on topological O Cut]
             = exp(D)(x)·exp(D)(y).
This needs, on the 8-dim space carrying the `O Cut` product:
  (A) a TopologicalSpace + T3Space + CompleteSpace + IsTopologicalAddGroup + ContinuousMul
      (= the Cauchy-product hypotheses `[T3Space][NonUnitalNonAssocSemiring][IsTopologicalSemiring]`
       + completeness for the tsum to exist), and `Module Cut` + ContinuousSMul for the (1/n!)•.
  (B) the vector-valued exp `expO D x := ∑' n, (1/n!)•(Dⁿ x)` summable (absolute conv via N38 opNorm
      tail / N39 majorant transported to the coordinate space).
  (C) the Cauchy product `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` on `O Cut`.
  (D) the derivative `d/dt exp(tD)|₀=D` — trunk-native Tendsto of (exp(tD)-1)/t over N36 uniform.

## GO / NO-GO (decided by the bounded MEASUREMENT below — frozen)
The foundational rung (A) — the topological-vector-algebra structure on `O Cut` (or on the
coordinate space `Fin 8 → Cut` it is linearly equiv to) — is the prerequisite EVERYTHING downstream
needs and is the un-measured hard core. THIS RUN's GO is decided by MEASURING (A):
- GO-A (this run's primary bank target): bank the Cut-side topological/coordinate infrastructure on
  `O Cut` as a production olean — TopologicalSpace + T2/T3 + CompleteSpace + IsTopologicalAddGroup +
  ContinuousMul (+ Module Cut + ContinuousSMul) + the coordinate equiv `O Cut ≃ₗ[Cut] (Fin 8→Cut)`,
  foundations-only, gate green, costume biting a WRONG continuity/completeness claim. Child (B)+(C)+(D).
- If (A) banks cheaply AND (B) the vector exp summability is fast, extend GO to include `expO` + its
  summability. Decide by measurement, never by hope.
- If (A) is itself the genuine hard core (e.g. ContinuousMul on the CD structure resists), DECOMPOSE
  it: bank the topology+T2+completeness piece first (likely cheap via the coordinate equiv to the Pi
  space), child ContinuousMul/the algebra-continuity separately.

## KILL / compile-cost budget (W9)
- KILL: any single proof obligation not elaborating in ≤ 60 s in a bounded probe is an INSTRUMENT
  failure → decompose / reframe through the trunk, NEVER inflate maxHeartbeats.
- The W9 RISK to MEASURE FIRST: ContinuousMul on `O Cut`. The product is bilinear, 8-dim, each
  coordinate a Cut-polynomial in the input coordinates; continuity should reduce to continuity of
  `Cut` `*`/`+` (`isTopologicalRing_cut`) via the coordinate equiv — BUT the `CD`-structure
  `simp`/coordinate expansion could blow up. If the direct CD route is heavy, transport the product to
  `Fin 8 → Cut` and use the Pi/coordinate continuity. MEASURE the smallest sub-obligation first.
- TURN CHECKPOINT ~50%: if (A) is not yet committed by then, FINALIZE EARLY — bank whatever compiles
  (even just TopologicalSpace+T2+CompleteSpace), child the remainder, complete as "decomposed".

## ANTI-VACUITY (W8)
The costume MUST bite: a WRONG O-Cut-automorphism / product-preservation / continuity claim — e.g.
product-preservation asserted for a NON-derivation endomorphism (drop the Leibniz hyp → the N41a
binomial step is unavailable), or exp(0)≠1 on the algebra, or a wrong continuity/completeness — must
FAIL to compile. Reuse banked iter_leibniz/expMap/IsDeriv/O Cut/isTopologicalRing_cut/CompleteSpace;
NEVER a fresh table.

## PHYSICS-WORDS-REMOVABLE
Delete "exp/gauge/G₂/colour/derivation/automorphism": the file is a complete proof that the
convergent power series ∑(1/n!)•Dⁿ of a Leibniz endomorphism of the 8-dim non-associative
Cayley–Dickson double-of-double-of-double over the derived ℝ is a structure-preserving bijection with
derivative D at the identity. No theorem STATEMENT needs a physics word.

## ROUTES ATTEMPTED (anti-circling log)
- Probe 1 (1.8s): `Fin 8 → Cut` has Top/T2/T3/CompleteSpace/Uniform/ContinuousAdd/Module Cut for
  free; `Cut` is T3/RegularSpace. ✓
- Probe 2 (1.7s): topology on `CD A` via `induced toProd`; `Topology.IsEmbedding.t2Space` transfers
  T2. ✓
- Probe 3 (1.9s): ★ THE W9 RISK CLEARED — ContinuousMul on the non-associative `CD` product is
  CHEAP: each coordinate of `(z*w)` is a Cut-polynomial in coords, continuity = `Continuous.mul/add/
  neg/star` on the projections. NOT the hard core. Also ContinuousAdd/Neg/Star. ✓
- Probe 4 (2.1s): CompleteSpace via `completeSpace_iff_isComplete_range` + range=univ; generic
  `Module R (CD A)` via narCD. ✓
- Probe 5 (2.0s): full `O Cut` assembly through Dbl+CD+CD layers — TopologicalSpace, T2, T3,
  ContinuousAdd, ContinuousMul, IsTopologicalSemiring all synthesize. ✓
- Probe 6 (1.8s): ContinuousSMul transfer (generic R). ✓
- Probe 7 (1.7s): `SMul Cut (O Cut)` synthesizes via the base `SMul R (Dbl R)`; no ℚ-diamond. ✓
- Probe 8 (1.7s): ★ CLEANEST DESIGN — define ONLY `UniformSpace (CD A)` via `UniformSpace.comap
  toProd`; `.toTopologicalSpace = induced toProd` by `rfl` (NO topology/uniformity diamond);
  `CompleteSpace (O Cut)` synthesizes through both Dbl+CD layers. ✓

## FROZEN GO (decided by measurement)
Rung A is uniformly CHEAP (≤2.1s every obligation; KILL=60s never approached). GO = bank rung A
this run as a production olean: the complete topological *-algebra on `O Cut` (and the `Dbl`/`CD`
layers): UniformSpace (comap) → TopologicalSpace/T2/T3, ContinuousAdd/Neg/Mul/Star, ContinuousSMul,
CompleteSpace, IsTopologicalSemiring. Foundations-only, costume biting a WRONG continuity/structure
claim. Child the vector exp `expO` + the Cauchy-product product-preservation `exp(D)(xy)=…` + the
derivative `d/dt exp(tD)|₀=D` as N41c (the analytic integration, which now has its topological ground
banked). This is the W3/W9 ANTI-TIMEOUT decomposition: bank the de-risked foundational rung, scope
the analytic core to its own node.
