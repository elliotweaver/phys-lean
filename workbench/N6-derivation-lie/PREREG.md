# PREREG — N6: the DERIVATION (infinitesimal automorphism) LIE ALGEBRA of the terminal algebra 𝕆

FROZEN before compute. Task t_cd5d5650. Parent N14 (commit 9a6a857 HEAD).

## TARGET (verbatim from ROADMAP N6 — the authority)
Derive that the **Leibniz-derivations of the terminal algebra `O ℚ` form a Lie algebra**.
A derivation is a linear `D : 𝕆 → 𝕆` with `D(x·y) = D(x)·y + x·D(y)` over the banked `CD` product.
PROVE:
  (i)   commutator `[D,E] = D∘E − E∘D` of two derivations is AGAIN a derivation
        (closure — uses ONLY Leibniz + biadditivity, NOT associativity of 𝕆).
  (ii)  `Der(𝕆)` is a Lie algebra (bilinear, alternating, Jacobi).
  (iii) NON-VACUITY (anti-W8): a CONCRETE NONZERO derivation exists on `O ℚ`.
NOT this node (downstream children): dimension / g₂ characterization; the automorphism Lie GROUP.

## THE MOAT / DRIFT TRAP
Derive FORWARD from the banked `CD` product + Leibniz. Do NOT import Mathlib `Derivation`/`G₂`
and ASSERT 𝕆's derivations ARE g₂ / a Lie algebra. BUILD the Leibniz predicate; PROVE the bracket
closes. Mathlib `LieRing`/`AddMonoid.End`/`Submodule` are MACHINERY operating on the DERIVED `CD`
object (exactly as N3 used `AddMonoid.End` for `Lop`, N4 used `Subring`/`Module`) — NOT a posit of
the Lie structure on 𝕆. Do NOT reach for ℝ (purely algebraic; the continuum is the GROUP node).

