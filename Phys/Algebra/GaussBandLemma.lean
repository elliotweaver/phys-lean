/-
  # THE BAND LEMMA — shallow-composite values are pinched (GQ SG-a)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The link named by external audit as the unproved step in the
  seed-growth chain ((2)→(3)): a composite principal value with NO deep
  prime factor forces BOTH factors into the narrow band — the E_m
  dichotomy's second horn, as pure Z-inequalities.

  * `band_lower` — ★ every prime factor shallow + least-prime witness
    p ≤ u ⟹ A < 4u².
  * `band_upper` — ★ the coband: A < 4u² and n = u·v ⟹ A·v² < 4n²
    (v < 2n/√A, root-free form).
  * `shallow_forces_band` — ★★★ THE PINCH: n = u·v, 1 < u ≤ v, all
    prime factors shallow ⟹ both band inequalities.
  * `dichotomy_core` — ★★★ + the witness identity 4n = b² + A gives the
    depth ceiling A ≤ 4n: the three-way split's arithmetic skeleton
    (every early P-value is prime, OR banded-composite, OR yields a
    deep seed).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCertificate

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★★★ THE BAND LEMMA (factor side): if every prime factor of u·v is
    shallow (4p² > A) and u > 1 has a prime factor bounded by u, then
    4u² > A. Pure transitivity once the least-prime-factor is supplied. -/
theorem band_lower {u A : Z} {p : Z}
    (hp2 : 2 ≤ p) (hpu : p ≤ u)
    (hshallow : A < 4 * (p * p)) :
    A < 4 * (u * u) := by
  have h1 : p * p ≤ u * u := by nlinarith
  linarith

/-- ★★★ THE BAND LEMMA (coband side): u·v = n with A < 4u² gives the
    upper band for v: A·v² < 4n² — i.e. v < 2n/√A, Z-form without roots. -/
theorem band_upper {u v n A : Z}
    (hn : n = u * v) (hu : 0 < u) (hv : 0 < v) (hA : 0 < A)
    (hlow : A < 4 * (u * u)) :
    A * (v * v) < 4 * (n * n) := by
  have h1 : A * (v * v) < 4 * (u * u) * (v * v) := by
    have hvv : 0 < v * v := by nlinarith
    nlinarith
  calc A * (v * v) < 4 * (u * u) * (v * v) := h1
    _ = 4 * ((u * v) * (u * v)) := by ring
    _ = 4 * (n * n) := by rw [← hn]

/-- ★★★ THE PACKAGED BAND: n = u·v, 1 < u ≤ v, every prime factor of n
    shallow (via u's witness prime), THEN both band inequalities hold:
    the factor pair is pinched — the E_m dichotomy's second horn. -/
theorem shallow_forces_band {u v n A p : Z}
    (hn : n = u * v) (hu1 : 1 < u) (huv : u ≤ v) (hA : 0 < A)
    (hp2 : 2 ≤ p) (hpu : p ≤ u)
    (hshallow : A < 4 * (p * p)) :
    (A < 4 * (u * u)) ∧ (A * (v * v) < 4 * (n * n)) := by
  have hlow := band_lower hp2 hpu hshallow
  have hupos : (0 : Z) < u := by linarith
  have hvpos : (0 : Z) < v := by linarith
  exact ⟨hlow, band_upper hn hupos hvpos hA hlow⟩

/-- ★★ THE DICHOTOMY CORE: n = P-value with witness identity
    4n = b² + A (A = |D| > 0), and n composite with all prime factors
    shallow ⟹ the band pinch AND the depth ceiling b² < 4n (so n >
    A/4: values below the wall can't even be shallow-composite...
    packaged: the three-way split's arithmetic skeleton). -/
theorem dichotomy_core {n b A u v p : Z}
    (hid : 4 * n = b * b + A) (hA : 0 < A)
    (hn : n = u * v) (hu1 : 1 < u) (huv : u ≤ v)
    (hp2 : 2 ≤ p) (hpu : p ≤ u) (hshallow : A < 4 * (p * p)) :
    (A < 4 * (u * u)) ∧ (A * (v * v) < 4 * (n * n)) ∧ (A ≤ 4 * n) := by
  obtain ⟨h1, h2⟩ := shallow_forces_band hn hu1 huv hA hp2 hpu hshallow
  refine ⟨h1, h2, ?_⟩
  nlinarith [mul_self_nonneg b]


#print axioms band_lower
#print axioms shallow_forces_band
#print axioms dichotomy_core

end BQF
end GaussForms
end Phys.Foundation
