# PREREG — N5c: H₃(𝕆) JORDAN-IDENTITY ASSEMBLY (structural/associator route)

Frozen before compute. This is a W1 dissolution ticket. The 4 brute-normalizer routes
are DEAD (FINDINGS.md); this run attacks `jdef_H3 = 0` through the banked alternating-form
laws + involution centrality — NEVER a monolithic coordinate `ring`.

## TARGET (a THEOREM)
`jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0` for the general Hermitian 3×3 over `O ℚ`.
Then reassemble `jordan_cap_pinned_at_three := ⟨jdef_H3, jordan_fails_H4⟩`.

## STRUCTURAL TRUTH (banked numerics, re-verified run 46)
`assoc_decompose2.py`: every one of the 9 entries' associative+central collapse is EXACTLY 0
(0 nonzero (reals,word) groups / 216 terms). So each entry IS a sum of octonion associators
`[x,y,z]`, killed by the banked alternating-form laws (`Alternative.lean`). The field POSITS
H₃(𝕆) is the Albert algebra; we DERIVE it from the cascade's own alternativity. Moat-correct.

## GO / NO-GO
- GO if: the banked lemma set (alternating associator laws + Moufang + involution
  centrality + ocR centrality) is shown SUFFICIENT in a fast Python certificate, AND a
  bounded Lean probe closes at least one genuine sub-obligation within the cost budget.
- NO-GO (→ refine decomposition, child remainder) if: even the cheapest structural
  sub-obligation exceeds the KILL budget after measure+decompose.

## COMPILE-COST BUDGET (W9.2 — measured BEFORE committing, per obligation)
- centrality helpers `ocR_comm/assocL/M/R`: budget ≤ 20 s each (scratch measured ~seconds).
- any single defect-entry proof: KILL at **90 s wall OR 2 GB RSS**. If exceeded → decompose
  the entry into its associator-group sub-lemmas, each banked separately; never inflate
  maxHeartbeats past what a CORRECT structural proof needs (default-ish, not 1e7).
- NEVER run an unbounded compile inside the turn budget — every probe is bounded + timed.

## KILL / DRIFT TRAP (instrument-failure classification)
- DO NOT re-run any of the 4 dead brute routes (concrete-ℚ ring, abstract-B ring,
  base-H noncomm_ring, off-diag-ℚ ring). Any `ring`/`noncomm_ring` as the CLOSER over
  fully-expanded coordinates = the instrument wall = STOP.
- A single tactic with no output for >90 s, or RSS climbing past 2 GB = instrument failure,
  not theory failure → decompose / reframe, never grind harder.
- NEVER posit H₃(𝕆) is Jordan; NEVER import Mathlib JordanAlgebra/exceptional and assert it
  IS Albert. NEVER reach for ℝ (purely algebraic over ℚ; continuum gate stays untripped).
- NEVER weaken the target (no retreat to H₂). NEVER run out of turns mid-task — decompose
  with turns to spare (W3): bank what compiles (each its own frozen olean) + costume, child
  the remainder onto the chain tail, complete as "decomposed."

## COSTUME (anti-vacuity, W8)
Re-add the H3 wrong-cap costume once an entry lemma exists: a defect-entry coordinate
asserted ≠ its true value → false core. ONE row in scripts/costume_manifest.tsv.

## DISPOSITION DECISION RULE
- Full `jdef_H3 = 0` + reassembly compiles within budget → DONE (gate + STANDARD + commit).
- Partial: bank the entries/sub-lemmas that compile (frozen oleans) + costume, child the
  remainder linked onto the chain tail, complete as "decomposed."
