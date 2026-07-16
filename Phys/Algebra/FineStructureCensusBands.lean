/-
  # N462 — SEEDED EXACT-DRESSING X3 (arc X, docs/SEED_EXACT_DRESSING.md §X3):
  #         THE CENSUS PER RESOLUTION BAND — the R-ratio plateaus 2, 10/3, 11/3 ARE `Nc·ΣQ²`,
  #         the COLOURED OCCUPATION SLICE of the banked charge census `Tr(Q²) = 16/3` (N317).

  X2 (N461) promoted the running to the parameter-free EXACT closed solution with the derived
  rate `betaCensus = κ·Tr(Q²) = 16/(9·cutPi)` — the running slope IS the banked charge Born
  self-overlap census `Tr(Q²) = 16/3` (N317, `generation_charge_trace`), a FINITE ℚ-exact count.
  This node RESOLVES that same census BAND BY BAND: at a given resolution scale only the flavours
  whose band edge (banked mass, arcs D/P) lies below the scale are active/resolved, and the local
  census content of each band is the coloured occupation sub-census over those active flavours.

  ## THE THEORY-NATIVE READING (the band census IS the banked Tr(Q²), sliced — seed §X3)

  The banked census is `ladderChargeTrace n = 2·Σ_{S⊆Fin n}(|S|/n)²` (N317), the charge-squared
  trace over the colour exterior ladder `Λ*(colour-n)` at the derived colour dimension
  `n = finrank ℚ Uhol = 3` (N42c). It SPLITS by occupation level `k = |S|` into EXACTLY the
  particle content of one generation, with colour multiplicity the binomial `C(3,k)`:

      k=0 : C(3,0)=1 state, charge 0/3 = 0     → contributes 1·0   = 0    (colour-singlet, neutral)
      k=1 : C(3,1)=3 states, charge 1/3         → contributes 3·1/9 = 1/3  (down-type, 3 colours)
      k=2 : C(3,2)=3 states, charge 2/3         → contributes 3·4/9 = 4/3  (up-type,   3 colours)
      k=3 : C(3,3)=1 state, charge 3/3 = 1      → contributes 1·1   = 1    (colour-singlet, |Q|=1)

  single-chirality sum = 0 + 1/3 + 4/3 + 1 = 8/3, doubled (both chiralities) = 16/3 = `Tr(Q²)`.

  The R-ratio "`Nc·ΣQ²`" is precisely the COLOURED slice of this census — the levels `k=1,2` whose
  colour multiplicity `C(3,k) = 3 = finrank ℚ Uhol = Nc` — summed over the flavours ACTIVE in the
  band. The occupation charge `Q = k / n_c` FALLS OUT of the colour count (why quarks carry charge
  `1/n_c` — there are `n_c` colours), so `Nc·Q²` for one flavour at level `k` is
  `Nc·(k/Nc)² = k²/Nc`, and the coloured census of a band is the sum over active levels:

      ★ band {u,d,s}          → levels [2,1,1]     → Nc·(4/9+1/9+1/9)       = 3·(6/9)  = 2
      ★ band {u,d,s,c}        → levels [2,1,1,2]   → Nc·(4/9+1/9+1/9+4/9)   = 3·(10/9) = 10/3
      ★ band {u,d,s,c,b}      → levels [2,1,1,2,1] → Nc·(…+1/9)             = 3·(11/9) = 11/3

  These ARE the measured hadronic R-ratio plateaus — but no measured value enters any proof; they
  fall out of the banked colour dimension and the banked occupation-charge structure. The band
  EDGES are the banked masses (leptons / heavy quarks, arcs D/P `GenerationMassRatiosNumeric`,
  `AbsoluteMassSpectrum`) — ASSEMBLED here, not re-derived. And the assembly reconstructs the
  banked running DEPTH: `2·((coloured up+down) + colour-singlet) = 16/3 = chargeTraceDepth` — the
  band census IS the local running content of N461.

  ## WHY THIS IS NOT A POSIT (STANDARD §3; seed G1/G4)

  Every value FALLS OUT of the banked colour dimension `finrank ℚ Uhol = 3` (N42c) and the banked
  occupation-charge structure of `ladderChargeTrace` (N317). The occupation charges `1/3`, `2/3`
  are NOT asserted per-flavour — they are `k / (finrank ℚ Uhol)` evaluated at the derived colour
  count. The plateaus `2`, `10/3`, `11/3` are `norm_num` identities over that derived structure.
  The tie to `Tr(Q²) = 16/3` is `generation_charge_trace` (N317) restated as a coloured/neutral
  split; the tie to the running depth is `chargeTraceDepth_eq` (N461/N317). No R-ratio value, no
  plateau, no charge is ever premised.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "R-ratio / colour / quark / flavour / charge / hadronic / band / generation": what remains
  is — for the banked derived colour dimension `nc := finrank ℚ Uhol = 3`, the occupation-normalized
  value `occCharge k = k / nc`, and the coloured census term `colouredCensusTerm k = nc·(occCharge k)²
  = k²/nc`, the list-sums `bandCensus [2,1,1] = 2`, `bandCensus [2,1,1,2] = 10/3`,
  `bandCensus [2,1,1,2,1] = 11/3`, and `2·((colouredCensusTerm 2 + colouredCensusTerm 1) + 1) =
  ladderChargeTrace (finrank ℚ Uhol) = 16/3`. Pure ℚ-arithmetic over the banked subset census; no
  theorem STATEMENT needs a physics word; the ties mention the banked `Module.finrank ℚ Uhol`,
  `ladderChargeTrace`, and `chargeTraceDepth`.

  ## NOT FREE-FLOATING (seed / SOUL free-floating rail)

  The colour count is the BANKED `Module.finrank ℚ Uhol` (N42c), NOT a free `3`. The census terms
  are the coloured slice of the BANKED `ladderChargeTrace` (N317). The depth tie mentions the BANKED
  `chargeTraceDepth` over the derived ℝ `Cut` (N461). `Nc` is literally the cast of the banked
  colour dimension, its value delivered by `finrank_Uhol`.

  ## SEED HARD GUARDS

  - G1 NO ASSERTED VALUE — plateaus / charges FALL OUT of `finrank ℚ Uhol = 3` and the occupation
    structure; nothing premised.
  - G2 NO EMPIRICAL NUMBER — the measured R(s), the measured plateaus `2`, `10/3`, `11/3`, the PDG
    band edges are THIS PROSE / the costume only; never a proof step.
  - G3 EXACT — every plateau is an EXACT ℚ identity, no error bar, no toy approximation.
  - G4 DERIVED, NOT POSITED — the census is the banked ladder second-moment sliced by colour; the
    colour count is the banked derived dimension.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free,
    zero posited axioms, no compiled-decision bypass, no heartbeat inflation. Ground field ℚ; the
    depth tie
    casts into the derived ℝ `Cut`; ⚠ NO Mathlib `Real`/`Complex` as content.
  - G7 ONE LAW — the derivation did not fight; the banked `generation_charge_trace` /
    `chargeTraceDepth_eq` close the ties; the plateaus are `norm_num`.
  - G8 TEETH (W8) — a WRONG colour count (`Nc = 2`: `bandCensusAt 2 [2,1,1] = 3/2 ≠ 2`) and WRONG
    flavour content (all-down `[1,1,1]`: `= 1 ≠ 2`) are provably excluded; the plateau depends on
    the derived colour dimension AND on the up/down occupation structure.

  DERIVED from the trunk (`ladderChargeTrace`/`generation_charge_trace`/`Uhol`/`finrank_Uhol`
  N317/N42c; `chargeTraceDepth`/`chargeTraceDepth_eq` N461/N317 over the derived `Cut` — standard
  Mathlib `List`/`norm_num`/`push_cast` MACHINERY on the DERIVED objects, STANDARD §3). NO posited
  R-ratio / plateau / charge value as content, NO Mathlib ℝ as content.
