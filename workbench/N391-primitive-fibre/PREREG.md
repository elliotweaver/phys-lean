# N391 — arc-J J1: THE PRIMITIVE 2D REAL FIBRE (Gap A)

## Target (theory-native, SELECT-confirmed)
DERIVE the primitive probe state space as the 2-DIMENSIONAL REAL fibre `(e_inward, e_outward)` at
the monad-unit level — the two directions of the look-back (toward/away) — PRIOR to any complex
structure. The raw carrier the Born rule lives on. DERIVE from the look-back structure; do NOT posit
a Hilbert space. FIRST node of arc J.

## Fold-causal chain (why THIS node)
fold (N1) → look-back = `-id`, self-blind (no nonzero fixed point) → recursive self-blindness =
seeking a square-root of the look-back (`IsFoldRoot`) → the LINE (dim 1) is BLOCKED (banked
`no_foldRoot_dim1`: Born positivity `c²≥0>−1`) → any fold-root carrier has EVEN dim (banked
`foldRoot_forces_even_dim`: `det(J)²≥0`, same positivity) → minimal even carrier is dim 2, and dim 2
IS achieved (banked `J₂` on `Cut×Cut`, `J₂_isFoldRoot`). ⇒ the raw probe carrier is FORCED to be the
2D real fibre `Cut × Cut`, prior to the complex structure J (which is J2's job).

## Design (namespace `Phys.Quantum`, module `Phys/Quantum/PrimitiveFibre.lean`)
Carrier is the CONCRETE banked derived-ℝ double `ContinuumQ.Cut × ContinuumQ.Cut` (the SAME carrier
`J₂` lives on) — NOT a generic 2D space (free-floating guard).

DEFS:
- `StateFibre := ContinuumQ.Cut × ContinuumQ.Cut`   (the raw 2D real fibre)
- `eInward : StateFibre := (1, 0)`                    (look-back "toward")
- `eOutward : StateFibre := (0, 1)`                   (look-back "away")
- `bornForm (p q) : Cut := p.1*q.1 + p.2*q.2`         (raw self-overlap / Euclidean form)

THEOREMS:
1. `eInward_ne_eOutward` — the two directions are DISTINCT (fibre genuinely 2D, no collapse). [W8]
2. `fibre_finrank : finrank Cut StateFibre = 2` — via `Module.finrank_prod` + `finrank_self`.
3. `fibre_decomp (p) : p = p.1 • eInward + p.2 • eOutward` — every state is a real combo of the two.
4. `fibre_even_dim : Even (finrank Cut StateFibre)` — from `foldRoot_forces_even_dim J₂ J₂_isFoldRoot`
   (fold-causal Even, not just computed).
5. `line_blocked : ¬ ∃ J : Cut →ₗ[Cut] Cut, IsFoldRoot (fun x => J x)` — cite `no_foldRoot_dim1`.
6. `fibre_carries_foldRoot : IsFoldRoot (fun p => J₂ p)` — cite `J₂_isFoldRoot`.
7. ★ `fibre_forced` — the CRUX: `finrank Cut StateFibre = 2 ∧ Even (finrank Cut StateFibre)
   ∧ ¬ Even (finrank Cut Cut) ∧ (¬ ∃ J : Cut →ₗ[Cut] Cut, IsFoldRoot (fun x=>J x))
   ∧ IsFoldRoot (fun p => J₂ p)` — the carrier can't be the line (self-blind on dim 1, odd),
   the even law forces the enlargement even, the minimal even carrier (this 2D fibre) achieves the
   fold-root. THE forced raw carrier.
8. `bornForm_self_nonneg (p) : 0 ≤ bornForm p p` — Born positivity at the fibre level.
9. `bornForm_self_eq_zero (p) : bornForm p p = 0 ↔ p = 0` — positive-DEFINITE.
10. `bornForm_symm`, `bornForm_eInward_self = 1`, `bornForm_eOutward_self = 1`,
    `bornForm_eInward_eOutward = 0` — the orthonormal two-direction frame.

SCOPE (W4.5 sufficiency): derive EXACTLY the 2D real fibre + its raw positive-definite self-overlap +
orthonormal frame + the forced-ness. Do NOT equip the complex structure J (J2) or Kähler/Born-square
(J3). Those are the next nodes.

## Physics-words-removable (G4)
Delete probe/state/Born/quantum/inward/outward/look-back → "the minimal 2-torsion-free ordered-field
carrier admitting a square root of the negation map is a 2-dim space (the line is blocked, even dim
forced, dim-2 achieved) with a positive-definite Euclidean form and an orthonormal 2-frame." Pure math.

## Guards
G1 no asserted values (no posited Hilbert space, no posited "Born=|⟨φ|ψ⟩|²"). G2 no empirical number.
G3 derived not posited (2D forced by banked obstructions). G4 words-removable. G5 foundations-only.
ℝ-vigilance: build on banked `Cut`, `J₂`, `no_foldRoot_dim1`, `foldRoot_forces_even_dim` — no Mathlib
Real/Complex as content. FREE-FLOATING: type is ABOUT `Cut×Cut` + banked obstructions, not generic 2D.

## Costume (C416)
A WRONG carrier — fibre collapses to 1-dim, or the two directions coincide — must fail. Tie to
`eInward_ne_eOutward` (or `fibre_finrank = 2`): a "the fibre is 1-dimensional / the two look-back
directions coincide" misreading reduces to `1 = 416`.

## Cost budget / KILL (W9)
Each obligation is tiny (Prod arithmetic, finrank_prod, positivity, decide). KILL: if any single
obligation exceeds ~30s compile, MEASURE/DECOMPOSE. Expected: probe compiles in seconds.

## Successor (ONE-SUCCESSOR RAIL)
ONE directed child → arc-J J2 (SEED_QM_FOUNDATIONS §J2): the complex structure J forced by
self-blindness (`J(e₂) = −e₁`, `J²=−1`), `i` = the fold's chirality.
