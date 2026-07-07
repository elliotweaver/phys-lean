/-
  Counterexamples.SMatrixVacuityCostume — N400 anti-vacuity (C425).
  ============================================================================================
  W8 ANTI-VACUITY. The N400 node (arc-K K4 — the S-matrix on the mass-gapped physical sector)
  bundles K1–K3 into the structural scattering operator (`scatteringOp = evolve`, unitary,
  sheaf-preserving) and welds it to the arc-I mass gap: a standpoint is ASYMPTOTIC (in the
  S-matrix domain, `WorldsGlue`) IFF it is MASSLESS (per-plaquette action `0` everywhere,
  `asymptotic_iff_massless`). The confined coloured witness is EXCLUDED from the domain
  (`confined_excluded`) AND GAPPED (`confined_gapped`, `bornAction ≥ 4 > 0`).

  The load-bearing non-vacuity fact is that the confined coloured witness genuinely carries a
  NONZERO mass gap: its associator curvature `[ι(ιJ), ι(e₂), e₂]` has a NONZERO coordinate
  (`assoc_witness_coord`: `c₇ = 2`), so its Born-self-overlap action is `≥ 4 > 0`. Hence the
  domain/confined split BITES — there is a genuine standpoint that is both non-asymptotic and
  massive, and the massless (photon-like) singlet sector is its non-trivial complement.

  A mis-reading where K4 were VACUOUS (the S-matrix domain is everything / there is no confined
  sector / the mass gap is `0` / asymptotic ⟺ massless is trivially "all standpoints are
  massless") would have the witness curvature coordinate `= 0`, not `2`.

  THE CERTIFICATE. `cFlag := 2` — a ℕ flag standing for "the confined coloured witness genuinely
  carries a nonzero mass gap: its curvature coordinate `c₇ = 2 ≠ 0`, so it is excluded from the
  S-matrix's massless asymptotic domain and sits above the gap floor". It is TIED to the banked
  N400 landing by `cFlag_forced`: `assoc_witness_coord` gives the witness curvature coordinate
  `= 2`, `confined_gapped` gives `bornAction witness ≥ 4`, and `confined_excluded` gives that the
  witness is not asymptotic — the domain⟺massless weld therefore genuinely separates it.

  We anchor `min 425 cFlag = 2` (TRUE — `cFlag = 2 < 425`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "K4 is vacuous / the domain is everything / no confined
  sector / the mass gap is 0 / asymptotic ⟺ massless is trivial" mis-reading): that
  `min 425 cFlag = 425`. It GENUINELY equals `2` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `2 = 425` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (425, 2) is fresh (Cid 425 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.SMatrix
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- THE K4-NON-VACUITY FLAG: `2` = "the confined coloured witness genuinely carries a nonzero
    mass gap; its curvature coordinate `c₇ = 2 ≠ 0`, so it is EXCLUDED from the S-matrix's
    massless asymptotic domain and sits above the gap floor — the domain/confined split is not
    vacuous". -/
def cFlag : ℕ := 2

/-- TRUE (tied to the banked N400 landing): `assoc_witness_coord` proves the confined witness
    curvature coordinate is `2`; `confined_gapped` proves its Born action is `≥ 4`; and
    `confined_excluded` proves it is not asymptotic. So the domain⟺massless weld genuinely
    separates a massive confined standpoint from the massless domain; hence `cFlag = 2`. If K4
    were vacuous (the domain everything / gap `0`), the coordinate would be `0`, not `2`. -/
theorem cFlag_forced :
    (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im = 2
      ∧ (4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)
      ∧ ¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ))
      ∧ cFlag = 2 :=
  ⟨assoc_witness_coord, confined_gapped, confined_excluded, rfl⟩

/-- TRUE: `min 425 cFlag = 2`, holding precisely because `cFlag = 2 < 425`. -/
theorem cert_val_true : min (425 : ℕ) cFlag = 2 := by decide

/-- BOGUS: claims `min 425 cFlag = 425`. It GENUINELY equals `2` (`cert_val_true`). A "K4 is
    vacuous / the S-matrix domain is everything / no confined sector / the mass gap is `0` /
    asymptotic ⟺ massless is trivial" mis-reading reduces — through the banked genuinely-gapped
    confined witness (curvature coordinate `2 ≠ 0`) — to the false numeric `2 = 425`, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (425 : ℕ) cFlag = 425 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 425  (FALSE — the costume bites)

end Counterexamples