## ROUTE (theory-native, structural — NOT a coordinate bash)
M := CD (CD B), [CommRing B][StarRing B], local narCD/srCD (the octonion shape, N3's home).
M is an AddCommGroup (narCD), so `AddMonoid.End M` is an ASSOCIATIVE ring (N3 precedent).
1. `IsDeriv (D : M →+ M) : Prop := ∀ x y, D (x*y) = D x * y + x * D y`.
2. Closure: isDeriv_zero, isDeriv_add, isDeriv_neg, isDeriv_smul (ℤ), and ★ isDeriv_bracket
   (the COMMUTATOR closure). The proof: expand g(x*y), f(g(x*y)) via Leibniz twice; the cross
   terms `gx·fy` and `fx·gy` CANCEL; what survives is `(fgx−gfx)·y + x·(fgy−gfy)` BY
   DISTRIBUTIVITY ALONE — NO associativity (the trunk reframe: Leibniz is biadditive in the
   product). This is the headline.
3. Package as a Lie algebra. REPRESENTATION CHOSEN BY SCRATCH PROBE (decide before production):
   (A) `LieSubalgebra ℤ (AddMonoid.End M)` carved by IsDeriv — IF Mathlib gives LieRing+LieAlgebra ℤ
       on the associative ring `AddMonoid.End M` for free (then I only prove submodule + bracket
       closure; bilinear/alternating/Jacobi come from the ambient commutator = standard ring fact,
       machinery on the derived object, not a posit).
   (B) bundled `structure Derivation` + hand-proved `AddCommGroup` + `LieRing` instance (LieRing
       axioms add_lie/lie_add = BILINEAR, lie_self = ALTERNATING, leibniz_lie = JACOBI — the
       ticket's exact three properties), reducing to End-ring identities via AddMonoidHom.ext.
   Prefer (A) if the instances resolve cleanly; else (B). EITHER WAY expose explicit named
   theorems for bilinear / alternating / Jacobi so the three properties are unmissable.
4. NON-VACUITY witness (concrete nonzero derivation on O ℚ):
   ★ LIFT LEMMA (general, abstract A): `Dlift (δ : A →+ A) : CD A →+ CD A`, z ↦ ⟨δ z.re, δ z.im⟩.
     IF δ is a base-derivation (∀ x y, δ(x*y)=δx*y+x*δy) AND star-commuting (∀x, δ(star x)=star(δ x)),
     THEN `IsDeriv (Dlift δ)` on CD A. Proof: ext + CD product formula + δ's two laws + δ additive;
     bottoms out cleanly, NO base associativity needed for the lift itself.
   ★ WITNESS: base A := H ℚ = CD (Dbl ℚ) (ASSOCIATIVE, banked Ring). δ := ad_q : x ↦ q*x − x*q for
     imaginary q := e₂ : H ℚ. ad_q is a derivation of the ASSOCIATIVE H ℚ (uses mul_assoc — Ring H ℚ,
     closed by ring/noncomm_ring) and star-commutes BECAUSE q imaginary (star q = −q). Nonzero:
     H ℚ's center is the scalars, ad_{e₂}(ι J) = e₂·ιJ − ιJ·e₂ ≠ 0 (banked iota_e2_comm_iff /
     J_ne_star_J). Lift to O ℚ; D (ι (ι J)) has nonzero re-component ⟹ D ≠ 0.

## GO / NO-GO (frozen)
GO (node DONE) requires ALL:
  - IsDeriv predicate over the banked CD product (physics-words-removable: it is just the Leibniz law).
  - isDeriv_bracket (commutator closure) PROVED, foundations-only.
  - Lie-algebra structure with bilinear / alternating / Jacobi all PROVED (LieRing or LieSubalgebra +
    explicit named theorems).
  - a CONCRETE NONZERO derivation on O ℚ PROVED (IsDeriv D ∧ D ≠ 0).
  - #print axioms ⊆ {propext, Classical.choice, Quot.sound} for every new decl (verified by me + D6).
  - gate D0–D6 green; costume BITES; LEDGER + ROADMAP updated; STANDARD applied.
NO-GO / DECOMPOSE (W3) if: the Lie packaging fights (then bank IsDeriv + isDeriv_bracket + named
  bilinear/alternating/Jacobi theorems first, child the typeclass packaging) OR the witness is heavy
  (bank the structure + lift lemma, child the concrete witness). Bank-as-you-go; never run out of turns.

## KILL / COMPILE-COST BUDGET (W9 — frozen)
- KILL = 90s per single obligation. If any one obligation exceeds 90s, it is an INSTRUMENT failure:
  STOP, measure the smallest sub-obligation, decompose / reframe through bilinearity — do NOT inflate
  maxHeartbeats, do NOT monolithic-`ring` a fully-expanded O ℚ coordinate goal.
- The closure + Lie laws are STRUCTURAL (biadditivity + distributivity over M, an AddCommGroup) —
  they must close by AddMonoidHom.ext + abel/the End ring, NOT a 16-coordinate ℚ ring bash. If they
  force a coordinate monolith, that is the framing signal (W5/THE ONE LAW): reframe through the
  bracket's biadditivity.
- The lift lemma is a 2-component ext bottoming in δ's laws — bounded. The ad_q derivation is over
  the ASSOCIATIVE H ℚ (has Ring) so noncomm_ring/ring closes it; bounded.
- Probe EACH heavy obligation in scratch (bounded) before production. Anti-circling: record dead routes.

## COSTUME (must BITE — a WRONG claim that fails to compile)
Candidate: assert a NON-derivation satisfies IsDeriv. Cleanest: `IsDeriv (AddMonoidHom.id : M →+ M)`
on O ℚ — id(x*y)=x*y but id x * y + x * id y = x*y + x*y = 2(x*y), so reduces to x*y = 0 at a
witness with x*y ≠ 0 (false). OR: the commutator of two derivations asserted NOT a derivation. OR:
Dlift of a NON-star-commuting δ asserted a derivation. Pick the one with the sharpest false core.
PASS_SIGNATURE = the elaboration error of the false goal.

## NUMERICS WITH TEETH (before Lean)
Exact-rational model of CD product/star over Dbl ℚ → H ℚ → O ℚ. VERIFY:
  - the commutator-closure cross-term cancellation holds (and the costume's `id` FAILS Leibniz —
    the costume bites);
  - ad_{e₂} is a derivation of H ℚ and star-commutes; lift to O ℚ is a derivation and is NONZERO;
  - a NON-imaginary q makes ad_q NOT star-commute (so the imaginary hypothesis is load-bearing —
    anti-vacuity).