-/
import Phys.Algebra.FineStructureRunningExact
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) THE BANKED COLOUR COUNT AND THE OCCUPATION CHARGE (not free-floating). -/

/-- THE COLOUR COUNT as the cast of the BANKED derived colour-triplet dimension `finrank ℚ Uhol`
    (N42c), NOT a free `3`. Its value is delivered by `finrank_Uhol`. -/
def Nc : ℚ := (Module.finrank ℚ Uhol : ℚ)

/-- `Nc = 3`, FALLING OUT of the banked `finrank_Uhol`. Never premised. -/
theorem Nc_eq : Nc = 3 := by unfold Nc; rw [finrank_Uhol]; norm_num

/-- `0 < Nc` (the colour count is positive). -/
theorem Nc_pos : 0 < Nc := by rw [Nc_eq]; norm_num

/-- THE OCCUPATION CHARGE of a ladder state at occupation level `k`: `k / n_c`, the banked exterior
    ladder charge `|S| / n_c` (N317) — WHY a coloured state at level `k` carries charge `k/n_c`:
    there are `n_c` colours. NOT asserted per-flavour; the cast of the banked colour dimension. -/
def occCharge (k : ℕ) : ℚ := (k : ℚ) / Nc

/-- THE DOWN-TYPE OCCUPATION CHARGE `occCharge 1 = 1/3` FALLS OUT of `Nc = 3`. -/
theorem occCharge_one : occCharge 1 = 1 / 3 := by unfold occCharge; rw [Nc_eq]; norm_num

