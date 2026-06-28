# N124 PREREG — THE PEEL ORACLE CONSTRUCTION (frozen before compute)

## TARGET (specified against what N123 actually produced)
N123 banked `reflection_exhaustion`: given a peel ORACLE — for any non-identity gFormC-isometry T,
a reflection R ∈ refl with R*R=1, IsGFormCIsom (R*T), and finrank(fixSubmodule T) <
finrank(fixSubmodule (R*T)) — EVERY gFormC-isometry S ∈ Submonoid.closure refl.
N124 must CONSTRUCT the oracle, closing the full Cartan–Dieudonné exhaustion.

## THE W1 REFRAME (THE ONE LAW) — the flagged obstruction DISSOLVES
The ROADMAP guessed the route: `octReflBlock` (N121) at the bisector of v and Tv, with the real/
imaginary split handled (octReflBlock/octRefl_reflect_imag are stated for IMAGINARY v only) +
operator topology over Cut for SO(9). RETURN TO THE TRUNK: Born = self-overlap = POSITIVITY.
The Born form gFormC on O Cut is POSITIVE-DEFINITE (gFormC_pos_of_ne N115/Polar). A positive-definite
form has HOUSEHOLDER REFLECTIONS — PURE bilinear-form linear algebra, NO octonion multiplication,
NO imaginarity (star v = −v) condition, NO operator topology. octReflBlock was the IMAGINARY shadow
of the general Householder reflection. This dissolves the ENTIRE flagged obstruction at once and
closes the FULL oracle (not a decomposition piece).

## THE CONSTRUCTION
houseHolder a := id − (2·(gFormC a a)⁻¹) • smulRight (gFormCRight a) a
  action: houseHolder a v = v − (2·(gFormC a a)⁻¹ · gFormC a v) • a   (for gFormC a a ≠ 0)
Properties (all clean field/module algebra, gFormC already bilinear so NO polarization):
  P1 houseHolder_apply        — the explicit action (rfl-ish via smulRight_apply)
  P2 houseHolder_isom         — IsGFormCIsom (houseHolder a)  [the αβ-cancellation, c·gFormC a a = 2]
  P3 houseHolder_involutive   — houseHolder a * houseHolder a = 1  [gFormC a (HH v) = −gFormC a v]
  P4 houseHolder_fixes_ortho  — gFormC a u = 0 ⟹ houseHolder a u = u
  P5 houseHolder_neg_self     — houseHolder a a = −a  (W8 read-off candidate)

## THE ORACLE (a := T v − v for a moved v)
For T a gFormC-isometry, T ≠ id: ∃ v, T v ≠ v (else T = id by ext). Set a := T v − v ≠ 0,
so gFormC a a > 0 (gFormC_pos_of_ne) ≠ 0; R := houseHolder a.
  O1 R ∈ houseHolderSet := { R | ∃ a, gFormC a a ≠ 0 ∧ R = houseHolder a }   (trivial)
  O2 R*R = 1                              (houseHolder_involutive)
  O3 IsGFormCIsom (R*T)                   (R, T isometries ⟹ composite isometry)
  O4 R (T v) = v  i.e. (R*T) v = v        [KEY: 2·gFormC a (Tv) = gFormC a a, via isometry
                                           gFormC Tv Tv = gFormC v v; so v ∈ fix(R*T), v ∉ fix T]
  O5 ∀ u, T u = u ⟹ (R*T) u = u           [gFormC a u = gFormC Tv u − gFormC v u =
                                           gFormC Tv Tu − gFormC v u = gFormC v u − gFormC v u = 0]
  ⟹ fixSubmodule T < fixSubmodule (R*T)   (⊆ by O5, strict by O4: v in RHS not LHS)
  ⟹ finrank strictly grows                (Submodule.finrank_lt_finrank_of_lt, instFiniteOCut)

## THE ASSEMBLED THEOREM
houseHolder_oracle : the oracle hypothesis of reflection_exhaustion for refl := houseHolderSet.
gFormC_isom_mem_closure : ∀ S, IsGFormCIsom S → S ∈ Submonoid.closure houseHolderSet.
  = the FULL Cartan–Dieudonné exhaustion / O(8) surjectivity, DERIVED, oracle no longer a hypothesis.

## GO / NO-GO
GO: P1–P5, O1–O5, the strict-growth, and the assembled exhaustion all compile foundations-only.
NO-GO ⟹ DECOMPOSE: if the assembled exhaustion resists, bank houseHolder + P1–P5 + the strict-growth
lemma (immediately-bankable structural piece) and child the oracle-assembly remainder.

## KILL (W9 instrument budget)
Every obligation is clean field/module algebra (module / ring / field_simp), expected < 10s each
(cf. N121–N123 probes ~8s). KILL: any single obligation exceeding 90s isolated ⟹ INSTRUMENT failure,
NOT theory — decompose that obligation, do NOT inflate maxHeartbeats, do NOT brute. NO native_decide.
Measure smallest (P1, P4) before the full candidate. Bank-as-you-go; finalize with turns to spare.

## COSTUME (next id C156) — must BITE
A WRONG peel-oracle / Householder claim reducing to a false numeric DISTINCT from C155 8=121:
candidate `houseHolder a a = −a` read-off, or `(R*T) v = v` growth — pick a coordinate forcing
e.g. `1 = 123` (gFormC of a fixed/swapped image), distinct from all banked C115 1=7 … C155 8=121.

## PHYSICS-WORDS-REMOVABLE
Delete reflection/Householder/isometry/oracle/Cartan/Dieudonné/peel/orthogonal/SO(8)/fixed: what
remains is pure linear algebra over the derived field Cut — for a ≠ 0-norm vector, the map
v ↦ v − (2/gFormC a a · gFormC a v)•a preserves gFormC, is involutive, fixes ker(gFormC a ·), and
for a form-preserving S≠id the choice a := S v − v at a moved v grows ker(S−id) strictly.
