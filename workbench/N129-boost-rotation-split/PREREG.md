# N129 PREREG — THE BOOST/ROTATION BLOCK DECOMPOSITION (frozen before compute)

## NODE
Stitch the (t,x) boost strand (boostEndC) and the octonion-block exhaustion
(gFormC_isom_mem_closure, N124) to the now-CLOSED indefinite Householder exhaustion
(lorentz_exhaustion_M, N128). Express the block-diagonal boost×rotation subgroup of SO⁺(1,9)
as a DERIVED structure: the (t,x) hyperbolic boost factor + the positive-definite
octonion-block rotation factor, BvC-orthogonal blocks, commuting factors, covered by the
closed exhaustion.

## GROUND (all banked, foundations-only)
- STVC = Cut × Cut × O Cut  (signature (1,9)); Cut = derived ℝ.
- BvC p q = p.1·q.1 − p.2.1·q.2.1 − gFormC p.2.2 q.2.2   (LorentzContinuumLieAlgebra)
- BvC bilinear/symm: BvC_add_left/right, BvC_smul_left/right, BvC_symm.
- boostEndC a b : Module.End Cut STVC, (t,x,v) ↦ (a t + b x, b t + a x, v)  (MetricCondition)
  · boostEndC_isQvIsomC (a²−b²=1) : IsQvIsomC (boostEndC a b)
  · linIsom_BvC_preserved : IsQvIsomC g → ∀ p q, BvC (g p)(g q) = BvC p q
- IsGFormCIsom R := ∀ u v, gFormC (R u)(R v) = gFormC u v   (SO8GlobalExhaustion)
  · gFormC_isom_mem_closure : IsGFormCIsom S → S ∈ Submonoid.closure houseHolderSet (N124)
- IsBvIsomLin S := ∀ p q, BvC (S p)(S q) = BvC p q  (IndefiniteHouseholder)
  · lorentz_exhaustion_M : IsBvIsomLin S → S ∈ Submonoid.closure houseHolderMSet (N128)
  · gFormC_zero_left, gFormC_symm.

## TARGET (forward, forced, genuinely-NEW — the STITCH joint)
New file Phys/Algebra/LorentzContinuumGenerationBoostRotationSplit.lean:
1. octBlockEndC R : Module.End Cut STVC, (t,x,v) ↦ (t, x, R v)  — octonion-block embedding.
2. octBlockEndC_isBvIsomLin (IsGFormCIsom R) : IsBvIsomLin (octBlockEndC R).
3. boostEndC_isBvIsomLin (a²−b²=1) : IsBvIsomLin (boostEndC a b)  [via linIsom_BvC_preserved].
4. blockDiagC a b R := boostEndC a b * octBlockEndC R, and blockDiagC_apply:
   (t,x,v) ↦ (a t + b x, b t + a x, R v)  — the EXPLICIT block-diagonal form.
5. boostEndC_octBlockEndC_commute : boostEndC a b * octBlockEndC R = octBlockEndC R * boostEndC a b
   (the block-diagonal factors commute — boost touches only (t,x), rotation only the v-block).
6. blockDiagC_isBvIsomLin (a²−b²=1, IsGFormCIsom R) : IsBvIsomLin (blockDiagC a b R).
7. ★ blockDiagC_mem_closure : (a²−b²=1, IsGFormCIsom R) →
       blockDiagC a b R ∈ Submonoid.closure houseHolderMSet  — THE STITCH: the closed exhaustion
   (lorentz_exhaustion_M) covers the entire block-diagonal boost×rotation subgroup.
8. ★ BvC BLOCK-ORTHOGONALITY: the (t,x) plane is BvC-orthogonal to the octonion block —
   bvC_tx_oct_orthogonal : BvC (t,x,0) (0,0,v) = 0  — the EvC-orthogonal split realized on BvC.
9. W8 witness: blockDiagC on a genuinely-indefinite derived vector reads the distinguishing
   numeric (1, not 161-distinct false value); costume C161 bites a WRONG split.

## GO / NO-GO
GO iff: every decl 1–8 compiles foundations-only ({propext,Classical.choice,Quot.sound}),
costume C161 BITES (a wrong block-split coordinate fails to compile, false numeric DISTINCT
from C160 1=128), physics-words-removable (delete boost/rotation/Lorentz/Minkowski/block →
pure statements about boostEndC/octBlockEndC/BvC/gFormC over Cut + O Cut).

## KILL (INSTRUMENT-failure budget — W9)
Any single obligation > 90s isolated compile = INSTRUMENT failure, NOT theory: MEASURE the
smallest piece, DECOMPOSE, prefer structural reduction over coordinate expansion. NEVER inflate
maxHeartbeats. The forward decls (1–8) are all rfl-ish / one-rewrite — expected << 90s each.
If the CONVERSE/uniqueness (an arbitrary block-preserving BvC-isometry factors as boost×rotation,
i.e. the (1,1)-block hyperbolic classification + full polar decomposition) RESISTS after the
trunk reframe → it is the HEAVY remainder: child it (W1 dissolution / W3 decompose), do NOT grind.
The forward factorization + block-orthogonality + mem_closure is the bankable forward joint.

## SCOPE DISCIPLINE (W4.5)
This OPENS the block-diagonal subgroup structure (the stitch joint the operator-topology
connectedness node and future spacetime nodes need) — it does NOT re-confirm lorentz_exhaustion_M
(it USES it to COVER a new family). The full polar/converse decomposition is the childed remainder.