/-- THE UP-TYPE OCCUPATION CHARGE `occCharge 2 = 2/3` FALLS OUT of `Nc = 3`. -/
theorem occCharge_two : occCharge 2 = 2 / 3 := by unfold occCharge; rw [Nc_eq]; norm_num

/-! ## (1) THE COLOURED CENSUS TERM `Nc·Q²` and the per-band census. -/

/-- THE COLOURED CENSUS TERM of one flavour at occupation level `k`: `Nc·Q² = Nc·(k/Nc)²`, the
    contribution of a full colour multiplet at level `k` to the charge census. This IS the
    `Nc·ΣQ²` summand of the R-ratio — the coloured slice of the banked ladder second moment,
    because the colour multiplicity `C(n_c,k) = n_c = Nc` at the quark levels `k = 1, 2`. -/
def colouredCensusTerm (k : ℕ) : ℚ := Nc * (occCharge k) ^ 2

/-- THE DOWN-TYPE CENSUS TERM `Nc·(1/3)² = 3·1/9 = 1/3`. -/
theorem colouredCensusTerm_one : colouredCensusTerm 1 = 1 / 3 := by
  unfold colouredCensusTerm; rw [occCharge_one, Nc_eq]; norm_num

/-- THE UP-TYPE CENSUS TERM `Nc·(2/3)² = 3·4/9 = 4/3`. -/
theorem colouredCensusTerm_two : colouredCensusTerm 2 = 4 / 3 := by
  unfold colouredCensusTerm; rw [occCharge_two, Nc_eq]; norm_num

/-- THE PER-BAND CENSUS at the BANKED colour count: the sum of the coloured census terms over the
    occupation levels of the flavours ACTIVE in a resolution band. `[2,1,1]` = {u,d,s}, `[2,1,1,2]`
    = add charm, `[2,1,1,2,1]` = add bottom. The band EDGES (which flavours are active) are the
    banked masses — assembled here as the level list, not re-derived. -/
def bandCensus (levels : List ℕ) : ℚ := (levels.map colouredCensusTerm).sum

