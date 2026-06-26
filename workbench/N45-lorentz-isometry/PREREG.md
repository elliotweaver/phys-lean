# N45 PREREG — THE LORENTZ ISOMETRY STRUCTURE of the (1,9) form (FROZEN before compute)

## TARGET (specified against what the chain ACTUALLY produced — ROADMAP §N45)
The banked N43 form is `Qv : STV → ℚ`, `STV := ℚ × ℚ × O ℚ`, `Qv (t,x,v) = Qform t x v = t² − x² − gForm v v`.
N45 = THE ISOMETRY STRUCTURE of `Qv`: the ℚ-linear maps `T : STV →ₗ[ℚ] STV` with `Qv ∘ T = Qv`,
DERIVED as the `Qform`-preserving structure — NOT a posited Lorentz group / O(1,9), NOT Mathlib ℝ/ℂ.

## THE W1 REFRAME (why this dissolves — does NOT need the heavy det route)
The ROADMAP/ticket flags the `M ↦ A M A†` matrix route as the W9 risk: `det(AB)=det A·det B` FAMOUSLY
FAILS over the non-associative `O ℚ`, and a genuine boost matrix `A` needs IRRATIONAL entries (the
derived ℝ). That is the HEAVY connection (child it). But the isometry STRUCTURE of `Qv` itself does
NOT need any matrix determinant: it is the set of `Qform`-preservers, and that set is
 (a) a `Submonoid (STV →ₗ[ℚ] STV)` (closed under id, comp) — PURE MACHINERY, foundations-only;
 (b) NON-TRIVIAL and genuinely Lorentzian: a RATIONAL hyperbolic BOOST `(t,x) ↦ (a t + b x, b t + a x)`
     with `a² − b² = 1` (a Pythagorean-style rational point on the unit hyperbola, e.g. a=5/4, b=3/4)
     preserves `t² − x²` exactly, hence `Qv`, by PURE ℚ RING ARITHMETIC (`ring`) — no octonion product,
     no det, no ℝ. It mixes time and space (off-diagonal) → a non-compact, honestly-Lorentzian element.
 (c) (BONUS, if light) a ROTATION in the v-block `v ↦ u·v` with `gForm u u = 1` preserves `gForm v v`
     via the gForm composition law, itself DERIVED from the banked `Nrm_mul_on_O` + `selfMul_eq_smul`.

## DERIVATION PLAN (each a theorem, foundations-only, forward from banked N43 objects)
 - `IsQvIsom (T) : Prop := ∀ p, Qv (T p) = Qv p`            -- the isometry predicate
 - `isQvIsom_id`, `isQvIsom_comp`                            -- id & composition closure
 - `qvIsomMonoid : Submonoid (STV →ₗ[ℚ] STV)`                -- THE STRUCTURE (machinery)
 - `boost (a b : ℚ) : STV →ₗ[ℚ] STV`                         -- the rational hyperbolic boost linear map
 - `boost_isom (h : a^2 - b^2 = 1) : IsQvIsom (boost a b)`   -- ★ DERIVED isometry, pure `ring`
 - `boost_mem (h) : boost a b ∈ qvIsomMonoid`
 - `boost_ne_id` (for a≠1)                                   -- NON-TRIVIAL: the structure ≠ {id}
 - `boost_mixes_time_space` / a concrete witness            -- it is a genuine Lorentz boost (W8 teeth)
 - (BONUS) `gForm_comp : gForm (x*y) (x*y) = gForm x x * gForm y y` from `Nrm_mul_on_O`+`selfMul_eq_smul`
 - (BONUS) `rot u : STV →ₗ[ℚ] STV` (v ↦ u·v on the block), `rot_isom (gForm u u = 1)`

## GO / NO-GO
 GO if: the boost isometry + the Submonoid structure compile foundations-only under KILL, costume bites.
 NO-GO / CHILD: the full O(1,9) = {all preservers} classification, the SL(2,𝕆)↠SO⁺(1,9) cover, and the
   `herm2_det(AMA†)` det-multiplicativity (the genuine W9/W1 heavy core, needs ℝ + non-assoc det) →
   childed onto the chain tail, NOT ground here.

## KILL BUDGET (W9) — per-obligation 60s. Whole-file build KILL 180s.
 If ANY single obligation exceeds 60s in a bounded probe → it is an instrument failure: measure/decompose,
 do NOT inflate maxHeartbeats. The boost is pure `ring` over ℚ → expected <1s. The Submonoid is `simp`/
 `LinearMap.ext` → expected light. If the gForm composition BONUS exceeds budget → drop it / child it.

## TURN CHECKPOINT
 ~50% turns: the boost + Submonoid MUST be banked-or-in-production-and-committed. Finalize with turns to spare.

## W8 ANTI-VACUITY (costume C76)
 The WRONG isometry claim MUST fail to compile. Candidate: a EUCLIDEAN "boost" `(t,x)↦(a t + b x, b t + a x)`
 claimed to be an isometry under `a²+b²=1` (a ROTATION of (t,x), which does NOT preserve `t²−x²`), OR the
 FALSE claim that a boost with `a²−b²=1, b≠0` FIXES the form `t²+x²` (Euclidean). The wrong claim is refuted
 by the banked sign structure. Reuse banked `Qv`/`Qform`/`boost`.

## PHYSICS-WORDS-REMOVABLE
 Delete "Lorentz/boost/rotation/isometry/spacetime/time/space/spin": what remains is that the ℚ-linear maps
 preserving the quadratic form `t²−x²−gForm v v` on `ℚ×ℚ×O ℚ` form a submonoid of `End`, which is non-trivial
 because the hyperbolic shear `(t,x)↦(at+bx,bt+ax)` with `a²−b²=1` preserves it by ring arithmetic. No physics word load-bearing.
