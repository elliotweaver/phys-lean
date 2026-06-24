# THE ROADMAP — the nodes, as TARGETS only
*Each node states WHAT must be achieved, its dependency, and its drift trap. It does NOT state
HOW to prove it — the derivation is the worker's job (that is the whole point; a hardcoded
solution trains nothing). Read docs/STANDARD.md and docs/RUNBOOK.md first. Nodes are executed
in dependency order — a node may not start until its prerequisites are `done`.*

---

## The shape of the chain
The chain begins at the **fold** and unfolds by forced steps. Early nodes are pure structure
(no physics words needed at all). Physics *names* appear only once the derived structure is
rich enough that a physicist recognizes it — and even then the name is removable (STANDARD §2).

Depth layers (mirrored in the `Phys/` folder structure):
- **Foundation** (depth 0) — the fold and what it immediately forces.
- **Cascade** (depth 1) — the forced algebra sequence and its termination.
- **Algebra** (depth 2) — the structures the terminal algebra forces.
- **Emergent** (depth 3+) — the structures physics recognizes, each a theorem.

---

## N1 — THE FOLD  (Foundation, depth 0, the root)
**Target.** Formalize the fold — self-look-back — as a mathematical object, and prove the
first property it forces. The fold is the project's ONE permitted posit (STANDARD §3): it is
*defined*, not derived from anything prior. Everything after N1 must be *derived*, never
posited.
**What "done" requires.** A Lean definition of the fold/self-reference operator and a proved
theorem capturing its defining consequence (the self-blindness / fixed-point property that the
trunk rests on). Foundations-only, costume that a WRONG version fails, gate green, STANDARD met.
**Dependency.** None (it is the root).
**Drift trap.** Do NOT import any physics. Do NOT posit ℂ/ℍ/𝕆 or J²=−1 as given — N1 defines
the fold and proves its immediate forced property; the algebra cascade is N2's job to DERIVE.
Do NOT smuggle a target structure in by choosing a definition that "happens to" be the answer;
the definition must be the honest formalization of self-look-back, and the property must follow.
**Physics-words-removable.** N1 should contain essentially NO physics words — it is pure
structure. If it needs a physics word to state its theorem, that is a red flag.

## N2 — THE CASCADE AND ITS STOP  (Cascade, depth 1)
**Target.** Derive — not posit — the forced sequence of structures that the fold generates,
and prove it TERMINATES at a specific point (the cascade does not continue forever; something
forces it to stop). This is the crown node: the field at large *posits* its starting algebra;
here it must be *derived* from N1, with the stopping point *proved*.
**What "done" requires.** Each step of the cascade is a theorem (structure k forces structure
k+1), and a theorem that the cascade halts at the terminal structure (the step that would
continue is proved impossible / loses a required property). Foundations-only, costumes that a
wrong continuation and a wrong stop both fail, gate green, STANDARD met.
**Dependency.** N1.
**Drift trap.** Do NOT assume the terminal algebra and check properties backward — DERIVE the
sequence forward from N1 and let the stop be FORCED. Do NOT hardcode the number of steps. The
stop must be a proved impossibility, not an asserted halt. If any step "fights you," return to
the fold (THE ONE LAW) — do not add a hypothesis to force the next rung.
**Physics-words-removable.** Still essentially pure structure. No physics names should be load-
bearing.

## ⚠ STANDING DEPENDENCY GATE — THE NUMBER TOWER (ℕ → ℤ → ℚ → ℝ) FROM THE FOLD  (Foundation, cross-cutting)
**This is not a sequential node; it is a precondition attached to the entire Emergent layer.**
**It governs the WHOLE number tower, not just the continuum. The continuum (ℝ) is the TOP of the
tower; ℕ, ℤ, ℚ are the BOTTOM. As of N7–N14 BOTH ENDS now descend from the fold — the gate is
RESOLVED (see Status below). The text below is retained as the standing discipline this gate enforces
for every future node.**

**The issue (historical — now resolved; retained as the motivating problem).** The cascade (N2) is
purely algebraic: Cayley–Dickson *takes a base ring as input and doubles it*. That base ring — and the
whole number system under it — was originally a STAND-IN imported wholesale from Mathlib:
`import Mathlib.Data.Int.Basic` (ℤ), `import Mathlib.Data.Rat.Defs` (ℚ), with ℝ-scaffolding in the
even-dimension / why-double argument (`Module ℝ`, `finrank ℝ`, `LinearMap.det`). **ℕ, ℤ, ℚ, ℝ were
then INPUTS borrowed from Mathlib, not OUTPUTS of the fold** — the single largest unowned gap in the
chain. It has since been closed rung by rung (N7–N14); the description below records the problem the
gate existed to prevent. A reviewer attacks here
first: *"your thesis is ONE axiom generates everything — but you imported the rationals. Where do
ℕ, ℤ, ℚ come from: your fold, or Mathlib?"* The honest answer must be **the fold**, and the Lean
must show it.

**The gate.** Before the foundation is sound — and certainly before any physics-recognized /
analytic node — the chain MUST derive the FULL number tower from the fold. There is exactly ONE
permitted outcome at every rung:
  **DERIVE it from the fold.** ℕ, then ℤ, then ℚ, then ℝ-with-completeness must each arise as a
  FORCED consequence of the fold's own dynamics — the same way the algebras did. The ontology has
  the engine: the fold re-entering / iterating itself is the genesis of COUNTING (ℕ); the additive
  and multiplicative closure of that counting gives ℤ and ℚ; and the gather of closures (self-fold
  missing itself → covering the miss with a closure → the gather of those closures → the
  local→global / sheaf-like failure) is the structure the continuum (ℝ) is completed from. HOW is
  the worker's job — do NOT hardcode an approach; reframe through the trunk first (W1 step 2).

**THE BOTTOM OF THE TOWER — ℕ, ℤ, ℚ (owed backfill, currently imported).** Each is a dedicated
foundation node that must be banked, ℝ-free and Mathlib-number-import-free:
  - **ℕ from the fold** — counting/arity as the fold's own iteration (re-entry of the distinction),
    not `Mathlib`'s inductive `Nat` smuggled in as content.
  - **ℤ from ℕ** — the additive (group) closure of the derived counting.
  - **ℚ from ℤ** — the multiplicative (field-of-fractions) closure of the derived integers.
  Only once ℚ is the DERIVED ℚ does the continuum work (N6, the cuts/gathers over ℚ) rest on the
  fold rather than on a borrowed ground. The N6 construction is structurally correct and is NOT torn
  down — it ports verbatim onto the derived ℚ; but the gate is not resolved while its ground is
  imported. The cap value "3", the dimension counts, and every witness arity ultimately trace to
  this derived ℕ.

