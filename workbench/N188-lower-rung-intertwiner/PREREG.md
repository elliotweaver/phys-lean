# N188 PREREG — the LOWER rung of the inclusion tower `u(1) ↪ su(2)` (the doubling intertwiner)

FROZEN before compute. THE ONE LAW + W4.5 (sufficiency) + W8 (anti-vacuity) + W9 (measure-first).

## Front chosen: (i) — COMPLETE THE TOWER, lower rung `Dbl ℚ ↪ H ℚ`.

N187 banked the UPPER rung `su(2) = Der(H) ↪ g₂ = Der(O)` (the doubling-induced Lie embedding).
This node banks the LOWER rung: the relation between the hypercharge phase rotation `L_J` on
`Dbl ℚ` (N186) and the isospin inner derivation `adQ hI` on `H ℚ` (N184/N185, `hI = ι J`).

### The measured structure (hand-computed, to be confirmed in Lean BEFORE committing).
The Cayley–Dickson doubling `H ℚ = CD (Dbl ℚ)` embeds `Dbl ℚ` two ways:
- ι : `a ↦ ⟨a, 0⟩` (the "old" complex-unit line — `hI = ι J` lives here);
- κ : `b ↦ ⟨0, b⟩` (the NEW dimension the doubling adds — the orthogonal plane).

Componentwise on the forced CD product (`star J = −J`, `Dbl` commutative):
- `adQ hI (ι a) = ⟨J·a − a·J, 0⟩ = 0`   (the SU(2) generator ANNIHILATES the embedded U(1) line);
- `adQ hI (κ b) = ⟨0, b·J − b·(−J)⟩ = ⟨0, 2·(b·J)⟩ = κ ((2:ℚ) • L_J b)`.

So **the SU(2) generator `adQ hI`, restricted to the doubling's new plane κ(Dbl ℚ), is exactly
TWICE the U(1) phase rotation `L_J`, transported by the embedding κ** — a PROVED operator
intertwiner `adQ hI ∘ κ = κ ∘ (2 • L_J)`. This is a genuine map between two DISTINCT banked
algebras (`L_J` N186 on `Dbl ℚ`; `adQ hI` N184/N185 on `H ℚ`), NOT a re-pin of either, NOT a
juxtaposition: the U(1) generator REAPPEARS (up to the factor 2 the doubling forces) as the
restriction of the SU(2) generator to the new plane, and is annihilated on the old plane.

### GO  (bank this node):
- `kappa : Dbl ℚ →ₗ[ℚ] H ℚ` (the new-dimension embedding) + `kappa_apply` + `kappa_injective`.
- `adQ_hI_iota : adQ hI (CD.iota a) = 0`  (SU(2) generator kills the embedded U(1) line).
- `adQ_hI_kappa : adQ hI (kappa b) = kappa ((2:ℚ) • L_J b)`  (the pointwise relation).
- ★★ `isospin_intertwines_hypercharge : (adQ hI).comp kappa = kappa.comp ((2:ℚ) • L_J)`
      (THE INTERTWINER — the lower rung `u(1) ↪ su(2)`).
- W8 non-vacuity: `isospin_intertwines_hypercharge_ne_zero` (the intertwiner ≠ 0; the
  witnessing coordinate `(adQ hI (kappa 1)).im.im = 2`, the genuine relational coefficient).

### NO-GO / REJECT (look WIDE per W4.5/W8):
If the measured relation is NOT a hom, is identically zero, or only juxtaposes two banked
facts with no genuine map → REJECT front (i), do NOT force it, look WIDE (front (ii)).
The measurement above shows it IS a genuine non-trivial intertwiner, so GO is expected;
but the Lean probe is the arbiter — if it does not close cleanly as a hom, reject.

### KILL (W9 instrument budget):
- KILL = 90s / obligation, 180s / file. Every obligation is a componentwise `ext <;> simp <;>
  ring` over ℚ — trivially light (cf. N184/N186 ~8–16s). If ANY obligation exceeds KILL it is
  an instrument wall → measure/decompose, do NOT grind. No inflated maxHeartbeats, no monolith.

## Costume C220 (anti-vacuity, W8).
The WRONG claim — that the intertwiner coefficient is trivial / the relation is the zero map /
the SU(2) generator does NOT carry the U(1) generator — forces the genuine relational
coordinate `(adQ hI (kappa 1)).im.im = 2` to be a false value. Costume: `2 = 188` in ℚ
(DISTINCT from the banked battery: C216 `2=184`, C217 `3=185`, C218 `1=186`, C219 `4=187` —
the pair (2,188) differs from (2,184) by RHS). PASS = the wrong file FAILS to compile (exit 1).

## Physics-words-removable (STANDARD §2).
Delete `hypercharge / U(1) / isospin / SU(2) / su(2) / gauge`: what remains is the pure
statement that for the Cayley–Dickson double `H ℚ = CD (Dbl ℚ)`, the inner derivation
`ad_{⟨J,0⟩}` annihilates the first-coordinate embedding `a ↦ ⟨a,0⟩` and, on the
second-coordinate embedding `b ↦ ⟨0,b⟩`, equals twice the multiplication-by-J map transported
by that embedding — pure algebra over the derived field ℚ. No theorem statement needs a
physics word.
