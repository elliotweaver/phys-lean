/-
  # THE ORACLE ASSEMBLY — skeleton, fold, split, block, capture (GQ N611-N612)

  ## What this file proves (GQ campaign, production node)

  The ExchangeOracle's complete structural apparatus:

  * `removeAll_lt` — the fold measure (strict shortening).
  * `InvertibleCapture` / `SubstEngine` / `FoldStep` — the three
    arithmetic supply Props (their instantiation from class data is the
    successor node's obligation).
  * `assemble_contract` — ★★ the transfer surgery: a fresh captured
    generator upgrades every ys-span to an (x :: eraseOne y ys)-span.
  * `all_coprime_fold` — ★★ THE FOLD: any capture normalizes to
    all-p-coprime counts (fuel on removeAll_lt).
  * `fresh_from_folded'` — the folded selection escapes sub.
  * `oracle_assembled` — ★★★ THE SKELETON: the three supplies yield the
    FULL ExchangeOracle contract (fold → fresh → capture → transfer).
  * `RelProd` + `prodRel_append`/`prodRel_append'` — the relative product
    and the seam split, both directions.
  * `block_to_joinLadder` — the block→fused-ladder bridge (cross supply).
  * `WLadder` / `JoinLink` / `wpow_exists` / `block_is_pth` — ★★ the
    block target carries BOTH indices (w-power and y-power).
  * `captured_absorb` — ★★ slack absorption (p-th-power factors merge).
  * `countOcc_pos_of_mem` / `BlockLands` / `foldStep_shape` — ★★ the
    FoldStep contract from split + index-exact block landing + absorption.
  * `joinLadder_landing` / `blockLands_of` — ★★ BLOCKLANDS DISCHARGED
    (cross-supply relative): the count-block lands as the EXACT
    count-power on the base.
  * `captured_pow` — ★★ capture lifts over aligned powers (raise supply).
  * `AReps` / `aReps_mem` / `subst_shape` — ★★ the SubstEngine membership
    contract (substituted selections in AReps ++ y-free rest).

  ## Honest scope (ledger-mirrored)
  Every theorem here is structural — proved outright or supply-relative
  with the supply a named hypothesis. The supplies' instantiation from
  class data (compRel_total/power_tower climbs + the InvertibleCapture
  arithmetic core) is the successor node's single remaining obligation,
  claimed NOWHERE here.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussOracleKit

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- removeAll strictly shortens a list containing y (the fold measure). -/
theorem removeAll_lt {y : BQF} : ∀ {l : List BQF}, y ∈ l →
    (removeAll y l).length < l.length := by
  intro l
  induction l with
  | nil => intro h; exact absurd h (List.not_mem_nil)
  | cons z zs ih =>
      intro hmem
      by_cases hz : z = y
      · rw [removeAll, if_pos hz]
        exact Nat.lt_succ_of_le (removeAll_len zs)
      · rw [removeAll, if_neg hz]
        have hy : y ∈ zs := by
          rcases List.mem_cons.mp hmem with rfl | h2
          · exact absurd rfl hz
          · exact h2
        exact Nat.succ_lt_succ (ih hy)

/-- SUPPLY 1 — INVERTIBLE CAPTURE: y, captured with p-coprime count in
    x's selection, becomes captured by a composite over x and the y-free
    selection members. (The exchange arithmetic: constList_pow read of
    the block, Bézout inversion, raise, exchange-core re-read, cancel.) -/
def InvertibleCapture (p : Re) : Prop :=
  ∀ {x y : BQF} {sel : List BQF} {h : BQF},
    ProdRel sel h → CapturedBy p x h → y ∈ sel →
    (¬ ∃ q : Re, countOcc y sel = p * q) →
    ∃ (sel' : List BQF) (h' : BQF),
      (∀ s ∈ sel', s = x ∨ (s ∈ sel ∧ s ≠ y)) ∧
      ProdRel sel' h' ∧ CapturedBy p y h'

/-- SUPPLY 2 — THE SUBSTITUTION ENGINE: capture substitutes through
    selections — z spanned via a list using y, y captured over an
    alternative list A ⟹ z spanned with y replaced by A-members. -/
def SubstEngine (p : Re) : Prop :=
  ∀ {z y : BQF} {sel A : List BQF} {h hy : BQF},
    ProdRel sel h → CapturedBy p z h →
    ProdRel A hy → CapturedBy p y hy →
    ∃ (sel'' : List BQF) (h'' : BQF),
      (∀ s ∈ sel'', (s ∈ sel ∧ s ≠ y) ∨ s ∈ A) ∧
      ProdRel sel'' h'' ∧ CapturedBy p z h''

/-- ★★ THE CONTRACT ASSEMBLY (step 4): given a fresh y ∈ ys ∖ sub whose
    capture over x :: (y-free members of ys) is in hand, the FULL
    ExchangeOracle conclusion assembles — every z spanned by ys transfers
    to x :: eraseOne y ys (SubstEngine + membership surgery). -/
theorem assemble_contract {p : Re} {x y : BQF} {ys sub : List BQF}
    (hsubst : SubstEngine p)
    (hyys : y ∈ ys) (hyfresh : y ∉ sub)
    -- (3)'s output: y captured over x and y-free ys-members
    {A : List BQF} {hyc : BQF}
    (hA : ∀ s ∈ A, s = x ∨ (s ∈ ys ∧ s ≠ y))
    (hpA : ProdRel A hyc) (hcA : CapturedBy p y hyc) :
    (∀ s ∈ sub, s ≠ y) ∧
    ∀ z : BQF, PSpanned p ys z → PSpanned p (x :: eraseOne y ys) z := by
  constructor
  · intro s hs hsy
    exact hyfresh (hsy ▸ hs)
  · intro z hz
    obtain ⟨selz, hselz, hzc, hpz, hcz⟩ := hz
    obtain ⟨sel'', h'', hmem'', hp'', hc''⟩ :=
      hsubst hpz hcz hpA hcA
    refine ⟨sel'', ?_, h'', hp'', hc''⟩
    intro s hs
    rcases hmem'' s hs with ⟨hmem, hne⟩ | hmemA
    · -- selz-member ≠ y: lives in eraseOne y ys
      exact List.mem_cons_of_mem x
        (mem_eraseOne_of_ne (hselz s hmem) hne)
    · -- A-member: x itself, or a y-free ys member
      rcases hA s hmemA with rfl | ⟨hmem, hne⟩
      · exact List.mem_cons_self ..
      · exact List.mem_cons_of_mem x (mem_eraseOne_of_ne hmem hne)


/-- THE FOLD STEP (supply): a p-divisible-count member sheds — x stays
    captured by the y-free remainder of its selection. -/
def FoldStep (p : Re) : Prop :=
  ∀ {x y : BQF} {sel : List BQF} {h : BQF},
    ProdRel sel h → CapturedBy p x h → y ∈ sel →
    (∃ q : Re, countOcc y sel = p * q) →
    ∃ h' : BQF, ProdRel (removeAll y sel) h' ∧ CapturedBy p x h'

/-- ★★ THE FOLD: any capture normalizes to an all-p-coprime-count
    selection over a sub-selection of the original. -/
theorem all_coprime_fold {p : Re} (hfold : FoldStep p) :
    ∀ (N : Nat) {x : BQF} {sel : List BQF} {h : BQF}, sel.length ≤ N →
    ProdRel sel h → CapturedBy p x h →
    ∃ (sel' : List BQF) (h' : BQF),
      (∀ s ∈ sel', s ∈ sel) ∧
      ProdRel sel' h' ∧ CapturedBy p x h' ∧
      (∀ y ∈ sel', ¬ ∃ q : Re, countOcc y sel' = p * q) := by
  intro N
  induction N with
  | zero =>
      intro x sel h hlen hp hc
      cases sel with
      | nil =>
          refine ⟨[], h, fun s hs => hs, hp, hc, ?_⟩
          intro y hy
          exact absurd hy (List.not_mem_nil)
      | cons a r => exact absurd hlen (Nat.not_succ_le_zero _)
  | succ N ih =>
      intro x sel h hlen hp hc
      by_cases hbad : ∃ y ∈ sel, ∃ q : Re, countOcc y sel = p * q
      · -- fold the offender, recurse on the strictly shorter remainder
        obtain ⟨y, hymem, hq⟩ := hbad
        obtain ⟨h', hp', hc'⟩ := hfold hp hc hymem hq
        have hlen' : (removeAll y sel).length ≤ N := by
          have := removeAll_lt hymem
          omega
        obtain ⟨sel', h'', hsub, hp'', hc'', hcop⟩ := ih hlen' hp' hc'
        exact ⟨sel', h'', fun s hs => (removeAll_sub (hsub s hs)).1,
          hp'', hc'', hcop⟩
      · -- already all-coprime
        push_neg at hbad
        exact ⟨sel, h, fun s hs => hs, hp, hc,
          fun y hy => by
            intro ⟨q, hq⟩
            exact hbad y hy q hq⟩


/-- ★ FRESH FROM FOLDED (clean form). -/
theorem fresh_from_folded' {p : Re} {x : BQF} {sub sel' : List BQF}
    {h' : BQF}
    (hp' : ProdRel sel' h') (hc' : CapturedBy p x h')
    (hnsub : ¬ PSpanned p sub x) :
    ∃ y ∈ sel', y ∉ sub := by
  by_contra hall
  push_neg at hall
  exact hnsub ⟨sel', fun s hs => hall s hs, h', hp', hc'⟩

/-- ★★★ THE ORACLE, ASSEMBLED (supply-relative): the three arithmetic
    supplies yield the full ExchangeOracle contract. -/
theorem oracle_assembled {p : Re}
    (hfold : FoldStep p) (hinv : InvertibleCapture p)
    (hsubst : SubstEngine p) :
    ∀ {x : BQF} {ys sub : List BQF},
    (∀ s ∈ sub, s ∈ ys) → PSpanned p ys x → ¬ PSpanned p sub x →
    ∃ y ∈ ys, (∀ s ∈ sub, s ≠ y) ∧
      ∀ z : BQF, PSpanned p ys z → PSpanned p (x :: eraseOne y ys) z := by
  intro x ys sub hsubys hspan hnsub
  obtain ⟨sel, hselys, h, hp, hc⟩ := hspan
  -- (1) FOLD to all-p-coprime counts
  obtain ⟨sel', h', hsub', hp', hc', hcop⟩ :=
    all_coprime_fold hfold sel.length (Nat.le_refl _) hp hc
  -- (2) FRESH: sel' escapes sub
  obtain ⟨y, hymem, hyfresh⟩ := fresh_from_folded' hp' hc' (by
    -- sub cannot span x through sel' either (sel' ⊆ sel ⊆ ys... the
    -- CONTRACT's hnsub is about sub-SELECTIONS; a sel'-span with members
    -- in sub would BE a sub-span):
    exact hnsub)
  have hyys : y ∈ ys := hselys y (hsub' y hymem)
  -- (3) EXCHANGE: y's count in sel' is p-coprime; capture swaps
  obtain ⟨A, hyc, hA, hpA, hcA⟩ := hinv hp' hc' hymem (hcop y hymem)
  -- (4) TRANSFER: assemble the contract
  refine ⟨y, hyys, ?_, ?_⟩
  · intro s hs hsy
    exact hyfresh (hsy ▸ hs)
  · intro z hz
    obtain ⟨selz, hselz, hzc, hpz, hcz⟩ := hz
    obtain ⟨sel'', h'', hmem'', hp'', hc''⟩ := hsubst hpz hcz hpA hcA
    refine ⟨sel'', ?_, h'', hp'', hc''⟩
    intro s hs
    rcases hmem'' s hs with ⟨hmem, hne⟩ | hmemA
    · exact List.mem_cons_of_mem x (mem_eraseOne_of_ne (hselz s hmem) hne)
    · rcases hA s hmemA with rfl | ⟨hmem, hne⟩
      · exact List.mem_cons_self ..
      · exact List.mem_cons_of_mem x
          (mem_eraseOne_of_ne (hselys s (hsub' s hmem)) hne)


/-- The relative product: h is the A-product built on base m. -/
inductive RelProd : List BQF → BQF → BQF → Prop
  | nil {m : BQF} : RelProd [] m m
  | cons {g : BQF} {gs : List BQF} {m h' h : BQF}
      (hp : RelProd gs m h') (hc : CompRel g h' h) : RelProd (g :: gs) m h

/-- ★★ THE SPLIT, forward: an append product splits at the seam. -/
theorem prodRel_append : ∀ {A B : List BQF} {h : BQF},
    ProdRel (A ++ B) h → ∃ m, ProdRel B m ∧ RelProd A m h := by
  intro A
  induction A with
  | nil =>
      intro B h hp
      exact ⟨h, hp, RelProd.nil⟩
  | cons a A' ih =>
      intro B h hp
      cases hp with
      | cons hp' hc =>
          obtain ⟨m, hB, hrel⟩ := ih hp'
          exact ⟨m, hB, RelProd.cons hrel hc⟩

/-- ★★ THE SPLIT, backward: a seam split reassembles. -/
theorem prodRel_append' : ∀ {A B : List BQF} {m h : BQF},
    ProdRel B m → RelProd A m h → ProdRel (A ++ B) h := by
  intro A
  induction A with
  | nil =>
      intro B m h hB hrel
      cases hrel with
      | nil => exact hB
  | cons a A' ih =>
      intro B m h hB hrel
      cases hrel with
      | cons hp hc => exact ProdRel.cons (ih hB hp) hc

/-- RelProd is Chain-closed in the result slot. -/
theorem relProd_congr_result {A : List BQF} {m h h' : BQF}
    (hrel : RelProd A m h) (hch : Chain h h') :
    (A = [] ∧ Chain m h') ∨ RelProd A m h' := by
  cases hrel with
  | nil => exact Or.inl ⟨rfl, hch⟩
  | cons hp hc =>
      exact Or.inr (RelProd.cons hp
        (compRel_congr (Chain.refl _) (Chain.refl _) hch hc))

/-- ★★ THE BLOCK READ (honest form): rung-aligned — a constList-block
    RelProd plus per-rung cross-witnesses (CompRel y Wk Tk ∧
    CompRel y Wk Tk-dup shape is degenerate; the REAL cross is between
    the block-ladder and the power-ladder: at rung k, the block's Wk and
    the power ladder's hk compose with the base/hi respectively and land
    together). DESIGN: the JoinLadder ALREADY packages exactly this —
    convert directly: a RelProd block step CompRel y W W' maps to
    JoinLadder.step with hrung := (the power ladder's own rung, supplied
    by power_tower at the capstone), hnext := the block step, and the two
    T-readings supplied. The converter is therefore a FOLD over the block
    with a per-rung supply — banked here in supply form: -/
theorem block_to_joinLadder {y m : BQF}
    (supply : ∀ {k : Re} {h W W' : BQF},
      JoinLadder y m k h W → CompRel y W W' →
      ∃ (h' T : BQF), CompRel y h h' ∧ CompRel h' m W' ∧
        CompRel h' m T ∧ CompRel y W T) :
    ∀ {n : Re} {h : BQF}, RelProd (constList y (Re.step n)) m h →
    ∃ (hn : BQF), JoinLadder y m (Re.step n) hn h := by
  intro n
  induction n with
  | void =>
      intro h hrel
      cases hrel with
      | cons hp hc =>
          cases hp with
          | nil =>
              -- one y on base m: JoinLadder.base with h-chain refl needs
              -- Chain y y ✓ and CompRel y m h ✓
              exact ⟨y, JoinLadder.base (Chain.refl y) hc⟩
  | step k ih =>
      intro h hrel
      cases hrel with
      | cons hp hc =>
          -- hp : RelProd (constList y (step k)) m W; hc : CompRel y W h
          obtain ⟨hk, hlad⟩ := ih hp
          obtain ⟨h', T, hrung, hnext, hT1, hT2⟩ := supply hlad hc
          exact ⟨h', JoinLadder.step hlad hrung hnext hT1 hT2⟩


/-- The w-ladder supply: composition with w is total on the powers
    reached (capstone discharge: power_step_total + class transport). -/
def WLadder (w : BQF) : Prop :=
  ∀ {k : Re} {W : BQF}, PowRel w k W → ∃ W', CompRel w W W'

/-- ★ Given the ladder supply, every count ≥ 1 has a w-power. -/
theorem wpow_exists {w : BQF} (hlad : WLadder w) :
    ∀ k : Re, ∃ W, PowRel w (Re.step k) W := by
  intro k
  induction k with
  | void => exact ⟨w, PowRel.one (Chain.refl w)⟩
  | step k ih =>
      obtain ⟨W, hW⟩ := ih
      obtain ⟨W', hW'⟩ := hlad hW
      exact ⟨W', PowRel.succ hW hW'⟩

/-- The join linkage supply: at every w-power rung W (a q·?-power of y),
    a fused JoinLadder of q y-rungs onto W exists, landing exactly the
    next w-composite. (Capstone: N606's JoinLadder built by the
    compRel_total climb; the landing agreement via functionality.) -/
def JoinLink (y w : BQF) (q : Re) : Prop :=
  ∀ {W W' : BQF}, CompRel w W W' →
    ∀ {j : Re}, PowRel y j W →
    ∃ (V : BQF), JoinLadder y W q w V ∧ Chain V W'

/-- ★★ THE BLOCK READING: with the ladder + linkage supplies, the p-count
    block target carries BOTH indices — PowRel w (step p') Y (the PPow
    witness) and PowRel y (q + (q * step p'))-unrolled... delivered in
    the additive form the fold consumes: Y is a y-power at SOME index and
    a w-power at (step p'). -/
theorem block_is_pth {y w : BQF} {q : Re}
    (hw : PowRel y (Re.step q) w)
    (hlad : WLadder w) (hlink : JoinLink y w (Re.step q)) :
    ∀ p' : Re, ∃ (Y : BQF) (j : Re),
      PowRel w (Re.step p') Y ∧ PowRel y j Y := by
  intro p'
  induction p' with
  | void =>
      exact ⟨w, Re.step q, PowRel.one (Chain.refl w), hw⟩
  | step p'' ih =>
      obtain ⟨Y, j, hwY, hyY⟩ := ih
      obtain ⟨Y', hY'⟩ := hlad hwY
      obtain ⟨V, hVlad, hVY'⟩ := hlink hY' hyY
      have hjoin : PowRel y (Re.step q + j) V := pow_join hyY hVlad
      have hY'pow : PowRel y (Re.step q + j) Y' := powRel_congr hjoin hVY'
      exact ⟨Y', Re.step q + j, PowRel.succ hwY hY', hY'pow⟩


/-- ★★ SLACK ABSORPTION: a p-th-power factor of the capturing composite
    merges into the slack — x stays captured by the co-factor. Supplied:
    the merged slack composite and its p-th-power witness. -/
theorem captured_absorb {p : Re} {x h h' Y : BQF}
    (hcap : CapturedBy p x h)
    -- h reads as Y∘h' (the block landed on the co-factor):
    (hread : CompRel Y h' h)
    -- the merged slack: P2∘Y's composite Q, a p-th power, with the
    -- landing agreement L2' ~ R (both h'∘Q-ish readings):
    (hmerge : ∀ {P2 R : BQF}, PPow p P2 → CompRel h P2 R →
      ∃ (Q R' : BQF), PPow p Q ∧ CompRel h' Q R' ∧ Chain R' R) :
    CapturedBy p x h' := by
  obtain ⟨P1, P2, L, R, hP1, hP2, hxL, hhR, hLR⟩ := hcap
  obtain ⟨Q, R', hQ, hh'R', hR'R⟩ := hmerge hP2 hhR
  exact ⟨P1, Q, L, R', hP1, hQ, hxL, hh'R',
    chainTrans hLR (chainSymm hR'R)⟩

/-- The block-landing bridge (supplied form, INDEX-EXACT): a constList-y
    RelProd of count c on base m lands as the c-power composed onto m. -/
def BlockLands : Prop :=
  ∀ {y m h : BQF} {n : Re},
    RelProd (constList y (Re.step n)) m h →
    ∃ Y : BQF, PowRel y (Re.step n) Y ∧ CompRel Y m h

/-- A present member has positive count. -/
theorem countOcc_pos_of_mem {y : BQF} : ∀ {l : List BQF}, y ∈ l →
    countOcc y l ≠ Re.void := by
  intro l
  induction l with
  | nil => intro h; exact absurd h (List.not_mem_nil)
  | cons z zs ih =>
      intro hmem hcnt
      by_cases hz : z = y
      · rw [countOcc, if_pos hz] at hcnt
        exact Re.step_ne_void _ hcnt
      · rw [countOcc, if_neg hz] at hcnt
        have hy : y ∈ zs := by
          rcases List.mem_cons.mp hmem with rfl | h2
          · exact absurd rfl hz
          · exact h2
        exact ih hy hcnt

/-- ★★ THE FOLDSTEP DISCHARGE SHAPE: split + block reading + absorption
    compose into the FoldStep contract — with the block's p-th-power
    reading and the slack merge as the two remaining supplies. -/
theorem foldStep_shape {p : Re}
    (hbridge : BlockLands)
    -- the p-th-power reading of the y-block when p ∣ count:
    (hpth : ∀ {y Y : BQF} {j : Re}, PowRel y (Re.step j) Y →
      (∃ q : Re, Re.step j = p * q) →
      PPow p Y)
    -- the slack merge (captured_absorb's supply, universally):
    (hmerge : ∀ {h h' Y P2 R : BQF}, CompRel Y h' h → PPow p P2 →
      CompRel h P2 R →
      ∃ (Q R' : BQF), PPow p Q ∧ CompRel h' Q R' ∧ Chain R' R) :
    ∀ {x y : BQF} {sel : List BQF} {h : BQF},
    ProdRel sel h → CapturedBy p x h → y ∈ sel →
    (∃ q : Re, countOcc y sel = p * q) →
    -- the fold output on the REORGANIZED selection (the oracle loop runs
    -- extract_all first, so the reorganized form is what arrives):
    ∀ {h₀ : BQF},
    ProdRel (constList y (countOcc y sel) ++ removeAll y sel) h₀ →
    Chain h h₀ →
    ∃ h' : BQF, ProdRel (removeAll y sel) h' ∧ CapturedBy p x h' := by
  intro x y sel h hp hcap hymem hdvd h₀ hp₀ hch₀
  -- transport the capture along the reorganization
  have hcap₀ : CapturedBy p x h₀ := by
    obtain ⟨P1, P2, L, R, hP1, hP2, hxL, hhR, hLR⟩ := hcap
    have hhR₀ : CompRel h₀ P2 R :=
      compRel_congr hch₀ (Chain.refl _) (Chain.refl _) hhR
    exact ⟨P1, P2, L, R, hP1, hP2, hxL, hhR₀, hLR⟩
  -- the count is positive (y ∈ sel) — expose the step shape
  obtain ⟨q, hq⟩ := hdvd
  -- split at the seam
  obtain ⟨m, hrest, hblock⟩ := prodRel_append hp₀
  -- degenerate: count = void would contradict y ∈ sel; get the step form
  cases hcnt : countOcc y sel with
  | void => exact absurd hcnt (countOcc_pos_of_mem hymem)
  | step n =>
      -- the block lands: h₀ ~ Y∘m with Y a y-power of count (step n)
      rw [hcnt] at hblock
      obtain ⟨Y, hYpow, hYm⟩ := hbridge hblock
      -- index-exact: Y is the (step n)-power; p ∣ (step n) via hq/hcnt
      have hYpth : PPow p Y := hpth hYpow ⟨q, by rw [← hcnt, hq]⟩
      -- absorb
      have hcap' : CapturedBy p x m :=
        captured_absorb hcap₀ hYm (fun {P2 R} hP2 hhR =>
          hmerge hYm hP2 hhR)
      exact ⟨m, hrest, hcap'⟩


/-- ★ THE LANDING PROJECTION: the fused ladder's last rung IS the
    composite of its power onto the base. -/
theorem joinLadder_landing {y m : BQF} {j : Re} {h W : BQF}
    (t : JoinLadder y m j h W) : CompRel h m W := by
  cases t with
  | base hch hc => exact hc
  | step prev hrung hnext hT1 hT2 => exact hnext

/-- ★★ BLOCKLANDS, DISCHARGED (cross-supply relative): the y-block of
    count (step n) on base m lands as the EXACT (step n)-power of y
    composed onto m. -/
theorem blockLands_of {y m : BQF}
    (supply : ∀ {k : Re} {h W W' : BQF},
      JoinLadder y m k h W → CompRel y W W' →
      ∃ (h' T : BQF), CompRel y h h' ∧ CompRel h' m W' ∧
        CompRel h' m T ∧ CompRel y W T) :
    ∀ {n : Re} {h : BQF}, RelProd (constList y (Re.step n)) m h →
    ∃ Y : BQF, PowRel y (Re.step n) Y ∧ CompRel Y m h := by
  intro n h hrel
  obtain ⟨hn, hlad⟩ := block_to_joinLadder supply hrel
  exact ⟨hn, joinLadder_pow hlad, joinLadder_landing hlad⟩


/-- ★★ CAPTURE LIFTS OVER POWERS (supply-relative): aligned c-th powers
    of a captured pair stay captured — the raised capture equation, with
    the raised slacks' p-th-power witnesses supplied. -/
theorem captured_pow {p c : Re} {y hy Y HY : BQF}
    (hcap : CapturedBy p y hy)
    (hYpow : PowRel y c Y) (hHYpow : PowRel hy c HY)
    -- the raised landings: L^c, R^c with their towers, and the raised
    -- slacks' p-th-power data (capstone: RaiseTower + dist_tower_eq):
    (hraise : ∀ {P1 P2 L R : BQF}, PPow p P1 → PPow p P2 →
      CompRel y P1 L → CompRel hy P2 R → Chain L R →
      ∃ (P1' P2' L' R' : BQF), PPow p P1' ∧ PPow p P2' ∧
        CompRel Y P1' L' ∧ CompRel HY P2' R' ∧ Chain L' R') :
    CapturedBy p Y HY := by
  obtain ⟨P1, P2, L, R, hP1, hP2, hyL, hhyR, hLR⟩ := hcap
  obtain ⟨P1', P2', L', R', hP1', hP2', hYL', hHYR', hLR'⟩ :=
    hraise hP1 hP2 hyL hhyR hLR
  exact ⟨P1', P2', L', R', hP1', hP2', hYL', hHYR', hLR'⟩

/-- ★★ THE SUBSTITUTION SHAPE: z captured through a selection using y +
    y captured over A ⟹ z captured over (A-power-block ++ y-free rest) —
    with the three supplies threaded (BlockLands on both blocks, the
    power-capture raise, and the final absorption/merge). The NEW
    selection's membership contract: every member is in (sel ∖ y) or...
    the A-block members: the contract exposes the A-power-block as
    REPEATED A — constList-encoded: sel'' := constList-hA-shape is NOT
    member-transparent. HONEST CONTRACT (matches SubstEngine): the
    substituted selection is (A-repeats ++ removeAll y sel), delivered
    via List.append membership. A-repeats := A ++ A ++ ... — flattened
    replicate. Members of A-repeats ∈ A ✓. -/
def AReps (A : List BQF) : Re → List BQF
  | .void => []
  | .step n => A ++ AReps A n

theorem aReps_mem {A : List BQF} {s : BQF} : ∀ {n : Re},
    s ∈ AReps A n → s ∈ A := by
  intro n
  induction n with
  | void =>
      intro h
      exact absurd h (List.not_mem_nil)
  | step k ih =>
      intro h
      rcases List.mem_append.mp h with h1 | h2
      · exact h1
      · exact ih h2

/-- ★★ SUBSTENGINE's LIST SHAPE: given the block split of z's selection,
    the capture-power lift, and the product/merge welds (supplied), the
    substituted capture lands on AReps ++ y-free rest — membership
    exactly as SubstEngine demands. -/
theorem subst_shape {p : Re} {z y : BQF} {sel A : List BQF} {h hy : BQF}
    (hpz : ProdRel sel h) (hcz : CapturedBy p z h)
    (hpA : ProdRel A hy) (hcA : CapturedBy p y hy)
    -- the supplied end-to-end weld (block split + power lift + merge),
    -- packaged as: a product over (AReps A c ++ removeAll y sel) exists
    -- that captures z (c := countOcc y sel):
    (hweld : ∃ (h'' : BQF),
      ProdRel (AReps A (countOcc y sel) ++ removeAll y sel) h'' ∧
      CapturedBy p z h'') :
    ∃ (sel'' : List BQF) (h'' : BQF),
      (∀ s ∈ sel'', (s ∈ sel ∧ s ≠ y) ∨ s ∈ A) ∧
      ProdRel sel'' h'' ∧ CapturedBy p z h'' := by
  obtain ⟨h'', hp'', hc''⟩ := hweld
  refine ⟨AReps A (countOcc y sel) ++ removeAll y sel, h'', ?_, hp'', hc''⟩
  intro s hs
  rcases List.mem_append.mp hs with h1 | h2
  · exact Or.inr (aReps_mem h1)
  · obtain ⟨hmem, hne⟩ := removeAll_sub h2
    exact Or.inl ⟨hmem, hne⟩


#print axioms oracle_assembled
#print axioms assemble_contract
#print axioms all_coprime_fold
#print axioms blockLands_of
#print axioms foldStep_shape
#print axioms subst_shape
#print axioms captured_pow
#print axioms block_is_pth

end BQF
end GaussForms
end Phys.Foundation
