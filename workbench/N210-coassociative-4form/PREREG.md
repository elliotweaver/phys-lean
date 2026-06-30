# N210 PREREG — THE COASSOCIATIVE 4-FORM ψ = *φ (the Hodge-dual G₂ calibration)

## FRONT SURVEY (W4.5 look WIDEST), frozen BEFORE compute
- (a) HYPERCHARGE NORMALIZATION (Q=T₃+Y/2): REJECTED AGAIN — no convention-free Y anchor inside
  rank-2 g₂ (N203 entanglement blocks a commuting-Cartan reading, N204 −16 anchors ISOSPIN length
  not the Y ratio). Risks a posited convention → THE ONE LAW / W8.
- (b) DERIVATION-INVARIANCE of assoc3 (g₂ annihilates the 3-form): MEASURED as a JUXTAPOSITION —
  it is exactly N207 (octCross-invariance D(octCross y z)=octCross(Dy)z+octCross y(Dz)) reassembled
  with N24 gForm skew-adjointness gFormQ_skew. The Leibniz identity for assoc3 = gForm x (octCross y z)
  is the mechanical sum of those two banked invariances. REJECT (W8 mechanical consequence).
- (c) g₂ root structure / triality / calibration↔(1,9)-form relation: re-pin / heavy / vacuous risk.
- (d) WIDEST — THE COASSOCIATIVE 4-FORM ψ = *φ. CHOSEN. The Hodge-dual partner of N209's
  associative 3-form φ. NEVER built (grep "coassociative" across docs/LEDGER docs/ROADMAP = 0).

## THE TARGET (front d)
Over the derived ℚ and the octonion rung O ℚ = CD (H ℚ), ASSEMBLE the banked associator
`assoc x y z = (x*y)*z − x*(y*z)` (N5b Alternative.lean, ALTERNATING in its 3 slots via
assoc_swap12/assoc_swap23/alt_left/alt_right/alt_flex) and the banked Born form `gForm` (N24)
into the COASSOCIATIVE 4-FORM
        coassoc4 x y z w := gForm (assoc x y z) w   (= ⟨[x,y,z], w⟩).
Claim: on imaginary x,y,z,w ∈ ImO it is TOTALLY ANTISYMMETRIC — the alternating 4-form ψ = *φ
whose GL(7) stabilizer is the SAME exceptional structure group g₂ = Der(O) that fixes φ (N209).

## WHY GENUINELY NEW (not a re-pin / not mechanical / not a juxtaposition)
- DIFFERENT OBJECT/DEGREE: a degree-4 SCALAR totally-antisymmetric quadrilinear FORM
  ImO⁴ → ℚ. NOT N209's degree-3 φ = ⟨x, y×z⟩ (cross product). NOT octCross (vector, N206).
  NOT the contraction (degree-3 vector, N208). NOT the Jacobiator (N205).
- THE GENUINELY-NEW LEVER: antisymmetry under the (z,w) EXCHANGE
        coassoc4 x y z w = − coassoc4 x y w z,
  i.e. gForm([x,y,z],w) = −gForm([x,y,w],z), equivalently reQ([x,y,z]·w)+reQ([x,y,w]·z)=0 on
  imaginary args. This relates the associator's 3rd BRACKET slot to the 4th METRIC slot — NOT a
  mechanical consequence of the 3-slot associator alternation (assoc_swap12/23 only give x↔y, y↔z).
  It is the "associator is skew for the Born form" content, NEVER banked. Forced by the banked
  trace-associativity reQ_mul_assoc3 + trace-cyclicity reQ_mul_comm (N209) — the SAME real-part
  associativity lever, now driving the 4-slot total antisymmetry.
- The x↔y and y↔z antisymmetries ARE mechanical (from assoc_swap12/23 + gForm linearity) — those
  are NOT the deliverable; the (z,w) lever is.

## GO / NO-GO (frozen)
- GO iff: the (z,w)-exchange identity reQ([x,y,z]·w)+reQ([x,y,w]·z)=0 (on imaginary args, or all
  args) PROVES foundations-only via the banked trace levers OR a bounded coordinate `ring`, AND it
  is non-vacuous (a nonzero witness value of coassoc4 on a concrete imaginary 4-tuple).
- NO-GO → look WIDER: if the (z,w) lever measures HEAVY (coordinate ring on degree-4/32-var does
  NOT close in a bounded probe AND the structural trace route does not reduce it) → W1 dissolution
  ticket. If it measures as a mechanical consequence of banked alternation alone (vacuous as new
  content) → REJECT, look wider. If coassoc4 ≡ 0 on ImO (the 4-form vanishes / is degenerate) →
  REJECT (W8 vacuity).

## KILL (W9, frozen per obligation)
- Each obligation: KILL at 90s wall OR maxHeartbeats 400000. If the coordinate `ring` for the
  (z,w) lever does not close inside one bounded probe, STOP — do NOT inflate; switch to the
  structural trace route (reQ_mul_assoc3 + reQ_mul_comm bracket-shuffle). If neither closes
  bounded → W1 dissolution ticket, child it, block.
- MEASURE the smallest obligation (the (z,w) lever) FIRST, before writing the full 4-form file.

## DISCIPLINE
PREREG (this) → isolated scratch probes (lake env lean; #print axioms appended) → production
Phys/Algebra/OctonionCoassociative4Form.lean (verify #print axioms ⊆ {propext,Classical.choice,
Quot.sound} vs built olean) → wire Phys.lean + Audits/AxiomAudit.lean (import at END, #print at END)
→ costume C242 (= 210, a DISTINCT pair) → commit production+wiring+costume BEFORE gate → gate bg
(notify_on_complete, poll log) → docs (LEDGER row + ROADMAP N210 LANDED + frontier) → child N211
onto chain tail (max_retries=25) → kanban_complete. STANDARD applied (unbroken/complete/words-removable).
