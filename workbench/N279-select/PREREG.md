# N279 PREREG — THE WEAK-ISOSPIN FUNDAMENTAL DOUBLET OF MATTER = THE LEFT-REGULAR
# QUATERNION ACTION ON THE SPINOR, CONFINED TO THE LAST ASSOCIATIVE RUNG BY THE
# CASCADE-STOPPING ASSOCIATOR

## THE TARGET (one definitive node, gather-native, method-lock lifted)

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)` (the terminal cascade algebra) and its matter
SPINOR structure (`leftReg`, N261): the three left-regular multiplication operators of the
last-doubled quaternion imaginary units `hI=u1, hJ=e2O, hK=e3O` (the imaginary part of the
associative subalgebra `H ⊂ O`) realize the weak-isospin su(2)_L in its FUNDAMENTAL (spin-½
doublet) representation on the matter spinor — and this realization CLOSES exactly on the last
ASSOCIATIVE rung H and is OBSTRUCTED on the non-associative O by exactly the banked associator
(the gather gluing obstruction, N219/N262), which vanishes on H and acts only on Hℓ.

This is the FUNDAMENTAL/DOUBLET realization of su(2)_L, DISTINCT from N277's ADJOINT/TRIPLET
realization (`imRep DI/DJ/DK` = derivations on the vector-7 ImO). N277: derivations, adjoint,
3⊕1⊕3 on the vector-7. N279: left-regular, fundamental, spin-½ doublet on the 8-dim matter
spinor `O ℚ`, confined by the cascade stop.

## THE FORCED FACTS (numerically verified, workbench/N279-select/probe_confirm.py, EXIT 0)

Let `lregI := leftReg u1M`, `lregJ := leftReg e2I`, `lregK := leftReg e3I` (= L_{hI}, L_{hJ},
L_{hK} on `O ℚ`, ℚ-linear endomorphisms; `leftReg a y = a * y`, banked N261).

1. THE OBSTRUCTION IDENTITY (the headline): for the H-imaginary units,
     `⁅lregI, lregJ⁆ - 2•lregK = -2 • assocMap hI hJ`
   where `assocMap a b := (y ↦ assoc a b y = (a*b)*y - a*(b*y))` is the banked associator
   (Alternative.lean `assoc`). Cyclically for (J,K)→I and (K,I)→J.
   • `⁅L_a, L_b⁆ y = (a*b)*y - a*(b*y) - ((b*a)*y - b*(a*y))`; using `a*b = -b*a + …` on
     imaginary units and left-alternativity, this reduces to `2 assoc a b y` corrections.
     ACTUALLY: `⁅L_a,L_b⁆ - L_{[a,b]}` where `[a,b]=a*b-b*a`. For imaginary units `a*b-b*a =
     2(a*b)` when `gForm a b = 0` (orthogonal), and `a*b = octCross a b` imaginary. For (hI,hJ):
     `hI*hJ = hK` so `[hI,hJ] = 2hK` and `L_{[hI,hJ]} = 2 L_{hK} = 2 lregK`.
   • The obstruction `⁅lregI,lregJ⁆ - 2 lregK = -2 assocMap hI hJ` — an operator identity;
     PROVE by `LinearMap.ext`, evaluate at `y`, reduce both sides to octonion products, close
     by the banked `assoc` def + alternative laws OR by direct `ext <;> simp` coordinate compute
     (8-dim, the H-unit table is banked: JO_e2, JO_e3, etc.).

2. CLOSURE ON H (the DOUBLET): on the associative subalgebra `H ⊂ O` (`Submodule.map iotaO ⊤`
   or the concrete `HsubO = span{1,u1,e2O,e3O}`), `assoc hI hJ y = 0` for `y ∈ H` (banked
   `iota_mul` ForcedStop.lean makes H an associative subalgebra ⟹ associator vanishes), so
     `⁅lregI, lregJ⁆ = 2 lregK` on H  (and cyclically) — the su(2) closes.
   THE CASIMIR = spin-½: `lregI² + lregJ² + lregK² = -3 • id` on ALL of `O ℚ`
   (each `lreg_?² = -id` by `leftReg_sq` with `gForm hI hI = 1`; sum = -3•id).
   The value -3 = -(j(j+1))·(2)²·… → the spin-½ DOUBLET certificate (contrast N277's Casimir
   -8 = the adjoint triplet on the vector-7).

3. THE OBSTRUCTION IS GENUINE (W8): `assocMap hI hJ ≠ 0` (banked `assoc_nonvanishing` gives a
   nonzero associator witness), so `⁅lregI, lregJ⁆ - 2 lregK ≠ 0` on `O ℚ` — the su(2) does NOT
   close on the full spinor; the fundamental doublet is CONFINED to the associative rung.
   And the obstruction VANISHES on H (item 2) but acts only on Hℓ (probe_confirm: obstruction
   maps Hsub→0, Hℓ→Hℓ).

4. THE ONE-CAUSE JOINT: the associator `assoc hI hJ` obstructing the doublet's extension IS the
   SAME non-associativity that (a) STOPS the cascade (N2c, O non-associative / S loses division),
   (b) caps generations at 3 (N5), (c) blocks the second chirality (N264, mixed commutator =
   associator). So: the weak DOUBLET exists (closes on H) AND is confined (obstructed on O) by
   ONE cause — the cascade-stopping associator. ★3 ↔ ★15/cascade-stop ↔ ★6/chirality joint.

## CAPSTONE
`weak_doublet_leftregular_structure` bundling: the obstruction identity (all three cyclic legs)
∧ closure-on-H (the su(2) bracket relations hold on H) ∧ the Casimir = -3•id ∧ the obstruction
genuine (≠0 on O, W8) ∧ the obstruction = the banked associator ∧ (optionally) the octonion cap
tie (`jordan_cap_pinned_at_three` or `cap_forces_nonassoc`) making it NON-carrier-agnostic.

## BANKED INGREDIENTS (all confirmed present, grep 0 for the new names)
- `leftReg : ImO →ₗ[ℚ] Module.End ℚ (O ℚ)`, `leftReg_apply` (= a*y), `leftReg_sq`
  ((leftReg a)² = -(gForm a a)•id) — N261, TowerWorldMapCliffordModule.lean.
- `assoc x y z := (x*y)*z - x*(y*z)`, `assoc_swap12/23`, `alt_left/right`, `assoc_nonvanishing`,
  `assoc_witness_coord` — Alternative.lean.
- `iota_mul` (CD embedding multiplicative ⟹ H associative subalgebra) — ForcedStop.lean.
- H-unit multiplication table: `JO_e2` (u1*e2O=e3O), `JO_e3` (u1*e3O=-e2O), the rest by
  `ext <;> simp [u1,e2O,e3O]` (banked convention); `gForm_u1 = 1`, `gForm u2 u2 = 1`.
- `u1M, e2I, e3I : ImO` — TowerGatherIsospinMultiplet / TowerGatherJointChargeIsospinWeights.
- Cap tie: `cap_forces_nonassoc` (JordanTower.lean), `jordan_cap_pinned_at_three`.

## W9 COST-PLAN (measure-first, KILL bound)
- The operator identities are ℚ-linear-map equalities on `O ℚ` (8-dim). Route A: `LinearMap.ext`
  + reduce to octonion products + banked `assoc`/alternative laws (structural, cheap). Route B:
  `ext <;> simp [octonion coordinate defs] <;> ring` (coordinate, 8 coords × Dbl/CD nesting —
  moderate but bounded; the H-unit sub-table is what N277/N278 used and compiled in ~25s).
- KILL BOUND: any single obligation exceeding ~60s in a bounded probe ⟹ STOP, decompose into
  per-basis-vector lemmas (the N277/N278 pattern: prove action on each of u1M/e2I/e3I/e4I…
  separately, assemble). NO maxHeartbeats proof-search raise beyond the standard synthInstance
  ceiling (instance-search only, N256 precedent). NO native_decide.
- MEASURE FIRST: scratch-probe the obstruction identity for the (I,J) leg on `O ℚ` standalone
  BEFORE promotion; if it compiles EXIT 0 in <60s, promote; else decompose per-basis.
- Prefer STRUCTURE: use `leftReg_sq` for the Casimir (no coordinate bash); use banked `assoc`
  def + `iota_mul`/alternative for the obstruction (reframe through the trunk, W1 step 2).

## COSTUME PLAN (C310)
`⊢ -3 = 310` (or `⊢ 3 = 310`), biting at the DOUBLET Casimir scalar `lregI²+lregJ²+lregK² =
-3•id` — the spin-½ certificate. A WRONG reading (that the left-regular units give a triplet /
the Casimir is not -3 / the doublet collapses) reduces through the banked Casimir value to the
false numeric. Pair (310, -3 or 3) fresh, RHS 310 distinct from every prior. Confirm it BITES
(wrong value must fail to compile).

## STANDARD CHECK (pre-committed)
- UNBROKEN: every object (leftReg, assoc, u1/e2O/e3O, iota_mul, gForm) derives to banked
  ancestors back to the fold; nothing posited; Mathlib only as machinery (LinearMap, End).
- COMPLETE: all decls foundations-only [propext, Classical.choice, Quot.sound]; no sorry/axiom/
  native_decide; independent mini-audit vs built olean + gate D6-fast.
- PHYSICS-WORDS-REMOVABLE: delete isospin/doublet/spin-½/weak/matter/generation → a pure
  theorem about the three left-multiplication operators of the imaginary units of the associative
  subalgebra H ⊂ O ℚ: they satisfy ⁅L_a,L_b⁆-2L_c = -2 assoc(a,b,·), which vanishes on H (su(2)
  closes there, Casimir -3•id) and is nonzero on O (banked associator). Octonion-SPECIFIC (the
  closure/obstruction split IS the associative/non-associative boundary). NOT free-floating:
  types mention banked leftReg/O ℚ/assoc/u1M/e2I/e3I.

## SCOPE (do NOT overclaim)
Banks: the left-regular fundamental su(2)_L doublet realization + closure-on-H + Casimir=-3 +
the obstruction-is-the-associator + the confinement + the one-cause tie to the cascade stop
ONLY. NOT: the hypercharge NORMALIZATION / mixing angle (★2, ceiling STANDS — probed fresh, REAL,
Q∉span{T3,Y}, [Q,Y]≠0 on the vector-7; childed nothing toward it); NOT the full electroweak
su(2)⊕u(1) Lie action on the carrier (a different, adjoint front); NOT parity VIOLATION (which
hand couples — ★6 stays a germ); NOT masses/mixings (★5); NOT "= a specific SM multiplet"
(removable prose).
