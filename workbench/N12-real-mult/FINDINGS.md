# N12 FINDINGS — ℝ field MULTIPLICATION on the derived-ℚ completion `Cut`

## INC-2 BANKED — the positive-cone multiplication + THE CAPSTONE
- `Phys/Foundation/ContinuumFieldMul.lean` (namespace `Phys.Foundation.ContinuumQ`).
- Compile cost: WHOLE file ~9s. Structurally LIGHT exactly as N11 predicted — NOT a
  W9-heavy node. A1 (pmul gather) 6s, A2 (capstone) 9s, all `nlinarith`/`induction`/
  `field_simp` on the derived ordered field. No maxHeartbeats inflation, no monolithic
  brute. KILL budget (90s/obligation) never approached.
- Foundations-only ⊆ {propext, Classical.choice, Quot.sound} (verified independently +
  D6). NO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}`; only `ContinuumField`
  (derived) + `Mathlib.Tactic` (machinery).

## KEY API NOW BANKED (for the N13 worker — CommRing/Field/inverse)
- `mulNonnegS x y q := q < 0 ∨ ∃ a b, 0≤a ∧ 0≤b ∧ x.S a ∧ y.S b ∧ q < a*b`
  (positive-cone product set) / `mulNonnegGather` (it's a gather, ALL x,y) / `pmul`
  (the cut) / `pmul_S` (simp unfold) / `pmul_comm`.
- `instMul : Mul Cut` — SIGN EXTENSION via banked negation + `LinearOrder Cut`:
  `if 0≤x then (if 0≤y then pmul x y else -(pmul x (-y))) else …`.
- `instOne : One Cut` (= `Qcut 1`). `mul_of_nonneg` (0≤x,0≤y ⟹ x*y = pmul x y).
- `sqrt2_S_nonneg` (0≤a ⟹ (sqrt2.S a ↔ a²<2)).
- `heron`/`heron_inv`/`heron_gap` (the Heron approach + geometric gap `(2/9)ⁿ`).
- ★ `sq_dense` (density of rational squares: 0≤q<2 ⟹ ∃c≥0, q<c²<2; the Archimedean
  eternal approach made load-bearing via `exists_pow_lt_of_lt_one`).
- ★★ `pmul_sqrt2_sqrt2` (`pmul sqrt2 sqrt2 = Qcut 2`) + `sqrt2_mul_sqrt2`
  (`sqrt2 * sqrt2 = Qcut 2`, field form) — THE CAPSTONE.
- Costume C30 `ContinuumFieldMulCapstoneCostume` bites (product cut contains 2 →
  rewrites pmul_sqrt2_sqrt2 → ⊢ (2:Q)<2).

## THE CONVENTION (critical for N13)
The sign extension uses `if 0 ≤ x` (decidable via banked `LinearOrder Cut` +
`Classical.decRel`). `0 = Qcut 0 = {q | q < 0}`. For x ≥ 0, the negative ray is the
"junk floor" of `pmul`; the real content is `∃ a,b ≥ 0`. NOTE: `pmul x y` for x or y
NEGATIVE does NOT compute the true product — that's what the sign extension is for.

## N13 — THE REMAINING WORK (CommRing/Field/inverse → childed)
Gauged in this run (workbench/N12-real-mult/scratch/a3_conelaws.lean,
a4_assoc.lean): cone associativity + the ring laws PROVE but are a genuinely
separate large increment (the sign-cased distributive law `left_distrib` is the
classically heaviest Dedekind-reals law — sign cases × the additive gather).
Sequenced for N13:
1. CONE LAWS: `pmul_assoc_cone` (gauged dir-1 closes cleanly via `nlinarith`;
   dir-2 symmetric), `pmul_one_cone` (`pmul x (Qcut 1) = x` for x≥0), distributivity
   on the cone `pmul x (y+z) = pmul x y + pmul x z` for x,y,z≥0 (USE the banked
   `add_S` + `mulNonnegS`; the positive cone keeps it tractable — reframe through
   the trunk's positivity, do NOT coordinate-bash).
2. SIGN EXTENSION of each law (cases on sign via `LinearOrder Cut` + banked `negS`;
   `|x| = max x (-x)` from the lattice). Helper `exists_pos_mem` (x≥0, x≠0 ⟹ ∃a>0,
   x.S a) is drafted in a3_conelaws.lean — recover it.
3. `CommRing Cut` (combine cone laws + sign extension + banked `addCommGroup`).
4. INVERSE of a positive cut: `(x⁻¹).S q := q ≤ 0 ∨ ∃ r, ¬x.S r ∧ 0 < r ∧ q < 1/r`
   (the multiplicative SWAP one level up, mirroring N9's inverse = swap q/p);
   `mul_inv_cancel` for positive cuts; extend by sign ⟹ `Field Cut`.
5. `IsStrictOrderedRing Cut` (`mul_pos` from the positive-cone product). Then
   `[Field Cut][LinearOrder Cut][IsStrictOrderedRing Cut]` = ℝ as a linearly
   ordered field with the lub property (banked `completion_coherence_closed`).
When N13 lands AND the N2 `ComplexUnit` ℝ-scaffolding is discharged, the ⚠
NUMBER-TOWER/CONTINUUM gate flips RESOLVED.

REFRAME-FIRST reminder (THE ONE LAW): the positive cone is where Born = self-overlap
positivity lives; distributivity should be ATTACKED THROUGH the cone + the banked
additivity, never coordinate-bashed. If it "fights", the cut shape / positivity
framing is wrong, NOT the theory. Do NOT reach for Mathlib's `Real`. NO posit, NO
bridge. This construction is LIGHT (~9s/file) — if it stops being light, the framing
is wrong (W9 = THE ONE LAW).
