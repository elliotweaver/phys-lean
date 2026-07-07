# PREREG — N403 (arc-L L2): ATOMIC SHELL STRUCTURE = THE MANY-BODY ANTISYMMETRIC CAPACITY OF THE BANKED FIBRE

## TARGET (theory-native, SELECT-chosen; directed successor of N402 arc-L L1→L2)
Atomic shell structure DERIVED from the banked Pauli exclusion (N373) generalized to N probes:
the antisymmetric (Fermi) sector of N identical quanta is the N-fold exterior power of the banked
carrier; it has a HARD CAPACITY `C(d,N)` that VANISHES for N > d. Shells fill and CLOSE because
identical fermions cannot share a state (self-blindness → antisymmetry) AND the carrier is finite-
dimensional (the terminated cascade). NO energy levels fitted (G1/G2 no-fit, LOUD).

## FOLD-CAUSAL TRACE
fold → self-blindness (no ordering datum, N1) → exchange involution / −1 antisymmetric sector (N373)
→ N-probe antisymmetric sector = N-fold wedge → dim = `C(d,N)` → cascade termination fixes d finite
→ `C(d,d+1)=0` closes the shell. One cause (self-blindness + finite carrier), the periodic closure.

## GRADE
THEOREM-ROUTE for the STRUCTURE (occupancy/filling/closure), per seed §L2 (Pauli banked). Energy-
level NUMBERS are candidate and NOT attempted. Coulomb/α* "sets the binding" = removable prose only.

## BANKED PLATFORM (types must mention these — anti-free-floating)
- N391 `Phys.Quantum.StateFibre` (= `Cut × Cut`), `fibre_finrank : finrank Cut StateFibre = 2`.
- N373 `Phys.Algebra.ExchStat.pauli_exclusion : fermiProj (v ⊗ₜ v) = 0` (two-body case).
- N22 `Phys.Algebra.ImO`, `finrank_ImO : finrank ℚ ImO = 7` (the second banked carrier for the weld).
- Mathlib `exteriorPower.finrank_eq : finrank ⋀[R]^n M = C(finrank M, n)` (MACHINERY over derived Cut).
- Mathlib `AlternatingMap.map_eq_zero_of_eq` (many-body Pauli), `Nat.choose_eq_zero_of_lt` (closure).

## PRODUCTION (Phys/Algebra/AtomicShellPauli.lean, ns Phys.Algebra.AtomicShell)
§1 fermiSector N := ⋀[Cut]^N StateFibre; sector_capacity (= C(2,N)).
§2 manyBodyPauli (repeated arg → wedge 0); two_body_pauli_weld (cites N373).
§3 orbital_occupancy (N=1:2), orbital_filled (N=2:1, nonvacuous), orbital_closes (N=3:0),
   orbital_closed_subsingleton, orbital_nonvacuous, shell_closes_beyond_capacity,
   shell_subsingleton_beyond_capacity.
§4 ONE-CAUSE weld to the second banked carrier: imO_capacity (= C(7,N)), imO_closes_beyond_seven.
   capstone atomic_shell_structure.

## W8 NON-VACUITY (costume C428)
The shell genuinely holds states (finrank 2 at N=1, finrank 1 at N=2, Nontrivial at N=2) YET excludes
coincident states (manyBodyPauli) and CLOSES at N=3 (finrank 0). C428 ties a flag to
orbital_filled + orbital_closes + orbital_nonvacuous; a bogus "shell doesn't close / is vacuous"
reduces to 1 = 428.

## DE-RISK STATUS
probe1 7/7 PASS; probe2 8/8 PASS (all over derived Cut, all banked types). Machinery confirmed.

## GATE-TOKEN / DISCIPLINE
No forbidden literal tokens in prose. Foundations-only ⊆ {propext,Classical.choice,Quot.sound}.
ℝ-vigilance: derived Cut, banked carriers; Mathlib exterior power = MACHINERY. One commit; import
into Phys.lean AND Audits/AxiomAudit.lean. LEDGER row via temp-file concat. Gate-fast background.
