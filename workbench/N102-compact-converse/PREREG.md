# N102 PREREG — THE CONVERSE GENERATION ON THE COMPACT (ROTATION) SECTOR

Frozen BEFORE compute. Node t_5b9378c8 (parent N101 t_a3242600). Priority (i): the
immediately-bankable, NO-topology structural piece — the DUAL of N101.

## THE TARGET (priority (i), reframed through the trunk)
N101 closed the converse on the BOOST (non-compact) sector: a proper boost `g` is its own
POSITIVE part (`g* = g`, positive-semidefinite), so its polar/KAK compact part `k = id`.

N102 closes the converse on a CONCRETE COMPACT (rotation) generator — the DUAL collapse:
a two-sided HALF-TURN `g := biMulLin u u` (unit-imaginary `u`, `u·u = −1`) is

  • a `QvC`-isometry        (`biMulFun_isom`, the v-block preserves `gFormC` via `biMul_gFormC`),
  • EvC-SELF-ADJOINT        (`IsEvCAdjoint g g` — it preserves the EvC bilinear form and is an
                             involution, so adjoint = inverse = itself), and
  • an INVOLUTION           (`g∘g = id`, `biMulFun_imag_involutive`, `u·((u·(v·u))·u) = v`),
                             but NOT positive-semidefinite (it negates the 2-plane `span{1,u}`).

So `g*∘g = g∘g = id`: the polar positive part `p = id`, hence `p^{1/2} = id`,
`(p^{1/2})⁻¹ = id`, and the compact part collapses the OTHER way from the boost:

    k := g∘(p^{1/2})⁻¹ = g∘id = g  ITSELF,

a NONTRIVIAL rotation that IS a single two-sided generator `biMulLin u u ∈ genIsomMonoidLin`,
whence by the N100 transport `endToFunEnd k ∈ genIsomMonoidC2`. THE CONVERSE GENERATION
`qvIsomMonoidC ≤ genIsomMonoidC2` discharged on a CONCRETE genuinely-COMPACT (rotation)
generator, with NO operator topology.

The deep structural content (genuinely NEW, the DUAL of N101's boost collapse): a pure rotation
(half-turn) carries ZERO boost content — it IS its own compact part (`k = g`), NONTRIVIAL,
exactly the opposite of the boost which contributes `k = id`. KAK `g = k·p` with `p = id` for the
pure-orthogonal (rotation) factor.

## GO / NO-GO (measured BEFORE committing production)
GO if ALL of these compile clean in a bounded probe (each obligation < 30s; KILL at 90s):
  (M1) `IsQvIsomC (biMulLin u u)` for `gFormC u u = 1`        [from biMulFun_isom, defeq]
  (M2) `(biMulLin u u).comp (biMulLin u u) = LinearMap.id`     [the involution at linear level]
  (M3) `IsEvCAdjoint (biMulLin u u) (biMulLin u u)`            [EvC-self-adjointness — the new octonion
                                                                identity `gFormC (u·(v·u)) (u·(w·u)) = gFormC v w`
                                                                polarizing `biMul_gFormC`, OR isometry+involution]
  (M4) the assembly: compact part `k = biMulLin u u` via `isometry_compact_part_isQvIsom` + op-sqrt
       uniqueness on the injective `id` (positive part `g*∘g = id`).

NO-GO / DECOMPOSE if (M3) the EvC-self-adjointness resists after the polarization + the
isometry+involution reframe: bank (M1)+(M2)+(M4-partial as far as it goes), child the
self-adjointness as a dedicated octonion-identity dissolution lemma.

## KILL (W9 instrument budget)
- Per-obligation compile KILL = 90s. If any single obligation exceeds 90s → INSTRUMENT failure,
  measure/decompose, do NOT grind. (Predecessors N43–N51 timed out on monolithic gate ceremony;
  N52–N101 landed clean by banking-as-you-go. The gate D5/D6 run in BACKGROUND.)
- If (M3) needs a coordinate `ring`-bash over a fully-expanded octonion product that blows up →
  W9: reframe via the abstract isometry+involution⟹self-adjoint route (no coordinate expansion),
  or via polarized `biMul_gFormC`. Never a monolithic brute.

## COSTUME (W8 teeth) — id C134
A WRONG compact-sector converse claim reduces to a false numeric DISTINCT from C115 1=7 … C133 1=31.
Candidate: the concrete half-turn `biMulLin e₂ e₂` compact part = `g` itself negates the real axis
`(0,0,1) ↦ (0,0,−1)`, deep coord `re.re.re = −1`; a bogus value (e.g. 37) forces `−1 = 37`.

## PHYSICS-WORDS-REMOVABLE
Delete "rotation/half-turn/boost/isometry/compact/polar/KAK/orthogonal/Spin/SO(9)/Lorentz/
involution/generator/generation/2-plane/positive part/square root": what remains is pure linear
algebra over the derived `Cut` + `O Cut` — the `Cut`-linear operator `v ↦ u·(v·u)` (`gFormC u u=1`,
`u·u=−1`) is EvC-self-adjoint and squares to `LinearMap.id`, so its composition with the
inverse-spectral-root of its square (= itself, since the square is `id`) equals itself, a member of
the generated submonoid `genIsomMonoidLin`, whose `endToFunEnd`-image lies in `genIsomMonoidC2`.