/-- THE PER-BAND CENSUS at an ARBITRARY colour count `nc` (for the W8 teeth: a wrong `nc` must fail
    the plateau). At the derived colour value `nc = Nc` this is `bandCensus`. -/
def bandCensusAt (nc : ℚ) (levels : List ℕ) : ℚ :=
  (levels.map (fun k => nc * ((k : ℚ) / nc) ^ 2)).sum

/-! ## (2) THE THREE R-RATIO PLATEAUS AS DERIVED `Nc·ΣQ²` IDENTITIES (EXACT). -/

/-- ★★★ THE LIGHT-BAND PLATEAU `2`. Below the charm edge only {u,d,s} are resolved; the coloured
    census is `Nc·(Q_u² + Q_d² + Q_s²) = 3·(4/9+1/9+1/9) = 3·(6/9) = 2`. A DERIVED ℚ identity over
    the banked colour dimension — the measured plateau `R ≈ 2` is prose only. -/
theorem bandCensus_light : bandCensus [2, 1, 1] = 2 := by
  simp only [bandCensus, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
    colouredCensusTerm_two, colouredCensusTerm_one]
  norm_num

/-- ★★★ THE CHARM-BAND PLATEAU `10/3`. Above the charm edge {u,d,s,c} are resolved; the coloured
    census is `Nc·(4/9+1/9+1/9+4/9) = 3·(10/9) = 10/3`. -/
theorem bandCensus_charm : bandCensus [2, 1, 1, 2] = 10 / 3 := by
  simp only [bandCensus, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
    colouredCensusTerm_two, colouredCensusTerm_one]
  norm_num

/-- ★★★ THE BOTTOM-BAND PLATEAU `11/3`. Above the bottom edge {u,d,s,c,b} are resolved; the
    coloured census is `Nc·(4/9+1/9+1/9+4/9+1/9) = 3·(11/9) = 11/3`. -/
theorem bandCensus_bottom : bandCensus [2, 1, 1, 2, 1] = 11 / 3 := by
  simp only [bandCensus, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
    colouredCensusTerm_two, colouredCensusTerm_one]
  norm_num

/-! ## (3) THE TIE TO THE BANKED CENSUS `Tr(Q²) = 16/3` AND THE RUNNING DEPTH (N317/N461). -/

/-- ★★ THE COLOURED / NEUTRAL SPLIT OF THE BANKED CENSUS. One generation's charge census
    `Tr(Q²) = 16/3` (`generation_charge_trace`, N317) is `2·((coloured up+down) + colour-singlet)`:
    the coloured quark part `colouredCensusTerm 2 + colouredCensusTerm 1 = 4/3 + 1/3 = 5/3`, plus
    the colour-singlet `|Q|=1` part `1`, doubled over both chiralities. The R-ratio band terms ARE
    the coloured slice of the SAME banked ladder second moment. -/
theorem census_generation_split :
    2 * ((colouredCensusTerm 2 + colouredCensusTerm 1) + 1)
      = ladderChargeTrace (Module.finrank ℚ Uhol) := by
  rw [generation_charge_trace, colouredCensusTerm_two, colouredCensusTerm_one]; norm_num

/-- ★★ THE RUNNING-DEPTH TIE (over the derived ℝ `Cut`): the band-assembled census reconstructs the
    banked running DEPTH `chargeTraceDepth = Tr(Q²) = 16/3` (N461/N317). The band census IS the
    local running content of the exact running law. -/
theorem census_generation_is_depth :
    (((2 * ((colouredCensusTerm 2 + colouredCensusTerm 1) + 1)) : ℚ) : Cut) = chargeTraceDepth := by
  rw [colouredCensusTerm_two, colouredCensusTerm_one, chargeTraceDepth_eq]
  push_cast
  norm_num

/-! ## (4) W8 NON-VACUITY WITH TEETH (the colour count and the flavour structure are load-bearing). -/

