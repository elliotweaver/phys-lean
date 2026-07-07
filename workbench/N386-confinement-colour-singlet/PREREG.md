# N386 — arc-I I2: colour singlets sheafify → hadrons (PREREG)

## TARGET (theory-native, selected in comment 292)
DERIVE the singlet-sheafifies / colour-obstructs DICHOTOMY: ℂ-valued (singlet)
sections CAN glue to a global section while general 𝕆-valued (coloured) sections
CANNOT — so the only physical asymptotic states are colour singlets, never free
coloured elements.

## THE MECHANISM (the crux, FORCED, DERIVED)
The descent obstruction to gluing = the octonion associator (N219/N385 J-I1),
which is an ALTERNATING trilinear form (banked alt_left/assoc_swap12/23). The
fold's own ℂ line span{1,u1} (N266 `matterColourNeutral`, DERIVED as the g₂-
stabilizer of the fold's √−1, dim 2) CANNOT support an alternating rank-3 form:
every associator triple with first two args in span{1,u1} vanishes — [1,1,x],
[1,u1,x], [u1,1,x], [u1,u1,x] all zero via assoc_one_left/mid + alt_left, by
trilinear expansion. So singlet worlds glue globally (sheafify → free); the full
8-dim carrier supports the nonzero associator → some coloured worlds don't glue
(confined). The dichotomy is forced by dim(fold's ℂ)=2 < 3 = alternating rank.

## LEMMAS (probe1+2+3 all EXIT 0)
- assoc_add_left/smul_left/add_mid/smul_mid — associator linearity slots 1,2 (built)
- singlet_assoc_vanishes (CRUX) — assoc a b x = 0 for a,b ∈ span{1,u1}
- singlet_worlds_glue — singlet worlds glue (via worlds_glue_iff_gluingDefect_zero
  + o_gluingDefect_eq_assoc)
- SectorGlobalGatherOn S := ∀ a∈S, ∀ b∈S, WorldsGlue a b
- singlet_sheafifies — the fold's ℂ line sheafifies
- full_not_sheafifies — ⊤ does not (o_worlds_not_glue)
- colour_neutral_sheafifies — the DERIVED N266 core sheafifies (tie to colour)
- coloured_required_for_obstruction — no-free-coloured-states contrapositive
- singlet_proper — the sheafifying sector is a PROPER subspace (non-vacuity)
- colour_singlet_dichotomy — capstone bundle

## PLATFORM (all banked, foundations-only)
N385 ConfinementCriterion (SectorConfines/globalGather), N219 gluingDefect +
o_gluingDefect_eq_assoc + worlds_glue_iff_gluingDefect_zero, N218T WorldsGlue +
o_worlds_not_glue, Alternative assoc/alt_left, Rep7 assoc_one_left/mid, N266
matterColourNeutral_eq_span_one_u1, DerivationFinrank qsmul_mul_left/right,
DerivationStabilizer complexUnit_sq, u1.

## GUARDS
G1 dichotomy DERIVED (never "colour singlets physical" as premise). G2 no
empirical number. G4 words-removable (delete colour/singlet/hadron → pure
associator-vanishing-on-subalgebra + gluing facts). G5 foundations-only.
FREE-FLOATING: types mention O ℚ / span{1,u1} / gluingDefect / matterColourNeutral
— NOT generic. W8 non-vacuity: singlet_proper + full_not_sheafifies + costume C411.
W9: all proofs cheap (linearity + simp + banked citations); no heavy compile.

## COSTUME C411
A wrong reading — "a coloured (⊤) section also sheafifies" — reduces to 1=411.

## SUCCESSOR
arc-I I3 (the area law), per SEED_QCD §I2→I3. ONE directed successor.
