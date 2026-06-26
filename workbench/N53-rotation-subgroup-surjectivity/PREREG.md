# N53 PREREG — THE ROTATION ONE-PARAMETER SUBGROUP (compact mirror of N52 boost) + KAK surjectivity scope

FROZEN before compute. GO/NO-GO + KILL.

## NODE SPEC (specified against what the chain ACTUALLY produced)
N52 banked the BOOST one-parameter subgroup `boostOPS ≤ qvIsomMonoidC` — the hyperbola group
`(a,b)·(a',b')=(aa'+bb',ab'+ba')`, the finite exp-poly in `boostGenC`. N53 builds its COMPACT
SIBLING: the ROTATION one-parameter subgroup around a fixed imaginary unit, the CIRCLE group.

### THE W1 REFRAME (the key insight)
The naive rotation composition `rotFunC u ∘ rotFunC u' = rotFunC (u·u')` FAILS for generic
octonionic `u,u'` by NON-ASSOCIATIVITY (`u·(u'·v) ≠ (u·u')·v`). BUT the genuine one-parameter
SUBGROUP iterates a SINGLE imaginary unit `a`, staying inside the associative subalgebra ℝ⟨a⟩.
There the associator vanishes by ALTERNATIVITY — banked as `L_sq_imag`/`scaling_law` (Operator.lean):
for imaginary `a`, `a·(a·v) = −(ι(Nrm a)·v)`, and when `a` is a unit (`Nrm a = 1`) this is
`a·(a·v) = −v` (the operator relation `L a² = −1`, banked concretely as `L_unit_sq`).

The circle generator: `rotCircFun a c s : (t,x,v) ↦ (t,x, c•v + s•(a·v))`. This is `exp(θ·rotGen_a)`
re-grounded: the would-be transcendental `cos θ • v + sin θ • (a·v)` becomes the ALGEBRAIC circle
point `(c,s)` with `c²+s²=1` — exactly as N52 dissolved the rapidity into the hyperbola point.
NO transcendental cos/sin, NO Mathlib ℝ. The compact mirror of N52's hyperbola.

## THE TWO FRONTS
(i) ROTATION ONE-PARAMETER SUBGROUP (BANKABLE — the compact mirror, the deliverable):
   - `rotCircFun_comp`: ★★ THE COMPOSITION LAW (one-parameter-subgroup law):
       `rotCircFun a c s ∘ rotCircFun a c' s' = rotCircFun a (c*c'−s*s') (c*s'+s*c')`
       under the hypothesis `∀ v, a·(a·v) = −v` (the unit-imaginary operator relation).
       The associativity subtlety DISSOLVED via the single-unit alternative subalgebra.
   - `circParam_circle_mul`: ★ THE CIRCLE CLOSURE `(cc'−ss')²+(cs'+sc')² = (c²+s²)(c'²+s'²)` (pure ring).
   - `rotCircFun_one`: identity `rotCircFun a 1 0 = id`.
   - `rotCircFun_inv`: inverse `(c,−s)` on the unit circle.
   - `rotCircFun_eq_rotFunC`: `rotCircFun a c s = rotFunC (c•1+s•a)` (connect to banked N50).
   - `rotCircFun_isom` / `rotCircOPS` (Submonoid) / `rotCircOPS_le_isom ≤ qvIsomMonoidC`:
       the ISOMETRY via banked `rotC_isom` (needs `gFormC (c•1+s•a)(c•1+s•a)=1`).
   - `aUnit` concrete: `a = e₂ : O Cut` (banked `unit_imag`/`Nrm_unit`/`L_unit_sq` over ℚ → re-ground
       over Cut) gives `a·(a·v)=−v` and `gFormC a a = 1`; W8 non-vacuity `rotCircOPS_ne_bot`.

(ii) THE HEAVY KAK FINITE-PRODUCT SURJECTIVITY onto SO⁺(1,9) — deep global Lie theorem
   (polar decomposition + connectedness + topology over derived ℝ; Mathlib has NO SO⁺(1,9)).
   PLAN: if it resists after measure+reframe → honest W1 DISSOLUTION TICKET + child (NOT a grind).
   Bank (i), child (ii). Decomposition is the expected outcome (matches N49/N50/N51/N52 pattern).

## GO / NO-GO
GO if: the composition law `rotCircFun_comp` compiles foundations-only via the alternative law,
AND the isometry connects to banked `rotC_isom`, AND C84 bites a WRONG composition claim.
NO-GO (→ block / dissolution ticket) if: the composition law genuinely resists (it should NOT —
it is pure smul-algebra + one banked operator relation).

## KILL / COMPILE-COST BUDGET (W9)
- Each lemma must compile in the CACHED build (~8-14s aggregate). No `maxHeartbeats` inflation above
  default beyond the ONE 4000000 already in the banked Operator.scaling_law (which we IMPORT, not re-run).
- KILL THRESHOLD: if any single new lemma's isolated `lake env lean` probe exceeds ~90s OR needs a
  monolithic `ring`/`simp` over fully-expanded O Cut coordinates → STOP, decompose via smul-algebra
  lemmas (smul_mul, distribution) each banked separately. Do NOT inflate heartbeats.
- The composition proof MUST be structural (smul module axioms + `L_sq_imag`), NEVER a coordinate
  `ext <;> simp <;> ring` over the 8-real-component O Cut expansion (that is the W9 smell).

## ANTI-TIMEOUT (W9): bank-as-you-go. The instant `rotCircFun_comp` compiles → production file
`Phys/Algebra/LorentzContinuumRotationSubgroup.lean` + wire (Phys.lean + AxiomAudit.lean import at
END of import list + #print axioms block) + COMMIT, BEFORE the isometry/KAK. Gate in BACKGROUND.

## W8 COSTUME C84
Bite the WRONG composition claim: that `rotCircFun a c s ∘ rotCircFun a c' s' = rotCircFun a (c*c'+s*s') ...`
(WRONG sign — the EUCLIDEAN/boost `+` instead of the circle `−` on the cc'−ss' coefficient), OR that
the naive `rotFunC u ∘ rotFunC u' = rotFunC (u·u')` holds at a concrete NON-associating octonion triple.
The wrong claim MUST fail to compile, reducing to a false numeric.

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/boost/rotation/Spin/SO⁺(1,9)/SO(9)/isometry/cover/generator/one-parameter/circle/
compact/KAK/Cartan": what remains is pure math over the derived complete ordered field Cut and the
CD-double³ O Cut — the Cut-maps (t,x,v)↦(t,x,c•v+s•(a·v)) with a·(a·v)=−v form a submonoid of
Function.End(Cut×Cut×O Cut) under composition with law (c,s)(c',s')=(cc'−ss',cs'+sc'), contained in
the QvC-preservers when c²+s²=1 and gFormC a a=1.
