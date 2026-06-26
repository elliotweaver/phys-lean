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

  - **★ (FORWARD FRONTIER — the immediate next node, N65) THE FULL EIGENBASIS EXISTENCE FOR AN
    ARBITRARY (UNEQUAL-DIAGONAL) EvC-SELF-ADJOINT OPERATOR — the characteristic-polynomial roots /
    discriminant radical over `Cut` — → the GLOBAL REVERSE KAK SURJECTIVITY (`qvIsomMonoidC` on the
    connected component `≤ genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion, childed from N64.**
    N49–N64 banked, over the derived ℝ `Cut`: BOTH one-parameter generator families (`boostOPS`,
    `rotGenSetC`), the TWO-SIDED Moufang/`Spin(9)` generator `biMulFun u u'`, the EXTENDED generated
    group `genIsomMonoidC2` with FORWARD soundness (N55), the BORN POSITIVITY / (1,9) signature (N56),
    the POSITIVE-DEFINITE SCALAR SQUARE ROOT `cutSqrt` (N57), the INFINITESIMAL CARTAN DECOMPOSITION
    (`EvC` + the compact/noncompact split, N58), the OPERATOR FORM-ADJOINT `IsEvCAdjoint` with `g*∘g`
    EvC-self-adjoint + EvC-positive-semidefinite (N59), the POSITIVE OPERATOR SQUARE-ROOT predicate
    `IsEvCOpSqrt` with the STRUCTURED/SCALAR root `scalar_op_sqrt` + `comp_scalar_op_sqrt` (N60), the
    first genuinely NON-scalar (2-block diagonal) operator square root `blockDiag_op_sqrt` (N61), the
    octonion-internal (3-eigenvalue) COORDINATE-DIAGONAL operator square root `coordDiag3_op_sqrt`
    (N62), the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the SPECTRAL SQUARE ROOT IN A ROTATED
    ORTHONORMAL BASIS `specOp_op_sqrt` (the first rotated-basis spectral object, diagonal in an
    ARBITRARY GIVEN EvC-orthonormal eigenbasis, N63), AND NOW (N64) the GENERAL (WHOLE-FAMILY)
    EvC-ORTHONORMAL EIGENBASIS EXISTENCE for the EQUAL-DIAGONAL 2-parameter family
    `txOp a b a = specOp (a+b)(a−b) u₊ u₋` over the fixed IRRATIONAL 45° eigenbasis `u₊/u₋`
    (`s = cutSqrt (1/2)`), with the family operator square root `txOp_op_sqrt` and the isometry-derived
    diagonalization `boostGenC∘boostGenC = txOp 1 0 1` — the equal-diagonal slice removing the
    discriminant radical entirely. THE HEAVY CORE that remains is: (i) the FULL eigenbasis existence
    for an ARBITRARY (UNEQUAL-diagonal) EvC-self-adjoint EvC-positive-semidefinite operator — the
    eigenvalues are now the roots of the characteristic polynomial `λ² − (a+d)λ + (ad−b²)`, i.e. the
    discriminant radical `√((a−d)²+4b²)` (the trunk `cutSqrt` applies, but the EIGENVECTORS rotate with
    the parameters — no fixed eigenbasis), then the full n-dim spectral existence over `Cut` (no
    Mathlib spectral theory over `Cut`); once the eigenbasis exists, N63 `specOp_op_sqrt` delivers the
    root; (ii) the polar/KAK assembly `g = k·exp(p)` extracting `exp(p) = √(g*g)` and the compact
    `k = g·exp(p)⁻¹`; (iii) the compact part `k` via CONNECTEDNESS of the isometry group over `Cut` (no
    Mathlib topology of `SO⁺(1,9)`); (iv) the full `Spin(9)→SO(9)` exhaustion (every spacelike rotation
    a finite product of `biMulFun` bimultiplications, the `2:1` cover). Mathlib has NO `SO⁺(1,9)`, no
    octonionic spinor cover, no Lie-group integration over `Cut`. MEASURE FIRST + reframe through the
    trunk — the immediately-bankable sub-pieces to MEASURE FIRST: (i) the UNEQUAL-DIAGONAL eigenbasis
    for a concrete operator — exhibiting the EvC-orthonormal eigenbasis (now parameter-dependent, via
    `cutSqrt` of the discriminant) for a concrete `txOp a b d` with `a ≠ d` (e.g. a concrete
    `boostGenC`-derived non-equal-diagonal `g*g`), so N63 `specOp_op_sqrt` delivers its root — the
    structural lever toward the general unequal-diagonal eigenbasis existence; (ii) a concrete
    reachability — a specific 2-plane `SO(9)` rotation realized as a finite product of the banked
    `biMulFun` two-sided generators (a concrete witness toward the `Spin(9)→SO(9)` exhaustion); (iii)
    the simultaneous EvC-orthogonalization of two commuting self-adjoint operators. If the FULL
    eigenbasis existence / reverse surjectivity genuinely RESISTS after measure + reframe it is an
    HONEST W1 dissolution ticket + block, decompose into the immediately-bankable piece + child the
    global remainder. The costume must bite a WRONG eigenbasis / eigenvalue / diagonalization /
    reachability / surjectivity / exhaustion claim. NO posited Lorentz group, NO Mathlib ℝ/ℂ as content
    — DERIVE from the banked `genIsomMonoidC2`/`qvIsomMonoidC` + `boostOPS` + `rotGenSetC` +
    `biMulGenSetC` + `infIsomLieAlg` + `BvC` + the N56 Born-positivity + the N57 `cutSqrt` + the N58
    Cartan split (`EvC`) + the N59 operator form-adjoint (`IsEvCAdjoint`/`comp_nonneg`) + the N60
    operator square root (`IsEvCOpSqrt`/`scalar_op_sqrt`/`comp_scalar_op_sqrt`) + the N61 2-block
    operator square root (`blockDiag_op_sqrt`) + the N62 octonion-internal coordinate-diagonal operator
    square root (`coordDiag3_op_sqrt`/`octBlock`/`gFormC_coordExpand`) + the N63 EvC-orthogonal
    eigenprojection + rotated-basis spectral root (`projC`/`specOp`/`specOp_op_sqrt`/`EvC_add_left`) +
    the N64 whole-family eigenbasis existence (`txOp`/`txOp_eq_specOp`/`txOp_op_sqrt`/`boostGenC_sq_eq`/
    `uP`/`uM`/`s2`) + the continuum form + the terminal algebra `O Cut` over the derived ℝ.



  - then the remaining gauge/flavour/spacetime nodes — each specified only after its predecessor lands.


**Why we stop the spec here:** a roadmap that dictates the full derivation in advance is a
hardcoded solution. The agent earns each node, and the next target is specified against what
the chain actually produced — not against what we guessed it would. The fold is the start of
all physics; we let it unfold and specify the next target from the ground it actually creates.
