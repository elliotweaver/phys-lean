# PREREG — N269: THE DERIVED GAUGE PRESERVES THE ARENA'S OBSERVABLE SPECTRUM

FROZEN at SELECT S5 (after S1–S4 anti-bullshit gate, t_8f5a8132 comments 129–132).

## TARGET
The derived gauge — BOTH the Lie algebra `Der(O ℚ) = g₂` (N6) AND the group `Aut(O ℚ) = g₂`
(`IsAlgAut`, N-aut group) — acting entrywise on the maximal matter arena `J₃(O ℚ) = H₃(O ℚ)`
(N5/N267), PRESERVES the arena's intrinsic SPECTRAL INVARIANTS:
  · the CUBIC NORM `jN` (the Freudenthal reduced determinant, N215),
  · the QUADRATIC SPUR `jS` (N216),
  · the whole GENERIC CHARACTERISTIC POLYNOMIAL `jN_charpoly` (N216) = the eigenvalue SPECTRUM.
Both finitely (the group: `jN d0 d1 d2 (φa)(φb)(φc) = jN d0 d1 d2 a b c`) and infinitesimally
(the Lie algebra: the first variation vanishes). The FIRST inclusion of the derived gauge into
the arena's EXCEPTIONAL Jordan-automorphism structure (g₂ ⊆ f₄ = Der(J₃(O)), at the level of the
defining invariants). The observable spectrum/eigenvalues/charges are gauge-invariant.

Production file: `Phys/Algebra/OctonionJordanGaugeSpectrumInvariant.lean` (namespace `Phys.Algebra.HJ`).

## FREE-FLOATING GROUNDING (decisive — S4)
The invariance MECHANISM — an automorphism preserves the norm form (`aut_gForm`), a derivation is
skew (`gFormQ_skew`) and maps into ImO (`reQ∘D=0`) — is GENERIC to the derivations/automorphisms of
any composition algebra: a SUPPORTING INGREDIENT, NOT the headline. The HEADLINE is the
octonion-SPECIFIC JOINT, false for the tower's other rungs:
  (i) the cubic norm `jN` EXISTS as a WELL-DEFINED invariant ONLY up to O — its bracketing/cyclic
      well-definedness (`jN_cross_assoc`/`cyclic1`/`cyclic2`, N215) IS octonion trace-associativity
      (`reQ_mul_assoc3`), which FAILS at the sedenions (N200); over a generic ring the reduced
      determinant of a Hermitian octonionic matrix is not even well-defined, so there is nothing to
      preserve;
  (ii) the gauge is `g₂ = Der(O ℚ) = Aut(O ℚ)` — Der(ℂ)=0, Der(ℍ)=su(2)≠g₂; only the terminal
      rung's derivation/automorphism algebra is the derived gauge;
  (iii) the arena is the MAXIMAL exceptional order, cap-forced at 3 (N267).
Words-removable — delete gauge/spectrum/observable/charge/eigenvalue/mass: "every derivation D and
every automorphism φ of O ℚ leaves the ℚ-valued cubic form jN invariant under the entrywise action
fixing the real diagonal; likewise jS and the characteristic polynomial jN_charpoly; jN is
well-defined only because reQ((a·c)·star b) is bracketing-independent = octonion trace-associativity,
which fails at the next Cayley–Dickson rung" — the CONJUNCTION carrier-specific.

## DECLS (ALL de-risked EXIT 0 foundations-only this run, probe_cubicnorm_invariance + probe_finite_aut)
FINITE (group) — the physically-sharper headline:
  · `jN_aut_invariant` (★★★ the gauge GROUP preserves the cubic norm EXACTLY)
  · `jS_aut_invariant` (the spur)
  · `jN_charpoly_aut_invariant` (★★ the characteristic polynomial = the spectrum, invariant)
INFINITESIMAL (Lie) — the first-variation form:
  · `reQ_deriv_zero` (reQ∘D=0)
  · `cross_variation_zero` (the trilinear cross-term first variation → reQ(D[..])=0 via Leibniz)
  · `jN_first_variation_zero` (★★★ the cubic norm's first variation vanishes)
  · `jS_first_variation_zero` (the spur's first variation vanishes)
W8 non-vacuity: a genuine nonzero automorphism/derivation moves a genuine element with a NONZERO
spectral value (jN nonzero witness `jN_witness_cross = 2`, N215; `witnessDerivQ ≠ 0`, N6).
Capstone: `gauge_preserves_spectrum` (bundles: finite jN/jS/charpoly invariance ∧ infinitesimal
first-variation ∧ the octonion-specific well-definedness anchor jN_cross_assoc ∧ non-vacuity).

## COST/KILL (W9)
SHORT structural rewrites (unfold jN/jS + banked aut_gForm/aut_reQ/gFormQ_skew rewrites + ring).
Measured: finite probe 18s, infinitesimal probe 61s (mostly imports, ~3s CPU). KILL: any obligation
>~60s net-of-import, any maxHeartbeats raise, any octonion coordinate decide/native_decide → STOP +
reframe (ONE LAW). Use the GLOBAL instModuleQO (NO qMod override) — jN/jS use no `•`, instance-independent.

## SCOPE — HONESTY CLAUSE
Banks the gauge-invariance of the spectral invariants (jN cubic norm, jS spur, jN_charpoly) — finite
AND infinitesimal — + the octonion-specific well-definedness anchor (jN_cross_assoc) + non-vacuity
ONLY; NOT "the eigenvalues ARE the physical masses / the gauge-invariant spectrum IS the observed
quantum numbers" (removable prose), NOT a bundled g₂ ⊆ f₄ LieHom object (the invariant-preservation
is the honest content), NOT the mixing angle (★2), NOT masses/mixings (★5), NOT the full f₄=Der(J₃(O))
determination.

## COSTUME
C300. Bites at a WRONG reading of the spectral invariance — e.g. the cubic norm's nonzero witness
value `jN_witness_cross = 2` (N215) packaged as `min 300 2 = 300` (genuinely `2` — a genuine nonzero
spectral value the gauge preserves; claiming `300` is FALSE). Pair (300,2) — verify RHS 300 fresh.

## STAR
★1↔★4 deepened (the gauge preserves the arena's observable spectrum) / the FIRST g₂ ⊆ f₄ inclusion
(the derived gauge inside the arena's exceptional automorphisms) / observable spectrum gauge-invariant.
