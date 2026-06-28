# N126 PREREG — THE NULL-DIFFERENCE TWO-REFLECTION PEEL (the indefinite-Cartan–Dieudonné null case)

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## THE NODE (specified against what the chain actually produced)
N125 banked the ANISOTROPIC peel oracle over the 10-dim STVC (`houseHolderM_oracle`): a BvC-isometry
T with a moved v whose DIFFERENCE a := Tv−v is ANISOTROPIC (BvC a a ≠ 0) admits the single indefinite
Householder reflection `houseHolderM a`, growing the fixed subspace. N125 explicitly scoped out the
genuinely-indefinite NULL case: for an indefinite form a ≠ 0 does NOT force BvC a a ≠ 0 — the moved
difference can be NULL (BvC a a = 0), and then `houseHolderM a` is undefined (normalizer (BvC a a)⁻¹).

ROADMAP §N126 priority (i): THE NULL/ISOTROPIC CASE — the classical resolution composes TWO
reflections (through an anisotropic auxiliary). MEASURE FIRST whether the trunk dissolves it.

## THE MEASURE (done by hand against the banked BvC bilinearity — W1/W9 measure-first)
For a BvC-isometry T and a moved v, set a := Tv − v, b := Tv + v. Then:
  (P) BvC a b = 0           [a ⊥ b: BvC(Tv)(Tv) − BvC v v = 0 by isometry, cross-terms cancel by symm]
  (N) BvC a a + BvC b b = 4·BvC v v   [norm sum]
So if v is ANISOTROPIC (BvC v v ≠ 0), at least one of a, b is anisotropic (the DICHOTOMY). The null
DIFFERENCE case (BvC a a = 0) forces BvC b b = 4·BvC v v ≠ 0 — peeled through the SUM auxiliary b.

THE TWO-REFLECTION PEEL-BACK: when a := Tv−v is null and v anisotropic,
  R := houseHolderM v ∘ houseHolderM b   sends   Tv ↦ v:
    houseHolderM b (Tv) = −v   [the b-reflection: coeff 2·(BvC b b)⁻¹·BvC b (Tv) = 1 since
                                2·BvC b (Tv) = BvC b b, so houseHolderM b (Tv) = Tv − b = −v]
    houseHolderM v (−v) = −(houseHolderM v v) = −(−v) = v   [linear + houseHolderM_neg_self]
EVERY step is BvC bilinearity + the isometry equation + houseHolderM_neg_self. POSITIVITY NOWHERE
USED — only the anisotropy of v (which v⊥ being indefinite makes a genuine SPACELIKE possibility:
for v TIMELIKE, v⊥ is negative-definite so a null difference forces Tv = v; genuine null differences
require v SPACELIKE — a measured trunk fact). The null obstruction DISSOLVES through the sum auxiliary.

## GO / NO-GO
GO if the probe banks, foundations-only, isolated-typechecks clean:
  1. `BvC_isom_diff_perp_sum`     T isom → BvC (Tv−v) (Tv+v) = 0.
  2. `BvC_isom_diff_sum_norm`     T isom → BvC(Tv−v)(Tv−v) + BvC(Tv+v)(Tv+v) = 4·BvC v v.
  3. `isom_moved_aniso_dichotomy` T isom, BvC v v ≠ 0 → BvC(Tv−v)(Tv−v) ≠ 0 ∨ BvC(Tv+v)(Tv+v) ≠ 0.
  4. `houseHolderM_diff_sends_back` T isom, BvC(Tv−v)(Tv−v)≠0 → houseHolderM (Tv−v) (Tv) = v.
  5. `houseHolderM_sum_sends_neg`   T isom, BvC(Tv+v)(Tv+v)≠0 → houseHolderM (Tv+v) (Tv) = −v.
  6. ★★ `houseHolderM_null_peel_back` T isom, Tv≠v, BvC v v≠0 →
        ∃ R ∈ Submonoid.closure houseHolderMSet, IsBvIsomLin R ∧ R (Tv) = v.
        (one reflection if a aniso; two reflections houseHolderM v ∘ houseHolderM (Tv+v) if a null.)
  7-9. W8 concrete: spacelike v := (0,1,0) (BvC=−1), null n := (1,0,e₀) (gFormC e₀ e₀=1, BvC n n=0,
       n⊥v), target w := v+n = (1,1,e₀) (BvC w w = −1, w−v = n null); the two-reflection peel
       (houseHolderM v ∘ houseHolderM (w+v)) sends w ↦ v; self-overlap read-off BvC(image)=−1.

NO-GO / KILL (INSTRUMENT, not theory — never weaken target, never add hypothesis):
  - any obligation needs > 90s isolated typecheck → DECOMPOSE (W9), do NOT inflate maxHeartbeats.
  - the closure/IsBvIsomLin assembly fights → re-derive through .comp + Submonoid.subset_closure/mul_mem.
  - if the FULL fixed-subspace-growth recursion for the null case resists (it does — the two-reflection
    peel disturbs old fixed vectors not ⊥ v; that is the heavy indefinite Cartan–Dieudonné assembly):
    that is EXPECTED and is the childed remainder N127, NOT this node's scope. This node banks the
    forced PEEL-BACK lemma (R sends Tv to v); the recursion + totally-isotropic case + operator
    topology over Cut are childed.

## COSTUME (next id C158) — must BITE
A WRONG null-peel claim reducing to a false numeric DISTINCT from C157 1=125: target `1 = 126`.
Reuse banked objects (houseHolderM / BvC / the concrete spacelike witness). The wrong claim MUST
fail to compile.

## PHYSICS-WORDS-REMOVABLE
Delete Lorentz/boost/rotation/reflection/Householder/Minkowski/null/isotropic/anisotropic/spacelike/
timelike/peel/isometry/Cartan/Dieudonné/signature: what remains is pure linear algebra over the
derived complete ordered field Cut — for a BvC-isometric S and a vector v with BvC v v ≠ 0 and Sv ≠ v,
a product of ≤ 2 maps houseHolderM (each preserving BvC) sends Sv back to v. No statement needs a word.
