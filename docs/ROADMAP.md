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

## N22 — THE ≅ g₂ LIE ISOMORPHISM: the 14-dim Lie algebra `derivationLieQ` with its proved bracket table IS g₂  (Emergent, depth 3)  ✅ LANDED (the FAITHFUL 7-dim g₂ fundamental rep banked; the compact-form perfectness banked N23; Killing-definiteness + simplicity childed N24)
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

## N23 — THE COMPACT-FORM / TYPE-G₂ PINNING, increment 1: PERFECTNESS + NON-SOLVABILITY of `derivationLieQ`  (Emergent, depth 3)  ✅ LANDED (the cleanly-tractable type-G₂ invariant banked; irreducibility / Killing nondegeneracy+definiteness / simplicity childed N24)
**What landed (commit pending, `Phys/Algebra/DerivationPerfect.lean`).** The 14-dim derivation Lie
algebra `derivationLieQ` is now proved PERFECT (`⁅⊤,⊤⁆ = ⊤`, `derivationLieQ_perfect`) and hence
NOT solvable (`derivationLieQ_not_solvable`) and NOT abelian (`derivationLieQ_not_lieAbelian`),
derived FORWARD from the banked 91-pair bracket table (N21), NO posited `G₂`. THE GIFT (a bounded
MEASUREMENT, workbench/N23-g2-compact-form/design_probe.py): every basis derivation is a SINGLE
banked bracket — `D0 = -½⁅D1,D2⁆`, `D1 = ½⁅D0,D2⁆`, …, `D13 = ⁅D3,D8⁆` (all entries of the banked
`br_*` table) — so the whole algebra lies in its own derived ideal. ★ `bL : Fin 14 → derivationLieQ`
(the 14 basis derivations as Lie-algebra elements), `bL_span_top` (they span ⊤, transported from the
banked `derivBasis` along the carrier identity `derivationQ ≃ₗ derivationLieQ`), the 14 generator-
bracket certificates `cert0..cert13` (lifted from the banked `br_*` End-level table via
`LieSubalgebra.coe_bracket`), ★ `bL_mem_derived` (each `bL k ∈ ⁅⊤,⊤⁆` — a smul of a single bracket),
★★ `derivationLieQ_perfect` (`⁅⊤,⊤⁆ = ⊤` — the generators span and each lies in the derived ideal),
★★ `derivationLieQ_not_solvable` (the derived series is CONSTANT ⊤, never ⊥, since ⊤ ≠ ⊥ via the
nonzero basis vector `bL 0`). Perfect ⟹ non-solvable, non-nilpotent, non-abelian — the structural
OPPOSITE of a solvable radical, the cleanly-tractable NECESSARY edge of semisimplicity/simplicity.
Costume C43 (`DerivationPerfectSolvableCostume`: the generator bracket `⁅bL 0, bL 1⁆` asserted to
VANISH — abelian/solvable ⟹ non-perfect — contradicts banked `cert2`/`br_0_1 = -2•bL 2` with
`bL 2 ≠ 0`, left with the false core `bL 2 = 0`) bites. Foundations-only ⊆ {propext, Classical.choice,
Quot.sound} (6 decls audited); gate D0–D6 green. NO `LieAlgebra.g₂`/`G₂` imported to assert anything —
`LieIdeal`/`derivedSeries`/`IsSolvable` are MACHINERY on the DERIVED object (STANDARD §3).

**Why this route (W1/W9, decided by a bounded MEASUREMENT not a guess — PREREG.md).** The route
numerics (exact-rational, reusing the banked 14 derivations + bracket table — W6) settle: (A)
IRREDUCIBILITY of the faithful 7-rep HOLDS (the ρ(D_k) generate the full 49-dim End(ImO) — absolutely
irreducible by Burnside) but formalizing needs a LieRingModule + no-invariant-submodule setup over
the abstract 7-space (multi-run) → CHILD; (B) the KILLING form is NONDEGENERATE and the feared 14×14
det FACTORS into 7 disjoint 2×2 blocks `[[-16,±8],[±8,-16]]` (det 192 each, det K = 192⁷) but
`killingForm = trace(ad∘ad)` must be computed abstractly over the basis — the W9 beast → CHILD; (C)
NEGATIVE-DEFINITENESS each block neg-definite, full W9 → CHILD; (D) SIMPLICITY hard from the bracket
table directly → CHILD. ★ PERFECTNESS is THE GIFT — no 14×14 det, no abstract-7-space rep setup, just
14 per-bracket-cheap certificates + basis-spanning + Mathlib's derived-series API. Banked this node.

**What is childed to N24 (never asserted here, never a bridge).** The full compact-form pinning:
(A) irreducibility of the faithful 7-rep, (B) Killing-form nondegeneracy (semisimplicity by Cartan),
(C) negative-definiteness (the compact signature), (D) simplicity (no nonzero proper ideal) — which,
with the banked perfectness + faithful 7-rep + dim = 14 + bracket table, complete the identification
of `derivationLieQ` as the compact real form of g₂. Then the automorphism Lie GROUP (exponentiating
`Der(𝕆)` over the derived continuum `ContinuumQ.Cut`).

## N24 — THE COMPACT-FORM / TYPE-G₂ PINNING, increment 2: NEGATIVE-DEFINITENESS + NONDEGENERACY of the defining trace form of `derivationLieQ` (the COMPACT SIGNATURE)  (Emergent, depth 3)  ✅ LANDED (the feared 14×14 Killing-determinant W9 beast DISSOLVED through the trunk; semisimplicity / irreducibility / simplicity childed N25)
**What landed (`Phys/Algebra/DerivationCompact.lean`).** The defining trace form of the 14-dim
derivation Lie algebra is now proved NEGATIVE-DEFINITE — hence NONDEGENERATE — the COMPACT SIGNATURE
that is the defining feature of the compact real form of type G₂, derived FORWARD from the banked
Born self-overlap + skew-adjointness (N17/N18) and the bracket table (N21), NO posited `G₂`.
★ THE ONE LAW / W1 TRUNK DISSOLUTION (the headline): the N23 PREREG flagged the Killing-form
definiteness as the hardest W9 beast — a 14×14 nested-rational determinant. It DISSOLVES through the
trunk and is NEVER computed. Every derivation `D` is SKEW-ADJOINT for the positive-definite Born
self-overlap form `g v w := reQ (v · star w)` (`gFormQ_skew`, lifting banked N17 `deriv_skew_polar`
+ N18 `deriv_maps_im` to ℚ). Hence the CHEAP 8-dim DEFINING trace form `B(D,E) := tr_{O ℚ}(D ∘ E)`
(Mathlib `LieModule.traceForm`) satisfies `B(D,D) = − Σ_j g(D bO_j, D bO_j)` (`traceForm_apply_neg`,
over the orthonormal coordinate frame `coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)` / `bO`), with the Born form
anisotropic (`gForm_self_eq_zero : g x x = 0 ↔ x = 0`, sum of 8 coordinate squares — the trunk's
Born = self-overlap = POSITIVITY one level up). So ★★ `traceForm_self_nonpos` (`B(D,D) ≤ 0`) and
★★ `traceForm_self_eq_zero` (`B(D,D) = 0 → D = 0`) — NEGATIVE-DEFINITE, NO determinant, the CHEAP
8-dim form (NOT the 14×14 adjoint Killing). ★★ `traceForm_nondegenerate` (the Cartan-criterion input,
direct from negative-definiteness + `traceForm_comm` symmetry). Anti-vacuity (W8): ★ `traceForm_witness_neg`
(`B(witnessLieQ, witnessLieQ) < 0` — the banked NONZERO witness has strictly negative self-form, NOT
in the radical; purely structural, no coordinate value). Costume C44 (`DerivationCompactWrongSignatureCostume`:
the WRONG claim `0 ≤ B(w,w)` — the indefinite/degenerate/non-compact signature — discharged from the
banked strict-negativity leaves the unsatisfiable core, `linarith failed`) bites. Foundations-only
⊆ {propext, Classical.choice, Quot.sound} (6 decls independently audited via `lake env lean`); gate
D0–D6 green (43/43 costumes, 470 theorems). Compile cost LIGHT (~18s file, NOT a W9 fossil — bounded
probes measured every piece ≤12s, default maxHeartbeats never inflated). `LieModule.traceForm` is
MACHINERY on the DERIVED object (STANDARD §3); NO `LieAlgebra.g₂`/`G₂` imported to assert anything.

**Why semisimplicity is NOT banked here (childed N25, W1 — NOT scope reduction, NOT a bridge).**
`LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` needs, beyond the three banked inputs
(nondegenerate + `lieInvariant` (FREE) + reflexive (FREE)), the clause "no abelian atoms" — which is
NOT free from nondegeneracy of the DEFINING (module) trace form. For the ADJOINT (Killing) form an
abelian ideal lies in the radical (Dieudonné); but here `B(D,D) < 0` for every `D ≠ 0` (negative-
DEFINITE), so a nonzero abelian ideal is NEVER in the radical of `B` — that route is FALSE. The clean
route (skew-adjoint-for-a-definite-form ⟹ reductive, + N23 perfectness ⟹ no abelian centre ⟹
semisimple; or via irreducibility of the faithful 7-rep) is a genuine W1 next step → childed N25.

**What is childed to N25 (never asserted here, never a bridge).** (B′) SEMISIMPLICITY (the no-abelian-
atoms clause, via the reductive/skew-adjoint or irreducibility route — the three other Cartan inputs
already banked N24), (A) irreducibility of the faithful 7-rep, (D) simplicity (no nonzero proper
ideal) — which, with the banked negative-definite nondegenerate trace form + perfectness + faithful
7-rep + dim = 14 + bracket table, complete the identification of `derivationLieQ` as the compact real
form of g₂. Then the automorphism Lie GROUP (exponentiating `Der(𝕆)` over the derived continuum
`ContinuumQ.Cut`).

## N25 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 3: SEMISIMPLICITY of `derivationLieQ` (the no-abelian-atoms clause + the trivial centre)  (Emergent, depth 3)  ✅ LANDED (irreducibility of the faithful 7-rep + simplicity childed N26; then the automorphism Lie GROUP)
**What landed (`Phys/Algebra/DerivationCompact.lean`).** The 14-dim derivation Lie algebra is now
proved SEMISIMPLE — `LieAlgebra.IsSemisimple ℚ derivationLieQ` — the defining type-G₂ structural
property, derived FORWARD from the banked NEGATIVE-DEFINITE nondegenerate defining trace form (N24)
and PERFECTNESS (N23), NO posited `G₂`. The Mathlib entry
`LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` on `Φ := LieModule.traceForm ℚ
derivationLieQ (O ℚ)` discharges semisimplicity from the nondegenerate (`traceForm_nondegenerate`,
banked N24) + reflexive (`(traceForm_isSymm …).isRefl`, FREE) + Lie-invariant
(`traceForm_lieInvariant`, FREE) form PLUS the lone clause `∀ I, IsAtom I → ¬IsLieAbelian I`.
★ THE ONE LAW navigated (the N24-flagged trap NOT repeated): that clause is NOT free from the
DEFINING module form — the classical "abelian ideal ⊆ radical" Dieudonné argument is the ADJOINT
(Killing) fact whose premise is the OPPOSITE of the truth here (`B(D,D) < 0` for every `D ≠ 0`).
The clean route is THEORY-NATIVE. ★★ `derivationLieQ_center_eq_bot` (`center = ⊥`): PERFECTNESS
(`⁅⊤,⊤⁆ = ⊤`) puts every element into `lowerCentralSeries 1`, trace-orthogonal to the centre
(`traceForm_apply_eq_zero_of_mem_lcs_of_mem_center`), so a central `z` has `B(z,z) = 0` ⟹ `z = 0`
(negative-definiteness, `traceForm_self_eq_zero'`). ★★ `derivationLieQ_no_abelian_atom`: an abelian
atom `I` has `⁅I,I⁆ = ⊥`; the atom dichotomy `⁅⊤,I⁆ ∈ {⊥, I}` gives — `⁅⊤,I⁆ = ⊥` ⟹ `I ≤ center =
⊥` (contra); `⁅⊤,I⁆ = I` ⟹ `↑I` is the span of brackets `⁅x,n⁆` on which invariance forces
`B(⁅x,n⁆, w) = B(x, ⁅n,w⁆) = 0` (as `⁅n,w⁆ ∈ ⁅I,I⁆ = ⊥`), span-induction ⟹ `B(z,z) = 0` ⟹ `z = 0`
⟹ `I = ⊥` (contra). ★★★ `derivationLieQ_semisimple`: the assembly. 4 decls foundations-only
⊆ {propext, Classical.choice, Quot.sound} (independently axiom-audited via `lake env lean`, not
trusting the gate); gate D0–D6 GREEN (45 costumes, 474 theorems). Costume C45
(`DerivationSemisimpleAbelianCentreCostume`: the WRONG `center = ⊤` — the abelian/non-semisimple
reading — rewritten through banked `center = ⊥` leaves the unsatisfiable `⊢ ⊥ = ⊤`) bites. Compile
cost LIGHT (~9s scratch, 19s file; all probes ≤8s, default maxHeartbeats never inflated — NOT a W9
beast). `LieModule.traceForm`/`LieIdeal`/`IsAtom`/`IsLieAbelian`/`InvariantForm` are MACHINERY on the
DERIVED object (STANDARD §3). STANDARD applied: unbroken (every object derived back to the trunk or
standard Mathlib machinery), complete (foundations-only, no sorry/axiom), physics-words-removable
(delete "g₂/gauge/compact" → the pure statement that the 14-dim Lie algebra of Leibniz-derivations
of the Cayley–Dickson double of a double of a double of ℚ is semisimple with trivial centre).

**What is childed to N26 (never asserted here, never a bridge).** (A) IRREDUCIBILITY of the faithful
7-rep `imRep` on `ImO` — `LieModule.IsIrreducible ℚ derivationLieQ ImO` (needs `LieRingModule`/
`LieSubmodule` instance setup on the abstract 7-space, N23 flagged multi-run); (D) SIMPLICITY
(`LieAlgebra.IsSimple ℚ derivationLieQ` — likely from semisimple + (A) or the single-block
structure) — which, with the banked semisimplicity + negative-definite nondegenerate trace form +
perfectness + faithful 7-rep + dim = 14 + bracket table, complete the identification of
`derivationLieQ` as the compact real form of g₂. Then the automorphism Lie GROUP (exponentiating
`Der(𝕆)` over the derived continuum `ContinuumQ.Cut`).

## N26 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 4: the INVARIANT 7-dim Lie SUBMODULE `ImLie` + the ORTHOGONAL (COMPACT) EMBEDDING of the faithful 7-rep + the SIMPLICITY SKELETON  (Emergent, depth 3)  ✅ LANDED (the full irreducibility of the 7-rep + the `IsSimpleOrder(LieIdeal)` simplicity core childed N27; then the automorphism Lie GROUP)
**What landed (`Phys/Algebra/DerivationIrreducible.lean`).** Four forward increments, all from the
banked structure, NO posited `G₂`. ★ `ImLie : LieSubmodule ℚ derivationLieQ (O ℚ)` — the banked
imaginary subspace `ImO` (N22) promoted to a genuine invariant Lie submodule (via `derivLieQ_mapsTo`),
`Nontrivial ImLie` (the banked nonzero `u1`, anti-vacuity), `finrank_ImLie = 7` (transports
`finrank_ImO`) — the representation space of the faithful 7-rep as a genuine `LieSubmodule`, the
object N25's child needed. ★★ THE PREREG W3-DECOMPOSE GUESS DISSOLVED: the `LieRingModule`/
`LieSubmodule`/`IsIrreducible` instance plumbing on the abstract 7-space (N23/N25 flagged as the likely
multi-run node) SYNTHESIZES FREE (bounded probe ≤8s) — the real work is the mathematics, not the
plumbing. ★ `gBil : BilinForm ℚ (O ℚ)` — the Born self-overlap form `g v w := reQ (v · star w)`
(banked N24 `gForm`, the trunk's self-overlap = positivity) as a bilinear form; `gBil_separatingLeft`
(anisotropic/nondegenerate, the banked `gForm_self_eq_zero`). ★ `deriv_isSkewAdjoint_gBil` — every
`IsDerivQ` derivation is SKEW-ADJOINT for `gBil` (directly from the banked N24 `gFormQ_skew`). ★★
`derivationLieQ_le_skewAdjoint` — THE COMPACT EMBEDDING `g₂ ↪ so(7)`: the whole 14-dim algebra lands
in `skewAdjointLieSubalgebra gBil`, the skew-adjoint operators of the POSITIVE-DEFINITE Born form —
the COMPACT (definite) `so(7)`, NOT the split one, the compact real form's defining feature at the
REPRESENTATION level, derived FORWARD from skew-adjointness + anisotropy, NO posited G₂. ★
`isSimple_of_isSimpleOrder` — THE SIMPLICITY SKELETON: with the banked non-abelianness
(`derivationLieQ_not_lieAbelian`, N23), `derivationLieQ` is SIMPLE iff its Lie-ideal lattice is a
simple order (`isSimple_iff_of_not_isLieAbelian`), reducing the remaining simplicity claim to
`IsSimpleOrder (LieIdeal ℚ derivationLieQ)` — an honest W1 *implication*, the `IsSimpleOrder` core
childed N27, NEVER asserted (NOT a bridge). 12 decls foundations-only ⊆ {propext, Classical.choice,
Quot.sound} (independently axiom-audited via `lake env lean`, not trusting the gate); gate D0–D6 GREEN
(45 costumes, 481 theorems). Costume C46 (`DerivationIrreducibleWrongAdjointCostume`: the WRONG
SELF-ADJOINT/SYMMETRIC reading `g(wx,y)=g(x,wy)` of the nonzero witness — the non-compact reading —
which `linarith` cannot derive from the banked skew identity, since it would force `w=0`) bites.
Compile cost LIGHT (~12s file; all probes ≤8s, default maxHeartbeats never inflated — NOT a W9 beast).
`LieSubmodule`/`BilinForm`/`skewAdjointLieSubalgebra`/`IsSimpleOrder`/`LieIdeal` are MACHINERY on the
DERIVED object (STANDARD §3). STANDARD applied: unbroken (every object derived back to the trunk or
standard Mathlib machinery), complete (foundations-only, no sorry/axiom), physics-words-removable
(delete "g₂/gauge/compact/exceptional/fundamental representation" → the pure statement that the 14-dim
Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ acts on
its invariant 7-dim subspace `ker(star+id)` by operators skew-adjoint for the anisotropic self-overlap
form, and is simple iff its ideal lattice is a simple order).

**What is childed to N27 (never asserted here, never a bridge).** (A) the FULL `LieModule.IsIrreducible
ℚ derivationLieQ ↥ImLie` — needs joint-kernel-zero (banked numerics: rank 7) + a dimension count
excluding invariant subspaces of dim 2..5 (`dim so(d)+so(7−d) ≤ 11 < 14`, an `so(n)` finrank fact
Mathlib may lack → BUILD per W1; the d=1/d=6 cases dissolve through the banked perfectness — the "one
cause many terminations" flagship); (D) the `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` core ⟹
`IsSimple` via the banked skeleton. Then the automorphism Lie GROUP (exponentiating `Der(𝕆)` over the
derived continuum `ContinuumQ.Cut`).

## N27 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 5: COMPLETE REDUCIBILITY of the faithful 7-rep + the d=1 EXCLUSION  (Emergent, depth 3)  ✅ LANDED (the d∈{2,3,4,5} `so(n)`-count → full irreducibility + the `IsSimpleOrder(LieIdeal)` core → `IsSimple` childed N28; then the automorphism Lie GROUP)
**What landed (`Phys/Algebra/DerivationIrreducible.lean`).** Two forward increments, both from the
banked structure via the trunk's Born positivity, NO posited `G₂`. ★ THE WEYL / BORN-ORTHOGONAL
LEVER: `gBil_isSymm` (the Born self-overlap form is symmetric ⟹ reflexive); `gBil_restrict_nondegenerate`
(the DEFINITE/anisotropic form restricts NONDEGENERATELY to EVERY subspace, from the banked
`gForm_self_eq_zero`); ⟹ `isCompl_gBil_orthogonal` (`IsCompl W (gBil.orthogonal W)` for ALL `W` — the
Born-orthogonal complement is a genuine linear complement, `BilinForm.isCompl_orthogonal_of_restrict_nondegenerate`
reframed through the trunk's positivity). ★ `deriv_mapsTo_orthogonal` — skew-adjointness (banked
`gFormQ_skew`, N24) ⟹ the orthogonal complement of a `D`-invariant subspace is `D`-invariant. ★★
`gPerp` / `isCompl_gPerp` — THE COMPLETE REDUCIBILITY: every Lie submodule `N` of `O ℚ` (invariant
subspace under all Leibniz-derivations) has an INVARIANT (Lie-submodule) COMPLEMENT, its `gBil`-orthogonal
complement `gPerp N`. The module is semisimple — the Weyl complete-reducibility theorem DERIVED from
the trunk's Born positivity (the self-overlap is definite, so the orthogonal complement is genuine and
is invariant because derivations are skew-adjoint), NO averaging, NO posited compact group, NO posited
G₂. ★ THE d=1 EXCLUSION (the "one cause many terminations" flagship at the representation level):
`deriv_eigenvalue_zero` (a Leibniz-derivation, skew-adjoint for the DEFINITE Born form, has NO nonzero
real eigenvalue — `2λ·g(v,v)=0` with `g(v,v)≠0` by anisotropy ⟹ `λ=0`); `no_common_eigenvector_ImO` (a
nonzero common eigenvector in `ImO` would be killed by every derivation, hence by the three banked
`{D0E,D3E,D8E}` whose joint kernel on `ImO` is `0` — probe-verified rank 7 — so it vanishes, contradiction);
`no_one_dim_invariant_ImO` (hence NO 1-dim invariant subspace inside `ImO`) — the SAME perfectness/faithfulness
that makes the joint kernel vanish forbids any trivial 1-dim subrepresentation. 9 decls foundations-only
⊆ {propext, Classical.choice, Quot.sound} (independently axiom-audited via `lake env lean`, not trusting
the gate); gate D0–D6 GREEN (46 costumes, 490 theorems). Costume C47 (`DerivationIrreducibleOneDimInvariantCostume`:
the DEGENERATE-form reading — the Born-orthogonal complement of the FULL space `⊤` is again `⊤`, which
`isCompl_gBil_orthogonal ⊤` forces to `⊥`, collapsing to the false `⊥ = ⊤`) bites with signature `⊢ ⊥ = ⊤`.
Compile cost LIGHT (~10s file; default maxHeartbeats never inflated — NOT a W9 beast; the trunk-native
Born-orthogonal route avoided all coordinate expansion). `BilinForm.orthogonal`/`IsCompl`/`finrank`/
`finrank_eq_one_iff'` are MACHINERY on the DERIVED object (STANDARD §3). STANDARD applied: unbroken,
complete (foundations-only, no sorry/axiom), physics-words-removable (delete "g₂/gauge/compact/Weyl/Born"
→ the pure statement that the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a
double of a double of ℚ acts completely reducibly on its invariant 7-dim subspace `ker(star+id)` — every
invariant subspace has an invariant orthogonal complement — with no 1-dim invariant subspace).

**What is childed to N28 (never asserted here, never a bridge).** (A) the FULL `LieModule.IsIrreducible
ℚ derivationLieQ ↥ImLie` — with complete reducibility + the d=1/d=6 exclusion banked, the remaining gap
is the d∈{2,3,4,5} dimension count (`dim so(d)+so(7−d) ≤ 11 < 14`, an `so(n)` finrank fact Mathlib may
lack → BUILD per W1) excluding the middle invariant-subspace dimensions; (D) the `IsSimpleOrder (LieIdeal
ℚ derivationLieQ)` core ⟹ `IsSimple` via the banked `isSimple_of_isSimpleOrder` (route: full irreducibility
+ faithfulness ⟹ any nonzero ideal acts as the whole). Then the automorphism Lie GROUP (exponentiating
`Der(𝕆)` over the derived continuum `ContinuumQ.Cut`).

## N28 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 6: FULL IRREDUCIBILITY of the faithful 7-rep (the so(n)-type dimension bound BUILT per W1)  (Emergent, depth 3)  ✅ LANDED (the `IsSimpleOrder(LieIdeal)` simplicity core → `IsSimple` + the automorphism Lie GROUP childed N29)
**What landed (`Phys/Algebra/DerivationIrreducibleFull.lean`).** The faithful 7-rep of `derivationLieQ`
is FULLY IRREDUCIBLE — `LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie` — all FORWARD from the banked
structure, NO posited `G₂`. ★★ THE W1 BUILD (docs/RUNBOOK W1; Mathlib LACKS `dim so(n) = C(n,2)`): the
so(n)-type DIMENSION BOUND `finrank_skewAdjoint_le_choose` — a skew-adjoint operator `D` of a SYMMETRIC
NONDEGENERATE form `Φ` on a `d`-dimensional space lies in a space of `finrank ≤ C(d,2)` — DERIVED FORWARD
via the alternating-Fin-2 / exterior-power injection `D ↦ ((x,y)↦Φ(D x) y)` (`bml_zero_diag` — skew + symm
⟹ vanishing diagonal; `aml` — the alternating form; `skewToDual` — the linear injection into `Dual(⋀²V)`
via `exteriorPower.alternatingMapLinearEquiv`; `skewToDual_injective` from nondegeneracy; `exteriorPower.finrank_eq`
gives `finrank ⋀²V = C(d,2)`), NO coordinate matrix, NO posited `so(n)`. ★ THE ASSEMBLY: `restrictOp_skew`
(a derivation restricted to an invariant subspace is skew-adjoint for `gBil.restrict W`, from banked
`gFormQ_skew`), `restrictToSkew` (the linear map `D ↦ D|W` into the skew-adjoints), `gBil_restrict_symm`,
`finrank_restrictSkew_le` (the bound on the restricted form). ★★ `no_proper_invariant_ImO` — NO proper
nonzero invariant subspace of `ImO`: the Born-orthogonal complement `W' = gBil.orthogonal W ⊓ ImO`
(invariant via banked `deriv_mapsTo_orthogonal`, complementary via banked `isCompl_gBil_orthogonal`) splits
`ImO = W ⊕ W'`; FAITHFULNESS (banked `imRep_injective`) injects `derivationLieQ` into `skew(Φ|W) × skew(Φ|W')`,
forcing `14 ≤ C(d,2)+C(7−d,2)` = `11,9,9,11 < 14` for `d∈{2,3,4,5}` (`decide`), and `d=1,6` excluded by the
banked `no_one_dim_invariant_ImO` (N27). ★★★ `ImLie_isIrreducible` — `LieModule.IsIrreducible` (= `IsSimpleOrder
(LieSubmodule …)`): a proper nonzero Lie submodule pushes forward (banked `ImLie.incl`, `map_incl_le_ImO`/
`finrank_map_incl`) to a proper nonzero invariant subspace of `ImO` (`0 < dim < 7`), excluded by
`no_proper_invariant_ImO`. 10 decls foundations-only ⊆ {propext, Classical.choice, Quot.sound} (independently
axiom-audited; the whole audited tree's axiom set is exactly the trio); gate D0–D6 GREEN (48 costumes, 500
theorems). Costume C48 (`DerivationFullIrreducibleReducibleCostume`: the WRONG claim that the 7-rep is REDUCIBLE,
`¬ LieModule.IsIrreducible …` — the banked `ImLie_isIrreducible` proves it IS irreducible, so the goal `⊢ False`
is unprovable) bites with signature `⊢ False`. Compile cost LIGHT (~12s file; default maxHeartbeats never
inflated — NOT a W9 beast; the structural exterior-power injection avoided all coordinate expansion). The run
was a W6/W9.8 CRIME-SCENE recovery of run 138's stranded clean `no_proper_invariant_ImO` lever (the `Module.Free`
synthesis gap fixed) + a fresh forward `ImLie_isIrreducible` increment + finalize. `LieModule.IsIrreducible`/
`IsSimpleOrder`/`AlternatingMap`/`⋀²`/`BilinForm`/`finrank` are MACHINERY on the DERIVED object (STANDARD §3);
NO `LieAlgebra.g₂`/`G₂` imported to assert anything. STANDARD applied: unbroken, complete (foundations-only,
no sorry/axiom), physics-words-removable (delete "g₂/gauge/compact/exceptional/fundamental representation" →
the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ acts
IRREDUCIBLY on its invariant 7-dim subspace `ker(star+id)`, with the so(n)-type dimension bound a structural fact).

**What is childed to N29 (never asserted here, never a bridge).** (D) the `IsSimpleOrder (LieIdeal ℚ
derivationLieQ)` core ⟹ `LieAlgebra.IsSimple` via the banked `isSimple_of_isSimpleOrder` (N26). NB: with full
irreducibility + faithfulness banked, this is NOT near-free — Mathlib has NO "faithful irreducible ⟹ simple"
lemma (faithful+irreducible alone is insufficient: `so(4)` on its 4-rep is the standard counterexample), so it
genuinely needs the irreducible-faithful-module ⟹ simple structure theorem (Schur/tensor-decomposition + the
prime-dimension `7` argument), a substantial BUILD per W1. Then the automorphism Lie GROUP (exponentiating
`Der(𝕆)` over the derived continuum `ContinuumQ.Cut`).

## N29 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 7: the SIMPLICITY-REDUCTION levers toward `LieAlgebra.IsSimple ℚ derivationLieQ`  (Emergent, depth 3)  ✅ LANDED (DECOMPOSED — the structure-theorem BUILD childed N30; then the automorphism Lie GROUP)
**What landed (`Phys/Algebra/DerivationSimple.lean`).** The simplicity of `derivationLieQ` is reduced
to one lattice fact, with the FAITHFULNESS LEVER it turns on banked — all FORWARD from the banked
structure, NO posited `G₂`. ★ `lieIdeal_nontrivial : Nontrivial (LieIdeal ℚ derivationLieQ)` — the
`⊥ ≠ ⊤` (Nontrivial) HALF of `IsSimpleOrder`, established from the banked non-abelianness
(`derivationLieQ_not_lieAbelian`, N23). ★★ `eq_bot_of_lie_ImLie_bot` — THE FAITHFULNESS LEVER: a Lie
ideal that brackets to `⊥` against the faithful 7-rep `ImLie` is itself `⊥` (its elements act as `0`
on `ImO`, so `imRep` vanishes on them, and faithfulness `imRep_injective` (N22) forces them to `0`).
★ `lie_ImLie_ne_bot_of_ne_bot` — its contrapositive: every NONZERO Lie ideal acts NONTRIVIALLY on the
irreducible 7-rep — the lever the structure theorem (N30) turns on to rule out a direct-summand ideal
acting trivially. 3 decls foundations-only ⊆ {propext, Classical.choice, Quot.sound} (independently
axiom-audited). Gate D0–D6 GREEN (49 costumes, 503 theorems). Costume C49
(`DerivationSimpleTrivialActionCostume`: the WRONG "algebra acts trivially" claim `⊤ = ⊥` reduces
through the faithfulness lever to the unprovable `⁅⊤, ImLie⁆ = ⊥`) bites. Compile cost LIGHT (~8s).

**Why DECOMPOSED (W3/W9 — not scope reduction, NOT a bridge).** The MEASUREMENT (W9, bounded
reconnaissance): `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` = irreducibility of the ADJOINT rep; the
banked 7-rep irreducibility (N28) does NOT transfer directly (THE ONE LAW / N28 LOCKED finding:
`so(4)` on its 4-rep is faithful+irreducible but NOT simple). Banked semisimplicity (N25) ⟹ Mathlib
`IsSemisimple.instBooleanAlgebra` makes the ideal lattice a Boolean algebra, atomistic,
`sSup{atoms}=⊤`, so `IsSimpleOrder ⟺ exactly ONE atom`. Mathlib LACKS the Lie-module isotypic
decomposition / outer-tensor / Lie-Schur (it has only the ASSOCIATIVE `IsSemisimpleModule` /
`isotypicComponent` / `Module.End.instDivisionRing` Schur + Wedderburn–Artin). The genuine route is the
prime-dimension-7 / isotypic-Schur STRUCTURE THEOREM — a substantial W1 BUILD childed N30 (the ticket
itself flagged "may be its own node"). N28 timed out twice on a comparable build, so per W9 anti-timeout
the levers were banked and the structure theorem scoped to a dedicated node, finalized with turns to spare.

**What is childed to N30 (never asserted here, never a bridge).** The irreducible-faithful-module ⟹
simple STRUCTURE THEOREM ⟹ `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` ⟹ `LieAlgebra.IsSimple` via the
banked `isSimple_of_isSimpleOrder` (N26): if `derivationLieQ = I ⊕ J` (commuting nonzero ideals from a
2-atom split), the faithful irreducible 7-rep is `I`-isotypic, forcing `7 = r·dim W`; `7` is PRIME so
either a factor acts by a 1-dim character (perfect ⟹ acts `0` ⟹ faithfulness ⟹ `⊥`) or `V` is
factor-irreducible and Schur gives a division ℚ-algebra `Δ` with `dim_ℚ Δ ∈ {1,7}`, each branch
collapsing via the skew-trace / the `dim I + dim J = 14` centre count. Then the automorphism Lie GROUP.

## N30 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 8: the irreducible-faithful-module ⟹ simple STRUCTURE THEOREM levers (the atom → two-commuting-ideals reduction)  (Emergent, depth 3)  ✅ LANDED (DECOMPOSED — the reduction levers banked; the Lie→associative semisimple-module bridge → prime-7 collapse childed N30a)
**What landed (`Phys/Algebra/DerivationSimpleStructure.lean`).** The `IsSimpleOrder (LieIdeal ℚ
derivationLieQ)` target is reduced to refuting a faithful irreducible 7-rep of a product of two
nonzero COMMUTING ideals (the prime-7 hypothesis), with all route-independent forward levers
banked — all FORWARD from the banked structure, NO posited `G₂`. ★ `exists_atom_ne_top` — if the
ideal lattice is NOT a simple order, semisimplicity's atomisticity (`sSup{atoms}=⊤`, N25) forces an
atom `I ≠ ⊤` (≥ 2 atoms): the entry point. ★ `atom_compl_decomp` — the Boolean complement `J = Iᶜ`
gives two NONZERO COMMUTING ideals (`I ≠ ⊥`, `Iᶜ ≠ ⊥`, `I ⊔ Iᶜ = ⊤`, `I ⊓ Iᶜ = ⊥`, `⁅I, Iᶜ⁆ = ⊥`
since `⁅I,Iᶜ⁆ ≤ I ⊓ Iᶜ = ⊥`): the `⊤ = I ⊕ J` split the prime-7 argument refutes. ★
`imRep_commute_of_lie_zero` — commuting elements act by COMMUTING operators on the faithful 7-rep
(`imRep` a Lie hom — `map_lie`): lands one factor's action in the commutant of the other (Schur).
★ `atom_isPerfect` — an atom is simple hence perfect (`⁅⊤,⊤⁆=⊤`): kills the `dim W = 1` (1-dim
character) branch (perfect ⟹ acts `0` ⟹ faithfulness ⟹ `⊥`). ★ `atom_center_eq_bot` — an atom has
trivial centre (simple ⟹ trivial radical, `center_eq_bot`): kills the `dim Δ = 7` branch (there
`I ≅ Δᵒᵖ` carries the nonzero scalar centre `ℚ·id`). 5 decls foundations-only ⊆ {propext,
Classical.choice, Quot.sound} (independently axiom-audited). Gate D0–D6 GREEN (49 costumes, 508
theorems). Costume C50 (`DerivationSimpleStructureWrongDecompCostume`: the WRONG claim that the two
complementary commuting ideals do NOT commute — `⁅I, Iᶜ⁆ = ⊤` — rewriting through the banked
`⁅I, Iᶜ⁆ = ⊥` reduces to the false `⊥ = ⊤`) bites with signature `⊢ ⊥ = ⊤`. Compile cost LIGHT (~15s).

**Why DECOMPOSED (W3/W9 — not scope reduction, NOT a bridge).** The MEASUREMENT (W9, bounded
probes): the prime-7 collapse's crux — STEP A, "V = ImO is I-isotypic" — fundamentally needs the
Lie→associative semisimple-module BRIDGE Mathlib LACKS for Lie modules. MEASURED that
`A := Algebra.adjoin ℚ (imRep '' I)` forms cleanly and `ImO` is an `A`-module via `A.moduleLeft`
automatically; Mathlib HAS the associative isotypic/Schur machinery
(`IsIsotypicOfType.linearEquiv_fun`, `isSimpleModule_iff_finrank_eq_one`,
`Module.End.instDivisionRing`) once `IsSemisimpleModule A ImO` is in hand; that BRIDGE is the
substantial Mathlib-absent BUILD, supplied trunk-natively by N27's Born-orthogonal complete
reducibility transported to the SUBalgebra `A_I`. The ticket itself pre-authorized splitting
("decompose further if the bridge is itself multi-lemma — e.g. child 'N30a: the Lie→associative
semisimple-module bridge' then 'N30b: the prime-7 collapse'"). N28 timed out TWICE on a comparable
monolith; per W9 anti-timeout the levers were banked and the bridge scoped to a dedicated node,
finalized with turns to spare.

**What is childed to N30a (never asserted here, never a bridge).** The Lie→associative
semisimple-module BRIDGE: build `A_I := Algebra.adjoin ℚ (imRep '' I)` ⊆ `End ℚ ImO`, prove
`IsSemisimpleModule A_I ↥ImO` via the Born-orthogonal complemented lattice (an `A_I`-submodule = an
`I`-invariant subspace; its `gBil`-orthogonal complement is `I`-invariant since each element of `I`
acts skew-adjointly — banked `deriv_mapsTo_orthogonal`/`isCompl_gBil_orthogonal`), plus the submodule
dictionary lemmas. Then N30b (childed onto N30a's tail) = the prime-7 / isotypic-Schur COLLAPSE
consuming the banked levers ⟹ `IsSimpleOrder` ⟹ `LieAlgebra.IsSimple` via `isSimple_of_isSimpleOrder`
(N26). Then the automorphism Lie GROUP (exponentiating `Der(𝕆)` over the derived continuum
`ContinuumQ.Cut`).

## N30a — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 9: the Lie→associative SEMISIMPLE-MODULE BRIDGE (`IsSemisimpleModule A_I ↥ImO` via Born-orthogonality)  (Emergent, depth 3)  ✅ LANDED (DECOMPOSED — the bridge banked; the commutant lemma + dictionary + prime-7 collapse childed N30b)

**LANDED (`Phys/Algebra/DerivationSemisimpleModule.lean`).** The Lie→associative semisimple-module
bridge is BUILT FORWARD, NO posited `G₂`, foundations-only ⊆ {propext, Classical.choice, Quot.sound}
(8 decls, independently axiom-audited). The W9 MEASUREMENT picked the CHEAPER framing the ticket
flagged: work ENTIRELY within `↥ImO` with the definite form `gBil.restrict ImO`, so the orthogonal
complement of a ℚ-subspace of `↥ImO` is ALREADY a genuine complement in `↥ImO` (no `⊓ ImO`, no
subtype image/comap order-iso). ★★★ `semisimpleModule_imRep_adjoin (I : LieIdeal ℚ derivationLieQ) :
IsSemisimpleModule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ↥ImO` — for ANY
Lie ideal `I`, the invariant 7-rep is a SEMISIMPLE module over the associative subalgebra `A_I`
generated by the `I`-action. Proved by INSTANTIATING the GENERIC bridge ★★ `isSemisimpleModule_adjoin`
(for any symmetric reflexive form `B` whose restriction to every subspace is nondegenerate — the
DEFINITE/Born-positivity hypothesis — and any set `S` of `B`-skew-adjoint operators, `V` over
`Algebra.adjoin K S` is semisimple: every `A`-submodule has the `B`-orthogonal complement as an
`A`-submodule complement). The supporting generic levers: `skewAdjoint_mapsTo_orthogonal` (a
skew-adjoint operator preserving `N` preserves `B.orthogonal N`, mirror of N27 `deriv_mapsTo_orthogonal`),
`adjoin_stable_orthogonal` (the orthogonal is `A`-stable by `Algebra.adjoin_induction` since `A` is
generated by skew-adjoint operators), `isCompl_of_restrictScalars` (`IsCompl` transfers down the
scalar-restriction order-embedding), `orthogonalASubmodule` (the candidate complement). Instantiated at
`B = gBil.restrict ImO`: `imRep_isSkewAdjoint_gImO` (reuse banked N28 `restrictOp_skew`) +
`gImO_restrict_nondegenerate` (the Born anisotropy `gForm_self_eq_zero` on `↥ImO`). This is N27's
Born-orthogonal complete reducibility transported from the whole derivation algebra to the SUBalgebra
`A_I`. Gate D0–D6 green (50/50 costumes, costume C51 `DerivationSemisimpleModuleWrongCostume` bites:
the WRONG `¬ IsSemisimpleModule A_I ↥ImO` reduces to `⊢ False` after `intro h` since the banked bridge
proves it IS semisimple). `IsSemisimpleModule`/`ComplementedLattice`/`Submodule A`/`Algebra.adjoin`/
`Module.End`/`BilinForm.orthogonal` are MACHINERY on the DERIVED object (STANDARD §3); NO `LieAlgebra.g₂`
imported to assert anything. STANDARD applied: unbroken (every object derives back to the banked trunk
— N27 anisotropy, N28 skew-adjointness, N22 `imRep` — or standard Mathlib machinery), complete
(foundations-only, no sorry/axiom/native_decide), physics-words-removable (delete "g₂/gauge/compact/simple"
→ the pure statement that the associative subalgebra generated by the action of a Lie ideal on the
invariant 7-dim subspace `ker(star+1)` of the Cayley–Dickson double of a double of a double of ℚ acts
SEMISIMPLY). **DECOMPOSED (W3/W9):** the bridge banked; the commutant lemma (a commuting ideal `J` with
`⁅I,J⁆=⊥` acts in `End_{A_I}(↥ImO)`), the submodule dictionary, and the prime-7 / isotypic-Schur
COLLAPSE childed N30b onto the chain tail (never asserted here).

**N30b — THE PRIME-7 / ISOTYPIC-SCHUR COLLAPSE ⟹ `IsSimpleOrder` ⟹ `IsSimple`.**  ✅ LANDED (the CAPSTONE of the type-G₂/compact-form identification; the automorphism Lie GROUP is now the forward node — see below).

**HOW IT LANDED (the retrospective).** `Phys/Algebra/DerivationSimpleCollapse.lean`. The generic
prime-dimension structure-theorem layer (`commutantHom`, `isotypic_prime_split`,
`prime_split_dichotomy`) was proved over an ABSTRACT subalgebra (the concrete `A_I` blows up
`SMul A_I` typeclass synthesis — measured W9). The heavy Schur branch the FINDINGS flagged as a
W1 decompose point (division-algebra dimension classification + Jacobson density) DISSOLVED through
the trunk via `skew_odd_det_zero`: a `B`-skew-adjoint operator on an ODD-dimensional nondegenerate
space is SINGULAR (`det = 0`); on the odd (7) DEFINITE Born 7-rep, a commuting-ideal generator
`imRep b` lands in the Schur division ring `End_{A_I}(↥ImO)` (Schur `injective_of_ne_zero`) yet is
skew-adjoint-singular ⟹ not injective ⟹ `0` ⟹ `b = 0` by faithfulness — ONE CAUSE (odd-dim skew
singularity) terminating the branch, no division-algebra count needed. `collapse_scalar_branch`
(character branch ⟹ `I = ⊥` by atom perfectness + faithfulness) + `collapse_schur_branch`
(Schur branch ⟹ `Iᶜ = ⊥`) make `derivationLieQ_isSimpleOrder` forward (the dichotomy instantiated at
the concrete `A_I`, M1-measured clean — the W9 risk that timed out 3 prior runs DISCHARGED), then
`derivationLieQ_isSimple := isSimple_of_isSimpleOrder derivationLieQ_isSimpleOrder` (banked N26).
12 decls foundations-only, gate D0–D6 green, costume C52 bites `⊢ False`. NO posited `G₂`, NO bridge.
The original forward-spec is preserved below for the record.

**(superseded forward-spec, for the record)**
Consume the banked N30a bridge `semisimpleModule_imRep_adjoin` + the N30 levers (`exists_atom_ne_top`,
`atom_compl_decomp` giving two nonzero COMMUTING ideals `⊤ = I ⊕ J` with `⁅I,J⁆=⊥`, `imRep_commute_of_lie_zero`,
`atom_isPerfect`, `atom_center_eq_bot`) + Mathlib's associative isotypic/Schur machinery
(`IsIsotypicOfType.linearEquiv_fun`, `isSimpleModule_iff_finrank_eq_one`, `Module.End.instDivisionRing`).
The argument: if `derivationLieQ` is NOT a simple order, `atom_compl_decomp` splits `⊤` into two nonzero
commuting ideals; by the N30a bridge `↥ImO` is `A_I`-semisimple, so it decomposes into isotypic
components; the commutant lemma (build it as part of N30b — `J` acts in `End_{A_I}`) + Schur force the
faithful irreducible 7-rep to be `I`-isotypic, giving `7 = r·dim W` with 7 PRIME ⟹ either `dim W = 1`
(killed by `atom_isPerfect` + faithfulness — a perfect ideal acting by 1-dim characters acts as 0,
forced to ⊥) or `dim W = 7`, `r = 1` (the Schur branch: `J` acts by a scalar in the division ring
`End_{A_I}(↥ImO)`, skew-traceless by `derivationLieQ_le_skewAdjoint` ⟹ scalar 0 ⟹ `J` acts trivially
⟹ faithfulness forces `J = ⊥`, contradicting `atom_compl_decomp`'s `Iᶜ ≠ ⊥`; or via `atom_center_eq_bot`
+ `finrank_derivationQ_eq_14`). Either branch contradicts the two-nonzero-commuting-ideals split ⟹
`IsSimpleOrder (LieIdeal ℚ derivationLieQ)` ⟹ `LieAlgebra.IsSimple ℚ derivationLieQ` via banked
`isSimple_of_isSimpleOrder`. Then the automorphism Lie GROUP. NO posited `G₂`.
**Target.** Build the Lie→associative bridge the prime-7 / isotypic-Schur structure theorem (N30b)
runs on, FORWARD from the banked N30 levers + N27 Born-orthogonal complete reducibility + N28 full
irreducibility, NO posited `G₂`. For a nonzero Lie ideal `I` of `derivationLieQ`: form the
associative ℚ-subalgebra `A_I := Algebra.adjoin ℚ (Set.range (imRep ∘ I.incl)) ⊆ Module.End ℚ ImO`
(measured to form cleanly; `ImO` is an `A_I`-module via `A_I.moduleLeft`), and prove
`IsSemisimpleModule A_I ↥ImO` (= `ComplementedLattice (Submodule A_I ImO)`). THE TRUNK ROUTE (THE
ONE LAW, reuse N27): an `A_I`-submodule of `ImO` is exactly an `I`-invariant subspace (since `A_I`
is generated by the `I`-action); its `gBil`-orthogonal complement (banked `isCompl_gBil_orthogonal`)
is ALSO `I`-invariant because each element of `I` acts skew-adjointly (banked
`deriv_mapsTo_orthogonal` holds for every derivation). So the lattice of `A_I`-submodules is
COMPLEMENTED ⟹ `IsSemisimpleModule A_I ↥ImO`. Also bank the SUBMODULE DICTIONARY: the bijection
`A_I`-submodule ↔ `I`-invariant subspace, and that the action of a COMMUTING ideal `J` (with `⁅I,J⁆=⊥`)
lands in the commutant `End_{A_I}(ImO)` (via banked `imRep_commute_of_lie_zero`).
**Dependency.** N30 (the reduction levers). **What "done" requires.** `IsSemisimpleModule A_I ↥ImO`
PROVED forward (foundations-only, costume that a WRONG semisimplicity/complement claim fails, gate
green, STANDARD met), the submodule dictionary banked, the prime-7 COLLAPSE childed N30b (never
asserted). **Drift trap.** Same posit-vs-derive moat: build the bridge forward; do NOT import a
Mathlib G₂. **W9.** MEASURE the `IsSemisimpleModule` construction cost first (bounded probe); the
`Submodule A_I ImO` ↔ `I`-invariant-subspace dictionary is the crux — if heavy, decompose. The
collapse N30b is the FORWARD node once the bridge lands. See the N30 task handoff + workbench/N30
FINDINGS.md for the full measured argument.


  - **The automorphism Lie GROUP** — exponentiating `Der(𝕆)` over the now-derived continuum (`ContinuumQ.Cut`,
    the derived ℝ) to the compact automorphism group, the gauge group physics recognizes.
    **✅ INCREMENT 1 LANDED (N31, `Phys/Algebra/DerivationAutGroup.lean`).** The algebra-automorphism
    group `AutO` of the terminal algebra `O ℚ` is DEFINED — as a `Subgroup` of the ℚ-linear automorphism
    group `(O ℚ ≃ₗ[ℚ] O ℚ)` carved by the multiplicative-and-unital predicate `IsAlgAut` (the W1 BUILD:
    `O ℚ` is non-associative, so there is NO `Algebra ℚ (O ℚ)` instance / Mathlib `AlgEquiv` to import and
    assert against — measured; the carrier is built FORWARD, `Subgroup`/`LinearEquiv` MACHINERY on the
    DERIVED object, STANDARD §3) — and the FORWARD seed facts proved: an automorphism preserves the real
    part (`aut_reQ`, via the octonion quadratic `octo_quadratic`), commutes with conjugation (`aut_star`),
    ★★ PRESERVES the Born self-overlap form (`aut_gForm` — the group analogue of the banked infinitesimal
    skew-adjointness `derivationLieQ_le_skewAdjoint`, the SAME Born positivity from the trunk integrated;
    ONE cause), preserves the trace-zero subspace `ImO` (`aut_mapsTo_ImO`), fixes the unit (`aut_map_one`);
    group closure proved, non-vacuous (`one_mem_AutO`). 18 decls foundations-only, costume C53 bites
    `⊢ 1 = -1`, NO posited `G₂`/`Aut`, NO bridge. The numerics re-verified (W6): Killing det
    9618527719784448, NEG-definite — the definiteness that makes the group COMPACT.

  - **✅ INCREMENT 2 LANDED (N32, `Phys/Algebra/DerivationAutCompact.lean`).** The continuum-free
    COMPACTNESS SKELETON of `AutO` is banked. W9 MEASURE-FIRST (workbench/N32-aut-exp/PREREG.md, bounded
    `#check`/`#synth` probes) DECIDED the increment scope: the derived ℝ `ContinuumQ.Cut` carries
    `Field`+`LinearOrder`+`IsStrictOrderedRing` but NO `TopologicalSpace`/`UniformSpace`/`NormedField`/
    `Archimedean`, and Mathlib's `NormedSpace.exp` wants a topological/normed field — so the analytic
    operator-exp `Der(𝕆) → Aut(𝕆)` is a genuine W1 BUILD of an analytic sub-tower OVER the derived ℝ
    (DECOMPOSED per W3, childed N33). The COMPACTNESS's continuum-free algebraic heart was banked
    instead: in the `gForm`-orthonormal coordinate frame `bO` (N24), the banked form-preservation
    `aut_gForm` (N31) makes every automorphism an ISOMETRY — `gForm_polar` (★ the Born self-overlap form
    IS the standard inner product in the frame, polarizing `gForm_self_sum_sq`), `gForm_orthonormal`,
    `aut_col_unit` (each coordinate column is a unit vector), `aut_col_orthogonal` (the columns are
    mutually orthonormal — the algebraic `MᵀM = I`), ★★ `aut_entry_abs_le_one` (THE BOUNDEDNESS: every
    coordinate entry has `|entry| ≤ 1` — the algebraic skeleton of compactness, descending from the
    definite Born form exactly as the skew-adjointness did, ONE cause). Member-level corollaries on
    `AutO` + non-vacuity (the identity saturates the bound, `one_entry_diag = 1`). 16 decls
    foundations-only, costume C54 bites `⊢ 1 = 2`, NO posited exp/`G₂`/`Aut`/orthogonal-group, NO
    Mathlib ℝ as content, NO bridge.

  - **✅ INCREMENT 3 (3a) LANDED (N33, `Phys/Foundation/ContinuumCCLO.lean`).** The first analytic-tower
    rung over the derived ℝ is banked: the derived ℝ `ContinuumQ.Cut` is now a
    `ConditionallyCompleteLinearOrder` in Mathlib's STANDARD `IsLUB`/`sSup` idiom. The genuine W1 BUILD
    the N32 measurement forced, attacked by REFRAMING through the trunk (W1 step 2): order-completeness IS
    the banked C6 eternal-approach / gather-of-closures completion one level up — the banked bespoke
    Dedekind completeness `completion_coherence_closed` (N6/N10–N14: every gather of cuts has a coherence
    point = the union cut) RE-EXPRESSED as the standard least-upper-bound property. `sSupCutS` (the union
    of lower sets of a `Set Cut`), `sSupCutGather` (the union of a nonempty bounded family of cuts is a
    cut — a verbatim port of the `hgather` block), the `SupSet Cut` instance, `isLUB_csSupCut` (★★ union
    cut = LEAST UPPER BOUND), `not_bddAbove_univ`, and `condCompleteLinearOrder` (★★ the
    `ConditionallyCompleteLinearOrder`, via `conditionallyCompleteLatticeOfLatticeOfsSup` reusing the
    banked `LinearOrder Cut`). This UNLOCKS the standard ORDER TOPOLOGY +
    `ConditionallyCompleteLinearOrder.toCompactIccSpace` ⟹ `isCompact_Icc` — Heine–Borel on the DERIVED ℝ
    — as MACHINERY (STANDARD §3: a property OF the derived ℝ, not a posited number system / topology;
    confirmed reachable in a bounded probe). 8 decls foundations-only, costume C55 bites `⊢ 0 = 1`, NO
    posited ℝ/topology/exp/G₂, NO Mathlib ℝ as content, NO bridge. (DECOMPOSED per W3, childed N34.)

  - **✅ INCREMENT 4 LANDED (N34, `Phys/Foundation/ContinuumTopology.lean` + `Phys/Algebra/DerivationAutCompactTopo.lean`).**
    The TOPOLOGY RUNG over the derived ℝ + the Heine–Borel TOPOLOGICAL COMPACTNESS of the automorphism
    group are banked. W9 MEASURE-FIRST (workbench/N34-operator-exp/PREREG.md, bounded `#check`/`example`
    probes, all clean ~8s) sized the increment: with N33's `ConditionallyCompleteLinearOrder Cut`, the
    standard ORDER TOPOLOGY (`Preorder.topology` + `OrderTopology` by `rfl`) is reachable cheaply as
    MACHINERY, giving `T2Space`, ★ `IsTopologicalRing` (continuous +, ·, neg — the derived ℝ is a
    topological ring), `CompactIccSpace` ⟹ ★★ `isCompact_Icc_cut` (HEINE–BOREL on the derived ℝ), and
    finite-product box compactness `isCompact_box`. THE COMPACTNESS over the derived ℝ:
    `bornIsometrySet` (the `MᵀM = I` matrices over `Cut` = Born-form preservation in the `bO` frame),
    `bornIsometry_isClosed` (intersection of continuous-bilinear level sets, Hausdorff),
    `matBox_isCompact` (Heine–Borel per factor + finite Tychonoff), `bornIsometry_subset_box` (the
    diagonal condition bounds each entry — the N32 boundedness over `Cut`), ★★ `bornIsometry_isCompact`
    (closed ⊆ compact box ⟹ COMPACT), ★ `autMatrix_mem_bornIsometry` (the banked `AutO` coordinate image,
    cast `ℚ → Cut`, LANDS IN the compact orthogonal-isometry set — transporting `AutO_col_orthogonal`,
    N32) + identity non-vacuity. ONE CAUSE: the SAME definite Born positivity (self-overlap) that gave
    skew-adjointness (N26), simplicity (N30b) and entry-boundedness (N32) now gives topological
    COMPACTNESS once the derived ℝ is order-complete (N33) + carries the order topology (N34). 13 decls
    foundations-only, costume C56 bites `⊢ (1:Cut) = 2`, NO posited exp/G₂/Aut/orthogonal-group, NO
    Mathlib ℝ as content, NO bridge. (DECOMPOSED per W3/W9, childed N35.) The W1 reframe through the
    trunk: the topology is the banked C6 eternal-approach / N33 order-completeness spoken in the
    standard-topology dialect, never a posited ℝ/topology.

  - **✅ INCREMENT 5 LANDED (N35, `Phys/Foundation/ContinuumArchimedean.lean`).** The ARCHIMEDEAN /
    C6-eternal-approach analytic FOUNDATION RUNG over the derived ℝ is banked — the first analytic
    rung the operator-exp tower rests on, BELOW the metric/uniform structure. W9 MEASURE-FIRST
    (workbench/N35-operator-exp/PREREG.md + probes, all exit 0 ~8s — DECISIVE, fixed the scope)
    established: with N33's `ConditionallyCompleteLinearOrder` + N34's order topology, `Archimedean Cut`
    is reachable cheaply as MACHINERY (`ConditionallyCompleteLinearOrderedField.to_archimedean` on the
    banked `Field` + `ConditionallyCompleteLinearOrder` + `IsStrictOrderedRing`) and the order-native
    monotone convergence rides `SupConvergenceClass` (from `OrderTopology`); but `UniformSpace`/
    `MetricSpace`/`CompleteSpace Cut` ALL fail to synthesize, and ℝ's own completeness is a whole
    `UniformSpace/Real.lean` via `CauSeq` with no generic metric-from-order-topology — so building a
    `PseudoMetricSpace Cut` (dist `=|x-y|`) whose induced topology equals the FIXED `Preorder.topology Cut`
    is a genuine multi-file W1 BUILD (childed N36, NOT asserted). Banked here: ★ `instArchimedeanCut`
    (the derived ℝ is ARCHIMEDEAN — the C6 eternal-approach / no-infinite-element fact, MACHINERY via
    `to_archimedean`, a property OF the derived ℝ, STANDARD §3), `cut_exists_nat_gt` (the explicit
    no-infinite-element form), ★ `cut_tendsto_atTop_ciSup`/`ciInf`/`isLUB` (the C6 eternal-approach read
    as analytic CONVERGENCE with NO metric — bounded monotone sequences converge to their sup/inf in the
    banked order topology; the bounded approach eternally tends to its LUB coherence point, banked N33),
    + non-vacuity witnesses. ONE CAUSE: the SAME C6 eternal-approach that built the cut and gave
    order-completeness (N33) + the order topology (N34) now gives the Archimedean property + the analytic
    limit. 7 decls foundations-only, costume C57 bites `⊢ (0:Cut) = 1`, NO posited exp/G₂/Aut/metric/
    number-system, NO Mathlib ℝ as content, NO bridge. (DECOMPOSED per W3/W9, childed N36.) The W1 reframe
    through the trunk: the Archimedean property + the analytic limit are the banked C6 eternal-approach
    spoken one level up, never a posited ℝ/metric.

  - **✅ INCREMENT 6 LANDED (N36, `Phys/Foundation/ContinuumUniform.lean`).** The UNIFORM STRUCTURE on
    the derived ℝ is banked — and crucially its induced topology AGREES with the banked order topology.
    ★ THE W1 REFRAME THROUGH THE TRUNK THAT DISSOLVED THE FEARED HARD PART. The N35 measurement isolated
    "a `PseudoMetricSpace Cut` with `dist x y = |x - y|` whose induced topology = the FIXED
    `Preorder.topology Cut`" as the genuine remaining hard part — but that route is ALSO a CONTENT TRAP:
    Mathlib's `PseudoMetricSpace.dist` is ℝ-VALUED, so `dist x y = |x - y|` would cast `|x - y| : Cut`
    into Mathlib's ℝ = importing ℝ as content (STANDARD §3). THE TRUNK DODGES BOTH AT ONCE: `Cut` is a
    banked TOPOLOGICAL RING (`isTopologicalRing_cut`, N34) ⟹ `IsTopologicalAddGroup Cut`, and every
    topological additive group carries its CANONICAL GROUP UNIFORMITY
    `IsTopologicalAddGroup.rightUniformSpace` whose `.toTopologicalSpace` is, BY CONSTRUCTION, the ambient
    topology — so it equals the banked `instTopologicalSpaceCut` BY `rfl`, with NO ℝ-valued metric, NO
    `replaceTopology` proof obligation, and NO content import. The topology-agreement the N35 measurement
    feared holds DEFINITIONALLY. (W9 measured clean ~7s: workbench/N36-operator-exp/PREREG.md + probes.)
    Banked: ★ `instUniformSpaceCut` (the group uniformity — uniform-space MACHINERY on the DERIVED
    topological ring, a property OF the derived ℝ, STANDARD §3), ★★ `cut_uniformSpace_toTopologicalSpace_eq`
    (THE TOPOLOGY AGREEMENT: the uniformity's induced topology = the banked order topology, by construction
    — the rung the N35 measurement isolated as the hard part, here `rfl`), `instIsUniformAddGroupCut`
    (left=right uniformity coincide, the comm case), `cut_uniformity_eq` (the order-native explicit
    uniformity — entourages = "difference near 0"), + non-vacuity `cut_tsum_statable` (the `tsum ∑' n, f n`
    is now a well-formed `Cut` — the operator-exp partial sums can be STATED) / `cut_const_cauchySeq` (the
    constant sequence is CAUCHY — the uniform structure is non-degenerate, not the indiscrete collapse).
    ONE CAUSE: the SAME C6 eternal-approach that built the cut (N6), gave order-completeness (N33), the
    order topology + topological-ring continuity (N34), and the Archimedean/convergence rung (N35) now gives
    the uniform refinement. 6 decls foundations-only, costume C58 bites `⊢ instTopologicalSpaceCut = ⊥`
    (the discrete-topology garbage claim routes through the NEW agreement theorem and dies on dense order),
    NO posited exp/G₂/Aut/metric/number-system, NO Mathlib ℝ as content, NO bridge. (DECOMPOSED per W3/W9,
    childed N37.) The W1 reframe through the trunk: the uniform structure is the banked topological-ring
    continuity spoken one level up as nearness, never a posited ℝ-valued metric.

  - **✅ INCREMENT 7 LANDED (N37, `Phys/Foundation/ContinuumComplete.lean`).** `CompleteSpace Cut` — the
    CAUCHY-COMPLETENESS of the derived ℝ is banked, the completeness rung the operator-exp power series
    rests on. ★ THE W1 REFRAME THROUGH THE TRUNK THAT DODGED THE CONTENT TRAP: Mathlib's `CompleteSpace ℝ`
    goes through `CauSeq` + an ℝ-VALUED metric (`Mathlib.Topology.UniformSpace.Real`) — a CONTENT TRAP
    here (an ℝ-valued `dist` casts `|x - y| : Cut` into Mathlib's ℝ = importing ℝ as content, STANDARD §3).
    The trunk dodges it: completeness IS the banked C6 eternal-approach one level up, closing from TWO
    already-banked trunk facts with NO metric and NO `CauSeq` — (i) THE NEARNESS IS COUNTABLY GENERATED
    BECAUSE THE APPROACH IS: the neighbourhood filter at `0` has the countable basis `{x | |x| < 1/(n+1)}`,
    the eternal approach by reciprocals of the Archimedean naturals (N35 `exists_nat_one_div_lt`), so `𝓝 0`
    and hence the group uniformity `𝓤 Cut` (N36) is `IsCountablyGenerated` (`FirstCountableTopology Cut`
    does NOT synthesize — this BUILD supplies the countable generation the completeness criterion needs);
    (ii) A CAUCHY SEQUENCE IS BOUNDED, so it lives in a banked-COMPACT closed box `Icc lb ub` (N34
    Heine–Borel `isCompact_Icc`), has a convergent subsequence (`IsCompact.tendsto_subseq`), hence — being
    Cauchy — converges (`tendsto_nhds_of_cauchySeq_of_subseq`). `UniformSpace.complete_of_cauchySeq_tendsto`
    assembles them — a genuine Bolzano–Weierstrass / liminf-flavoured BUILD over the N36 uniform structure,
    attacked from the trunk rather than by porting ℝ's `CauSeq` completeness. (W9 measured clean ~7.4s:
    workbench/N37-operator-exp/PREREG.md + probe1..6.) Banked: `cut_nhds_zero_countablyGenerated` (the C6
    eternal-approach as countable nearness), `cut_uniformity_countablyGenerated` (via comap through
    subtraction, N36 `cut_uniformity_eq`), `cut_uniformity_hasBasis_abs` (the order-native abs entourage
    basis), `cauchySeq_bddAbove_range`/`cauchySeq_bddBelow_range` (Cauchy ⟹ bounded), ★★
    `instCompleteSpaceCut` (THE TARGET — `CompleteSpace Cut`, MACHINERY on the DERIVED `Cut`, a property OF
    the derived ℝ, STANDARD §3), + non-vacuity `cut_const_tendsto_complete`/`cut_cauchySeq_const_converges`.
    ONE CAUSE: the SAME C6 eternal-approach that built the cut (N6), gave order-completeness (N33), the
    order topology + Heine–Borel (N34), the Archimedean property + monotone convergence (N35), and the
    uniform structure (N36) now closes CAUCHY COMPLETENESS — the approach is countable (so the nearness is)
    and every Cauchy approach is trapped in a compact box (so it converges). 8 decls foundations-only,
    costume C59 bites `⊢ (0:Cut) = 1` (the limit of the constant-zero Cauchy sequence asserted = 1 routes
    through `CauchySeq.tendsto_limUnder` — gated on `instCompleteSpaceCut` — and dies on Hausdorff
    uniqueness), NO posited exp/G₂/Aut/metric/CauSeq/number-system, NO Mathlib ℝ as content, NO bridge.
    (DECOMPOSED per W3/W9, childed N38.) The W1 reframe through the trunk: Cauchy completeness is the
    banked C6 eternal-approach one level up — the approach is countable so the nearness is, and the
    bounded approach is trapped in a compact box so it converges; never a ported `CauSeq` / ℝ-valued metric.

  - **✅ INCREMENT 8 (part b) LANDED (N38, `Phys/Algebra/DerivationAutOpNorm.lean`).** The Cut-VALUED
    OPERATOR NORM on the 8×8 coordinate matrices over the derived ℝ is banked — the convergence-controlling
    magnitude the operator-exp power series rides. ★ THE W1 / THE-ONE-LAW REFRAME THROUGH THE TRUNK (the
    content-trap dodge, MEASURED first): Mathlib's `Norm`/`NormedRing`/`NormedSpace` typeclass is ℝ-VALUED
    (`norm : α → ℝ`) — instantiating it would cast a Cut-valued magnitude into Mathlib's ℝ = importing ℝ as
    CONTENT (STANDARD §3, the SAME trap the metric N35→N36 and Cauchy-completeness N37 dodged). The trunk
    dodges it again: `opNorm : Matrix (Fin 8) (Fin 8) Cut → Cut` is a Cut-VALUED function built from the
    order-native `abs` on the derived ℝ + finite `Finset.sum` — pure MACHINERY on the DERIVED `Cut`, NO
    `Norm` typeclass, NO ℝ. (W9 measured clean ~2s user CPU: workbench/N38-operator-exp/PREREG.md +
    probe1..3; the submultiplicativity closes with ABSTRACT `Finset` lemmas, never `Fin 8` expansion /
    `decide` / `ring`.) THE NORM: the entrywise ℓ¹ sum `opNorm M = ∑ᵢⱼ |Mᵢⱼ|`, chosen because it is
    SUBMULTIPLICATIVE WITH NO DIMENSION FACTOR — the load-bearing property the convergence of `∑ Dⁿ/n!`
    rests on (`opNorm (Dⁿ) ≤ (opNorm D)ⁿ` for `n ≥ 1` ⟹ the series is majorized by an absolutely
    convergent geometric-over-factorial, the C6 eternal-approach as a convergent series). Banked:
    `opNorm_nonneg`, `opNorm_zero`, ★ `opNorm_eq_zero` (DEFINITENESS — a genuine norm), `entry_abs_le_opNorm`
    (dominates each entry — the N32 unit-box handle), ★ `opNorm_add_le` (triangle), ★ `opNorm_smul`
    (absolute homogeneity), ★★ `opNorm_mul_le` (SUBMULTIPLICATIVITY — the convergence seed), `opNorm_pow_le`
    (the series-term bound, `n ≥ 1`), ★ `opNorm_autMatrix_le` (`≤ 64`, the N32 unit-box: 64 entries each
    `|·| ≤ 1`), `opNorm_one` (`= 8`, non-vacuity — the norm is not the zero map, and `8 ≰ 1` is why the
    power bound needs `n ≥ 1`). ONE CAUSE: the SAME Born positivity (self-overlap) that made every
    derivation skew-adjoint (N26), forced the simple type-G₂ Lie algebra (N24/N30b), bounded every
    automorphism entry (N32) and made the automorphism group topologically compact (N34), read through the
    `abs` of the derived ℝ now gives the Cut-valued submultiplicative norm in which the exponential series
    will converge. 10 theorems foundations-only, costume C60 bites `⊢ 8 = 8 * 8` (the WRONG claim that the
    norm is MULTIPLICATIVE rather than merely submultiplicative — collapses to `8 = 64` via the banked
    `opNorm_one`), NO posited exp/G₂/Aut/metric/norm-system, NO Mathlib ℝ as content, NO ℝ-valued `Norm`
    typeclass, NO bridge. (DECOMPOSED per W3/W9, childed N39.) The W1 reframe through the trunk: the operator
    norm is the order-native `abs` of the derived ℝ summed over coordinates, never a ported ℝ-valued `Norm`.

  - **N39 — the power-series exp convergence over the derived ℝ (part c)** ✅ LANDED (DECOMPOSED per
    W3/W9, childed N40). With the Cut-valued submultiplicative operator norm banked (N38) on top of
    order-completeness (N33), Heine–Borel (N34), Archimedean/convergence (N35), the uniform structure (N36)
    and Cauchy-completeness (N37), N39 banked the CONVERGENCE half of the analytic core: the matrix
    exponential series `exp(D) = ∑ₙ (1/n!)·Dⁿ` of any 8×8 coordinate matrix over the derived ℝ is
    ABSOLUTELY CONVERGENT. ★ THE W1 / THE-ONE-LAW REFRAME (the content-trap dodge, MEASURED first, CONFIRMED):
    Mathlib's STANDARD convergence machinery is ℝ-VALUED — `Summable.of_norm_bounded`, `Summable.of_nonneg_of_le`,
    `summable_geometric_of_lt_one`, the ratio test ALL take an ℝ-valued `Norm`/`NormedRing`; using any casts
    a Cut-valued magnitude into Mathlib's ℝ = importing ℝ as CONTENT (STANDARD §3, the SAME trap the metric
    N35→N36 / completeness N37 / operator norm N38 dodged). The trunk dodges it again: every lever is a
    property OF the derived `Cut`, proved from order-completeness + order topology + Archimedean +
    Cauchy-completeness, NO ℝ-valued `Norm`. (W9 measured clean ≤ 3s user CPU each: workbench/N39-operator-exp/
    PREREG.md + probe1..11, every lever green standalone before assembly.) Two oleans: PART c·1
    `Phys/Foundation/ContinuumSummable.lean` banks the 5 scalar summability levers over the derived ℝ —
    `cut_summable_of_nonneg_of_bddAbove` (nonneg + bounded partial sums ⟹ Summable, via N33 `isLUB_csSup` +
    `hasSum_of_isLUB_of_nonneg` — the C6 eternal-approach as a convergent series), `cut_summable_of_nonneg_of_le`
    (comparison), `cut_summable_of_abs` (absolute, on the N37 complete ℝ), `cut_summable_geometric` (`0≤r<1`,
    via an inline telescope — GeomSum.olean absent from the prebuilt slice), ★ `cut_summable_pow_div_factorial`
    (THE ANALYTIC CRUX: `0≤c ⟹ Summable cⁿ/n!`, a ratio-test BY HAND dominating the tail from an Archimedean
    M>c by a geometric majorant). PART c·2 `Phys/Algebra/DerivationAutExp.lean` banks the matrix-level result —
    `matrix_summable_of_entrywise` (entrywise via `Pi.summable`, the Matrix instances LITERALLY Pi's, NO
    ℝ-norm), `expTerm` (= `(1/n!)•Dⁿ`), `expTerm_entry_abs_le` (entry bound via N38 `entry_abs_le_opNorm` +
    `opNorm_pow_le`), ★★ `expTerm_summable` (THE TARGET). ONE CAUSE: the SAME Born positivity that gave the
    submultiplicative operator norm (N38) makes the exp series absolutely convergent — the factorial outruns
    `(opNorm D)ⁿ`; the norm built to control convergence controls it. 12 theorems foundations-only, costume
    C61 bites `⊢ 1 < 1` (the WRONG claim that the divergent geometric series at ratio `1` is Summable —
    `cut_summable_geometric` discharges `0≤1` and leaves the false `(1:Cut)<1`), NO posited exp/G₂/Aut/metric/
    norm-system, NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`, NO bridge.

  - **N40 — the EXPONENTIAL ONE-PARAMETER SUBGROUP over the derived ℝ (the group-theoretic content of `exp`)**
    ✅ LANDED (DECOMPOSED per W3/W9 + ★ THE ONE LAW reframe, childed N41). With the matrix exponential series
    proved CONVERGENT (N39) on top of the full analytic sub-tower (N33–N38), N40 banked the GROUP LAW of the
    exponential: `expMap D := ∑' n, expTerm D n` (`Phys/Algebra/DerivationAutExpHom.lean`, the `tsum` existing
    by N37 `CompleteSpace` + N39 `expTerm_summable`) is MULTIPLICATIVE along a commuting flow —
    ★★ `expMap_mul_of_commute` (`exp(A)·exp(B) = exp(A+B)` for `Commute A B`) — whence ★ `expMap_mul_neg`/
    `expMap_neg_mul` (`exp(D)·exp(-D) = 1 = exp(-D)·exp(D)`, exp INVERTIBLE, the GL-landing) + `expMap_zero`
    (`exp 0 = 1`). ★ THE ONE LAW (RUNBOOK W5 / STANDARD §4) — WHY THE GROUP-LAW, NOT THE LITERAL `exp(D) ∈ AutO`:
    a bounded MEASUREMENT (workbench/N40-exp-aut/PREREG.md + probe1..11, each ≤ 3s) found the literal ticket
    target TYPE-INCOHERENT — the banked `AutO` is `Subgroup (O ℚ ≃ₗ[ℚ] O ℚ)` over the RATIONALS, but `exp(D)`
    has TRANSCENDENTAL Cut entries (exp of a nonzero rational derivation), so a Cut-matrix cannot be an element
    of a group of ℚ-linear equivs; there is no Cut-side `≃ₗ[Cut]`/`IsAlgAut` infrastructure banked. Returning to
    the trunk: the MATHEMATICAL CONTENT that "exp lands in the automorphism group" IS the one-parameter-subgroup
    HOMOMORPHISM LAW + INVERTIBILITY, which is Cut-native, reuses the banked N39 convergence, and has teeth.
    ★ THE W1 / CONTENT-TRAP REFRAME (MEASURED, NO ℝ-valued norm): the engine is the Cauchy product; Mathlib's
    `…_of_summable_norm` is ℝ-NORM bound (a CONTENT trap), but the TRUNK-NATIVE
    `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` needs only `[T3Space][NonUnitalNonAssocSemiring]
    [IsTopologicalSemiring]` — all synthesize on `Matrix (Fin 8) (Fin 8) Cut` with NO norm. PART 1
    (`Phys/Foundation/ContinuumSummable.lean`) banked the Cut-native product-summability engine
    (`cut_summable_of_nonneg_of_bddAbove'`/`_of_le'`/`_of_abs'` general-index, ★ `cut_summable_prod_of_nonneg`
    via `Finset.sum_mul_sum`, `cut_summable_mul_of_abs`); PART 2 banked the one-parameter subgroup
    (`matrix_prod_summable`, ★ `expTerm_antidiagonal` THE BINOMIAL CRUX via `Commute.add_pow'` +
    `Nat.choose_mul_factorial_mul_factorial`, ★★ `expMap_mul_of_commute`, the GL-landing + non-vacuity). 16
    theorems foundations-only `[propext, Classical.choice, Quot.sound]` (independently axiom-audited). ONE CAUSE:
    the SAME Born positivity that made the exp series converge (N39, the factorial outrunning the operator norm)
    is what lets the Cauchy product rearrange absolutely and the binomial identity close — convergence and the
    group law are the same self-overlap positivity read twice. Costume C62 bites `⊢ Commute A B` (the WRONG
    claim that the homomorphism law holds for ARBITRARY non-commuting matrices). NO posited exp/G₂/Aut, NO
    Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`, NO bridge.

  - **N41a — the ITERATED LEIBNIZ BINOMIAL over the non-associative octonion algebra (part a of N41)** ✅
    LANDED (DECOMPOSED per W3/W9, childed N41b). With the one-parameter subgroup banked (N40) on top of the
    convergent exp (N39) and the full analytic sub-tower (N33–N38), N41a banked the PURE-ALGEBRA CORE of the
    exponential flow's product-preservation: for a Leibniz derivation `D` of the non-associative
    `CD (CD B)` (so `O Cut`/`O ℚ` verbatim), `Dⁿ(x·y) = ∑_{k+l=n} C(n,k)·(Dᵏx · Dˡy)`
    (`iter_leibniz_range` + the antidiagonal form `iter_leibniz_antidiag` matching the downstream Cauchy
    product) — the piece needing NO topology, NO coordinates, NO completeness, only the Leibniz law +
    binomial combinatorics. `Phys/Algebra/DerivationLeibnizPow.lean`. ★ THE ONE LAW (the genuine finding):
    the SAME Leibniz bilinearity that made `Der(𝕆)` a Lie algebra at order 1 (N6 `isDeriv_bracket`, which
    used ONLY bilinearity + Leibniz, NEVER associativity) integrates to the binomial flow on a product at
    order n. ★ WHY NON-ASSOCIATIVITY IS NO OBSTRUCTION (W1 reframe): every step expands `D(u·v)` into
    `Du·v + u·Dv` by distributivity + Leibniz alone, NO associator appears — so we CANNOT use
    `Commute.add_pow'` (the route the banked matrix `expTerm_antidiagonal` used on the associative matrix
    ring) and instead use a DIRECT induction via the Leibniz split `dterm_split` (the only place `IsDeriv`
    enters) + the pure ℕ-scalar Pascal identity `pascal_smul_sum`. Non-vacuity `iter_leibniz_two` exhibits
    the genuine `C(2,1)=2` cross-term `2•(Dx·Dy)`. 6 theorems foundations-only `[propext, Classical.choice,
    Quot.sound]` (independently axiom-audited). Costume C63 bites `⊢ IsDeriv D` (the WRONG claim the binomial
    holds for an ARBITRARY endomorphism — the dropped Leibniz hypothesis). NO posited exp/`G₂`/`Aut`, NO
    Mathlib ℝ as content (`Nat.choose`/`Finset.antidiagonal` are machinery on the iteration index, the fold's
    re-entry count N7, not a content number system), NO bridge.

  - **N41b — the TOPOLOGICAL `*`-ALGEBRA STRUCTURE on `O Cut` over the derived ℝ (part b of N41)** ✅
    LANDED (DECOMPOSED per W3/W9, childed N41c; W6/W9.8 finalization-recovery of run 173). With the
    iterated-Leibniz binomial banked (N41a) + the one-parameter subgroup (N40) on the convergent exp (N39)
    and the full analytic sub-tower (N33–N38), N41b banked the FOUNDATIONAL TOPOLOGICAL GROUND the literal
    `O Cut` automorphism + derivative stand on: `O Cut = CD (CD (Dbl Cut))` is a COMPLETE UNIFORM
    TOPOLOGICAL `*`-ALGEBRA over the derived ℝ — Hausdorff (`T2`), regular (`T3`), CAUCHY-COMPLETE, with
    continuous `+`/`−`/`·`/`star`/scalar-`•`, and `IsTopologicalSemiring`. `Phys/Cascade/OctonionTopology.lean`.
    ★ THE ROUTE: each double `CD A` / rung-1 double `Dbl R` is given the COMPLETELY INDUCED uniform structure
    `UniformSpace.comap toProd` pulled back along the pair projection `toProd : CD A → A × A`; the induced
    topology = the order-pullback by `rfl` (NO topology/uniformity DIAMOND — only `UniformSpace` is defined,
    `.toTopologicalSpace` is `induced toProd` definitionally). CompleteSpace (`completeSpace_iff_isComplete_range`
    + range = univ), T2/T3 (`IsEmbedding.t2Space`/`.t3Space`), and all the continuity instances transfer
    because each coordinate of the Cayley–Dickson product/sum/conjugation is a continuous `Cut`-polynomial in
    the projections (`Continuous.add/mul/neg/star`). ★ THE NON-ASSOCIATIVITY IS NO OBSTRUCTION (W1 reframe):
    continuity is a statement about the BILINEAR product map, NOT reassociation — exactly as the derivation
    Lie algebra (N6) and the iterated Leibniz binomial (N41a) survive non-associativity using only
    bilinearity. `instIsTopologicalSemiring` gives the EXACT hypothesis shape
    `[T3Space][NonUnitalNonAssocSemiring][IsTopologicalSemiring]` the trunk-native Cauchy product
    `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` consumes, with NO ℝ-valued `Norm`. ★ ONE CAUSE (THE ONE
    LAW): the SAME Born-positivity completion that made `Cut` a complete uniform topological ring (N33–N37 —
    the C6 eternal-approach as Cauchy-completeness) propagates up every rung of the cascade unchanged. 39
    decls foundations-only `[propext, Classical.choice, Quot.sound]` (independently axiom-audited). Costume
    C64 bites `TopologicalSpace.induced CD.toProd inferInstance = ⊥` (the WRONG claim that the genuine induced
    topology on `O Cut` is the DISCRETE topology `⊥` — under which every continuity/separation theorem in the
    rung would be VACUOUS). NO posited topology/metric/exp/`G₂`/`Aut`, NO Mathlib ℝ as content, NO ℝ-valued
    `Norm`, NO bridge.

  - **N41c — the ANALYTIC INTEGRATION: the vector exp `expO` + the LITERAL `O Cut` product-preservation
    `expO D (x·y) = expO D x · expO D y` over the derived ℝ (part c of N41)** ✅ LANDED (DECOMPOSED per
    W3/W9, childed N41d; W6/W9.8 finalization-recovery of run 175 — which MEASURED the whole increment
    clean (probes ≤16s, KILL=60s never approached, the genuine analytic core confirmed elaborating in
    probe4/6) and wrote `DerivationOExp.lean` + C65 + wired Phys.lean/AxiomAudit/manifest, then timed out
    90/90 BEFORE building/gating/auditing/finalizing — NOTHING committed; this run verified-then-finalized,
    NOT a fresh build, NOT a W9.6 fossil). With BOTH the per-`n` algebraic identity (N41a iterated-Leibniz
    binomial) AND the topological ground (N41b complete topological `*`-algebra on `O Cut`) banked, N41c
    banked the analytic integration in `Phys/Algebra/DerivationOExp.lean` (14 decls foundations-only,
    independently axiom-audited): (1) THE VECTOR EXPONENTIAL `expO D x := ∑' n, (1/n!)•(Dⁿ x)` on `O Cut`
    (over the `Module Cut (O Cut)` built by transfer up the cascade, defeq to the `CD.instSMul` N41b's
    `oCut_continuousSMul` is stated over), with `expO 0 = id`; (2) the smul-centrality bundle
    `SmulCompat`/`smulCompat_oCut` (the bilinearity of `•` over `·`, lifted from the base `Dbl Cut` up
    through the two `CD` doublings — surviving non-associativity exactly as N6's bracket and N41a's binomial
    do, because each is about the BILINEAR product, never reassociation); (3) ★ `expO_term_antidiag` (THE
    PER-`n` ALGEBRAIC INTEGRATION: combine N41a `iter_leibniz_antidiag` + `C(n,k)/n!=1/(k!·l!)` + the
    smul-centrality bundle to rewrite `(1/n!)•(Dⁿ(x·y))` as `∑_{k+l=n} ((1/k!)•Dᵏx)·((1/l!)•Dˡy)`); (4) ★★
    `expO_mul_of_summable` (THE LITERAL PRODUCT-PRESERVATION `expO D (x·y) = expO D x · expO D y` for a
    Leibniz derivation `D`, passing the per-`n` identity to the `tsum` limit by the trunk-native Cauchy
    product `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` over the banked N41b `oCut_t3Space` +
    `oCut_completeSpace` + `oCut_isTopologicalSemiring`, with NO ℝ-valued `Norm`) — CONDITIONAL on three
    honest `Summable` premises (the two series + the product family), a fully proved conditional implication.
    ★ ONE CAUSE (THE ONE LAW): the SAME Leibniz bilinearity that made `Der(𝕆)` a Lie algebra (N6, order 1)
    and gave the iterated binomial (N41a, order n) integrates — once N41b's topological ground lets the
    finite identity pass to the limit — to the product-preservation of the flow (order ∞). The non-vacuity
    `expO_term_antidiag_one` exhibits the `n=1` integration collapsing EXACTLY to the Leibniz law
    `D(x·y)=D x·y+x·D y` (the derivative seed). Costume C65 bites `IsDeriv D` (the WRONG claim that the
    per-`n` exp product-integration holds for an ARBITRARY endomorphism — routing through
    `expO_term_antidiag` leaves the undischargeable `IsDeriv D`). NO posited exp/`G₂`/`Aut`/metric/norm, NO
    Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO
    bridge.

  - **N41d — the CUT-SIDE COORDINATIZATION + the UNCONDITIONAL SUMMABILITY of the `O Cut` vector exp
    series over the derived ℝ (part d of N41)** ✅ LANDED (DECOMPOSED per W3/W9, childed N41e; W6/W9.8
    finalization-recovery of run 177 — which MEASURED the increment clean (probes ≤16s, KILL=60s never
    approached) and COMMITTED `DerivationOExpSummable.lean` + wired Phys.lean/AxiomAudit (commit 7a00fcb)
    but timed out 90/90 BEFORE building/gating/auditing/finalizing (no costume, no manifest, no gate, no
    LEDGER/ROADMAP) — the recurring N28–N41c finalization-miss; this run verified-then-finalized (built
    the olean clean 3388 jobs, independently axiom-audited all 11 decls, added the missing costume C66 +
    manifest row, gated D0–D6 green), NOT a fresh build, NOT a W9.6 fossil — all 11 proofs lightweight
    `ext`/`simp`/`induction`). N41d banked THE GENUINE HARD CORE the N41c retrospective isolated as "the
    gating dependency for everything below", in `Phys/Algebra/DerivationOExpSummable.lean` (11 decls
    foundations-only, independently axiom-audited via /tmp/n41d_axcheck.lean against the built olean): (1)
    `coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut)` — the Cut-side coordinate frame (the `![e0..e7]` of the
    nested `.re/.im` projections, the analogue of the banked ℚ-side `coordO`/`bO`, now over the derived ℝ),
    CONTINUOUS both ways over the N41b uniform topology (`coordOCut_continuous`/`coordOCut_symm_continuous`
    via the banked `CD.continuous_re/im` + `Dbl.continuous_re/im`); (2) `derivMatrix D' := toMatrix'
    (coordOCut.conjRingEquiv D')` + ★ `expO_matrix_rep` (THE POWER TRANSPORT `coordOCut ((D'ⁿ) x) =
    (derivMatrix D')ⁿ *ᵥ coordOCut x`, via `map_pow` of `toMatrixAlgEquiv'` + `map_pow` of `conjRingEquiv`
    + `toMatrix'_mulVec`); (3) `expO_term_coord` (the `n`-th term to the banked N39 `expTerm`) +
    `mulVecHom`/`mulVecHom_continuous` (`(· *ᵥ v)` a continuous AddMonoidHom — the summability transport
    vehicle); (4) ★★ `expO_summable` (THE TARGET — the UNCONDITIONAL `Summable (fun n => (1/n!)•((D'ⁿ) x))`
    for a `Cut`-linear endomorphism `D'`: its image under the continuous `coordOCut` is `n ↦ expTerm
    (derivMatrix D') n *ᵥ coordOCut x`, summable by the banked N39 `expTerm_summable.map mulVecHom`;
    transported back by the continuous `coordOCut.symm`) + `expO_summable_restrict` (carrying it to the
    `ℤ`-restriction `D'.restrictScalars ℤ` — same underlying powers — the form N41c's `expO` consumes), +
    non-vacuity `expO_summable_one`. ★ ONE CAUSE (THE ONE LAW): the convergence of the octonion-valued
    vector series is not bashed analytically on the non-associative `O Cut` — it is DISSOLVED THROUGH THE
    TRUNK, reduced through the Cut-side coordinate frame (the same Born-positive structure the cascade
    provides) to the already-banked convergence of the matrix series majorized by the `Cut`-valued operator
    norm `opNorm = ∑ᵢⱼ|Mᵢⱼ|`; the convergence of the matrices (N39, the factorial outrunning `(opNorm M)ⁿ`)
    and of the vectors are the same C6 eternal-approach read through the coordinatization. Costume C66
    (`DerivationOExpSummableNoFactorialCostume`) bites `factorial.*=.*x` (the WRONG claim that the
    UN-normalized series `n ↦ (D'ⁿ) x` — the `1/n!` factorial that makes the majorant converge DROPPED — is
    `Summable`; routing through `expO_summable` via `.congr` leaves the false per-term identity
    `(1/n!)•((D'ⁿ) x) = (D'ⁿ) x`). NO posited exp/`G₂`/`Aut`/metric/norm, NO Mathlib ℝ as content, NO
    ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO bridge.

  - **N41e — the OCTONION-PRODUCT-FAMILY SUMMABILITY `hxy` + the DISCHARGE to the UNCONDITIONAL LITERAL
    `O Cut` PRODUCT-PRESERVATION `expO D (x·y) = expO D x · expO D y` over the derived ℝ (part e of
    N41)** ✅ LANDED (DECOMPOSED per W3/W9, childed N41f). Run 179 froze the PREREG GO(decompose): the
    exact-DECOMPOSITION route (NOT the nlinarith inequality bound, which hit the W9 wall as predicted) was
    MEASURED clean — all 8 product coordinates verified (`probe_verify8`, 8s, `simp[CD/Dbl mul/add/neg/star]
    + ring`), the coordinate-sequence summability (`probe_coordsum`, 9s), the leaf `cut_summable_mul_of_abs`
    (`probe_exact0`, 8s), KILL=60s never approached — but run 179 timed out 90/90 BEFORE writing the
    production file. This run (run 180) lifted the measured proof forms into production: the full assembly
    compiled clean ~12s on the first real `lake build` (3390 jobs), NO inflated maxHeartbeats, then
    independently axiom-audited, costumed (C67), gated D0–D6 green (66/66 costumes, 712 audited theorems),
    LEDGER/ROADMAP finalized — the N28–N41d finalization-miss NOT repeated. N41e banked, in
    `Phys/Algebra/DerivationOProductPreserving.lean` (6 decls foundations-only, independently axiom-audited
    via /tmp/n41e_axcheck.lean against the built olean): (1) `oCut_term_abs_summable` — each coordinate
    sequence `k ↦ |(coordOCut ((1/k!)•((D'ᵏ) x))) i|` is absolutely summable (its coordinate image, banked
    `expO_term_coord`, is a finite `Cut`-combination of the banked N40 entrywise factorial majorants
    `expTerm_entry_abs_summable`; comparison `cut_summable_of_nonneg_of_le` over the abs-triangle bound);
    (2) `oCut_prod_leaf` — a product of two coordinate-projection sequences is summable over `ℕ×ℕ` (banked
    `cut_summable_mul_of_abs`); (3) ★★ `oCut_prod_summable` — THE GENUINE HARD CORE: the `hxy` octonion-
    PRODUCT-family `(k,l) ↦ a k · b l` is summable. THE ONE LAW / the dissolution: the non-associative
    product is NOT bashed — each product coordinate `coordOCut (a·b) m` reduces, through the SAME coordinate
    frame N41d built, to a FINITE signed sum of `(coordOCut a) i · (coordOCut b) j` (the octonion
    multiplication expanded ONCE via the banked `@[simp]` CD/Dbl `mul_re`/`mul_im`/`add_*`/`neg_*`/`star_*`
    + `ring`), each a `Summable.add`/`.sub` of the `oCut_prod_leaf` leaves; `Pi.summable` assembles the 8
    coordinates, the continuous `coordOCut.symm` transports back to `O Cut` — NO structure-constant table,
    NO new analysis; (4) ★★★ `expO_mul` — THE UNCONDITIONAL LITERAL PRODUCT-PRESERVATION
    `expO (D'.restrictScalars ℤ) (x·y) = expO (…) x · expO (…) y` for a `Cut`-linear `D'` whose
    `ℤ`-restriction is a Leibniz derivation: feeds `expO_summable_restrict` (the two single-variable series,
    banked unconditional N41d) + `oCut_prod_summable` (the product family) into the banked N41c
    `expO_mul_of_summable`, discharging all THREE summability premises — the only remaining hypothesis is
    the Leibniz law, the defining property of the class; (5) `restrictScalars_pow_apply` (the `ℤ`-restriction
    power = the `Cut`-power pointwise) + non-vacuity `expO_mul_zero` (the zero endomorphism's `ℤ`-restriction
    is a Leibniz derivation, inhabiting the hypothesis class). ★ ONE CAUSE: the SAME Born positivity that
    gave the operator norm (N38), the convergent matrix series (N39) and the unconditional vector-exp
    summability (N41d) carries, through the coordinate frame, to the summability of the octonion PRODUCT
    family; the product law of the exponential flow rests on the same C6 eternal-approach. Costume C67
    (`DerivationOProductPreservingDropFactorialCostume`) bites `factorial.*=.*coordOCut` (the WRONG claim
    that the coordinate sequence of the UN-normalized power series `k ↦ (D'ᵏ) x` — the `1/k!` factorial
    DROPPED — is absolutely summable; routing through `oCut_term_abs_summable` via `.congr` leaves the false
    `|coordOCut ((1/k!)•((D'ᵏ) x)) i| = |coordOCut ((D'ᵏ) x) i|`). Physics-words-removable: delete
    "exp/derivation/automorphism" → the convergent power series `∑(1/n!)•Dⁿ` of a Leibniz endomorphism of
    the 8-dim non-associative complete-topological `*`-algebra over the derived ℝ preserves the product
    unconditionally (an algebra endomorphism). NO posited exp/`G₂`/`Aut`/metric/norm, NO Mathlib ℝ as
    content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO bridge.

  - **N41f — LANDED (run 182, DECOMPOSED per W3/W9 — the AUTOMORPHISM banked, the derivative childed
    N41g).** Built `Phys/Algebra/DerivationOAutomorphism.lean` (12 decls, foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited, gate D0–D6 green / costume C68,
    committed 8bff5f6). ★★★ THE EXPONENTIAL OF A LEIBNIZ DERIVATION IS A GENUINE Cut-SIDE ALGEBRA
    AUTOMORPHISM of the non-associative octonion algebra `O Cut` over the derived ℝ — `Cut`-linear (a
    `≃ₗ[Cut]`, `expOEquiv`), structure-preserving (banked N41e `expO_mul`), unital (`expO_one`), invertible
    with inverse `expO (-D)` (`expOEquiv_symm_apply`). ★ THE ONE LAW (matrix-transport, reframe through the
    trunk): the `Cut`-linearity and invertibility are NOT bashed over the non-associative product — they
    transport, through the SAME N41d coordinate frame `coordOCut`, to the banked N40 MATRIX one-parameter-
    subgroup law `expMap_mul_neg`. `coordOCut_expO` (the W9-exposed crux, MEASURED 8s) is the INTERTWINING
    `coordOCut (expO D x) = expMap (derivMatrix D') *ᵥ coordOCut x` (the `tsum` analogue of the banked
    per-power `expO_matrix_rep`); `expOLin` is the MANIFESTLY `Cut`-linear `coordOCut.symm ∘ₗ
    mulVecLin (expMap M) ∘ₗ coordOCut`, equal to `expO` by `coordOCut_expO` (the `Cut`-linearity FOR FREE
    from the coordinate frame); `expOEquiv = LinearEquiv.ofLinear (expOLin D') (expOLin (-D'))`, the
    composition identities collapsing through `Matrix.mulVec_mulVec` + `derivMatrix_neg` to `expMap_mul_neg`/
    `expMap_neg_mul` (the inverse of the flow is the flow of the NEGATED derivation); `expO_one` is unital
    via `deriv_one_eq_zero` (a Leibniz derivation kills the unit); `expOEquiv_isAlgAut` is the HEADLINE
    `IsAlgAutCut (expOEquiv D')`. ★ ONE CAUSE: the SAME Born positivity that gave the operator norm (N38),
    the matrix series (N39), the matrix one-parameter subgroup (N40), and the unconditional product law
    (N41e) now closes the GROUP structure — `Der(𝕆)` integrates to `Aut(𝕆)`. Costume C68
    (`DerivationOAutomorphismWrongInverseCostume`) bites `expOLin D'. x = .expOLin` (the WRONG involution
    `expOLin D' (expOLin D' x) = x`, FALSE unless `D'=0` — the group inverse is `expO (-D)`, not `expO D`).
    Physics-words-removable: delete "exp/derivation/automorphism" → the convergent power series `∑(1/n!)•Dⁿ`
    of a Leibniz endomorphism of the 8-dim non-associative complete-topological `*`-algebra over the derived
    ℝ is a `Cut`-linear structure-preserving bijection (an algebra automorphism), invertible with inverse the
    series of `-D`. NO posited exp/`G₂`/`Aut`/metric/norm, NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO
    Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO bridge.

  - **N41g — LANDED (run 185, NOT decomposed — the TANGENT half BANKED in full).** `d/dt exp(tD)|₀ = D`
    over the derived ℝ is PROVED FORWARD, completing the Lie-algebra ↔ Lie-group correspondence
    `Der(𝕆) ↔ Aut(𝕆)` over the derived continuum. Two files, both foundations-only `[propext,
    Classical.choice, Quot.sound]`:
    • `Phys/Foundation/ContinuumScalarDeriv.lean` (the genuine W1 BUILD core — the continuous-parameter
      function-limit + remainder-tail-squeeze infrastructure over `Cut` that did NOT exist; the banked
      Cut-limit infra was sequence-only, `atTop` over ℕ). `cut_tendsto_zero_of_abs_le` (THE SQUEEZE over
      the N34 `OrderTopology Cut`, `-u ≤ h ≤ u`, `u → 0 ⟹ h → 0`, NO Metric), `cut_abs_tsum_le`
      (`|∑' f| ≤ ∑' |f|`), `cut_geomdom_abssummable`/`cut_geomdom_tsum_le` (the geometric-dominated
      remainder majorant for `|t| ≤ 1`), ★★ `cut_powerseries_deriv` (for `∑|aₙ|` summable — entire,
      radius ≥ 1, the exp setting — `t⁻¹((∑' tⁿ aₙ) − a₀) → a₁` in `𝓝[≠] 0`; peels `f(t) = a₀ + a₁t +
      t²R(t)` via `Summable.sum_add_tsum_nat_add`, `|tR(t)| ≤ C|t|`, squeeze). Costume C69 bites the
      WRONG coefficient (limit `a 2` not `a 1`).
    • `Phys/Algebra/DerivationOTangent.lean` (the O Cut assembly). THE ONE LAW (reframe through the trunk):
      the derivative is NOT bashed on the non-associative product — it transports through the N41d
      coordinate homeomorphism `coordOCut` to the MATRIX exp derivative, reducing ENTRYWISE to
      `cut_powerseries_deriv`. `derivMatrix_smul` (matrix homogeneity), `expMap_smul_entry` (each entry =
      the scalar power series via `HasSum.map` through the entry projection), `expMap_entry_tangent` (THE
      HEART, `d/dt expMap(t•M)_{ij}|₀ = M_{ij}`), `expMap_vec_tangent` (vector lift, `tendsto_pi_nhds` +
      `tendsto_finset_sum`), ★★ `expO_tangent` (THE THEOREM, `t⁻¹ • (expO ((t•D').restrictScalars ℤ) x −
      x) → D' x` in `𝓝[≠] 0`, pulled back through `coordOCut.symm` using the N41f intertwining
      `coordOCut_expO` + the `n=1` `expO_matrix_rep`), `expO_tangent_zero` (non-vacuity). Costume C70
      bites the WRONG derivative (limit `2•(D'x)` not `D'x`). NO Mathlib ℝ as content, NO ℝ-valued `Norm`,
      NO `HasDerivAt`/`NormedField`/`Metric`-on-Cut, NO bridge. The measured run-182 "genuine obstruction"
      (missing continuous-parameter limit infra) was real and was BUILT (File A); the reduction was clean
      as measured, so the node landed without further decomposition.

  - **★ N42a — LANDED (run 187, increment 1 of SU(3) ⊂ G₂ — the STABILIZER LIE SUBALGEBRA banked; the
    dimension `= 8` + the 7 = 3 ⊕ 3̄ ⊕ 1 split childed N42b/N42c).** Built `Phys/Algebra/DerivationStabilizer.lean`
    (10 decls, foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited, gate
    D0–D6 green / costume C71, committed this run). ★★ THE STRUCTURAL SKELETON OF `su(3) ⊂ g₂` AT THE
    LIE-ALGEBRA LEVEL, DERIVED FORWARD: `stabLieQ := {D ∈ Der(𝕆) : D u1 = 0}` is a `LieSubalgebra ℚ derivationLieQ`,
    the stabilizer of the fixed imaginary unit `u1 = e₁` (the banked first complex unit of the cascade,
    `complexUnit_sq : u1 · u1 = −1`). ★ THE KEY (the *Lie* closure): `⁅D,E⁆ u1 = D(E u1) − E(D u1) = 0`
    whenever both kill `u1` — the commutator of two stabilizing derivations stabilizes, so the stabilizer
    is a genuine Lie subalgebra (not merely a submodule). ★ `evalU1 : derivationLieQ →ₗ[ℚ] O ℚ` (the
    evaluation-at-`u1` map) + `stabLieQ_toSubmodule_eq_ker` (`stabLieQ.toSubmodule = ker evalU1`) — the
    RANK–NULLITY HOOK that N42b uses for the dimension. NON-VACUITY (W8): `stabLieQ_ne_bot` (`D0E ∈ stab`,
    `D0E ≠ 0` since it sends `u4 ↦ e₃`) + `stabLieQ_ne_top` (`D3E ∉ stab` since `D3E u1 = e₆ ≠ 0`) pin the
    stabilizer STRICTLY between `0` and the 14-dim whole — the qualitative `0 < 8 < 14` that makes
    `su(3) ⊊ g₂`. ★ THE MOAT: SU(3) ⊂ G₂ is standard (Günaydin–Gürsey); the novelty is it DESCENDS from
    the banked `derivationLieQ`/`ImO`/`u1`, NOT a posited `SU(3)`/`G₂`/`su(3)`/`g₂`. Pure algebra over ℚ
    (NO continuum, NO Mathlib ℝ as content; `LieSubalgebra`/`LinearMap.ker` are MACHINERY on the DERIVED
    objects). W9 MEASURE-FIRST: all probes ≤11s (the `u1*u1=−1` decide-free `ext`/`simp`, the 14 derivation
    images on `u1`, the `LieSubalgebra` closure, the non-vacuity coordinate witnesses), KILL=60s never
    approached — a LIGHT node, no W9 beast. Costume C71 (`DerivationStabilizerWrongMemberCostume`: `D3E`
    claimed to lie in the stabilizer — the whole-algebra/dimension-14 reading — refuted by `D3E_not_mem_stab`)
    bites with signature `∉ stabLieQ`. Physics-words-removable: delete "colour/SU(3)/G₂/triplet/complex unit"
    → the set of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ annihilating a
    fixed square-root of `−1` is a proper nontrivial Lie subalgebra of the derivation algebra, equal to the
    kernel of the evaluation-at-that-vector map.

  - **★ N42b — LANDED (run 188 banked + built + axiom-audited; run 189 W6 verify-then-finalize — increment 2
    of SU(3) ⊂ G₂, the DIMENSION `= 8` banked; the 7 = 3 ⊕ 3̄ ⊕ 1 split childed N42c).** Built
    `Phys/Algebra/DerivationStabilizerDim.lean` (4 headline decls + 6 unit defs + 14 image lemmas,
    foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against the built
    olean, gate D0–D6 green / costume C72). ★★★ THE DIMENSION OF THE STABILIZER OF A FIXED SQUARE-ROOT-OF-`−1`
    INSIDE THE 14-DIM DERIVATION Lie ALGEBRA `Der(𝕆)` IS `8` (`= dim su(3)`), DERIVED by rank–nullity, NOT a
    posited `dim su(3) = 8`. ★ `imgUnit_indep` (the 6 imaginary units `{e₂,…,e₇}` orthogonal to the
    `⟨1,u1⟩ = ⟨e₀,e₁⟩` complex line are linearly independent — a coordinate read-off). ★★ `range_evalU1_eq`
    (THE KEY: `range evalU1 = span {e₂,…,e₇}` — computed from the explicit images of the banked 14-element
    basis `bL`/`bLbasis`/`bL_span_top` N23 on `u1`: `D0E,D1E,D2E,D13E ↦ 0`, the other ten ↦ ± the 6 units;
    both inclusions via `LinearMap.range_eq_map` + `Submodule.map_span` + the `bL_span_top` span identity).
    ★ `finrank_range_evalU1` (`= 6`, via `finrank_span_eq_card imgUnit_indep`). ★★★ `finrank_stabLieQ`
    (THE TARGET: `dim stabLieQ.toSubmodule = 8` — `LinearMap.finrank_range_add_finrank_ker evalU1` gives
    `finrank (range) + finrank (ker) = finrank derivationLieQ`; with `finrank derivationLieQ = 14` from the
    banked basis `bLbasis` and `stabLieQ_toSubmodule_eq_ker` (N42a) identifying `ker evalU1` with the
    stabilizer, `omega` closes `6 + dim stab = 14 ⟹ dim stab = 8`). ★ THE MOAT: `dim su(3) = 8` is standard
    (Günaydin–Gürsey); the novelty is the `8` DESCENDS from the banked `derivationLieQ` basis + the explicit
    6-dim range of evaluation-at-a-vector, NOT posited to "match" su(3). Pure algebra over ℚ (NO continuum, NO
    Mathlib ℝ as content; `Module.finrank`/rank–nullity/`Submodule.span`/`finrank_span_eq_card` are MACHINERY
    on the DERIVED objects). W9 MEASURE-FIRST: a LIGHT node, all probes well under KILL=60s (the 14 image
    computations `ext <;> simp`, the 6-unit independence, the `range = span` plumbing). Costume C72
    (`DerivationStabilizerDimWrongValueCostume`: the WRONG claim that the dimension is `14` — the whole `g₂`,
    the stabilizer = everything — refuted by supplying the banked `finrank_stabLieQ` (`= 8`) where `= 14` is
    demanded, an `8 ≠ 14` type mismatch) bites with signature `toSubmodule = 14`. Physics-words-removable:
    delete "colour/SU(3)/G₂/su(3)/triplet" → the dimension of the kernel of the evaluation-at-a-fixed-vector
    linear map on the 14-dim Leibniz-derivation Lie algebra of the Cayley–Dickson double of a double of a
    double of ℚ is 8.

  - **★ N42c — LANDED (run 190 measured + banked + built + axiom-audited; run 191 W6/W9.8 verify-then-finalize —
    increment 3, FINAL, of SU(3) ⊂ G₂; the `7 = 3 ⊕ 3̄ ⊕ 1` BRANCHING banked; the colour-branching arc CLOSED).**
    Built `Phys/Algebra/DerivationStabilizerSplit.lean` (the complex structure `JO`/`JO_sq`/`JOequiv`, the explicit
    7-element `imBasis` of `Im(𝕆)`, the three pieces `singlet`/`Uhol`/`Uah`, the `J`-swap `Uhol_map_JO_le_Uah`/
    `Uah_map_JO_le_Uhol`, the two splits `Uhol_sup_Uah_eq_Vsub` + `singlet_sup_Vsub_eq_ImO`, and the headline
    `branching_7` — all foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited
    against the built olean via `workbench/N42-colour-branching/axcheck_n42c.lean`, gate D0–D6 green / costume C73).
    ★★★ THE 7-DIM IMAGINARY PART `Im(𝕆)` OF THE TERMINAL ALGEBRA SPLITS AS `1 ⊕ (3 ⊕ 3̄)` UNDER THE COMPLEX STRUCTURE
    `J = L_{u1}`, DERIVED FORWARD, NOT a posited `SU(3)`/`3 ⊕ 3̄`. ★★ `JO_sq` (THE COMPLEX STRUCTURE `J ∘ J = −id`,
    THE ONE LAW in action: the would-be brutal non-associative double-product `u1·(u1·x)` is DISSOLVED through the
    trunk — the banked LEFT-ALTERNATIVE law `mul_mul_left` (`u1·(u1·x) = (u1·u1)·x`) + `complexUnit_sq` (`u1·u1 = −1`)
    give `−x` for EVERY `x`, NO associativity, NO coordinate expansion). ★ `JOequiv` (`J` a linear automorphism,
    inverse `−J`). `finrank_singlet`/`finrank_Uhol`/`finrank_Uah` (dims `1`/`3`/`3` — the `3̄` automatically 3-dim as
    the `J`-image of the independent `3`, the conjugate triplet). ★★ `Uhol_sup_Uah_eq_Vsub` (the `6 = 3 ⊕ 3̄` split
    of the Born-orthogonal complement `V`), ★★ `singlet_sup_Vsub_eq_ImO` (the `7 = 1 ⊕ 6` split of `Im(𝕆)`), ★★★
    `branching_7` (the packaged `Im(𝕆) = ⟨u1⟩ ⊕ (3 ⊕ 3̄)`, dims `1 + (3 + 3) = 7`). ★ THE MOAT: `7 → 3 ⊕ 3̄ ⊕ 1`
    is standard (Günaydin–Gürsey); the novelty is the complex `3` DESCENDS from the banked square-root-of-`−1` `u1`
    (the cascade's first imaginary generator) acting by left-multiplication on the banked `Im(𝕆)`, NOT a posited
    `SU(3)`/`3 ⊕ 3̄`. Pure algebra over ℚ (NO continuum, NO Mathlib ℝ/ℂ as content; the complexification IS the
    DERIVED `u1`-action, `LinearMap`/`Submodule`/`finrank`/`LinearEquiv` are MACHINERY on the DERIVED objects).
    W9 MEASURE-FIRST: a LIGHT node (the trunk-native `JO_sq` + coordinate read-offs `ext <;> simp` well under
    KILL=60s). Costume C73 (`DerivationStabilizerSplitWrongJSqCostume`: the WRONG claim `J ∘ J = +id` — a real
    involution, NO complex structure, the 7 stays real-decomposed with no `3 ⊕ 3̄` — refuted by an
    `−LinearMap.id ≠ LinearMap.id` type mismatch) bites with signature `JO = -LinearMap.id`. Physics-words-removable:
    delete "colour/SU(3)/G₂/triplet/3/3̄/singlet/complex" → left-multiplication by a fixed square-root of `−1` on the
    6-dim orthogonal complement of its own plane inside the imaginary part of the Cayley–Dickson double of a double of
    a double of ℚ squares to `−id`, making that complement the direct sum of an explicit 3-dim subspace and its image
    under that operator; with the 1-dim fixed line this splits the 7-dim imaginary part as `1 ⊕ (3 ⊕ 3)`.

  - **★ N43 — LANDED (run 192). THE LORENTZIAN SIGNATURE `(1, 9)` of the determinant form on the self-adjoint
    `2 × 2` matrices over the terminal algebra, DERIVED from the trunk's Born positivity.** Built
    `Phys/Algebra/SpacetimeSignature.lean` (12 decls, foundations-only `[propext, Classical.choice, Quot.sound]`,
    independently axiom-audited against the built olean via `workbench/N43-spacetime-signature/axcheck_n43.lean`,
    gate D0–D6 green / costume C74, committed this run). ★ W4.5 FRONTIER CALL: of the two ROADMAP §N43 candidate
    fronts, the THREE-FOLD GENERATION CAP (front i) was found ALREADY BANKED — `Phys/Algebra/JordanTower.lean`
    `jordan_cap_iff_nonassoc` (the order-4 Hermitian-Jordan failure ⟺ `𝕆` non-associative, the one-cause link)
    + `Phys/Algebra/HermitianJordan/PieceBfinal.lean` `jordan_cap_pinned_at_three` (the tower HOLDS at order 3,
    FAILS at 4, by the SAME octonionic non-associativity that stopped the cascade). Re-deriving it would be
    gold-plating (W4.5 sufficiency wall); the genuine unbanked frontier is the SPACETIME SIGNATURE (front ii), so
    that is what landed. ★★★ THE REAL DETERMINANT OF A SELF-ADJOINT `2 × 2` OCTONION MATRIX IS THE LORENTZIAN FORM
    `t² − x² − gForm v v`, WITH SYLVESTER SIGNATURE `(1, 9)` — the octonionic Minkowski space `ℝ^{1,9} = H₂(𝕆)`,
    DERIVED FORWARD. ★★ `herm2_det_eq` (THE FORCED REDUCTION: the real determinant `reQ(M₀₀·M₁₁ − M₀₁·M₁₀)` —
    real part because `O ℚ` is non-commutative so Mathlib `Matrix.det` does not apply — collapses via the banked
    Born identity `v·star v = ι(Nrm v)` written through `gForm` to `t² − x² − gForm v v`; the MINUS on the Born
    block, the trunk positivity entering OPPOSITE-sign to the time square, is the entire source of the
    indefiniteness — the single time is FORCED by the `2 × 2` Hermitian determinant, not posited). The banked Born
    form on `O ℚ` is POSITIVE-DEFINITE (a sum of 8 squares, `DerivationCompact.gForm_self_sum_sq`/`gForm_self_eq_zero`),
    so it supplies the 8 of the 9 spacelike directions; `Qform_space_nonpos`/`Qform_space_def` make the 9-dim space
    block negative-DEFINITE. ★ `timeSub_isCompl_spaceSub` (`STV = ℚ × ℚ × O ℚ` splits as the internal direct sum
    `timeSub ⊕ spaceSub`), `finrank_timeSub = 1`, `finrank_spaceSub = 9` (rank–nullity on the time projection,
    using the banked `finrank_O_eq_eight`), `Qv_pos_on_time`/`Qv_neg_on_space` (positive-definite on the `1`,
    negative-definite on the `9`). ★★★ `signature_one_nine` (THE HEADLINE: Sylvester signature `(1, 9)`, ONE
    timelike + NINE spacelike). THE MOAT: `ℝ^{1,9} = H₂(𝕆)` is standard (Sudbery, Baez, Manogue–Dray); the novelty
    is the signature DESCENDS from the banked Born positivity + the self-adjoint `2 × 2` structure over the banked
    terminal algebra, NOT a posited `(1,9)`. Pure algebra over ℚ (Sylvester inertia is a ℚ-fact; NO Mathlib ℝ/ℂ as
    content; `Matrix`/`Submodule`/`finrank`/`LinearMap.ker` are MACHINERY on the DERIVED `O ℚ`). W9 MEASURE-FIRST:
    a LIGHT node (the `2 × 2` det reduction + finrank machinery all `ext`/`simp`/rank–nullity, core probe 8.4s, full
    file build 7.3s, KILL=60s never approached). Costume C74 (`SpacetimeSignatureWrongSpaceSignCostume`: the WRONG
    claim that the space block is POSITIVE `x² + gForm v v` — the Euclidean `(10,0)` misreading with no distinguished
    time — refuted by the banked `Qform_space` `= −(x² + gForm v v)`, a sign type mismatch) bites with signature
    `Qform 0 x v = x . 2 . gForm v v`. Physics-words-removable: delete "spacetime/Lorentzian/Minkowski/time/space/
    signature" → the real determinant of a self-adjoint `2 × 2` matrix over the Cayley–Dickson double of a double of
    a double of ℚ is the quadratic form `t² − x² − gForm v v`, positive on a 1-dim subspace and negative-definite on
    a complementary 9-dim subspace, so its Sylvester inertia is `(1, 9)`.

  - **★ (N44 LANDED) THE CHIRALITY BLOCK — the third termination of the one-cause claim.** Of the two
    §N44 candidate fronts, front (ii) — the chirality block — was chosen (W4.5/W1): it is forced,
    tractable, and the genuine-novelty one-cause connection, while front (i) the Lorentz isometry group
    carries a real W9 coordinate-blow-up risk (a 2×2 octonion-matrix determinant over the NON-associative
    `O ℚ`). BANKED (`Phys/Algebra/ChiralityBlock.lean`, 6 decls foundations-only): the LEFT and RIGHT
    regular representations `LeftMul a : x ↦ a·x` / `RightMul b : x ↦ x·b` as ℚ-linear maps; the ONE-CAUSE
    BICONDITIONAL `chirality_commute_iff_assoc` (the two families commute for all `a,b` IFF the algebra
    associates — the commutator IS the associator's middle slot, the trunk identity carries it, NO
    coordinate bash); the HEADLINE `chirality_block` (they do NOT all commute, by the banked cascade-stop
    `not_associative`); the ONE-CAUSE LINK `chirality_block_iff_jordan_cap` (a PROVED `Iff`: the chirality
    block ⟺ the order-4 Hermitian-Jordan generation-cap failure — one octonionic non-associativity, three
    terminations: cascade-stop, generation-cap, chirality-block); and the concrete `chirality_block_witness`
    (the cascade's own non-associating triple realizes a non-commuting pair). Costume C75 bites the
    associative misreading. Words-removable: delete "chirality/handedness" → the left- and
    right-multiplication operator families on the CD double³ of ℚ do not all commute, equivalently that
    algebra is non-associative, equivalently the order-4 Hermitian matrix Jordan defect is nonzero.

  - **★ (N45 LANDED) THE ISOMETRY STRUCTURE OF THE `(1,9)` FORM — the OTHER §N44 front, banked.**
    With the spacetime signature `(1,9)` banked (N43), the colour branching `7 = 3 ⊕ 3̄ ⊕ 1` + `su(3) ⊂ g₂`
    banked (N42), AND the chirality block + the one-cause link banked (N44), the terminal-algebra
    structure-theory has the internal (colour) structure, the external (Lorentzian) form, the third
    termination, and now the EXTERNAL ISOMETRY structure of that form. BANKED (`Phys/Algebra/LorentzIsometry.lean`,
    13 decls foundations-only): the isometry predicate `IsQvIsom T := ∀ p, Qv (T p) = Qv p` for the banked
    Born determinant form `Qv = t² − x² − gForm v v` on `STV = ℚ × ℚ × O ℚ` (N43), with id/composition
    closure; ★ `qvIsomMonoid` THE STRUCTURE (the preservers as a `Submonoid (Module.End ℚ STV)`); ★★ the
    NON-COMPACT BOOST `boost a b : (t,x,v) ↦ (a t + b x, b t + a x, v)` proved a `Qv`-isometry under
    `a² − b² = 1` (`boost_isom`, PURE ℚ RING ARITHMETIC `linear_combination (t²−x²)·h` — the indefinite SIGN
    of the banked form, the source of the `(1,9)` signature, is exactly what a HYPERBOLIC shear, not a circular
    rotation, preserves), with NON-TRIVIALITY (`boost_ne_id`/`boost_mixes_time_space`: a `b ≠ 0` boost sends
    the pure-time vector `(1,0,0) ↦ (a,b,0)`, a genuine time–space mix, so the structure is STRICTLY larger
    than `{id}` and honestly Lorentzian); ★ the BORN COMPOSITION LAW `gForm_comp`
    (`gForm (u·v)(u·v) = gForm u u · gForm v v`, from the banked `Nrm_mul_on_O`) carrying the SPACE ROTATION
    `rot u : (t,x,v) ↦ (t,x,u·v)` proved a `Qv`-isometry under the Born-unit condition `gForm u u = 1`
    (`rot_isom`). ★ THE W1 REFRAME (THE ONE LAW): the natural-looking `SL(2,𝕆)`-style matrix route `M ↦ A M A†`
    with `det(A M A†) = |det A|² det M` was the FLAGGED W9 risk — over the non-associative `O ℚ` the
    matrix-product determinant multiplicativity `det(AB) = det A · det B` FAMOUSLY FAILS for general matrices,
    and a genuine boost matrix needs IRRATIONAL entries (the derived ℝ) — so the W9-flagged difficulty was
    DISSOLVED by attacking the isometry STRUCTURE of `Qv` directly (no matrix determinant: the preservers are a
    submonoid, the generators pure ℚ ring arithmetic + the banked Born multiplicativity), and the heavy matrix
    connection was childed (N46). Costume C76 bites the EUCLIDEAN misreading `a² + b² = 1` (a circular rotation
    of `(t,x)`, which preserves `t² + x²` not the Lorentzian `t² − x²`). Words-removable: delete
    "Lorentz/boost/rotation/isometry/time/space" → the ℚ-linear self-maps of `ℚ × ℚ × O ℚ` preserving
    `t² − x² − gForm v v` form a submonoid strictly larger than `{id}` (the `a² − b² = 1` shear preserves it by
    ring arithmetic, plus the `gForm u u = 1` left-multiplications).

  - **★ (N46 LANDED) THE SPINOR (matrix) REALIZATION of the Lorentz boost — the `M ↦ A M A†` action banked
    for the concrete diagonal generator, the heavy det-multiplicativity W1-reframed.** N45 banked the isometry
    STRUCTURE abstractly (the submonoid + boost/rotation generators) WITHOUT a matrix determinant. N46 banks the
    MATRIX ACTION itself on the banked `herm2` self-adjoint `2 × 2` carrier (`Phys/Algebra/SpinorCover.lean`, 12
    decls foundations-only). ★ THE W1 REFRAME (THE ONE LAW) that DISSOLVED the flagged W9 hard core: the natural
    worry was the GENERAL determinant multiplicativity `det(AB) = det A · det B` (FAMOUSLY FALSE over the
    non-associative `O ℚ`) plus a boost matrix needing IRRATIONAL entries (the derived ℝ). BOTH difficulties
    dissolve for the CONCRETE generator the boost forces — the diagonal RATIONAL matrix
    `boostMat p = diag(p•1, p⁻¹•1)` (`p ∈ ℚ`, `p ≠ 0`, real determinant `p·p⁻¹ = 1`). Its conjugation
    `actBy A M = (A·M)·Aᴴ` acts on `herm2 t x v` in LIGHTCONE COORDINATES: ★★ `act_herm2` — the off-diagonal
    octonion `v` is EXACTLY preserved (it picks up `p·p⁻¹ = 1`, flanked by real scalars so the non-associativity
    of `O ℚ` is NEVER triggered), the two real diagonals scale by `p²`, `p⁻²`; ★ `act_isHermitian` — the action
    PRESERVES Hermiticity (the result is again a `herm2`); ★★★ `mdet_act`/`mdet_act_eq_herm2_det` — THE HEADLINE,
    DETERMINANT PRESERVATION: the generalized real-part determinant `mdet M = reQ(M₀₀M₁₁ − M₀₁M₁₀)` (the honest
    scalar invariant, since Mathlib `Matrix.det` is commutative-ring only) of the action equals `Qform t x v =
    herm2_det t x v` (the `p²·p⁻² = 1` det-one cancellation, `scaled_Qform`). The matrix (spinor) realization of
    the boost is a genuine determinant-preserving conjugation — DERIVED, over the cascade ground ring ℚ, by the
    W1-reframe concrete-rational route, NOT the false general `det(AB) = det A·det B`, NOT an irrational matrix,
    NO posited Lorentz group. ★ NON-TRIVIALITY (W8): `boostMat_ne_one`/`act_scales_lightcone` (for `p ≠ 1` the
    generator is not the identity and genuinely rescales the lightcone). Costume C77 bites the WRONG `p²`-scaling
    determinant claim. THE MOAT: the `SL(2,𝕆) ↠ SO⁺(1,9)` spinor cover is standard (Sudbery, Manogue–Dray,
    Baez); the novelty is the matrix action + det-preservation DESCEND from the banked `herm2`/`herm2_det_eq`
    carrier. Words-removable: delete "Lorentz/boost/spinor/SL(2,𝕆)/isometry/cover/lightcone" → the conjugation by
    `diag(p•1, p⁻¹•1)` over the CD-double³ of ℚ maps `herm2 t x v` to `herm2 t' x' v` (rescaled lightcone coords,
    `v` preserved), preserves self-adjointness, and preserves the real-part determinant `t² − x² − gForm v v`.

  - **★ (N47 LANDED) THE SPACE-ROTATION (matrix) GENERATOR — the OTHER half of `SL(2,𝕆) ↠ SO⁺(1,9)`
    beyond the N46 boost, banked.** N46 banked the MATRIX realization of the BOOST (the non-compact,
    time-mixing generator) by the concrete diagonal rational route. N47 banks the OTHER half: the
    SPACE-ROTATION matrix generator (`Phys/Algebra/SpinorRotation.lean`, 11 decls foundations-only).
    ★ THE W1 REFRAME (THE ONE LAW) that DISSOLVED the flagged W9 risk: the ROADMAP flagged the genuine
    coordinate-blow-up the N46 diagonal boost sidestepped — an octonion-valued generator `A` makes
    `(A·M)·Aᴴ` trigger GENUINE non-associativity of `O ℚ`. The reframe: realize the rotation by the
    SINGLE-OCTONION-CORNER generator `rotMat u = !![u, 0; 0, 1]` (Born-unit `u`, `u·star u = 1`). Then
    every entry of the triple matrix product is a SUM of at most BINARY octonion products as the matrix
    multiplication writes them — NO `(a·b)·c ≠ a·(b·c)` triple-product ambiguity ever arises. ★★
    `act_herm2_rot` — THE FORCED SHAPE: the conjugation maps `herm2 t x v ↦ herm2 t x (u·v)`, the
    off-diagonal octonion `v` ROTATED to `u·v`, the two real diagonals untouched (the `(0,0)` diagonal
    picks up `u·star u = 1`). ★ `act_isHermitian_rot` — preserves Hermiticity (result again a `herm2`).
    ★★★ `mdet_act_rot`/`mdet_act_rot_eq_herm2_det` — THE HEADLINE, DETERMINANT PRESERVATION: the
    generalized real-part determinant `mdet (actBy (rotMat u) (herm2 t x v)) = Qform t x v =
    herm2_det t x v`, the det-preservation DISSOLVING through the banked Born composition law
    `gForm_comp` (`gForm (u·v)(u·v) = gForm u u · gForm v v = gForm v v` since `gForm u u = 1`), EXACTLY
    as N45's abstract `rot_isom` — NOT a non-associative matrix determinant expansion. ★
    `mdet_act_boost_rot` — THE COMBINED BOOST + ROTATION: conjugating by the rotation then the N46 boost
    preserves the Born form (both generator families of the cover, composed, are determinant-preserving).
    ★ NON-TRIVIALITY (W8): `gForm_u1` (the banked imaginary unit `u1` is a concrete Born-unit) +
    `rotMat_u1_ne_one`/`act_rotates_space` (`rotMat u1 ≠ 1`, `herm2 t x 1 ↦ herm2 t x u1` — a genuine
    rotation of the nine space directions). W9 MEASURE-FIRST: a LIGHT node — the flagged octonion
    conjugation never blew up; the W1 reframe was confirmed by DIRECT measurement (the isolated probe
    elaborated clean, ~0.1s proof) BEFORE production. THE MOAT: the rotation subgroup of the cover is
    standard (Sudbery, Manogue–Dray, Baez); the novelty is the matrix action + det-preservation DESCEND
    from the banked `herm2`/`herm2_det_eq` carrier + the banked Born composition `gForm_comp`. Costume
    C78 bites the WRONG claim that the rotation preserves the determinant for an ARBITRARY `u` (dropping
    `gForm u u = 1`). Words-removable: delete "Lorentz/boost/spinor/rotation/SL(2,𝕆)/isometry/cover" →
    conjugation by `!![u, 0; 0, 1]` (`u·star u = 1`) over the CD-double³ of ℚ maps `herm2 t x v` to
    `herm2 t x (u·v)`, preserves self-adjointness, and preserves the real-part determinant
    `t² − x² − gForm v v`.

  - **★ (N48 LANDED) THE SPINOR-COVER GROUP STRUCTURE — the matrix conjugations of N46/N47 ARE the
    abstract N45 isometry generators (the EQUIVARIANT INTERTWINING), and the SUBMONOID they GENERATE sits
    inside the Born-form isometry monoid, the W1/W3-decomposed LIGHT part of the surjectivity node,
    banked.** N46/N47 banked the matrix (spinor) conjugations `actBy (boostMat p)` / `actBy (rotMat u)`,
    each determinant-preserving. N45 banked the abstract isometry monoid `qvIsomMonoid ⊆ Module.End ℚ STV`
    with `boost a b` / `rot u` generators. N48 connects the two pictures and banks the cover-group object
    (`Phys/Algebra/SpinorCoverGroup.lean`, 14 decls foundations-only). ★★ `actBy_rotMat_Hmap` /
    `actBy_boostMat_Hmap` — THE EQUIVARIANT INTERTWINING `actBy A (Hmap q) = Hmap (T q)`: the matrix
    conjugation by `rotMat u` / `boostMat p`, read through the coordinatization `Hmap (t,x,v) = herm2 t x v`,
    IS the abstract `rot u` / `boost a b` (`(a,b) = boostParam p`, with `boostParam_hyperbola` putting the
    matrix-boost parameters on the unit hyperbola `a²−b²=1`). ★ `spinorCoverMonoid := Submonoid.closure
    coverGens` — THE COVER GROUP. ★★ THE W1/W9 STRUCTURAL REFRAME (THE ONE LAW): the cover group is exactly
    where the W9 octonionic-matrix non-associativity would bite — a GROUP of `2×2` matrices over the
    non-associative `O ℚ` does NOT exist (octonionic matrix multiplication is itself non-associative, so
    `Matrix (Fin 2) (Fin 2) (O ℚ)` is NOT a monoid; `Submonoid.closure` of matrix generators is ill-typed).
    The reframe: the cover lives on the ASSOCIATIVE side `Module.End ℚ STV` (endomorphism composition IS
    associative function composition), and the matrix conjugations enter ONLY through the equivariance
    intertwining — each a SINGLE banked `act_herm2` / `act_herm2_rot`, no triple octonion product — so the
    non-associativity is NEVER triggered. ★★★ `spinorCoverMonoid_le_qvIsom` — THE HEADLINE: the whole
    generated cover ≤ `qvIsomMonoid`; every finite product of boosts and rotations preserves the Born form,
    by `Submonoid.closure_le`. ★ `spinorCoverMonoid_ne_bot` (NON-TRIVIALITY, W8: the cover contains the
    concrete boost `(5/4, 3/4) ≠ id`, so `≠ ⊥`). Costume C79 bites the WRONG claim that an arbitrary boost
    (off the unit hyperbola `a²−b²=1`) lies in the cover. Words-removable: delete "Lorentz/boost/spinor/
    rotation/SL(2,𝕆)/SO⁺(1,9)/isometry/cover" → conjugation by `boostMat p`/`rotMat u` intertwines, through
    `(t,x,v) ↦ herm2 t x v`, with the ℚ-linear maps `boost a b`/`rot u`, and the submonoid of `Module.End ℚ STV`
    they generate is contained in the submonoid preserving `t²−x²−gForm v v` and is strictly larger than `{1}`.

  - **N49 LANDED — THE CONTINUUM RE-GROUNDING of the isometry structure over the DERIVED ℝ `Cut`, and the
    HEADLINE that the continuum STRICTLY EXTENDS the rational cover (N48).** `Phys/Algebra/LorentzContinuum.lean`
    (18 decls, foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against
    the built olean + `Audits/AxiomAudit.lean`). The N49 target (full surjectivity onto the continuous
    `SO⁺(1,9)`) demanded the continuum FIRST: over the DERIVED ℚ the cover `spinorCoverMonoid` (N48) is a
    discrete/rational object, but a generic boost has IRRATIONAL rapidity — so the surjectivity statement is
    not even formulable until the carrier + form + boost are re-grounded over the DERIVED ℝ. This node banks
    exactly that re-grounding and proves the precise content "the rational generators do NOT surject onto the
    continuous component — reaching it requires the derived ℝ." ★ `instStarRingCut` (`StarRing Cut :=
    starRingOfComm`, the trivial `*` feeding Cayley–Dickson) → the SAME generic terminal algebra `O Cut :=
    CD (H Cut)` the cascade uses, now coefficiented by the DERIVED continuum. ★ `reQC`/`gFormC`/`QformC`/`QvC`
    (the continuum Born self-overlap form `t²−x²−gFormC v v` over `Cut`). ★★ `boostC_isom` — THE W1 REFRAME
    (THE ONE LAW): the cosh/sinh RAPIDITY is a standard-physics habit needing transcendental functions NOT
    banked over the derived ℝ; the theory-native object is the ALGEBRAIC unit-hyperbola point `a²−b²=1`, and
    the boost-isometry proof is PURE FIELD ARITHMETIC (`linear_combination (t²−x²)·h`), valid over ANY field,
    in particular the derived complete ordered field `Cut` — the transcendental rapidity DISSOLVES into the
    algebraic hyperbola point, no analysis. ★ `qvIsomMonoidC` (the continuum isometry structure as a submonoid
    of `Function.End STVC`, on the associative function-composition side). ★ `sqrt2_sq`/`irr_hyperbola`/
    `irrBoost_isom` — the IRRATIONAL hyperbola point `(3√2/4, √2/4)` (built from the DERIVED √2) is a genuine
    continuum isometry. ★★★ `continuum_strictly_extends_rational` — THE HEADLINE: that irrational boost is NOT
    equal to ANY boost with derived-rational parameters `Qcut a`, `Qcut b` (its space component `√2/4 ∉ image
    Qcut`, `sqrt2_quarter_not_rational` from banked `sqrt2_not_rational`), so the rational cover is NOT the
    whole continuous component; the continuum is necessary. ★ `irrBoost_ne_id` (W8 teeth: the irrational boost
    genuinely mixes time and space, `√2/4 ≠ 0` via `zero_lt_sqrt2`). Costume C80
    (`LorentzContinuumRationalReachCostume`) bites the WRONG surjectivity claim that the rational boosts reach
    the irrational continuum boost (the `rfl` witness fails to typecheck). Words-removable: delete "Lorentz/
    boost/spinor/rotation/SO⁺(1,9)/isometry/cover/surjectivity/rapidity" → the `Cut`-shears preserving
    `t²−x²−gFormC v v` and the irrational-vs-rational-parameter distinction, pure math over the derived
    continuum. W3 DECOMPOSE: the full surjectivity onto the continuous 45-dim `SO⁺(1,9)` + the continuum
    rotation generator is childed N50.

  - **N50(a) LANDED (W6 verify-then-finalize) — THE CONTINUUM ROTATION GENERATOR over the derived ℝ `Cut`,
    `boostC_isom`'s SIBLING.** `Phys/Algebra/LorentzContinuumRotation.lean` (9 decls, foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against the built olean +
    `Audits/AxiomAudit.lean`). N49 banked the continuum carrier, Born form, hyperbolic BOOST isometry, and the
    isometry monoid `qvIsomMonoidC` over the derived ℝ `Cut`. This node banks the COMPACT (space-rotating)
    sibling: the Born-unit space rotation `(t,x,v) ↦ (t,x,u·v)` re-grounded over `O Cut`, proved to preserve
    the continuum Born form `QvC` under `gFormC u u = 1`. ★★ THE W1 REFRAME (THE ONE LAW): the abstract `rot u`
    (N45) preserves the form by the Born composition law `gForm (u·v)(u·v) = gForm u u · gForm v v`, but the N45
    proof of `gForm_comp` routes through ℚ-PINNED scalar lemmas (`cd_qsmul_re`, `Dbl.smul_re`, `qsmul_mul_right`,
    `selfMul_eq_smul` via `selfconj_eq_smul`/`trace_id`), NONE of which transfers to the derived `Cut`. The
    theory-native route: send the COMPOSITION LAW through the GENERIC Cayley–Dickson facts that hold over ANY
    base — `gFormC z z = (CD.Nrm z).re.re` (definitional), the generic doubled-base multiplicativity
    `CD.Nrm_mul_of_doubled_base` (`O Cut = CD (CD (Dbl Cut))`, base `H Cut` associative), the self-conjugacy of
    the Born self-overlap `nrm_selfconj`, and the real factorization of self-conjugate products
    `reH_mul_selfconj` (the derived `Cut` is 2-torsion-free, `cut_add_self_zero`) — NO ℚ-pinning, NO analysis,
    NO new posit. ★★ `gFormC_comp` (the `Cut`-pinned Born composition law). ★★ `rotC_isom` (the continuum
    rotation is a `QvC`-isometry when `gFormC u u = 1`, one `rw [gFormC_comp, hu, one_mul]`). ★ `rotC_mem` (the
    Born-unit rotation lies in `qvIsomMonoidC`). ★ `gFormC_one`/`rotC_one_mem` (W8 non-vacuity: `1 : O Cut` is a
    concrete Born-unit, the `u=1` rotation is a genuine member). Costume C81
    (`LorentzContinuumRotationBornUnitCostume`) bites the WRONG claim that `rotFunC u` preserves `QvC` WITHOUT
    the Born-unit hypothesis (at `u=0` the rotation collapses the space block, reducing the unhypothesized claim
    to the false numeric `0 = -1`). Words-removable: delete "Lorentz/boost/spinor/rotation/SO⁺(1,9)/isometry/
    cover/surjectivity" → over the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`,
    the map `(t,x,v) ↦ (t,x,u·v)` with `gFormC u u = 1` preserves `t²−x²−gFormC v v` via `gFormC (x·y)(x·y) =
    gFormC x x · gFormC y y`, pure math. With the boost (N49) and the rotation (this node), BOTH one-parameter
    generator families of the connected isometry component are now banked over the derived ℝ. W3 DECOMPOSE: the
    full surjectivity onto the connected component is childed N51.

  - **N51 LANDED (W6 verify-then-finalize) — THE INFINITESIMAL ISOMETRY LIE ALGEBRA over the derived ℝ `Cut`,
    the W1/W3-decomposed bankable piece of the full-surjectivity node.** `Phys/Algebra/LorentzContinuumLieAlgebra.lean`
    (namespace `Phys.Algebra`, 19 audited decls foundations-only `[propext, Classical.choice, Quot.sound]`,
    independently axiom-audited against the built olean + Audits/AxiomAudit.lean). THE W1 REFRAME (THE ONE LAW):
    the FULL surjectivity (every connected continuum isometry a finite product of the boost+rotation one-parameter
    subgroups) is a deep GLOBAL Lie-group theorem (exp-integration of the tangent algebra + Cartan/polar KAK +
    connectedness/topology over the derived ℝ); NONE of that machinery is banked — the banked `expO` stack (N41) is
    a per-point vector exponential of derivations of `O Cut`, NOT a flow on the 11-dim coordinate space `STVC`.
    Returning to the trunk: the claim "the connected component is generated by the one-parameter subgroups" has an
    immediately-bankable TANGENT/infinitesimal SHADOW — "the boost+rotation infinitesimal generators lie in, and
    close under the Lie bracket within, the infinitesimal-isometry (form-skew) algebra" — provable NOW from the
    banked continuum form + the banked Born composition law `gFormC_comp`, with NO global integration and NO posited
    group. The engine is a THEORY-NATIVE polarization: the skew identity `gFormC (a·v) w + gFormC v (a·w) = 2·gFormC
    a 1·gFormC v w` (`gFormC_skew`) is `gFormC_comp` POLARIZED twice (`gFormC_leftcomp` → `gFormC_mixed` → `b=1`),
    NO adjoint3 (wrong CD-depth), NO coordinate brute. BANKED: ★ `BvC` (the symmetric bilinear polarization of
    `QvC`, `BvC_self`/`BvC_symm`/biadditivity); ★ `IsInfIsomC` (the form-skew predicate, the tangent condition
    `d/ds QvC(e^{sT}p)|₀ = 0`); ★★ `infIsom_bracket` (BRACKET-CLOSURE, generic from biadditivity + skewness, the
    four skew-moves cancel in pairs, NO coordinate brute); ★ `infIsomLieAlg` (the tangent algebra as a
    `LieSubalgebra Cut (Module.End Cut STVC)`); ★★ `boostGenC_inf` (the infinitesimal boost `(t,x,v)↦(x,t,0)` is
    form-skew, field arithmetic) + `rotGenC_inf` (the infinitesimal rotation `(t,x,v)↦(0,0,a·v)` is form-skew when
    `a` is imaginary `gFormC a 1 = 0`, via `gFormC_skew`); ★★★ `boost_rot_bracket_mem` (THE HEADLINE: the boost +
    rotation infinitesimal generators close under the bracket — the Lie-algebra-of-the-connected-component
    structure, the tangent shadow of "generated by the one-parameter subgroups"); ★ `boostGenC_ne_zero`/
    `infIsomLieAlg_ne_bot` (W8 non-vacuity: the tangent algebra is not the trivial `{0}` algebra). Costume C82
    (`LorentzContinuumLieAlgImaginaryCostume`) bites the WRONG claim that `rotGenC a` is form-skew WITHOUT the
    imaginary hypothesis (at `a=1`, `gFormC 1 1 = 1 ≠ 0`, the skew condition at `p=q=(0,0,1)` reduces to the false
    numeric `−2 = 0`). Words-removable: delete "Lorentz/boost/rotation/isometry/SO⁺(1,9)/generator/Lie/tangent" →
    over the derived complete ordered field `Cut` and the CD-double³ `O Cut`, the `Cut`-linear self-maps `T` of
    `Cut×Cut×O Cut` with `∀ p q, B(T p)q + B p(T q) = 0` form a bracket-closed `Cut`-submodule of `Module.End Cut
    (Cut×Cut×O Cut)` containing `(t,x,v)↦(x,t,0)` and `(t,x,v)↦(0,0,a·v)` for `reQC a = 0`, pure math. W3 DECOMPOSE:
    the GLOBAL exp-integration / Cartan-polar / finite-product surjectivity is childed N52.

  - **N52 LANDED — THE GLOBAL EXP-INTEGRATION of the infinitesimal boost generator (N51) to the BOOST
    ONE-PARAMETER SUBGROUP over the derived ℝ `Cut`.** `Phys/Algebra/LorentzContinuumExpIntegration.lean`
    (namespace `Phys.Algebra`, 15 decls foundations-only `[propext, Classical.choice, Quot.sound]`,
    independently axiom-audited against the built olean + Audits/AxiomAudit.lean; gate D0–D6 GREEN, 82/82
    costumes incl C83, 889 audited theorems foundations-only). THE W1 REFRAME (THE ONE LAW) — the cosh/sinh
    exp is the rapidity habit AGAIN: the classical boost one-parameter subgroup `exp(s·boostGenC) =
    boostFunC (cosh s)(sinh s)` needs the transcendental `cosh`/`sinh` NOT banked over the derived ℝ
    (importing them = forbidden Mathlib-ℝ content; and N49 already dissolved the rapidity into the algebraic
    hyperbola point). Returning to the trunk: the infinitesimal boost generator satisfies `boostGenC (boostGenC
    p) = (t,x,0)` (the time–space block projection), so `boostGenC³ = boostGenC` and its exponential CLOSES
    into a FINITE POLYNOMIAL in the generator, parametrized by the algebraic hyperbola point `(a,b)` (`a²−b²=1`)
    not the rapidity. The ticket's framing — "build the endomorphism exponential `exp(sT)` on `Module.End Cut
    STVC` as an operator-norm `tsum` over `Cut`" — DISSOLVED: for the boost there is no infinite series to sum;
    the exponential is the finite hyperbola-parametrized polynomial. BANKED: ★★ `boostFunC_comp` (THE
    COMPOSITION LAW = the theory-native one-parameter-subgroup law `exp((s+t)T)=exp(sT)·exp(tT)`, via the
    abelian HYPERBOLA GROUP product `(a,b)·(a',b')=(aa'+bb',ab'+ba')`); ★ `boostParam_hyp_mul` (the hyperbola
    closure `(aa'+bb')²−(ab'+ba')²=(a²−b²)(a'²−b'²)`, so the group product of two unit-hyperbola points is a
    unit-hyperbola point); `boostFunC_one`/`boostFunC_inv` (group unit `(1,0)` + inverse `(a,−b)`); ★
    `boostGenC_sq_apply` (`boostGenC² = time–space block projection`); ★★ `boostFunC_eq_gen_poly` (THE EXP-POLY
    `boostFunC a b p = p + b•boostGenC p + (a−1)•boostGenC(boostGenC p)`, the global boost as the finite
    polynomial in the N51 generator); ★ `boostOPS` (the boost one-parameter subgroup as a `Submonoid
    (Function.End STVC)`) + ★ `boostOPS_le_isom` (THE EXP-INTEGRATION: `boostOPS ≤ qvIsomMonoidC`, the
    integrated form-skew tangent is a global `QvC`-isometry); `boostOPS_ne_bot` (W8 non-vacuity via the
    irrational boost N49); the exponential object `boostExp`/`boostExp_eq_boostFunC`/`boostExp_isom`/
    `boostExp_one`/★★ `boostExp_comp` (the `exp(sT)` object + its homomorphism property from the hyperbola
    group). Costume C83 (`LorentzContinuumExpWrongCoeffCostume`) bites the WRONG exp-polynomial coefficient (`a`
    instead of `a−1` on the generator-squared projection term — a wrong integration of the generator; at
    `a=2,b=0,p=(1,0,0)` correct first coord `2`, wrong exp-poly `3`, reduces to the false numeric `2 = 3`).
    Words-removable: delete "Lorentz/boost/exp/one-parameter/subgroup/generator/isometry/SO⁺(1,9)/rapidity" →
    over the derived complete ordered field `Cut` and the CD-double³ `O Cut`, the `Cut`-maps `(t,x,v)↦(a t+b
    x, b t+a x, v)` with `a²−b²=1` form a submonoid of `Function.End (Cut×Cut×O Cut)` under composition (law
    `(a,b)(a',b')=(aa'+bb',ab'+ba')`, unit `(1,0)`, inverse `(a,−b)`), contained in the submonoid preserving
    `t²−x²−gFormC v v`, and each equals the finite polynomial `id + b•G + (a−1)•G²` in `G:(t,x,v)↦(x,t,0)`,
    pure math. W3 DECOMPOSE: the HEAVY KAK finite-product surjectivity + the rotation one-parameter subgroup is
    childed N53.

  - **N53 LANDED — THE ROTATION ONE-PARAMETER SUBGROUP over the derived ℝ `Cut` (the COMPACT MIRROR of the N52
    boost one-parameter subgroup).** `Phys/Algebra/LorentzContinuumRotationSubgroup.lean` (namespace
    `Phys.Algebra`, 17 decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently
    axiom-audited against the built olean + Audits/AxiomAudit.lean; gate D0–D6 GREEN, 83/83 costumes incl C84,
    foundations-only). THE W1 REFRAME (THE ONE LAW) — the naive global rotation composition `rotFunC u ∘
    rotFunC u' = rotFunC (u·u')` (N50) FAILS for GENERIC octonionic `u,u'` by NON-ASSOCIATIVITY (`u·(u'·v) ≠
    (u·u')·v`, banked `not_associative`). The dissolution: the genuine one-parameter SUBGROUP iterates a SINGLE
    fixed imaginary unit `a`, and its iterates live inside the ASSOCIATIVE subalgebra the ALTERNATIVE law
    governs — the banked left-alternative operator-square law `L_sq_imag`/`scaling_law` (N3 `Operator.lean`)
    gives `a·(a·v) = −(ι(Nrm a)·v)`, and at a unit (`Nrm a=1`) this is the clean relation `a·(a·v) = −v`, the
    compact analogue of N52's `boostGenC² = block projection`. The rotation generator `rotCircFun a c s :
    (t,x,v) ↦ (t,x, c•v + s•(a·v))` is parametrized by the algebraic CIRCLE point `(c,s)` (`c²+s²=1`) rather
    than the transcendental angle `(cos θ, sin θ)` — dissolving the rotation angle exactly as N52 dissolved the
    rapidity (NO transcendental cos/sin, NO Mathlib ℝ). The one-parameter subgroup it sweeps is the abelian
    CIRCLE GROUP `{(c,s)|c²+s²=1}` under `(c,s)·(c',s') = (c c'−s s', c s'+s c')` (the `−s s'` cross term is the
    compact-signature flip of N52's hyperbola `+b b'`). BANKED: ★★ `rotCircFun_comp` (THE COMPOSITION LAW = the
    theory-native `exp((θ+φ)R)=exp(θR)·exp(φR)`, the non-associativity dissolving on the single-unit alternative
    subalgebra via `smulCompat_oCut.hr` + `a·(a·v)=−v`, closed STRUCTURALLY by `module` — NO coordinate brute);
    ★ `circParam_circle_mul` (circle closure `(cc'−ss')²+(cs'+sc')²=(c²+s²)(c'²+s'²)`); `rotCircFun_one`/
    `rotCircFun_inv` (group unit `(1,0)` + inverse `(c,−s)`); ★ `rotCircFun_eq_rotFunC` (the circle generator IS
    the banked N50 global rotation by the unit-circle element `c•1+s•a`); ★ `gFormC_circParam_self`; ★★
    `rotCircFun_isom` (the rotation is a `QvC`-isometry on the unit circle, via the banked `rotC_isom` since
    `gFormC (c•1+s•a)(c•1+s•a) = c²+s² = 1`); ★ `rotCircOPS` (the rotation one-parameter subgroup as a
    `Submonoid (Function.End STVC)` for a fixed unit-imaginary `a`) + ★ `rotCircOPS_le_isom` (THE COMPACT
    EXP-INTEGRATION: `≤ qvIsomMonoidC` for an imaginary Born-unit `a`); the concrete unit `a = e₂`
    (`e2_alt`/`e2_gFormC_self`/`e2_gFormC_one`/`rotCircOPS_e2_ne_bot`, W8 non-vacuity: the quarter-turn `(0,1)`
    is a genuine non-identity rotation). Costume C84 (`LorentzContinuumRotationWrongSignCostume`) bites the WRONG
    cross-term SIGN — the non-compact boost/hyperbola `+s s'` instead of the compact circle `−s s'` (the sign is
    EXACTLY what distinguishes the compact rotation subgroup from the non-compact boost subgroup); at
    `c=s=c'=s'=1` the wrong-sign closure gives `8 ≠ 4`, the false numeric `8 = 4`. Words-removable: delete
    "Lorentz/boost/rotation/Spin/SO⁺(1,9)/SO(9)/isometry/cover/generator/one-parameter/circle/compact/KAK/Cartan"
    → over the derived complete ordered field `Cut` and the CD-double³ `O Cut`, for a fixed `a` with `a·(a·v)=−v`
    for all `v`, the `Cut`-maps `(t,x,v)↦(t,x, c•v+s•(a·v))` form a submonoid of `Function.End (Cut×Cut×O Cut)`
    under composition (law `(c,s)(c',s')=(cc'−ss',cs'+sc')`, unit `(1,0)`, inverse `(c,−s)`), contained — when
    `c²+s²=1`, `gFormC 1 a=0`, `gFormC a a=1` — in the submonoid preserving `t²−x²−gFormC v v`, pure math. W3
    DECOMPOSE: the HEAVY KAK finite-product surjectivity + the non-associative `SO(9)`/`Spin(9)` completion is
    childed N54.

  - **N54 LANDED — THE GENERATED ISOMETRY SUBMONOID + the FORWARD half of the finite-product surjectivity
    (Cartan/polar KAK), over the derived ℝ `Cut`.** `Phys/Algebra/LorentzContinuumGeneratedGroup.lean`
    (namespace `Phys.Algebra`, 12 decls foundations-only `[propext, Classical.choice, Quot.sound]`,
    independently axiom-audited against the built olean + Audits/AxiomAudit.lean; gate D0–D6 GREEN, costume C85,
    foundations-only). N49–N53 banked BOTH one-parameter generator families over the derived ℝ: the BOOST
    one-parameter subgroup `boostOPS ≤ qvIsomMonoidC` (N52) and the ROTATION one-parameter subgroup
    `rotCircOPS ≤ qvIsomMonoidC` (N53, around a fixed imaginary unit). THE W1+W3 DECOMPOSE: the full KAK
    finite-product surjectivity has TWO halves — the FORWARD soundness ("every finite product of generators
    IS an isometry") and the REVERSE surjectivity ("every isometry IS such a finite product"). The FORWARD
    half is immediately bankable and DISSOLVES STRUCTURALLY: both generating families already lie in
    `qvIsomMonoidC` (the banked exp-integration inclusions `boostOPS_le_isom` N52 + `rotCircFun_mem` N53), so
    the submonoid `genIsomMonoidC := Submonoid.closure (boostOPS ∪ rotGenSetC)` they generate does too, by
    `Submonoid.closure_le` — NO coordinate grind, NO analysis, NO topology, NO posited group (the rotation
    generator set `rotGenSetC` collects ALL single-unit rotations around imaginary Born-units, the full compact
    generating family). BANKED: ★ `rotGenSetC` (the rotation generator set); ★ `genIsomMonoidC` (the generated
    submonoid); `boostOPS_le_gen`/`rotGenSetC_subset_gen`/`rotGenSetC_le_isom` (the two families embed + are
    isometries); ★★ `genIsomMonoidC_le_isom` (THE FORWARD SOUNDNESS, `genIsomMonoidC ≤ qvIsomMonoidC`, the
    "every word is an isometry" half of `g = k·exp(p)`); ★ `boostOPS_lt_gen` (THE STRICT EXTENSION, W8: the
    generated group genuinely exceeds the boost subgroup — the quarter-turn around `e₂` is a non-boost member,
    `quarterTurn_e2_not_boost` via `e₂≠1`) + `irrBoost_not_rotGen` (the irrational boost is not a rotation
    around any imaginary unit, via `√2/4≠0`, `zero_lt_sqrt2`) — a GENUINE two-block group, not a relabelling of
    one one-parameter subgroup. Costume C85 (`LorentzContinuumBoostBlockWrongInvariantCostume`) bites the WRONG
    boost-block invariant — applying the COMPACT circle/rotation invariant `a²+b²` to the NON-COMPACT boost
    (time–space) block where the correct HYPERBOLA invariant is `a²−b²` (the boost-block form-change factor is
    `(a t+b x)²−(b t+a x)² = (a²−b²)(t²−x²)`); at `a=b=1,t=1,x=0` the wrong `(a²+b²)(t²−x²)` reduces to the
    false numeric `0 = 2` (distinct from C84's space-block circle-sign `8=4`). Words-removable: delete
    "Lorentz/boost/rotation/Spin/SO⁺(1,9)/SO(9)/isometry/generator/one-parameter/KAK/Cartan/finite-product/
    surjectivity" → over the derived complete ordered field `Cut` and the CD-double³ `O Cut`, the submonoid of
    `Function.End (Cut×Cut×O Cut)` generated by `{(t,x,v)↦(a t+b x, b t+a x, v) | a²−b²=1} ∪ {(t,x,v)↦(t,x,
    c•v+s•(a·v)) | a·(a·v)=−v, gFormC 1 a=0, gFormC a a=1, c²+s²=1}` is contained in the submonoid preserving
    `t²−x²−gFormC v v`, and strictly contains members of each generating family not in the other, pure math.
    W3 DECOMPOSE: the REVERSE finite-product surjectivity + the non-associative `SO(9)`/`Spin(9)` Moufang
    completion is childed N55.

  - **N55 LANDED — THE TWO-SIDED MOUFANG / `Spin(9)` ROTATION GENERATOR beyond the single-unit circle subgroups
    + the EXTENDED generated isometry submonoid (the forward step toward the full non-associative `SO(9)`), over
    the DERIVED ℝ `Cut`.** `Phys/Algebra/LorentzContinuumSpin9.lean` (namespace `Phys.Algebra`, 12 decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against the built
    olean + Audits/AxiomAudit.lean; costume C86; foundations-only). THE W1 REFRAME + W9 MEASURE-FIRST — N53/N54's
    rotation generators are each a SINGLE left-multiplication `v ↦ w·v` (a circle subgroup around one imaginary
    unit, where non-associativity DISSOLVES on the alternative subalgebra). The full spacelike `SO(9)` needs
    rotations in ARBITRARY planes, where two single-unit rotations around NON-associating units do NOT compose
    into a single left-multiplication — exactly where the `2:1` cover `Spin(9)→SO(9)` and the Moufang/
    bimultiplication enter. The immediately-bankable forward generator is the TWO-SIDED bimultiplication
    `biMulFun u u' : (t,x,v) ↦ (t,x, u·(v·u'))` (left-mult by `u` AND right-mult by `u'`), and its `QvC`-isometry
    DISSOLVES STRUCTURALLY through the banked `Cut`-pinned Born composition law `gFormC_comp` (N50) applied
    TWICE: `biMul_gFormC : gFormC (u·(v·u'))(u·(v·u')) = gFormC u u · (gFormC v v · gFormC u' u')`, so at
    Born-units `= gFormC v v` — NO coordinate grind, NO analysis, NO topology. BANKED: ★ `biMul_gFormC` (the
    three-factor Born composition via `gFormC_comp` twice); ★★ `biMulFun_isom`/`biMulFun_mem` (THE TWO-SIDED
    MOUFANG ISOMETRY, the `Spin(9)` generator beyond the single-unit circle subgroups); `biMulFun_one_right`
    (`biMulFun u 1 = rotFunC u` — it RECOVERS the single left-multiplication at `u'=1`, generalizing the N53/N54
    generators); ★ `biMulGenSetC`/`genIsomMonoidC2 := ⟨boostOPS ∪ rotGenSetC ∪ biMulGenSetC⟩` (the two-sided
    generator set + the extended generated group); ★★ `genIsomMonoidC2_le_isom` (THE EXTENDED FORWARD SOUNDNESS,
    `genIsomMonoidC2 ≤ qvIsomMonoidC` via `Submonoid.closure_le` — NO grind); `genIsomMonoidC_le_gen2` (the N54
    group embeds in the extended one, `genIsomMonoidC ≤ genIsomMonoidC2`, via `Submonoid.closure_mono`); ★
    `biMulFun_e2_e2_ne_rotFunC_e2` (W8: the genuinely two-sided `biMulFun e₂ e₂` sends space-`1` to `e₂·e₂ =
    −1 ≠ e₂`, so it is DISTINCT from the single-unit rotation `rotFunC e₂` built from the same unit — the
    two-sided construction does not collapse onto the single-unit family) + `biMulFun_e2_e2_mem_gen2`. Costume
    C86 (`LorentzContinuumMoufangDropRightCostume`) bites the
    WRONG single-sided composition (dropping the right factor `gFormC u' u'`, treating the two-sided product as a
    single multiplication): at all norms `= 3` the correct three-factor `27` vs the wrong two-factor `9` reduces
    to the false numeric `27 = 9` (distinct from C84 `8=4`, C85 `0=2`, C83 `2=3`). Words-removable: delete
    "Lorentz/boost/rotation/Spin/SO(9)/SO⁺(1,9)/isometry/cover/generator/Moufang/bimultiplication/triality" →
    over the derived complete ordered field `Cut` and the CD-double³ `O Cut`, the map `(t,x,v)↦(t,x, u·(v·u'))`
    with `gFormC u u = gFormC u' u' = 1` preserves `t²−x²−gFormC v v` (via `gFormC (x·y)(x·y) = gFormC x x ·
    gFormC y y` twice), generates with the boost+single-mult families a submonoid of `Function.End (Cut×Cut×O
    Cut)` contained in the form-preserving submonoid, recovering the single-multiplication maps at `u'=1` and
    containing a member (`u=u'=e₂`) that is no single-multiplication map, pure math. W3 DECOMPOSE: the REVERSE
    finite-product surjectivity + the full `Spin(9)→SO(9)` exhaustion is childed N56.

  - **N56 LANDED — THE BORN SELF-OVERLAP POSITIVITY + the forced (1,9) SIGNATURE SPLIT of the
    continuum Minkowski form over the DERIVED ℝ `Cut`.** `Phys/Algebra/LorentzContinuumPolar.lean`
    (namespace `Phys.Algebra`, 9 decls foundations-only `[propext, Classical.choice, Quot.sound]`,
    independently axiom-audited against the built olean + Audits/AxiomAudit.lean — 939 total audited
    theorems, +9 over N55's 930; costume C87; gate D0–D6 GREEN, 86/86 costumes). THE W1 REFRAME +
    W9 MEASURE-FIRST — N49–N55 banked the FORWARD inclusion `genIsomMonoidC2 ≤ qvIsomMonoidC` (every
    word in the generators IS an isometry); the REVERSE (every isometry IS such a finite product,
    the polar/KAK `g=k·exp(p)`) must be attacked FROM Born positivity (a form-isometry's "boost
    part" is the positive-definite factor of its polar decomposition). But across the ENTIRE chain
    NO positivity fact about the Born self-overlap existed — yet "Born = self-overlap = positivity"
    is a TRUNK PRIMITIVE. This node banks that missing prerequisite. THE REFRAME: positivity over
    the ordered derived ℝ `Cut` (banked `LinearOrder`+`Field`+`IsStrictOrderedRing`, N11–N13) is
    literally the SUM OF SQUARES — `gFormC v v = reQC (v·star v)` over the Cayley–Dickson double³
    `O Cut = CD(CD(Dbl Cut))` expands, through the GENERIC `CD`/`Dbl` product+conjugation, to the
    SUM OF THE EIGHT COORDINATE SQUARES (`gFormC_sumOfSquares`), manifestly `≥ 0` (`gFormC_nonneg`,
    via `positivity` — the trunk positivity as a theorem of the ordered continuum) and `= 0` iff
    `v = 0` (`gFormC_eq_zero_iff`, positive-DEFINITENESS — the non-degeneracy the polar positive
    part needs). This FORCES the (1,9) SIGNATURE SPLIT of `QvC = t²−x²−gFormC v v`: time positive
    (`QvC_time_pos`, the `+1`), the nine-dim space block nonpositive (`QvC_space_nonpos`) and
    NEGATIVE-DEFINITE off the origin (`QvC_space_neg_of_ne`, the `−9`), non-vacuously on `e₂`
    (`QvC_space_e2_neg : QvC (0,0,e₂) = −1 < 0`). All `positivity`/`nlinarith`/`ring` — NO analysis,
    NO topology, NO posited inner product; the reverse-direction positivity DISSOLVES into
    ordered-field arithmetic (probe + production compiled clean ~7s, KILL=60s never approached).
    Costume C87 (`LorentzContinuumBornIndefiniteSignCostume`) bites the WRONG INDEFINITE-form
    misreading — `gFormC v v` as a DIFFERENCE of squares (`a²−b²`, the indefinite Minkowski block)
    rather than the SUM (`a²+b²`, positive-definite); at `a=3,b=1` the correct `9+1=10` vs the wrong
    `9−1=8` reduces to the false numeric `10 = 8` (distinct from C84 `8=4`, C85 `0=2`, C86 `27=9`).
    Words-removable: delete "Lorentz/boost/Spin/SO(9)/SO⁺(1,9)/isometry/signature/Minkowski/
    spacelike/timelike/polar/KAK/positive-definite/Born" → over the derived complete ordered field
    `Cut` and the CD-double³ `O Cut`, `reQC (v·star v)` is the sum of the 8 coordinate squares of
    `v` (so `≥ 0`, `= 0 ↔ v = 0`), and `t²−x²−reQC(v·star v)` is `> 0` on `(t,0,0)` with `t ≠ 0`,
    `≤ 0` on `(0,x,v)`, `< 0` on nonzero `(0,x,v)`, pure math. W3 DECOMPOSE: the actual KAK
    `g=k·exp(p)` finite-product EXHAUSTION + the full `Spin(9)→SO(9)` surjectivity is childed N57.

  - **★ (N56→N57→N58 ARC CONTEXT — the original KAK-exhaustion spec, now split: N57 LANDED the
    square-root prerequisite below; the global remainder is N58 above) THE KAK `g = k·exp(p)`
    FINITE-PRODUCT EXHAUSTION (the REVERSE inclusion `qvIsomMonoidC` on the connected component `≤
    genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion, childed from N56.** N49–N56 banked, over the derived ℝ
    `Cut`: BOTH one-parameter generator families (`boostOPS`, `rotGenSetC`), the TWO-SIDED Moufang/
    `Spin(9)` generator `biMulFun u u'`, the EXTENDED generated group `genIsomMonoidC2` with FORWARD
    soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` (N55), AND NOW (N56) the BORN POSITIVITY foundation:
    `gFormC` is positive-definite (`gFormC_nonneg` + `gFormC_eq_zero_iff`) and `QvC` has the (1,9)
    signature (`QvC_time_pos` + `QvC_space_neg_of_ne`) — the positive-definiteness the polar "boost
    part" rests on. THE HEAVY CORE that remains is the REVERSE inclusion: that EVERY orientation/
    time-preserving continuum isometry of `QvC` IS a finite product of the generators —
    `qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`. This is the genuine W1 HEAVY
    remainder: the polar/KAK decomposition `g = k·exp(p)` extracts the positive-definite "boost
    part" `exp(p)` as the SQUARE ROOT of the form-adjoint composite `g*g` over the derived `Cut` —
    but Mathlib has NO general `sqrt` over `Cut` (only the specific derived `√2`); the rotation part
    `k` is the leftover, requiring connectedness; AND the two-sided Moufang generators `biMulFun u
    u'` must EXHAUST the full spacelike `SO(9)` (every spacelike rotation a finite product of
    bimultiplications, the `2:1` cover `Spin(9)→SO(9)`). Mathlib has NO `SO⁺(1,9)`, no octonionic
    spinor cover, no Lie-group integration over `Cut`. MEASURE FIRST + reframe through the trunk —
    the immediately-bankable sub-piece to MEASURE FIRST: (i) a positive-definite SQUARE-ROOT lemma
    over `Cut` (does the banked completeness/lub of `Cut` give `∀ a ≥ 0, ∃ b ≥ 0, b² = a`? — the
    general `sqrt` the polar boost part needs, the first true prerequisite, attacked from the
    completeness the continuum was built with); or (ii) a concrete reachability (a specific 2-plane
    `SO(9)` rotation realized as a finite product of the banked `biMulFun` two-sided generators). If
    the REVERSE surjectivity genuinely RESISTS after measure + reframe it is an HONEST W1 dissolution
    ticket + block, decompose into the immediately-bankable piece + child the global remainder. The
    costume must bite a WRONG square-root / reachability / surjectivity claim. NO posited Lorentz
    group, NO Mathlib ℝ/ℂ as content — DERIVE from the banked `genIsomMonoidC2`/`qvIsomMonoidC` +
    `boostOPS` + `rotGenSetC` + `biMulGenSetC` + `infIsomLieAlg` + `BvC` + the N56 Born-positivity
    (`gFormC_nonneg`/`gFormC_eq_zero_iff`/signature) + the continuum form + the terminal algebra
    `O Cut` over the derived ℝ.

  - **N57 LANDED — THE POSITIVE-DEFINITE SQUARE ROOT over the DERIVED ℝ `Cut`** (the first
    true prerequisite of the polar/KAK boost part `exp(p) = √(g*g)`).
    `Phys/Algebra/LorentzContinuumSqrt.lean` (namespace `Phys.Algebra`, 10 decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against the built olean +
    Audits/AxiomAudit.lean; costume C88; gate D0–D6). THE W1 REFRAME + W9 MEASURE-FIRST — the
    REVERSE KAK inclusion extracts the positive-definite "boost part" `exp(p)` as the SQUARE ROOT
    of the form-adjoint composite `g*g` over the scalar field `Cut`, and Mathlib has NO general
    `sqrt` over `Cut` (only the specific derived `√2`). The square root does NOT need a bespoke
    Dedekind-lub construction; it DISSOLVES through THE ORDER-COMPLETENESS THE CONTINUUM WAS BUILT
    WITH: `intermediate_value_Icc` consumes exactly (N33 `ConditionallyCompleteLinearOrder` + N34
    `OrderTopology`) on a closed interval together with a continuous map; squaring `x ↦ x·x` is
    continuous because the derived ℝ is a topological ring (N34 `IsTopologicalRing`, `continuous_cut_sq`);
    for `a ≥ 0`, `c = max 1 a` gives `0·0 = 0 ≤ a ≤ c·c`, so IVT on `[0,c]` returns a nonnegative
    root (`cutSqrt_exists`). Squaring is injective on the nonnegatives (`sq_nonneg_inj`, via
    `mul_self_eq_mul_self_iff`), giving the named witness `cutSqrt a` with `(cutSqrt a)·(cutSqrt a) =
    a` for `a ≥ 0` (`cutSqrt_sq`), unique on the nonneg branch (`cutSqrt_unique`), strictly positive
    off zero (`cutSqrt_pos` — the invertibility the polar boost part rests on), and `cutSqrt 4 = 2`
    (`cutSqrt_four_eq_two`, W8 non-vacuity). NO Mathlib `Real.sqrt`, NO posited ℝ — the SAME
    order-completeness engine that built the cut delivers the root (probe + production compiled clean
    ~8s, KILL=90s never approached). Costume C88 (`LorentzContinuumSqrtWrongWitnessCostume`) bites
    the WRONG nonnegative square root — witness `3` (not the unique root `2`) for `√4`, which by
    `cutSqrt_sq` forces `3·3 = 4` → false numeric `9 = 4` (distinct from C84 `8=4`, C85 `0=2`, C86
    `27=9`, C87 `10=8`). Words-removable: delete "Lorentz/boost/KAK/polar/square-root/isometry/
    positive-definite/Spin/SO(9)" → over the derived complete ordered field `Cut`, every nonnegative
    element has a unique nonnegative element whose square is it, strictly positive off zero, and
    `cutSqrt 4 = 2`, pure math. W3 DECOMPOSE: the GLOBAL reverse KAK surjectivity + the full
    `Spin(9)→SO(9)` exhaustion is childed N58.

  - **N58 LANDED — THE INFINITESIMAL CARTAN DECOMPOSITION of the continuum isometry Lie algebra
    over the DERIVED ℝ `Cut`** (the Lie-algebra skeleton of the polar/KAK `g = k·exp(p)` reverse
    direction). `Phys/Algebra/LorentzContinuumCartan.lean` (namespace `Phys.Algebra`, 8 decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against
    the built olean + Audits/AxiomAudit.lean; costume C89; gate D0–D6). THE W1 REFRAME + W9
    MEASURE-FIRST + W3 DECOMPOSE — the ticket TARGET was the GLOBAL reverse surjectivity, which
    MEASURE-FIRST showed is a genuine MULTI-NODE arc: it needs a general operator adjoint w.r.t. a
    positive-definite reference form, `g*g` self-adjoint + positive-semidefinite, an OPERATOR square
    root over the 10-dim form space (the operator analogue of N57 `cutSqrt` — no Mathlib spectral
    theory over `Cut`), the compact part `k` via CONNECTEDNESS (no Mathlib topology of `SO⁺(1,9)`),
    and the full `Spin(9)→SO(9)` exhaustion — none of the last three bankable in one run. THE
    REFRAME: the polar/KAK `g = k·exp(p)` has, as its Lie-algebra shadow, the Cartan split
    `𝔰𝔬(1,9) = 𝔨 ⊕ 𝔭` relative to a positive-definite Euclidean reference form — the COMPACT part
    `𝔨` is the `EvC`-skew generators (rotations), the NONCOMPACT part `𝔭` the `EvC`-symmetric
    generators (boosts). The positive-definite reference form is exactly what the trunk already
    supplies: `EvC p q = t·t' + x·x' + gFormC v v'` (the `(+,+,…,+)` companion of the indefinite
    Minkowski `BvC`) is symmetric `Cut`-bilinear (`EvC_symm`) and positive-DEFINITE — `0 ≤ EvC p p`
    (`EvC_nonneg`, a sum of the time square, the `x` square, and the N56-nonneg Born self-overlap)
    with equality iff `p = 0` (`EvC_eq_zero_iff`, via N56 `gFormC_eq_zero_iff` — the non-degeneracy
    the polar positive part needs). Relative to it the tangent generators split into the Cartan
    parts: the infinitesimal boost `boostGenC : (t,x,v) ↦ (x,t,0)` is `EvC`-SYMMETRIC
    (`boostGenC_EvC_symm`, the noncompact `𝔭`, by field arithmetic on the `(t,x)` block), the
    imaginary infinitesimal rotation `rotGenC a : (t,x,v) ↦ (0,0,a·v)` for `gFormC a 1 = 0` is
    `EvC`-SKEW (`rotGenC_EvC_skew`, the compact `𝔨`, via the polarized Born skew identity
    `gFormC_skew` N51), and the two are genuinely DISTINCT — the boost is NOT `EvC`-skew
    (`boostGenC_not_EvC_skew`, W8: at `p=(1,0,0)`, `q=(0,1,0)`, `EvC (T p) q + EvC p (T q) = 1+1 =
    2 ≠ 0`), so the split `𝔨 ⊕ 𝔭` is nontrivial. The split is PURE FIELD ARITHMETIC (the same
    `gFormC_skew` engine N51 used for `IsInfIsomC`), re-grounded over the continuum for free (probe
    + production compiled clean ~8s, KILL=90s never approached). Costume C89
    (`LorentzContinuumCartanWrongSplitCostume`) bites the WRONG Cartan-split sign — claiming the
    boost (`EvC`-symmetric, noncompact) satisfies the `EvC`-skew (compact-part) condition; at
    `p=(5,0,0)`, `q=(0,5,0)` the boost gives `25 + 25 = 50`, so the wrong skew claim asserts
    `50 = 0`, the false numeric `50 = 0` (distinct from C84 `8=4`, C85 `0=2`, C86 `27=9`, C87
    `10=8`, C88 `9=4`). Words-removable: delete "Lorentz/boost/rotation/Cartan/KAK/polar/compact/
    noncompact/isometry/Spin/SO(9)/Euclidean" → over the derived complete ordered field `Cut`, the
    symmetric bilinear form `EvC p q = t·t' + x·x' + gFormC v v'` satisfies `0 ≤ EvC p p` with
    equality iff `p = 0`; `(t,x,v)↦(x,t,0)` satisfies `EvC (T p) q = EvC p (T q)`; `(t,x,v)↦(0,0,a·v)`
    for `gFormC a 1 = 0` satisfies `EvC (T p) q + EvC p (T q) = 0`; and the first does NOT satisfy
    the second, pure math. W3 DECOMPOSE: the GLOBAL reverse surjectivity (the operator square root +
    polar/KAK assembly + connectedness + the full `Spin(9)→SO(9)` exhaustion) is childed N59.

  - **N59 LANDED — THE OPERATOR FORM-ADJOINT w.r.t. the positive-definite Euclidean reference
    form `EvC` over the DERIVED ℝ `Cut`** (lifting the N58 INFINITESIMAL `IsEvCSymm`/`IsEvCSkew`
    split to the OPERATOR/group level, with `g*∘g` proved EvC-SELF-ADJOINT and
    EvC-POSITIVE-SEMIDEFINITE — the trunk-positivity heart of the polar/KAK `g = k·exp(p)`).
    `Phys/Algebra/LorentzContinuumAdjoint.lean` (namespace `Phys.Algebra`, 12 decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against the built olean +
    Audits/AxiomAudit.lean; costume C90; gate D0–D6). THE W1 REFRAME + W9 MEASURE-FIRST + W3
    DECOMPOSE — the ticket TARGET was the GLOBAL operator-level reverse surjectivity, which
    MEASURE-FIRST confirmed is a multi-node arc (operator square root over the 10-dim form space +
    polar/KAK assembly + connectedness + the full `Spin(9)→SO(9)` exhaustion, none in Mathlib over
    `Cut`). THE REFRAME (THE ONE LAW): the polar/KAK extracts `exp(p) = √(g*g)`, and for that root
    to exist the composite `g*∘g` must be EvC-SELF-ADJOINT and EvC-POSITIVE-SEMIDEFINITE — both
    DISSOLVE through the trunk. Define `h` the EvC-adjoint of `g` (`IsEvCAdjoint g h := ∀ p q,
    EvC (g p) q = EvC p (h q)`); then `h∘g` is EvC-symmetric by two adjunction steps
    (`IsEvCAdjoint.comp_isEvCSymm`), and — the heart — `EvC ((h∘g) p) p = EvC (g p)(g p) ≥ 0` by
    N58 `EvC_nonneg` (`IsEvCAdjoint.comp_nonneg`), which is itself the N56 Born positivity plus two
    coordinate squares. The operator-level positivity the polar boost part rests on is LITERALLY the
    trunk's "Born = self-overlap = positivity," read through the reference form — NO Mathlib
    spectral theory, NO posited adjoint, NO analysis. The boost is its own EvC-adjoint
    (`boostGenC_self_adjoint`, self-adjoint/noncompact) with `boostGenC∘boostGenC` strictly positive
    on a concrete vector (`boostGenC_comp_pos_witness = 9`, W8); for imaginary `a` (`gFormC a 1 = 0`)
    `−rotGenC a` is the EvC-adjoint of `rotGenC a` (`rotGenC_adjoint`, skew-adjoint `g* = −g`/compact,
    via N58 `rotGenC_EvC_skew` + `EvC_neg_right`); and the self-adjoint (boost) and skew-adjoint
    (rotation) parts are genuinely DISTINCT — `rotGenC e₂` is NOT EvC-symmetric
    (`rotGenC_e2_not_EvC_symm`, W8: at `p=(0,0,1)`, `q=(0,0,e₂)`, `gFormC e₂ e₂ = 1` vs
    `gFormC 1 (e₂·e₂) = −1`, so self-adjointness would force `1 = −1`). PURE adjunction + ordered-
    field arithmetic, the same engine as N58, re-grounded over the continuum for free (probe +
    production compiled clean ~8s, KILL=90s never approached). Costume C90
    (`LorentzContinuumAdjointRotSelfAdjointCostume`) bites the WRONG operator-adjoint claim — that
    the skew-adjoint compact rotation `rotGenC e₂` is SELF-adjoint (the noncompact/self-adjoint
    part), the operator-level analogue of C89's wrong infinitesimal split; reduces to the false
    numeric `1 = −1` (distinct from C84 `8=4`, C85 `0=2`, C86 `27=9`, C87 `10=8`, C88 `9=4`, C89
    `50=0`). Words-removable: delete "Lorentz/boost/rotation/adjoint/self-adjoint/skew-adjoint/
    Cartan/KAK/polar/compact/noncompact/positive-semidefinite/Spin/SO(9)/isometry" → over the
    derived complete ordered field `Cut`, for the symmetric positive-definite form `EvC` and
    `Cut`-linear `g, h` with `∀ p q, EvC (g p) q = EvC p (h q)`, the composite `h∘g` is EvC-symmetric
    and satisfies `0 ≤ EvC ((h∘g) p) p`, pure math. W3 DECOMPOSE: the GLOBAL reverse surjectivity
    (the operator square root over the form space + the polar/KAK assembly + connectedness + the
    full `Spin(9)→SO(9)` exhaustion) is childed N60.

  - **N60 LANDED — THE OPERATOR SQUARE ROOT (the structured/scalar case) over the DERIVED ℝ
    `Cut`** (lifting the scalar positive-definite square root `cutSqrt` (N57) to the OPERATOR
    level and CONSUMING the N59 operator form-adjoint positivity — the operator-level existence
    of the polar/KAK boost part `exp(p) = √(g*g)` in the structured case where `g*g` acts as a
    scalar). `Phys/Algebra/LorentzContinuumOpSqrt.lean` (namespace `Phys.Algebra`, 13 decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against
    the built olean + Audits/AxiomAudit.lean; costume C91; gate D0–D6). THE W1 REFRAME + W9
    MEASURE-FIRST + W3 DECOMPOSE — the ticket TARGET was the GLOBAL operator-level reverse
    surjectivity; MEASURE-FIRST (per the ROADMAP §N60 CAUTION) confirmed the FULL spectral square
    root of a general 10-dim EvC-self-adjoint EvC-positive-semidefinite operator is itself a
    sub-node (it needs diagonalization — no Mathlib spectral theory over `Cut`), and the
    STRUCTURED/DIAGONAL case (where `g*g` acts as a scalar on a 1-dim/isotropic eigenspace) is
    bankable first. THE REFRAME (THE ONE LAW): where `g*g` acts as a scalar `c·id` (the structured
    case — `c` the squared boost rapidity on the isotropic line), its positive operator root is
    the homothety `(cutSqrt c)·id`; three trunk facts make it THE positive square root with NO
    spectral theory — a scalar operator is EvC-symmetric (`cutSmul_isEvCSymm`, reference-form
    bilinearity), it is EvC-positive-semidefinite (`EvC ((cutSqrt c·id) p) p = cutSqrt c · EvC p p
    ≥ 0`, the product of N57 `cutSqrt_nonneg` and N58 `EvC_nonneg` — THE TRUNK POSITIVITY), and it
    squares back (`(cutSqrt c·id)² = c·id`, by N57 `cutSqrt_sq`). The positive operator square-root
    predicate `IsEvCOpSqrt s g := IsEvCSymm s ∧ (∀ p, 0 ≤ EvC (s p) p) ∧ s∘s = g`; the heart
    `scalar_op_sqrt : IsEvCOpSqrt (cutSqrt c • id) (c • id)` for `c ≥ 0`. Consuming N59: if `h∘g`
    (= `g*g`) acts as `c·id`, then `0 ≤ c` (`comp_scalar_pos`, via N59 `IsEvCAdjoint.comp_nonneg`
    at the unit time vector `(1,0,0)` where `EvC = 1`) and the polar positive part `√(g*g) =
    (cutSqrt c)·id` EXISTS as a positive operator square root of `g*g` (`comp_scalar_op_sqrt` — the
    existence-of-the-positive-root hypothesis the polar boost part consumes, DISCHARGED in the
    structured case), with structured uniqueness (`scalar_op_sqrt_unique`). PURE ordered-field +
    linear-algebra arithmetic, the same engine as N57–N59, re-grounded over the continuum for free
    (two scratch probes + production compiled clean ≤9s, KILL=60s never approached). Costume C91
    (`LorentzContinuumOpSqrtWrongRootCostume`) bites the WRONG operator-square-root claim — that
    `5·id` is an operator square root of `7·id`, i.e. `(5·id)∘(5·id) = 7·id`; banked `cutSmul_comp`
    gives `(5·id)∘(5·id) = 25·id`, so reading at the time coordinate of `(1,0,0)` the wrong claim
    asserts `25 = 7` (distinct from C84 `8=4`, C85 `0=2`, C86 `27=9`, C87 `10=8`, C88 `9=4`, C89
    `50=0`, C90 `1=−1`). Words-removable: delete "Lorentz/boost/rotation/polar/KAK/Cartan/
    square-root/positive-definite/self-adjoint/isometry/Spin/SO(9)/eigenvalue/homothety" → over
    the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for the
    symmetric positive-definite form `EvC` and every `c ≥ 0`, `cutSqrt c • id` is EvC-symmetric,
    EvC-positive-semidefinite, and squares to `c • id`; it is the unique nonneg scalar with that
    square; and for `Cut`-linear `g, h` with `∀ p q, EvC (g p) q = EvC p (h q)`, if `h∘g = c • id`
    then `0 ≤ c` and `cutSqrt c • id` squares to `h∘g`, pure math. W3 DECOMPOSE: the FULL spectral
    square root over the 10-dim form space (a general non-scalar `g*g`) + the polar/KAK assembly +
    connectedness + the full `Spin(9)→SO(9)` exhaustion is childed N61.

  - **N61 LANDED — THE 2-BLOCK (NON-SCALAR) OPERATOR SQUARE ROOT over the DERIVED ℝ `Cut`**
    (extending the N60 structured/SCALAR operator square root toward the FULL SPECTRUM via the
    first genuinely NON-scalar case — the first step off N60's one-eigenvalue homothety onto the
    spectrum). `Phys/Algebra/LorentzContinuumOpSqrtBlock.lean` (namespace `Phys.Algebra`, 13 decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against
    the built olean + Audits/AxiomAudit.lean; costume C92; gate D0–D6). THE W1 REFRAME + W9
    MEASURE-FIRST + W3 DECOMPOSE — the ticket TARGET was the FULL spectral operator square root
    (general non-scalar `g*g`) + the global reverse KAK surjectivity; MEASURE-FIRST (per the
    ROADMAP §N61 priority (i)) confirmed the FULL spectral theorem (arbitrary `g*g`, simultaneous
    diagonalization of a self-adjoint operator over `Cut` with no Mathlib spectral theory) is the
    genuine HEAVY sub-node, and the STRUCTURED DIAGONALIZABLE case that is NOT a single scalar is
    bankable first. THE REFRAME (THE ONE LAW): the reference form `EvC p q = t·t' + x·x' +
    gFormC v v'` makes the time/`x` plane `(t,x)` and the octonion block `v` EvC-ORTHOGONAL (no
    cross terms), so the diagonal operator `blockDiag a b : (t,x,v) ↦ (a•t, a•x, b•v)` (scalar `a`
    on `(t,x)`, scalar `b` on `v`) is self-adjoint and diagonal in this banked splitting, and its
    positive operator square root is the SCALAR `cutSqrt` applied eigenvalue-by-eigenvalue —
    `(cutSqrt a)` on `(t,x)`, `(cutSqrt b)` on `v`. `blockDiag c c = c·id` (`blockDiag_scalar`, the
    scalar collapse — it genuinely EXTENDS N60). Three trunk facts make `blockDiag (cutSqrt c₁)
    (cutSqrt c₂)` THE positive square root of `blockDiag c₁ c₂` (`blockDiag_op_sqrt`, the heart)
    with NO spectral theory: EvC-self-adjoint (`blockDiag_isEvCSymm`, the bilinearity of `EvC`
    blockwise), EvC-positive-semidefinite for `c₁,c₂ ≥ 0` (`blockDiag_nonneg`: `EvC (blockDiag a b
    p) p = a·t² + a·x² + b·gFormC v v ≥ 0`, the sum of nonneg-scaled coordinate squares and the
    N56 Born self-overlap `gFormC_nonneg` — THE TRUNK POSITIVITY blockwise), and squaring back
    (`blockDiag_comp : blockDiag a b ∘ blockDiag a' b' = blockDiag (a·a')(b·b')` per eigenblock +
    N57 `cutSqrt_sq`). A diagonal operator is determined by its two eigenvalues (`blockDiag_inj`,
    via the `a`-block reader at `(1,0,0)` and the `b`-block reader `gFormC (·) 1` at `(0,0,1)`),
    giving blockwise uniqueness (`blockDiag_op_sqrt_unique`, via N57 `cutSqrt_unique` per block).
    PURE linear-algebra + ordered-field arithmetic, the same engine as N57–N60, re-grounded over
    the continuum for free (probe of 8 decls + production compiled clean ≤8s, KILL=60s never
    approached, NO inflated maxHeartbeats / NO native_decide / NO brute). Costume C92
    (`LorentzContinuumOpSqrtBlockWrongRootCostume`) bites the WRONG 2-block operator-square-root
    claim — that `blockDiag 2 3` is an operator square root of `blockDiag 4 10`, i.e.
    `(blockDiag 2 3)∘(blockDiag 2 3) = blockDiag 4 10`; banked `blockDiag_comp` gives
    `(blockDiag 2 3)∘(blockDiag 2 3) = blockDiag 4 9`, so reading at the octonion `b`-eigenblock via
    `gFormC (·).2.2 1` at `(0,0,1)` (`blockDiag_b_read`) the wrong claim asserts `3·3 = 9 = 10`,
    reducing to the false numeric `9 = 10` (distinct from C84 `8=4`, C85 `0=2`, C86 `27=9`, C87
    `10=8`, C88 `9=4`, C89 `50=0`, C90 `1=−1`, C91 `25=7`). Non-vacuity: `blockDiag_op_sqrt_witness`
    (`blockDiag 2 3` (`2 ≠ 3`, off the N60 scalar diagonal) is the positive operator square root of
    `blockDiag 4 9` — a GENUINELY non-scalar root) and `not_blockDiag_op_sqrt_2_3` (W8 teeth).
    Words-removable: delete "Lorentz/boost/rotation/spectral/eigenspace/eigenvalue/diagonal/block/
    Cartan/polar/KAK/square-root/self-adjoint/positive-semidefinite/isometry/Spin/SO(9)" → over the
    derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for the symmetric
    positive-definite form `EvC` and the `Cut`-linear self-map `blockDiag a b := (t,x,v) ↦
    (a•t, a•x, b•v)`: `blockDiag a b` is EvC-symmetric, `blockDiag c c = c·id`, `blockDiag a b ∘
    blockDiag a' b' = blockDiag (a·a')(b·b')`, and for `a,b ≥ 0` `0 ≤ EvC (blockDiag a b p) p`; so
    for every `c₁,c₂ ≥ 0`, `blockDiag (cutSqrt c₁)(cutSqrt c₂)` is EvC-symmetric, EvC-positive-
    semidefinite, and squares to `blockDiag c₁ c₂`, uniquely among nonnegative diagonals; pure math.
    W3 DECOMPOSE: the FULL spectral square root over the 10-dim form space (a general
    non-block-diagonal `g*g`, needing simultaneous diagonalization) + the polar/KAK assembly +
    connectedness + the full `Spin(9)→SO(9)` exhaustion is childed N62.

  - **N62 LANDED — THE OCTONION-INTERNAL (3-EIGENVALUE) COORDINATE-DIAGONAL OPERATOR SQUARE ROOT
    over the DERIVED ℝ `Cut`** (the FIRST diagonalization WITHIN the octonion block — extending the
    N61 2-block, which kept the whole 8-dim octonion `v` as ONE eigenblock, by splitting the
    octonion into its Cayley–Dickson re-half and im-half eigenspaces).
    `Phys/Algebra/LorentzContinuumOpSqrtCoord.lean` (namespace `Phys.Algebra`, 22 decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against
    the built olean + Audits/AxiomAudit.lean; costume C93; gate D0–D6). THE W1 REFRAME + W9
    MEASURE-FIRST + W3 DECOMPOSE — the ticket TARGET was the FULL spectral operator square root over
    a general non-block-diagonal `g*g` + the global reverse KAK surjectivity; MEASURE-FIRST (per the
    ROADMAP §N62 priority (i)) confirmed the FULL spectral theorem for an ARBITRARY
    (non-coordinate-diagonal) `g*g` (needing the change-of-basis / simultaneous diagonalization of an
    arbitrary self-adjoint operator over `Cut`, no Mathlib spectral theory) is the genuine HEAVY
    sub-node, and the WITHIN-THE-OCTONION diagonalization — the next genuinely-new structural piece
    after N61 kept the whole octonion as one block — is bankable first. THE REFRAME (THE ONE LAW):
    `O Cut = CD (H Cut)`, so an octonion `v = ⟨v.re, v.im⟩` has two `H Cut` halves; the Born
    self-overlap polarizes (`gFormC_coordExpand`, the 8-coordinate dot product, the polarization of
    N56 `gFormC_sumOfSquares`) into the SUM of the re-half dot product and the im-half dot product
    with NO cross terms — so the re-half and im-half are EvC-ORTHOGONAL, and the octonion-internal
    2-block `octBlock b₁ b₂ : v ↦ ⟨b₁•v.re, b₂•v.im⟩` is self-adjoint and diagonal in this banked
    Cayley–Dickson splitting, its positive operator square root the SCALAR `cutSqrt` applied
    half-by-half. Lifted to the 10-dim form space, `coordDiag3 a b₁ b₂ : (t,x,v) ↦
    (a•t, a•x, octBlock b₁ b₂ v)` is a GENUINELY THREE-distinct-eigenvalue diagonal operator (the
    `(t,x)` plane, the octonion re-half, the octonion im-half), `coordDiag3 c c c = c·id`
    (`coordDiag3_scalar`, the scalar collapse — it genuinely EXTENDS both N60 scalar and N61
    2-block). Three trunk facts make `coordDiag3 (cutSqrt c)(cutSqrt a₁)(cutSqrt a₂)` THE positive
    square root of `coordDiag3 c a₁ a₂` (`coordDiag3_op_sqrt`, the heart) with NO spectral theory:
    EvC-self-adjoint (`coordDiag3_isEvCSymm`, via `octBlock_gForm_symm` — the re/im EvC-orthogonality,
    the crux), EvC-positive-semidefinite for `c,a₁,a₂ ≥ 0` (`coordDiag3_nonneg`, via
    `octBlock_gForm_nonneg` — the re/im split of the N56 Born positivity into two nonneg-scaled sums
    of four squares each), and squaring back (`coordDiag3_comp` + N57 `cutSqrt_sq`). A
    coordinate-diagonal operator is determined by its three eigenvalues (`coordDiag3_inj`, via the
    `(t,x)` reader at `(1,0,0)`, the re-half reader `gFormC (·) 1` at `(0,0,1)`, the im-half reader
    `gFormC (·) e₂` at `(0,0,e₂)`), giving coordinatewise uniqueness (`coordDiag3_op_sqrt_unique`).
    PURE linear-algebra + ordered-field arithmetic + the Cayley–Dickson re/im structure, the same
    engine as N56–N61, re-grounded over the continuum for free (probe of 22 decls + production
    compiled clean ≤8s, KILL=60s never approached, NO inflated maxHeartbeats / NO native_decide / NO
    brute). Costume C93 (`LorentzContinuumOpSqrtCoordWrongRootCostume`) bites the WRONG
    octonion-internal coordinate-diagonal operator-square-root claim — that `coordDiag3 1 2 3` is an
    operator square root of `coordDiag3 1 4 11`, i.e. `(coordDiag3 1 2 3)∘(coordDiag3 1 2 3) =
    coordDiag3 1 4 11`; banked `coordDiag3_comp` gives `(coordDiag3 1 2 3)∘(coordDiag3 1 2 3) =
    coordDiag3 1 4 9`, so reading at the octonion im-half `b₂`-eigenblock via `gFormC (·).2.2 e₂` at
    `(0,0,e₂)` (`coordDiag3_b2_read`) the wrong claim asserts `3·3 = 9 = 11`, reducing to the false
    numeric `9 = 11` (distinct from C84 `8=4`, C85 `0=2`, C86 `27=9`, C87 `10=8`, C88 `9=4`, C89
    `50=0`, C90 `1=−1`, C91 `25=7`, C92 `9=10`). Non-vacuity: `coordDiag3_op_sqrt_witness`
    (`coordDiag3 1 2 3`, three DISTINCT eigenvalues, the octonion internally diagonalized, is the
    positive operator square root of `coordDiag3 1 4 9` — beyond N61's 2-block) and
    `not_coordDiag3_op_sqrt_1_2_3` (W8 teeth). Words-removable: delete "Lorentz/boost/rotation/
    spectral/eigenspace/eigenvalue/diagonal/block/Cartan/polar/KAK/square-root/self-adjoint/
    positive-semidefinite/isometry/Spin/SO(9)" → over the derived complete ordered field `Cut` and
    the Cayley–Dickson double³ `O Cut = CD (H Cut)`, for the symmetric positive-definite form `EvC`
    and the `Cut`-linear self-map `coordDiag3 a b₁ b₂ := (t,x,v) ↦ (a•t, a•x, ⟨b₁•v.re, b₂•v.im⟩)`:
    it is EvC-symmetric, `coordDiag3 c c c = c·id`, `coordDiag3 a b₁ b₂ ∘ coordDiag3 a' b₁' b₂' =
    coordDiag3 (a·a')(b₁·b₁')(b₂·b₂')`, and for `a,b₁,b₂ ≥ 0` `0 ≤ EvC (coordDiag3 a b₁ b₂ p) p`; so
    for every `c,a₁,a₂ ≥ 0`, `coordDiag3 (cutSqrt c)(cutSqrt a₁)(cutSqrt a₂)` is EvC-symmetric,
    EvC-positive-semidefinite, and squares to `coordDiag3 c a₁ a₂`, uniquely among nonnegative
    coordinate-diagonals; pure math. W3 DECOMPOSE: the FULL spectral square root over an ARBITRARY
    (non-coordinate-diagonal) `g*g` — needing the change-of-basis / simultaneous diagonalization of
    an arbitrary self-adjoint operator over `Cut` — + the polar/KAK assembly + connectedness + the
    full `Spin(9)→SO(9)` exhaustion is childed N63.

  - **N63 LANDED — THE EvC-ORTHOGONAL EIGENPROJECTION + THE SPECTRAL SQUARE ROOT IN A ROTATED
    ORTHONORMAL BASIS over the DERIVED ℝ `Cut`** (the FIRST rotated-basis spectral object in the
    chain — N60–N62 were all diagonal in the FIXED standard coordinate basis; this is the
    change-of-basis lever). `Phys/Algebra/LorentzContinuumEigenProj.lean` (namespace `Phys.Algebra`,
    26 decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited
    against the built olean + Audits/AxiomAudit.lean; costume C94; gate D0–D6). THE W1 REFRAME + W9
    MEASURE-FIRST + W3 DECOMPOSE — the ticket TARGET was the FULL spectral operator square root over
    an ARBITRARY (non-coordinate-diagonal) `g*g` + the global reverse KAK surjectivity; MEASURE-FIRST
    (per the ROADMAP §N63 priority (i)) confirmed the FULL spectral theorem for an ARBITRARY
    self-adjoint operator (needing the EXISTENCE of an EvC-orthonormal eigenbasis, `g = Σ λᵢ Pᵢ`, no
    Mathlib spectral theory over `Cut`) is the genuine HEAVY sub-node, and the CHANGE-OF-BASIS lever
    — a spectral object diagonal in an ARBITRARY EvC-orthonormal eigenbasis (NOT the standard
    coordinate frame), the next genuinely-new structural piece after N60–N62 were all standard-basis
    diagonal — is bankable first. THE REFRAME (THE ONE LAW): the classical spectral theorem writes a
    positive self-adjoint operator as `g = Σ λᵢ Pᵢ` over its EvC-orthogonal eigenprojections and its
    root as `√g = Σ √λᵢ Pᵢ`; the trunk supplies every ingredient with NO spectral analysis. The
    EvC-orthogonal projection onto a line `span(u)` is `projC u : p ↦ (EvC u p) • u` — the
    positive-definite reference form `EvC` (N58, itself the Born self-overlap positivity N56) IS the
    inner product that makes "orthogonal projection" meaningful; `projC u` is EvC-self-adjoint for
    EVERY `u` (`projC_isEvCSymm`), idempotent for an EvC-unit (`projC_idem`), mutually-annihilating
    for EvC-orthogonal lines (`projC_orth`), and EvC-positive-semidefinite (`projC_nonneg`, since
    `EvC (projC u p) p = (EvC p u)² ≥ 0`, the order of the continuum). The spectral operator
    `specOp λ₁ λ₂ u₁ u₂ := λ₁ • projC u₁ + λ₂ • projC u₂` is EvC-self-adjoint and EvC-positive-
    semidefinite for nonneg eigenvalues for EVERY `u₁,u₂` (`specOp_isEvCSymm`/`specOp_nonneg`), and —
    WHEN `{u₁,u₂}` is EvC-ORTHONORMAL — composes by squaring eigenvalues (`specOp_comp`), so the
    positive square root of `specOp c₁ c₂ u₁ u₂` is `specOp (cutSqrt c₁)(cutSqrt c₂) u₁ u₂`
    (`specOp_op_sqrt`, the heart) — the scalar `cutSqrt` applied per EvC-orthogonal eigenprojection,
    the rotated-basis analogue of N62 with NO Mathlib spectral theory. A CONCRETE EvC-orthonormal
    pair off the coordinate axes (`u35a = (3/5,4/5,0)`, `u35b = (4/5,−3/5,0)`, the Pythagorean
    rotation) makes `specOp 4 9 u35a u35b` GENUINELY NON-COORDINATE-DIAGONAL (`specOp_4_9_offdiag`:
    its `(x↦t)` off-diagonal entry is `−12/5 ≠ 0`, so it is not any `coordDiag3`), with `specOp 2 3
    u35a u35b` its positive operator square root (`specOp_witness`, beyond N62's standard-basis
    `coordDiag3`). PURE linear-algebra + ordered-field arithmetic over the derived ℝ `Cut`, the same
    engine as N56–N62 (probe + production compiled clean ≤8s, all 26 decls foundations-only at first
    compile, KILL=60s never approached, NO inflated maxHeartbeats / NO native_decide / NO brute).
    Costume C94 (`LorentzContinuumEigenProjWrongRootCostume`) bites the WRONG rotated-basis
    spectral operator-square-root claim — that `specOp 2 4 u35a u35b` is an operator square root of
    `specOp 4 15 u35a u35b`; banked `specOp_comp` gives `specOp 4 16 u35a u35b`, so reading at the
    `u₂` eigenblock via `specOp_read₂` the wrong claim forces `4·4 = 16 = 15`, reducing to the false
    numeric `16 = 15` (distinct from C84 `8=4`, …, C92 `9=10`, C93 `9=11`). Non-vacuity:
    `specOp_witness` + `specOp_4_9_offdiag` (genuinely non-coordinate-diagonal) +
    `not_specOp_2_4_op_sqrt_4_15` (W8 teeth). Words-removable: delete "Lorentz/spectral/eigenspace/
    eigenvalue/eigenprojection/eigenbasis/orthonormal/projection/square-root/self-adjoint/diagonal/
    rotation/isometry/Spin/SO(9)" → over the derived complete ordered field `Cut` and `O Cut`, for
    the symmetric positive-definite form `EvC` and the `Cut`-linear maps `projC u := p ↦ (EvC u p)•u`
    and `specOp λ₁ λ₂ u₁ u₂ := λ₁•projC u₁ + λ₂•projC u₂`: `projC u` is EvC-symmetric, idempotent
    when `EvC u u = 1`, `0 ≤ EvC (projC u p) p`; `specOp λ₁ λ₂ u₁ u₂` is EvC-symmetric, nonneg for
    `λᵢ ≥ 0`, and for EvC-orthonormal `{u₁,u₂}` composes to `specOp (λ₁²)(λ₂²) u₁ u₂`; so for
    `c₁,c₂ ≥ 0`, `specOp (cutSqrt c₁)(cutSqrt c₂) u₁ u₂` squares to `specOp c₁ c₂ u₁ u₂`; pure math.
    W3 DECOMPOSE: the FULL spectral square root for an ARBITRARY self-adjoint operator — the
    EXISTENCE of an EvC-orthonormal eigenbasis, `g = Σ λᵢ Pᵢ` — + the polar/KAK assembly +
    connectedness + the full `Spin(9)→SO(9)` exhaustion is childed N64.

  - **N64 LANDED — THE GENERAL (WHOLE-FAMILY) EvC-ORTHONORMAL EIGENBASIS EXISTENCE + THE
    ISOMETRY-DERIVED DIAGONALIZATION over the DERIVED ℝ `Cut`** (the FIRST whole-family
    eigenbasis-existence result in the chain — N63 banked the rotated-basis spectral square root for a
    SINGLE GIVEN EvC-orthonormal eigenbasis; this EXHIBITS, for a whole 2-parameter family of
    symmetric operators, an EXPLICIT FIXED EvC-orthonormal eigenbasis, with an IRRATIONAL
    (`cutSqrt`-valued) off-axis 45° eigenbasis, escalating N63's RATIONAL `u35a/u35b`).
    `Phys/Algebra/LorentzContinuumEigenBasis.lean` (namespace `Phys.Algebra`, 14 decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against the built olean +
    Audits/AxiomAudit.lean; costume C95; gate D0–D6). THE W1 REFRAME + W9 MEASURE-FIRST + W3 DECOMPOSE —
    the ticket TARGET was the FULL spectral operator square root over an ARBITRARY EvC-self-adjoint
    operator (reduced by N63 to the EXISTENCE of an EvC-orthonormal eigenbasis `g = Σ λᵢ Pᵢ`) + the
    global reverse KAK surjectivity; MEASURE-FIRST (per the ROADMAP §N64 priority (i)) confirmed the
    FULL eigenbasis existence for an ARBITRARY (UNEQUAL-diagonal) self-adjoint operator needs the
    characteristic-polynomial discriminant radical `√((a−d)²+4b²)` over `Cut` (no Mathlib spectral
    theory over `Cut`) — the genuine HEAVY sub-node — and the EQUAL-DIAGONAL 2-parameter family, whose
    eigenbasis is parameter-independent (NO discriminant), is bankable first, escalating N63 from a
    SINGLE given eigenbasis to a WHOLE PARAMETRIZED FAMILY. THE REFRAME (THE ONE LAW): a `(t,x)`-plane
    symmetric operator with EQUAL diagonal entries `txOp a b a : (t,x,v) ↦ (a·t+b·x, b·t+a·x, 0)` is,
    for EVERY `a,b`, diagonalized by ONE fixed EvC-orthonormal 45° pair `u₊ = (s,s,0)`, `u₋ = (s,−s,0)`
    with `s = cutSqrt (1/2)` (so `s² = 1/2`, `uP_norm`/`uM_norm`/`uPM_orth` — EvC-orthonormal,
    IRRATIONAL, off the coordinate axes), eigenvalues `a+b` and `a−b`:
    `txOp a b a = specOp (a+b)(a−b) u₊ u₋` (`txOp_eq_specOp`) — the equal-diagonal slice removes the
    discriminant radical ENTIRELY, the eigenbasis supplied by the trunk `cutSqrt (1/2)` (N57). So for
    `a+b ≥ 0 ∧ a−b ≥ 0`, N63 `specOp_op_sqrt` delivers each member's positive operator square root
    `specOp (cutSqrt (a+b))(cutSqrt (a−b)) u₊ u₋` (`txOp_op_sqrt`, the heart — a WHOLE 2-parameter
    family of rooted operators in an irrational off-axis eigenbasis), and the banked tangent isometry
    generator's square `boostGenC∘boostGenC = txOp 1 0 1` (`boostGenC_sq_eq`) IS a family member
    (eigenvalues `1,1`, the `(t,x)`-plane identity — the isometry-derived diagonalization the ticket
    names). PURE linear-algebra + ordered-field arithmetic over the derived ℝ `Cut`, the same engine as
    N56–N63 (scratch probe + production compiled clean ≤8s, all 14 decls foundations-only at first
    compile, KILL=30s/obligation never approached, NO inflated maxHeartbeats / NO native_decide / NO
    brute). Costume C95 (`LorentzContinuumEigenBasisWrongDiagCostume`) bites the WRONG eigendecomposition
    — that `txOp 5 4 5` diagonalizes as `specOp 9 7 u₊ u₋` (second eigenvalue `7` instead of `a−b =
    5−4 = 1`); banked `txOp_5_4_5_diag` gives `txOp 5 4 5 = specOp 9 1 u₊ u₋`, so reading at the `u₋`
    eigenblock via `specOp_read₂` the wrong claim forces `1 = 7`, reducing to the false numeric `1 = 7`
    (distinct from C84 `8=4`, …, C93 `9=11`, C94 `16=15`). Non-vacuity: `txOp_5_4_5_witness` (`specOp 3 1
    u₊ u₋` is the positive operator square root of `txOp 5 4 5 = specOp 9 1 u₊ u₋`, the concrete clean
    member). Words-removable: delete "Lorentz/boost/rotation/spectral/eigenbasis/eigenvalue/diagonal/
    orthonormal/square-root/self-adjoint/positive-semidefinite/isometry/Spin/SO(9)/KAK/polar/Cartan" →
    over the derived complete ordered field `Cut` and `O Cut`, for the symmetric positive-definite form
    `EvC`, the `Cut`-linear map `txOp a b d := (t,x,v) ↦ (a·t+b·x, b·t+d·x, 0)`, and the fixed pair
    `u₊ := (s,s,0)`, `u₋ := (s,−s,0)` with `s := cutSqrt (1/2)`: `{u₊,u₋}` is EvC-orthonormal; for EVERY
    `a,b`, `txOp a b a = specOp (a+b)(a−b) u₊ u₋`; `boostGenC∘boostGenC = txOp 1 0 1`; for
    `a+b ≥ 0 ∧ a−b ≥ 0`, `specOp (cutSqrt (a+b))(cutSqrt (a−b)) u₊ u₋` squares to `txOp a b a`; and
    concretely `txOp 5 4 5 = specOp 9 1 u₊ u₋` with positive square root `specOp 3 1 u₊ u₋`; pure math.
    W3 DECOMPOSE: the FULL eigenbasis existence for an ARBITRARY (UNEQUAL-diagonal) EvC-self-adjoint
    operator — the characteristic-polynomial discriminant radical over `Cut`, then the full n-dim
    spectral existence (no Mathlib analogue) — + the polar/KAK assembly + connectedness + the full
    `Spin(9)→SO(9)` exhaustion is childed N65.

  - **N65 LANDED — THE FULL ARBITRARY-UNEQUAL-DIAGONAL EvC-ORTHONORMAL EIGENBASIS EXISTENCE over the
    DERIVED ℝ `Cut`** (closing the eigenbasis-existence question N64 opened for the equal-diagonal slice:
    N64 banked the EQUAL-diagonal family `txOp a b a` over a FIXED 45° eigenbasis where the discriminant
    VANISHED; this banks the UNEQUAL-diagonal case `a ≠ d`, where the eigenvectors ROTATE with the
    parameters through the characteristic-polynomial discriminant radical `cutSqrt(((a−d)/2)²+b²)`).
    `Phys/Algebra/LorentzContinuumEigenBasisGen.lean` (namespace `Phys.Algebra`, 11 decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited against the built olean +
    Audits/AxiomAudit.lean; costume C96; gate D0–D6). THE W1 REFRAME + W9 MEASURE-FIRST + W3 DECOMPOSE —
    the ticket TARGET was the FULL eigenbasis existence for an ARBITRARY unequal-diagonal operator (the
    genuine HEAVY core N64 deferred) → the global reverse KAK surjectivity + the full `Spin(9)→SO(9)`
    exhaustion; MEASURE-FIRST (ROADMAP §N65 priority (i)) probed the smallest obligation (a concrete
    unequal-diagonal eigenbasis witness) and found the FULL arbitrary-unequal-diagonal existence ITSELF
    bankable — the discriminant radical is the banked scalar `cutSqrt` (N57), the construction pure
    ordered-field algebra over the derived ℝ `Cut`. THE REFRAME (THE ONE LAW): the classical eigenproblem
    for the symmetric `[[a,b],[b,d]]` needs the discriminant radical `√((a−d)²+4b²)` — no Mathlib analogue
    over `Cut`; the trunk supplies it as the banked positive-definite scalar root `cutSqrt`. Write
    `m = (a+d)/2`, `δ = (a−d)/2`, `R = cutSqrt(δ²+b²)`. The eigenvalues are `λ± = m ± R`, and — crucially —
    for `b ≠ 0` the eigenvectors ROTATE with the parameters: `R² = δ²+b² > δ²` and `R > 0` force `R−δ > 0`,
    so the eigenvector directions `(b, R−δ)` / `(−(R−δ), b)` have a common POSITIVE squared EvC-norm
    `N = b²+(R−δ)² = 2R(R−δ)`, and normalizing by `nrm = cutSqrt N` (well-defined, nonzero) gives the
    EvC-ORTHONORMAL eigenbasis `u± = rotA/B (b/nrm)((R−δ)/nrm)`. Then `txOp a b d = specOp (m+R)(m−R) u₊ u₋`
    (`txOp_eq_specOp_rot`, THE CROWN) — the FULL arbitrary-unequal-diagonal eigendecomposition, the
    eigenvectors rotating with the parameters through the discriminant `cutSqrt`, NO fixed eigenbasis, NO
    Mathlib spectral theory; and on the positive-semidefinite slice `m − R ≥ 0`, N63 `specOp_op_sqrt`
    delivers the operator square root `specOp (cutSqrt(m+R))(cutSqrt(m−R)) u₊ u₋` (`txOp_op_sqrt_gen`, the
    arbitrary-unequal-diagonal analogue of N64 `txOp_op_sqrt`). The forward decomposition
    `specOp_rot_eq_txOp : specOp l₁ l₂ (rotA c s)(rotB c s) = txOp (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)` holds
    for ALL `l₁,l₂,c,s` (the whole parametrized family of in-general-unequal-diagonal symmetric operators,
    escalating N64's fixed 45° pair). PURE linear-algebra + ordered-field arithmetic over the derived ℝ
    `Cut` (six scratch probes + production compiled clean 8–17s, all 11 decls foundations-only at first
    compile, KILL=30s/obligation never approached, NO inflated maxHeartbeats / NO native_decide / NO brute;
    a wrong `field_simp` certificate on the first reverse-identity probe was diagnosed in a bounded probe
    and replaced by the structured `calc`/`key`-lemma route — the instrument, not the theory, per THE ONE
    LAW). Costume C96 (`LorentzContinuumEigenBasisGenWrongDiagCostume`) bites the WRONG unequal-diagonal
    eigendecomposition — that `txOp 73 36 52` diagonalizes as `specOp 100 30` (second eigenvalue `30` on
    `rotB` instead of the characteristic root `25`); banked `txOp_73_36_52_diag` gives `txOp 73 36 52 =
    specOp 100 25 (rotA (4/5)(3/5))(rotB (4/5)(3/5))`, so reading at the `rotB` eigenblock via N63
    `specOp_read₂` the wrong claim forces `25 = 30`, reducing to the false numeric `25 = 30` (distinct from
    C84 `8=4`, …, C94 `16=15`, C95 `1=7`). Non-vacuity: `txOp_73_36_52_witness` (`specOp 10 5` over the
    concrete rational rotation is the positive operator square root of the unequal-diagonal `txOp 73 36 52`,
    diagonal `73 ≠ 52`, off-diagonal `36 ≠ 0`, the clean rational-discriminant case `R = 75/2`).
    Words-removable: delete "Lorentz/boost/rotation/spectral/eigenbasis/eigenvalue/diagonal/orthonormal/
    discriminant/square-root/self-adjoint/positive-semidefinite/isometry/Spin/SO(9)/KAK/polar/Cartan" →
    over the derived complete ordered field `Cut` and `O Cut`, for the symmetric positive-definite form
    `EvC`, the `Cut`-linear map `txOp a b d := (t,x,v) ↦ (a·t+b·x, b·t+d·x, 0)`, and the pair
    `rotA c s := (c,s,0)`, `rotB c s := (−s,c,0)`: for `c²+s²=1` `{rotA,rotB}` is EvC-orthonormal; for ALL
    `l₁,l₂,c,s`, `specOp l₁ l₂ (rotA c s)(rotB c s) = txOp (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)`; for `b ≠ 0`,
    with `R := cutSqrt(((a−d)/2)²+b²)`, `nrm := cutSqrt(2R(R−(a−d)/2))`, `txOp a b d = specOp ((a+d)/2+R)
    ((a+d)/2−R) (rotA (b/nrm)((R−(a−d)/2)/nrm)) (rotB …)`; for `(a+d)/2 − R ≥ 0`,
    `specOp (cutSqrt((a+d)/2+R))(cutSqrt((a+d)/2−R)) …` squares to `txOp a b d`; concretely
    `txOp 73 36 52 = specOp 100 25 (rotA (4/5)(3/5))(rotB (4/5)(3/5))` with positive square root
    `specOp 10 5 …`; pure math. W3 DECOMPOSE: the polar/KAK assembly `g = k·exp(p)` + the compact part `k`
    via CONNECTEDNESS of the isometry group over `Cut` + the GLOBAL reverse KAK surjectivity + the full
    `Spin(9)→SO(9)` exhaustion is childed N66.

  - **N66 LANDED — THE POLAR / KAK ASSEMBLY `g = k·exp(p)` OF A CONCRETE ISOMETRY over the DERIVED ℝ
    `Cut`** (the FIRST concrete polar-decomposition WITNESS in the chain: N56–N65 banked the Born
    positivity, the operator form-adjoint with `g*∘g ⪰ 0`, and the operator square root in every
    diagonal/rotated case; this ASSEMBLES them into a complete concrete polar factorization of a
    composite isometry, with the positive part delivered by the banked operator square root and BOTH
    factors nontrivial). `Phys/Algebra/LorentzContinuumPolarKAK.lean` (namespace `Phys.Algebra`, 18
    decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited
    against the built olean + Audits/AxiomAudit.lean; costume C97; gate D0–D6). THE W1 REFRAME + W9
    MEASURE-FIRST + W3 DECOMPOSE — the ticket TARGET was the HEAVY group-manifold core (the polar/KAK
    assembly for an ARBITRARY `g`, connectedness, the GLOBAL reverse KAK surjectivity, the full
    `Spin(9)→SO(9)` exhaustion); MEASURE-FIRST (ROADMAP §N66 priority (i)) confirmed the full polar
    assembly for an arbitrary `g` needs the operator square root of an arbitrary `g*g` (full n-dim
    spectral existence, no Mathlib analogue over `Cut`), the compact-part/connectedness/surjectivity
    each needing Lie-group machinery Mathlib lacks over `Cut` — the genuine HEAVY sub-nodes (childed
    N67). The immediately-bankable, theory-native STRUCTURAL piece — escalating N59's `g*∘g`-is-positive
    to a COMPLETE concrete polar decomposition — is the polar factorization of a concrete composite
    isometry. THE REFRAME (THE ONE LAW): the polar positive part IS the Born-positive boost factor. Take
    `g := R∘B` with `B := boostC a b : (t,x,v) ↦ (a·t+b·x, b·t+a·x, v)` (the N49 `boostFunC` as a
    `Module.End`) and `R := blockDiag 1 (−1)` the octonion-block reflection (N61). `B` is EvC-self-adjoint
    (`boostC_isEvCSymm`), squares to `boostC (a²+b²)(2ab)` (`boostC_sq`), is EvC-positive-semidefinite for
    `a ≥ |b|` (`boostC_nonneg`, the trunk Born positivity as a sum of squares), hence IS the banked
    positive operator square root of `boostC (a²+b²)(2ab)` (`boostC_op_sqrt`), and preserves `QvC` for
    `a²−b²=1` (`boostC_isQvIsomC`, the operator form of N49 `boostC_isom`); `R∘R = id` (`R_orthogonal`,
    the compact EvC-orthogonal involution `k*∘k = id`). Then `g = R∘B` has form-adjoint `g* = B∘R`
    (`polG_adjoint`), positive operator `g*∘g = B∘B = boostC (a²+b²)(2ab)` (`polG_starComp`, since
    `R∘R = id`), and positive part `exp(p) = √(g*g) = B` the banked operator square root (`polG_pos_part`,
    THE HEART — `g = k·exp(p)` with `k = R` compact and `exp(p) = boostC a b`), both factors nontrivial
    (`R_ne_id` reflects the octonion block, `boostC_ne_id` sends `(1,0,0) ↦ (5/3,4/3,0)`). PURE
    linear-algebra + ordered-field arithmetic over the derived ℝ `Cut`, the same engine as N56–N65 (three
    scratch probes + production compiled clean ≤12s, all 18 decls foundations-only at first compile,
    KILL=30s/obligation never approached, NO inflated maxHeartbeats / NO native_decide / NO brute).
    Costume C97 (`LorentzContinuumPolarKAKWrongFactorCostume`) bites the WRONG polar POSITIVE factor —
    that `boostC 4 1` is the positive operator square root of `boostC 5 4` (the genuine root is
    `boostC 2 1`, `uP` eigenvalue `3`, squared reading `9`); banked `boostC_sq`/`boostC_uP_read` give
    `(boostC 4 1)²` reading `(4+1)² = 25` at `uP`, against the `boostC 5 4` reading `9`, so the wrong
    factor forces `25 = 9` (distinct from C84 `8=4`, …, C95 `1=7`, C96 `25=30`). Non-vacuity:
    `boostC_witness_isom` (the concrete `boostC (5/3)(4/3)` is a banked isometry) + `R_ne_id`/`boostC_ne_id`
    (both polar factors nontrivial) + `polG_starComp_witness` (`g*∘g = boostC (41/9)(40/9)`, `uP` reading
    `9`). Words-removable: delete "Lorentz/boost/rotation/reflection/polar/KAK/Cartan/compact/positive-
    semidefinite/self-adjoint/adjoint/square-root/spectral/isometry/Spin/SO(9)/connectedness/surjectivity"
    → over the derived complete ordered field `Cut` and `O Cut`, for the symmetric positive-definite form
    `EvC` and the `Cut`-linear maps `boostC a b := (t,x,v) ↦ (a·t+b·x, b·t+a·x, v)` and `R := blockDiag 1
    (−1)`: `boostC a b` is EvC-symmetric, composes as `boostC (aa'+bb')(ab'+a'b)`, is EvC-nonneg for
    `a ≥ |b|`, and the EvC-positive operator square root of `boostC (a²+b²)(2ab)`; `R∘R = id`; `R∘boostC a b`
    has EvC-adjoint `boostC a b ∘ R`, self-composes to `boostC (a²+b²)(2ab)`, and `boostC a b` is its
    EvC-positive operator square root; for `a²−b²=1` `boostC a b` preserves `t²−x²−gFormC v v`; pure math.
    W3 DECOMPOSE: the GLOBAL polar/KAK assembly (EVERY `g ∈ qvIsomMonoidC` so factors — the operator square
    root of an ARBITRARY `g*g`) + the compact part via CONNECTEDNESS + the GLOBAL reverse KAK surjectivity
    + the full `Spin(9)→SO(9)` exhaustion is childed N67.

  - **★ (N67 LANDED) THE FIRST 10-DIMENSION-MIXING SPECTRAL SQUARE ROOT (an EvC-orthonormal eigenbasis
    MIXING the `(t,x)` plane WITH the octonion block `O Cut`) + THE RANK-3 SPECTRAL OPERATOR `specOp3`,
    over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`
    (`Phys/Algebra/LorentzContinuumSpectralMix.lean`, 24 decls foundations-only, independently
    axiom-audited).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP §N67 priority (i)) + W3 DECOMPOSE: the
    ticket TARGET was the HEAVY group-manifold core (the GLOBAL polar/KAK assembly for an arbitrary `g`,
    connectedness, the GLOBAL reverse KAK surjectivity, the full `Spin(9)→SO(9)` exhaustion); MEASURE-FIRST
    confirmed the full n-dim spectral existence for an arbitrary `g*g` and the connectedness/surjectivity/
    exhaustion each need group-manifold machinery Mathlib lacks over `Cut` — the genuine HEAVY sub-nodes
    (childed N68). The chain had, across N63–N66, the rotated-basis spectral square root `specOp_op_sqrt`
    (general over ANY EvC-orthonormal PAIR), but EVERY concrete spectral witness lived purely in the `(t,x)`
    plane or in block-SEPARATED coordinate blocks — no witness coupled `(t,x)` to `O Cut`, and no spectral
    object existed beyond rank 2. The two immediately-bankable, theory-native STRUCTURAL escalations the
    full existence consumes are exactly: (A) a CONCRETE EvC-orthonormal eigenbasis MIXING the time axis with
    the octonion block, and (B) the rank-2 → rank-3 spectral operator. THE REFRAME: take `mixA := (3/5, 0,
    (4/5)·1)`, `mixB := (4/5, 0, (−3/5)·1)` — EvC-orthonormal via the banked octonion bilinear `gFormC`
    (`(3/5)² + (4/5)²·gFormC 1 1 = 1`, `mixA_norm`/`mixB_norm`/`mix_orth`); then `specOp 4 9 mixA mixB`
    sends the pure-time unit `(1,0,0)` to a vector with octonion component `(−12/5)·1 ≠ 0`
    (`specOp_mix_octBlock`) — the time axis maps INTO the octonion block, IMPOSSIBLE for any block-separated
    `coordDiag3`/`blockDiag`/`boostC`; its positive operator square root `specOp (cutSqrt c₁)(cutSqrt c₂)
    mixA mixB` is read off via N63 `specOp_op_sqrt` (`specOp_mix_op_sqrt`, the FIRST 10-dim-mixing spectral
    square root, concretely `specOp 2 3 mixA mixB` roots `specOp 4 9 mixA mixB`). For (B): `specOp3 l₁ l₂ l₃
    u₁ u₂ u₃ := l₁•projC u₁ + l₂•projC u₂ + l₃•projC u₃` is EvC-self-adjoint (`specOp3_isEvCSymm`, closure
    of `projC` symmetry), EvC-positive-semidefinite for `lᵢ ≥ 0` (`specOp3_nonneg`), composes by squaring
    eigenvalues over an EvC-orthonormal TRIPLE — all three cross terms vanish (`specOp3_comp`) — and has
    positive operator square root `specOp3 (cutSqrt c₁)(cutSqrt c₂)(cutSqrt c₃)` (`specOp3_op_sqrt`), the
    inductive step rank-2 → rank-n, non-vacuously over the time/space/octonion-mixing orthonormal triple
    `{mixA, mixB, mixW3}` (`mixW3 := (0,1,0)`, `specOp3_mix_witness`). PURE linear-algebra + ordered-field
    arithmetic over the derived ℝ `Cut`, the same engine as N56–N66 (two scratch probes + production
    compiled clean ≤9s, all 24 decls foundations-only at first compile, KILL=30s/obligation never approached,
    NO inflated maxHeartbeats / NO native_decide / NO brute; a `w3`→`mixW3` rename resolved a
    `Phys.Algebra.JordanTower` name collision — hygiene, not theory). Costume C98
    (`LorentzContinuumSpectralMixWrongRootCostume`) bites the WRONG 10-dim-mixing spectral root — that
    `specOp 2 7 mixA mixB` is a square root of `specOp 4 9 mixA mixB` (the genuine root is `specOp 2 3 mixA
    mixB`, `mixB` eigenvalue `3`, squared reading `9`); banked `specOp_comp`/`specOp_read₂` give `(specOp 2 7
    mixA mixB)²` reading `7·7 = 49` at `mixB`, against the `specOp 4 9 mixA mixB` reading `9`, so the wrong
    mixing root forces `49 = 9` (distinct from C84 `8=4`, …, C96 `25=30`, C97 `25=9`). Non-vacuity:
    `specOp_mix_octBlock` (the genuine 10-dim coupling) + `specOp_mix_witness`/`specOp3_mix_witness` (concrete
    roots) + `not_specOp_mix_2_6` (teeth, forces `36 = 9`). Words-removable: delete "Lorentz/boost/rotation/
    spectral/eigenspace/eigenvalue/eigenprojection/eigenbasis/diagonal/orthonormal/projection/square-root/
    self-adjoint/positive-semidefinite/isometry/Spin/SO(9)/KAK/polar/Cartan/mixing/dimension" → over the
    derived complete ordered field `Cut` and `O Cut`, for the symmetric positive-definite form `EvC` and the
    `Cut`-linear maps `projC`/`specOp`/`specOp3`: `mixA`,`mixB`,`mixW3` are EvC-orthonormal, `specOp 4 9 mixA
    mixB (1,0,0)` has octonion component `(−12/5)·1`, `specOp (cutSqrt c₁)(cutSqrt c₂) mixA mixB` squares to
    `specOp c₁ c₂ mixA mixB`, `specOp3` is EvC-symmetric, nonneg for `lᵢ ≥ 0`, composes by squaring
    eigenvalues over an orthonormal triple, and `specOp3 (cutSqrt c₁)(cutSqrt c₂)(cutSqrt c₃)` squares back;
    pure math. W3 DECOMPOSE: the FULL n-dim spectral EXISTENCE (an ARBITRARY EvC-self-adjoint operator
    decomposing as `Σᵢ λᵢ Pᵢ`) + the GLOBAL polar/KAK assembly for an arbitrary `g` + connectedness + the
    GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion is childed N68.

  - **★ (N68 LANDED) THE GENERAL RANK-`n` SPECTRAL OPERATOR `specOpN` (the inductive backbone of the full
    n-dim spectral existence) over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`
    (`Phys/Algebra/LorentzContinuumSpectralN.lean`, 22 decls / 15 axiom-audited, foundations-only,
    independently axiom-audited).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP §N68 priority (i)) + W3
    DECOMPOSE: the ticket TARGET was the HEAVY group-manifold core (the FULL n-dim spectral EXISTENCE that
    an ARBITRARY EvC-self-adjoint operator HAS an EvC-orthonormal eigenbasis, the GLOBAL polar/KAK assembly
    for an arbitrary `g`, connectedness, the GLOBAL reverse KAK surjectivity, the full `Spin(9)→SO(9)`
    exhaustion); MEASURE-FIRST confirmed the eigenbasis EXISTENCE for an arbitrary self-adjoint operator over
    `Cut` and the connectedness/surjectivity/exhaustion each need group-manifold machinery Mathlib lacks over
    `Cut` — the genuine HEAVY sub-nodes (childed N69). N63 / N67 banked the spectral operator `Σᵢ λᵢ Pᵢ` and
    its `cutSqrt`-per-eigenprojection square root only at the FIXED ranks 2 and 3 (`specOp`, `specOp3`), each
    a hand-written sum of a fixed number of scaled projections. The immediately-bankable, theory-native
    STRUCTURAL escalation the full existence consumes is exactly the step from a fixed-rank sum to the GENERAL
    rank-`n` spectral operator. THE REFRAME: bundle `EvC` as a `Cut`-linear map in each slot
    (`EvCLeft`/`EvCRight`, from N63 `EvC_add_*`/N58 `EvC_smul_*`) so it commutes with `Finset.sum` via
    `map_sum` (`EvC_sum_left`/`EvC_sum_right`); then `specOpN l u := ∑ i, (l i) • projC (u i)` (`l u : Fin n →
    ·`) is EvC-self-adjoint for EVERY family (`specOpN_isEvCSymm`, closure of `projC` symmetry under `∑`),
    EvC-positive-semidefinite for `∀ i, 0 ≤ l i` (`specOpN_nonneg`, the trunk positivity summed by
    `Finset.sum_nonneg`), and — for a mutually-EvC-orthonormal family `EvC (u i) (u j) = δᵢⱼ` — composes by
    squaring eigenvalues (`specOpN_comp`, every off-diagonal cross term vanishing as the double sum collapses
    to the diagonal via `specOpN_EvC_read`+`Finset.sum_ite_eq`), so its positive operator square root is
    `specOpN (fun i => cutSqrt (c i)) u` for `∀ i, 0 ≤ c i` (`specOpN_op_sqrt`) — the GENERAL n-dim spectral
    square root at ARBITRARY finite rank `n`. Non-vacuously over the concrete time/space/octonion-real/
    octonion-imaginary EvC-orthonormal 4-frame `mix4 := ![mixA, mixB, mixW3, mixW4]` (`mixW4 := (0,0,e₂)` the
    octonion imaginary unit, EvC-orthogonal to `mixA`/`mixB`/`mixW3` via `e2_gFormC_self`/`e2_gFormC_one`/
    `gFormC_zero_left`; `mix4_orthonormal : EvC (mix4 i) (mix4 j) = δᵢⱼ`), `specOpN ![2,3,5,8] mix4` is the
    positive operator square root of `specOpN ![4,9,25,64] mix4` (`specOpN_mix4_witness`, rank 4, an
    eigenbasis spanning all four sectors). And the general law SUBSUMES the banked rank-2 `specOp` (N63) and
    rank-3 `specOp3` (N67) as its `n=2,3` instances (`specOpN_eq_specOp`/`specOpN_eq_specOp3`, via
    `Fin.sum_univ_two`/`_three`+`rfl`) — ONE law, the prior spectral objects its special cases. PURE
    linear-algebra over `Finset.sum`/`Module.End`/`LinearMap`/`map_sum` (standard Mathlib MACHINERY on the
    DERIVED objects) + ordered-field arithmetic over the derived ℝ `Cut`, the same engine as N56–N67 (the
    scratch probe — the full decl set — + production compiled clean ≤32s, all 15 audited decls foundations-only
    at first compile, KILL=30s/obligation never approached, NO inflated maxHeartbeats / NO native_decide /
    NO brute; no name collisions). Costume C99 (`LorentzContinuumSpectralNWrongRootCostume`) bites the WRONG
    rank-4 n-term spectral root — that `specOpN ![2,3,5,6] mix4` is a square root of `specOpN ![4,9,25,64]
    mix4` (the genuine root is `specOpN ![2,3,5,8] mix4`, the `mixW4` eigenvalue `8`, squared reading `64`);
    banked `specOpN_comp`/`specOpN_read` give `(specOpN ![2,3,5,6] mix4)²` reading `6·6 = 36` at the `mix4 3`
    (= mixW4) eigenblock, against the `specOpN ![4,9,25,64] mix4` reading `64`, so the wrong rank-4 root forces
    `36 = 64` (distinct from C84 `8=4`, …, C97 `25=9`, C98 `49=9`). Words-removable: delete "Lorentz/boost/
    rotation/spectral/eigen*/diagonal/orthonormal/projection/square-root/self-adjoint/positive-semidefinite/
    isometry/Spin/SO(9)/KAK/polar/Cartan/mixing/dimension/rank" → over the derived complete ordered field
    `Cut` and `O Cut`, for the symmetric positive-definite form `EvC` and `projC u := p ↦ (EvC u p)•u`, the
    `Fin n`-indexed `specOpN l u := ∑ i, (l i)•projC (u i)` is EvC-symmetric, nonneg for `∀ i, 0 ≤ l i`,
    composes to `specOpN (l·l) u` over a family with `EvC (u i) (u j) = δᵢⱼ`, and `specOpN (cutSqrt∘c) u`
    squares to `specOpN c u`; concretely `specOpN ![2,3,5,8] mix4` squares to `specOpN ![4,9,25,64] mix4`; and
    `specOpN` at `n=2,3` equals `specOp`/`specOp3`; pure math. W3 DECOMPOSE: the FULL n-dim spectral EXISTENCE
    (an arbitrary EvC-self-adjoint operator HAS an EvC-orthonormal eigenbasis, so equals `specOpN c u` for some
    `c,u`) + the GLOBAL polar/KAK assembly for an arbitrary `g` + connectedness + the GLOBAL reverse KAK
    surjectivity + the full `Spin(9)→SO(9)` exhaustion is childed N69.

  - **★ (N69 LANDED) THE CONCRETE EIGENBASIS-EXISTENCE WITNESS — a TIME↔OCTONION-MIXING operator
    GIVEN IN COORDINATE (NON-EIGEN) FORM, proved to BE the rank-`n` spectral operator over an explicit
    EvC-orthonormal mixing eigen-family, so N68 `specOpN_op_sqrt` reads off its positive operator
    square root for an operator NOT presented in eigen-form, over the DERIVED ℝ `Cut` and the terminal
    algebra `O Cut := CD (H Cut)` (`Phys/Algebra/LorentzContinuumSpectralExist.lean`, 7 decls
    foundations-only, independently axiom-audited).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP §N69
    priority (i)) + W3 DECOMPOSE: the ticket TARGET was the HEAVY group-manifold core (the FULL n-dim
    spectral EXISTENCE for an ARBITRARY EvC-self-adjoint operator, the GLOBAL polar/KAK assembly,
    connectedness, the GLOBAL reverse KAK surjectivity, the full `Spin(9)→SO(9)` exhaustion);
    MEASURE-FIRST confirmed the existence for an ARBITRARY (not concretely-chosen) operator over `Cut`
    and the connectedness/surjectivity/exhaustion each need group-manifold machinery Mathlib lacks over
    `Cut` — the genuine HEAVY sub-nodes (childed N70). N63–N68 banked the spectral operator `Σᵢ λᵢ Pᵢ`
    and its `cutSqrt`-per-eigenprojection square root at every finite rank GIVEN a mutually-EvC-orthonormal
    eigen-FAMILY — i.e. for operators ALREADY PRESENTED IN EIGEN-FORM (built as sums of scaled `projC`s).
    The genuine LEVER from "the diagonal law holds at every rank" (N68, banked) to "an arbitrary operator
    IS in that diagonal form" (the existence content) is to take a self-adjoint operator GIVEN IN
    COORDINATE (NON-EIGEN) FORM and PROVE it equals `specOpN c u` for an explicit EvC-orthonormal family.
    N64/N65 did this for the PURE `(t,x)` plane (`txOp`); N67's `mixA`/`mixB` coupled time↔octonion but
    the spectral object was BUILT from projections (already in eigen-form). THE REFRAME: define
    `txMix : Module.End Cut STVC` by the coordinate action (`r := gFormC 1 v` the octonion-real part)
    `(t,x,v) ↦ ((29/5)t + (12/5)r, 25x, ((12/5)t + (36/5)r)·1₍O₎)` — a symmetric `Cut`-linear map coupling
    time to the octonion-real direction `1₍O₎` (shared off-diagonal `12/5`), NO `projC`; the banked mixing
    3-frame `mix3 := ![mixA,mixB,mixW3]` is EvC-orthonormal (`mix3_orthonormal`, the nine pairings from
    N67); then `txMix = specOp3 9 4 25 mixA mixB mixW3` (`txMix_eq_specOp3`, the coordinate components
    matching the spectral action via `specOp3_apply` + the overlaps `EvC mixA (t,x,v) = (3/5)t+(4/5)r`,
    `EvC mixB (t,x,v) = (4/5)t−(3/5)r`, `EvC mixW3 (t,x,v) = x`) `= specOpN ![9,4,25] mix3`
    (`txMix_eq_specOpN`, through N68 `specOpN_eq_specOp3`); with `txMix` now in `specOpN` form, N68
    `specOpN_op_sqrt` reads off `specOpN ![3,2,5] mix3` (eigenvalues `cutSqrt 9=3, cutSqrt 4=2,
    cutSqrt 25=5`) as its positive operator square root (`txMix_op_sqrt`). PURE linear-algebra +
    ordered-field arithmetic over the derived ℝ `Cut`, the same engine as N56–N68 (one scratch probe +
    production compiled clean ≤13s, all 7 decls foundations-only at first compile, KILL=30s/obligation
    never approached, NO inflated maxHeartbeats / NO native_decide / NO brute; no name collisions;
    non-vacuity independently checked — `txMix (1,0,0)` has octonion component `(12/5)·1 ≠ 0`, genuinely
    10-dim-mixing, IMPOSSIBLE for any block-separated operator). Costume C100
    (`LorentzContinuumSpectralExistWrongRootCostume`) bites the WRONG square root of the coordinate-given
    witness — that `specOpN ![3,2,6] mix3` is a square root of `txMix` (the genuine root is
    `specOpN ![3,2,5] mix3`, the `mixW3` eigenvalue `5`, squared reading `25`); banked
    `specOpN_comp`/`specOpN_read` give `(specOpN ![3,2,6] mix3)²` reading `6·6 = 36` at the `mix3 2`
    (= mixW3) eigenblock, against — through `txMix = specOpN ![9,4,25] mix3` — the `txMix` reading `25`,
    so the wrong root forces `36 = 25` (distinct from C84 `8=4`, …, C98 `49=9`, C99 `36=64`).
    Words-removable: delete "Lorentz/boost/rotation/spectral/eigen*/diagonal/orthonormal/mixing/time/
    octonion-real/existence/square-root/self-adjoint/positive-semidefinite/isometry/Spin/SO(9)/KAK/polar/
    Cartan/dimension/rank" → over the derived complete ordered field `Cut` and `O Cut`, for the symmetric
    bilinear form `EvC` and the explicit `Cut`-linear map `txMix (t,x,v) = ((29/5)t + (12/5)·gFormC 1 v,
    25x, ((12/5)t + (36/5)·gFormC 1 v)·1)`: `txMix = specOpN ![9,4,25] ![mixA,mixB,mixW3]` and
    `specOpN ![3,2,5] ![mixA,mixB,mixW3]` squares to `txMix`; pure math. W3 DECOMPOSE: the FULL n-dim
    spectral EXISTENCE for an ARBITRARY EvC-self-adjoint operator + the GLOBAL polar/KAK assembly for an
    arbitrary `g` + connectedness + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)`
    exhaustion is childed N70.

  - **★ (N70 LANDED) THE DEFLATION / PEEL-OFF ENGINE — the inductive STEP of the full spectral
    existence theorem (peel one eigenpair, restrict to its EvC-orthogonal complement, recurse), over the
    DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)` (`Phys/Algebra/LorentzContinuumDeflation.lean`,
    11 decls foundations-only, independently axiom-audited).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP
    §N70 priority (i)) + W3 DECOMPOSE: the ticket TARGET was the HEAVY group-manifold core (the FULL n-dim
    spectral EXISTENCE for an ARBITRARY operator, the GLOBAL polar/KAK assembly, connectedness, the GLOBAL
    reverse KAK surjectivity, the full `Spin(9)→SO(9)` exhaustion); MEASURE-FIRST confirmed the existence for
    an ARBITRARY operator over `Cut` needs the eigenvalue/eigenvector EXTRACTION (no Mathlib analogue) and the
    connectedness/surjectivity/exhaustion each need group-manifold machinery Mathlib lacks over `Cut` — the
    genuine HEAVY sub-nodes (childed N71). N63–N69 banked the FORWARD direction of the spectral theorem: GIVEN
    an EvC-orthonormal eigen-family (or, in N69, a concrete coordinate operator shown to BE diagonal over a
    given family), the diagonal operator `Σᵢ λᵢ Pᵢ` and its `cutSqrt`-per-eigenprojection square root, at every
    finite rank. The MISSING HALF the existence proof actually RUNS on is the REVERSE STEP: the spectral
    theorem is proved by INDUCTION on dimension, and its inductive step is DEFLATION — peel one eigenpair off,
    restrict to its EvC-orthogonal complement, recurse on a strictly smaller space. THE REFRAME: define
    `deflateC g l u := g − l • projC u` (the banked N63 EvC-orthogonal eigenprojection). The three structural
    facts that ARE the complete inductive step: (1) `deflateC_isEvCSymm` — EvC-self-adjointness PRESERVED for
    any EvC-self-adjoint `g` (via `IsEvCSymm_sub`, the closure under `−` completing N63's add/smul, through
    `EvC_sub_left`/`EvC_sub_right` = `map_sub` of the bundled N68 `EvCLeft`/`EvCRight`); (2)
    `deflateC_eigen_kills` — ANNIHILATES the peeled eigenvector for a UNIT eigenpair (`EvC u u = 1`, `g u =
    l • u` ⟹ `deflateC g l u u = 0`); (3) ★★ `deflateC_image_orth` — THE RECURSION ENABLER: the entire image
    is EvC-orthogonal to `u` (`EvC u (deflateC g l u w) = 0` for ALL `w`, by the preserved self-adjointness
    through `deflateC_eigen_kills`), so the EvC-orthogonal complement of `u` is an INVARIANT subspace and the
    existence proof descends by induction on dimension. The RANK-`n` reduction `deflateC_specOpN` turns the
    crank visibly — `deflateC (specOpN l u) (l k) (u k) = specOpN (Function.update l k 0) u`, deflating the
    rank-`n` spectral operator at its `k`-th eigenpair zeroes coefficient `k` (rank-`n` → rank-`(n−1)`). PURE
    linear algebra + ordered-field arithmetic over the derived ℝ `Cut`, the same engine as N56–N69 (one scratch
    probe + production compiled clean ≤20s, all 11 decls foundations-only at first compile, KILL=30s/obligation
    never approached, NO inflated maxHeartbeats / NO native_decide / NO brute; no name collisions; non-vacuity
    independently checked — `deflateC txMix 9 mixA = specOpN ![0,4,25] mix3` peels the `mixA` eigenvalue `9`
    off N69's genuine 10-dim-mixing coordinate witness `txMix`, lowering its effective rank to `{mixB(4),
    mixW3(25)}`). Costume C101 (`LorentzContinuumDeflationWrongReadCostume`) bites a WRONG deflation reading —
    that the `mixA` eigenvalue is left at `3` not removed (the `mix3 0` eigenblock of `deflateC txMix 9 mixA`
    reads `3`); banked `deflateC_txMix_fst` + `specOpN_read` over `mix3_orthonormal` give the peeled coefficient
    `0`, so the wrong claim forces `0 = 3` (distinct from C84 `8=4`, …, C99 `36=64`, C100 `36=25`).
    Words-removable: delete "Lorentz/boost/spectral/eigen*/deflation/peel-off/diagonal/orthonormal/self-adjoint/
    positive-semidefinite/isometry/Spin/SO(9)/KAK/polar/Cartan/invariant/recursion/dimension/rank" → over the
    derived complete ordered field `Cut` and `O Cut`, for the symmetric bilinear form `EvC`, `projC u := p ↦
    (EvC u p)•u`, and `deflateC g l u := g − l • projC u`: `deflateC g l u` is EvC-symmetric when `g` is; for
    `EvC u u = 1` and `g u = l • u` it sends `u` to `0` and `EvC u (deflateC g l u w) = 0` for all `w`; and
    `deflateC (specOpN l u) (l k) (u k) = specOpN (Function.update l k 0) u`, with `deflateC txMix 9 mixA =
    specOpN ![0,4,25] ![mixA,mixB,mixW3]`; pure math. W3 DECOMPOSE: the FULL n-dim spectral EXISTENCE for an
    ARBITRARY operator (the eigenpair EXTRACTION that SEEDS this deflation recursion) + the GLOBAL polar/KAK
    assembly for an arbitrary `g` + connectedness + the GLOBAL reverse KAK surjectivity + the full
    `Spin(9)→SO(9)` exhaustion is childed N71.

  - **★ (N71 LANDED) THE SEED EIGENPAIR EXTRACTION — the genuine VECTOR eigen-equation
    `specOpN l u (u k) = (l k) • (u k)` that DRIVES the N70 deflation induction, and the FIRST NON-VACUOUS
    firing of the N70 deflation / peel-off engine on a concrete operator, over the DERIVED ℝ `Cut` and the
    terminal algebra `O Cut := CD (H Cut)` (`Phys/Algebra/LorentzContinuumEigenExtract.lean`, 8 decls
    foundations-only, independently axiom-audited).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP §N71
    priority (i)) + W3 DECOMPOSE: the ticket TARGET was the HEAVY group-manifold core (the FULL n-dim
    spectral EXISTENCE for an ARBITRARY operator with NO given eigenbasis, the full deflation induction to
    general `n`, the GLOBAL polar/KAK assembly, connectedness, the GLOBAL reverse KAK surjectivity, the full
    `Spin(9)→SO(9)` exhaustion); MEASURE-FIRST confirmed those each need group-manifold machinery Mathlib
    lacks over `Cut` (the characteristic-equation / fixed-point seed extraction from an ARBITRARY operator,
    the Lie-group integration / connectedness over `Cut`) — the genuine HEAVY sub-nodes (childed N72). THE
    GAP this node closed: N68 banked only the eigenblock QUADRATIC reader `specOpN_read : EvC (specOpN l u
    (u k)) (u k) = l k` (the scalar value at an eigenblock); the chain NEVER banked the genuine VECTOR
    eigen-equation, yet N70's deflation engine (`deflateC_eigen_kills`/`deflateC_image_orth`, the entire
    inductive step) BOTH take `g u = l • u` as a HYPOTHESIS — and nothing in N49–N70 produced a concrete
    operator satisfying it, so the deflation engine, though proved, had never FIRED: the joint between the
    rank-`n` spectral operator (N68) / the concrete witness `txMix` (N69) and the deflation step (N70) was
    missing. THE REFRAME (THE ONE LAW): the eigen-equation IS the orthonormality collapse of the spectral
    sum to its diagonal term — `specOpN l u (u k) = ∑ i, (l i · EvC (u i) (u k)) • u i = (l k) • (u k)`
    (`specOpN_eigen`, via `Finset.sum_eq_single` on the orthonormality matrix `EvC (u i) (u j) = δᵢⱼ`).
    Through N69's existence identification `txMix = specOpN ![9,4,25] mix3`, the concrete coordinate operator
    `txMix` inherits the VECTOR eigenpairs `(9,mixA)`, `(4,mixB)`, `(25,mixW3)` (`txMix_eigen_mixA/_mixB/
    _mixW3`) — exactly the hypothesis the N70 deflation engine takes — so `deflateC_eigen_kills` and
    `deflateC_image_orth` FIRE NON-VACUOUSLY on `txMix` (`txMix_deflate_kills_mixA : deflateC txMix 9 mixA
    mixA = 0`; `txMix_deflate_image_orth : ∀ w, EvC mixA (deflateC txMix 9 mixA w) = 0` — the EvC-orthogonal
    complement of `mixA` is an INVARIANT subspace of the deflated concrete operator), and the INDUCTIVE
    DESCENT is realized: after peeling `mixA`, the eigenpair `(4,mixB)` SURVIVES (`txMix_deflate_eigen_mixB :
    deflateC txMix 9 mixA mixB = 4•mixB`, through N70's rank-`n` reduction `deflateC_txMix_fst` +
    `specOpN_eigen`) — one full crank of the existence induction on a concrete 10-dim-mixing operator. PURE
    linear algebra + ordered-field arithmetic over the derived ℝ `Cut`, the same engine as N56–N70 (one
    scratch probe with all 6 theorems compiled clean 8.6s + production ≤8s, all 8 decls foundations-only at
    first compile, KILL=30s/obligation never approached, NO inflated maxHeartbeats / NO native_decide / NO
    brute; no name collisions). Costume C102 (`LorentzContinuumEigenExtractWrongEigenvalueCostume`) bites a
    WRONG seed eigenpair — that the `mixA` eigenvalue of `txMix` is `7` (the `mix3 0` eigenblock reads `7`);
    banked `txMix_eq_specOpN` + `specOpN_read` over `mix3_orthonormal` give the genuine eigenvalue `9`, so
    the wrong claim forces `9 = 7` (distinct from C84 `8=4`, …, C100 `36=25`, C101 `0=3`). Words-removable:
    delete "Lorentz/boost/spectral/eigen*/deflation/peel-off/diagonal/orthonormal/self-adjoint/invariant/
    mixing/dimension/rank/seed/extraction/descent" → over the derived complete ordered field `Cut` and
    `O Cut`, for the symmetric bilinear form `EvC`, `specOpN l u := ∑ i, (l i)•projC (u i)`, and `deflateC g
    l u := g − l•projC u`: for a family with `EvC (u i) (u j) = δᵢⱼ`, `specOpN l u (u k) = (l k)•(u k)`;
    `txMix mixA = 9•mixA`, `txMix mixB = 4•mixB`, `txMix mixW3 = 25•mixW3`; `deflateC txMix 9 mixA mixA = 0`;
    `EvC mixA (deflateC txMix 9 mixA w) = 0` for all `w`; and `deflateC txMix 9 mixA mixB = 4•mixB`; pure
    math. W3 DECOMPOSE: the FULL n-dim spectral EXISTENCE for an ARBITRARY operator with NO given eigenbasis
    (the characteristic-equation / fixed-point seed extraction) + the full deflation induction to general `n`
    + the GLOBAL polar/KAK assembly for an arbitrary `g` + connectedness + the GLOBAL reverse KAK
    surjectivity + the full `Spin(9)→SO(9)` exhaustion is childed N72.

  - **★ (N72 LANDED) THE CONSTRUCTED SEED EIGENPAIR EXTRACTION FROM AN OCTONION-COUPLING COORDINATE
    OPERATOR — the discriminant-radical eigenvector CONSTRUCTION for an operator that TOUCHES THE
    OCTONION BLOCK, then the N70 deflation engine FIRING on the CONSTRUCTED seed, over the DERIVED ℝ
    `Cut` and the terminal algebra `O Cut := CD (H Cut)`
    (`Phys/Algebra/LorentzContinuumOctSeedExtract.lean`, 19 decls foundations-only, independently
    axiom-audited).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP §N72 priority (i)) + W3 DECOMPOSE: the
    ticket TARGET was the HEAVY group-manifold core (the FULL n-dim spectral EXISTENCE for an ARBITRARY
    operator with NO given eigenbasis at general dimension, the full deflation induction to general `n`,
    the GLOBAL polar/KAK assembly, connectedness, the GLOBAL reverse KAK surjectivity, the full
    `Spin(9)→SO(9)` exhaustion); MEASURE-FIRST confirmed those each need group-manifold machinery
    Mathlib lacks over `Cut` (the seed at GENERAL dimension, Lie-group integration / topology of
    `SO⁺(1,9)`, the octonionic spinor cover) — the genuine HEAVY sub-nodes (childed N73). THE GAP this
    node closed: N71 fired the deflation engine on `txMix`, a coordinate operator whose eigenbasis
    `{mixA,mixB,mixW3}` was a FIXED RATIONAL frame GIVEN in advance — the eigenvector was handed over,
    not CONSTRUCTED; N65's `txOp_eq_specOp_rot` constructs an eigenbasis from the discriminant radical
    `R = cutSqrt(δ²+b²)` but only for a `(t,x)`-plane operator `txOp` that LEAVES the octonion block
    fixed. THE REFRAME (THE ONE LAW): the ROADMAP §N72 priority (i) names the exact lever — "extend that
    construction to an operator that ALSO touches the octonion block." Define the octonion-coupling
    coordinate operator `toMix a b d := (t,x,v) ↦ (a·t + b·gFormC 1 v, 0, (b·t + d·gFormC 1 v)•1₍O₎)`
    (`toMix_octBlock`: the pure-time unit maps to `b•1₍O₎` in the octonion block — the genuine 10-dim
    mixing on the time ↔ octonion-real plane, impossible for any block-separated operator); CONSTRUCT
    its EvC-orthonormal eigenbasis from the radical over the octonion-coupling rotation pair
    `omixA c s := (c,0,s•1₍O₎)`, `omixB c s := (−s,0,c•1₍O₎)` (the octonion-sector analogue of N65's
    `(t,x)`-plane `rotA`/`rotB`), proving the CROWN `toMix_eq_specOp_omix : b ≠ 0 → toMix a b d =
    specOp ((a+d)/2+R)((a+d)/2−R) (omixA (b/nrm)((R−δ)/nrm))(omixB …)` (the eigenvectors ROTATE with the
    parameters through `cutSqrt`, NO fixed eigenbasis), the constructed VECTOR seed eigenpair
    `toMix_seed_eigen : toMix a b d u₊ = ((a+d)/2+R) • u₊` (through the CROWN + the rank-2 vector
    eigen-equation `specOp_eigen₁`), the general operator square root `toMix_op_sqrt_gen`, and FIRING
    the N70 deflation engine on the CONSTRUCTED seed (`toMix_deflate_kills_seed : deflateC (toMix a b d)
    λ₊ u₊ u₊ = 0`; `toMix_deflate_image_orth : ∀ w, EvC u₊ (deflateC (toMix a b d) λ₊ u₊ w) = 0` — the
    EvC-orthogonal complement of the CONSTRUCTED `u₊` is an INVARIANT subspace). The escalation over
    N71: the seed eigenpair is now CONSTRUCTED from the characteristic-equation discriminant of an
    operator NOT pre-identified with `specOpN`, for an operator that genuinely mixes time and octonion
    sectors — exactly the "seed eigenpair EXTRACTION from a coordinate-given operator" the existence
    induction needs as its entry, on the hardest (octonion-coupling) block. PURE linear algebra +
    ordered-field arithmetic over the derived ℝ `Cut`, the same engine as N56–N71 (one scratch probe
    with all theorems compiled clean ~6s user + production ≤9s, all 19 decls foundations-only at first
    compile, KILL=30s/obligation never approached, NO inflated maxHeartbeats / NO native_decide / NO
    brute; no name collisions). Costume C103 (`LorentzContinuumOctSeedExtractWrongSeedEigenvalueCostume`)
    bites a WRONG constructed-seed eigenvalue — that the constructed `omixA (4/5)(3/5)` eigenvalue of
    `toMix 73 36 52` is `40` (the constructed `λ₊` eigenblock reads `40`); banked
    `toMix_73_36_52_diag` + `specOp_read₁` over the constructed-pair orthonormality give the genuine
    eigenvalue `100`, so the wrong claim forces `100 = 40` (distinct from C84 `8=4`, …, C101 `0=3`,
    C102 `9=7`). Words-removable: delete "Lorentz/boost/rotation/spectral/eigen*/deflation/peel-off/
    diagonal/orthonormal/self-adjoint/positive-semidefinite/isometry/Spin/SO(9)/KAK/polar/Cartan/
    invariant/mixing/coupling/discriminant/seed/extraction/descent" → over the derived complete ordered
    field `Cut` and `O Cut`, for the symmetric bilinear form `EvC`, `toMix a b d := (t,x,v) ↦
    (a·t+b·gFormC 1 v, 0, (b·t+d·gFormC 1 v)•1₍O₎)`, `omixA c s := (c,0,s•1₍O₎)`, `omixB c s :=
    (−s,0,c•1₍O₎)`: for `c²+s²=1` `{omixA,omixB}` is EvC-orthonormal; `specOp l₁ l₂ (omixA c s)(omixB c s)
    = toMix (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)`; for `b ≠ 0` `toMix a b d = specOp ((a+d)/2+R)((a+d)/2−R)
    (omixA (b/nrm)((R−δ)/nrm))(omixB …)` with `R := cutSqrt(δ²+b²)`, `toMix a b d (omixA …) =
    ((a+d)/2+R) • omixA …`, and the deflated map sends that vector to `0` with image EvC-orthogonal to
    it; concretely `toMix 73 36 52 = specOp 100 25 (omixA (4/5)(3/5))(omixB (4/5)(3/5))` with positive
    square root `specOp 10 5 …`; pure math. W3 DECOMPOSE: the FULL n-dim spectral EXISTENCE at GENERAL
    dimension `n` (the characteristic-equation route beyond a single 2×2 block) + the full deflation
    induction to general `n` + the GLOBAL polar/KAK assembly for an arbitrary `g` + connectedness + the
    GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion is childed N73.

  - **★ (N73 LANDED) THE FIRST CLOSED MULTI-STEP DEFLATION DESCENT — assembling the N70/N71/N72 deflation
    engine into a closed extract→deflate→recurse loop that TERMINATES at the zero operator, over the DERIVED
    ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`
    (`Phys/Algebra/LorentzContinuumDeflateInduct.lean`, 10 decls foundations-only, independently
    axiom-audited; gate D0–D6 GREEN, 1186 audited theorems, +10 over N72's 1176).** THE W1 REFRAME + W9
    MEASURE-FIRST (ROADMAP §N73 priority (i)) + W3 DECOMPOSE: the ticket TARGET was the HEAVY group-manifold
    core (the FULL n-dim spectral EXISTENCE at general dimension — the seed at general dimension + the
    closed induction DRIVING `∀ g, ∃ c u, g = specOpN c u` — the GLOBAL polar/KAK assembly, connectedness,
    the GLOBAL reverse KAK surjectivity, the full `Spin(9)→SO(9)` exhaustion); MEASURE-FIRST confirmed the
    seed at GENERAL dimension (the characteristic-cubic route) and the group-manifold integration/topology/
    cover each need machinery Mathlib lacks over `Cut` — the genuine HEAVY sub-nodes (childed N74). THE GAP
    this node closed: N70 banked the SINGLE inductive step `deflateC_specOpN`; N71/N72 each FIRED the
    deflation engine exactly ONCE (peel one eigenpair, exhibit that the next survives). The chain NEVER
    CHAINED the deflation engine to its TERMINATION — the extract→deflate→recurse loop the full spectral
    existence runs on had never been assembled even at fixed small rank. THE REFRAME (THE ONE LAW): the
    descent IS iterated subtraction of the banked EvC-orthogonal eigenprojections `projC` (N63) — each peel
    removes one `l k • projC (u k)` term from the spectral sum `specOpN = ∑ᵢ lᵢ•projC(uᵢ)` (N68) via the
    N70 rank-`n` reduction `deflateC_specOpN`; after all `n` peels the sum is empty → the zero operator.
    BANKED: the GENERAL termination base case `specOpN_zero : specOpN (fun _ => 0) u = 0`; the GENERAL
    partial-deflation coefficient family `zeroOn S l := fun i => if i ∈ S then 0 else l i` (`S` = the
    already-peeled indices) with the CLOSED-INDUCTION SKELETON `deflateC_specOpN_zeroOn : k ∉ S →
    deflateC (specOpN (zeroOn S l) u) (l k) (u k) = specOpN (zeroOn (insert k S) l) u` (peeling one more
    index zeroes one more coefficient, indexed by a growing `Finset`); the terminal state
    `specOpN_zeroOn_univ : specOpN (zeroOn univ l) u = 0`; and — turning the crank to its END on N69's
    genuine 10-dim-mixing witness `txMix` (eigenvalues `9,4,25` over `mix3 = ![mixA,mixB,mixW3]`) — the
    concrete steps `deflateC_specOpN_step2`/`_step3` (peel `mixB(4)`, then `mixW3(25)`), the
    surviving-eigenpair honesty `deflateC_step2_survive : deflateC (specOpN ![0,4,25] mix3) 4 mixB mixW3 =
    25•mixW3` (W8 anti-vacuity — `mixW3` genuinely survives the second peel with its true eigenvalue), and
    the HEADLINE `txMix_full_descent : deflateC (deflateC (deflateC txMix 9 mixA) 4 mixB) 25 mixW3 = 0`
    (peel all three eigenpairs and the operator VANISHES — the first concrete extract→deflate→recurse loop
    closed to its termination). PURE `Finset.sum` bookkeeping over the banked `projC`/`specOpN`/`deflateC`
    + `EvC` over the derived ℝ `Cut`, the same engine as N56–N72 (one scratch probe with all 9 theorems
    compiled clean 9.6s + production ≤15s, all 10 decls foundations-only at first compile, KILL=30s/
    obligation never approached, NO inflated maxHeartbeats / NO native_decide / NO brute; no name
    collisions). Costume C104 (`LorentzContinuumDeflateInductWrongSurvivingEigenvalueCostume`) bites a
    WRONG surviving eigenvalue — that after peeling `mixA(9)` and `mixB(4)`, the read self-overlap of the
    surviving `mixW3` direction is `11`; banked `deflateC_step2_survive` + `EvC_smul_left` + `mixW3_norm`
    give the genuine `25 * 1 = 25`, so the wrong claim forces `25 = 11` (distinct from C84 `8=4`, …,
    C102 `9=7`, C103 `100=40`). Words-removable: delete "Lorentz/boost/rotation/spectral/eigen*/deflation/
    peel-off/descent/diagonal/orthonormal/self-adjoint/invariant/mixing/dimension/rank/seed/extraction/
    induction/termination" → over the derived complete ordered field `Cut` and `O Cut`, for the `Cut`-linear
    `specOpN l u := ∑ i, (l i)•projC (u i)` and `deflateC g l u := g − l•projC u`: `specOpN (fun _ => 0) u
    = 0`; for `k ∉ S`, `deflateC (specOpN (zeroOn S l) u) (l k) (u k) = specOpN (zeroOn (insert k S) l) u`;
    `specOpN (zeroOn univ l) u = 0`; the concrete steps over `mix3 = ![mixA,mixB,mixW3]`; and
    `deflateC (deflateC (deflateC txMix 9 mixA) 4 mixB) 25 mixW3 = 0`; pure math. W3 DECOMPOSE: the seed
    eigenpair EXTRACTION at GENERAL dimension (the characteristic-cubic route beyond a single 2×2 block) +
    the closed descent assembled into a general induction on `n` DRIVING the full existence + the GLOBAL
    polar/KAK assembly for an arbitrary `g` + connectedness + the GLOBAL reverse KAK surjectivity + the full
    `Spin(9)→SO(9)` exhaustion is childed N74.

  - **★ (N74 LANDED — THE GENERAL ITERATED DEFLATION DESCENT AT ARBITRARY RANK) THE SEED EIGENPAIR
    EXTRACTION AT GENERAL
    DIMENSION (the characteristic-cubic route beyond the 2×2 block) + assembling the now-CLOSED deflation
    descent into a general induction on `n` DRIVING THE FULL n-DIM SPECTRAL EXISTENCE (`∀ g, ∃ c u, g =
    specOpN c u`) + THE GLOBAL POLAR/KAK ASSEMBLY FOR AN ARBITRARY ISOMETRY + CONNECTEDNESS + THE GLOBAL
    REVERSE KAK SURJECTIVITY (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`) + the full
    `Spin(9)→SO(9)` exhaustion, childed from N73.**
    N49–N73 banked, over the derived ℝ `Cut`: BOTH one-parameter generator families (`boostOPS`,
    `rotGenSetC`), the TWO-SIDED Moufang/`Spin(9)` generator `biMulFun u u'`, the EXTENDED generated group
    `genIsomMonoidC2` with FORWARD soundness (N55), the BORN POSITIVITY / (1,9) signature (N56), the SCALAR
    square root `cutSqrt` (N57), the INFINITESIMAL CARTAN split `EvC` (N58), the OPERATOR form-adjoint with
    `g*∘g ⪰ 0` (N59), the operator square root in the scalar/2-block/octonion-internal/rotated-basis/
    equal-diagonal/full-unequal-diagonal cases (N60–N65), a COMPLETE concrete polar factorization
    `g = k·exp(p)` of a composite isometry (N66), the FIRST 10-dim-MIXING spectral square root + the RANK-3
    spectral operator `specOp3` (N67), the GENERAL rank-`n` spectral operator `specOpN` with its
    composition/square-root at arbitrary rank + the rank-4 mixing witness + the subsumption of the rank-2/3
    objects (N68), the FIRST CONCRETE EIGENBASIS-EXISTENCE WITNESS `txMix` PROVED to BE
    `specOpN ![9,4,25] ![mixA,mixB,mixW3]` with its square root read off (N69), the DEFLATION / PEEL-OFF
    ENGINE — the inductive STEP of the spectral existence theorem (N70), the SEED EIGENPAIR EXTRACTION —
    the genuine VECTOR eigen-equation `specOpN_eigen` + the first NON-VACUOUS firing of the deflation
    engine on a concrete operator with a GIVEN rational eigenbasis (N71), the CONSTRUCTED SEED EIGENPAIR
    EXTRACTION from an octonion-COUPLING coordinate operator — `toMix_eq_specOp_omix`/`toMix_seed_eigen`/
    `toMix_deflate_kills_seed`/`toMix_deflate_image_orth` (N72), AND NOW (N73) the FIRST CLOSED MULTI-STEP
    DEFLATION DESCENT — the general termination `specOpN_zero`, the closed inductive skeleton
    `deflateC_specOpN_zeroOn` over a growing peeled-index `Finset`, the terminal state
    `specOpN_zeroOn_univ`, and the FULL 3-step concrete descent `txMix_full_descent` of the 10-dim-mixing
    witness to the zero operator. THE HEAVY CORE that remains — the genuine group-manifold work — is:
    (i) the seed eigenpair EXTRACTION at GENERAL dimension: the existence of ONE eigenpair for an arbitrary
    EvC-self-adjoint operator on an `n`-dim space (the characteristic-cubic route beyond a single 2×2
    block — an eigenvalue as a cubic root over `Cut`, an eigenvector EvC-orthogonal to the rest), the
    missing SEED at dimension ≥ 3; (ii) ASSEMBLING the now-closed descent (N73) into a GENERAL induction on
    dimension over `deflateC` that DRIVES the full existence — that an ARBITRARY EvC-self-adjoint
    EvC-positive-semidefinite operator HAS an EvC-orthonormal eigenbasis (so EQUALS `specOpN c u` for some
    `c,u`); (iii) the GLOBAL polar/KAK assembly: that EVERY `g ∈ qvIsomMonoidC` factors as `k·exp(p)` via
    the operator square root of an arbitrary `g*g`, then the compact-part read-off `k = g·exp(p)⁻¹` and
    `k*∘k = id` for the GENERAL `g`; (iv) the compact part `k` via CONNECTEDNESS of the isometry group over
    `Cut` (no Mathlib topology of `SO⁺(1,9)`); (v) the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on
    the connected component `≤ genIsomMonoidC2`); (vi) the full `Spin(9)→SO(9)` exhaustion (every spacelike
    rotation a finite product of `biMulFun` bimultiplications, the `2:1` cover). Mathlib has NO `SO⁺(1,9)`,
    no octonionic spinor cover, no Lie-group integration over `Cut`. MEASURE FIRST + reframe through the
    trunk — the immediately-bankable sub-pieces to MEASURE FIRST: (i) the seed eigenpair EXTRACTION for an
    arbitrary EvC-self-adjoint operator on a 3-dim space (the characteristic-cubic route producing ONE
    eigenpair — the existence-of-one-eigenpair lever at dimension 3, the missing SEED beyond the 2×2 block
    now that the closed descent N73 is banked to consume it); (ii) the general induction on `n` over the
    now-closed descent assembling the full existence once the seed is in hand (an `n`-step `Finset`-indexed
    descent terminating at `specOpN_zeroOn_univ`, the `deflateC_specOpN_zeroOn` skeleton iterated); (iii) a
    CONCRETE biMulFun 2-plane `SO(9)` reachability — a specific 2-plane rotation as a finite product of the
    banked `biMulFun` two-sided generators; (iv) the GLOBAL polar assembly for an arbitrary `g` once the
    n-dim existence is in hand. If the seed at general dimension / the full existence induction / the global
    polar assembly / reverse surjectivity / connectedness genuinely RESISTS after measure + reframe it is an
    HONEST W1 dissolution ticket + block, decompose into the immediately-bankable structural piece + child
    the global remainder. The costume must bite a WRONG seed-eigenpair / induction-step / reachability
    product / surjectivity / exhaustion claim. NO posited Lorentz group, NO Mathlib ℝ/ℂ as content — DERIVE
    from the banked `genIsomMonoidC2`/`qvIsomMonoidC` + `boostOPS` + `rotGenSetC` + `biMulGenSetC` +
    `infIsomLieAlg` + `BvC` + the N56 Born-positivity + the N57 `cutSqrt` + the N58 Cartan split (`EvC`) +
    the N59 operator form-adjoint + the N60–N65 operator square roots + the N63 `projC`/`specOp`/
    `specOp_op_sqrt`/`specOp_eigen₁` + the N66 concrete polar assembly + the N67 mixing eigenbasis + rank-3
    spectral operator + the N68 `specOpN` + the N69 `txMix`/`txMix_eq_specOpN`/`mix3` + the N70 deflation
    engine (`deflateC`/`deflateC_eigen_kills`/`deflateC_image_orth`/`deflateC_specOpN`) + the N71 seed
    eigenpair extraction (`specOpN_eigen`/`txMix_eigen_*`/`txMix_deflate_*`) + the N72 constructed
    octonion-coupling seed extraction (`omixA`/`omixB`/`toMix`/`toMix_eq_specOp_omix`/`toMix_seed_eigen`/
    `toMix_deflate_kills_seed`/`toMix_deflate_image_orth`/`toMix_op_sqrt_gen`) + the N73 closed deflation
    descent (`specOpN_zero`/`zeroOn`/`deflateC_specOpN_zeroOn`/`specOpN_zeroOn_univ`/`deflateC_step2_survive`/
    `txMix_full_descent`) + the continuum form + the terminal algebra `O Cut` over the derived ℝ.

  - **★ N74 LANDED RETROSPECTIVE — THE GENERAL ITERATED DEFLATION DESCENT AT ARBITRARY RANK
    (`Phys/Algebra/LorentzContinuumDescentIter.lean`, 8 decls foundations-only [propext,
    Classical.choice, Quot.sound], independently axiom-audited against the built olean; gate D0–D6
    GREEN, costume C105 `25 = 13`).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP §N74 priority (ii)) +
    W3 DECOMPOSE: the ticket TARGET was the HEAVY group-manifold core (the seed eigenpair EXTRACTION at
    general dimension — the characteristic-cubic route — the full existence `∀ g, ∃ c u, g = specOpN c u`,
    the GLOBAL polar/KAK assembly, connectedness, the GLOBAL reverse KAK surjectivity, the full
    `Spin(9)→SO(9)` exhaustion); MEASURE-FIRST confirmed the seed at GENERAL dimension needs a cubic root
    over `Cut` (no Mathlib analogue) and the group-manifold integration/topology/cover are the genuine
    HEAVY sub-nodes (childed N75). THE GAP this node closed: N73 banked the closed descent but only at a
    FIXED CONCRETE RANK and as a COEFFICIENT identity — the single inductive step `deflateC_specOpN_zeroOn`
    (peel one more index, growing the peeled-index `Finset S`), the terminal COEFFICIENT state
    `specOpN_zeroOn_univ` (the all-peeled coefficient family yields `0`), and the CONCRETE 3-step
    `txMix_full_descent` (the genuine 10-dim-mixing witness driven to `0` by THREE explicit nested
    `deflateC` calls, by hand). The chain NEVER assembled the GENERAL iterated descent — a SINGLE theorem
    at ARBITRARY rank `n` that ITERATES the actual deflation peel OPERATOR over all `n` indices, starting
    from the FULL operator `specOpN l u`, and reaches the zero operator. THE REFRAME (THE ONE LAW): the
    iterated descent IS the banked N73 single step `deflateC_specOpN_zeroOn`, folded — `deflateList l u g
    ks := ks.foldl (fun acc k => deflateC acc (l k) (u k)) g` is the list realization of the
    extract→deflate→recurse loop; one structural `List` induction over the banked single step (each `cons`
    consumes one index advancing the peeled-index `Finset` to `insert k S`, the `nil` base is the
    identity) gives the GENERAL ITERATED DESCENT SKELETON; specializing to `List.finRange n`, `S = ∅`
    peels every index and lands — through the N73 terminal state `specOpN_zeroOn_univ` — at the zero
    operator at ARBITRARY rank `n`. BANKED: the iterated peel `deflateList` with `deflateList_nil`/`_cons`;
    `zeroOn_empty` (`zeroOn ∅ l = l`); ★★ the GENERAL ITERATED DESCENT SKELETON `deflateList_zeroOn`
    (for a `Nodup` `ks` disjoint from `S`, `deflateList l u (specOpN (zeroOn S l) u) ks =
    specOpN (zeroOn (S ∪ ks.toFinset) l) u`); ★★ the HEADLINE `specOpN_full_descent`
    (`deflateList l u (specOpN l u) (List.finRange n) = 0`, at ARBITRARY rank `n`); ★ the W8 non-vacuity
    `deflateList_mix_partial_survive` (the general machine over the STRICT prefix `[0,1]` leaves `mixW3`
    with its TRUE eigenvalue `25 • mixW3` — honest at every rank); and the SUBSUMPTION
    `deflateList_txMix_concrete`/`deflateList_txMix_descent` (the general iterator reproduces N73's concrete
    crank, recovering `txMix_full_descent` as the `n = 3` instance). PURE `List.foldl`/`Finset` bookkeeping
    over the banked `deflateC`/`deflateC_specOpN_zeroOn`/`zeroOn`/`specOpN_zeroOn_univ` + the reference form
    `EvC` over the derived ℝ `Cut`, the same engine as N56–N73 (one scratch probe with all 8 theorems
    compiled clean 7.5s + production ≤14s, all 8 decls foundations-only at first compile, KILL=30s/
    obligation never approached, NO inflated maxHeartbeats / NO native_decide / NO brute; no name
    collisions). Costume C105 (`LorentzContinuumDescentIterWrongSurvivingEigenvalueCostume`) bites a WRONG
    surviving eigenvalue in the GENERAL iterated descent — that after the general `deflateList` machine
    peels the strict prefix `[0,1]`, the read self-overlap of the surviving `mixW3` direction is `13`;
    banked `deflateList_mix_partial_survive` + `EvC_smul_left` + `mixW3_norm` give the genuine `25 * 1 =
    25`, so the wrong claim forces `25 = 13` (distinct from C84 `8=4`, …, C103 `100=40`, C104 `25=11`).
    Words-removable: delete "Lorentz/boost/rotation/spectral/eigen*/deflation/peel-off/descent/diagonal/
    orthonormal/self-adjoint/invariant/mixing/dimension/rank/seed/extraction/induction/termination/
    iterated" → over the derived complete ordered field `Cut` and `O Cut`, for the `Cut`-linear
    `specOpN l u := ∑ i, (l i)•projC (u i)`, `deflateC g l u := g − l•projC u`, `zeroOn S l :=
    fun i => if i ∈ S then 0 else l i`, and `deflateList l u g ks := ks.foldl (fun acc k =>
    deflateC acc (l k) (u k)) g`: for a `Nodup` `ks` disjoint from `S`, `deflateList l u
    (specOpN (zeroOn S l) u) ks = specOpN (zeroOn (S ∪ ks.toFinset) l) u`; and `deflateList l u
    (specOpN l u) (List.finRange n) = 0`; pure math. W3 DECOMPOSE: the seed eigenpair EXTRACTION at
    GENERAL dimension (the characteristic-cubic route) + the full existence `∀ g, ∃ c u, g = specOpN c u`
    (the seed + this iterated descent) + the GLOBAL polar/KAK assembly for an arbitrary `g` + connectedness
    + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion is childed N75.

  - **★ (FORWARD FRONTIER — the immediate next node, N75) THE SEED EIGENPAIR EXTRACTION AT GENERAL
    DIMENSION (the characteristic-cubic route producing ONE eigenpair for an arbitrary EvC-self-adjoint
    operator on a 3-dim space, beyond N65/N72's 2×2 discriminant) — the missing SEED the now-GENERAL
    iterated descent (N74) consumes — + assembling the seed + the iterated descent into THE FULL n-DIM
    SPECTRAL EXISTENCE (`∀ g, ∃ c u, g = specOpN c u`) + THE GLOBAL POLAR/KAK ASSEMBLY FOR AN ARBITRARY
    ISOMETRY + CONNECTEDNESS + THE GLOBAL REVERSE KAK SURJECTIVITY (`qvIsomMonoidC` on the connected
    component `≤ genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion, childed from N74.**
    N49–N74 banked, over the derived ℝ `Cut`: BOTH one-parameter generator families (`boostOPS`,
    `rotGenSetC`), the TWO-SIDED Moufang/`Spin(9)` generator `biMulFun u u'`, the EXTENDED generated group
    `genIsomMonoidC2` with FORWARD soundness (N55), the BORN POSITIVITY / (1,9) signature (N56), the SCALAR
    square root `cutSqrt` (N57), the INFINITESIMAL CARTAN split `EvC` (N58), the OPERATOR form-adjoint with
    `g*∘g ⪰ 0` (N59), the operator square root in the scalar/2-block/octonion-internal/rotated-basis/
    equal-diagonal/full-unequal-diagonal cases (N60–N65), a COMPLETE concrete polar factorization
    `g = k·exp(p)` of a composite isometry (N66), the FIRST 10-dim-MIXING spectral square root + the RANK-3
    spectral operator `specOp3` (N67), the GENERAL rank-`n` spectral operator `specOpN` (N68), the FIRST
    CONCRETE EIGENBASIS-EXISTENCE WITNESS `txMix = specOpN ![9,4,25] mix3` (N69), the DEFLATION / PEEL-OFF
    ENGINE — the inductive STEP of the spectral existence theorem (N70), the SEED EIGENPAIR EXTRACTION —
    the genuine VECTOR eigen-equation `specOpN_eigen` + the first NON-VACUOUS firing of the deflation
    engine on a GIVEN rational eigenbasis (N71), the CONSTRUCTED SEED EIGENPAIR EXTRACTION from an
    octonion-COUPLING coordinate operator (N72), the FIRST CLOSED MULTI-STEP DEFLATION DESCENT — the
    general termination `specOpN_zero`, the closed inductive skeleton `deflateC_specOpN_zeroOn`, the
    terminal state `specOpN_zeroOn_univ`, the FULL 3-step concrete descent `txMix_full_descent` (N73), AND
    NOW (N74) the GENERAL ITERATED DEFLATION DESCENT — the iterated peel `deflateList`, the general-`n`
    skeleton `deflateList_zeroOn` over a growing peeled-index `Finset`, the HEADLINE `specOpN_full_descent`
    (iterating the deflation peel over ALL `n` indices from the FULL `specOpN l u` reaches the zero
    operator at ARBITRARY rank `n`). THE HEAVY CORE that remains — the genuine group-manifold work — is:
    (i) the seed eigenpair EXTRACTION at GENERAL dimension: the existence of ONE eigenpair for an arbitrary
    EvC-self-adjoint operator on an `n`-dim space (the characteristic-cubic route beyond a single 2×2
    block — an eigenvalue as a cubic root over `Cut`, an eigenvector EvC-orthogonal to the rest), the
    missing SEED at dimension ≥ 3 — THE ENTRY THE NOW-GENERAL ITERATED DESCENT (N74) CONSUMES; (ii) the
    FULL existence `∀ g, ∃ c u, g = specOpN c u` (the seed + the iterated descent: extract one eigenpair,
    deflate, the iterated descent drives the rest to 0, so the operator IS a sum of scaled
    eigenprojections); (iii) the GLOBAL polar/KAK assembly: that EVERY `g ∈ qvIsomMonoidC` factors as
    `k·exp(p)` via the operator square root of an arbitrary `g*g`, then the compact-part read-off
    `k = g·exp(p)⁻¹` and `k*∘k = id` for the GENERAL `g`; (iv) the compact part `k` via CONNECTEDNESS of
    the isometry group over `Cut` (no Mathlib topology of `SO⁺(1,9)`); (v) the GLOBAL reverse KAK
    surjectivity (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`); (vi) the full
    `Spin(9)→SO(9)` exhaustion. Mathlib has NO `SO⁺(1,9)`, no octonionic spinor cover, no Lie-group
    integration over `Cut`. MEASURE FIRST + reframe through the trunk — the immediately-bankable
    sub-pieces to MEASURE FIRST: (i) the seed eigenpair EXTRACTION for an arbitrary EvC-self-adjoint
    operator on a 3-dim space (the characteristic-cubic route producing ONE eigenpair — reframe through
    the trunk: is the cubic root the banked `cutSqrt`-style order-completeness/IVT engine N57/N33–N37
    applied to the characteristic cubic? — the existence-of-one-eigenpair lever at dimension 3, the
    missing SEED the now-general iterated descent N74 is banked to consume); (ii) the FULL existence
    assembled from the seed + the iterated descent once the seed is in hand; (iii) a CONCRETE biMulFun
    2-plane `SO(9)` reachability — a specific 2-plane rotation as a finite product of the banked `biMulFun`
    two-sided generators; (iv) the GLOBAL polar assembly for an arbitrary `g` once the n-dim existence is
    in hand. If the seed at general dimension / the full existence / the global polar assembly / reverse
    surjectivity / connectedness genuinely RESISTS after measure + reframe it is an HONEST W1 dissolution
    ticket + block, decompose into the immediately-bankable structural piece + child the global remainder.
    The costume must bite a WRONG seed-eigenpair / existence / reachability product / surjectivity /
    exhaustion claim. NO posited Lorentz group, NO Mathlib ℝ/ℂ as content — DERIVE from the banked
    `genIsomMonoidC2`/`qvIsomMonoidC` + `boostOPS` + `rotGenSetC` + `biMulGenSetC` + `infIsomLieAlg` +
    `BvC` + the N56 Born-positivity + the N57 `cutSqrt` + the N58 Cartan split (`EvC`) + the N59 operator
    form-adjoint + the N60–N65 operator square roots + the N63 `projC`/`specOp`/`specOp_op_sqrt`/
    `specOp_eigen₁` + the N66 concrete polar assembly + the N67 mixing eigenbasis + rank-3 spectral
    operator + the N68 `specOpN` + the N69 `txMix`/`txMix_eq_specOpN`/`mix3` + the N70 deflation engine +
    the N71 seed eigenpair extraction (`specOpN_eigen`/`txMix_eigen_*`/`txMix_deflate_*`) + the N72
    constructed octonion-coupling seed extraction + the N73 closed deflation descent (`specOpN_zero`/
    `zeroOn`/`deflateC_specOpN_zeroOn`/`specOpN_zeroOn_univ`/`deflateC_step2_survive`/`txMix_full_descent`)
    + the N74 general iterated descent (`deflateList`/`deflateList_zeroOn`/`specOpN_full_descent`/
    `deflateList_mix_partial_survive`/`deflateList_txMix_descent`) + the continuum form + the terminal
    algebra `O Cut` over the derived ℝ.





  - **★ N75 LANDED RETROSPECTIVE — THE ODD-DEGREE ROOT ENGINE over the DERIVED ℝ `Cut`
    (`Phys/Algebra/LorentzContinuumSeedCubic.lean`, 10 decls foundations-only [propext,
    Classical.choice, Quot.sound], independently axiom-audited against the built olean; gate D0–D6
    GREEN, costume C106 `8 = 27`).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP §N75 priority (i)) +
    W3 DECOMPOSE: the ticket TARGET was the HEAVY group-manifold core (the seed eigenpair EXTRACTION
    at general dimension, the full existence `∀ g, ∃ c u, g = specOpN c u`, the GLOBAL polar/KAK
    assembly, connectedness, the GLOBAL reverse KAK surjectivity, the full `Spin(9)→SO(9)` exhaustion);
    MEASURE-FIRST split the SEED at dimension ≥ 3 into an EIGENVALUE half (a root of the characteristic
    CUBIC) and an EIGENVECTOR half (a nonzero kernel vector of `T−λ` over the 10-dim product space
    `STVC`), and confirmed the assembly/connectedness/surjectivity/exhaustion are the genuine HEAVY
    group-manifold sub-nodes (childed N76). THE GAP this node closed: N57 `cutSqrt` is the degree-2
    root engine — a SQUARE root, and through the 2×2 discriminant radical `R = cutSqrt(δ²+b²)` the
    eigenvalues of every 2×2 block (N65/N72) — so the chain's seed eigenvalue extraction TOPPED OUT at
    a single 2×2 block, a degree-2 radical. The SEED at dimension ≥ 3 needs an eigenvalue from the
    characteristic CUBIC `λ³+bλ²+cλ+d`, which has NO closed radical form a square root reaches. THE
    REFRAME (THE ONE LAW): the cubic root is NOT a Cardano radical grind and NOT a new posit — it
    DISSOLVES through the SAME `intermediate_value_Icc` engine that built N57 `cutSqrt`, escalated from
    degree 2 to ODD degree. `cutSqrt` rode IVT on the continuous `x ↦ x·x` over `[0, max 1 a]`;
    `cut_cubic_has_root` rides the SAME IVT on the continuous monic cubic over the SYMMETRIC interval
    `[−s, s]` with `s = |b|+|c|+|d|+1` the Cauchy root bound — the dominance `0 ≤ s³−|b|s²−|c|s−|d|`
    makes `f(s) ≥ 0`, its reflection makes `f(−s) ≤ 0`, the odd degree brackets a sign change at `0`,
    and IVT crosses it. The odd degree is exactly why a root exists for EVERY coefficient triple (an
    even-degree polynomial need not). BANKED: `continuous_cut_cube` (the degree-3 escalation of N57
    `continuous_cut_sq`); `cutCbrt_exists`/`cutCbrt`/`cutCbrt_nonneg`/`cutCbrt_cube`/`cube_nonneg_inj`/
    `cutCbrt_unique` (the nonnegative cube root with its defining property
    `cutCbrt a · cutCbrt a · cutCbrt a = a` and uniqueness via the factorization
    `b'³−b³ = (b'−b)(b'²+b'b+b²)`); `cutCbrt_eight_eq_two` (the concrete `cutCbrt 8 = 2`);
    `continuous_cut_cubic`; ★★ the HEADLINE `cut_cubic_has_root` (EVERY monic cubic `x³+bx²+cx+d` over
    `Cut` HAS a root — the eigenvalue-existence ingredient at dimension ≥ 3, the SEED-eigenvalue half
    the now-general iterated descent N74 is banked to consume); and `cut_cubic_root_witness` (the
    concrete `x³−7x+6`, roots `1,2,−3`). DERIVED entirely from the banked order-completeness the
    continuum was BUILT with — N33 `ConditionallyCompleteLinearOrder` + N34 `OrderTopology`/
    `IsTopologicalRing` + N35 `Archimedean` over the DERIVED ℝ `Cut` — via the same `intermediate_value_Icc`
    engine as N57 (one cube-root scratch probe 7.3s + one cubic-root probe 11.7s + production ≤17s, all
    10 decls foundations-only at first compile, KILL=45s/obligation never approached, NO inflated
    maxHeartbeats / NO native_decide / NO brute; no name collisions). NO `import Mathlib.Data.Real`,
    NO posited field, NO Cardano radicals. Costume C106 (`LorentzContinuumSeedCubicWrongCubeRootCostume`)
    bites a WRONG cube-root value — that the cube of `cutCbrt 8` is `27` (i.e. the cube root of `8`
    were `3`); the banked `cutCbrt_cube` gives the genuine `8`, so the wrong claim forces `8 = 27`
    (distinct from C84 `8=4`, …, C104 `25=11`, C105 `25=13`). Words-removable: delete "Lorentz/boost/
    rotation/spectral/eigenvalue/eigenvector/characteristic/cubic/seed/extraction/dimension/rank/Spin/
    SO(9)/KAK/polar/Cartan/isometry" → over the derived complete ordered field `Cut`, every nonnegative
    element has a unique nonnegative cube root, `cutCbrt 8 = 2`, and every monic cubic
    `x³+bx²+cx+d` has a root; pure math. W3 DECOMPOSE: the EIGENVECTOR half of the 3-dim seed (a
    nonzero kernel vector of `T−λ` over `STVC`) + the full existence `∀ g, ∃ c u, g = specOpN c u` + the
    GLOBAL polar/KAK assembly + connectedness + the GLOBAL reverse KAK surjectivity + the full
    `Spin(9)→SO(9)` exhaustion is childed N76.

  - **★ N76 LANDED RETROSPECTIVE — THE EIGENVECTOR HALF OF THE 3-DIM SEED over the DERIVED ℝ `Cut`
    and the terminal algebra `O Cut` (`Phys/Algebra/LorentzContinuumSeedVector.lean`, 9 decls
    foundations-only [propext, Classical.choice, Quot.sound], independently axiom-audited against the
    built olean; gate D0–D6 GREEN, costume C107 `6 = 13`).** THE W1 REFRAME + W9 MEASURE-FIRST
    (ROADMAP §N76 priority (i)) + W3 DECOMPOSE: the ticket TARGET was the HEAVY group-manifold core
    (the eigenvector half, the full existence `∀ g, ∃ c u, g = specOpN c u`, the GLOBAL polar/KAK
    assembly, connectedness, the GLOBAL reverse KAK surjectivity, the full `Spin(9)→SO(9)` exhaustion);
    MEASURE-FIRST banked the EIGENVECTOR half HERE and confirmed the full-existence ASSEMBLY +
    connectedness/surjectivity/exhaustion are the genuine HEAVY group-manifold sub-nodes (childed N77).
    THE GAP this node closed: N75 banked the EIGENVALUE half of the 3-dim seed (a root of the
    characteristic CUBIC, via `cut_cubic_has_root`); the N70 `deflateC` engine takes the eigen-equation
    `T v = λ • v` as its hypothesis, so the MISSING ingredient was a NONZERO `v` satisfying it — the
    eigenVECTOR. THE REFRAME (THE ONE LAW): the eigenvector is NOT a determinant-cofactor coordinate
    grind and NOT a new posit — it DISSOLVES through Mathlib's general eigenspace machinery APPLIED TO
    THE DERIVED FIELD `Cut` (STANDARD §3: Mathlib as MACHINERY on a DERIVED object, never as content):
    a root `λ` of the characteristic polynomial makes the eigenspace nonzero
    (`Module.End.hasEigenvalue_iff_isRoot_charpoly`), whence a nonzero eigenvector
    (`HasEigenvalue.exists_hasEigenvector`). BANKED: the prerequisite finite-dimensionality lever
    `Module.Finite Cut STVC` via the structural `Cut`-linear product equivalences of the cascade rungs
    `2→4→8` (`dblProdEquivCut`/`hProdEquivCut`/`oProdEquivCut`, mirroring the banked ℚ route
    `DerivationFinrank.cdProdEquiv`, NO coordinate basis matrix); `monic_cubic_poly_has_root` (the N75
    chain joint — a monic degree-3 polynomial over `Cut` has a root, `cut_cubic_has_root` consumed in
    `Polynomial` form via `eval_eq_sum_range`); ★★ the NON-VACUOUS `dim3_has_eigenvector` (EVERY
    endomorphism of a 3-dim `Cut`-vector space has a NONZERO `v` with `T v = λ • v` — the `natDegree = 3`
    DERIVED from `finrank`, NOT assumed, so the seed eigenPAIR is completed exactly at the dimension
    where the cubic root first bites, beyond the 2×2 discriminant radical that topped out N65/N72); and
    ★ the HEADLINE `stvc_eigenvector_of_charpoly_root` (any characteristic-polynomial root `λ` of an
    endomorphism of the 10-dim `STVC = Cut × Cut × O Cut` yields a NONZERO `v` with `T v = λ • v` — the
    eigenvalue→eigenvector closure over the genuine product space, the entry the N70 `deflateC` / N74
    iterated descent consume). DERIVED entirely from the trunk — the field IS the derived `Cut`, the
    finite-dimensionality DESCENDS structurally from the cascade rungs `2→4→8`, and the eigenvalue is
    the N75 cubic root that descends from the order-completeness the continuum was built with (the three
    levers each compiled clean in a scratch probe ≤9s — Finite STVC 8.8s, dim3 seed + STVC eigenvector
    7.7s, monic cubic joint 7.5s; production ≤7s, all 9 decls foundations-only at first compile,
    KILL=45s/obligation never approached, NO inflated maxHeartbeats / NO native_decide / NO brute; no
    name collisions). NO `import Mathlib.Data.Real`/`Complex`, NO posited field, NO posited operator
    calculus, NO posited Lorentz group. Costume C107 (`LorentzContinuumSeedVectorWrongEigenvalueCostume`)
    bites a WRONG eigenvalue read off a genuine eigen-equation over `STVC` — the scaling endomorphism
    `6 • id` applied to `v0 = (1,0,0)` has eigen-equation first coordinate `6`; a bogus claim it were
    `13` forces `6 = 13` (distinct from C84 `8=4`, …, C105 `25=13`, C106 `8=27`). Words-removable: delete
    "Lorentz/boost/rotation/spectral/eigenvalue/eigenvector/eigenpair/characteristic/cubic/seed/dimension/
    rank/Spin/SO(9)/KAK/polar/Cartan/isometry" → over the derived field `Cut` and the Cayley–Dickson
    double³ `O Cut`, the product space `STVC` is a finite-dimensional `Cut`-vector space, every monic
    degree-3 polynomial over `Cut` has a root, every endomorphism of a 3-dim `Cut`-space has a nonzero
    `v` with `T v = λ • v`, and any characteristic-polynomial root of an endomorphism of `STVC` yields a
    nonzero `v` with `T v = λ • v`; pure math. W3 DECOMPOSE: the full existence `∀ g, ∃ c u, g = specOpN c u`
    (assembled from the COMPLETED seed eigenpair + the N74 iterated descent) + the GLOBAL polar/KAK
    assembly + connectedness + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion
    is childed N77.

  - **★ N77 LANDED RETROSPECTIVE — THE DERIVED ℝ `Cut` IS A REAL CLOSED FIELD: the GENERAL
    odd-degree root engine + `IsRealClosed Cut` + the general ODD-dimensional eigen-seed, over the
    DERIVED ℝ `Cut` and the terminal algebra `O Cut` (`Phys/Algebra/LorentzContinuumRealClosed.lean`,
    8 decls foundations-only [propext, Classical.choice, Quot.sound], independently axiom-audited
    against the built olean; gate D0–D6 GREEN, costume C108 `7 = 12`; W6 verify-then-finalize of a
    prior run that committed the production + costume + wiring + PREREG but timed out mid-D6).** THE
    GAP this node closed: N75 banked the root engine ONLY at degree 3 (`cut_cubic_has_root`, the monic
    CUBIC); N76 banked the eigen-seed ONLY at dimension 3 (`dim3_has_eigenvector`). The genuine
    obstruction to the FULL `STVC` existence is that `STVC` is 10-dim (EVEN), so an endomorphism's
    characteristic polynomial has EVEN degree 10 — neither N75's cubic engine nor N76's dim-3 seed
    can root/seed it; under deflation the effective dimension descends `10 → 9 → 8 → …` and the
    ODD rungs each need a guaranteed eigenpair from a GENERAL odd-degree root engine. THE REFRAME (THE
    ONE LAW): the general odd-degree root is NOT a Cardano/Sturm grind and NOT a new posit — it
    DISSOLVES through the SAME `intermediate_value_Icc` engine that built N57 `cutSqrt` (degree 2) and
    N75 `cut_cubic_has_root` (degree 3), escalated to ARBITRARY odd degree: the Cauchy bound
    `s = (∑_{i<n} |coeff i|)+1` makes `f(s) ≥ 0` (dominance, `cutPoly_eval_upper_nonneg`), the odd
    reflection `(−s)^n = −(s^n)` (`Odd.neg_pow`) makes `f(−s) ≤ 0` (`cutPoly_eval_lower_nonpos`),
    and IVT crosses the bracketed sign change at `0` (`cut_odd_degree_has_root`). BANKED: the two
    Cauchy-dominance halves; ★★ `cut_odd_degree_has_root` (EVERY monic ODD-`natDegree` polynomial
    over `Cut` has a root); `cut_isSquare_of_nonneg` (every nonneg is a square, from N57 `cutSqrt`);
    `cut_exists_root_of_odd` (every odd-degree polynomial has a root, normalizing by the leading
    coefficient); ★★★ the HEADLINE `cut_isRealClosed` (`IsRealClosed Cut` — the DERIVED ℝ `Cut`
    IS A REAL CLOSED FIELD, via Mathlib's `IsRealClosed.of_linearOrderedField` from squares-of-
    nonnegatives + odd-degree roots — the algebraic characterization of the real continuum, DERIVED);
    `cut_odd_real_root` (NON-VACUITY: the quintic `x⁵−x` has a root over `Cut`); and ★
    `dim_odd_has_eigenvector` (every endomorphism of an ODD-`finrank` `Cut`-vector space has a NONZERO
    eigenvector — generalizing N76 `dim3_has_eigenvector` from dimension 3 to EVERY odd dimension, the
    re-seeding lever for the odd rungs of the deflation cascade). DERIVED entirely from the order-
    completeness the continuum was BUILT with (N33–N37) + N57 `cutSqrt`, via the SAME
    `intermediate_value_Icc` engine. `IsRealClosed`, `of_linearOrderedField`, `intermediate_value_Icc`,
    the eigenspace machinery are standard MACHINERY on the DERIVED objects (STANDARD §3). NO Cardano
    radicals, NO Sturm chains, NO `import Mathlib.Data.Real`/`Complex` as content (the field IS the
    DERIVED `Cut`), NO posited field, NO posited Lorentz group. Costume C108
    (`LorentzContinuumRealClosedWrongRootCostume`) bites a WRONG eigenvalue read off a genuine
    eigen-equation on the ODD-dimensional space `Fin 5 → Cut` — `(7 • id) e0` has `0`-th coordinate
    `7`; a bogus claim it were `12` forces `7 = 12` (distinct from C84 `8=4`, …, C106 `8=27`, C107
    `6=13`). Words-removable: delete "Lorentz/spectral/eigen*/seed/re-seed/dimension/rank/Spin/SO(9)/
    KAK/polar/Cartan/isometry/real-closed-as-physics" → over the derived complete ordered field `Cut`,
    every nonneg is a square, every odd-degree polynomial has a root, `Cut` is a real closed field, and
    every endomorphism of an odd-finite-dim `Cut`-space has a nonzero `v` with `T v = λ • v`; pure
    math. W3 DECOMPOSE: the full existence + the deflation re-seeding + the GLOBAL polar/KAK assembly +
    connectedness + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion is
    childed N78.

  - **N78 LANDED — THE EVEN-RUNG OBSTRUCTION REMOVER** (`Phys/Algebra/LorentzContinuumEvenSeed.lean`,
    10 decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited
    vs the built olean; gate D0–D6 GREEN; costume C109 `9 = 13`). N77 banked `dim_odd_has_eigenvector`
    — a guaranteed real eigenvalue at every ODD dimension. But the deflation cascade descends
    `10 → 9 → 8 → …`, so the EVEN rungs (10, 8, 6, …) STILL need a guaranteed eigenpair, and an
    EVEN-degree polynomial need NOT have a root over a real-closed (non-algebraically-closed) field —
    the genuine even-rung obstruction. The classical resolution (the real spectral theorem / Rayleigh
    quotient / complex-eigenvalue argument) is unavailable: Mathlib has NO real-closed→algebraically-
    closed (Artin–Schreier), NO real-closed polynomial factorization, NO self-adjoint spectral theorem
    over a general field (`FieldTheory/IsRealClosed/Basic.lean` is a 127-line stub). THE TRUNK REFRAME
    (THE ONE LAW): over the real-closed `Cut` a monic characteristic polynomial is a product of LINEAR
    factors `(X − λ)` and IRREDUCIBLE QUADRATIC factors `X² + b·X + c` with NEGATIVE discriminant
    `b² − 4c < 0`; for a SELF-ADJOINT `g` w.r.t. the POSITIVE-DEFINITE reference form `EvC` (N58), EVERY
    negative-discriminant quadratic factor `g·g + b•g + c•1` is INJECTIVE — with `α := EvC (g v)(g v)
    ≥ 0`, `β := EvC (g v) v`, `γ := EvC v v > 0` (positive-definiteness), the diagonal form value is
    `α + b·β + c·γ`, the Cauchy–Schwarz bound `β² ≤ α·γ` (from `0 ≤ EvC (γ•(g v) − β•v)(γ•(g v) −
    β•v)`, N58 `EvC_nonneg`) gives `α + b·β + c·γ ≥ ((4c − b²)/4)·γ > 0 ≠ 0` — injective on the
    FINITE-dim `STVC` (N76 `Module.Finite Cut STVC`) ⟹ BIJECTIVE (`injective_iff_surjective`) ⟹ a
    UNIT of `Module.End Cut STVC`. Then with Cayley–Hamilton (`aeval_self_charpoly`), `g`'s
    characteristic polynomial CANNOT be a PURE product of negative-discriminant quadratics (each factor
    a unit, a product of units a unit, but `aeval g charpoly = 0` not a unit on the nonzero `STVC`), so
    the factorization MUST contain a linear factor = a REAL eigenvalue. BANKED: `selfadj_negDisc_quad_
    apply_form` (the EvC quadratic-form identity); ★★ `selfadj_negDisc_quad_pos` (THE DISCRIMINANT KEY:
    strict positivity for `b² < 4c`, `v ≠ 0`); ★★ `selfadj_negDisc_quad_injective` (THE EVEN-RUNG
    OBSTRUCTION REMOVER); `selfadj_negDisc_quad_bijective`/`_isUnit`; ★ `selfadj_negDisc_quad_ne_zero`
    (NON-VACUITY W8: not the zero endomorphism); `aeval_quad_eq`/`aeval_quad_isUnit`; `isUnitListProd`
    (a product of units is a unit, list form for the non-commutative `Module.End` ring); ★
    `selfadj_no_pure_quad_charpoly` (THE CONDITIONAL EXISTENCE — a real eigenvalue exists GIVEN the
    real-closed factorization). The even-rung obstruction removed WITHOUT analysis and WITHOUT the
    algebraic closure: it DESCENDS from the POSITIVE-DEFINITENESS of `EvC` (N58, itself the Born
    self-overlap positivity N56) over the ORDER structure of the derived ℝ `Cut`, via the Cauchy–
    Schwarz inequality the order supplies, plus `Module.Finite Cut STVC` (N76). `injective_iff_
    surjective`, `Module.End.isUnit_iff`, `aeval_self_charpoly`, `map_list_prod` are standard MACHINERY
    on DERIVED objects (STANDARD §3). NO posited spectral theorem, NO Mathlib ℝ/ℂ as content, NO bridge.
    Words-removable: delete "Lorentz/spectral/eigen*/self-adjoint/positive-definite/discriminant/
    quadratic/seed/even/odd/dimension/rank/Spin/SO(9)/isometry/obstruction/characteristic" → over the
    derived complete ordered field `Cut` and the symmetric positive-definite form `EvC`, for an
    `EvC`-symmetric `g` and `b² < 4c`, `g·g + b•g + c•1` is injective hence bijective hence a unit on
    the finite-dim `STVC`, and `g`'s characteristic polynomial is not a pure product of such quadratics;
    pure math. The ONLY remaining gap to the real-eigenvalue seed at EVEN dimension is the real-closed
    FACTORIZATION itself (the Artin–Schreier content Mathlib lacks). W3 DECOMPOSE: the real-closed
    factorization + the full real-eigenvalue seed at EVEN dimension + the deflation re-seeding induction
    + the full existence + the GLOBAL polar/KAK assembly + connectedness + the GLOBAL reverse KAK
    surjectivity + the full `Spin(9)→SO(9)` exhaustion is childed N79.

  - **N79 LANDED — THE DEFLATION RE-SEEDING INDUCTION LEVER** (`Phys/Algebra/LorentzContinuumReseed.lean`,
    12 decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs
    the built olean; gate D0–D6 GREEN; costume C110 `10 − 1 = 14`). The full n-dim spectral existence
    `∀ g, ∃ c u, g = specOpN c u` runs as an INDUCTION on dimension: extract one eigenpair `(l,u)`,
    deflate via N70 `deflateC g l u`, recurse on the strictly-smaller EvC-orthogonal complement of `u`.
    N70 banked the deflation STEP and `deflateC_image_orth` (the deflated operator's whole image is
    EvC-orthogonal to `u`, so the complement is an INVARIANT subspace), but the recursion needs the
    operator to actually RESTRICT to that complement as an endomorphism of a STRICTLY SMALLER space —
    the deep remaining joint, "threading the EvC-orthogonal-complement finrank bookkeeping". THE TRUNK
    REFRAME (THE ONE LAW): the EvC-orthogonal complement of `u` IS the kernel of the banked
    reference-form functional `uPerp u := LinearMap.ker (EvCRight u)` (N68); for a UNIT `u`
    (`EvC u u = 1`) the functional is SURJECTIVE onto `Cut` (witness `c ↦ c • u`), so by RANK–NULLITY
    (`finrank_range_add_finrank_ker`) its kernel has `finrank = finrank STVC − 1` — codimension exactly
    one; the deflated operator maps `uPerp u` into itself (`deflateC_image_orth`), so it RESTRICTS
    (`LinearMap.restrict`) to an endomorphism `deflateRestrict`, EvC-self-adjoint because the ambient
    `deflateC g l u` is (N70 `deflateC_isEvCSymm`); and when `finrank (uPerp u)` is ODD, N77
    `dim_odd_has_eigenvector` on the restriction supplies a nonzero eigenvector whose coercion lives
    inside `uPerp u`. BANKED: `uPerp`/`mem_uPerp`; `evCRight_surjective`; ★★ `uPerp_finrank` (THE
    CODIM-ONE DROP); `deflateC_mapsTo_uPerp`; ★ `deflateRestrict` (THE RESTRICTED OPERATOR); 
    `deflateRestrict_coe`; ★ `deflateRestrict_isEvCSymm` (the restriction is EvC-self-adjoint);
    `uPerp_finite`; ★ `self_not_mem_uPerp`/`uPerp_ne_top` (NON-VACUITY W8 — a PROPER subspace, the
    finrank genuinely drops); ★★ `deflateRestrict_odd_reseed` (THE RE-SEEDING COROLLARY — at any odd
    rung the descent stays inside the strictly-smaller complement). DERIVED from the trunk (the
    complement is the KERNEL of the trunk's own reference-form functional `EvCRight u` N68, the Born
    self-overlap positivity N56; the restriction's self-adjointness from N70; the finiteness from N76;
    the re-seed from N77 riding the real-closed `Cut`). `LinearMap.ker`/`LinearMap.restrict`/
    `finrank_range_add_finrank_ker`/`Module.Finite.of_injective` are standard MACHINERY on DERIVED
    objects (STANDARD §3). MEASURE-FIRST (W1/W9): the real-closed Artin–Schreier FACTORIZATION is the
    content Mathlib LACKS — `Mathlib/FieldTheory/IsRealClosed/Basic.lean` is a 127-line STUB (the class
    + `of_linearOrderedField` + square helpers ONLY; NO `R[i]` algebraic closure, NO degree-≤2
    irreducible-factor theorem, NO polynomial factorization) — the genuine W1 dissolution blocker
    gating the EVEN-dim seed; the immediately-bankable theory-native piece INDEPENDENT of it is the
    re-seeding induction lever banked HERE. NO posited spectral theorem, NO Mathlib ℝ/ℂ as content,
    NO bridge. Words-removable: delete "Lorentz/spectral/eigen*/self-adjoint/positive-definite/
    deflation/re-seed/orthogonal/complement/invariant/induction/descent/dimension/rank/Spin/SO(9)/
    isometry/KAK/polar/Cartan" → over the derived complete ordered field `Cut` and the symmetric
    positive-definite bilinear form `EvC`, the kernel `uPerp u := ker (EvCRight u)` is, for `EvC u u = 1`,
    a proper subspace of `finrank = finrank STVC − 1`; the `Cut`-linear `deflateC g l u` maps it into
    itself and its restriction is `EvC`-symmetric; and when that finrank is odd the map has a nonzero
    `v ∈ uPerp u` with `deflateC g l u v = lam • v`; pure math. W3 DECOMPOSE: the real-closed
    Artin–Schreier factorization + the full even-dim real-eigenvalue seed + the full existence + the
    GLOBAL polar/KAK assembly + connectedness + the GLOBAL reverse KAK surjectivity + the full
    `Spin(9)→SO(9)` exhaustion is childed N80.

  - **N80 LANDED — THE REAL-CLOSED QUADRATIC-IRREDUCIBILITY CLASSIFICATION** (`Phys/Algebra/LorentzContinuumFactor.lean`,
    10 decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs
    the built olean; gate D0–D6 GREEN; costume C111 `17 = 40`). N78 banked `selfadj_no_pure_quad_charpoly`
    (a self-adjoint `g`'s charpoly is NOT a pure product of negative-discriminant monic quadratics, so a
    real eigenvalue exists GIVEN the real-closed factorization into linear × neg-disc-quadratic factors).
    The ONLY missing piece for the even-dim seed is that FACTORIZATION. W1 MEASURE-FIRST (recorded in the
    workbench PREREG, and the decisive finding of this node): `IsRealClosed` occurs in EXACTLY ONE file
    across all of Mathlib — the 127-line STUB `FieldTheory/IsRealClosed/Basic.lean` (class +
    `of_linearOrderedField` + square helpers ONLY); there is NO real-closed → `R[i]` algebraically-closed
    theorem (Artin–Schreier), NO polynomial factorization over abstract real-closed fields; Mathlib's OWN
    `Analysis/Polynomial/Factorization.lean` has the degree-≤2 factorization ONLY over the concrete `ℝ`,
    carrying the explicit `-- TODO: generalize to real closed fields when they are available` ⟹ the full
    Artin–Schreier factorization is genuine W1 BUILD-don't-posit content (childed N81). What IS immediately
    bankable, trunk-native, and the genuine BRIDGE feeding N78 is the unconditional quadratic-irreducibility
    CLASSIFICATION over `Cut` — bridging Mathlib's "irreducible quadratic factor" language and N78's neg-disc
    `qs : List (Cut × Cut)` form. THE TRUNK REFRAME (THE ONE LAW): over `Cut`, every NONNEGATIVE element is a
    square (N57 `cutSqrt` / N77 `cut_isSquare_of_nonneg` — the order-completeness of the derived ℝ, `Cut` is
    real-closed-by-squares); a monic quadratic `cutQuad b c` over `Cut` has a root IFF its discriminant
    `b² − 4c` is a square IFF `0 ≤ b² − 4c` (the `cutSqrt` direction + `discrim_eq_sq_of_quadratic_eq_zero`
    for the square ⟹ nonneg direction); a monic quadratic over a domain is IRREDUCIBLE iff it has no root
    (`Monic.irreducible_iff_roots_eq_zero_of_degree_le_three`, Mathlib machinery on `Cut[X]`); combining:
    `cutQuad b c` is IRREDUCIBLE iff `b² < 4c`. BANKED: `cutQuad`/`cutQuad_isMonicOfDegree`/`cutQuad_monic`/
    `cutQuad_natDegree`/`cutQuad_eval`; ★ `cutQuad_hasRoot_iff_nonnegDisc` (a root iff `0 ≤ b² − 4c`); ★★
    `cut_monic_quad_irreducible_iff_negDisc` (THE CLASSIFICATION); `cut_monic_quad_irreducible_of_negDisc`/
    `cut_negDisc_of_irreducible` (the two named directions); ★ `cutQuad_negDisc_irreducible_ne_root`
    (NON-VACUITY W8 — `X² + 1` is irreducible with no root over `Cut`). DERIVED from the trunk
    (real-closed-by-squares `cutSqrt` N57; `Monic.irreducible_iff_roots_eq_zero_of_degree_le_three`,
    `discrim_eq_sq_of_quadratic_eq_zero`, `exists_quadratic_eq_zero`, `isMonicOfDegree_add_add_two`
    standard MACHINERY on the DERIVED `Cut[X]`, STANDARD §3). NO posited algebraic closure, NO Mathlib ℝ/ℂ
    as content, NO bridge. W9: a LIGHT node — scratch probe clean (48s cold), production cached 11s, all 10
    decls foundations-only at first compile, KILL=90s never approached. Words-removable: delete "Lorentz/
    spectral/eigen*/self-adjoint/characteristic/factorization/irreducible/discriminant/real-closed/
    Artin-Schreier/seed/even-dim/algebraic-closure/Spin/SO(9)/isometry" → over the derived complete ordered
    field `Cut` in which every nonnegative element is a square, a monic quadratic `X² + C b·X + C c ∈ Cut[X]`
    is irreducible iff `b² < 4c`; pure field/polynomial math. W3 DECOMPOSE: the real-closed Artin–Schreier
    FACTORIZATION (`Cut[i]` algebraically closed, the content Mathlib lacks) + the full even-dim seed + the
    full existence + the GLOBAL polar/KAK assembly + connectedness + the GLOBAL reverse KAK surjectivity +
    the full `Spin(9)→SO(9)` exhaustion is childed N81.

  - **N81 LANDED — THE TRUNK-NATIVE ARTIN–SCHREIER DEGREE-2 INPUT** (`Phys/Algebra/LorentzContinuumAdjoinI.lean`,
    11 audited decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs
    the built olean; gate D0–D6 GREEN, 1264 audited theorems foundations-only; costume C112 `169 = 200`). The
    isolated hard input gating the EVEN-DIM real-eigenvalue seed is the real-closed Artin–Schreier FACTORIZATION
    — equivalently that `Cut[i] = Cut[X]/(X²+1)` is ALGEBRAICALLY CLOSED. W1 MEASURE-FIRST (re-confirmed this
    node): `IsRealClosed` is a 127-line Mathlib STUB; `grep Sylow FieldTheory/` returns NOTHING, so the full
    Artin–Schreier Galois/Sylow 2-group alg-closure (every finite extension's Galois group is a 2-group, killed
    by the squares + odd-degree-roots) is a MULTI-NODE BUILD, not a single grind; `Analysis/Polynomial/
    Factorization.lean` has degree-≤2 factorization ONLY over concrete `ℝ` (`-- TODO: generalize to real closed
    fields`). The immediately-bankable, trunk-native STRUCTURAL FOUNDATION of the factorization — and the
    inductive SEAM the full alg-closure proof closes — is the degree-2 half of Artin–Schreier. THE TRUNK REFRAME
    (THE ONE LAW): over `Cut`, every NONNEGATIVE element is a square (N57 `cutSqrt` — the order-completeness of
    the derived ℝ, real-closed-by-squares); for `z = a + b·i ∈ Cut[i]` the modulus `|z| = √(a²+b²)` exists
    (`a²+b² ≥ 0`), and the classical formula `√((|z|+a)/2) + (b/(2·that))·i` (pure-negative-real fallback
    `i·√(−a)`) is a square root of `z`; Gaussian SURJECTIVITY (`mk_surjective` + `%ₘ` +
    `eq_X_add_C_of_natDegree_le_one`) lifts this to EVERY element; `CharZero Cut[i]` (transferred from `Cut`'s
    `CharZero` along the injective `algebraMap`) + `exists_quadratic_eq_zero` gives degree-2 closure. BANKED:
    `factIrredCutQuad01` (`Fact (Irreducible (cutQuad 0 1))` from N80, `Cut[i]` a field via `AdjoinRoot.instField`);
    `Cuti`/`cutiI`/`cutiOf`; ★ `cutiI_sq` (`cutiI² = −1`); ★ `cutiI_ne_zero` (NON-VACUITY W8); ★ `cuti_finrank_eq_two`
    (`finrank Cut Cut[i] = 2`); `cuti_surjective_gauss`; `cutiGauss_sq`; `cutiMod`/`cutiMod_sq`/`cutiMod_nonneg`/
    `cutiMod_add_re_nonneg` (the modulus `√(a²+b²)` riding N57 `cutSqrt`); ★ `cutiGauss_isSquare` (every Gaussian
    element is a square — the trunk-native heart); `cuti_charZero`; ★★ `cuti_isSquare` (EVERY element of `Cut[i]`
    is a square); ★★ `cuti_quadratic_has_root` (`Cut[i]` is DEGREE-2-CLOSED — every quadratic has a root, the
    degree-2 half of Artin–Schreier). DERIVED from the trunk (the square-extraction DESCENDS from `cutSqrt` N57 —
    the order-completeness of the derived ℝ `Cut`; `AdjoinRoot`, `mk_surjective`, `exists_eq_X_add_C_of_natDegree_le_one`,
    `exists_quadratic_eq_zero`, `charZero_of_injective_algebraMap` standard MACHINERY on the DERIVED `Cut`, STANDARD §3).
    NO posited algebraic closure, NO Mathlib ℝ/ℂ as content, NO bridge. W9: a LIGHT node — scratch probes each clean
    ≤11s, production 9.5s, all 11 decls foundations-only at first compile, KILL=120s never approached. Words-removable:
    delete "Lorentz/spectral/eigen*/self-adjoint/real-closed/Artin-Schreier/algebraic-closure/seed/even-dim/Spin/SO(9)/
    isometry" → over the derived complete ordered field `Cut` (every nonneg a square), the quadratic extension
    `Cut[X]/(X²+1)` is a field in which every element is a square and every quadratic has a root; pure field/algebra
    math. W3 DECOMPOSE: the FULL algebraic closure `IsAlgClosed Cut[i]` (the Galois/Sylow 2-group argument Mathlib
    lacks) + the even-dim seed + the full existence + the GLOBAL polar/KAK assembly + connectedness + reverse
    surjectivity + `Spin(9)→SO(9)` exhaustion childed N82.

  - **N82 LANDED — THE FULL ARTIN–SCHREIER ALGEBRAIC CLOSURE `IsAlgClosed Cut[i]`** (`Phys/Algebra/LorentzContinuumAlgClosure.lean`,
    5 production decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the
    built olean; gate D0–D6 GREEN; costume C113 `1 = 15`). THE CROWN of the long Artin–Schreier arc N77→N82: the
    quadratic extension `Cut[i] = Cut[X]/(X²+1)` of the derived ℝ `Cut` is ALGEBRAICALLY CLOSED — the classical
    theorem that a real closed field `R` has `R[i]` algebraically closed, the content Mathlib genuinely LACKS
    (re-confirmed N80/N81: `grep Sylow FieldTheory/` → NOTHING; `IsRealClosed` a 127-line stub; no real-closed→alg-closed
    theorem). BUILT (W1 BUILD-don't-posit) over the banked trunk by a pure group-theoretic 2-power descent. BANKED:
    ★ `cut_no_odd_ext` (every finite ODD-degree field extension of `Cut` is trivial — the primitive element's monic
    odd-degree minpoly has a root by N77 `cut_odd_degree_has_root`, irreducible-with-a-root ⟹ degree 1);
    ★ `cut_galois_finrank_two_power` (every finite GALOIS extension `M/Cut` has 2-power degree — a 2-Sylow `P ≤ Gal(M/Cut)`
    has fixed field of ODD degree `[G:P]` over `Cut`, hence degree 1 by `cut_no_odd_ext`, forcing `P = G`; the
    Sylow-in-field-theory glue Mathlib lacks); ★ `cuti_no_deg_two_ext` (`Cut[i]` has NO degree-2 field extension — a
    degree-2 extension's primitive-element minpoly is a monic irreducible quadratic, but every quadratic over `Cut[i]`
    has a root by N81 `cuti_quadratic_has_root`, hence reducible — contradiction); ★ `cuti_galois_two_group_trivial`
    (a finite GALOIS 2-group extension `M/Cut[i]` of degree `2^n` is trivial — a Sylow index-2 subgroup `K` has fixed
    field a degree-2 extension of `Cut[i]`, impossible by `cuti_no_deg_two_ext`); ★★★ `cuti_isAlgClosed`
    (`IsAlgClosed Cut[i]` via `IsAlgClosed.of_exists_root`: for a monic irreducible `p` over `Cut[i]`, the normal closure
    of `Cut[i][X]/(p)` over `Cut` inside an algebraic closure is finite GALOIS of 2-power degree `2^n`; the degree-2
    tower `Cut ⊆ Cut[i] ⊆ M` (`cuti_finrank_eq_two`) gives `finrank Cut[i] M = 2^(n-1)`, `M` is GALOIS over `Cut[i]`
    (tower-top), so `cuti_galois_two_group_trivial` forces `finrank Cut[i] M = 1`; the tower `Cut[i] ⊆ K ⊆ M` forces
    `finrank Cut[i] K = 1`, i.e. `deg p = 1`, so `p` has root `-(p.coeff 0)`). DERIVED from the trunk (the closure
    DESCENDS from `cut_isRealClosed` N77 — the order-completeness of the derived ℝ `Cut` — plus the degree-2-closure N81;
    `Field.exists_primitive_element`, `Sylow.exists_subgroup_card_pow_prime`, `IntermediateField.normalClosure`,
    `IsGalois.normalClosure`, `IsAlgClosure.isGalois`, `Module.finrank_mul_finrank`, `AdjoinRoot.powerBasis` standard
    MACHINERY on the DERIVED `Cut`/`Cut[i]`, STANDARD §3). NO posited algebraic closure, NO Mathlib ℝ/ℂ as content, NO
    bridge. W6 VERIFY-THEN-FINALIZE: the prior run (248) committed bricks A+B (`58e4501`), added C+D uncommitted (olean
    built 17:31) but TIMED OUT before the assembly; this run audited the inherited bricks, banked C+D (`7b86a47`), PROVED
    the crown (`6c5f491`) — not a blind rebuild. W9: a MEASURED node — assembly skeleton probed for instance resolution
    (32s) before the proof; full proof clean 10s, all 5 decls foundations-only at first compile, KILL=200s never
    approached. Words-removable: delete "Lorentz/spectral/eigen*/real-closed/Artin-Schreier/algebraic-closure/Galois/
    Sylow/seed/even-dim/Spin/SO(9)/isometry" → over the derived complete ordered field `Cut` in which every odd-degree
    polynomial has a root, the quadratic extension `Cut[X]/(X²+1)` is ALGEBRAICALLY CLOSED; pure field/group/polynomial
    math. W3 DECOMPOSE: the real-closed FACTORIZATION + even-dim seed + full existence + global polar/KAK assembly +
    connectedness + reverse surjectivity + `Spin(9)→SO(9)` exhaustion childed N83.

  - **N83 LANDED — THE REAL-CLOSED FACTORIZATION → THE EVEN-DIM REAL-EIGENVALUE SEED** (`Phys/Algebra/LorentzContinuumRealFactor.lean`,
    3 production decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built
    olean; gate D0–D6 GREEN; costume C114 `2 = 5`). USING the banked N82 `cuti_isAlgClosed`, an arbitrary monic
    characteristic polynomial over the derived ℝ `Cut` factors into LINEAR × NEGATIVE-DISCRIMINANT-QUADRATIC factors, and
    consequently EVERY `EvC`-self-adjoint operator on `STVC` has a REAL eigenvalue — completing the spectral SEED at EVERY
    rung (odd via N77 `dim_odd_has_eigenvector`, EVEN via this). THE W1 REFRAME that made it LIGHT: rather than the
    conjugate-pair `i ↦ −i` descent the N82 frontier sketched, the cleaner route is purely degree-theoretic — Mathlib's
    `Polynomial.Irreducible.natDegree_dvd_finrank` says an irreducible `p` that SPLITS over an extension `L` has
    `p.natDegree ∣ finrank Cut L`; with `L = Cut[i]` (alg-closed by N82, so `IsAlgClosed.splits` gives the split) and
    `finrank Cut Cut[i] = 2` (N81), every irreducible `Cut`-polynomial has `natDegree ≤ 2` directly, no explicit
    conjugation automorphism needed. BANKED: ★ `cut_irreducible_natDegree_le_two` (the real-closed irreducible-degree
    bound — the content Mathlib lacks, `Analysis/Polynomial/Factorization` concrete-ℝ-only); ★★ `cut_no_root_factors_negDisc`
    (a monic `p` with no root in `Cut` factors as a `List`-product of neg-disc monic quadratics, by strong induction on
    `natDegree`: each irreducible factor has degree exactly 2 — `≤ 2` by the bound, `≥ 1` irreducible, `≠ 1` since a
    degree-1 factor gives a root — and neg-disc by N80 `cut_monic_quad_irreducible_iff_negDisc`); ★★★
    `cut_selfadj_has_eigenvalue` (THE EVEN-DIM REAL-EIGENVALUE SEED: `∃ μ, g.HasEigenvalue μ` for every `EvC`-self-adjoint
    `g` — else charpoly has no root (`hasEigenvalue_iff_isRoot_charpoly`), so is a pure neg-disc-quadratic product,
    forbidden by N78 `selfadj_no_pure_quad_charpoly`). DERIVED from the trunk (the splitting DESCENDS from `cuti_isAlgClosed`
    N82 → `cut_isRealClosed` N77 → the order-completeness of the derived ℝ `Cut`; the eigenvalue obstruction is N78 →
    the positive-definite Born form `EvC`; `IsAlgClosed.splits`, `Polynomial.Irreducible.natDegree_dvd_finrank`,
    `exists_monic_irreducible_factor`, `isMonicOfDegree_two_iff`, `Module.End.hasEigenvalue_iff_isRoot_charpoly`,
    `aeval_self_charpoly` standard MACHINERY on the DERIVED objects, STANDARD §3). NO posited algebraic closure, NO Mathlib
    ℝ/ℂ as content, NO bridge. W9: a LIGHT node — bound probe clean 7.4s, factorization + seed probe clean 7.5s, production
    13.9s cold, all 3 decls foundations-only at first compile, KILL=180s never approached. Words-removable: delete
    "Lorentz/spectral/eigenvalue/eigenvector/self-adjoint/characteristic/factorization/irreducible/real-closed/seed/even-dim/
    Spin/SO(9)/isometry" → over the derived complete ordered field `Cut` whose degree-2 extension is algebraically closed,
    every irreducible `p ∈ Cut[X]` has `natDegree ≤ 2`, every monic `p` with no root factors into neg-disc quadratics, and
    every `EvC`-symmetric endomorphism of the finite-dim `Cut`-space `STVC` has a `μ : Cut` with a nonzero `μ`-eigenvector;
    pure field/polynomial/linear-algebra math. W3 DECOMPOSE: the FULL existence `∀ g, ∃ c u, g = specOpN c u` + the GLOBAL
    polar/KAK assembly + connectedness + reverse surjectivity + the `Spin(9)→SO(9)` exhaustion childed N84.

  - **N84 LANDED — THE SUBMODULE REAL-EIGENVALUE SEED → THE PARITY-FREE DEFLATION RE-SEED** (`Phys/Algebra/LorentzContinuumSubSeed.lean`,
    12 production decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the
    built olean; gate D0–D6 GREEN; costume C115 `1 = 7`). The N83 real-eigenvalue seed (`cut_selfadj_has_eigenvalue`,
    banked only on the whole `STVC`) lifted to an ARBITRARY finite-dimensional submodule `W ≤ STVC`: every `EvC`-symmetric
    `Cut`-endomorphism `T` of `W` (symmetric w.r.t. the AMBIENT positive-definite reference form `EvC` on coercions) has a
    REAL eigenvalue `∃ μ : Cut, T.HasEigenvalue μ` (`submodule_selfadj_has_eigenvalue`). THE PAYOFF: this REMOVES THE LAST
    PARITY GATE in the full spectral-existence deflation induction. N79 banked the deflation re-seed
    (`deflateRestrict_odd_reseed`) only at ODD `finrank (uPerp u)` via N77 `dim_odd_has_eigenvector`, and N78–N83 spent the
    whole Artin–Schreier arc (real-closed factorization → alg-closed `Cut[i]`) just to lift the seed to EVEN dimension on
    `STVC`; here the seed is lifted to EVERY submodule rung in one stroke, so the re-seed becomes UNCONDITIONAL (any
    parity) — `deflateRestrict_reseed` / `deflateRestrict_reseed_unit` DROP the `Odd` hypothesis entirely. THE W1 REFRAME
    that made it LIGHT: rather than a new argument, the N83 seed proof is lifted verbatim to `W` and the N78
    complete-the-square injectivity ported to the ambient form on coercions — the SAME Cayley–Hamilton /
    positive-definite-`EvC` / real-closed-factorization machine, now on a strictly-smaller invariant subspace. BANKED:
    `IsEvCSymmSub` (the submodule symmetry predicate w.r.t. the ambient `EvC` on coercions — exactly the shape N79
    `deflateRestrict_isEvCSymm` produces); `subQuad_apply_coe`/`subQuad_form` (the operator-quadratic coercion + diagonal
    form value `α + b·β + c·γ`); ★★ `subQuad_pos` (strict positivity for `b² < 4c`, `v ≠ 0`: Cauchy–Schwarz from
    `EvC_nonneg` + completing the square, on the positive-definite `EvC` N58); ★★ `subQuad_injective` (the even-rung
    obstruction remover on `W`); `subQuad_isUnit` (finite-dim ⟹ injective ⟹ bijective ⟹ unit); `subAeval_quad_eq`/
    `subAeval_quad_isUnit` (the `aeval T` bridge + unit); `subSelfadj_no_pure_quad_charpoly` (Cayley–Hamilton — charpoly
    not a pure neg-disc-quadratic product on the nontrivial `W`); ★★★ `submodule_selfadj_has_eigenvalue` (the submodule
    seed — the parity-free input); ★★ `deflateRestrict_reseed` (the unconditional re-seed, drops N79's `Odd`); ★★★
    `deflateRestrict_reseed_unit` (the UNIT-normalized parity-free re-seed — `EvC v v = 1`, exactly the `EvC u u = 1` shape
    the N70 `deflateC` engine consumes at the next rung, via `cutSqrt` N57). DERIVED from the trunk (the factorization
    DESCENDS from `cut_no_root_factors_negDisc` N83 → `cuti_isAlgClosed` N82 → `cut_isRealClosed` N77 → the
    order-completeness of the derived ℝ `Cut`; the eigenvalue obstruction is the positive-definite Born form `EvC` N58; the
    unit normalization is `cutSqrt` N57; the re-seed restricts the deflated operator to the EvC-orthogonal complement
    `uPerp u` N79; `injective_iff_surjective`, `Module.End.isUnit_iff`, `aeval_self_charpoly`, `map_list_prod`,
    `Module.nontrivial_of_finrank_pos`, `hasEigenvalue_iff_isRoot_charpoly`, `exists_hasEigenvector` standard MACHINERY on
    the DERIVED objects, STANDARD §3). NO posited algebraic closure, NO Mathlib ℝ/ℂ as content, NO bridge. W9: a LIGHT node
    — the full submodule-seed + re-seed probe compiled clean 8.9–9.2s (a direct port of the banked N78/N83 argument),
    production built 7.9s, all 12 decls foundations-only at first compile, KILL=180s never approached. Words-removable:
    delete "Lorentz/spectral/eigenvalue/eigenvector/self-adjoint/positive-definite/discriminant/quadratic/seed/re-seed/
    parity/even/odd/dimension/rank/deflation/Spin/SO(9)/isometry/obstruction/characteristic/complement" → over the derived
    complete ordered field `Cut` and the symmetric positive-definite bilinear form `EvC`, for a finite-dim `Cut`-submodule
    `W ≤ STVC` and a `Cut`-endomorphism `T` of `W` symmetric w.r.t. the ambient `EvC` on coercions, the characteristic
    polynomial of `T` has a root in `Cut`, and the restricted difference operator `deflateC g l u` on the codim-one kernel
    `uPerp u` has a nonzero and a unit-normalized eigenvector inside `uPerp u`; pure field/linear-algebra math. W3
    DECOMPOSE: the FULL existence `∀ g, ∃ c u, g = specOpN c u` + the GLOBAL polar/KAK assembly + connectedness + reverse
    surjectivity + `Spin(9)→SO(9)` exhaustion childed N85.

  - **N85 LANDED — THE FULL n-DIM SPECTRAL EXISTENCE `∀ g, IsEvCSymm g → ∃ n l u, (EvC-orthonormal) ∧ g = specOpN l u`**
    (`Phys/Algebra/LorentzContinuumSpectralExistFull.lean`, 4 production decls foundations-only `[propext, Classical.choice,
    Quot.sound]`, independently axiom-audited vs the built olean; gate D0–D6 GREEN; costume C116 `4 = 13`). Every
    `EvC`-self-adjoint endomorphism `g` of `STVC = Cut × Cut × O Cut` equals the rank-`n` spectral operator
    `specOpN l u := ∑ i, (l i) • projC (u i)` for an `EvC`-ORTHONORMAL eigen-family `{u i}` — THE SPECTRAL THEOREM (every
    symmetric operator has an orthonormal eigenbasis), derived inside the chain with NO Mathlib spectral theory, NO Mathlib
    ℝ/ℂ. The HEAVY group-manifold core the whole N78–N84 arc fed. THE W1 REFRAME that made it LIGHT (the two subtle parts
    the N84 frontier flagged DISSOLVED under the trunk): (a) the forward `Σᵢ λᵢ Pᵢ` reconstruction is NOT a fresh sum — it is
    the N70 deflation peel REVERSED, since `deflateC h μ u = h − μ • projC u`, the snoc-accumulation
    `specOpN (snoc l μ) (snoc u uₖ) = specOpN l u + μ • projC uₖ` (`specOpN_snoc`, a one-line `Fin.sum_univ_castSucc`)
    reverses the peel exactly; (b) the nested-complement orthonormality is carried by a SINGLE support-submodule invariant —
    the strong induction runs over a support submodule `W` with `image(h) ⊆ W`, peeling into `W ⊓ uPerp u` each rung, so every
    previously-peeled direction is `EvC`-orthogonal to the current `W` by construction (`uPerp u`) and `Fin.snoc` preserves
    orthonormality with a two-line `Fin.lastCases` split. BANKED: ★ `specOpN_snoc` (the snoc accumulation — the forward
    reconstruction, the deflation peel reversed); ★★ `finrank_inf_uPerp_within` (THE CODIM-ONE DROP WITHIN `W`:
    `finrank (W ⊓ uPerp u) = finrank W − 1` for a UNIT `u ∈ W`, rank–nullity on the functional `φ : W →ₗ Cut`, `p ↦ EvC u p`,
    SURJECTIVE for a unit `u ∈ W`, `Submodule.equivMapOfInjective` identifying `ker φ` with `W ⊓ uPerp u` — the within-`W`
    analogue of N79's `uPerp_finrank`, the genuine new technical lemma); ★★ `specExists_aux` (THE EXISTENCE HELPER:
    `Nat`-recursion on `m = finrank W` — base `m = 0` ⟹ `W = ⊥` ⟹ `h = 0 = specOpN ![] ![]`; step extracts a unit eigenpair
    via the PARITY-FREE submodule seed `submodule_selfadj_has_eigenvalue` N84, deflates, recurses on the strictly-smaller
    `W ⊓ uPerp u` — `finrank` drops by exactly one — accumulating the eigenpair LIST via `Fin.snoc`; the even-rung
    obstruction that gated N78–N84 is GONE, NO parity case-split); ★★★ `stvc_selfadj_specExists` (THE FULL EXISTENCE, the
    `W = ⊤` specialization). DERIVED from the trunk (the real eigenvalue at every rung DESCENDS from
    `submodule_selfadj_has_eigenvalue` N84 → `cut_no_root_factors_negDisc` N83 → `cuti_isAlgClosed` N82 → `cut_isRealClosed`
    N77 → the order-completeness of the derived ℝ `Cut`; the eigenprojection is the positive-definite Born form `EvC` N58; the
    unit normalization is `cutSqrt` N57; the deflation engine is `deflateC` N70; the codim-one complement is `uPerp` N79; the
    spectral operator is `specOpN` N68; `Fin.sum_univ_castSucc`, `Fin.snoc`, `Fin.lastCases`,
    `LinearMap.finrank_range_add_finrank_ker`, `Submodule.equivMapOfInjective`, `Submodule.finrank_eq_zero`,
    `Module.nontrivial_of_finrank_pos`, `LinearMap.restrict` standard MACHINERY on the DERIVED objects, STANDARD §3). NO
    posited inner product / spectral theorem, NO Mathlib ℝ/ℂ as content, NO bridge. W9: a LIGHT node — the two new technical
    pieces probed clean 8.3s, the full induction helper + final existence probed clean 8.6s, production built 8.3s, all 4
    decls foundations-only at first compile, KILL=180s never approached. Words-removable: delete "Lorentz/spectral/eigen*/
    self-adjoint/orthonormal/diagonal/seed/re-seed/deflation/peel/descent/dimension/rank/existence/complement/Spin/SO(9)/
    isometry/polar/KAK" → over the derived complete ordered field `Cut` and the positive-definite symmetric form `EvC`, every
    `EvC`-symmetric endomorphism of the finite-dim `Cut`-space `STVC` equals `∑ i, (l i) • projC (u i)` for a family `{u i}`
    with `EvC (u i) (u j) = δᵢⱼ`; pure linear-algebra math. W3 DECOMPOSE: the GLOBAL polar/KAK assembly + connectedness +
    reverse surjectivity + `Spin(9)→SO(9)` exhaustion childed N86.

  - **N86 LANDED — THE GLOBAL POLAR POSITIVE PART** (`Phys/Algebra/LorentzContinuumPolarPositive.lean`, 8 production
    decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built olean;
    gate D0–D6 GREEN; costume C117 `36 = 9`). For an ARBITRARY operator `g : Module.End Cut STVC` with an `EvC`-adjoint
    `h` (`IsEvCAdjoint g h`), the form-adjoint composite `g*g = h∘g` is `EvC`-self-adjoint (N59 `comp_isEvCSymm`) AND
    positive (N59 `comp_nonneg`), so by the FULL spectral existence N85 `stvc_selfadj_specExists` it equals `specOpN c u`
    over an `EvC`-ORTHONORMAL eigen-family with EVERY eigenvalue `0 ≤ c i`, and its POSITIVE OPERATOR SQUARE ROOT exists
    and is `specOpN (cutSqrt ∘ c) u` (N68 `specOpN_op_sqrt`) — the `p^{1/2}` factor of the polar decomposition
    `g = k·p^{1/2}`. The N66 CONCRETE polar positive part lifted to the GLOBAL case (an arbitrary `g`, no block/structured
    hypothesis). THE W1 REFRAME that made it LIGHT: the polar decomposition's hard half — that `p = g*g` HAS a positive
    operator square root — IS the spectral theorem applied to the positive-semidefinite `g*g`, every ingredient banked:
    diagonalize via N85, take `√c_i ≥ 0` per eigenvalue via N57/N68, the eigenvalues nonneg because the diagonal reader
    `specOpN_read` reads `c_k = EvC (g*g u_k) u_k ≥ 0` (N59 = Born self-overlap positivity N56 at the operator level).
    BANKED: `specOpN_eigenvector` (the eigenvector action `specOpN c u (u k) = c k • u k` — the off-diagonal collapse);
    `specOpN_orth_ne_zero` (a unit eigenvector is nonzero, N58); ★ `specExists_eigen_nonneg` (positive-semidefinite ⟹
    every `0 ≤ c k` via `specOpN_read`); `specExists_eigen_ne_zero` (injective ⟹ every `c k ≠ 0`); ★ `specExists_eigen_pos`
    (positive-semidefinite + injective ⟹ `0 < c k` — the invertibility lever toward `(p^{1/2})⁻¹` and the compact part
    `k := g·(p^{1/2})⁻¹`); ★★ `comp_specExists_nonneg` (THE GLOBAL POSITIVE PART existence form: `g*g = specOpN c u` over
    an orthonormal family with every `0 ≤ c i`); ★★★ `comp_op_sqrt_exists` (THE GLOBAL POSITIVE OPERATOR SQUARE ROOT:
    `g*g` ALWAYS has a positive operator square root `specOpN (cutSqrt ∘ c) u` for an ARBITRARY `g` — the `p^{1/2}`
    factor); ★ `boostGenC_comp_op_sqrt_exists` (NON-VACUITY: the global theorem on the concrete banked self-adjoint boost
    generator's `g*g`). DERIVED from the trunk (`g*g` positivity = N59 `comp_nonneg` = N58 `EvC_nonneg` = N56 Born
    self-overlap positivity `gFormC_nonneg`; the spectral existence = N85 ← N84 ← … ← the order-completeness of the derived
    ℝ `Cut`; the operator √ = N68 `specOpN_op_sqrt` = N57 `cutSqrt` per N63 `projC`; `Finset.sum_eq_single`,
    `lt_of_le_of_ne` standard MACHINERY on the DERIVED objects, STANDARD §3). NO posited inner product / spectral theorem /
    operator polar decomposition, NO Mathlib ℝ/ℂ as content, NO bridge. W9: a LIGHT node — the full probe family compiled
    clean 7.6s, production built 6.0s, all 8 decls foundations-only at first compile, KILL=180s/obligation never
    approached; generic `orth_ne_zero` prefixed to `specOpN_orth_ne_zero` — no collisions. Words-removable: delete
    "Lorentz/polar/KAK/positive part/square-root/spectral/eigen*/self-adjoint/orthonormal/isometry/compact/orthogonal/
    Spin/SO(9)/boost" → over the derived complete ordered field `Cut` and the positive-definite symmetric form `EvC`, for
    any `Cut`-endomorphisms `g, h` of `STVC` with `∀ p q, EvC (g p) q = EvC p (h q)`, the composite `h∘g` equals
    `∑ i, (c i)•projC (u i)` for a family with `EvC (u i)(u j) = δᵢⱼ` and every `0 ≤ c i`, and `∑ i, cutSqrt (c i)•projC (u i)`
    squares to it; pure linear-algebra math. W3 DECOMPOSE: the resolution-of-identity, the operator inverse `(p^{1/2})⁻¹`,
    the compact part `k` with `k*k = 1`, connectedness, the global reverse surjectivity, and the `Spin(9)→SO(9)` exhaustion
    childed N87.

  - **N87 LANDED — THE RESOLUTION-OF-IDENTITY → THE OPERATOR INVERSE `(p^{1/2})⁻¹`** (`Phys/Algebra/LorentzContinuumResolutionId.lean`,
    7 production decls foundations-only `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built
    olean; gate D0–D6 GREEN; costume C118 `21 = 1`). The `EvC`-ORTHONORMAL eigen-family the FULL spectral existence
    N85 `stvc_selfadj_specExists` returns on the IDENTITY operator has projector sum `∑ i, projC (u i) = LinearMap.id`
    (`stvc_resolution_of_identity`) — the resolution-of-identity / completeness of the spectral basis — so the
    reciprocal-eigenvalue spectral operator is a two-sided operator INVERSE `specOpN c u ∘ specOpN (c⁻¹) u = id` when
    every `c i ≠ 0` (`specOpN_inverse` / `specOpN_inverse_right`) — the `(p^{1/2})⁻¹` step of the polar/KAK assembly
    `g = k·p^{1/2}`, `k := g·(p^{1/2})⁻¹`. THE W1 REFRAME that made it LIGHT (THE ONE LAW): the classical
    resolution-of-identity `∑ P_i = id` is the completeness/spanning of the eigenbasis, normally a `finrank` dimension
    count; the trunk DISSOLVES it — the IDENTITY operator is `EvC`-self-adjoint (trivially, `lid_isEvCSymm`), so by the
    FULL spectral existence N85 it equals `specOpN l u` for an `EvC`-ORTHONORMAL family `{u i}`; the diagonal reader
    `specOpN_read` reads each eigenvalue `l k = EvC (id (u k)) (u k) = EvC (u k)(u k) = 1`, so `id = specOpN (fun _ => 1) u
    = ∑ i, projC (u i)` — completeness FALLS OUT of the spectral existence applied to the identity, NO separate
    spanning/`finrank` argument (exactly as MEASURE-FIRST priority (i) anticipated, the 5-line route). BANKED:
    `lid_isEvCSymm` (`id` is `EvC`-self-adjoint, trivially); `specOpN_one_eq_sum_projC` (all-ones eigenvalues give the bare
    projector sum); ★ `specOpN_comp_two` (THE TWO-FAMILY SPECTRAL COMPOSITION LAW: for an `EvC`-orthonormal family,
    `specOpN l u ∘ specOpN m u = specOpN (l·m) u` — N68 `specOpN_comp` generalized from `l = m` to two distinct eigenvalue
    families, the lever that turns the reciprocal family into the inverse); ★★ `stvc_resolution_of_identity` (THE
    RESOLUTION-OF-IDENTITY: `∑ i, projC (u i) = id` from N85 on the identity); ★★ `specOpN_inverse` (THE OPERATOR LEFT
    INVERSE — the `(p^{1/2})⁻¹` step); `specOpN_inverse_right` (the RIGHT inverse); ★ `stvc_specOpN_const_invertible`
    (NON-VACUITY: the concrete eigenvalue-`2` operator on the resolving family has a genuine two-sided inverse, eigenvalue
    `2⁻¹`). DERIVED from the trunk (the resolution DESCENDS from the spectral existence N85 ← N84 ← … ← the
    order-completeness of the derived ℝ `Cut`; the eigenprojection is the positive-definite Born form `EvC` N58; the
    two-family composition is the `EvC`-orthonormality off-diagonal collapse N68 `specOpN_EvC_read`; `mul_inv_cancel₀`,
    `inv_mul_cancel₀`, `two_ne_zero`, `LinearMap.ext` standard MACHINERY on the DERIVED objects, STANDARD §3). NO posited
    inner product / spectral theorem / resolution-of-identity, NO Mathlib ℝ/ℂ as content, NO bridge. W9: a LIGHT node —
    the full probe family compiled clean 7s, production built 7.1s, all 7 decls foundations-only at first compile,
    KILL=180s/obligation never approached; all 7 names fresh — no collisions. Words-removable: delete
    "Lorentz/spectral/eigen*/orthonormal/diagonal/projection/resolution-of-identity/inverse/polar/KAK/compact/isometry/
    Spin/SO(9)/self-adjoint/positive-definite" → over the derived complete ordered field `Cut` and the positive-definite
    symmetric form `EvC`, the projector sum `∑ projC u_i` of the family `stvc_selfadj_specExists` returns on `id` equals
    `id`, two spectral operators over an `EvC`-orthonormal family compose by pointwise eigenvalue product, and the
    reciprocal-eigenvalue operator is a two-sided inverse when no eigenvalue vanishes; pure linear-algebra math. W3
    DECOMPOSE: the concrete `(p^{1/2})⁻¹` for the `g*g`-family (via the spanning lemma), the compact part `k` with
    `k*k = 1`, connectedness, the global reverse surjectivity, and the `Spin(9)→SO(9)` exhaustion childed N88.

  - **N88 LANDED — THE CONCRETE `(p^{1/2})⁻¹` FOR THE `g*g`-FAMILY (the spanning / resolution-of-identity lemma for the
    decomposing family)** (`Phys/Algebra/LorentzContinuumGGFamilyInverse.lean`, 9 production decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built olean; gate D0–D6 GREEN; costume
    C119 `16 = 1`). N87 banked the ABSTRACT operator inverse `specOpN_inverse` parameterized by the resolution hypothesis
    `∑ projC u_i = id`; the only gap toward the concrete `(p^{1/2})⁻¹` was that the SPECIFIC `g*g`-family (the one
    `comp_specExists_nonneg` N86 returns on `p = g*g`) RESOLVES the identity — the SPANNING lemma. THIS node banks it, and
    hence the concrete `(p^{1/2})⁻¹` for the `g*g`-family of an INJECTIVE operator `g`. THE W1 REFRAME that made it LIGHT
    (THE ONE LAW): the ROADMAP flagged the cleanest route as possibly strengthening `specExists_aux` (N85) to carry the
    resolution alongside the decomposition; the trunk supplied a CLEANER route that does NOT touch N85's induction — an
    `EvC`-ORTHONORMAL family over which an INJECTIVE spectral operator `specOpN c u` decomposes AUTOMATICALLY resolves the
    identity. The projector sum `P := specOpN (fun _ => 1) u = ∑ projC u_i` is IDEMPOTENT (`specOpN_comp`, `1·1 = 1`); its
    kernel sits inside `ker (specOpN c u)` (if `P v = 0` then every `EvC (u k) v = 0` by `specOpN_EvC_read`, so
    `specOpN c u v = ∑ c_k·0·u_k = 0`); so `specOpN c u` INJECTIVE ⟹ `ker P = 0` ⟹ `P` injective ⟹ `P = id` (an INJECTIVE
    IDEMPOTENT is the identity, `P (P v − v) = 0` + injectivity) — NO finite-dim, NO `finrank` count; the resolution is read
    off INJECTIVITY, not a basis count. And `g*g = h∘g` is injective when `g` is (`(h∘g) v = 0 ⟹ EvC (g v)(g v) = 0 ⟹
    g v = 0`, the positive-definite `EvC` N58 `EvC_eq_zero_iff` ⟹ `v = 0`); the strict positivity `specExists_eigen_pos`
    N86 then gives `0 < c i`, so `cutSqrt (c i) > 0 ≠ 0` (`cutSqrt_pos` N57), and `specOpN_inverse` N87 closes the two-sided
    inverse. BANKED: `injective_idem_eq_id` (an INJECTIVE IDEMPOTENT endomorphism is the identity — pure algebra, no
    finite-dim); `specOpN_one_idem` (the all-ones spectral operator is IDEMPOTENT over an `EvC`-orthonormal family); ★
    `specOpN_ker_sub_of_one` (`specOpN 1 u v = 0 ⟹ specOpN c u v = 0` — the projector-sum kernel sits inside every spectral
    operator's kernel over the family); ★★ `specOpN_resolution_of_injective` (THE SPANNING LEMMA: orthonormal + injective
    `specOpN c u` ⟹ `∑ projC u_i = id`, read off INJECTIVITY, NO dimension count); `comp_injective_of_adjoint`
    (`IsEvCAdjoint g h` + `g` injective ⟹ `g*g` injective, the positive-definite `EvC`); ★★★ `comp_specInverse_exists`
    (THE PAYOFF — the concrete `(p^{1/2})⁻¹` for the `g*g`-family of an injective `g`: `g*g = specOpN c u` over an
    orthonormal family with every `0 < c i`, and the positive operator square root `specOpN (cutSqrt∘c) u` has a CONCRETE
    two-sided inverse `specOpN ((cutSqrt∘c)⁻¹) u`); `smulId_isEvCAdjoint`/`smulId_injective` (the scaled identity `c•id`
    is its own `EvC`-adjoint, injective for `c ≠ 0`); ★ `smulId_comp_specInverse_exists` (NON-VACUITY: the concrete
    injective `3•id` produces a genuine two-sided `(p^{1/2})⁻¹`). DERIVED from the trunk (the resolution-from-injectivity
    DESCENDS from `specOpN_comp` N68 + the positive-definite Born form `EvC` N58 ← N56 ← the order-completeness of the
    derived ℝ `Cut`; the `g*g`-family is `comp_specExists_nonneg` N86 ← N85 ← …; the strict positivity is
    `specExists_eigen_pos` N86; the scalar-root nonvanishing is `cutSqrt_pos` N57; the abstract inverse is `specOpN_inverse`
    N87; `injective_iff_map_eq_zero`, `Finset.sum_eq_zero`, `smul_eq_zero`, `LinearMap.ext` standard MACHINERY on the
    DERIVED objects, STANDARD §3). NO posited inner product / spectral theorem / operator polar decomposition, NO Mathlib
    ℝ/ℂ as content, NO bridge. W9: a LIGHT node — the full spanning + injectivity + payoff probe family compiled clean
    (probe a 16s with imports, probe b 8s, probe c 9s), production built 7.2s, all 9 decls foundations-only at first
    compile, KILL=180s/obligation never approached; all 9 names fresh — no collisions. Words-removable: delete
    "Lorentz/spectral/eigen*/orthonormal/diagonal/projection/resolution-of-identity/spanning/inverse/polar/KAK/compact/
    isometry/Spin/SO(9)/self-adjoint/positive-definite/square-root" → over the derived complete ordered field `Cut` and
    the positive-definite symmetric form `EvC`: an injective idempotent endomorphism is the identity; an `EvC`-orthonormal
    family over which an injective `specOpN c u` decomposes has `∑ projC u_i = id`; for `∀ p q, EvC (g p) q = EvC p (h q)`
    with `g` injective, `h∘g = specOpN c u` for an orthonormal family with every `0 < c i`, and the reciprocal-root
    spectral operator is its two-sided inverse; pure linear-algebra math. W3 DECOMPOSE: the compact part `k := g·(p^{1/2})⁻¹`
    with `k*k = 1` (needing a composition-adjoint lemma not yet banked), CONNECTEDNESS, the GLOBAL reverse KAK surjectivity,
    and the `Spin(9)→SO(9)` exhaustion childed N89.

  - **N89 LANDED — THE COMPOSITION-ADJOINT LEMMA → THE COMPACT PART `k := g·(p^{1/2})⁻¹` WITH `k*k = 1` → THE POLAR
    RECONSTRUCTION `g = k·p^{1/2}`** (`Phys/Algebra/LorentzContinuumCompactPart.lean`, 3 production decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built olean; gate D0–D6 GREEN; costume
    C120 `25 = 1`). N88 banked the concrete two-sided `(p^{1/2})⁻¹` for the `g*g`-family of an injective `g`; the only missing
    prerequisite toward the compact/orthogonal factor was the COMPOSITION-ADJOINT lemma — that the `EvC`-adjoint composes
    CONTRAVARIANTLY. THIS node banks it, the compact part `k*k = 1`, AND the polar assembly `g = k·p^{1/2}`. THE W1 REFRAME
    that made it LIGHT (THE ONE LAW): the classical claim that the polar/KAK orthogonal factor `k = g·p^{-1/2}` is orthogonal
    (`k*k = 1`) is standard via the spectral theorem + operator functional calculus; the trunk DISSOLVES it into banked
    algebra. The `EvC`-adjoint of `k = g∘(p^{1/2})⁻¹` is `(p^{1/2})⁻¹∘h` (the adjoint composes contravariantly via the new
    `IsEvCAdjoint.comp`, and `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u` is `EvC`-self-adjoint by N68 `specOpN_isEvCSymm`, hence
    its OWN adjoint). Pointwise `k*k v = (p^{1/2})⁻¹ (h (g ((p^{1/2})⁻¹ v))) = (p^{1/2})⁻¹ (p^{1/2} (p^{1/2} ((p^{1/2})⁻¹ v)))`
    (using `h∘g = g*g = p^{1/2}∘p^{1/2}` from N68 `specOpN_comp` + N57 `cutSqrt_sq`) `= (p^{1/2})⁻¹ (p^{1/2} v) = v` (the two-sided
    inverse N88), and `g = k∘p^{1/2} = g∘(p^{1/2})⁻¹∘p^{1/2} = g∘id = g` (`LinearMap.comp_assoc` + `LinearMap.comp_id`). BANKED:
    ★ `IsEvCAdjoint.comp` (THE COMPOSITION-ADJOINT LEMMA: `IsEvCAdjoint a a'` + `IsEvCAdjoint b b'` ⟹ `IsEvCAdjoint (a∘b)
    (b'∘a')` — two adjunction steps `EvC ((a∘b) p) q = EvC (b p)(a' q) = EvC p ((b'∘a') q)`, the operator analogue of
    `(ab)* = b*a*`, the missing prerequisite); ★★ `comp_polar_decomposition` (THE COMPACT PART `k*k = 1` + THE POLAR
    RECONSTRUCTION `g = k∘p^{1/2}` — for an injective `g` with `EvC`-adjoint `h`, the `g*g`-family `h∘g = specOpN c u` with
    every `0 < c i`, the compact part `k := g∘(p^{1/2})⁻¹` has `EvC`-adjoint `(p^{1/2})⁻¹∘h`, satisfies `((p^{1/2})⁻¹∘h)∘k =
    LinearMap.id`, and `k∘p^{1/2} = g`); ★ `smulId_comp_polar_decomposition` (NON-VACUITY: the concrete injective `3 • id`
    produces a genuine compact part `k` with `k*k = 1` and a genuine reconstruction `3•id = k∘p^{1/2}`). DERIVED from the
    trunk (the composition-adjoint is the bilinear positive-definite Born form `EvC` N58; the `g*g`-family + concrete two-sided
    `(p^{1/2})⁻¹` is `comp_specInverse_exists` N88 ← N87 ← N86 ← N85 ← … ← the order-completeness of the derived ℝ `Cut`; the
    squaring-back is N68 `specOpN_comp` + N57 `cutSqrt_sq`; `(p^{1/2})⁻¹` self-adjointness is N68 `specOpN_isEvCSymm`;
    `LinearMap.comp_apply`/`comp_assoc`/`comp_id`/`ext`/`congrArg` standard MACHINERY on the DERIVED objects, STANDARD §3). NO
    posited inner product / spectral theorem / operator polar decomposition / functional calculus, NO Mathlib ℝ/ℂ as content,
    NO bridge. W9: a LIGHT node — the full probe family (composition-adjoint + compact part + polar reconstruction +
    non-vacuity) compiled clean 43s (imports cold), production built 11s, all 3 decls foundations-only at first compile,
    KILL=180s/obligation never approached; all 3 names fresh (`IsEvCAdjoint.comp` distinct from the banked
    `IsEvCAdjoint.symm`/`comp_isEvCSymm`/`comp_nonneg`) — no collisions. Words-removable: delete "Lorentz/boost/rotation/
    compact/orthogonal/polar/KAK/Cartan/spectral/eigen*/adjoint/square-root/inverse/isometry/Spin/SO(9)/self-adjoint/
    positive-definite" → over the derived complete ordered field `Cut` and the positive-definite symmetric form `EvC`: for
    `Cut`-linear self-maps with `∀ p q, EvC (a p) q = EvC p (a' q)` and likewise `b, b'`, the composite `a∘b` is paired with
    `b'∘a'`; and for `∀ p q, EvC (g p) q = EvC p (h q)` with `g` injective, `k := g∘(p^{1/2})⁻¹` satisfies `(p^{1/2})⁻¹∘h∘k =
    id` and `k∘p^{1/2} = g`; pure linear-algebra math. W3 DECOMPOSE: CONNECTEDNESS of the isometry group over `Cut`, the GLOBAL
    reverse KAK surjectivity, and the `Spin(9)→SO(9)` exhaustion childed N90.

  - **N90 LANDED — THE SIGNATURE INVOLUTION OPERATOR `J` + THE OPERATOR LORENTZ METRIC CONDITION `gᵀ J g = J`**
    (`Phys/Algebra/LorentzContinuumMetricCondition.lean`, 10 production decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built olean; gate D0–D6 GREEN; costume
    C121 `5 = 1`). N89 banked the full operator-level polar/KAK ASSEMBLY `g = k·p^{1/2}` for an injective `g` with an
    `EvC`-adjoint. The ROADMAP §N90 priority (i) measure — does `g ∈ qvIsomMonoidC` ⟹ the compact part `k := g·(p^{1/2})⁻¹`
    preserve `QvC` (the FULL isometry-compact-part lemma) — finds that lemma needs positive-operator-square-root UNIQUENESS
    (`J p^{1/2} J = (p^{1/2})⁻¹`, so `k` is `J`-orthogonal), which is NOT yet banked. THIS node banks the immediately-bankable
    structural prerequisite that lemma consumes: THE OPERATOR LORENTZ METRIC CONDITION `gᵀ J g = J` — the defining operator
    equation of the (pseudo-)orthogonal group, the structural joint linking the function-level isometry monoid
    `qvIsomMonoidC` (N49) to the linear-operator `EvC`-adjoint / spectral / polar machinery (N58–N89). THE W1 REFRAME that
    made it LIGHT (THE ONE LAW): the classical condition `gᵀ J g = J` is normally matrix algebra against a fixed
    pseudo-metric; the trunk DISSOLVES it via the `EvC`↔`BvC` bridge — the positive-definite reference form `EvC` (N58) and
    the indefinite Minkowski form `BvC` (N51) are related by the SIGNATURE INVOLUTION operator `J := sigOpC : (t,x,v) ↦
    (t,-x,-v)` (the `(1,9)` signature flip N56 made an operator) via `BvC p q = EvC p (J q)` (`BvC_eq_EvC_sigOpC`, pure form
    algebra). A LINEAR isometry `g` preserves the polarized form `BvC (g p)(g q) = BvC p q` (`linIsom_BvC_preserved`, from
    the Born polarization `QvC_polariz` + linearity); pairing through the bridge and `g`'s `EvC`-adjoint `h`,
    `EvC p (h (J (g q))) = EvC (g p)(J (g q)) = BvC (g p)(g q) = BvC p q = EvC p (J q)` for all `p`, so by the
    right-nondegeneracy of `EvC` (`EvC_right_nondegen`, from the positive-definiteness `EvC_eq_zero_iff` N58)
    `h (J (g q)) = J q`, i.e. `h ∘ J ∘ g = J`. BANKED: `sigOpC` / `sigOpC_apply` / `sigOpC_comp_self` (`J∘J = id`,
    involution) / `sigOpC_isEvCAdjoint_self` (`J* = J`); ★★ `BvC_eq_EvC_sigOpC` (THE METRIC-OPERATOR BRIDGE); `QvC_polariz`
    (the Born polarization); ★ `EvC_right_nondegen` (`EvC` right-nondegeneracy); `linIsom_BvC_preserved`; ★★★
    `linIsom_metric_condition` (THE OPERATOR LORENTZ METRIC CONDITION `h ∘ J ∘ g = J`); `boostEndC` /
    `boostEndC_apply` / `boostEndC_isQvIsomC` / `boostEndC_isEvCAdjoint_self`; ★ `boostEndC_metric_condition` (NON-VACUITY:
    a concrete boost `a²−b²=1` satisfies `gᵀ J g = J`). DERIVED from the trunk (the `EvC`↔`BvC` bridge is the polarized
    Born/Minkowski form algebra N51/N56/N58; the right-nondegeneracy is the positive-definiteness `EvC_eq_zero_iff` N58 ←
    N56 Born self-overlap positivity ← the order-completeness of the derived ℝ `Cut`; the `EvC`-adjoint is `IsEvCAdjoint`
    N59; `LinearMap.comp_apply`/`ext`/`map_add`/`mul_left_cancel₀`/`sub_eq_zero` standard MACHINERY on the DERIVED objects,
    STANDARD §3). NO posited inner product / pseudo-metric / Lorentz group, NO Mathlib ℝ/ℂ as content, NO bridge. W9: a LIGHT
    node — the full probe family (signature + bridge + nondegeneracy + metric condition + non-vacuity) compiled clean 8.5s
    (imports cold), production built 6.8s, all 10 decls foundations-only at first compile, KILL=180s/obligation never
    approached; all names fresh — no collisions. Words-removable: delete "Lorentz/boost/rotation/signature/metric/isometry/
    orthogonal/adjoint/Minkowski/Cartan/pseudo-metric" → over the derived complete ordered field `Cut`, with the
    positive-definite symmetric form `EvC` and the indefinite symmetric form `BvC` related by the involution `J : (t,x,v) ↦
    (t,-x,-v)` via `BvC p q = EvC p (J q)`: for a `Cut`-linear `g` preserving the quadratic form `QvC` with `∀ p q,
    EvC (g p) q = EvC p (h q)`, the composite `h ∘ J ∘ g = J`; pure linear-algebra math. W3 DECOMPOSE: the
    sqrt-uniqueness-dependent isometry-compact-part lemma, CONNECTEDNESS of the isometry group over `Cut`, the GLOBAL
    reverse KAK surjectivity, and the `Spin(9)→SO(9)` exhaustion childed N91.

  - **N91 LANDED — THE METRIC-CONDITION CHARACTERIZATION OF THE LINEAR ISOMETRIES + INJECTIVITY + ADJOINT-UNIQUENESS +
    THE TWO-SIDED METRIC CONDITION `g∘J∘h = J` + THE `J`-CONJUGATION INVERSION `J p J = p⁻¹`**
    (`Phys/Algebra/LorentzContinuumIsomMetricChar.lean`, 10 production decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built olean; gate D0–D6 GREEN; costume
    C122 `2 = 8`). N90 banked that the operator Lorentz metric condition `gᵀ J g = J` is NECESSARY for a linear isometry
    (`linIsom_metric_condition`, the `⟹` direction). MEASURE-FIRST (ROADMAP §N91 priority (i)) confirms the FULL
    isometry-compact-part lemma — `g ∈ qvIsomMonoidC` ⟹ the compact part `k := g·(p^{1/2})⁻¹` (N89) preserves `QvC` —
    reduces (via the polar assembly `g = k·p^{1/2}` N89 + the metric condition `h∘J∘g = J` N90) to `J p^{1/2} J =
    (p^{1/2})⁻¹` — POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS lifted to the operator via the spectral resolution, the genuine
    W1 spectral remainder, NOT yet banked. THIS node banks the IMMEDIATELY-BANKABLE structural pieces the compact-part
    lemma consumes: the full METRIC-CONDITION CHARACTERIZATION of the linear isometries. THE W1 REFRAME that made it LIGHT
    (THE ONE LAW): both remaining directions DISSOLVE via the SAME `EvC`↔`BvC` bridge — (THE CONVERSE `⟸`) for a linear
    `g` with `EvC`-adjoint `h`, if `h∘J∘g = J` then `QvC (g p) = BvC (g p)(g p) = EvC (g p)(J (g p)) = EvC p (h (J (g p)))
    = EvC p ((h∘J∘g) p) = EvC p (J p) = BvC p p = QvC p`, so `g` is a `QvC`-isometry — the linear isometries are EXACTLY
    the solutions of the operator metric equation; (INJECTIVITY) `h∘J∘g = J` with `J` injective (an involution) forces `g`
    injective; (THE TWO-SIDED CONDITION `g∘J∘h = J`) with `g` bijective over the FINITE-DIMENSIONAL `Cut`-module `STVC`
    (`LinearMap.injective_iff_surjective`, the field IS the DERIVED `Cut`), `m := J∘h∘J` is the two-sided inverse of `g`,
    giving `g∘J∘h∘J = id`, hence `g∘J∘h = J`; (THE `J`-CONJUGATION INVERSION `J p J = p⁻¹`, `p := g*g`) `J p J p =
    J∘h∘g∘J∘h∘g = J∘h∘(g∘J∘h)∘g = J∘h∘J∘g = J∘(h∘J∘g) = J∘J = id`, pure composition algebra — NO sqrt, NO spectral
    inverse — THE PRECISE LEVER the operator-sqrt-uniqueness step (`J p^{1/2} J = (p^{1/2})⁻¹`, childed) consumes to land
    the compact part in the maximal compact. BANKED: ★ `metric_condition_imp_isQvIsom` (THE CONVERSE of N90);
    `isEvCAdjoint_right_unique` (the `EvC`-adjoint is unique, `EvC` right-nondegeneracy); `sigOpC_injective` (`J`
    injective); `linIsom_injective` (a linear isometry with an `EvC`-adjoint is injective); ★★ `isQvIsom_iff_metric_condition`
    (THE FULL CHARACTERIZATION `IsQvIsomC g ↔ h∘J∘g = J`); ★ `linIsom_inverse_metric_condition` (THE TWO-SIDED METRIC
    CONDITION `g∘J∘h = J`, bijectivity); ★★★ `linIsom_posPart_J_conj_inv` (THE `J`-CONJUGATION INVERSION `J∘(h∘g)∘J∘(h∘g)
    = id`); `boostEndC_metric_char` / `boostEndC_inverse_metric_condition` / `boostEndC_posPart_J_conj_inv` (NON-VACUITY:
    a concrete boost `a²−b²=1` realises the characterization, the two-sided condition, and the `J`-conjugation inversion).
    DERIVED from the trunk (the `EvC`↔`BvC` bridge is the polarized Born/Minkowski form algebra N51/N56/N58/N90; the
    right-nondegeneracy is the positive-definiteness `EvC_eq_zero_iff` N58 ← the order-completeness of the derived ℝ `Cut`;
    the metric condition is `linIsom_metric_condition` N90; `Module.Finite Cut STVC` resolves over the DERIVED `Cut`,
    `LinearMap.injective_iff_surjective`, `LinearMap.comp_apply`/`comp_assoc`/`comp_id`/`ext` standard MACHINERY on the
    DERIVED objects, STANDARD §3 — `injective_iff_surjective` independently confirmed to keep the bijectivity-using theorem
    foundations-only, NO Mathlib ℝ content leaked). NO posited inner product / pseudo-metric / Lorentz group, NO Mathlib
    ℝ/ℂ as content, NO bridge. W9: a LIGHT node — the converse + adjoint-uniqueness + injectivity + iff probe family
    compiled clean 10.5s, the inverse-metric + `J`-conjugation family clean 8s (imports cold), production built 24s cold /
    6.2s warm, all 10 decls foundations-only at first compile, KILL=180s/obligation never approached; all 10 names fresh —
    no collisions. Words-removable: delete "Lorentz/boost/signature/metric/isometry/orthogonal/adjoint/compact/spectral/
    square-root/inverse/group/connected/Spin/SO(9)" → over the derived complete ordered field `Cut`, with `EvC`
    positive-definite and `BvC` indefinite related by `J` via `BvC p q = EvC p (J q)`: a `Cut`-linear `g` with
    `∀ p q, EvC (g p) q = EvC p (h q)` preserves `QvC` IFF `h ∘ J ∘ g = J`; injective; `h` unique; `g∘J∘h = J`;
    `J∘(h∘g)∘J∘(h∘g) = id`; pure linear-algebra math. W3 DECOMPOSE: the operator-sqrt-uniqueness lemma + the FULL
    isometry-compact-part lemma, CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and the `Spin(9)→SO(9)` exhaustion
    childed N92.

  - **N92 LANDED — THE `J`-CONJUGATION OF A POSITIVE OPERATOR SQUARE ROOT + THE TWO POSITIVE OPERATOR SQUARE ROOTS OF
    `p⁻¹` (`J p^{1/2} J` and `(p^{1/2})⁻¹`)**, over the derived ℝ `Cut` + the terminal algebra `O Cut`. MEASURE-FIRST
    (§N92 priority (i)) confirmed that the GENERAL operator-sqrt UNIQUENESS over the 10-dim derived `Cut`-module `STVC`
    (the two roots live over DIFFERENT eigen-families `u` and the spectral family of the conjugate, no shortcut) is the
    genuine W1 spectral remainder; so this node banks the immediately-bankable, FORCED structural SETUP that uniqueness
    consumes — `Phys/Algebra/LorentzContinuumOpSqrtJConj.lean` (6 production decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built olean; gate D0–D6 GREEN; costume
    C123 `4 = 64`). Banked: ★ `opSqrt_sigOpC_conj` (THE `J`-CONJUGATION OF A POSITIVE OPERATOR SQUARE ROOT:
    `IsEvCOpSqrt s q → IsEvCOpSqrt (J∘s∘J) (J∘q∘J)`); `linIsom_JsqrtJ_isOpSqrt` (`J p^{1/2} J` a positive operator square
    root of `J p J`); `linIsom_posInv_isOpSqrt` (`(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u` a positive operator square root
    of `p⁻¹ = specOpN c⁻¹ u`); ★★ `linIsom_JpJ_eq_specInv` (`J p J = specOpN c⁻¹ u` AS AN OPERATOR EQUALITY); ★★★
    `linIsom_two_opSqrts_of_posInv` (THE DELIVERABLE: both `J p^{1/2} J` and `(p^{1/2})⁻¹` are positive operator square
    roots of the SAME `p⁻¹` — the setup the N93 uniqueness consumes); `boostEndC_two_opSqrts_of_posInv` (NON-VACUITY:
    a concrete boost `a²−b²=1` realises it). THE TRUNK REFRAME (THE ONE LAW): the operator-sqrt-uniqueness lift is normally
    read off operator functional calculus; the trunk DISSOLVES the SETUP into pure composition algebra — `J* = J` /
    `J∘J = id` (N90) make conjugation by `J` preserve `EvC`-self-adjointness + `EvC`-positivity and persist onto the square
    (`(J s J)² = J∘(s∘s)∘J`, the inner pair collapses, the OUTER `J`'s remain); the spectral square root `specOpN_op_sqrt`
    (N68) gives `J p^{1/2} J` a root of `J p J`; the N91 lever `(J p J)∘p = id` plus the N88 reciprocal `p∘p⁻¹ = id`
    collapse a LEFT inverse into the RIGHT inverse `J p J = specOpN c⁻¹ u`; and `((cutSqrt c_i)⁻¹)² = c_i⁻¹`
    (`mul_inv` + `cutSqrt_sq`) puts `(p^{1/2})⁻¹` as a root of the SAME `p⁻¹`. DERIVED from the trunk (the conjugation
    symmetry is `sigOpC_isEvCAdjoint_self`/`sigOpC_comp_self` N90; the spectral root + composition + self-adjointness +
    positivity are `specOpN_op_sqrt`/`specOpN_comp`/`specOpN_isEvCSymm`/`specOpN_nonneg` N68; the `g*g`-family + concrete
    `(p^{1/2})⁻¹` is `comp_specInverse_exists`/`specOpN_inverse`/`specOpN_resolution_of_injective`/`comp_injective_of_adjoint`/
    `specExists_eigen_pos` N86–N88; the `J p J = p⁻¹` lever + injectivity are `linIsom_posPart_J_conj_inv`/`linIsom_injective`
    N91; `mul_inv`/`inv_nonneg`/`cutSqrt_sq`/`cutSqrt_nonneg` N57, `LinearMap.comp_assoc`/`comp_id`/`id_comp`/`ext` standard
    MACHINERY on the DERIVED objects, STANDARD §3 — NO Mathlib ℝ content leaked). NO posited inner product / spectral
    theorem / operator functional calculus, NO Mathlib ℝ/ℂ as content, NO bridge. W9: a LIGHT node — probe1 (P1) clean
    7.6s, probe2 (P2+P3) clean 8.3s, probe3 (the operator equality) clean 7.4s, production built 12s, all 6 decls
    foundations-only at first compile, KILL=180s/obligation never approached; all 6 names fresh — no collisions. Costume
    C123 (`4 = 64`) bites a WRONG `J`-conjugation squaring law `(J s J)² = s²` (dropping the outer conjugation): tracking
    `(sigOpC ∘ boostEndC 5 3 ∘ sigOpC)²` on `(1,1,0)` gives `(1,1,0)→(2,2,0)→(4,4,0)` first coordinate `4`, while the bare
    square `(boostEndC 5 3)²(1,1,0) = (64,64,0)` first coordinate `64`; distinct from C115 `1=7` … C122 `2=8`.
    Words-removable: delete "Lorentz/boost/signature/metric/isometry/square-root/uniqueness/inverse/involution/conjugation/
    self-adjoint/Spin/SO(9)" → over the derived complete ordered field `Cut`, with the positive-definite form `EvC` and the
    involution `J` (`J∘J = id`, `∀ p q, EvC (J p) q = EvC p (J q)`): if `s∘s = q` with `s` `EvC`-symmetric/`EvC`-nonneg then
    `J∘s∘J` is `EvC`-symmetric/`EvC`-nonneg with `(J∘s∘J)² = J∘q∘J`; and for a `Cut`-linear `g` with `∀ p q, EvC (g p) q =
    EvC p (h q)` preserving `QvC`, both `J∘(specOpN (cutSqrt∘c) u)∘J` and `specOpN ((cutSqrt∘c)⁻¹) u` are positive operator
    square roots of `specOpN c⁻¹ u`; pure linear-algebra math. W3 DECOMPOSE: the general positive-operator-square-root
    UNIQUENESS lemma + the lift `J p^{1/2} J = (p^{1/2})⁻¹` + the FULL isometry-compact-part lemma, CONNECTEDNESS, the
    GLOBAL reverse KAK surjectivity, and the `Spin(9)→SO(9)` exhaustion childed N93.

  - **N93 LANDED — THE GENERAL (INJECTIVE-TARGET) POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS → THE LIFT
    `J p^{1/2} J = (p^{1/2})⁻¹` → THE FULL ISOMETRY-COMPACT-PART LEMMA** (+ the scalar-target KERNEL + the
    positive-semidefinite-form RADICAL), over the derived ℝ `Cut` + the terminal algebra `O Cut`. MEASURE-FIRST
    (§N93 priority (i), PREREG-frozen) worked the `EvC`-inner-product route `EvC ((s₁−s₂)v)((s₁−s₂)v) → 0` BY HAND and
    found it GENUINELY CIRCULAR without commuting (`S = −(−S) = S`, a tautology), and the Halmos anticommutation identity
    collapses too over a real-closed field with NO analysis — so the route is eigenspace localization over the spectral
    resolution `stvc_selfadj_specExists` (N85). Banked in TWO production files (13 production decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited vs the built oleans; gate D0–D6 GREEN, 124/124
    costumes, 1347 audited theorems foundations-only; costumes C124 `7=8`, C125 `6=5`):
    `Phys/Algebra/LorentzContinuumOpSqrtScalarUnique.lean` (PART 1, the per-eigenspace KERNEL): `evC_radical_of_nonneg`
    (THE POSITIVE-SEMIDEFINITE-FORM RADICAL LEMMA — elementary Cauchy–Schwarz, NO analysis); `evC_RR_eq_scalar`; ★
    `op_sqrt_scalar_unique` (a positive operator square root of `λ·id` `0≤λ` is `cutSqrt λ · id`, via the
    `(R + μ·id)`-INJECTIVE Born-positivity argument — injective ⟹ surjective over the finite `Cut`-module `STVC`, and
    `(R − μ·id)∘(R + μ·id) = 0`); `op_sqrt_scalar_unique_eq`; `op_sqrt_scalar_unique_witness`/`not_op_sqrt_scalar_4_9`;
    and `Phys/Algebra/LorentzContinuumIsomCompact.lean` (PART 2, the deliverable): `evC_shift_injective` (the
    Born-positivity shift lever); `linMap_eq_of_resolution`; ★ `op_sqrt_unique_of_injective` (THE GENERAL INJECTIVE-TARGET
    UNIQUENESS — two `EvC`-self-adjoint, `EvC`-positive-semidefinite roots of an INJECTIVE `q` are EQUAL, dissolved
    eigen-family-by-eigen-family of ONE root via N85 + N88 `specOpN_resolution_of_injective` + N86 `specExists_eigen_pos` +
    `evC_shift_injective` — the case the lift consumes since `p⁻¹` is injective); ★★ `linIsom_JsqrtJ_eq_posInv` (THE LIFT
    `J p^{1/2} J = (p^{1/2})⁻¹` AS AN OPERATOR EQUALITY); ★★★ `isometry_compact_part_isQvIsom` (THE FULL
    ISOMETRY-COMPACT-PART LEMMA — `g ∈ qvIsomMonoidC` ⟹ `IsQvIsomC (k := g·(p^{1/2})⁻¹)`, the compact/orthogonal polar/KAK
    factor of an isometry is ITSELF an isometry, via the N91 converse `metric_condition_imp_isQvIsom`);
    `boostEndC_compact_part_isQvIsom` (NON-VACUITY on a concrete boost); `not_op_sqrt_unique_clash`. DERIVED from the trunk
    (`cutSqrt`/`cutSqrt_sq`/`cutSqrt_zero`/`cutSqrt_unique` N57; `EvC`/`EvC_eq_zero_iff` N58; `IsEvCOpSqrt`/`specOpN`/
    `specOpN_op_sqrt` N68; `stvc_selfadj_specExists` N85; `specExists_eigen_pos` N86; `specOpN_resolution_of_injective`/
    `comp_specInverse_exists` N88; `metric_condition_imp_isQvIsom`/`linIsom_injective` N91; `linIsom_two_opSqrts_of_posInv`/
    `linIsom_JpJ_eq_specInv` N92; `injective_iff_surjective`/`Module.Finite Cut STVC` N76; standard MACHINERY on the
    DERIVED objects, STANDARD §3), NOT a posited inner product / spectral theorem / operator functional calculus, NOT
    Mathlib spectral theory, NOT a posited Lorentz group, NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT
    a bridge. Costumes C124 (`7=8`, a WRONG scalar-target uniqueness VALUE) and C125 (`6=5`, a WRONG injective-target
    two-roots collapse) — distinct from C115 `1=7` … C123 `4=64`. STANDARD applied (unbroken / complete /
    words-removable). The full operator-level polar/KAK split `g = k·p^{1/2}` (N89) now has BOTH factors landed as
    isometries. CONNECTEDNESS / the GLOBAL reverse KAK surjectivity / the `Spin(9)→SO(9)` exhaustion are childed N94.
  - **N94 ✅ (LANDED) — A CONCRETE `biMulFun` 2-PLANE ROTATION WITNESS: the order-2 half-turn as a single two-sided
    generator, the immediately-bankable `SO(9)`-reachability piece toward the `Spin(9)→SO(9)` exhaustion.** MEASURE-FIRST
    (§N94 priority (i)) found the full connectedness / global reverse KAK surjectivity over `Cut` to be the genuine W1 HEAVY
    remainder (Mathlib has no SO⁺(1,9), no Lie-group integration over `Cut`) — childed N95. The immediately-bankable,
    FORCED, clean piece is the CONCRETE 2-plane rotation realized as a single `biMulFun` generator, DISSOLVED structurally
    through the banked octonion alternative laws (`Phys/Algebra/Alternative.lean` N5b: `mul_flex` `x·(y·x)=(x·y)·x`,
    `mul_mul_right` `(x·y)·y=x·(y·y)`), NO coordinate grind: for a UNIT-IMAGINARY `u` (`u·u=−1`, `u·(u·v)=−v`),
    `(biMulFun u u)²(v) = u·((u·(v·u))·u) = u·(u·((v·u)·u)) = u·(u·(v·(u·u))) = u·(u·(−v)) = v` — so `biMulFun u u` is an
    INVOLUTION (an order-2 = 180° half-turn), and a genuine 2-PLANE rotation: it NEGATES the plane `span{1,u}`
    (`biMulFun u u (1)=−1`, `biMulFun u u (u)=−u`) and FIXES the anticommuting complement (`u·w=−(w·u)` ⟹
    `biMulFun u u (w)=u·(w·u)=−(u·(u·w))=w`). THE DISTINGUISHING FACT (W8): the SINGLE-unit circle half-turn
    `(rotFunC u)²(v)=u·(u·v)=−v` is the WHOLE-block negation `−id` (a central element), NOT a 2-plane rotation — the
    two-sided generator REACHES a 2-plane rotation the single-unit family does not, the forward step toward the full
    non-associative `SO(9)`. BANKED in `Phys/Algebra/LorentzContinuumSpin9Reach.lean` (11 decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the built olean): ★ `biMulFun_imag_sq` (THE
    CORE two-sided square `u·((u·(v·u))·u)=v`); ★★ `biMulFun_imag_involutive` (+ `_comp` form `… ∘ … = id`);
    `biMulFun_imag_negates_one`/`_negates_self`; ★ `biMulFun_imag_fixes_anticomm` (the 2-plane structure — negate the plane,
    fix the complement); `biMulFun_imag_mem_gen2` (the unit half-turn lies in `genIsomMonoidC2`); the CONCRETE `e₂`
    realization `biMulFun_e2_sq`/`_involutive`/★ `_fixes_j` (W8 teeth — the half-turn around `e₂` FIXES the anticommuting
    unit `ιe₂`, NOT a whole-block `−id`)/`_mem_gen2`. DERIVED from the trunk (`biMulFun`/`genIsomMonoidC2`/
    `genIsomMonoidC2_le_isom` N55; `mul_flex`/`mul_mul_right` N5b forward from the Cayley–Dickson product; `O Cut`/`CD.e2`/
    `CD.iota`/`e2_alt`/`e2_gFormC_self` the cascade STOP), NOT a posited Lorentz/Spin group, NOT Mathlib ℝ/ℂ as content
    (the continuum IS the DERIVED `Cut`), NOT a bridge. Costume C126 (`1=9`, a WRONG 2-plane-rotation claim — the half-turn
    `biMulFun e₂ e₂` does NOT fix the anticommuting unit `ιe₂`, its `re.im.re` coordinate reads 9 instead of the genuine 1)
    — distinct from C115 `1=7` … C125 `6=5`. STANDARD applied (unbroken / complete / words-removable). Gate D0–D6 GREEN
    (125/125 costumes, foundations-only). CONNECTEDNESS / the GLOBAL reverse KAK surjectivity / the `Spin(9)→SO(9)`
    exhaustion are childed N95.
  - **N95 ✅ (LANDED) — A FINITE PRODUCT OF `biMulFun` GENERATORS: a 2-PLANE ROTATION IN A NEW
    (PURELY-IMAGINARY) PLANE, the structural exhaustion step toward the `Spin(9)→SO(9)` cover.**
    MEASURE-FIRST (§N95 priority (i)) found the full connectedness / global reverse KAK surjectivity
    over `Cut` to remain the genuine W1 HEAVY remainder (Mathlib has no SO⁺(1,9), no octonionic spinor
    cover, no Lie-group integration over `Cut`) — childed N96. The immediately-bankable, FORCED, clean
    piece is the finite PRODUCT `C := biMulFun w w * biMulFun u u` of TWO half-turns about two
    ANTICOMMUTING unit-imaginaries `u, w`, DISSOLVED structurally by COMPOSING the banked N94 half-turn
    lemmas (NO coordinate grind, NO new algebra): on the space component `C(v) = w·((u·(v·u))·w)`, the
    composite (i) ★ FIXES the real axis `C(1) = 1` (each single half-turn NEGATES `1`; the PRODUCT of
    two un-negates it — `biMulFun u u (0,0,1) = (0,0,−1)`, then `biMulFun w w (0,0,−1) = (0,0,1)`) — the
    structural NOVELTY: `C` is a rotation in a plane that does NOT meet the real axis; (ii) NEGATES the
    purely-imaginary plane `span{u,w}` (`C(u) = −u`, `C(w) = −w`); (iii) FIXES every `z` anticommuting
    with BOTH `u` and `w`; and (iv) lies in `genIsomMonoidC2` (a product of two members,
    `Submonoid.mul_mem`). So `C` is a 2-plane rotation in the PURELY-IMAGINARY plane `span{u,w}` — a
    plane NEITHER single half-turn reaches (each negates a plane THROUGH the real axis) — generic
    imaginary-plane rotations reached as finite products of the banked two-sided generators, the
    structural exhaustion direction. BANKED in `Phys/Algebra/LorentzContinuumSpin9Product.lean` (16
    decls foundations-only `[propext, Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the
    built olean): `biMulFun_imag_negates_neg_one`; ★ `biMulComp_fixes_one` (THE PRODUCT FIXES THE REAL
    AXIS); `biMulComp_negates_u`/`_negates_w` (negate the imaginary plane); `biMulComp_fixes_common`;
    ★ `biMulComp_mem_gen2` (THE PRODUCT `∈ genIsomMonoidC2`); `biMulComp_apply`; the concrete second unit
    `je2`/`je2_imag`/`je2_alt`/`je2_sq`/`je2_gFormC_self` (`ιe₂ := iota(e₂:H Cut)` is a unit-imaginary
    over `Cut`); `e2_je2_anticomm`; ★ `biMulComp_e2_je2_fixes_one` (W8 teeth — the CONCRETE product
    `biMulFun ιe₂ ιe₂ ∘ biMulFun e₂ e₂` FIXES the real axis, distinguishing it from a single half-turn
    which sends `1 ↦ −1`); `biMulComp_e2_je2_negates_e2`; `biMulComp_e2_je2_mem_gen2`. DERIVED from the
    trunk (the N94 half-turn lemmas — forward from the octonion alternative laws `mul_flex`/`mul_mul_right`
    N5b, the cascade STOP; `biMulFun`/`genIsomMonoidC2` N55; `e2_alt`/`L_sq_imag`/`CD.e2`/`CD.iota`/`CD.Nrm`
    the cascade; standard `Submonoid.mul_mem`/`Subtype.property`/`ext`/`simp` MACHINERY, STANDARD §3), NOT
    a posited Lorentz/Spin group, NOT Mathlib ℝ/ℂ as content, NOT a bridge. Costume C127 (`1 = 12`, a
    WRONG finite-product claim — the product NEGATES the real axis like a single half-turn, `re.re.re`
    coordinate reads `12` instead of the genuine `1`) — distinct from C115 `1=7` … C126 `1=9`. STANDARD
    applied (unbroken / complete / words-removable). Gate D0–D6 GREEN (126/126 costumes, foundations-only).
    CONNECTEDNESS / the GLOBAL reverse KAK surjectivity / the `Spin(9)→SO(9)` exhaustion are childed N96.
  - **N96 ✅ (LANDED) — THE AFFINE SPECTRAL PATH: the positive (boost/self-adjoint) part `p^{1/2}` of a
    polar/KAK split is CONNECTED to the identity THROUGH THE CONE OF POSITIVE OPERATORS by a STRAIGHT-LINE
    eigenvalue segment, over the DERIVED ℝ `Cut` + the terminal algebra `O Cut := CD (H Cut)`.**
    MEASURE-FIRST (§N96 priority (i), THE ONE LAW — no analysis, no operator topology) CONFIRMED a
    CONTINUOUS real power `(c i)^t` over `Cut` (`cutRpow`/`cutPow`/operator-`exp`) is GENUINELY MISSING,
    and there is NO operator topology over `Cut` (`TopologicalSpace (Module.End)` / `ContinuousLinearMap`)
    — the literal topological connectedness of the operator group is the W1 HEAVY remainder (childed N97).
    The difficulty DISSOLVES through the trunk (W1 step 2): the literature connects `p^{1/2}` to `id` via
    the operator EXPONENTIAL of the self-adjoint generator (`exp(t·log p^{1/2})` — the transcendental
    rapidity flow), which needs the missing continuous power. Because the spectral operator
    `specOpN l u = ∑ i, l i • projC (u i)` is AFFINE in the eigenvalue family `l` (banked N68) and the
    positive cone is CONVEX over the ordered field `Cut`, the STRAIGHT-LINE eigenvalue segment
    `γ(t) := specOpN (fun i => (1−t)·1 + t·cutSqrt(c i)) u` connects `γ(0) = specOpN 1 u = id` (the
    resolution-of-identity N87) to `γ(1) = specOpN (cutSqrt∘c) u = p^{1/2}` (the banked positive operator
    square root N68), staying EvC-SELF-ADJOINT and EvC-POSITIVE-SEMIDEFINITE for every `t ∈ [0,1]` — a
    path of positive operators THROUGH THE CONE. NO power, NO `exp`, NO analysis, NO operator topology:
    pure ordered-field CONVEX arithmetic over the derived ℝ. The transcendental rapidity flow becomes the
    affine segment. BANKED in `Phys/Algebra/LorentzContinuumSpectralPath.lean` (8 production decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the built
    olean): `specPathOp` (the affine path operator, eigenvalues on the segment `(1−t)+t·√c`); ★
    `specPathOp_zero` (`γ(0)=id`, N87); `specPathOp_one` (`γ(1)=specOpN (cutSqrt∘c) u`); `specPathOp_isEvCSymm`
    (`γ(t)` self-adjoint ∀t); ★★ `specPathOp_nonneg` (`γ(t)` cone-positive ∀t∈[0,1], no hypothesis on `c`);
    ★★★ `specPathOp_connects` (THE PACKAGED CONNECTEDNESS — ∃ affine path of cone-positive self-adjoint
    operators with `γ(0)=id`, `γ(1)` a positive operator square root of `specOpN c u`); `specPathOp_mix4_witness`
    (W8 non-vacuity — the concrete path on the rank-4 octonionic frame `mix4` from `id` to `specOpN ![2,3,5,8] mix4`);
    `specPathOp_mix4_mid_read` (W8 anchor — midpoint reading `(1+cutSqrt 4)/2 = 3/2`). DERIVED from the
    trunk (`specOpN`/`_apply`/`_isEvCSymm`/`_nonneg`/`_read`/`_op_sqrt` N68; `specOpN_one_eq_sum_projC`/
    `stvc_resolution_of_identity` N87; `cutSqrt`/`_nonneg`/`_sq`/`_unique` N57; `projC`/`EvC`; `mix4`/
    `mix4_orthonormal` N68; standard ordered-field `linarith`/`mul_nonneg`/`ring` MACHINERY on the DERIVED
    `Cut`, STANDARD §3), NOT a posited operator exponential / continuous functional calculus, NOT Mathlib
    spectral theory, NOT a posited Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS the
    DERIVED `Cut`), NOT a bridge. Costume C128 (`3 / 2 = 13`, a WRONG affine-spectral-path midpoint claim
    — the convex midpoint eigenvalue reading is some value other than the average of the endpoints `1` and
    `cutSqrt 4 = 2`) — distinct from C115 `1=7` … C127 `1=12`. STANDARD applied (unbroken / complete /
    words-removable). Gate D0–D6 GREEN (127/127 costumes, foundations-only). The literal topological
    CONNECTEDNESS / the GLOBAL reverse KAK surjectivity / the `Spin(9)→SO(9)` exhaustion are childed N97.
  - **N97 ✅ (LANDED) — THE PACKAGED REVERSE-SURJECTIVITY / POLAR-PATH DECOMPOSITION WITNESS: every
    isometry `g` factors as `g = k·γ(1)` with `k := g∘(p^{1/2})⁻¹` ITSELF an isometry (the compact/orthogonal
    factor, N93) and `γ` the AFFINE SPECTRAL PATH (N96) of cone-positive self-adjoint operators from
    `γ(0)=id` to `γ(1)=p^{1/2}`, over the DERIVED ℝ `Cut` + the terminal algebra `O Cut := CD (H Cut)`.**
    MEASURE-FIRST (§N97 priority (i), THE ONE LAW) confirmed the GLOBAL reverse surjectivity
    `qvIsomMonoidC ≤ genIsomMonoidC2`, the literal operator TOPOLOGY over `Cut`
    (`TopologicalSpace (Module.End)` / `ContinuousLinearMap`), and the full `Spin(9)→SO(9)` exhaustion
    remain the genuine W1 HEAVY remainder (Mathlib has NO operator topology over `Cut`, NO SO⁺(1,9), NO
    octonionic spinor cover) — childed N98. The immediately-bankable, FORCED, clean piece is the PACKAGED
    WITNESS that CONNECTS the N93 split to the N96 path in ONE statement (NO coordinate grind, NO new heavy
    compile — a structural composition of already-compiled lemmas, each new decl < 9s): every isometry `g`
    decomposes as a compact-isometry factor `k` TIMES a positive factor `γ(1)` that is the ENDPOINT OF A
    CONE-PATH FROM THE IDENTITY. For the FIRST time the positive part of the polar split is not just "a
    positive operator" but "a positive operator path-connected to the identity through the cone" — the
    precise structural skeleton of the reverse-surjectivity / connectedness step, assembled WITHOUT the
    operator exponential / continuous power / operator topology the literature's route requires (and which
    Mathlib lacks over `Cut`). The transcendental rapidity flow is the affine segment. BANKED in
    `Phys/Algebra/LorentzContinuumReverseSurj.lean` (3 production decls foundations-only `[propext,
    Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the built olean): ★★★
    `isometry_polar_path_decomp` (THE PACKAGED WITNESS — `IsQvIsomC g → IsEvCAdjoint g h → ∃ n c u γ,
    h∘g = specOpN c u ∧ γ = specPathOp c u ∧ γ(0)=id ∧ IsEvCOpSqrt (γ 1) (specOpN c u) ∧ (∀ t, IsEvCSymm (γ t))
    ∧ (∀ t∈[0,1], cone-positive) ∧ IsQvIsomC (g∘(p^{1/2})⁻¹) ∧ (g∘(p^{1/2})⁻¹)∘(γ 1) = g`); ★
    `boost_polar_path_decomp` (W8 non-vacuity — a concrete boost `a²−b²=1` realises the packaged
    decomposition); ★ `boost_polar_recon_coord` (W8 anchor — the reconstructed operator `k∘γ(1)` of the
    boost `(5/3,4/3)` read at the pure-time vector has space coordinate `4/3`, the boost's own `b`-parameter
    recovered through the reconstruction). DERIVED from the trunk (`isometry_compact_part_isQvIsom` N93;
    `specPathOp`/`_zero`/`_one`/`_isEvCSymm`/`_nonneg` N96; `specOpN_op_sqrt` N68;
    `specOpN_resolution_of_injective`/`comp_injective_of_adjoint` N87/N88; `specOpN_inverse_right` N87;
    `cutSqrt_pos` N57; `linIsom_injective` N91; `boostEndC`/`_isQvIsomC`/`_isEvCAdjoint_self`/`_apply` N89;
    standard `LinearMap.comp_assoc`/`comp_id` MACHINERY on the DERIVED `Cut`, STANDARD §3), NOT a posited
    operator exponential / continuous functional calculus, NOT Mathlib spectral theory, NOT a posited
    Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a bridge — a
    fully proved implication, without an asserted joint. Costume C129 (`4 / 3 = 40`, a WRONG polar-path
    reconstruction claim — the reconstructed boost's pure-time space coordinate is some value other than the
    genuine `4/3`) — distinct from C115 `1=7` … C128 `3/2=13`. STANDARD applied (unbroken / complete /
    words-removable). Gate D0–D6 GREEN (128/128 costumes, foundations-only). The GLOBAL reverse KAK
    surjectivity / the operator topology over `Cut` / the `Spin(9)→SO(9)` exhaustion are childed N98.
  - **N98 ✅ (LANDED) — THE DISTINCT-UNITS TWO-SIDED GENERATOR CARRIES THE REAL AXIS ONTO A PRODUCT UNIT:
    the off-diagonal Moufang/Spin(9) generator `biMulFun u u'` for DISTINCT anticommuting unit-imaginaries
    `u ≠ u'` realises a 2-plane rotation in a plane the diagonal half-turn (N94) and the imaginary-plane
    product (N95) do NOT reach, over the DERIVED ℝ `Cut` + the terminal algebra `O Cut := CD (H Cut)`.**
    MEASURE-FIRST (§N98 priority (ii) — EXTEND the biMulFun-product family toward a NEW 2-plane, THE ONE LAW)
    confirmed the GLOBAL reverse surjectivity `qvIsomMonoidC ≤ genIsomMonoidC2` (which lives in
    `Module.End Cut STVC`, needing a Function.End ↔ Module.End bridge), the literal operator TOPOLOGY over
    `Cut` (`TopologicalSpace (Module.End)` / `ContinuousLinearMap`), and the full `Spin(9)→SO(9)` exhaustion
    remain the genuine W1 HEAVY remainder (Mathlib has neither) — childed N99. The immediately-bankable,
    FORCED, clean piece stays ENTIRELY within the `Function.End STVC` generation world: the OFF-DIAGONAL
    generator `biMulFun u u'` (u ≠ u') carries the real axis `1` OFF the real line onto the PRODUCT unit
    `u·u'` (`u·(1·u') = u·u'`) and SWAPS it back (`u·((u·u')·u') = u·(u·(u'·u')) = u·(u·(−1)) = −(u·u) = 1`,
    DISSOLVED through the banked octonion right-alternative law `mul_mul_right` N5b — NO coordinate grind), so
    `biMulFun u u'` is a 2-plane rotation in `span{1, u·u'}` — a plane built from a PRODUCT of two distinct
    generators, reached by NEITHER the diagonal half-turn (which never leaves the real line) NOR the
    imaginary-plane product (which fixes the real line); the product unit `u·u'` is itself a Born-unit
    (`gFormC (u·u') (u·u') = 1` via `gFormC_comp` N50), and the generator is order-2 ON the 2-plane though NOT
    a global involution (the non-associative difference from the diagonal half-turn — the structural content
    of the octonionic `Spin(9)` action). BANKED in `Phys/Algebra/LorentzContinuumSpin9DistinctPlane.lean`
    (9 production decls foundations-only `[propext, Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited
    vs the built olean): ★ `biMulFun_distinct_swap_one` (carries `1 ↦ u·u'`); ★ `biMulFun_distinct_swap_prod`
    (swaps `u·u' ↦ 1`); `biMulFun_distinct_prod_born` (the product unit is itself a Born-unit);
    `biMulFun_distinct_mem_gen2` (the off-diagonal generator `∈ genIsomMonoidC2`); ★
    `biMulFun_distinct_order2_one` (order-2 on the 2-plane); ★ W8 `biMulFun_e2je2_offaxis` (the concrete
    product unit `e₂·ιe₂` has ZERO scalar part `re.re.re = 0` — OFF the real axis, vs the diagonal half-turn's
    `−1`) / ★ `biMulFun_e2je2_swap_coord` (W8 teeth — the generator carries `1` to a unit whose nonzero
    coordinate `im.im.re = −1`) / `biMulFun_e2je2_distinct_mem` / `biMulFun_e2je2_order2_one`. DERIVED from
    the trunk (`biMulFun`/`genIsomMonoidC2` N55; `gFormC_comp` N50; `mul_mul_right`/`mul_neg` N5b forward from
    the Cayley–Dickson product, the cascade STOP; `CD.e2`/`CD.iota`/`je2`/`e2_gFormC_self`/`je2_gFormC_self`/
    `biMulFun_e2_sq`/`je2_sq` the cascade + N94/N95; standard `Submonoid.subset_closure`/
    `Set.mem_union_right`/`simp` MACHINERY on the DERIVED objects, STANDARD §3), NOT a posited Lorentz/Spin
    group, NOT Mathlib ℝ/ℂ as content (the continuum is the DERIVED `Cut`), NOT a bridge. Costume C130
    (`−1 = 17`, a WRONG distinct-units generator swap-coordinate claim — the off-diagonal `biMulFun e₂ ιe₂`
    carries the real axis to a unit whose `im.im.re` coordinate is some value other than the genuine `−1`) —
    distinct from C115 `1=7` … C129 `4/3=40`. STANDARD applied (unbroken / complete / words-removable). Gate
    D0–D6 GREEN. The GLOBAL reverse KAK surjectivity / the operator topology over `Cut` / the `Spin(9)→SO(9)`
    exhaustion are childed N99.
  - **N99 ✅ (LANDED) — THE Module.End ↔ Function.End MONOID BRIDGE: the faithful monoid
    homomorphism `endToFunEnd` that renders the polar/KAK compact part (a `Module.End Cut STVC`
    operator, N93) and the two-sided Moufang/Spin(9) generators (`Function.End STVC` self-maps,
    N55/N98) commensurable in ONE monoid, making the global reverse surjectivity
    `qvIsomMonoidC ≤ genIsomMonoidC2` a WELL-POSED membership question, over the DERIVED ℝ `Cut` +
    the terminal algebra `O Cut := CD (H Cut)`.** MEASURE-FIRST (§N99 priority (ii), THE ONE LAW —
    no topology) CONFIRMED the algebraic joint the N98 measure surfaced is a CLEAN WRAP, NOT a W1
    remainder: a bounded probe (each obligation < 9s, well under the 90s KILL budget) showed the
    coercion `⇑ : Module.End Cut STVC → Function.End STVC` is a MONOID HOMOMORPHISM (`map_one' = id`,
    `map_mul' = composition`, both closing definitionally inside the structure builder where `*` is
    the `Function.End` monoid mul) and FAITHFUL (injective, `DFunLike.coe_injective`). THE
    OBSTRUCTION: the compact part `k := g∘(p^{1/2})⁻¹` (N93) is a `Module.End` OPERATOR but the
    generators `biMulFun u u'` and `genIsomMonoidC2 : Submonoid (Function.End STVC)` live in the
    `Function.End` (bare self-map) world — so the very STATEMENT of the global reverse surjectivity
    needs the bridge. The clean-wrap dissolution: bank the bridge, push the N93 compact part across
    it, and the surjectivity becomes a WELL-POSED membership in ONE monoid. BANKED in
    `Phys/Algebra/LorentzContinuumEndBridge.lean` (10 production decls foundations-only `[propext,
    Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the built olean): ★ `endToFunEnd`
    (THE BRIDGE — the monoid hom `Module.End Cut STVC →* Function.End STVC`); `endToFunEnd_apply`
    (the computation rule); ★ `endToFunEnd_injective` (THE BRIDGE IS FAITHFUL — no information lost,
    so word products transport without collapse); ★ `endToFunEnd_mem_qvIsomMonoidC_iff` (THE BRIDGE
    REFLECTS THE ISOMETRY PREDICATE — `endToFunEnd k ∈ qvIsomMonoidC ↔ IsQvIsomC ⇑k`); `biMulLin`
    (the explicit `Cut`-linear operator whose bridge-image is `biMulFun u u'` — the two-sided
    multiplication `v ↦ u·(v·u')` is `Cut`-linear via the centrality `smulCompat_oCut`, `Cut`
    central on `O Cut`); `endToFunEnd_biMulLin` (`endToFunEnd (biMulLin u u') = biMulFun u u'` — the
    generators ARE bridge-images of explicit linear operators); `biMulLin_mem_gen2` (the bridged
    generator `∈ genIsomMonoidC2` for Born-units); ★★★ `isometry_compact_part_mem_qvIsomMonoidC`
    (THE JOINT — the polar/KAK compact part `k` of an isometry `g`, pushed across the bridge, lies in
    `qvIsomMonoidC`, the SAME monoid the generators live in — the global reverse surjectivity is now
    WELL-POSED in ONE monoid; the bridge is exactly the algebraic joint it passes through); ★
    `boost_compact_part_mem_qvIsomMonoidC` (W8 non-vacuity — a concrete boost realises the joint); ★
    `endToFunEnd_biMulLin_e2_coord` (W8 anchor/teeth — the bridged generator
    `endToFunEnd (biMulLin e₂ e₂)` at `(0,0,1)` reads deep-scalar coordinate `re.re.re = −1`,
    `e₂·(1·e₂) = e₂·e₂ = −1`). DERIVED from the trunk (`isometry_compact_part_isQvIsom` N93;
    `biMulFun`/`genIsomMonoidC2` N55; `biMulFun_distinct_mem_gen2` N98; `smulCompat_oCut` — `Cut`
    central on `O Cut`, N41-family; `e2_alt` N53; `specOpN`/`cutSqrt`/`IsQvIsomC`/`IsEvCAdjoint`/
    `qvIsomMonoidC`/`boostEndC` N49–N89; standard `DFunLike.coe_injective`/`MonoidHom`/`LinearMap`
    MACHINERY on the DERIVED objects, STANDARD §3), NOT a posited Lorentz/Spin group, NOT Mathlib
    ℝ/ℂ as content (the continuum IS the DERIVED `Cut`), NOT a bridge-in-the-forbidden-sense (this is
    a PROVED monoid homomorphism between two derived endomorphism monoids — a fully proved
    implication, not an asserted physics identification). Costume C131 (`1 = 29`, a WRONG
    end-bridged-generator coordinate claim — the bridge-image of `biMulLin e₂ e₂` read at `(0,0,1)`
    has deep-scalar coordinate some value other than the genuine `−1`, forcing `−1 = 29`) — distinct
    from C115 `1=7` … C130 `−1=17`. STANDARD applied (unbroken / complete / words-removable). Gate
    D0–D6 GREEN. The GLOBAL reverse surjectivity proper (the generation/word-length content — that
    `k` IS a finite product of the banked generators) / the operator topology over `Cut` / the
    `Spin(9)→SO(9)` exhaustion are childed N100.
  - **N100 ✅ (LANDED) — THE ALGEBRAIC GENERATION TRANSPORT: the `Module.End`-side two-sided
    generators (the `Cut`-linear operators `biMulLin u u'`) close into a submonoid `genIsomMonoidLin`
    whose bridge-image under the faithful monoid hom `endToFunEnd` (N99) lands in the
    `Function.End`-side generated isometry submonoid `genIsomMonoidC2` — every finite product of the
    linear generators, pushed across the bridge, IS a finite product of the bare-self-map generators —
    over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.** N99 banked the
    `Module.End ↔ Function.End` MONOID BRIDGE (`endToFunEnd` faithful, reflects the isometry predicate;
    `biMulLin u u'` the `Cut`-linear operator with `endToFunEnd (biMulLin u u') = biMulFun u u'`;
    `biMulLin_mem_gen2` the bridged generator `∈ genIsomMonoidC2`), making the global reverse
    surjectivity `qvIsomMonoidC ≤ genIsomMonoidC2` a WELL-POSED membership question. MEASURE-FIRST
    (§N100 priority (i), THE ONE LAW — no topology) confirmed this is the immediately-bankable,
    FORCED, clean piece: the two-sided generators have TWO incarnations — the `Cut`-LINEAR operators
    `biMulLin u u'` (in `Module.End`, where the polar/KAK compact part `k` lives) and the bare
    self-maps `biMulFun u u'` (in `Function.End`, where the generated isometry monoid lives) — related
    by the faithful bridge; the GENERATION direction transports across the bridge as a monoid-hom
    image (a bounded probe, each obligation < 9s well under the 90s KILL budget, showed the
    closure-induction closes cleanly over `map_one`/`map_mul`). For the FIRST time the generation
    question is not just well-posed but DISCHARGED on the relevant component: a compact part that IS a
    finite `biMulLin` product on the `Module.End` side lands, via the bridge, inside `genIsomMonoidC2`
    on the `Function.End` side — the membership the global surjectivity needs, made structural through
    the monoid hom, with NO operator topology, NO Lie-group integration, NO posited group. BANKED in
    `Phys/Algebra/LorentzContinuumGeneration.lean` (12 production decls foundations-only `[propext,
    Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the built olean): `biMulGenSetLin`
    (the `Module.End`-side two-sided Born-unit generator SET); `genIsomMonoidLin` (its closure — the
    `Module.End` generated two-sided submonoid); `biMulGenSetLin_image_subset` (the bridge maps each
    generator into `genIsomMonoidC2`); ★★ `endToFunEnd_genIsomMonoidLin_mem_gen2` (THE TRANSPORT —
    every `K ∈ genIsomMonoidLin` has `endToFunEnd K ∈ genIsomMonoidC2`, via `Submonoid.closure_induction`
    over the monoid-hom laws); ★ `endToFunEnd_map_genIsomMonoidLin_le` (the submonoid form `map
    endToFunEnd genIsomMonoidLin ≤ genIsomMonoidC2`); `genTwoPlaneLin` (the concrete `Cut`-linear
    2-plane rotation `biMulLin w w * biMulLin u u`); `genTwoPlaneLin_apply` (its bridge-image applies as
    the nested self-map composition `biMulFun w w (biMulFun u u p)`, the N95 composite);
    `endToFunEnd_genTwoPlaneLin` (the bridge-image is the `Function.End` composite, via `map_mul`); ★
    `genTwoPlaneLin_mem_genLin` / `genTwoPlaneLin_mem_gen2` (the concrete linear rotation `∈
    genIsomMonoidLin`, and bridged `∈ genIsomMonoidC2` — the transport applied to a CONCRETE finite
    generator product); ★ W8 `genTwoPlaneLin_e2je2_fixes_one` (NON-VACUITY — the concrete bridged
    rotation `genTwoPlaneLin e₂ ιe₂` FIXES the real axis `(0,0,1)`, the N95 imaginary-plane rotation
    realised as a bridged `Module.End` PRODUCT) / `genTwoPlaneLin_e2je2_real_coord` (W8 ANCHOR/teeth —
    the bridged rotation at `(0,0,1)` reads deep-scalar coordinate `re.re.re = 1`, the fixed-real-axis
    value vs a single half-turn's `−1`). DERIVED from the trunk (`endToFunEnd`/`biMulLin`/
    `endToFunEnd_biMulLin`/`biMulLin_mem_gen2` N99; `biMulFun`/`genIsomMonoidC2` N55;
    `biMulComp_e2_je2_fixes_one`/`je2` N95; `e2_alt` N53; standard `Submonoid.closure`/
    `closure_induction`/`Submonoid.map`/`MonoidHom` MACHINERY on the DERIVED objects, STANDARD §3), NOT
    a posited Lorentz/Spin group, NOT Mathlib spectral/Lie theory, NOT Mathlib ℝ/ℂ as content (the
    continuum IS the DERIVED `Cut`), NOT a bridge-in-the-forbidden-sense (the transport is the image of
    a PROVED monoid homomorphism — a fully proved implication, not an asserted physics identification).
    Costume C132 (`1 = 23`, a WRONG generation-transport composite coordinate claim — the bridge-image
    of the concrete `Cut`-linear 2-plane rotation `genTwoPlaneLin e₂ ιe₂` read at the real axis
    `(0,0,1)` has deep-scalar coordinate some value other than the genuine `1`) — distinct from C115
    `1=7` … C131 `−1=29`. STANDARD applied (unbroken / complete / words-removable). Gate D0–D6 GREEN.
    The CONVERSE generation proper (an arbitrary `qvIsomMonoidC` member's compact part IS such a finite
    `biMulLin` product, the full `qvIsomMonoidC ≤ genIsomMonoidC2`) / the operator topology over `Cut` /
    the `Spin(9)→SO(9)` exhaustion are childed N101.
  - **N101 ✅ (LANDED) — THE CONVERSE GENERATION ON THE BOOST (NON-COMPACT) SECTOR: a proper
    orthochronous boost's polar/KAK compact part IS the IDENTITY (the empty two-sided generator
    word), hence lies in the `Module.End` generated submonoid `genIsomMonoidLin`, and its
    bridge-image lies in the `Function.End` generated isometry submonoid `genIsomMonoidC2`, over
    the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.** N100 banked the FORWARD
    transport (every `Module.End` `biMulLin` word, pushed across the faithful bridge `endToFunEnd`,
    lands in `genIsomMonoidC2`), discharging the generation question on the forward (linear-word →
    self-map) component. The remaining direction was the CONVERSE: that an isometry's polar/KAK
    compact part `k := g∘(p^{1/2})⁻¹` (a `Module.End` member of `qvIsomMonoidC` via the bridge, N99)
    IS a finite `biMulLin` product — `k ∈ genIsomMonoidLin` — whence by the N100 transport
    `endToFunEnd k ∈ genIsomMonoidC2`, closing `qvIsomMonoidC ≤ genIsomMonoidC2`. MEASURE-FIRST
    (§N101 priority (i), THE ONE LAW — no topology) confirmed the immediately-bankable, FORCED,
    clean piece by answering the ticket's literal question — "is a concrete boost's compact part the
    identity?" — with the theory-native YES forced by the KAK structure: a proper orthochronous
    boost `boostEndC a b` (`a²−b²=1`, `a+b≥0`, `a−b≥0`) is EvC-SELF-ADJOINT
    (`boostEndC_isEvCAdjoint_self`) AND EvC-POSITIVE-SEMIDEFINITE (`boostC_nonneg` N66, via the defeq
    `boostEndC = boostC`; the trunk Born positivity as a sum of squares), so it IS its OWN polar
    positive part `p^{1/2} = √(g*g)`: by the positive-operator-square-root UNIQUENESS for an injective
    target (`op_sqrt_unique_of_injective` N93) the spectral root `specOpN (cutSqrt∘c) u` of
    `g*g = specOpN c u` and the boost `g` itself — both EvC-self-adjoint, positive, squaring to
    `g*g = g∘g` (since `g* = g`) — are EQUAL, so the polar compact part collapses
    `k = g∘(p^{1/2})⁻¹ = p^{1/2}∘(p^{1/2})⁻¹ = id` (`specOpN_inverse` on the resolution-of-identity).
    A pure boost carries ZERO rotation content — it contributes the TRIVIAL element to the
    compact-generation problem; all generated 2-plane rotations come from the genuinely-compact
    isometries. A bounded probe (each obligation < 8s, well under the 90s KILL budget) confirmed the
    route closes clean, with NO operator topology, NO Lie-group integration, NO posited group. BANKED
    in `Phys/Algebra/LorentzContinuumGenerationConverse.lean` (5 production decls foundations-only
    `[propext, Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the built olean):
    `boostEndC_nonneg` (the boost is EvC-positive-semidefinite, via `boostC_nonneg`); ★★
    `boostEndC_compact_part_eq_id` (THE CONVERSE CORE — the boost's polar compact part
    `g∘(p^{1/2})⁻¹` EQUALS `LinearMap.id`); `boostEndC_compact_part_mem_genLin` (the compact part
    (= id) `∈ genIsomMonoidLin`, the empty generator word via `one_mem`); ★★
    `boostEndC_compact_part_mem_gen2` (THE CONVERSE GENERATION (boost sector) — the bridged compact
    part `endToFunEnd k ∈ genIsomMonoidC2`, closing the converse direction of
    `qvIsomMonoidC ≤ genIsomMonoidC2` on the entire boost sector); ★ W8
    `boostEndC_5343_compact_part_id_coord` (NON-VACUITY/teeth — the concrete boost `(5/3,4/3)` (a
    point on the unit hyperbola `(5/3)²−(4/3)²=1`) has compact part `= id`, reading time coordinate
    `1` at the pure-time vector `(1,0,0)`). DERIVED from the trunk (`isometry_compact_part_isQvIsom`/
    `op_sqrt_unique_of_injective` N93; `specOpN_op_sqrt` N68; `specOpN_inverse`/
    `specOpN_resolution_of_injective`/`comp_injective_of_adjoint` N87/N88; `linIsom_injective` N91;
    `cutSqrt_pos` N57; `boostEndC`/`_isQvIsomC`/`_isEvCAdjoint_self` N89; `boostC`/`boostC_nonneg`
    N66; `endToFunEnd` N99; `genIsomMonoidLin`/`endToFunEnd_genIsomMonoidLin_mem_gen2` N100; standard
    `Submonoid.one_mem`/`LinearMap` MACHINERY on the DERIVED objects, STANDARD §3), NOT a posited
    operator exponential / continuous functional calculus, NOT Mathlib spectral theory, NOT a posited
    Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a
    bridge-in-the-forbidden-sense (the compact-part collapse is a fully proved operator equality, not
    an asserted physics identification). Costume C133 (`1 = 31`, a WRONG converse-generation
    compact-part coordinate claim — the boost `(5/3,4/3)` compact part read at the pure-time vector
    `(1,0,0)` has time coordinate some value other than the genuine `1`) — distinct from C115 `1=7` …
    C132 `1=23`. STANDARD applied (unbroken / complete / words-removable). Gate D0–D6 GREEN. The
    CONVERSE generation on the genuinely-COMPACT (rotation) sector / the operator topology over `Cut` /
    the `Spin(9)→SO(9)` exhaustion are childed N102.
  - **N102 ✅ (LANDED) — THE CONVERSE GENERATION ON THE COMPACT (ROTATION) SECTOR: a two-sided
    HALF-TURN's polar/KAK compact part IS THE HALF-TURN ITSELF (a NONTRIVIAL single two-sided
    generator), hence lies in the `Module.End` generated submonoid `genIsomMonoidLin`, and its
    bridge-image lies in the `Function.End` generated isometry submonoid `genIsomMonoidC2`, over the
    DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.** N101 banked the CONVERSE on the
    BOOST (non-compact) sector — a proper boost is its own polar POSITIVE part, so its compact part
    collapses to `k = id` (the empty generator word), closing `qvIsomMonoidC ≤ genIsomMonoidC2` on the
    entire boost sector. THIS node banks the DUAL collapse on the genuinely-COMPACT sector.
    MEASURE-FIRST (§N102 priority (i), THE ONE LAW — no topology) answered the ticket's literal
    question — "is a concrete compact rotation EvC-orthogonal so `g∗∘g = id`, `p^{1/2} = id`, `k = g`
    already a generator word?" — with the theory-native YES forced by the KAK structure. A two-sided
    HALF-TURN `g := biMulLin u u` for a unit-imaginary `u` (`gFormC u u = 1`, `u·u = −1`,
    `u·(u·z) = −z`) is a `QvC`-ISOMETRY (`biMulFun_isom` — the `v`-block `v ↦ u·(v·u)` preserves
    `gFormC` via the three-factor Born composition law `biMul_gFormC`), EvC-SELF-ADJOINT (POLARIZING
    the diagonal `v`-block Born isometry `gFormC (u·(v·u)) (u·(w·u)) = gFormC v w` in the slot
    `z ↦ v+w` and moving the operator across the form via the involution `u·((u·(w·u))·u) = w`), AND
    an INVOLUTION `g∘g = id` (the two-sided square law `biMulFun_imag_involutive_comp` N94 lifted
    across the FAITHFUL bridge `endToFunEnd`), but — unlike the boost — NOT positive-semidefinite (it
    negates `span{1,u}`). Because `g∗ = g` (self-adjoint) AND `g∘g = id` (involution), the polar
    positive part is `p = g∗∘g = g∘g = id`, so `p^{1/2} = √(id) = id` (BOTH the spectral root
    `specOpN (cutSqrt∘c) uu` N68 AND `LinearMap.id` are positive operator square roots of the
    INJECTIVE `p = id`, so by the positive-operator-root UNIQUENESS `op_sqrt_unique_of_injective` N93
    the spectral root EQUALS `id`), `(p^{1/2})⁻¹ = id` (`specOpN_inverse` on the resolution-of-
    identity), and the compact part collapses the OTHER way from the boost:
    `k := g∘(p^{1/2})⁻¹ = g∘id = g` ITSELF — a NONTRIVIAL single two-sided generator `biMulLin u u`,
    trivially in `genIsomMonoidLin` (`Submonoid.subset_closure`, one generator), bridged into
    `genIsomMonoidC2` (the N100 transport `endToFunEnd_genIsomMonoidLin_mem_gen2`). THE CONVERSE
    GENERATION `qvIsomMonoidC ≤ genIsomMonoidC2` DISCHARGED on a CONCRETE genuinely-COMPACT (rotation)
    generator — the first compact-sector converse-direction result, with NO operator topology, NO
    Lie-group integration, NO posited group. The deep structural content (the DUAL of N101's boost
    collapse): a pure rotation (half-turn) carries ZERO boost content — it IS its own compact part
    (`k = g`), NONTRIVIAL, exactly the opposite of the boost which contributes `k = id`; KAK
    `g = k·p` with `p = id` for the pure-orthogonal factor is precisely the statement that a
    genuinely-compact element IS its own maximal-compact factor, and lands as a generator product. A
    bounded probe (each obligation < 9s, well under the 90s KILL budget) confirmed the route closes
    clean. BANKED in `Phys/Algebra/LorentzContinuumGenerationConverseCompact.lean` (9 production decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the
    built olean): `biMulLin_imag_isQvIsomC` (the half-turn is a `QvC`-isometry);
    `biMulLin_imag_involutive` (the half-turn is an INVOLUTION `g∘g = id`, across the faithful
    bridge); `biMulLin_apply_coord` (the coordinate action); ★ `biMulLin_imag_polarized_isom` (THE
    POLARIZED `v`-block Born isometry — the bilinear engine of the self-adjointness, theory-native
    from the Born = self-overlap composition law, NO coordinate brute); ★
    `biMulLin_imag_isEvCAdjoint_self` (the half-turn is EvC-SELF-ADJOINT); ★★
    `biMulLin_imag_compact_part_eq_self` (THE CONVERSE CORE — the half-turn's polar compact part
    `g∘(p^{1/2})⁻¹` EQUALS the half-turn `g` ITSELF); `biMulLin_imag_compact_part_mem_genLin` (the
    compact part (= `g`) `∈ genIsomMonoidLin`, a single generator); ★★
    `biMulLin_imag_compact_part_mem_gen2` (THE CONVERSE GENERATION (compact sector) — the bridged
    compact part `endToFunEnd k ∈ genIsomMonoidC2`); ★ W8 `biMulLin_e2_compact_part_neg_coord`
    (NON-VACUITY/teeth — the concrete `e₂` half-turn's compact part (= itself) NEGATES the real axis
    `(0,0,1)`, reading deep-scalar coordinate `re.re.re = −1`, vs the boost compact part = id reading
    `1`, N101). DERIVED from the trunk (`isometry_compact_part_isQvIsom`/`op_sqrt_unique_of_injective`
    N93; `specOpN_op_sqrt` N68; `specOpN_inverse`/`specOpN_resolution_of_injective` N87/N88;
    `cutSqrt_pos` N57; `EvC_nonneg`/`lid_isEvCSymm` N58/N87; `biMulFun_isom`/`biMul_gFormC` N55;
    `biMulFun_imag_sq`/`biMulFun_imag_involutive_comp` N94; `e2_alt`/`e2_gFormC_self` N53;
    `biMulLin`/`endToFunEnd`/`endToFunEnd_biMulLin`/`endToFunEnd_injective` N99; `genIsomMonoidLin`/
    `endToFunEnd_genIsomMonoidLin_mem_gen2` N100; the polarized Born composition law `gFormC` add-
    bilinearity N50; standard `Submonoid.closure`/`LinearMap` MACHINERY on the DERIVED objects,
    STANDARD §3), NOT a posited operator exponential / continuous functional calculus, NOT Mathlib
    spectral theory, NOT a posited Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS
    the DERIVED `Cut`), NOT a bridge-in-the-forbidden-sense (the compact-part collapse is a fully
    proved operator equality, not an asserted physics identification). Costume C134 (`−1 = 41`, a
    WRONG compact-sector converse-generation compact-part coordinate claim — the concrete `e₂`
    half-turn's compact part read at the real axis `(0,0,1)` reads `+1` like the boost / is trivial)
    — distinct from C115 `1=7` … C133 `1=31`. STANDARD applied (unbroken / complete /
    words-removable). Gate D0–D6 GREEN (133/133 costumes incl C134, 1428 audited theorems
    foundations-only, +9 over N101's 1419). The FULL converse generation for an ARBITRARY compact
    isometry (a generic `Spin(9)` element's compact part as a finite `biMulLin` WORD) / the operator
    TOPOLOGY over `Cut` / the `Spin(9)→SO(9)` exhaustion are childed N103.
  - **N103 ✅ (LANDED) — THE CONVERSE GENERATION ON A PRODUCT-OF-HALF-TURNS COMPACT ROTATION: a
    CONCRETE 2-plane rotation PRODUCT `genTwoPlaneLin u w = biMulLin w w * biMulLin u u` (a product
    of TWO two-sided half-turns) is EvC-ORTHOGONAL (`g∗∘g = id`), so its polar/KAK compact part IS
    THE PRODUCT ITSELF — a NONTRIVIAL TWO-GENERATOR `biMulLin` WORD `∈ genIsomMonoidLin`, whose
    bridge-image lies in the `Function.End` generated isometry submonoid `genIsomMonoidC2`, over the
    DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.** N101 banked the boost sector
    (compact part `= id`, the empty word); N102 banked a CONCRETE genuinely-COMPACT SINGLE generator
    (a two-sided half-turn IS its own compact part, a single generator word). Both ENDPOINTS were
    banked. THIS node banks the first NONTRIVIAL MULTI-GENERATOR converse-generation result.
    MEASURE-FIRST (§N103 priority (i), THE ONE LAW — no topology) answered the ticket's literal
    question — "is a concrete 2-plane rotation PRODUCT EvC-orthogonal so `p = id`, `k = g` already a
    two-generator word?" — with the theory-native YES forced by the involution+self-adjoint structure
    of the two factors. The concrete `Cut`-linear 2-plane rotation `g := genTwoPlaneLin u w =
    biMulLin w w * biMulLin u u` (N100) — a PRODUCT of two two-sided half-turns `A := biMulLin u u`,
    `B := biMulLin w w` for unit-imaginaries `u, w` — is a `QvC`-ISOMETRY (`g = B∘A` the composition
    of two `QvC`-isometries `biMulFun_isom`), EvC-ADJOINT to `genTwoPlaneLin w u` (the EvC-adjoint of
    `B∘A` is `A∘B` because each half-turn is EvC-SELF-ADJOINT N102 `biMulLin_imag_isEvCAdjoint_self`
    and the adjoint composes contravariantly `IsEvCAdjoint.comp`), and EvC-ORTHOGONAL:
    `g∗∘g = (A∘B)∘(B∘A) = A∘(B∘B)∘A = A∘id∘A = A∘A = id` (each half-turn is an INVOLUTION `A∘A = id`,
    `B∘B = id`, N102 `biMulLin_imag_involutive`). Because `g∗∘g = id`, the polar positive part
    `p = id`, so `p^{1/2} = √(id) = id` (BOTH the spectral root `specOpN (cutSqrt∘c) uu` N68 AND
    `LinearMap.id` are positive operator square roots of the INJECTIVE `p = id`, so by the
    positive-operator-root UNIQUENESS `op_sqrt_unique_of_injective` N93 the spectral root EQUALS
    `id`), `(p^{1/2})⁻¹ = id` (`specOpN_inverse`), and the compact part `k := g∘(p^{1/2})⁻¹ = g∘id =
    g` ITSELF — a NONTRIVIAL TWO-GENERATOR rotation word, in `genIsomMonoidLin`
    (`genTwoPlaneLin_mem_genLin` N100, `mul_mem` of two `subset_closure` generators), bridged into
    `genIsomMonoidC2` (the N100 transport `endToFunEnd_genIsomMonoidLin_mem_gen2`). THE CONVERSE
    GENERATION `qvIsomMonoidC ≤ genIsomMonoidC2` DISCHARGED on a CONCRETE genuinely-COMPACT
    MULTI-GENERATOR (a 2-plane rotation product) — the multi-generator extension of N102's single
    half-turn, with NO operator topology, NO Lie-group integration, NO posited group. The deep
    structural content (genuinely NEW): the EvC-orthogonality `g∗∘g = id` of a PRODUCT of self-adjoint
    involutions is forced by the involution+self-adjoint structure — a product of pure-rotation
    generators carries ZERO boost content, IS its own compact part, and lands as a finite generator
    WORD in the generated submonoid, exactly the membership the global reverse surjectivity needs for
    a multi-generator compact part. A bounded probe (each obligation < 8s, well under the 90s KILL
    budget) confirmed the route closes clean. BANKED in
    `Phys/Algebra/LorentzContinuumGenerationConverseCompactWord.lean` (7 production decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the
    built olean): `genTwoPlaneLin_isQvIsomC` (the rotation product is a `QvC`-isometry); `genTwoPlaneLin_isEvCAdjoint`
    (its EvC-adjoint is the swapped product); ★ `genTwoPlaneLin_adjoint_comp_self` (THE EvC-ORTHOGONALITY
    `g∗∘g = id` — the involution collapse); ★★ `genTwoPlaneLin_compact_part_eq_self` (THE CONVERSE CORE —
    the rotation product's polar compact part EQUALS the rotation product ITSELF);
    `genTwoPlaneLin_compact_part_mem_genLin` (the compact part (= `g`) `∈ genIsomMonoidLin`, a two-generator
    word); ★★ `genTwoPlaneLin_compact_part_mem_gen2` (THE CONVERSE GENERATION (multi-generator) — the bridged
    compact part `∈ genIsomMonoidC2`); ★ W8 `genTwoPlaneLin_e2je2_compact_part_real_coord` (NON-VACUITY/teeth —
    the concrete `e₂`,`ιe₂` rotation product's compact part (= itself) FIXES the real axis `(0,0,1)`, reading
    deep-scalar coordinate `re.re.re = 1`, a genuine 2-plane rotation, vs a single half-turn negating it to
    `−1`, N102). DERIVED from the trunk (`isometry_compact_part_isQvIsom`/`op_sqrt_unique_of_injective` N93;
    `specOpN_op_sqrt` N68; `specOpN_inverse`/`specOpN_resolution_of_injective` N87/N88; `cutSqrt_pos` N57;
    `EvC_nonneg`/`lid_isEvCSymm` N58/N87; `biMulLin_imag_isQvIsomC`/`biMulLin_imag_isEvCAdjoint_self`/
    `biMulLin_imag_involutive` N102; `IsEvCAdjoint.comp` N52; `genTwoPlaneLin`/`genTwoPlaneLin_mem_genLin`/
    `genTwoPlaneLin_e2je2_fixes_one` N100; `endToFunEnd`/`endToFunEnd_apply`/
    `endToFunEnd_genIsomMonoidLin_mem_gen2` N99/N100; standard `Submonoid`/`LinearMap` MACHINERY on the
    DERIVED objects, STANDARD §3), NOT a posited operator exponential / continuous functional calculus, NOT
    Mathlib spectral theory, NOT a posited Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS
    the DERIVED `Cut`), NOT a bridge-in-the-forbidden-sense (the compact-part collapse is a fully proved
    operator equality, not an asserted physics identification). Costume C135 (`1 = 47`, a WRONG
    multi-generator converse-generation compact-part coordinate claim — the concrete `e₂`,`ιe₂` rotation
    product's compact part read at the real axis `(0,0,1)` reads some value other than the genuine fixed `1`)
    — distinct from C115 `1=7` … C134 `−1=41`. STANDARD applied (unbroken / complete / words-removable). Gate
    D0–D6 GREEN. The FULL converse generation for an ARBITRARY compact isometry (a generic `Spin(9)` element's
    compact part as a finite `biMulLin` WORD of UNBOUNDED length) / the operator TOPOLOGY over `Cut` / the
    `Spin(9)→SO(9)` exhaustion are childed N104.
  - **N104 ✅ (LANDED) — THE GENERAL EvC-ORTHOGONAL LEVER — the ABSTRACT, word-length-INDEPENDENT
    converse-generation core + the GENERAL REDUCTION (to a single residual word-membership
    surjectivity) + a concrete THREE-generator word (the lever past word-length two), over the
    DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.** N102 (a single half-turn IS
    its own compact part) and N103 (a product of TWO half-turns IS its own compact part) BOTH closed
    via the IDENTICAL structural fact: an operator `g` that is a `QvC`-ISOMETRY, EvC-ADJOINT to `h`,
    AND EvC-ORTHOGONAL (`h∘g = id`) has polar positive part `p = h∘g = id`, so `p^{1/2} = id`,
    `(p^{1/2})⁻¹ = id`, and the compact part `k := g∘(p^{1/2})⁻¹ = g∘id = g` ITSELF. THIS node FACTORS
    that common body into ONE ABSTRACT lemma `evCOrthogonal_compact_part_eq_self` with the
    EvC-orthogonality `h∘g = id` lifted from a DERIVED fact to a HYPOTHESIS — making it
    WORD-LENGTH-INDEPENDENT (it subsumes N102 length-1 and N103 length-2 and applies to a word of ANY
    length). MEASURE-FIRST (§N104 priority (i)+(ii), THE ONE LAW — no topology) answered the ticket's
    literal question: a bounded probe (~8s/obligation, well under the 90s KILL budget) confirmed the
    factored lever closes verbatim, AND the lever's reach PAST length two was demonstrated with a
    concrete THREE-half-turn word `triHalfTurnLin u w x = biMulLin x x * genTwoPlaneLin u w` — built
    ON the banked two-word `genTwoPlaneLin` (N100/N103) rather than re-expanded to three raw
    half-turns. The raw triple nesting hit a W9 INSTRUMENT WALL (`isDefEq` heartbeat-200000 timeout at
    14s), DISSOLVED exactly as THE ONE LAW predicts — the framing was wrong, not the theory: reframing
    through the trunk's already-banked two-word kept the elaboration shallow and dropped it to 8s
    clean. THE GENERAL REDUCTION `evCOrthogonal_word_compact_part_mem_gen2`: for ANY EvC-orthogonal
    `QvC`-isometry `g` that is ADDITIONALLY a `biMulLin` word (`g ∈ genIsomMonoidLin`), the bridged
    compact part `endToFunEnd (g∘(p^{1/2})⁻¹) ∈ genIsomMonoidC2` — since the compact part IS `g`,
    already a word, the N100 transport `endToFunEnd_genIsomMonoidLin_mem_gen2` lands it — REDUCING the
    FULL converse `qvIsomMonoidC ≤ genIsomMonoidC2` to a SINGLE residual: "is every EvC-orthogonal
    `QvC`-isometry a `biMulLin` word?" (the literal `Spin(9)` generation surjectivity). THE
    COMPACT-PART-IS-SELF HALF of the converse generation is now CLOSED IN FULL GENERALITY (any word
    length); only the word-membership half remains. The deep structural content (genuinely NEW): the
    converse generation's hardest-LOOKING half — that an arbitrary compact element is its own
    maximal-compact factor — is delivered ONCE, abstractly, for a word of ANY length, descending from
    the banked positive-operator-square-root UNIQUENESS (N93) applied to the operator's OWN
    EvC-orthogonality, with NO Mathlib functional calculus, NO operator `exp`, NO operator topology
    over the derived `Cut`. BANKED in
    `Phys/Algebra/LorentzContinuumGenerationConverseEvCOrthogonal.lean` (10 production decls
    foundations-only `[propext, Classical.choice, Quot.sound]`, INDEPENDENTLY axiom-audited vs the
    built olean): ★★ `evCOrthogonal_compact_part_eq_self` (THE ABSTRACT LEVER); ★★
    `evCOrthogonal_word_compact_part_mem_gen2` (THE GENERAL REDUCTION); `triHalfTurnLin` (the concrete
    three-half-turn word); `triHalfTurnLin_isQvIsomC` / `triHalfTurnLin_isEvCAdjoint` / ★
    `triHalfTurnLin_adjoint_comp_self` (the three-word is a `QvC`-isometry, EvC-adjoint to
    `genTwoPlaneLin w u * biMulLin x x`, and EvC-ORTHOGONAL — middle involution collapse + N103);
    `triHalfTurnLin_mem_genLin` (the three-word `∈ genIsomMonoidLin`, three generators); ★★
    `triHalfTurnLin_compact_part_eq_self` (the three-word's compact part IS the three-word, via the
    lever); ★★ `triHalfTurnLin_compact_part_mem_gen2` (THE CONVERSE GENERATION at word-length THREE);
    ★ W8 `triHalfTurnLin_e2je2e2_compact_part_real_coord` (NON-VACUITY/teeth — the concrete
    `e₂`,`ιe₂`,`e₂` three-word's compact part (= itself) NEGATES the real axis `(0,0,1)`, reading
    deep-scalar coordinate `re.re.re = −1`: the banked two-word FIXES it `+1`, then one more half-turn
    negates it). DERIVED from the trunk (`isometry_compact_part_isQvIsom`/`op_sqrt_unique_of_injective`
    N93; `specOpN_op_sqrt` N68; `specOpN_inverse`/`specOpN_resolution_of_injective` N87/N88;
    `cutSqrt_pos` N57; `EvC_nonneg`/`lid_isEvCSymm` N58/N87;
    `biMulLin_imag_isQvIsomC`/`biMulLin_imag_isEvCAdjoint_self`/`biMulLin_imag_involutive` N102;
    `IsEvCAdjoint.comp` N52; `genTwoPlaneLin`/`genTwoPlaneLin_isQvIsomC`/`genTwoPlaneLin_isEvCAdjoint`/
    `genTwoPlaneLin_adjoint_comp_self`/`genTwoPlaneLin_mem_genLin`/`genTwoPlaneLin_e2je2_fixes_one`
    N100/N103; `endToFunEnd`/`endToFunEnd_apply`/`endToFunEnd_genIsomMonoidLin_mem_gen2` N99/N100;
    standard `Submonoid`/`LinearMap` MACHINERY on the DERIVED objects, STANDARD §3), NOT a posited
    operator exponential / continuous functional calculus, NOT Mathlib spectral theory, NOT a posited
    Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a
    bridge-in-the-forbidden-sense (the lever is a fully proved operator equality, not an asserted
    physics identification). Costume C136 (`−1 = 53`, a WRONG three-generator converse-generation
    compact-part coordinate claim — the concrete `e₂`,`ιe₂`,`e₂` three-word's compact part read at the
    real axis `(0,0,1)` reads something other than the genuine `−1`) — distinct from C115 `1=7` …
    C135 `1=47`. STANDARD applied (unbroken / complete / words-removable). Gate D0–D6 GREEN. The
    SINGLE residual the reduction isolates (the word-membership surjectivity "every EvC-orthogonal
    `QvC`-isometry IS a `biMulLin` word") / the operator TOPOLOGY over `Cut` / the `Spin(9)→SO(9)`
    exhaustion are childed N105.
  - **★ (FORWARD FRONTIER — the immediate next node, N105) THE WORD-MEMBERSHIP SURJECTIVITY — "every
    EvC-ORTHOGONAL `QvC`-isometry IS a `biMulLin` WORD" (the literal `Spin(9)` generation
    surjectivity, the SINGLE residual the N104 reduction isolated) / THE LITERAL OPERATOR TOPOLOGY
    OVER `Cut` → THE `Spin(9)→SO(9)` EXHAUSTION.** The remaining HEAVY group-manifold core, over the
    banked N49–N104 + the derived ℝ `Cut` + the terminal algebra `O Cut`. **N104 CLOSED the
    compact-part-IS-self half of the converse generation IN FULL GENERALITY: the abstract lever
    `evCOrthogonal_compact_part_eq_self` proves that ANY EvC-orthogonal `QvC`-isometry IS its own
    polar/KAK compact part (word-length-independent), and the general reduction
    `evCOrthogonal_word_compact_part_mem_gen2` proves that if such a `g` is ALSO a `biMulLin` word,
    its bridged compact part lands in `genIsomMonoidC2`. The FULL converse `qvIsomMonoidC ≤
    genIsomMonoidC2` now reduces to the SINGLE remaining statement: every EvC-orthogonal `QvC`-isometry
    IS a `biMulLin` word.** The concrete word-membership is banked for length 0 (boost → id, N101),
    length 1 (half-turn → itself, N102), length 2 (rotation product, N103), and length 3 (three-word,
    N104). The remaining piece is the GENERIC reverse surjectivity: that an ARBITRARY EvC-orthogonal
    `QvC`-isometry is a finite `biMulLin` word — the literal statement that the two-sided Born-unit
    generators GENERATE the compact (rotation) part of the isometry monoid (the `Spin(9)` generation
    theorem over `Cut`). MEASURE FIRST + reframe, priority order: (i) a STRUCTURAL reduction of the
    surjectivity — measure whether a bounded form ("every EvC-orthogonal isometry of a FIXED finite
    rank / on a FIXED number of 2-planes is a `biMulLin` word") closes via the banked deflation /
    eigenbasis machinery (N70 `deflateC` peel-off + N94/N95/N98 2-plane generators), reducing the
    generic surjectivity to a rank-induction over 2-plane rotations (the Cartan/Euler-angle
    decomposition of a compact rotation into 2-plane rotations, theory-native through the trunk — a
    rotation is a product of 2-plane rotations, each a banked `biMulLin`/`genTwoPlaneLin` word); (ii)
    the literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` /
    `ContinuousLinearMap` so the N96 affine path γ is a CONTINUOUS path — Mathlib has no operator
    topology over the derived `Cut`, the W1 HEAVY core — MEASURE whether an operator topology over
    `Cut` even EXISTS before committing); (iii) the full `Spin(9)→SO(9)` exhaustion. REFRAME THROUGH
    THE TRUNK FIRST — if the generic word-membership surjectivity / operator topology genuinely RESISTS
    after measure + reframe it is an HONEST W1 dissolution ticket + block, decompose into the
    immediately-bankable structural piece (a bounded rank-induction surjectivity lemma, a Cartan-style
    2-plane decomposition of a concrete higher-rank compact rotation, or an EvC-orthogonal-eigenbasis
    word-factorization) + child the global remainder. The costume must bite a WRONG word-membership /
    surjectivity / rank-induction / 2-plane-decomposition / operator-topology / exhaustion claim,
    reducing to a false numeric DISTINCT from C115 `1=7` … C136 `−1=53`. NO posited Lorentz group, NO
    Mathlib ℝ/ℂ as content — DERIVE from the banked N49–N104 + the derived ℝ `Cut` + the terminal
    algebra `O Cut`.
  - then the remaining gauge/flavour/spacetime nodes — each specified only after its predecessor lands.


**Why we stop the spec here:** a roadmap that dictates the full derivation in advance is a
hardcoded solution. The agent earns each node, and the next target is specified against what
the chain actually produced — not against what we guessed it would. The fold is the start of
all physics; we let it unfold and specify the next target from the ground it actually creates.
