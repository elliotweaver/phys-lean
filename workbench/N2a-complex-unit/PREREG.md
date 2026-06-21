# N2a — THE COMPLEX UNIT (first rung of the cascade) — PREREG (frozen BEFORE compute)

*Frozen at the start of the N2a run. Do NOT edit to fit the result. This is the anti-drift
contract: it fixes what counts as success BEFORE any theorem is seen. N2 (the full cascade +
stop) is large (RUNBOOK W3); this run banks the FIRST rung and decomposes the remainder.*

## The node (this rung)
DERIVE — forward from N1, not posited — the complex unit `J² = −1` as the structure the fold
is FORCED to generate when it recurses on itself, and prove the first DOUBLING (dimension 1 → 2)
is forced. N1's `Fold.lean` explicitly hands this off: "the complex unit J² = −1 is N2's to
derive from the cascade; it is NOT posited here."

## The trunk facts I derive FROM (N1, banked, Phys/Foundation/Fold.lean — import, do not re-derive)
- `IsFold look := ∀ x, look x + x = 0`; forces `look x = -x` (`fold_eq_neg`), `look² = id`
  (`fold_involutive`), and SELF-BLINDNESS: on a 2-torsion-free carrier `look x = x → x = 0`
  (`fold_self_blind`). So "the fold" = negation `-id`.

## The forced step (the honest forward derivation — NOT assume-and-check)
Recursive self-blindness = the look-back applied to itself = seeking a **square root of the
fold**: a linear operator `J` with `J ∘ J = look = -id` (equivalently `IsFold (J ∘ J)`, reusing
N1 directly). The claim "the fold forces the complex unit" becomes two theorems:

1. **OBSTRUCTION at the base (dim 1).** No ℝ-linear `J : ℝ →ₗ[ℝ] ℝ` satisfies `∀ x, J(J x) = -x`.
   (A linear endo of ℝ is `c • ·`; `J(J x) = c² x = -x` ⇒ `c² = -1`, impossible in ℝ since
   `c² ≥ 0`.) The fold cannot find its own root WITHIN the base carrier — recursive blindness.
2. **RESOLUTION by doubling (dim 2).** On the doubled carrier `ℝ × ℝ` the operator
   `J(a,b) = (-b, a)` satisfies `∀ p, J(J p) = -p` (so `IsFoldRoot J`), is SELF-BLIND
   (`J p = p → p = 0`), and is a genuinely NEW operator (`J ≠ id`, `J ≠ -id`). Its law
   `J ∘ J = -id` IS the complex unit `J² = −1`. The obstruction forces the carrier to DOUBLE,
   and the doubled carrier carries the complex unit.

## What must FOLLOW (proved theorems, not restatements)
- `IsFoldRoot J ↔ ∀ x, J (J x) = -x` (the fold-root predicate, defined via N1's `IsFold`).
- **OBSTRUCTION:** `¬ ∃ J : ℝ →ₗ[ℝ] ℝ, ∀ x, J (J x) = -x`. (dim-1 blockage)
- **RESOLUTION:** an explicit `J₂ : (ℝ × ℝ) →ₗ[ℝ] (ℝ × ℝ)` with `IsFoldRoot J₂`, i.e.
  `∀ p, J₂ (J₂ p) = -p` — the complex unit law `J₂² = −1`.
- **SELF-BLIND:** `J₂ p = p → p = 0` (the complex unit inherits self-blindness from the fold).
- **NEW operator:** `J₂ ≠ id` and `J₂ ≠ (-id)` (the complex unit is not the fold itself nor the
  identity — a genuinely new structure born from the doubling).
- **DOUBLING is forced (stretch — the general "why DOUBLE"):** for a finite-dim real space `V`
  with `J ∘ J = -id`, `finrank ℝ V` is EVEN (det argument: `det(J)² = (-1)^finrank ≥ 0`). Hence
  the base (dim 1, odd) admits no fold-root and the minimal extension that does has even
  dimension; the minimal nontrivial even dimension is 2. If Mathlib's `det` lemmas fight this
  in Lean, the concrete dim-1-no / dim-2-yes pair already PROVES the forced extension; the
  general even-dim theorem then belongs to the N2b doubling ticket, NOT a weakening of this rung.

## Non-vacuity witness (anti-W8)
The resolution is non-vacuous: `J₂(1,0) = (0,1) ≠ (1,0)` and `J₂(J₂(1,0)) = (-1,0) = -(1,0)`.
A real fold-root exists at dim 2 (structure inhabited), and the dim-1 obstruction is a real
contradiction (`c² = -1`), not a vacuous statement.

## GO / NO-GO bars
- GO iff ALL of: `IsFoldRoot` defined via N1's `IsFold`; OBSTRUCTION (dim 1) proved; RESOLUTION
  (explicit `J₂`, `J₂² = −1`) proved; SELF-BLIND proved; NEW-operator proved; all foundations-only
  (`#print axioms` ⊆ {propext, Classical.choice, Quot.sound}), no sorry/axiom/native_decide, no
  bridge marker; gate.sh green; BOTH costumes bite (dim-1 fold-root claim rejected; swap-map
  `J(a,b)=(b,a)` with `J²=+id` claimed as a fold-root rejected); physics-words-removable holds
  (delete "fold/look-back/self-blindness/complex unit" → a complete theorem about square roots
  of `-id` on real vector spaces remains, no gap).
- NO-GO if J²=−1 is obtained by IMPORTING ℂ / `Complex.I` and pointing at it (that POSITS the
  complex unit — the very thing everyone posits and we must DERIVE), or if the obstruction is
  asserted rather than proved, or if a costume does not bite, or if any physics word is
  load-bearing.

## KILL conditions (a fight = INSTRUMENT failure, never theory failure — THE ONE LAW / W5)
- If the resolution "won't close," the framing is wrong, not the theory. Return to the trunk:
  the complex unit is the self-blind square root of the look-back; it cannot fail to exist at
  dim 2. Do NOT weaken to "some J with J²=+1," do NOT import ℂ to dodge the derivation, do NOT
  add a hypothesis. If genuinely hard after re-framing → W1 dissolution ticket, NOT a smaller win.
- If I find myself reaching to `import Mathlib...Complex` and using `Complex.I_sq`, STOP: that is
  positing the answer. The complex unit must be CONSTRUCTED on the doubled REAL carrier so that a
  physicist READS "ℂ" out of it — never INTO it.

## Drift-trap checklist (must all stay TRUE)
- [ ] No ℂ / `Complex.I` imported or used. The complex unit is BUILT on `ℝ × ℝ`.
- [ ] `IsFoldRoot` is defined via N1's `IsFold` (the chain is unbroken; N1 is USED, not re-derived).
- [ ] Obstruction (dim 1) is a real PROVED contradiction; resolution (dim 2) is a real construction.
- [ ] Both costumes bite (dim-1 fold-root false; swap-map J²=+id is not a fold-root).
- [ ] Physics words removable with zero logical gap (pure square-root-of-(-id) mathematics).
- [ ] Cascade NOT hardcoded: this rung is the forced FIRST doubling; N2b carries the doubling
      operation, the tower, and the proved STOP. Decompose; keep the board single-flight.
