# N2c — FINDINGS (numerics + scratch de-risk, all exact / kernel-checked)

Probe `workbench/N2c-octonion/probe.py` reproduces the Lean `CD` convention EXACTLY
(level1 = Dbl product with trivial base star; levels 2,3,4 = generic CD with propagated star).
All four GO conditions of PREREG.md CONFIRMED:

- G1  assoc-iff:  (ι a · ι b)·e₂ == ι a·(ι b·e₂)  ⟺  a·b == b·a.
      Holds for commuting base C (a=J,b=1+J) AND non-commuting base H (a=ιJ,b=e₂: both False).
- G2  𝕆 = CD(H) non-assoc: the triple (ι(ιJ), ι(e₂_H), e₂_O) gives (x*y)*z lands on +1 in the
      top coord, x*(y*z) lands on −1 → does NOT associate.  ★ caused by H non-commutativity.
- G3  STOP zero divisor in S = CD(𝕆) (dim 16):  (e₁+e₁₀)(e₅+e₁₄) = 0.
- G4  anti-vacuity / Born:  Q x = 2, Q y = 2, Q(x·y) = Q 0 = 0 ≠ 4 = Qx·Qy → composition law FAILS.

Lean literals (emit_literals.py, transcribed 1:1 into the dim-16 type CD (CD (CD (Dbl ℚ)))):
  x (e₁+e₁₀) := ⟨⟨⟨⟨0,1⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨1,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩⟩
  y (e₅+e₁₄) := ⟨⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,1⟩,⟨0,0⟩⟩⟩,⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨1,0⟩⟩⟩⟩

## SCRATCH de-risk (compiled clean in isolation against the banked tree)
- Generic ★ ONE CAUSE for the stop of associativity (to add to Double.lean):
    CD.iota_iota_e2_assoc_iff [Ring A] [StarRing A] (a b : A) :
      (ι a · ι b)·e₂ = ι a·(ι b·e₂) ↔ a·b = b·a
  (base ℍ is a non-commutative Ring — NOT a CommRing — so the hypothesis is [Ring][StarRing],
  mirroring iota_e2_comm_iff which needed [CommRing]. Confirmed compiles.)
- The STOP zero divisor: on the PINNED type `CD (CD (CD (Dbl ℚ)))` (dim 16 — NOT 5 CD-levels;
  the polymorphic literal otherwise resolves one level too deep), `zero_divisor_prod : xZD*yZD=0`
  closes by `ext <;> simp [accessor+mul+star lemmas]` (~15s, maxHeartbeats 1000000). `xZD_ne_zero`
  / `yZD_ne_zero` via congrArg on accessor paths re.re.re.im / re.im.re.im.

## CAUSAL CAPSTONE ("one cause, many terminations") — plan
Part 1 proves O non-associative (theorem). Part 2 proves S loses the law (theorem). The tight
generic causal theorem "composition law on CD A ⟹ A associative" is the bonus capstone; probe
its Lean feasibility — if it resists, the concrete witnesses FULLY discharge the PROVED STOP
(task option (a)+(b)) and the capstone becomes a clean W1 dissolution follow-up, NOT a weakening.

## GO / NO-GO: GO. Both rung-3 and the STOP are de-risked and compile foundations-only-bound.
KILL non-trigger: no fight required a new hypothesis. The dim-16 pinning was an INSTRUMENT fix
(polymorphic literal ambiguity), not a theory patch.