**NOTE — content vs. metalanguage (the one honest distinction).** ℕ used as Lean *type-theory
arity/indexing* (the `n` in `Fin n`, a matrix dimension, the kernel's own `Nat`) is substrate, like
`propext` — it is the metalanguage the proof is written in, not a posited mathematical object inside
the derivation. What MUST be derived is the number tower used as **CONTENT**: the ground ring the
cascade is built over, the field analysis happens in, the integers/rationals that carry the
witnesses and constants. When in doubt, ask: *is this number system the OBJECT the result is a
statement about, or the METALANGUAGE counting the statement's parts?* The former must be earned; the
latter is substrate. Do not weaponize this distinction to wave through a borrowed content ring.

**ℝ / ℤ / ℚ ARE NOT AXIOMS AND CANNOT BE ADDED AS ONES.** The foundational stack is fixed:
self-look-back, the miss, the closure/distortion, the gather, the local→global (sheaf-like)
failure. No number system is in it. Adopting any of ℕ/ℤ/ℚ/ℝ as a posit — or importing it from
Mathlib as the load-bearing ground — is FORBIDDEN: it is the second-axiom smuggling the STANDARD
exists to prevent. The tower is DERIVED from the fold — the ONE outcome, never papered over by
positing or by `import Mathlib.Data.{Nat,Int,Rat,Real}` used to GET a result. When the route
resists, the status is *route NOT YET found* (reframe through the trunk / W5 / child a route-finding
node) — NEVER "non-derivable" and NEVER an "honest finding" of failure. The theory generates the
number tower; the only live question is how and when we find the route, never whether it can be
reached.

**⚠ THE UNEARNED-IMPORT WARNING LIGHT (a standing alarm, every run).** The moment a node does
`import Mathlib.Data.Nat.*` / `Int.*` / `Rat.*` / `Real.*` / `Complex.*` — or uses ℕ/ℤ/ℚ/ℝ/ℂ as the
CONTENT ground ring, field, or coefficient system of a derivation (not as metalanguage arity) — a
warning light fires: **you are about to build a load-bearing result on a number object the fold has
not yet earned.** STOP. Either the object is already derived-and-banked (import the BANKED one and
USE it — RUNBOOK W2) or it is a prerequisite NODE that must be built first (RUNBOOK W1). Never let a
borrowed number system silently become load-bearing. This is the exact mechanism by which an
unjustified foundation slips past every local gate while each node looks clean — the project's own
local→global failure, in the operator's domain.

**The drift trap this gate exists to prevent.** A future node silently does
`import Mathlib...Real` (or `Rat`, or `Int`) and *uses* it to get its result. That smuggles a
structure the chain never derived: the result then descends from a Mathlib-given object, not from
the fold — a broken chain. When the chain needs a number system, the correct move is to STOP and
DERIVE it from the fold (a dedicated node), NOT to reach for the import and NOT to posit it.

**Status.** ✅ RESOLVED — the WHOLE tower ℕ→ℤ→ℚ→ℝ descends from the fold AND no node leans on imported
Mathlib ℝ (or any Mathlib number system) as load-bearing content. ℕ (N7), ℤ (N8), ℚ (N9) all
descend from the fold (Mathlib-number-import-free), and the ORDER on the derived ℕ→ℤ→ℚ is derived
from counting's comparability (N10 `OrderedTower`, the derived ℚ is a LinearOrderedField). The
continuum's ORDER-COMPLETENESS half is now RE-GROUNDED onto the derived ℚ (N10
`ContinuumDerived.lean`, namespace `ContinuumQ`): the gather/cut/completeness + the derived √2
re-stated over `Phys.Foundation.Q`, with the analytic obstruction supplied by the banked
`Q.no_q_sq_two` (infinite descent on counting) instead of Mathlib `Rat.den_pow`. ★ THE ℝ FIELD-OPS,
INCREMENT 1 — BANKED (N11 `ContinuumField.lean`): the derived ℚ is ARCHIMEDEAN (`Q.instArchimedean`,
itself derived from counting via `Re.toNat`, NOT imported), and the completion `Cut` is now a
DEDEKIND-COMPLETE LINEARLY ORDERED ABELIAN GROUP — cut addition (gather of pairwise sums), negation =
the fold's reflection (reflect the upper complement), the additive inverse `add_neg_self` (the
eternal approach / Archimedean made load-bearing via the cut-approximation lemma `approx`),
`AddCommGroup Cut` + `LinearOrder Cut` + `IsOrderedAddMonoid Cut`, with `zero_lt_sqrt2` the
strictly-positive √2 witness (non-degeneracy). ★ THE ℝ FIELD-OPS, INCREMENT 2 — BANKED (N12
`ContinuumFieldMul.lean`): the POSITIVE-CONE MULTIPLICATION on `Cut` (the gather of pairwise
products of nonnegative approximants — Born=self-overlap=positivity one level up), sign-extended
to `Mul Cut` via the banked negation + `LinearOrder Cut`, `One = Qcut 1`; and ★★ THE CAPSTONE
`sqrt2 * sqrt2 = Qcut 2` (`pmul_sqrt2_sqrt2`/`sqrt2_mul_sqrt2`) — the analytic gap N6 forced
(`x²=2` unsolvable in the derived ℚ, banked `Q.no_q_sq_two`) is SOLVED in the completion via
`sq_dense` (density of rational squares, a geometrically-contracting Heron iteration closed by
the banked `Q.instArchimedean`); the completion strictly extends the derived ℚ AND closes the
square the ground could not. The original N6-pre files over imported ℚ are retained
as the imported-ground statement; the load-bearing re-grounded version is `ContinuumQ`. ★★ THE ℝ
FIELD-OPS, INCREMENTS 3+4 — BANKED (N13 `ContinuumFieldRing` + `ContinuumFieldInverse`): the cone
RING LAWS (`pmul_assoc_cone`, `pmul_distrib_cone`, `pmul_one_cone`) + sign extension (the banked
`neg_mul`/`mul_neg`) give ★ `CommRing Cut`; the multiplicative INVERSE of a positive cut = the
REFLECT-AND-RECIPROCATE set `pinvS` (the multiplicative swap one level up, mirroring N9's q/p swap),
with `pmul_pinv_cancel` closed by the C6 eternal approach a third time (`mul_approx`, the ratio of
an interior point to an exterior bound forced past any `t<1` by the banked Archimedean lever),
sign-extended ⟹ ★★ `Field Cut`; and `mul_pos` (the positive cone closed under the product — Born
positivity as an ORDER fact) ⟹ ★★ `IsStrictOrderedRing Cut`. With the banked Dedekind completeness
(`completion_coherence_closed`), `ContinuumQ.Cut` is now a LINEARLY ORDERED FIELD WITH THE LUB
PROPERTY — the ℝ rung, over the derived ℚ, with NO posited ℝ. ★ WHAT STILL
KEEPS THE GATE UNRESOLVED: nothing remains. ★★ THE N2 ℝ-SCAFFOLDING DISCHARGED — BANKED (N14
`ComplexUnit.lean`): the why-double / even-dimension argument no longer leans on imported ℝ. Reframed
through the trunk (THE ONE LAW): the why-double law is NOT a fact about ℝ — it is the trunk's
positivity (`det(J)² = det(J∘J) = det(-id) = (-1)^finrank`, and `det(J)² ≥ 0` by `sq_nonneg`, forcing
`finrank` even), a fact about ANY linearly ordered field. `foldRoot_forces_even_dim` is now ABSTRACT
over `[Field K][LinearOrder K][IsStrictOrderedRing K]` (Mathlib `LinearMap.det`/`finrank`/`sq_nonneg`
as field-generic MACHINERY) and INSTANTIATED at the DERIVED ℝ `ContinuumQ.Cut`: `J₂` on `Cut × Cut`,
the dim-1 obstruction on the derived line `Cut`, non-vacuity over the derived ℚ `Q`. NO `import
Mathlib.Data.{Real,Rat,Complex}` content anywhere in the file (`ZMod 5` kept only as the negative
tightness witness — order is load-bearing). Strictly STRONGER than the imported-ℝ original.

**THE GATE IS RESOLVED.** Every rung of the number tower ℕ→ℤ→ℚ→ℝ descends from the fold, and NO node
leans on imported Mathlib ℝ (or any Mathlib number system) as load-bearing CONTENT. The
analytic/physics-recognized (Emergent) layer is no longer blocked by a borrowed number ground — N6
onward (the first physics-recognized structures) become specifiable.

## N3 — WHAT THE TERMINAL ALGEBRA FORCES: the operator (Clifford) structure  (Algebra, depth 2)
**Target.** Derive the FIRST purely-algebraic structure the terminal algebra `𝕆` forces: the
reorganization of its NON-associative multiplication into an ASSOCIATIVE operator algebra. Prove
that the left-multiplication maps `L_a : x ↦ a·x` of the imaginary terminal algebra satisfy the
quadratic (Clifford) relation `L_a ∘ L_b + L_b ∘ L_a = −bilin(a,b) · id` (equivalently
`L_a² = −Nrm(a)·id` on imaginaries, polarized). This is the algebraic seed of the spinor/gauge
structure physics recognizes — and it is DERIVED from the cascade (the trunk), where the
division-algebra-physics field merely POSITS `𝕆` and reads its Clifford structure off by hand.
**What "done" requires.** A Lean theorem, over the banked terminal algebra (the cascade's `O`,
no new carrier posited), that the imaginary left-multiplication endomorphisms satisfy the
quadratic relation, with the form `bilin`/`Nrm` being the already-banked Born self-overlap (N2),
NOT a freshly posited inner product. Foundations-only, costume that a WRONG sign / the relation
asserted WITHOUT non-associativity (e.g. on an associative base where the squares vanish wrongly)
fails, gate green, STANDARD met.
**Dependency.** N2 (all rungs + the forced stop + the forced iff). The natural route is the
just-closed LEFT SCALING LAW `x·(star x·y) = ι(Nrm x)·y`: on an imaginary `a` (where
`star a = −a`) it reads `a·(a·y) = −Nrm(a)·y`, i.e. `L_a² = −Nrm(a)·id`; polarizing in `a`
gives the Clifford relation. (This is a HINT, not a mandate — the worker derives the HOW.)
**Drift trap.** Do NOT import Mathlib's `CliffordAlgebra`/`QuadraticForm` machinery and ASSERT
that `𝕆`'s operators ARE a Clifford algebra — derive the relation FORWARD from the banked `CD`
product + `star` (the POSIT-vs-DERIVE moat; the SAME drift trap as the forbidden Hurwitz import).
Do NOT posit the bilinear/inner-product form — it is the banked `bilin`/`Nrm`. Do NOT reach for
`ℝ`: stay over the cascade's base ring. **If the honest derivation needs the continuum, STOP and
resolve the ⚠ STANDING DEPENDENCY GATE first — never silently `import Mathlib...Real`.** (N3 as
specified is purely algebraic and should NOT need the continuum; if it fights you toward `ℝ`,
that is the gate, not a workaround.)
**Physics-words-removable.** Delete "Clifford", "spinor", "gauge": the theorem is a pure
statement that the left-multiplication endomorphisms of the terminal algebra satisfy a quadratic
relation governed by the self-overlap form. No physics name may be load-bearing.

## N4 — THE GENERATED OPERATOR ALGEBRA + THE MODULE (SPINOR) STRUCTURE  (Algebra, depth 2)
**Target.** Derive the SECOND purely-algebraic structure the terminal algebra forces, building
directly on N3's Clifford relation. N3 proved each imaginary `Lop a` is (with `clifford_op`) an
anticommuting root of `−bilin`-scalars in the ASSOCIATIVE operator ring `AddMonoid.End (CD (CD B))`.
The forced next structure is the associative subalgebra those operators GENERATE and the fact that
the terminal algebra `𝕆` is itself a MODULE over it (the object physics recognizes as the spinor
module on which the Clifford/operator algebra acts). Concretely, prove: (i) the left-multiplications
by a full basis of imaginaries pairwise anticommute and square to `−Nrm·id` (generalizing N3's
single-pair `units_anticommute` / `L_unit_sq` to the whole imaginary basis — the complete set of
generating relations), and (ii) the unital associative subalgebra of `End` they generate, acting on
`𝕆`, is the operator/Clifford representation, with `𝕆` its module. This is the algebraic seed of the
spinor/gauge structure physics recognizes — DERIVED from the cascade, where the field POSITS the
Clifford module by hand. THE MOAT: posit-vs-derive.
**What "done" requires.** Lean theorems, over the banked octonion shape (no new carrier posited):
the full anticommutation/square relations on an imaginary basis, and the generated-subalgebra +
module statement, with the form the banked `bilin`/`Nrm` (N3) — NOT a freshly posited inner product.
Foundations-only, costume that a WRONG relation (e.g. two distinct basis units that COMMUTE, or a
`+` square) fails, gate green, STANDARD met.
**Dependency.** N3 (the operator/Clifford relation). PURELY ALGEBRAIC — stays over the cascade's
base ring (`ℚ` witnesses); should NOT need the continuum.
**Drift trap.** Derive FORWARD from N3's `Lop`/`clifford_op` + the banked `CD` product/`star`/
`bilin`/`Nrm`. Do NOT import Mathlib's `CliffordAlgebra`/`QuadraticForm` and ASSERT the generated
algebra IS a Clifford algebra / its module IS a spinor module (POSITS the structure — the same drift
trap N3 avoided). Build the generated subalgebra + the module action yourself if Mathlib lacks the
exact shape (RUNBOOK W1: Mathlib absence is not a wall). Do NOT posit the bilinear form (banked
`bilin`/`Nrm`). **If the honest derivation needs the continuum (e.g. it forces a Lie GROUP, a
completion, or a real-spectral argument), STOP and resolve the ⚠ STANDING DEPENDENCY GATE first —
never silently `import Mathlib...Real`.** (N4 as specified is purely algebraic and should NOT need
the continuum; the gate bites at the first physics-recognized/analytic node, likely N5+.)
**Physics-words-removable.** Delete "spinor", "gauge", "Clifford": the theorems are pure statements
that the left-multiplication endomorphisms generate an associative subalgebra with prescribed
anticommutation/square relations governed by the self-overlap form, and that the terminal algebra is
a module over it. No physics name may be load-bearing.

## N5 — THE HERMITIAN JORDAN TOWER AND ITS FORCED CAP AT 3 (Algebra, depth 2)
**Target.** Derive the THIRD purely-algebraic structure the terminal algebra `𝕆` forces, and make
it the first proved instance of the trunk's flagship claim — **ONE CAUSE, MANY TERMINATIONS**. The
SAME octonionic non-associativity that stopped the cascade (banked `not_associative` : `O ℚ` is not
associative) *also* caps a second tower: the Hermitian self-adjoint elements `H_n(𝕆)` under the
symmetrized (Jordan) product `a ∘ b = ½(a·b + b·a)` form a Jordan algebra **iff `n ≤ 3`**. Prove the
cap: (i) for `n = 3`, `H_3(𝕆)` satisfies the Jordan identity — forced because `𝕆` is ALTERNATIVE
(the left/right-alternative law, banked as N3's hypothesis-free `scaling_law`), which is *exactly*
the property `n = 3` needs and no more; (ii) for `n ≥ 4` (concretely `n = 4`), the Jordan identity
FAILS on `H_n(𝕆)` — forced because `n ≥ 4` would require `𝕆` ASSOCIATIVE, and `𝕆` is not
(`not_associative`). The cap value `3` is therefore not posited — it is the exact gap between
"alternative" (which `𝕆` has) and "associative" (which it lost at the cascade stop). The three-fold
structure a physicist recognizes (three of something) appears here for the FIRST time, as a PROVED
algebraic cap, not a named coincidence.
**What "done" requires.** Lean theorems over the banked terminal algebra (`O ℚ` witnesses; no new
carrier posited): the Hermitian matrix carrier and the symmetrized product built from the banked `CD`
product + `star`; a theorem that `H_3(O ℚ)` satisfies the Jordan identity (deriving it from
alternativity / `scaling_law`, NOT asserting it); and a theorem that `H_4(O ℚ)` does NOT (a concrete
Jordan-identity-violating witness whose defect is traced to a non-vanishing associator, i.e. to
`not_associative`). The "one cause" connection (alternativity-not-associativity is the single fact
behind both the cascade stop and the n=3 cap) must be a PROVED link in Lean (e.g. the `n ≥ 4`
obstruction reduces to the same non-associativity witness), never an asserted comment. Foundations-
only, costume that a WRONG cap (e.g. the Jordan identity asserted to hold on `H_4`, or claiming `𝕆`
associative to force a higher cap) FAILS to compile, gate green, STANDARD met.
**Dependency.** N4 (the generated operator algebra + module — the `n = 2` case is essentially the
operator/Clifford/module structure already built) + banked `not_associative` + `scaling_law`
(alternativity) + banked `CD`/`star`. PURELY ALGEBRAIC — stays over the cascade ground ring `ℚ`;
should NOT need the continuum (the cap is a COUNT, not an analytic object).
**Drift trap.** Derive the cap FORWARD: the n=3 Jordan-ness from alternativity, the n≥4 failure from
non-associativity — never POSIT the cap value `3`, never import a Mathlib `JordanAlgebra`/exceptional-
algebra structure and ASSERT `H_3(𝕆)` IS the Albert algebra (the SAME posit-vs-derive drift trap N3/N4
avoided). If Mathlib lacks the Hermitian-matrix-over-a-non-associative-algebra carrier or the Jordan
identity machinery, BUILD it (W1: Mathlib absence is not a wall) — note `O ℚ` has NO `Ring` instance,
so Mathlib's `Matrix` ring API does not apply directly; the Hermitian carrier + symmetrized product
must be built at the non-associative level. Do NOT reach for `ℝ`: the cap is purely algebraic.
**★ If the honest derivation forces a Lie GROUP / a completion / a real-spectral / eigenvalue
argument (e.g. you find yourself wanting `H_3(𝕆)`'s automorphism GROUP `F₄`, or real eigenvalues),
STOP and resolve the ⚠ STANDING DEPENDENCY GATE first — never silently `import Mathlib...Real`.**
(The cap itself is a polynomial-identity fact and should NOT need the continuum; the gate bites only
if you drift toward the automorphism GROUP, which is a later node.)
**THE ONE LAW (W5).** If the Jordan identity on `H_3` fights you, return to the trunk: the identity
holds *because* `𝕆` is alternative — `scaling_law` is the left-alternative law, banked and hypothesis-
free. If the `n ≥ 4` failure fights you, return to the trunk: it fails *because* `𝕆` is non-
associative — `not_associative` is banked. Do NOT add a hypothesis; do NOT weaken to `H_2`. If a hard
sub-lemma still fights after the theory-native reframe → DECOMPOSE (W3): bank the cap direction that
compiles foundations-only + a costume that bites, child the remainder onto the chain tail, complete
as "decomposed."
**Physics-words-removable.** Delete "generation", "Jordan-as-physics", any physical name: the
theorems are pure statements that the symmetrized product on the Hermitian elements of the terminal
algebra satisfies the Jordan identity exactly when the matrix order is ≤ 3, the cap being forced by
the algebra's alternativity-without-associativity. No physics name may be load-bearing.

## N6 — THE DERIVATION ALGEBRA OF THE TERMINAL ALGEBRA: the gauge-structure seed  (Emergent, depth 3)
**✅ LANDED** (`Phys/Algebra/Derivation.lean`, namespace `Phys.Algebra`). `IsDeriv` (the Leibniz-derivation
predicate over the banked `CD` product) + `isDeriv_bracket` (★★ the commutator closure — uses ONLY Leibniz
+ biadditivity + distributivity, NEVER associativity, the trunk reframe vindicated) + `derivation`
(`Der(𝕆)` as a `LieSubalgebra ℤ (Module.End ℤ 𝕆)`, with `deriv_lie_add_left`/`deriv_lie_add_right`/
`deriv_lie_self`/`deriv_lie_jacobi` exposing BILINEAR/ALTERNATING/JACOBI) + the concrete NONZERO
`witnessDeriv = innerDeriv e₂` on `O ℚ` (`derivation_nontrivial`/`derivation_ne_bot`, nonzero
theory-natively via `iota_e2_comm_iff` + `J_ne_star_J`). The moat held: NO Mathlib `Derivation`/`G₂`
import; Lie MACHINERY only on the DERIVED endomorphism ring. 30 decls foundations-only; costume C34 bites;
gate D0–D6 green. See the LEDGER N6 row. The deeper characterization (dimension / that it is `g₂`) and the
automorphism Lie GROUP are downstream children (see below), NOT this node.

**Target.** Derive the FIRST physics-recognized structure that emerges now the algebra layer (N3–N5)
and the full number tower (N7–N14, ⚠ gate RESOLVED) are banked: the **infinitesimal automorphisms —
the derivations — of the terminal algebra `𝕆`** form a Lie algebra. This is the algebraic seed of the
gauge symmetry physics recognizes (the literature — Furey, Dixon, Günaydin–Gürsey — *reads gauge groups
off* the automorphism structure of `𝕆`; we DERIVE the structure forward from the cascade instead of
positing it — the posit-vs-derive moat). A derivation is a linear `D : 𝕆 → 𝕆` satisfying the Leibniz
law `D(x·y) = D(x)·y + x·D(y)` over the banked `CD` product. Prove: (i) the commutator `[D,E] = D∘E −
E∘D` of two derivations is again a derivation (closure — uses only Leibniz, NOT associativity of `𝕆`,
so it is exactly the kind of structure `𝕆`'s non-associativity still permits); (ii) `Der(𝕆)` is a Lie
algebra (bilinear, alternating, Jacobi); (iii) NON-VACUITY: a concrete NONZERO derivation exists on
`O ℚ`, so the structure is non-trivial (not the zero algebra). The deeper characterization (its
dimension / that it is `g₂`) and the Lie GROUP of automorphisms (which exponentiates over the now-derived
continuum) are downstream children, NOT this node.
**What "done" requires.** Lean theorems over the banked terminal algebra (`O ℚ` witnesses; no new
carrier posited): the Leibniz-derivation predicate built from the banked `CD` product, the
commutator-closure theorem, the Lie-algebra structure, and a concrete nonzero derivation witness.
Foundations-only, costume that a WRONG claim (e.g. a non-derivation asserted to satisfy Leibniz, or the
commutator of two derivations asserted NOT to be one) FAILS to compile, gate green, STANDARD met.
**Dependency.** N5 (the banked algebra layer) + banked `CD` product/`star` + `not_associative`. PURELY
ALGEBRAIC over the cascade ground ring `ℚ`; the continuum becomes load-bearing only at the Lie GROUP /
exponentiation node downstream (now unblocked, since the ⚠ gate is RESOLVED).
**Drift trap.** Derive FORWARD from the banked `CD` product + the Leibniz law. Do NOT import Mathlib's
`Derivation` / `LieAlgebra` / `G₂` machinery and ASSERT that `𝕆`'s derivations ARE `g₂` / a Lie algebra
(the SAME posit-vs-derive drift trap N3/N4/N5 avoided) — build the predicate and prove the bracket
closes yourself (W1: Mathlib absence is not a wall; note `O ℚ` has NO `Ring` instance, so generic
derivation API may not apply). Do NOT posit the bracket as a structure; PROVE the commutator of two
derivations satisfies Leibniz. Do NOT claim the dimension or that it is `g₂` (downstream child). Do NOT
reach for `ℝ` — the derivation algebra is purely algebraic; if it fights you toward the continuum, that
is the GROUP node, not this one.
**THE ONE LAW (W5).** If the bracket-closure fights you, return to the trunk: the commutator of two
Leibniz-derivations is a derivation *because* the Leibniz law is bilinear in the product — no
associativity needed, which is exactly why this structure survives on the non-associative `𝕆`. Do NOT
add a hypothesis; do NOT weaken to an associative base. If a sub-lemma still fights after the
theory-native reframe → DECOMPOSE (W3): bank the closure + a costume that bites, child the remainder
onto the chain tail, complete as "decomposed."
**Physics-words-removable.** Delete "gauge", "symmetry", "automorphism-as-physics": the theorems are a
pure statement that the Leibniz-derivations of the terminal algebra form a Lie algebra under the
commutator bracket, non-trivially. No physics name may be load-bearing.

## N15 — MAKE "RESOLVED" LITERAL: purge the last vestigial Mathlib number-content imports  (Foundation hygiene)  ✅ LANDED (commits f984224 STEP A + 9587bf2 STEP B)
**LANDED.** ZERO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` anywhere in `Phys/` (grep returns nothing
tree-wide) — the ⚠ NUMBER-TOWER/CONTINUUM gate is now LITERALLY, not merely substantively, resolved.
STEP A (subtractive, safe): retired the two superseded imported-ℚ continuum files `Continuum.lean` +
`CompletionContinuum.lean` (the N6-pre obstruction+resolution halves over imported ℚ — re-grounded over the
derived ℚ at N10 `ContinuumDerived.lean`, verified each theorem has a derived analogue before deletion);
dropped from `Phys.lean` + `AxiomAudit.lean`; retired costume C23 (role taken by derived-ℚ C28), re-pointed
costume C24 to the derived `ContinuumQ.sqrt2` (still bites). STEP B (N1 root): purged `Mathlib.Data.Int.Basic`
from `Fold.lean`; the tightness witness `fold_int_nonzero_not_fixed` (over imported ℤ) re-expressed as
`fold_nonzero_not_fixed` over `ZMod 3` — MACHINERY, 2-torsion-free (so `fold_self_blind` genuinely applies),
no content number system. THE ONE LAW: importing the derived ℤ would CYCLE (`Fold → Counting → IntegerTower`),
so the generic/machinery reframe for a tightness witness was the forced route. Full-tree rebuild from the N1
root (3332 jobs, legitimate cascade); gate D0–D6 green, 33/33 costumes, 392 theorems foundations-only. The
deliverable: the chain's number ground is now literally fold-derived — a reviewer finds ZERO Mathlib number-
content imports in `Phys/`. (Historical spec below, retained for the record.)

**Target (as specified).** The ⚠ NUMBER-TOWER/CONTINUUM gate is *substantively* RESOLVED — the load-bearing spine
(cascade → algebras → Jordan cap → derived continuum → the N6 derivation Lie algebra) is number-import-free.
But a whole-tree scan still finds THREE vestigial `Mathlib.Data.{Int,Rat}` imports that must be retired so a
reviewer finds ZERO `Mathlib.Data.{Nat,Int,Rat,Real,Complex}` anywhere in `Phys/` — making "RESOLVED"
LITERAL, not merely substantive. This is the LEDGER's flagged "★ NEXT OBLIGATION — small, do it before it
grows," now overdue (N6 just accreted the first Emergent-layer physics on top of the stragglers). It is a
MECHANICAL cleanup node — **no new derivation** — but it touches the foundation file `Fold.lean` (N1) and
forces a full-tree rebuild, so it earns its own node (do NOT bolt it onto a physics bank).
**The three stragglers (verified present at N6 bank):**
  1. **`Phys/Foundation/Continuum.lean`** (`import Mathlib.Data.Rat.Defs` + `Mathlib.Data.Rat.Lemmas`) —
     the ORIGINAL N6-pre obstruction half over *imported* ℚ, SUPERSEDED by `ContinuumDerived.lean` (the
     re-grounded version over the derived ℚ `Q`). Still aggregated in `Phys.lean` (line ~37) though nothing
     load-bearing builds on it. RETIRE it: drop it (and `CompletionContinuum.lean` if it too is the
     superseded imported-ℚ version — VERIFY via dependency grep first) from `Phys.lean`, delete the file(s),
     confirm the tree still builds + gate green. ⚠ Before deleting, grep for any downstream importer
     (`search_files "import Phys.Foundation.Continuum"`) — if anything outside the superseded pair imports
     it, re-point to `ContinuumDerived` first.
  2. **`Phys/Foundation/Fold.lean`** (`import Mathlib.Data.Int.Basic`) — used ONLY by the tightness witness
     `fold_int_nonzero_not_fixed` (over ℤ a nonzero state is moved by the look-back — a NEGATIVE/tightness
     witness, not the load-bearing spine, like N1's char-2 carrier or N2's `ZMod 5`). Re-express that witness
     over the DERIVED ℤ (`Phys.Foundation.Z`, banked N8) or a generic 2-torsion-free ordered group, so NO
     `Mathlib.Data.Int` import remains in the foundational file. THE ONE LAW check: if the derived-ℤ
     re-expression fights, the witness is a TIGHTNESS witness (machinery), so a generic-ordered-group framing
     is the reframe — do NOT keep the imported ℤ "because it's just a witness" (that is the exact
     rationalization the moat forbids; a witness in N1 the foundation file is the most visible straggler).
**What "done" requires.** ZERO `Mathlib.Data.{Nat,Int,Rat,Real,Complex}` imports tree-wide in `Phys/`
(grep returns nothing), the tree builds, gate D0–D6 green, the deleted-file's costume (if any) re-pointed or
retired, LEDGER updated (move the "★ NEXT OBLIGATION" out of OWED, mark the gate row literally resolved).
**Dependency.** None new — purely subtractive + one witness re-expression over banked N8 `Z`.
**W9 note.** Deleting `Continuum.lean` + editing `Fold.lean` (N1, near the root) forces a FULL-TREE recompile
(~3 min cold, legitimate — like the N14 N2-edit cascade). PREREG a KILL budget; the witness re-expression
itself is light (a single `∃`-witness lemma over the derived ℤ). Do NOT inflate maxHeartbeats; if the
re-expression is heavy, that is a framing signal (reframe through a generic ordered group).
**Physics-words-removable.** Trivially — this node removes content, proves nothing physical; the only
deliverable is that the chain's ground is literally, not just substantively, fold-derived.

## N16 — TOWARD THE DIMENSION / g₂ CHARACTERIZATION of Der(O ℚ)  (Emergent, depth 3)  ✅ STRUCTURAL CORE BANKED + DECOMPOSED (W3)
**LANDED (structural core).** `Phys/Algebra/DerivationDim.lean` (ns `Phys.Algebra`). The theory-native
STRUCTURAL CORE of the deeper claim N6 deferred, derived FORWARD from the banked `IsDeriv` predicate,
NO posited `G₂` import (the posit-vs-derive moat held): ★ `deriv_one` — every Leibniz-derivation of the
terminal algebra kills the unit (`D 1 = 0`; pure Leibniz + the unit law, `D 1 = D(1·1) = D1 + D1` ⟹
`D 1 = 0`; no associativity, no coordinates) — the FIRST structural reduction cutting `Der(𝕆)` toward
`g₂` (a derivation is determined by its restriction to the imaginary subspace); ★ `witnessDeriv_one` —
the banked NONZERO witness (N6) kills the unit (anti-vacuity: a genuinely nonzero map annihilating `1`).
Costume C35 (`DerivationUnitCostume`: the nonzero `witnessDeriv` asserted to PRESERVE the unit → false
core `0 = 1`) bites. Foundations-only `[propext, Quot.sound]` / `[propext, Classical.choice, Quot.sound]`.

**Confirmed by faithful exact-rational numerics (workbench/N16-g2-dimension, re-runnable):** the model
builds `O ℚ = CD(CD(Dbl ℚ))` from the EXACT banked CD product + star (byte-for-byte the Lean formula),
reproduces the standard octonion table, and computes the FULL Leibniz linear system (512 eqns, 64
unknowns) by EXACT Gaussian elimination: **rank = 50, nullity = 14 ⟹ dim_ℚ Der(O ℚ) = 14** (= dim g₂).
Every derivation: kills the unit, is skew for the Born form (`M = −Mᵀ` ⟹ `Der ⊆ so(7)`), preserves the
imaginary subspace, commutes with conjugation; an explicit 14-element integer basis exists (saved
`nullbasis.pkl`).

**WHY DECOMPOSED (W3 — explicitly permitted by the ticket).** The EXACT `dim = 14` count is a 512×64 ℚ-rank
over fully-expanded octonion coordinates — the monolithic-brute-on-coordinates signature **W9 forbids**.
Moreover `O ℚ` carries only a ℤ-module structure (`narCD` ⟹ `NonAssocRing`; `Module ℚ (O ℚ)` does NOT
synthesize — measured), so the dimension framing first needs `Module ℚ (O ℚ)` built, and the so(7)/`g₂`
skew reduction needs ℚ-linearity of `D` (to kill the trace ℚ-scalar). These are genuine prerequisite
infrastructure + the W9-prime rank, correctly scoped to a dedicated dissolution child, NOT bypassed.
The child starts from: dim=14 confirmed, the explicit basis, the so(7) reduction, and the structural
lemmas banked here. **The full `dim = 14` and the `≅ g₂` Lie-isomorphism are CHILDED (N17), never asserted.**

## N17 — Module ℚ (O ℚ) + THE COORDINATE-FREE SKEW REDUCTION Der(O ℚ) ⊆ so(Born) = so(7)  (Emergent, depth 3)  ✅ STRUCTURAL REDUCTION BANKED + DECOMPOSED (W3)
**LANDED (the forward structural reduction — the route's HEART).** `Phys/Algebra/DerivationSkew.lean`
(ns `Phys.Algebra`, commit 06171e4). The prerequisite infra + the so(7) containment N16 W3-scoped, all
derived FORWARD from the banked `IsDeriv` predicate, foundations-only ⊆ {propext, Classical.choice,
Quot.sound}, NO posited `G₂`/`LieAlgebra.g2` import (the posit-vs-derive moat held):
  • ★ `instModuleQO` / `instModuleQH` / `cdModuleQ` / `dblModuleQ` — `Module ℚ (O ℚ)` (the terminal
    algebra as an 8-dim ℚ-vector space), built componentwise (machinery on the DERIVED object, STANDARD
    §3 — like `Matrix`/`Module` at N3/N4, NOT a posited number system). The measured-missing infra is DONE.
  • `deriv_qsmul` — every ℤ-linear derivation is automatically ℚ-linear (`map_rat_smul`).
  • `trace_id` — `x + star x = (2 reQ x) • 1` (the real part lands on the unit line).
  • `deriv_star` — `D (star x) = -D x` (a derivation reflects conjugation).
  • `deriv_real_zero` — a derivation KILLS every self-conjugate (real) element (2-torsion-freeness of the
    derived ℚ made load-bearing — the same self-blindness `2 ≠ 0` the trunk rests on).
  • `selfMul_selfconj` — the Born self-overlap `x · star x` is self-conjugate.
  • ★★ `deriv_norm_preserve` — `D x · star x = x · D x` = the SKEW-ADJOINTNESS = the containment
    `Der(O ℚ) ⊆ so(Born) = so(7)` (dim ≤ 21), derived COORDINATE-FREE: THE ONE LAW / TRUNK REFRAME —
    the Born self-overlap is self-conjugate ⟹ a derivation kills it ⟹ Leibniz gives skew. The W9
    monolithic 8-coordinate / 512×64 rank ENTIRELY AVOIDED. This is the bankable HEART of the count.
  • `deriv_skew_polar` — the polarized bilinear skew form.
  • `witnessDeriv_skew` — non-vacuous on the banked NONZERO witness (W8).
Costume C36 (`DerivationSelfOverlapCostume`: the nonzero `witnessDeriv` asserted to kill the self-overlap
to `1` → false core `0 = 1`) bites. Gate D0–D6 green (35/35 costumes, 403 theorems foundations-only).

**Numerics RE-VERIFIED independently this node (W6):** `deriv_dim.py` → rank 50 / nullity 14 ⟹ dim = 14;
`structural.py` → every basis derivation kills the unit, is skew (M = −Mᵀ), preserves Im, commutes with
star; 14 integer-sparse basis matrices, rank 14, pivot columns [10,11,12,13,14,15,19,20,21,22,23,37,38,39].

**WHY DECOMPOSED (W3 — the frozen PREREG's expected outcome given W9).** The EXACT `dim = 14` (the so(7)→g₂
cut 21→14) is a 512×64 ℚ-rank over fully-expanded octonion coordinates — the monolithic-brute-on-coordinates
signature W9 FORBIDS (workbench/N16-g2-dimension/FINDINGS.md records the Lean brute route as DEAD); and the
`≅ g₂` Lie isomorphism is W1 (Mathlib may lack a usable `g₂` to compare against). Both are CHILDED to N18
(t_c0b5786d, linked on the chain tail), never asserted, never a bridge. The structural reduction — the route
the count descends — is banked forward, which is the bankable core. This is legitimate decomposition (NOT
scope reduction): the exact count is W9-prime and the iso is W1, both explicitly scoped, not bypassed.
**Dependency.** N16 (the structural core + numerics). **Drift trap.** Same posit-vs-derive moat.

## N18 — THE TRACE-FREE / Im-PRESERVING refinement of `Der(O ℚ) ⊆ so(Born)`  (Emergent, depth 3)  ✅ LANDED (the qualitative so(7) picture COMPLETE; exact dim=14 + ≅g₂ childed N19)
**What landed (commit 2681c45, `Phys/Algebra/DerivationTraceFree.lean`).** The QUALITATIVE so(7)
characterization of `Der(O ℚ)` is now COMPLETE in Lean — all FOUR structural constraints the
exact-rational numerics record for every derivation, each derived COORDINATE-FREE (the W9 512×64
monolith ENTIRELY AVOIDED): (1) `D 1 = 0` (N16), (2) skew `D x·star x = x·D x` ⟹ `Der ⊆ so(7)`
(N17), ★ (3) TRACE-FREE `reQ (D x) = 0` / `star (D x) = −D x` (`deriv_reQ_zero`/`deriv_maps_im`:
`D` maps `O` into the 7-dim imaginary subspace), ★ (4) commutes with conjugation
(`deriv_comm_star`). THE TRUNK REFRAME (THE ONE LAW): for imaginary x, skew gives the Jordan/Born
anticommutation `{Dx,x}=0` (`deriv_jordan_anticomm`); conjugate + sum + the trace identity (the
symmetric part lands central) collapse to `(4 reQ Dx)•x = 0`; x imaginary nonzero + the derived ℚ
a field ⟹ reQ Dx = 0; general x → its imaginary part (real part killed by `deriv_one`). NO
coordinates, NO posited `G₂`. Non-vacuous on the banked nonzero witness
(`witnessDeriv_reQ_zero`/`_maps_im`/`_comm_star`). 10 theorems + corollaries foundations-only;
costume C37 (`DerivationTraceFreeCostume`) bites `⊢ 0 = 1`; gate D0–D6 green (36/36 costumes, 413
theorems audited). STANDARD applied: unbroken / complete / physics-words-removable.
**Why this is forward progress, NOT a re-child.** N16 banked `D 1 = 0`; N17 banked the skew
reduction; both childed the exact count. N18 banks the two genuinely-NEW qualitative constraints
(trace-free + conj-commute) that COMPLETE the so(7) picture — a new theorem family, not a
restatement. The exact `dim = 14` is childed with a SHARPER target (the finrank scaffold is now
the named first sub-node), never asserted, never a bridge.

## N19 — THE FINITE-DIMENSIONALITY SCAFFOLD on `O ℚ` + the LOWER BOUND `dim_ℚ Der(O ℚ) ≥ 14`  (Emergent, depth 3)  ✅ LANDED (scaffold + lower bound; the upper bound ≤14 + ≅g₂ childed N20)
**What landed — PART 1, the scaffold (commit 0aab339, `Phys/Algebra/DerivationFinrank.lean`).** The PREREQUISITE
finite-dimensionality scaffold the exact count needs — N18 FINDINGS flagged it as "the real
first blocker, a node of its own." Derived FORWARD, foundations-only ⊆ {propext, Classical.choice,
Quot.sound}, NO posited `G₂`/`LieAlgebra.g2`: ★ the STRUCTURAL product equivalences
`cdProdEquiv : CD A ≃ₗ[ℚ] A × A` / `dblProdEquiv : Dbl ℚ ≃ₗ[ℚ] ℚ × ℚ` (the W9.4 structure-over-
expansion route); `Module.Finite ℚ` for `Dbl/H/O ℚ`; ★★ `finrank_O_eq_eight` (`finrank ℚ (O ℚ) = 8`
via `2 → 4 → 8` through the equivs — NO 8×8 coordinate basis matrix, the W9 expansion AVOIDED as
N17/N18 avoided the 512×64 kernel); `finrank_End_eq_64`; the ℚ-scalar/product compatibility
`qsmul_mul_left/right`; ★ `derivationQ : Submodule ℚ (Module.End ℚ (O ℚ))` (so `Module.finrank ℚ
derivationQ` is a WELL-TYPED ℕ); the ℤ→ℚ correspondence `toEndQ`/`toEndQ_isDerivQ` (N6's `Der`
lifts in via `map_rat_smul`); the banked NONZERO witness as a ℚ-derivation `witnessDerivQ` (anti-
vacuity, W8); ★ `derivationQ_ne_bot` + ★★ `finrank_derivationQ_pos` (`0 < dim`) + `finrank_derivationQ_le`
(`dim ≤ 64`) ⟹ the WELL-TYPED bounds `1 ≤ dim_ℚ Der(O ℚ) ≤ 64`.
**What landed — PART 2, the lower bound (run 121, `Phys/Algebra/DerivationLowerBound.lean`).**
★★ `finrank_derivationQ_ge_14` (`14 ≤ Module.finrank ℚ derivationQ`) — the well-typed lower frame
sharpened from `1` to the EXACT `≥ 14` by EXHIBITING 14 explicit linearly-independent derivations.
The 14 `DkE : Module.End ℚ (O ℚ)` are the explicit integer-sparse nullbasis of the Leibniz ℚ-system
(workbench/N16-g2-dimension/nullbasis.pkl, re-verified exact-rational this run: all 14 are genuine
derivations of the EXACT octonion product, rank 14), each built componentwise on the DERIVED `O ℚ`
(machinery, STANDARD §3) and PROVED to satisfy the Leibniz law (`DkE_isDerivQ`, ≈8s each). ★ THE
INDEPENDENCE IS DIAGONAL (the W1/W9.4 reframe that dissolves a 14×14 determinant): each `DkE` has a
coordinate where it is the UNIQUE nonzero among the 14, so the read-off functionals `φₖ(D) :=
(D eᵢₖ).coord_aₖ` form a NEGATED identity (`φₖ(Dⱼ) = -δₖⱼ`) ⟹ `Dvec_linearIndependent` with no
determinant. Their span sits in `derivationQ` (`Dvec_mem`), so `Submodule.finrank_mono` gives the
bound. Costume C39 (`DerivationLowerBoundWrongCountCostume`: `finrank ≤ 13` collides with the
banked `≥ 14` → omega refutes) bites. Gate D0–D6 green (38/38 costumes, 438 theorems audited),
default maxHeartbeats (NEVER inflated); the full 14-derivation file elaborates in ≈21s, well under
the frozen 90s/obligation KILL budget.
**Why this is forward progress, NOT a re-child.** N18 completed the qualitative so(7)
characterization but `Module.finrank ℚ Der(O ℚ)` was not even a well-typed statement (no
finite-dimensionality on `O ℚ`). N19 banks exactly that infra AND the EXACT lower bound `≥ 14` (the
14 explicit derivations, the literature's actual content for the dimension count, here CONSTRUCTED
and PROVED rather than read off a posited `g₂`). The matching upper bound `≤ 14` (the so(7)→g₂ cut
21→14, the rep-theoretic W9-prime half) + the `≅ g₂` structure are childed (N20), never asserted,
never a bridge.
**W9.2 measurement that de-risked the lower bound (workbench/N19-g2-exact/FINDINGS.md):** the full
lower-bound architecture (3-derivation probe: LinearMap construction + IsDerivQ + the diagonal-
functional `LinearIndependent` idiom) elaborated clean in ≈8s BEFORE committing to all 14 — the
independence idiom (the previously-unmeasured risk) works; the per-matrix IsDerivQ checks are NOT a
W9 wall. The N6 `innerDeriv` family gives only 3 (Der(H)=so(3)); the other 11 are genuinely
octonionic outer derivations (the explicit matrices).

## N20 — THE UPPER BOUND `dim_ℚ Der(O ℚ) ≤ 14` (the so(7)→g₂ cut 21→14) ⟹ THE EXACT `= 14`  (Emergent, depth 3)  ✅ LANDED (run 123)
**What landed (`Phys/Algebra/DerivationUpperBound.lean`, commits 58b9cc5 + 90de722).** ★★★ THE
EXACT DIMENSION IS CLOSED: `finrank_derivationQ_eq_14` (`Module.finrank ℚ derivationQ = 14`),
the `dim g₂` value DERIVED end-to-end from the fold's cascade — NO posited `G₂`/`LieAlgebra.g2`
(the SAME posit-vs-derive moat N3/N4/N5/N6/N16/N17/N18/N19 held). ★ THE UPPER BOUND
`finrank_derivationQ_le_14` is the so(7)→g₂ cut 21→14, DISSOLVED from the trunk: `O ℚ` is
multiplicatively GENERATED by e1,e2,e4 (e3=e1·e2, e5=e1·e4, e6=e2·e4, e7=e3·e4) so a derivation
is COMPLETELY DETERMINED by `D e1, D e2, D e4` (`determined`) ⟹ `Der ↪ (O ℚ)³`; each `D ei`
trace-free (banked N18, here `derivQ_reQ_zero`) ⟹ naive 3×7=21; the Leibniz law on the
generator PRODUCTS imposes EXACTLY 7 structural c0-coordinate cut constraints (`cut_e1_c1`/
`cut_e2_c2`/`cut_e4_c4` diagonal skew, `cut_e12_c0`/`cut_e14_c0`/`cut_e24_c0` off-diagonal skew,
★ `cut_e34_c0` the ONE octonionic step e3·e4=e7 — the non-associativity `associator(e1,e2,e4)=
2e7≠0` that STOPPED the cascade, entering through `D e3=0` from `D e1=D e2=0`) cutting 21→14. The
14 pivot coords assemble into the injective `coordMap`/`coordMapR : derivationQ →ₗ[ℚ] (Fin 14 →
ℚ)` (`coordMapR_injective` via the cascade `gens_zero` + `determined`), so
`LinearMap.finrank_le_finrank_of_injective` + `finrank ℚ (Fin 14 → ℚ)=14` gives `≤ 14`;
`le_antisymm` against the banked N19 `finrank_derivationQ_ge_14` CLOSES `= 14`.
**W9 discipline held.** No brute 512×64 kernel, no inflated maxHeartbeats — the cut is STRUCTURAL
(7 bounded c0-coordinate constraint lemmas ~6–7s each + a bounded determination cascade), each
banked-as-you-go (W9.8). Run-122 inherited an INCOMPLETE production file (timed out mid-write, no
olean); the W6 fix was a one-line simp-set repair (3 diagonal lemmas missing `CD.zero_re` left
`(re 0).re.re` unreduced so `linarith` failed), then the missing assembly written fresh and
banked. Foundations-only ⊆ {propext, Classical.choice, Quot.sound} (all 11 new decls, AxiomAudit
registered). Costume C40 (`DerivationUpperBoundWrongCountCostume`: `finrank = 15` collides with
`≤ 14` ⟹ `15 ≤ 14`, omega refutes) bites. Physics-words-removable: delete gauge/g₂/automorphism
⟹ the pure statement that the Leibniz-derivation ℚ-submodule of the Cayley–Dickson double of a
double of a double of ℚ has dimension exactly 14.
**What is childed to N21 (never asserted here, never a bridge).** The `g₂` STRUCTURE: the explicit
14-element derivation basis + the Lie-bracket structure constants (from N6 `isDeriv_bracket`, the
commutator of two derivations is a derivation) + the `≅ g₂` Lie isomorphism, derived FORWARD.

## N21 — THE g₂ STRUCTURE of Der(O ℚ): explicit basis + Lie-bracket structure constants + ≅ g₂  (Emergent, depth 3)  ✅ LANDED (a + b; the ≅ g₂ Lie-isomorphism childed N22)
**What landed (commits 32f418f + 05c4345; finalize-verified this run after the run-125 mid-finalization
timeout).** The g₂ LIE STRUCTURE of `Der(O ℚ)` is now EXHIBITED as an explicit 14-dimensional Lie
algebra with a fully proved bracket table, derived FORWARD, NO posited `G₂`/`LieAlgebra.g2` (the moat
held). PART 1 `Phys/Algebra/DerivationBracket.lean`: ★ `isDerivQ_bracket` (the ℚ-analog of N6 — the
commutator of two ℚ-linear derivations is a derivation, distributivity + Leibniz ALONE, no
associativity); ★ `derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ))` carved by `IsDerivQ` (carrier
= `derivationQ`), inheriting LieRing+LieAlgebra (bilinear/alternating/Jacobi); ★★ `derivBasis :
Module.Basis (Fin 14) ℚ derivationQ` — the 14 `D0E..D13E` form a BASIS (independence lifted into the
submodule via `Dsub_indep`, spanning via the banked `finrank_derivationQ_eq_14`,
`basisOfLinearIndependentOfCardEqFinrank`). PART 2 `Phys/Algebra/DerivationStructureConstants.lean`:
★★ ALL 91 distinct pairs `⁅DiE,DjE⁆ = Σ cᵏᵢⱼ DkE` proved FORWARD (`br_0_1 … br_12_13`, each by
`ext`+`simp`+`ring` on the derived CD product, bounded per entry — NO monolithic table-bash); integer
constants in {−2,−1,1,2}, 84/91 nonzero; the two-term octonionic entries (e.g. `br_4_7 = 2 D0E + 2 D3E`)
are the associator contribution of the SAME non-associativity that stopped the cascade. Costume C41
(a WRONG structure constant `⁅D0E,D1E⁆ = D2E` vs the proved `−2 • D2E`) bites. 7 key theorems
independently axiom-audited ⊆ {propext, Classical.choice, Quot.sound}; gate D0–D6 green (40/40 costumes,
453 theorems). The `≅ g₂` Lie-isomorphism is childed N22 (W1 — Mathlib's exceptional-Lie support is thin,
BUILD the comparison object, never posit it to "match"; the basis + bracket table is the legitimate
bankable forward increment). (Historical target spec below.)

**Target.** On the banked exact dimension `finrank_derivationQ_eq_14` + the 14 explicit
derivations `D0E..D13E` (N19) + the bracket source `isDeriv_bracket` (N6, the commutator of two
derivations is a derivation), derive the `g₂` LIE STRUCTURE FORWARD: (a) the 14 `DkE` form a
BASIS of `derivationQ` (independent — N19 `Dvec_linearIndependent` — + spanning, now that
`dim = 14` is banked, via `finrank` + `LinearIndependent.span_eq_top_of_card_eq_finrank` or the
basis-from-independent-and-card route); (b) the Lie-bracket structure constants `[DiE, DjE] =
Σ cᵏᵢⱼ DkE` computed explicitly (each `[DiE,DjE]` is a derivation by `isDeriv_bracket`, hence a
ℚ-combination of the basis — read off the `cᵏᵢⱼ` by the same diagonal-functional route N19 used);
(c) the `≅ g₂` Lie isomorphism — the 14-dim Lie algebra with this proved bracket table IS `g₂`.
**W1 (if Mathlib lacks a usable `g₂`).** Per W1 NOT a wall: do NOT posit/import a `G₂` to "match."
The 14-dim Lie algebra with its proved bracket table IS the bankable object; "this 14-dim Lie
algebra IS g₂" asserted without the structure-constant proof is a D3 bridge. Reframe through the
trunk FIRST; if the full `≅ g₂` Lie-isomorphism resists (Mathlib may lack a usable exceptional-Lie
`g₂` to compare against — then BUILD the comparison object, W1), child the isomorphism and bank the
explicit basis + bracket table as the forward increment.
**W9.** The bracket computation is `[DiE,DjE] x = DiE(DjE x) − DjE(DiE x)`, a composition of the
explicit sparse coordinate maps — bounded per entry; bank each structure-constant family
separately (W9.3/W9.8). Do NOT attempt the whole 14×14 bracket table in one monolithic tactic.
**Dependency.** N20 (`finrank_derivationQ_eq_14` + `derivationQ`) + N19 (`D0E..D13E`,
`Dvec_linearIndependent`) + N6 (`isDeriv_bracket`). **Drift trap.** Same posit-vs-derive moat; the
bracket table must be PROVED from the explicit derivations, the `≅ g₂` never cited at grade or read
off a posited `G₂`.

## N22 — THE ≅ g₂ LIE ISOMORPHISM: the 14-dim Lie algebra `derivationLieQ` with its proved bracket table IS g₂  (Emergent, depth 3)  ✅ LANDED (the FAITHFUL 7-dim g₂ fundamental rep banked; the compact-form Killing-definiteness + simplicity childed N23)
**What landed (commit b87b6c1, `Phys/Algebra/DerivationRep7.lean`).** The g₂ FUNDAMENTAL
REPRESENTATION of `derivationLieQ` is now exhibited in Lean — the 14-dim derivation Lie algebra
acting FAITHFULLY on the 7-dim imaginary subspace, derived FORWARD, NO posited `G₂`. ★ `ImO :=
ker(starL + 1)` (the imaginary subspace; `starL` = conjugation as a ℚ-linear endomorphism). ★★
`finrank_ImO` (`finrank ℚ ImO = 7`) via rank–nullity: `range(starL+1) = ℚ·1` (the banked N17
trace identity promoted to a range statement) is 1-dim, `finrank (O ℚ) = 8` is banked N19, so the
kernel is `8 − 1 = 7` — NO 7-coordinate basis matrix (the W9 expansion AVOIDED). ★ `derivLieQ_mapsTo`
— every `D ∈ derivationLieQ` maps `ImO` into `ImO` (banked N18 `deriv_maps_im`: a derivation output
is purely imaginary). ★ `imRep : derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO` — the restriction-to-Im Lie
homomorphism (bracket respected because `ImO` is invariant). ★★ `imRep_injective` — FAITHFUL:
`imRep D = 0 ⟹ D u1 = D u2 = D u4 = 0` (u1,u2,u4 ∈ ImO) `⟹ D = 0` by the banked N20 `determined`.
A 14-dim Lie algebra acting faithfully on a 7-dim space = the G₂ fundamental representation.
Anti-vacuity: `imRep_witness_ne_zero` (the banked NONZERO witness has nonzero image). Costume C42
(`DerivationRep7WrongCostume`: the nonzero witness asserted to act as ZERO under `imRep` ⟹ `rfl`
cannot close `imRep witnessLieQ = 0`) bites. Foundations-only ⊆ {propext, Classical.choice,
Quot.sound} (5 key decls audited); gate D0–D6 green.

**★ THE W1 SURVEY + THE COMPACT-vs-SPLIT FINDING (why NOT a literal `LieEquiv` — THE ONE LAW).**
Mathlib HAS `LieAlgebra.g₂ R := Matrix.ToLieAlgebra R CartanMatrix.G₂` (the Serre-relation quotient
of the free Lie algebra on the G₂ Cartan matrix — a genuinely DERIVED type-G₂ object, NOT a posited
G₂), and `FreeLieAlgebra.lift` to map out of it; but it has NO structure theory (no `finrank = 14`,
no simplicity, no root system). The route-deciding numerics (exact-rational, reusing the BANKED 14
derivations + proved bracket table — W6) compute the Killing form `K(Di,Dj) = tr(adDi·adDj)`:
nondegenerate (rank 14), diagonal all −16, and NEGATIVE-DEFINITE (leading principal minors of −K all
> 0). ⟹ `Der(O ℚ)` is the COMPACT real form of g₂ (the DIVISION/anisotropic octonions), whereas the
Serre `LieAlgebra.g₂ ℚ` is the SPLIT form. Compact ≇ split over ℚ (a definite vs. indefinite Killing
form is an isomorphism invariant), so a literal `LieEquiv ℚ derivationLieQ (LieAlgebra.g₂ ℚ)` is
FALSE. THE ONE LAW (W5): forcing it would fight because the TARGET is wrong, not the theory. Per W1
step 3 / W3 the honest move taken: bank the sharpest TRACTABLE invariant pinning `derivationLieQ` as
type-G₂ (the faithful 7-rep) and child the compact-form completion.

**What is childed to N23 (never asserted here, never a bridge).** The full compact-form pinning: the
Killing-form negative-definiteness / nondegeneracy (the compact signature, a 14×14 rational
definiteness — W9 beast) and the simplicity (no nonzero proper ideal, from the bracket table) that,
with the faithful 7-rep + banked dim = 14 + the bracket table, complete the identification of
`derivationLieQ` as the compact real form of g₂. Then the automorphism Lie GROUP (exponentiating over
the derived continuum). (Historical target spec below.)

**Target.** N21 banked the explicit 14-element `derivBasis` + the FULL 91-pair structure-constant table
of `derivationLieQ`. The remaining claim — "this 14-dim Lie algebra IS `g₂`" — must be PROVED FORWARD as
a Lie-algebra isomorphism, never asserted at grade and never read off a posited `G₂`. Concretely: either
(i) Mathlib has a usable exceptional-Lie `g₂` (e.g. via `LieAlgebra.IsKilling` / a Cartan-matrix /
root-system presentation) and we exhibit an explicit `LieEquiv` from `derivationLieQ` to it, matching the
proved bracket table to its structure constants; OR (ii) per W1 — Mathlib's exceptional-Lie support is
thin and lacks a usable `g₂` — we BUILD the comparison object (the abstract 14-dim simple Lie algebra of
type G₂, e.g. from its Cartan matrix / Chevalley relations or as the derivation algebra of the split
octonions) and prove the `LieEquiv` against it. The deliverable is the proved isomorphism (or, if it
genuinely resists after the trunk reframe, the sharpest invariant that pins `derivationLieQ` as G₂ —
e.g. that it is a 14-dim simple Lie algebra with the G₂ root system / Killing-form signature — with the
remaining gap childed, NEVER a bridge).
**What "done" requires.** A Lean `LieEquiv ℚ derivationLieQ <g₂-object>` (or the built comparison object
+ the equivalence), with the bracket table N21 proved matching the target's structure constants;
foundations-only; a costume that a WRONG isomorphism (mismatched bracket / wrong dimension / non-simple
target) FAILS; gate green; STANDARD met. NO posited `G₂` asserted equal at grade.
**Dependency.** N21 (`derivationLieQ`, `derivBasis`, the `br_*` bracket table) + N20
(`finrank_derivationQ_eq_14`).
**Drift trap.** The SAME posit-vs-derive moat: the isomorphism must be PROVED from the explicit basis +
bracket table, the `≅ g₂` never cited at grade or read off a posited `G₂`. If Mathlib lacks the target,
BUILD it (W1: Mathlib absence is not a wall) — do NOT import a `G₂` and ASSERT the equality. If the full
isomorphism fights you after the trunk reframe → DECOMPOSE (W3): bank the largest proved invariant +
a costume that bites, child the remainder onto the chain tail.
**Physics-words-removable.** Delete "g₂/gauge/exceptional": the theorem is a pure statement that the
14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ,
under the commutator, is isomorphic to a specific 14-dim simple Lie algebra with the exhibited
structure constants. No physics name may be load-bearing.

## N23+ physics onward — the automorphism Lie GROUP and beyond  🔭 (specified after N22 lands)
  - **The automorphism Lie GROUP** — exponentiating `Der(𝕆)` over the now-derived continuum (`ContinuumQ.Cut`,
    the derived ℝ) to the compact automorphism group, the gauge group physics recognizes.
  - then mixing, spacetime signature — each specified only after its predecessor lands.

**Why we stop the spec here:** a roadmap that dictates the full derivation in advance is a
hardcoded solution. The agent earns each node, and the next target is specified against what
the chain actually produced — not against what we guessed it would. The fold is the start of
all physics; we let it unfold and specify the next target from the ground it actually creates.