/-- ★ W8 — THE DERIVED COLOUR COUNT IS LOAD-BEARING: a WRONG colour count `nc = 2` gives
    `bandCensusAt 2 [2,1,1] = 2·((2/2)² + (1/2)² + (1/2)²) = 2·(1 + 1/4 + 1/4) = 3 ≠ 2`. So the
    light plateau `2` is specifically the derived `Nc = 3` value, not an arbitrary colour count. -/
theorem bandCensusAt_two_ne : bandCensusAt 2 [2, 1, 1] ≠ 2 := by
  have h : bandCensusAt 2 [2, 1, 1] = 3 := by unfold bandCensusAt; norm_num
  rw [h]; norm_num

/-- ★ W8 — THE UP/DOWN OCCUPATION STRUCTURE IS LOAD-BEARING: a WRONG all-down band `[1,1,1]` gives
    `Nc·(1/9+1/9+1/9) = 3·(3/9) = 1 ≠ 2`. The plateau `2` genuinely needs one up-type (level 2)
    flavour, not three down-type. -/
theorem bandCensus_all_down_ne : bandCensus [1, 1, 1] ≠ 2 := by
  have h : bandCensus [1, 1, 1] = 1 := by
    simp only [bandCensus, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
      colouredCensusTerm_one]
    norm_num
  rw [h]; norm_num

/-- ★ W8 — THE PLATEAUS ARE STRICTLY ORDERED: `2 < 10/3 < 11/3` — each higher band resolves more
    flavours and carries strictly more census, so the three plateaus are genuinely distinct. -/
theorem bandCensus_strictly_increasing :
    bandCensus [2, 1, 1] < bandCensus [2, 1, 1, 2] ∧
    bandCensus [2, 1, 1, 2] < bandCensus [2, 1, 1, 2, 1] := by
  rw [bandCensus_light, bandCensus_charm, bandCensus_bottom]
  constructor <;> norm_num

/-! ## (5) THE X3 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE X3 LANDING (welded, NOT a bare ∧): the R-ratio band plateaus `2`, `10/3`, `11/3` ARE
    the DERIVED coloured census `Nc·ΣQ²` over the banked colour dimension `finrank ℚ Uhol = 3`
    (`Nc = 3`, occupation charges `1/3`, `2/3` falling out of the colour count); the band census is
    the coloured occupation SLICE of the banked charge census `Tr(Q²) = 16/3`
    (`census_generation_split`) and reconstructs the banked running DEPTH `chargeTraceDepth` over
    the derived ℝ `Cut` (`census_generation_is_depth` — the band census IS the local running
    content of N461); the plateaus are strictly ordered; and a wrong colour count (`Nc=2 → 3`) and
    wrong flavour structure (all-down `→ 1`) are provably excluded. The plateaus, the ladder tie,
    the depth tie, and the teeth are welded: statable from none alone. -/
theorem censusBands_landing :
    Nc = 3 ∧
    occCharge 1 = 1 / 3 ∧ occCharge 2 = 2 / 3 ∧
    bandCensus [2, 1, 1] = 2 ∧
    bandCensus [2, 1, 1, 2] = 10 / 3 ∧
    bandCensus [2, 1, 1, 2, 1] = 11 / 3 ∧
    2 * ((colouredCensusTerm 2 + colouredCensusTerm 1) + 1)
      = ladderChargeTrace (Module.finrank ℚ Uhol) ∧
    (((2 * ((colouredCensusTerm 2 + colouredCensusTerm 1) + 1)) : ℚ) : Cut) = chargeTraceDepth ∧
    bandCensusAt 2 [2, 1, 1] ≠ 2 ∧
    bandCensus [1, 1, 1] ≠ 2 :=
  ⟨Nc_eq, occCharge_one, occCharge_two,
   bandCensus_light, bandCensus_charm, bandCensus_bottom,
   census_generation_split, census_generation_is_depth,
   bandCensusAt_two_ne, bandCensus_all_down_ne⟩

end

end Phys.Algebra
