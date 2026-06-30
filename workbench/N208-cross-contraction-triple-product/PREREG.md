# N208 PREREG — THE 7-DIM CROSS-PRODUCT CONTRACTION (VECTOR TRIPLE-PRODUCT) IDENTITY

## Frozen BEFORE compute.

### Front chosen (W4.5 widest, W9 measure-first)
Front (b) from the ticket: **the contraction / vector-triple-product identity for `octCross`**.
Over the derived ℚ and the octonion rung `O ℚ = CD (H ℚ)`, for imaginary `x, y ∈ ImO`:

    octCross x (octCross x y) = (gForm x y) • x − (gForm x x) • y

This is the *contracted* double-cross identity (the 7-dim analogue of `x×(x×y) = ⟨x,y⟩x − ⟨x,x⟩y`).
NOTE: the FULL BAC-CAB rule `a×(b×c)=⟨a,c⟩b−⟨a,b⟩c` FAILS in 7 dimensions; only this contracted
`x,x,y` case survives — and it survives *precisely because of LEFT ALTERNATIVITY*
`x·(x·y)=(x·x)·y` (`mul_mul_left`, N5b). That is the genuinely-new joint.

### Why GENUINELY NEW (not a re-pin / not mechanical) — MEASURE-FIRST verdict
- DIFFERENT OBJECT/degree from N206: N206's `octCross_lagrange` is a degree-2 SCALAR norm identity
  (`gForm(x×y)(x×y) = …`). THIS is a degree-3 VECTOR identity (a vector equation in `O ℚ`).
- DIFFERENT LEVER: N206 routed entirely through the Born composition law `gForm_comp`. It NEVER
  used alternativity. THIS identity is forced by `mul_mul_left` (LEFT ALTERNATIVITY, N5b) + the
  imaginary minimal polynomial `x·x = −(gForm x x)•1` (from `selfMul_eq_smul`) + the orthogonality
  `gForm x (octCross x y) = 0`. NEW connection N206 (cross product) ↔ N5b (alternative laws).
- NOT N205's Jacobiator (that is the full-algebra commutator on ALL of `O`; this is the imaginary
  vector product, contracted).
- NOT trivial-from-associativity: `O ℚ` is non-associative; the contraction holds ONLY because the
  alternating x,x,y associator vanishes (`alt_left`/`mul_mul_left`), while the generic triple does
  not. If `O ℚ` were associative OR if we used a generic `octCross a (octCross b y)`, this would not
  reduce. The whole point is the x=x coincidence triggers alternativity.

### Derivation skeleton (all levers BANKED)
1. `reQ_ImO_zero`  : `x ∈ ImO ⟹ reQ x = 0`            (trace_id + smul_eq_zero + one_ne_zero_O)
2. `octSq_ImO`     : `x ∈ ImO ⟹ x*x = (−gForm x x)•1` (selfMul_eq_smul + star x = −x)
3. `octMul_x_octCross` : `x ∈ ImO ⟹ x·(octCross x y) = (gForm x y)•x − (gForm x x)•y`
                         (mul_add + mul_mul_left[N5b] + octSq_ImO + qsmul_mul_left/right)
4. `gForm_x_octCross`  : `x,y ∈ ImO ⟹ gForm x (octCross x y) = 0`
                         (octCross x y ∈ ImO so star = −; reduces to reQ of step 3 = 0 by step 1)
5. `octCross_contraction` (HEADLINE): outer octCross unfolds to (step 3) + (step 4 = 0)•1.
6. W8 teeth: `octCross_contraction_witness : octCross u1 (octCross u1 u2) = −u2`
   (gForm u1 u2 = 0 N206, gForm u1 u1 = 1 SpinorRotation), `_witness_coord = −1`, `_witness_ne_zero`.

### GO / NO-GO
- GO iff probe compiles `lake env lean` clean, foundations-only, and the witness is GENUINELY
  nonzero (octCross u1 (octCross u1 u2) = −u2 ≠ 0).
- NO-GO / REJECT iff: (a) the identity is actually a mechanical consequence of `octCross_lagrange`
  alone (it is not — Lagrange is scalar, this is vector and needs alternativity); (b) the witness
  is zero/vacuous; (c) it secretly re-pins N206/N205.

### KILL (W9)
- KILL = 90s / obligation, 2_000_000 heartbeats / obligation. Each sublemma must close cheaply
  (coordinate work only in the witness teeth, via norm_num after simp). If any obligation
  approaches KILL, STOP, do NOT inflate — it is an instrument signal; decompose/reframe.
- Expected: a LIGHT node (no 8-coordinate expansion in the structural lemmas; all algebraic).

### Costume (next id C240)
`octCross_contraction_witness_coord` GENUINELY = −1; a WRONG claim (the contraction fails / the
double-cross does not contract / coefficient wrong) forces `−1 = 208` in ℚ. ERE `-1 = 208` →
use signature `1 = 208` matched on the RHS side, pair (208, −1) fresh, LHS 208 distinct from all
prior. PASS_SIGNATURE ERE avoids leading `-`: use `= 208` style.

### Anti-vacuity
The witness `octCross u1 (octCross u1 u2) = −u2` with `(−u2).re.im.re = −1 ≠ 0` proves the map is
genuinely nontrivial; the contraction reproduces a NONZERO imaginary unit, not `0=0`.
