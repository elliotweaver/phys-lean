# N46 PREREG — THE SL(2,𝕆) SPINOR COVER / the matrix M ↦ A M A† action on herm2

FROZEN before compute. Run 197. Git clean @ 1bf1e56 (no inherited production WIP — fresh start,
not a W6/W9 crime scene; only workbench scratch untracked).

## THE TARGET (specified against what the chain ACTUALLY produced)
N43 banked `herm2 t x v : Matrix (Fin 2) (Fin 2) (O ℚ)` (self-adjoint 2×2), `herm2_isHermitian`,
`herm2_det` (= `reQ(M₀₀M₁₁ − M₀₁M₁₀)`), and ★★ `herm2_det_eq : herm2_det = Qform = t²−x²−gForm v v`.
N45 banked the ISOMETRY STRUCTURE of Qv abstractly (submonoid + boost/rot generators) WITHOUT a
matrix determinant. N46's job is the MATRIX ACTION `M ↦ A M A†` specifically — the spinor picture —
connecting the abstract N45 isometry to the concrete matrix realization.

`O ℚ` carries `narCD` (NonAssocRing) + `srCD` (StarRing). `Matrix (Fin 2) (Fin 2) (O ℚ)` therefore
has matrix `*` (Mathlib `Matrix.instMul`, needs only Mul+AddCommMonoid+Fintype — NO associativity)
and `ᴴ` conjTranspose. NO Mathlib ℝ/ℂ as content; everything over the DERIVED ground ring ℚ.

## THE W1 REFRAME (THE ONE LAW) — tried FIRST, before any general det-bash
The flagged W9 hard core is the GENERAL `det(AB) = det A · det B` over the non-associative O ℚ,
which FAMOUSLY FAILS, and a general boost matrix needs IRRATIONAL entries (derived ℝ). DO NOT grind
it. The reframe: a **CONCRETE diagonal RATIONAL generator** sidesteps both difficulties entirely.

KEY DERIVATION (hand-computed, to verify in Lean): for the diagonal real matrix
`A = boostMat p = !![ p•1, 0 ; 0, p⁻¹•1 ]` (p ∈ ℚˣ, det_real A = p·p⁻¹ = 1),
the spinor action `(A * M) * Aᴴ` on `M = herm2 t x v` gives
  `!![ p²(t+x)•1 , v ; star v , p⁻²(t−x)•1 ]`
because Aᴴ = A (p,p⁻¹ real, star-fixed), so the off-diagonal v scales by p·p⁻¹ = 1 and the
diagonal lightcone coords (t+x),(t−x) scale by p², p⁻². This is a genuine LORENTZ BOOST in
LIGHTCONE COORDINATES — RATIONAL, no irrational entries — and it preserves
  `herm2_det = p²(t+x)·p⁻²(t−x) − gForm v v = (t+x)(t−x) − gForm v v = t²−x²−gForm v v = Qform`.
So `herm2_det ((A*M)*Aᴴ) = herm2_det M` EXACTLY (det A = 1). Connects to N45 `boost a b` via
a = (p²+p⁻²)/2, b = (p²−p⁻²)/2 (rational, a²−b² = 1; p=2 ⟹ a=17/8,b=15/8). The non-associativity
of O ℚ is never triggered because the off-diagonal carries a SINGLE octonion v times real scalars.

## DECOMPOSE (W1/W3) — bank the light, child the heavy
 (a) Bank that `M ↦ (A*M)*Aᴴ` preserves Hermiticity for the concrete generator (result is
     manifestly a herm2) — pure star/transpose. LIGHT.
 (b) ★ Bank the CONCRETE diagonal rational boost generator `boostMat p` realizes the action and
     preserves `herm2_det = Qform` (the matrix isometry connecting N45 → matrix picture). LIGHT-MED.
     Plus NON-TRIVIALITY (p≠±1 ⟹ not identity, genuinely scales lightcone coords).
 (c) CHILD the full `SL(2,𝕆) ↠ SO⁺(1,9)` cover / general non-associative det-multiplicativity /
     the rotation matrix generator (left-mult by a unit needs care over non-assoc O) — the heavy
     connection, onto the chain tail.

## GO / NO-GO (frozen)
GO (bank N46) if: (a) Hermiticity preservation for boostMat compiles foundations-only; AND
  (b) `herm2_det ((boostMat p * herm2 t x v) * (boostMat p)ᴴ) = herm2_det (herm2 t x v)` compiles
  foundations-only; AND non-triviality (boostMat p ≠ 1 for p ≠ 1). Costume C77 bites a WRONG matrix
  isometry. Gate D0–D6 green. STANDARD applied. Child (c) onto chain tail.
DECOMPOSITION (correct W3 outcome) if only (a)+(b) for the diagonal generator land cleanly; child
  the rotation generator + full cover.
NO-GO / honest W1 block if even the concrete diagonal det-preservation resists after measure+reframe
  (would mean Matrix machinery over narCD O ℚ is itself obstructed — measure tells us).

## KILL (W9 — frozen)
- Per-obligation KILL = 60s. If herm2_det of the concrete action does not close in a bounded
  `lake env lean` probe under 60s with a STRUCTURED proof (entry extraction + banked reQ/gForm,
  NOT a monolithic `decide`/`ring` over expanded octonion coords), STOP — it is a structural-route
  problem, decompose further or child.
- NEVER run an unbounded compile in the turn budget. MEASURE every obligation in a bounded probe
  first. NO inflated maxHeartbeats. NO monolithic brute normalizer over expanded coordinates.
- TURN CHECKPOINT at ~50%: if (a)+(b) not both banked+committed by mid-budget, FINALIZE whatever
  is clean (bank-as-you-go) + child the rest + complete as decomposed. NEVER run out of turns.
- ⚠ AxiomAudit: when adding #print axioms lines, ALSO add `import Phys.Algebra.<NewFile>` to the
  import block (last import currently `Phys.Algebra.LorentzIsometry`). N44 died forgetting this.

## ANTI-VACUITY (W8)
Costume C77 MUST bite a WRONG matrix isometry that fails to compile: claim the WRONG-determinant
diagonal `diag(p,p)` (det = p², scales herm2_det by p⁴ ≠ 1) preserves herm2_det, OR feed a wrong
scaling to the banked generator lemma. Words-removable: delete "Lorentz/boost/spinor/SL(2,𝕆)/
isometry/cover" → pure math about the banked herm2 / herm2_det / the terminal algebra.
