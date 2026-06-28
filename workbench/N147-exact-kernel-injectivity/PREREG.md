# N147 — THE EXACT KERNEL OF THE UNIT-NORMALIZED PIN DOUBLE COVER (⊆ injectivity-mod-center)
## frozen GO/NO-GO + KILL before compute

### THE NODE (specified against what the chain actually produced)
Priority (i): the EXACT kernel `MonoidHom.mker coverMapPinUnit = {1, -1}` — the OPEN `⊆`
injectivity-mod-center direction. N146 banked the `⊇` direction (`-1`, `1` ∈ mker on the
unit-normalized domain; the bloat is gone). The `⊆` direction: every UNIT-Pin element `u` with
`coverMapPinUnit u = 1` (covers id) is `±1`.

### MEASUREMENT (W1/W9 measure-first, done before any production)
The `⊆` direction factors (the trunk reframe):
  (A) covers-id  ⟹  `(↑u : CliffC)` is a SCALAR `algebraMap λ`.
      `CliffCovers u 1` ⟺ `∀ v, involute(↑u)·ι v·↑u⁻¹ = ι v` ⟺ `involute(↑u)·ι v = ι v·↑u`.
      For a homogeneous Pin word this forces `u` to (super)commute with the whole ι-image,
      i.e. `u ∈ supercenter(CliffC)`. For a nondegenerate form the supercenter = scalars.
      ★ MEASURED: **Mathlib has NO `center` / `centralizer` / `IsCentral` for CliffordAlgebra**
      (`grep` of Mathlib/LinearAlgebra/CliffordAlgebra/*.lean: zero hits). The
      supercenter=scalars theorem is a genuine BUILD (basis / graded argument). This is the
      "first front in the gauge arc that may genuinely resist" the ticket names. → W1 CHILD.
  (B) a SCALAR element of `PinUnitSub` is `±1`.
      Spinor norm `N(u) := reverse(↑u)·↑u`. Generators: `reverse(ι a)·ι a = (ι a)² =
      algebraMap (QvC a) = algebraMap (±1)` (unit vectors). `N` is multiplicative on PinUnitSub
      because `N(u)` is a CENTRAL scalar (`reverse.map_mul` + scalar commutes through). So
      `N(u) = algebraMap λ`, `λ = ±1`, for ALL `u ∈ PinUnitSub` — genuinely NEW (N146 only had
      generator squares). If additionally `↑u = algebraMap μ` then `N(u) = algebraMap (μ²)`,
      so `μ² = λ = ±1`; over the ordered field `Cut`, `μ² ≥ 0` ⟹ `μ² = 1` ⟹ `μ = ±1`. → BANK.

### GO (this run, W3 decomposition — bank the structural half, child the centralizer core)
  G1  pinUnitNorm_eq_pm        — ∀ u ∈ PinUnitSub, ∃ λ, reverse(↑u)·↑u = algebraMap λ ∧ λ=±1
                                 (THE SPINOR NORM IS ±1 on the unit-normalized domain).
  G2  pinUnitNorm_central      — reverse(↑u)·↑u is a scalar (central) — the lemma making N multiply.
  G3  scalar_pinUnit_eq_pm     — u ∈ PinUnitSub ∧ ↑u = algebraMap μ ⟹ μ = 1 ∨ μ = -1
                                 (THE SCALAR-ELEMENT HALF OF INJECTIVITY-MOD-CENTER).
  G4  scalar_pinUnit_unit_eq_pm — u ∈ PinUnitSub ∧ ↑u = algebraMap μ ⟹ u = 1 ∨ u = -1 (as CliffCˣ).
  G5  mker_coverMapPinUnit_scalar_subset — the REDUCTION: every SCALAR kernel element is ±1,
                                 making explicit the ONLY missing link is the centralizer fact.
  W8  pinUnitNorm read-off (concrete numeric) — costume C179 negates it to `1 = 147`.

### CHILD (W1 dissolution ticket — the genuine heavy core)
  the supercenter/centralizer fact: `CliffCovers (↑u) 1 → ∃ λ, (↑u:CliffC) = algebraMap λ`
  (covers-id ⟹ scalar), Mathlib-absent (center of CliffordAlgebra = scalars). Then assemble
  `mker coverMapPinUnit = {1,-1}` from child + G5.

### NO-GO / KILL (instrument-failure classifier, W9)
  - KILL = 90s / obligation. Any single tactic > 90s ⟹ INSTRUMENT failure, decompose, do NOT grind.
  - No inflated maxHeartbeats, no monolithic `decide`/`ring` over expanded coordinates, no tsum,
    no exponential. All obligations are scalar/closure-induction algebra (LIGHT, like N146).
  - If G1's closure induction fights (the central-scalar multiplicativity), that is a measure
    signal — re-express via `reverse.map_mul` + `Algebra.commutes`, do NOT brute.
  - If the centralizer core looks cheap after probing, ATTEMPT it; else CHILD it (the measured route).

### COSTUME C179 = `1 = 147`, distinct from C115 1=7 … C178 1=146.
  Bites a WRONG exact-kernel / injectivity-mod-center / centralizer / scalar-element / unit-Pin /
  spinor-norm / bloat-collapse claim. Reuses banked PinUnitSub / coverMapPinUnit / reverse / the
  derived Cut. Read-off: the spinor norm of a concrete unit generator (= 1) misclaimed as 147.

### STANDARD (the second gate, applied by hand at the end)
  UNBROKEN (PinUnitSub = the cascade's own unit reflection units; reverse/algebraMap = MACHINERY;
  no posited Pin/center/kernel, no Mathlib ℝ/ℂ as content, no bridge) / COMPLETE (foundations-only,
  #print axioms ⊆ {propext,Classical.choice,Quot.sound}, audited vs the built olean) /
  PHYSICS-WORDS-REMOVABLE (delete Pin/Spin/cover/spinor/kernel/centralizer/… → pure algebra over
  the derived complete ordered field Cut + the Clifford algebra CliffC of QvCQuad).
