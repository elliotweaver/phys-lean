# N161 PREREG — THE GENERAL BIREFLECTION = octPlaneRot identity + the SO(8) bireflection word

## Frozen target (specified against the chain, W1 reframe + MEASURE-FIRST)
Priority (i) of §N161. N160 banked the ORTHONORMAL bireflection = half-turn
(`houseHolder a · houseHolder b = octPlaneRot a b (-1) 0`, lifted JoinedIdQvC). The single
restriction blocking the full closure-induction is the ORTHONORMALITY requirement. THIS node
removes it:

  D1 (the missing link — generalizes N160): **the GENERAL bireflection is JoinedIdQvC**:
     for ANY nonzero-Born-norm a,b,  `JoinedIdQvC (octBlockEndC (houseHolder a * houseHolder b))`.
  D2 (the clean assembly = the full SO(8) into JoinedIdQvC, trunk-native, NO determinant theory):
     for any `L : List (O Cut × O Cut)` with each pair nonzero-norm,
     `JoinedIdQvC (octBlockEndC ((L.map (fun t => houseHolder t.1 * houseHolder t.2)).prod))`.
     This IS the full SO(8) path-connectedness (every SO(8) element = an EVEN reflection product =
     a product of bireflections, Cartan-Dieudonné even part), phrased over the trunk-native
     bireflection-pair list — no determinant/parity machinery needed because evenness is structural.

## The worked math (MEASURED before compute)
Normalize a,b to unit â,b̂ (houseHolder is scale-invariant: `houseHolder (t•a) = houseHolder a`,
t≠0). Let k = gFormC â b̂. f₀ = b̂ − k•â (Gram–Schmidt). gFormC â f₀ = 0; gFormC f₀ f₀ = 1 − k².
By Born positivity `gFormC_nonneg`, 1 − k² ≥ 0 — NO Cauchy–Schwarz needed. Cases:
  • 1 − k² = 0 ⇒ f₀ = 0 (gFormC_eq_zero_iff) ⇒ b̂ = k•â, k²=1, houseHolder b̂ = houseHolder â ⇒
    bireflection = involution = 1 ⇒ joinedIdQvC_one.
  • 1 − k² > 0, k = 0 ⇒ â,b̂ orthonormal ⇒ N160 `joinedIdQvC_octBlockEndC_orthoBireflection`.
  • 1 − k² > 0, k ≠ 0 ⇒ μ = cutSqrt(1−k²) > 0, f = μ⁻¹•f₀ unit ⊥ â, and
    `houseHolder â · houseHolder b̂ = octPlaneRot â f c s`, c = 2k²−1, s = −2kμ.
    Direct basis check: R_a R_b â = (2k²−1)â − 2kμ f ; R_a R_b f = 2kμ â + (1−2μ²)f, 1−2μ²=2k²−1.
    c²+s² = (2k²−1)²+4k²(1−k²)=1. c = 2k²−1 > −1 (k²>0) ⇒ 1+c = 2k² ≠ 0, OFF antipode ⇒
    N159 `joinedIdQvC_octBlockEndC_octPlaneRot` (orthonormal â,f, circle pt, off antipode).

## GO / NO-GO
GO if: D1 compiles foundations-only AND D2 compiles foundations-only; costume C193 bites a wrong
value (1=161, distinct from battery); gate D0-D6 green; phrased in JoinedIdQvC (NON-vacuous, not
JoinedIdC); physics-words-removable.
NO-GO / DECOMPOSE if: the general-bireflection = octPlaneRot identity (`module`/`linear_combination`
after the Gram-Schmidt substitution) is a W9 instrument wall → bank D1 helper pieces that DO compile,
child the remainder. The full `Submonoid.closure houseHolderSet` → product-of-pairs (the det-parity
combinatorial connection) is the genuinely-hard residual — child it onto the tail regardless (it is
the Mathlib-lacks-it-over-Cut heavy part).

## KILL (instrument-failure classifier, W9)
- Any single tactic (`module`/`linear_combination`/`simp`) on the bireflection=octPlaneRot identity
  running > 90s, or needing maxHeartbeats raised above default = INSTRUMENT failure → decompose the
  identity into the two basis-vector reads (â, f) + a coefficient-matching `module`, or reframe.
- Do NOT inflate maxHeartbeats. Do NOT brute a coordinate expansion. Measure in a bounded probe
  before committing.

## Anti-vacuity (W8)
Costume C193: a WRONG general-bireflection / SO(8)-word / JoinedIdQvC value (1=161). The result is
NON-vacuous: phrased in JoinedIdQvC (joinedIdQvC_isQvIsomC forces it to be a QvC-isometry), and the
concrete e₂,je2 witness (k=0 half-turn) moves the axis (reads −1), NOT the identity's +1.
