# N3 — THE OPERATOR (CLIFFORD) STRUCTURE — PREREG (frozen before compute)

Task t_e7c72809. Frozen 2026-06-21. Do not edit after first Lean compile; record outcomes below the line.

## TARGET (a theorem, over the banked terminal algebra; no new carrier)
On the octonion shape `𝕆 = CD (CD B)` (`[CommRing B] [StarRing B]`), the LEFT-MULTIPLICATION
endomorphisms `L_a : y ↦ a·y` of the IMAGINARY part satisfy the quadratic (Clifford) relation
governed by the BANKED self-overlap form `Nrm`/`bilin`:
- `L_a² = −Nrm(a)·id`  (imaginary `a`, i.e. `star a = −a`), and polarized
- `L_a∘L_b + L_b∘L_a = −bilin(a,b)·id`  (imaginary `a,b`),
as equations in the ASSOCIATIVE operator ring `AddMonoid.End (CD (CD B))` (Mathlib gives the
associativity of End — the reorganization of 𝕆's NON-associative product into an associative
operator algebra). Specialized to `B := Dbl ℚ` ⟹ on `O ℚ` (genuinely non-associative, banked
`not_associative`).

## DERIVATION (forward from the trunk — banked CD/star + Nrm/bilin; NO Mathlib Clifford/QuadraticForm)
1. `scaling_law` (HYPOTHESIS-FREE on `CD (CD B)`): `x·(star x·y) = ι(Nrm x)·y`.
   This is the left-alternative law `[x, star x, y]=0` (since banked `selfMul`: `x·star x = ι(Nrm x)`).
   True on the octonion shape because doubling a commutative-associative base yields an ALTERNATIVE
   algebra. Proof: component expansion `ext`/`simp`/`ring` bottoming out in the commutative ground `B`.
2. `L_sq_imag` (`star a = −a`): from 1, `a·(−a·y)=ι(Nrm a)·y` ⟹ `a·(a·y) = −(ι(Nrm a)·y)`.
3. `clifford` (`star a=−a`, `star b=−b`): polarize 2 via banked `Nrm_add` (`Nrm(a+b)=Nrm a+Nrm b+bilin a b`).
4. Bundle `L a : AddMonoid.End (CD (CD B))` via banked `mul_add_na` (left mult additive); state 2,3 as End eqns.
5. NON-VACUITY: `L a ∘ L b ≠ L (a·b)` at a concrete `O ℚ` witness (= the banked `not_associative_witness`):
   the operator algebra is genuinely richer BECAUSE the base is non-associative.

## GO / NO-GO
GO (node done) iff ALL:
- [ ] `scaling_law` compiles hypothesis-free on `CD (CD B)`, foundations-only.
- [ ] `L_sq_imag`, `clifford` compile as `AddMonoid.End` equations, foundations-only.
- [ ] specialized to `O ℚ`; non-vacuity witness `L a∘L b ≠ L(a·b)` PROVED on `O ℚ`.
- [ ] `#print axioms` ⊆ {propext, Classical.choice, Quot.sound} for every new theorem (verified by me).
- [ ] costume (WRONG SIGN `L_a² = +Nrm(a)·id` at an `O ℚ` imaginary witness) FAILS to compile → false core.
- [ ] gate.sh green; STANDARD (unbroken / complete / physics-words-removable) met.

## KILL CRITERIA (a fight = INSTRUMENT failure, not theory — return to trunk, do NOT weaken)
- K1. If `scaling_law` `ext/simp/ring` won't close: the THEORY says octonions are alternative, so the
      law is TRUE; a fight = tactic/heartbeat (instrument). Try: unfold `Nrm` first; deeper `ext`; raise
      maxHeartbeats; or route via `selfMul` + a structural `[x,star x,y]=0` lemma. NOT a reason to add a
      hypothesis or weaken to an associative base.
- K2. If the derivation fights toward ℝ / completeness: STOP — that is the ⚠ continuum gate, not a
      workaround. (N3 is purely algebraic; it should NOT need ℝ. If it does, block on the gate.)
- K3. If a sub-lemma is genuinely hard after the theory-native reframe: DECOMPOSE (W3) — bank what
      compiles foundations-only + a costume that bites, child the remainder onto the chain tail,
      complete as "decomposed." NEVER bridge / bypass / scope-reduce / run out of turns mid-task.

## ANTI-VACUITY (W8)
- The Clifford relation involves the NESTED product `a·(b·y)` (operator composition), which on the
  genuinely non-associative `O ℚ` does NOT equal `(a·b)·y`. The non-vacuity witness (GO bullet 4)
  proves exactly this. The costume guards the SIGN (a +Nrm relation must be rejected).

## RESULTS (filled after compute)
GO — node DONE. Production: Phys/Algebra/Operator.lean (17 theorems). Gate GREEN
(D0-D6; 16/16 costumes bite incl new C16; 111 audited theorems foundations-only).

- scaling_law: x·(star x·y)=ι(Nrm x)·y HYPOTHESIS-FREE on CD (CD B), one ext/simp/ring (~28s).
  THE ONE LAW confirmed: it did NOT fight — alternativity on the octonion shape is forced
  unconditionally (cf. the multiplicativity-conditioned scaling_of_H). Theory made it easy.
- L_sq_op:  Lop a * Lop a = -Lop(ι(Nrm a))            (imaginary a) — in AddMonoid.End.
- clifford_op: Lop a*Lop b + Lop b*Lop a = -Lop(ι(bilin a b))  (imaginary a,b) — polarized
  via banked Nrm_add_na; bilin/Nrm are the BANKED Born form, not posited.
- Concrete O ℚ (anti-vacuity): L_unit_sq (L e₂ ²=−1), units_anticommute (orthogonal pair,
  bilin=0), op_nonassoc (a·(b·y)≠(a·b)·y — operator algebra genuinely richer than base).
- #print axioms ⊆ {propext, Classical.choice, Quot.sound} for ALL 17 (verified by me).
- Costume C16 (wrong sign Lop e₂ ²=+1 → false core −1=1) FAILS to compile, signature ⊢ -1 = 1.
- STANDARD: UNBROKEN (forward from banked CD/star/Nrm/bilin + std Mathlib AddMonoid.End; no
  posited Clifford/inner-product; no Mathlib CliffordAlgebra/QuadraticForm/Real import) ·
  COMPLETE (foundations-only, no sorry/axiom/native_decide/bridge) · PHYSICS-WORDS-REMOVABLE
  (delete "clifford"/"spinor"/"gauge"/"operator" → theorem about left-mult endomorphisms of
  the terminal algebra satisfying a quadratic relation governed by the self-overlap form;
  no STATEMENT needs a physics word). No drift to ℝ — continuum gate did NOT bite.
