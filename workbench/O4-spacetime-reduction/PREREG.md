# PREREG — O4 (N419): the (1,9) → (1,3) spacetime reduction

## Target
DERIVE the reduction of the banked terminal (1,9) signature (N43 `signature_one_nine`,
the Sylvester inertia of the Born-determinant form on the self-adjoint 2×2 matrices over
`O ℚ`) to physical 4D `(1,3)`. **Correction to seed §O4 (S3 divergence, followed to theory):**
the seed names "ℍ ⊂ 𝕆 (Cl(1,3)≅Mat(2,ℍ))" — but in the banked *Jordan H₂ determinant*
construction the signatures are H₂(ℝ)=(1,2), **H₂(ℂ)=(1,3)**, H₂(ℍ)=(1,5), H₂(𝕆)=(1,9).
ℍ gives (1,5), NOT (1,3). The banked object forces (1,3) = H₂(**ℂ**) via the **rung-1 complex
level `Dbl ℚ`** sub-line, not ℍ. Recorded in comment 359 (SELECT S3).

## What is derived (all over the cascade ground ℚ; NO Mathlib ℝ/ℂ/Clifford as content)
1. `cxEmbed : Dbl ℚ →ₗ[ℚ] O ℚ`, `w ↦ ⟨⟨w,0⟩,0⟩` — the ℂ sub-line (rung-1 fold) inside the
   terminal algebra. Injective.
2. `cxEmbed_gForm` — the banked Born self-overlap restricts to the 2-square norm `w.re²+w.im²`.
3. Reduced form `Qform13 t x w = t² − x² − (w.re²+w.im²)` on `STV13 = ℚ × ℚ × Dbl ℚ`;
   signature (1,3): `timeSub13` (dim 1, positive), `spaceSub13` (dim 3, negative-definite),
   `IsCompl`, `signature_one_three`. Mirrors N43 exactly at rung 1.
4. **THE LOAD-BEARING WELD** `stEmbed : STV13 →ₗ[ℚ] STV`, `(t,x,w) ↦ (t,x,cxEmbed w)`, with
   `stEmbed_isometry : Qv (stEmbed p) = Qv13 p` — the physical 4D form IS the RESTRICTION of the
   banked 10D form (the reduction is a sub-form, not a new posit).
5. **THE 10→4 SPLIT** `internalSub := ker stProj` (the 6 internal directions, ℂ-part zero):
   `finrank_internalSub = 6`, `range stEmbed ⊕ internalSub = STV` (`IsCompl`), and
   `Qv_neg_on_internal` (all 6 internal directions negative-definite = spacelike, via banked
   `Qv_neg_on_space`). So (1,9) = (1,3) ⊕ (0,6).
6. Capstone `spacetime_reduction_one_three`.

## Guards
G1 no asserted values (dims/signature all derived). G2 no empirical number. G3 (1,3) derived
from the ℂ level + banked (1,9), NOT posited. G4 words-removable (pure sub-form/inertia/
isometric-embedding statements). G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound},
NO Mathlib-ℝ/ℂ/Clifford as content (all over ℚ). W8 costume: next Cid after C443 = C444
(bite a wrong dimension). W4.5: derive exactly O4, not O5 (Poincaré/E=mc²).

## Measure-first
probe.lean EXIT 0: cxEmbed compiles, cxEmbed_gForm proved, Qform reduces, finrank_STV13=4.
