/-
  Audits.AxiomAudit — foundations-only trust-base audit (docs/STANDARD.md §1.2).
  ===========================================================================
  `#print axioms` over EVERY banked production theorem. The gate (D6) parses this
  output and FAILS if any line shows an axiom outside the foundational trio
  {propext, Classical.choice, Quot.sound}. No theorem may rest on a posited
  assumption — the project's only posit is the fold, and it is a DEFINITION.
-/
import Phys.Foundation.Fold
import Phys.Foundation.Counting
import Phys.Foundation.CountingArith
import Phys.Foundation.IntegerTower
import Phys.Foundation.RationalTower
import Phys.Cascade.ComplexUnit
import Phys.Cascade.Double
import Phys.Cascade.Quaternion
import Phys.Cascade.Octonion
import Phys.Cascade.Sedenion
import Phys.Cascade.ForcedStop
import Phys.Algebra.Operator
import Phys.Algebra.GeneratedModule
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Phys.Algebra.Derivation
import Phys.Algebra.DerivationDim
import Phys.Algebra.DerivationSkew
import Phys.Algebra.DerivationTraceFree
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationLowerBound
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationBracket
import Phys.Algebra.DerivationStructureConstants
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationPerfect
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationIrreducibleFull
import Phys.Algebra.DerivationSimple
import Phys.Algebra.HermitianJordan.Setup
import Phys.Algebra.HermitianJordan.Helpers
import Phys.Algebra.HermitianJordan.CompCentral
import Phys.Algebra.HermitianJordan.Linear
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.HermitianJordan.Building
import Phys.Algebra.HermitianJordan.Building2
import Phys.Algebra.HermitianJordan.Building3
import Phys.Algebra.HermitianJordan.Core
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.PieceA
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PieceBdeg1
import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Foundation.DerivedSqrtTwo
import Phys.Foundation.ContinuumDerived
import Phys.Foundation.ContinuumField
import Phys.Foundation.ContinuumFieldMul
import Phys.Foundation.ContinuumFieldRing
import Phys.Foundation.ContinuumFieldInverse
import Phys.Foundation.ContinuumCCLO
import Phys.Algebra.DerivationSimpleStructure
import Phys.Algebra.DerivationSemisimpleModule
import Phys.Algebra.DerivationSimpleCollapse
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.DerivationAutCompact
import Phys.Foundation.ContinuumTopology
import Phys.Algebra.DerivationAutCompactTopo
import Phys.Foundation.ContinuumArchimedean
import Phys.Foundation.ContinuumUniform
import Phys.Foundation.ContinuumComplete
import Phys.Foundation.ContinuumSummable
import Phys.Foundation.ContinuumScalarDeriv
import Phys.Algebra.DerivationAutOpNorm
import Phys.Algebra.DerivationAutExp
import Phys.Algebra.DerivationAutExpHom
import Phys.Algebra.DerivationLeibnizPow
import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationOExp
import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationOProductPreserving
import Phys.Algebra.DerivationOAutomorphism
import Phys.Algebra.DerivationOTangent
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.DerivationStabilizerSplit
import Phys.Algebra.SpacetimeSignature
import Phys.Algebra.ChiralityBlock
import Phys.Algebra.LorentzIsometry
import Phys.Algebra.SpinorCover
import Phys.Algebra.SpinorRotation
import Phys.Algebra.SpinorCoverGroup
import Phys.Algebra.LorentzContinuum
import Phys.Algebra.LorentzContinuumRotation
import Phys.Algebra.LorentzContinuumLieAlgebra
import Phys.Algebra.LorentzContinuumExpIntegration
import Phys.Algebra.LorentzContinuumRotationSubgroup
import Phys.Algebra.LorentzContinuumGeneratedGroup
import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.LorentzContinuumPolar
import Phys.Algebra.LorentzContinuumSqrt
import Phys.Algebra.LorentzContinuumCartan
import Phys.Algebra.LorentzContinuumAdjoint
import Phys.Algebra.LorentzContinuumOpSqrt
import Phys.Algebra.LorentzContinuumOpSqrtBlock
import Phys.Algebra.LorentzContinuumOpSqrtCoord
import Phys.Algebra.LorentzContinuumEigenProj
import Phys.Algebra.LorentzContinuumEigenBasis
import Phys.Algebra.LorentzContinuumEigenBasisGen
import Phys.Algebra.LorentzContinuumPolarKAK
import Phys.Algebra.LorentzContinuumSpectralMix
import Phys.Algebra.LorentzContinuumSpectralN
import Phys.Algebra.LorentzContinuumSpectralExist
import Phys.Algebra.LorentzContinuumDeflation
import Phys.Algebra.LorentzContinuumEigenExtract
import Phys.Algebra.LorentzContinuumOctSeedExtract
import Phys.Algebra.LorentzContinuumDeflateInduct
import Phys.Algebra.LorentzContinuumDescentIter
import Phys.Algebra.LorentzContinuumSeedCubic
import Phys.Algebra.LorentzContinuumSeedVector
import Phys.Algebra.LorentzContinuumRealClosed
import Phys.Algebra.LorentzContinuumEvenSeed
import Phys.Algebra.LorentzContinuumReseed
import Phys.Algebra.LorentzContinuumFactor
import Phys.Algebra.LorentzContinuumAdjoinI
import Phys.Algebra.LorentzContinuumAlgClosure
import Phys.Algebra.LorentzContinuumRealFactor
import Phys.Algebra.LorentzContinuumSubSeed
import Phys.Algebra.LorentzContinuumSpectralExistFull
import Phys.Algebra.LorentzContinuumPolarPositive
import Phys.Algebra.LorentzContinuumResolutionId
import Phys.Algebra.LorentzContinuumGGFamilyInverse
import Phys.Algebra.LorentzContinuumCompactPart
import Phys.Algebra.LorentzContinuumMetricCondition
import Phys.Algebra.LorentzContinuumIsomMetricChar
import Phys.Algebra.LorentzContinuumOpSqrtJConj
import Phys.Algebra.LorentzContinuumOpSqrtScalarUnique
import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.LorentzContinuumSpectralPath
import Phys.Algebra.LorentzContinuumReverseSurj
import Phys.Algebra.LorentzContinuumSpin9DistinctPlane
import Phys.Algebra.LorentzContinuumEndBridge
import Phys.Algebra.LorentzContinuumGeneration
import Phys.Algebra.LorentzContinuumGenerationConverse
import Phys.Algebra.LorentzContinuumGenerationConverseCompact
import Phys.Algebra.LorentzContinuumGenerationConverseCompactWord
import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal
import Phys.Algebra.LorentzContinuumGenerationWordMembershipObstruction
import Phys.Algebra.LorentzContinuumGenerationEnlargedAlphabet
import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle
import Phys.Algebra.LorentzContinuumGenerationOctonionBlockSO8
import Phys.Algebra.LorentzContinuumGenerationOctonionBlockTriple
import Phys.Algebra.LorentzContinuumGenerationOctonionBlockQuad
import Phys.Algebra.LorentzContinuumGenerationSO8RankInduction
import Phys.Algebra.LorentzContinuumGenerationKAK
import Phys.Algebra.LorentzContinuumGenerationNinthFamily
import Phys.Algebra.LorentzContinuumGenerationFullSO9Assembly
import Phys.Algebra.LorentzContinuumGenerationDeflationStep
import Phys.Algebra.LorentzContinuumGenerationExhaustionAssembly
import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation
import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionInvolution
import Phys.Algebra.LorentzContinuumGenerationSO8RankDropRestriction
import Phys.Algebra.LorentzContinuumGenerationSO8BoundedExhaustion
import Phys.Algebra.LorentzContinuumGenerationSO8SubspaceReflection
import Phys.Algebra.LorentzContinuumGenerationSO8FinrankTower
import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion
import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle
import Phys.Algebra.LorentzContinuumGenerationIndefiniteHouseholder
import Phys.Algebra.LorentzContinuumGenerationNullPeel
import Phys.Algebra.LorentzContinuumGenerationIndefiniteExhaustion
import Phys.Algebra.LorentzContinuumGenerationTotallyIsotropic
import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumGenerationConversePolar
import Phys.Algebra.LorentzContinuumGenerationCompactFactorOrthogonal
import Phys.Algebra.LorentzContinuumGenerationReverseSurjectivity
import Phys.Algebra.LorentzContinuumCliffordSpinCover
import Phys.Algebra.LorentzContinuumCliffordCoverHom
import Phys.Algebra.LorentzContinuumCliffordCoverHomGlobal
import Phys.Algebra.LorentzContinuumCliffordCoverKernel
import Phys.Algebra.LorentzContinuumOctStabilizerGauge
import Phys.Algebra.LorentzContinuumOctStabilizerG2
import Phys.Algebra.LorentzContinuumOctStabilizerG2Nontrivial
import Phys.Algebra.LorentzContinuumOctStabilizerG2SecondAut
import Phys.Algebra.LorentzContinuumOctStabilizerG2KleinFour
import Phys.Algebra.LorentzContinuumCliffordSpinEven
import Phys.Algebra.LorentzContinuumCliffordSpinGroup
import Phys.Algebra.LorentzContinuumCliffordSpinHom
import Phys.Algebra.LorentzContinuumCliffordPinGroup
import Phys.Algebra.LorentzContinuumCliffordPinKernel
import Phys.Algebra.LorentzContinuumCliffordPinExactKernel
import Phys.Algebra.LorentzContinuumCliffordPinCentralizer
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Phys.Algebra.LorentzContinuumCliffordPinExactKernelComplete
import Phys.Algebra.LorentzContinuumCliffordPinSurjective
import Phys.Algebra.LorentzContinuumOperatorTopology
import Phys.Algebra.LorentzContinuumRotationPathConnected
import Phys.Algebra.LorentzContinuumPathConnectedFull
import Phys.Algebra.LorentzContinuumCompactPathConnected
import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath
import Phys.Algebra.LorentzContinuumGivensWordExhaustion
import Phys.Algebra.LorentzContinuumGenuineSO9Peel
import Phys.Algebra.LorentzContinuumOctBlockSO8Word
import Phys.Algebra.LorentzContinuumOctBlockSO8Exhaustion
import Phys.Algebra.LorentzContinuumOctBlockSO8ClosureWord
import Phys.Algebra.LorentzContinuumOctBlockSO8DetParity
import Phys.Algebra.LorentzContinuumSO9CompactAssembly
import Phys.Algebra.LorentzContinuumBoostPolarFactor
import Phys.Algebra.LorentzContinuumSO9FullAssembly
import Phys.Algebra.LorentzContinuumPositivePartDissolution
import Phys.Algebra.LorentzContinuumPositivePartReciprocal
import Phys.Algebra.LorentzContinuumGeneralAxisBoostPath
import Phys.Algebra.LorentzContinuumBoostPeel
import Phys.Algebra.LorentzContinuumTimeFixingResidualSO9
import Phys.Algebra.LorentzContinuumSO9DetReduction
import Phys.Algebra.LorentzContinuumSO9UnconditionalClosure
import Phys.Algebra.LorentzContinuumFullO19
import Phys.Foundation.ContinuumExp
import Phys.Foundation.ContinuumLog
import Phys.Algebra.LorentzContinuumSpectralPow
import Phys.Algebra.DerivationOFlow
import Phys.Algebra.LorentzContinuumKleinFourGroupObject
import Phys.Algebra.LorentzContinuumO19ComponentGroupObject
import Phys.Algebra.DerivationOCommutingFlow
import Phys.Algebra.DerivationOAdjointFlow
import Phys.Foundation.ContinuumScalarDeriv2
import Phys.Foundation.ContinuumTrig
import Phys.Foundation.ContinuumTrigAdd
import Phys.Foundation.ContinuumTrigPi
import Phys.Algebra.DerivationOTangent2
import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationHDim
import Phys.Algebra.DerivationDblPhase
import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationDblIntoH
import Phys.Algebra.DerivationRep7IsospinBranching
import Phys.Algebra.DerivationRep7FullBranching
import Phys.Algebra.DerivationSO4TwoSU2
import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationRep7IrreducibleBimodule
import Phys.Algebra.DerivationRep7IrreducibleAdjoint
import Phys.Algebra.DerivationRep7IsotypicSchur
import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.SpacetimeSignatureInertia
import Phys.Algebra.SpacetimeLightCone
import Phys.Algebra.SedenionAlternativityLoss
import Phys.Algebra.DerivationColourCentralizer
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.DerivationColourIsospinTraceForm
import Phys.Algebra.OctonionCommutatorJacobiator
import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionCoassociative4Form
import Phys.Algebra.OctonionCrossGramContraction
import Phys.Algebra.OctonionJordanFrameWeight
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanInvariantTower
import Phys.Algebra.OctonionJordanSharpPolar
import Phys.Algebra.TowerGatherCoherence
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.TowerGatherCocycle
import Phys.Algebra.TowerGatherObstructionInvariant
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.TowerGatherObstructionAdjointSo7
import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.TowerGatherObstructionComplementSo7
import Phys.Algebra.TowerGatherProjectionG2Equivariant
import Phys.Algebra.TowerGatherSymAntisymDecomp
import Phys.Algebra.TowerGatherTracelessSym27
import Phys.Algebra.TowerGatherEndProjectionSo7
import Phys.Algebra.TowerGatherDualProjectionSym27
import Phys.Algebra.TowerGatherAmbientProjection7And14
import Phys.Algebra.TowerGatherAmbientProjection1And27
import Phys.Algebra.TowerGatherCanonicalDirectSum
import Phys.Algebra.TowerGatherInvariantFormsG2
import Phys.Algebra.TowerGatherFFTCommutantG2
import Phys.Algebra.TowerGatherFFTPeirceReduction
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Phys.Algebra.TowerGatherIrreducible27
import Phys.Algebra.TowerGatherForcedChargeDirection
import Phys.Algebra.TowerGatherForcedChargeSplitting
import Phys.Algebra.TowerGatherForcedChargeEigenvalues
import Phys.Algebra.TowerGatherForcedChargeSpectrum
import Phys.Algebra.TowerGatherForcedChargeEigenspace
import Phys.Algebra.TowerGatherForcedColourChargeCommute
import Phys.Algebra.TowerGatherForcedChargeColourComplementary
import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.TowerGatherInducedColourRep
import Phys.Algebra.TowerGatherFaithfulColourRep
import Phys.Algebra.TowerGatherImageColourSubalgebra
import Phys.Algebra.TowerGatherColourChargeOneCause
import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.TowerGatherChargeIsospinRatio
import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Phys.Algebra.TowerGatherIsometry
import Phys.Algebra.TowerGatherElectroweakReductiveLie
import Phys.Algebra.TowerGatherSharedIsospinCartan
import Phys.Algebra.TowerGatherGenerateSo7
import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Algebra.TowerWorldMapSpinGenerators
import Phys.Algebra.TowerWorldMapVectorSpinorSo7
import Phys.Algebra.TowerWorldMapChirality
import Phys.Algebra.TowerWorldMapIndivisible
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.OctonionJordanGaugeSpectrumInvariant
import Phys.Algebra.OctonionJordanFormallyReal
import Phys.Algebra.OctonionMatterJointNeutralCore
import Phys.Algebra.OctonionJordanGenerationCoupling
import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanInnerMultiplication
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Phys.Algebra.TowerGatherIsospinMultiplet
import Phys.Algebra.TowerGatherHyperchargeDoublingIntertwiner
import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Phys.Algebra.TowerWorldMapWeakDoubletTwoHandedSO4
import Phys.Algebra.TowerWorldMapFoldRootNeutralTorus
import Phys.Algebra.OctonionJordanDerivationAlgebra
import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanFamilyRotationGenerators
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Phys.Algebra.OctonionJordanFamilyInvariantCore
import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanColourCentralizerCoset
import Phys.Algebra.OctonionJordanColourCentralizerCosetClosure
import Phys.Algebra.OctonionJordanColourFlavourCommutingPair
import Phys.Algebra.OctonionJordanSpectrumMovingSector
import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Phys.Algebra.OctonionJordanSpectrumMovingSectorGrading
import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionJordanHermTraceCommutator
import Phys.Algebra.OctonionJordanHermTraceCoefficient
import Phys.Algebra.OctonionJordanFamilyMassMixingOrbit
import Phys.Algebra.OctonionJordanCubicIsospectral
import Phys.Algebra.OctonionJordanFamilyMixingComplexification
import Phys.Algebra.OctonionJordanGenerationCharges
import Phys.Algebra.OctonionJordanGenerationCycleBornSplit
import Phys.Algebra.OctonionJordanGenerationCycleForm
import Phys.Algebra.OctonionJordanGenerationKoide
import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Phys.Algebra.OctonionJordanGenerationMassRatios
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Phys.Algebra.OctonionJordanGenerationMixingFrame
import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Phys.Algebra.OctonionStructure3FormNorm
import Phys.Algebra.InteractionChannelTower
import Phys.Algebra.BornIsometryCompleteness
import Phys.Algebra.FineStructureScaleCoupling
import Phys.Algebra.ChiralGenerationChargeTrace
import Phys.Algebra.ChiralGenerationIsospinTrace
import Phys.Algebra.OneCouplingCoherence
import Phys.Algebra.DimensionalTransmutation

-- N1 — THE FOLD (self-look-back) and its first forced property.
#print axioms Phys.Foundation.IsFold
#print axioms Phys.Foundation.fold_eq_neg
#print axioms Phys.Foundation.fold_unique
#print axioms Phys.Foundation.fold_void
#print axioms Phys.Foundation.fold_involutive
#print axioms Phys.Foundation.fold_self_blind
#print axioms Phys.Foundation.neg_isFold
#print axioms fold_char2_has_nonzero_fixed
#print axioms fold_nonzero_not_fixed

-- N7 — ℕ FROM THE FOLD (the bottom of the number tower): counting/arity as the
-- fold's own re-entry. The CONTENT ℕ derived, NO Mathlib number-system import.
-- `Re` the re-entry tower (carrier); Peano: `step_inj` (injective successor),
-- `step_ne_void` (0 not a successor), `step_ne_self` (no fixed point). The
-- universal property `iterate_unique` (Re IS the natural number object —
-- import-free certificate). `step_not_surjective` (Dedekind-infinite). The fold
-- binding: `foldOrbit_period_two` (the fold CLOSES the orbit, banked
-- fold_involutive) vs `count_transcends_fold_closure` (the count does NOT close).
#print axioms Phys.Foundation.Re
#print axioms Phys.Foundation.Re.step_inj
#print axioms Phys.Foundation.Re.step_ne_void
#print axioms Phys.Foundation.Re.step_ne_self
#print axioms Phys.Foundation.Re.iterate
#print axioms Phys.Foundation.Re.iterate_void
#print axioms Phys.Foundation.Re.iterate_step
#print axioms Phys.Foundation.Re.iterate_unique
#print axioms Phys.Foundation.Re.step_not_surjective
#print axioms Phys.Foundation.Re.foldOrbit
#print axioms Phys.Foundation.Re.foldOrbit_period_two
#print axioms Phys.Foundation.Re.count_transcends_fold_closure

-- N8 — ℤ FROM THE DERIVED ℕ (the number tower, rung 1): the additive (group) closure
-- of the derived counting `Re`. CountingArith equips the derived ℕ (`Re`) with its
-- commutative-semiring arithmetic (`Re.add`/`Re.mul` + laws + `commSemiring` +
-- `add_right_cancel` = cancellation, the property the group completion needs).
-- IntegerTower builds the CONTENT ℤ as the Grothendieck group completion `Z =
-- (Re×Re)/~`, negation = the SWAP = the fold's reflection (N1 `look x = -x`), carrying
-- a PROVED `CommRing`; the embedding `ofRe : Re ↪ Z` is an injective semiring hom, and
-- `Z` strictly extends `Re` with additive inverses (`-1` has no count preimage). NO
-- Mathlib number-system content import; the carrier is CONSTRUCTED from the derived `Re`.
-- The arithmetic of the derived ℕ (CountingArith):
#print axioms Phys.Foundation.Re.add
#print axioms Phys.Foundation.Re.mul
#print axioms Phys.Foundation.Re.add_comm
#print axioms Phys.Foundation.Re.add_assoc
#print axioms Phys.Foundation.Re.add_right_cancel
#print axioms Phys.Foundation.Re.add_left_cancel
#print axioms Phys.Foundation.Re.mul_comm
#print axioms Phys.Foundation.Re.mul_assoc
#print axioms Phys.Foundation.Re.left_distrib
#print axioms Phys.Foundation.Re.right_distrib
#print axioms Phys.Foundation.Re.commSemiring
-- The derived ℤ (IntegerTower):
#print axioms Phys.Foundation.intRel
#print axioms Phys.Foundation.intRel_trans
#print axioms Phys.Foundation.intSetoid
#print axioms Phys.Foundation.Z
#print axioms Phys.Foundation.Z.mk
#print axioms Phys.Foundation.Z.sound
#print axioms Phys.Foundation.Z.exact'
#print axioms Phys.Foundation.Z.add
#print axioms Phys.Foundation.Z.neg
#print axioms Phys.Foundation.Z.mul
#print axioms Phys.Foundation.Z.commRing
#print axioms Phys.Foundation.Z.ofRe
#print axioms Phys.Foundation.Z.ofRe_add
#print axioms Phys.Foundation.Z.ofRe_mul
#print axioms Phys.Foundation.Z.ofRe_injective
#print axioms Phys.Foundation.Z.exists_neg
#print axioms Phys.Foundation.Z.neg_one_not_ofRe
#print axioms Phys.Foundation.Z.neg_one_eq

-- N9 — ℚ FROM THE DERIVED ℤ (the number tower, rung 2): the multiplicative
-- (field-of-fractions) closure of the derived integers `Z`. RationalTower derives the
-- CONTENT ℚ as `Q = (Z × {nonzero Z})/~` (cross-multiplication), carrying a PROVED
-- `Field` whose ★ MULTIPLICATIVE INVERSE = THE SWAP (numerator ↔ denominator) = the
-- fold's reflection on the multiplicative pairs (the mirror of N8's additive swap). The
-- gating content — `Z` is an INTEGRAL DOMAIN — is DERIVED from counting's cancellation +
-- comparability (`Re.mul_cross_ne`, traced to `Re.add_right_cancel`/`step_inj`). The
-- embedding `ofZ : Z ↪ Q` is an injective ring hom, and ℚ STRICTLY extends `Z` with a
-- multiplicative inverse of 2 (`1/2` has NO count/integer preimage, by `Re` parity). NO
-- Mathlib number-system content import; the carrier is CONSTRUCTED from the derived `Z`.
-- The integral-domain content of counting (RationalTower, namespace Re):
#print axioms Phys.Foundation.Re.mul_ne_zero'
#print axioms Phys.Foundation.Re.add_comparable
#print axioms Phys.Foundation.Re.sub_exists_of_ne
#print axioms Phys.Foundation.Re.mul_cross_ne
#print axioms Phys.Foundation.Re.add_self_ne_step_add_self
-- The derived ℤ is an integral domain:
#print axioms Phys.Foundation.Z.one_ne_zero'
-- The derived ℚ (RationalTower):
#print axioms Phys.Foundation.NZ
#print axioms Phys.Foundation.ratRel
#print axioms Phys.Foundation.ratRel_trans
#print axioms Phys.Foundation.ratSetoid
#print axioms Phys.Foundation.Q
#print axioms Phys.Foundation.Q.mk
#print axioms Phys.Foundation.Q.sound
#print axioms Phys.Foundation.Q.exact'
#print axioms Phys.Foundation.Q.add
#print axioms Phys.Foundation.Q.neg
#print axioms Phys.Foundation.Q.mul
#print axioms Phys.Foundation.Q.commRing
#print axioms Phys.Foundation.Q.isField
#print axioms Phys.Foundation.Q.field
#print axioms Phys.Foundation.Q.ofZ
#print axioms Phys.Foundation.Q.ofZ_add
#print axioms Phys.Foundation.Q.ofZ_mul
#print axioms Phys.Foundation.Q.ofZ_injective
#print axioms Phys.Foundation.Q.half
#print axioms Phys.Foundation.Q.half_ne_zero
#print axioms Phys.Foundation.Q.half_mul_two
#print axioms Phys.Foundation.Q.half_not_ofZ

-- N10 — THE NUMBER TOWER'S ORDER (the ℝ rung's foundation): ≤ on the derived
-- ℕ→ℤ→ℚ, DERIVED from counting's comparability (`Re.add_comparable`), with NO
-- Mathlib Rat/Int/Nat ORDER as content. `Re.le`/`Re.linearOrder` — the order on
-- counting (the direction of re-entry; totality = banked comparability).
-- `Z.le`/`Z.linearOrder`/`Z.isStrictOrderedRing` — the derived ℤ as a strict
-- ordered ring (mul_pos from counting's no-zero-divisors). `Q.Nonneg` — the sign
-- predicate (num·den ≥ 0, well-defined because Z is an ordered domain).
-- `Q.le`/`Q.linearOrder`/`Q.isStrictOrderedRing` — ★★ the derived ℚ as a LINEARLY
-- ORDERED FIELD (with N9's Q.field), the ground the continuum is cut from.
#print axioms Phys.Foundation.Re.add_eq_zero
#print axioms Phys.Foundation.Re.linearOrder
#print axioms Phys.Foundation.Re.zero_le
#print axioms Phys.Foundation.Re.le_add_right
#print axioms Phys.Foundation.Z.linearOrder
#print axioms Phys.Foundation.Z.mul_pos
#print axioms Phys.Foundation.Z.isStrictOrderedRing
#print axioms Phys.Foundation.Q.Nonneg
#print axioms Phys.Foundation.Q.nonneg_total
#print axioms Phys.Foundation.Q.nonneg_add
#print axioms Phys.Foundation.Q.nonneg_mul
#print axioms Phys.Foundation.Q.eq_zero_of_nonneg_neg
#print axioms Phys.Foundation.Q.linearOrder
#print axioms Phys.Foundation.Q.mul_pos
#print axioms Phys.Foundation.Q.isStrictOrderedRing
#print axioms Phys.Foundation.Q.zero_lt_one'

-- N2 rung 1 — THE FORCED COMPLEX UNIT (first rung of the cascade).
-- Notion + obstruction (scalar / ordered line).
#print axioms Phys.Cascade.IsFoldRoot
#print axioms Phys.Cascade.isFoldRoot_iff
#print axioms Phys.Cascade.scalar_isFoldRoot_iff
#print axioms Phys.Cascade.sqrt_fold_not_on_line
#print axioms Phys.Cascade.no_scalar_foldRoot_on_line
#print axioms Phys.Cascade.sqrt_fold_on_unordered_line
#print axioms Phys.Cascade.obstruction_nonvacuous
-- Obstruction (the why-double law: even dimension forced).
#print axioms Phys.Cascade.isFoldRoot_linearMap_iff
#print axioms Phys.Cascade.foldRoot_forces_even_dim
#print axioms Phys.Cascade.no_foldRoot_dim1
#print axioms Phys.Cascade.no_foldRoot_dim1_of_evenLaw
-- Resolution (operator witness at dim 2).
#print axioms Phys.Cascade.J₂
#print axioms Phys.Cascade.J₂_isFoldRoot
#print axioms Phys.Cascade.J₂_self_blind
-- Resolution (the forced complex algebra + derived unit).
#print axioms Phys.Cascade.Dbl.J_mul_J
#print axioms Phys.Cascade.Dbl.mulJ_isFoldRoot
#print axioms Phys.Cascade.Dbl.J_self_blind
#print axioms Phys.Cascade.Dbl.decomp
#print axioms Phys.Cascade.Dbl.ι_injective
#print axioms Phys.Cascade.Dbl.J_not_scalar
#print axioms Phys.Cascade.Dbl.mul_forced
#print axioms Phys.Cascade.Dbl.J_nonvacuous

-- N2 doubling operation — THE CAYLEY–DICKSON DOUBLE (the cascade's one operation).
#print axioms Phys.Cascade.CD.iota_injective
#print axioms Phys.Cascade.CD.iota_e2_comm_iff

-- N2 rung 2 — DOUBLING THE COMPLEX ALGEBRA LOSES COMMUTATIVITY (ℍ).
#print axioms Phys.Cascade.Dbl.star_J
#print axioms Phys.Cascade.Dbl.J_ne_star_J
#print axioms Phys.Cascade.H_associative
#print axioms Phys.Cascade.commutativity_cause
#print axioms Phys.Cascade.not_commutative_witness
#print axioms Phys.Cascade.not_commutative
#print axioms Phys.Cascade.comm_products

-- N2 doubling operation — THE ONE CAUSE of the stop of associativity.
#print axioms Phys.Cascade.CD.iota_iota_e2_assoc_iff

-- N2c rung 3 — DOUBLING THE NON-COMMUTATIVE ALGEBRA LOSES ASSOCIATIVITY (𝕆).
#print axioms Phys.Cascade.assoc_triple_iff
#print axioms Phys.Cascade.not_associative_witness
#print axioms Phys.Cascade.not_associative
#print axioms Phys.Cascade.associativity_cause

-- N2c THE PROVED STOP — doubling past 𝕆 loses composition/Born + division (S).
#print axioms Phys.Cascade.zero_divisor_prod
#print axioms Phys.Cascade.zdX_ne_zero
#print axioms Phys.Cascade.zdY_ne_zero
#print axioms Phys.Cascade.has_zero_divisor
#print axioms Phys.Cascade.N_zero
#print axioms Phys.Cascade.N_zdX
#print axioms Phys.Cascade.N_zdY
#print axioms Phys.Cascade.born_law_fails
#print axioms Phys.Cascade.zero_divisor_breaks_composition

-- N2d THE FORCED STOP (generic) — the generic self-overlap norm, the easy direction,
-- and the generic norm's loss at the stop.
#print axioms Phys.Cascade.CD.Nrm
#print axioms Phys.Cascade.CD.Nrm_def
#print axioms Phys.Cascade.CD.selfMul
#print axioms Phys.Cascade.CD.Nrm_one
#print axioms Phys.Cascade.CD.Nrm_iota
#print axioms Phys.Cascade.CD.Nrm_mul_of_comm
#print axioms Phys.Cascade.N_eq_proj
#print axioms Phys.Cascade.Nrm_zd_prod
#print axioms Phys.Cascade.Nrm_prod_proj
#print axioms Phys.Cascade.genNrm_not_mul_at_S

-- N2d-hard THE FORCED LINK (forward half) — the composition law survives the last
-- associative rung (ℍ→𝕆) and the forced-stop boundary (holds at 𝕆, dies at S).
#print axioms Phys.Cascade.CD.Nrm_mul_of_doubled_base
#print axioms Phys.Cascade.Nrm_mul_on_O
#print axioms Phys.Cascade.forced_stop_boundary

-- N2d-hard-backward (PART A) — the polarized self-overlap (Born) bilinear form and
-- the composition identities P1/P2 forced by multiplicativity (general associative base).
#print axioms Phys.Cascade.CD.add_mul'
#print axioms Phys.Cascade.CD.mul_add'
#print axioms Phys.Cascade.CD.bilin
#print axioms Phys.Cascade.CD.bilin_diag
#print axioms Phys.Cascade.CD.bilin_symm
#print axioms Phys.Cascade.CD.bilin_add_left
#print axioms Phys.Cascade.CD.bilin_add_right
#print axioms Phys.Cascade.CD.Nrm_add
#print axioms Phys.Cascade.CD.P1
#print axioms Phys.Cascade.CD.P2

-- N2d-hard-backward (PART B) — associativity of the double reflects to base
-- associativity (iota is a ring hom; the double associates on a base-image triple iff
-- the base associates).
#print axioms Phys.Cascade.CD.iota_mul
#print axioms Phys.Cascade.CD.iota_assoc_iff
#print axioms Phys.Cascade.CD.base_assoc_of_image_assoc

-- N2d-hard-backward-MIDDLE (PART C) — the scaling-law reflection: the LEFT SCALING LAW
-- (alternative/composition law in scaling form) forces base associativity, over a
-- genuinely NON-associative base (non-vacuous). Reaches the e₂-mixing content Part B
-- could not.
#print axioms Phys.Cascade.CD.scal_im_assoc
#print axioms Phys.Cascade.CD.assoc_of_scaling

-- N2d-MIDDLE-core THE POLARIZATION CORE — the FORWARD Hurwitz implication, closing the
-- forced iff. Multiplicativity of the self-overlap norm forces the LEFT SCALING LAW
-- (the clean Hurwitz chain: adjoint = centrality, P2 = multiplicativity, anisotropy =
-- Born positivity), whose reflection (Part C) forces base associativity. Assembled with
-- the banked forward half into the full forced equivalence; genNrm_not_mul_at_S recovered
-- as a corollary of the general law. The adjoint and anisotropy are DERIVED over the
-- doubled-base structure / discharged as a sum of squares — neither posited.
#print axioms Phys.Cascade.CD.mul_add_na
#print axioms Phys.Cascade.CD.Nrm_add_na
#print axioms Phys.Cascade.CD.bilin_add_left_na
#print axioms Phys.Cascade.CD.bilin_neg_left_na
#print axioms Phys.Cascade.CD.P2_na
#print axioms Phys.Cascade.CD.bilin_diag_na
#print axioms Phys.Cascade.CDcore.adjoint3
#print axioms Phys.Cascade.CDcore.Nrm_star3
#print axioms Phys.Cascade.CDcore.bilin_iotaNrm3
#print axioms Phys.Cascade.CDcore.bilin_L_zero
#print axioms Phys.Cascade.CDcore.scaling_of_H
#print axioms Phys.Cascade.CDcore.base_assoc_of_H
#print axioms Phys.Cascade.CDcore.comm_of_base_assoc
#print axioms Phys.Cascade.CDcore.Nrm_mul_iff_base_assoc
#print axioms Phys.Cascade.aniso_S2
#print axioms Phys.Cascade.Nrm_mul_iff_O_assoc
#print axioms Phys.Cascade.Nrm_not_mul_on_S

-- N3 — THE OPERATOR (CLIFFORD) STRUCTURE the terminal algebra forces (Algebra layer).
-- The terminal algebra's NON-associative product reorganizes into an ASSOCIATIVE operator
-- algebra (AddMonoid.End); the imaginary left-multiplication endomorphisms satisfy the
-- quadratic (Clifford) relation governed by the banked Born self-overlap form Nrm/bilin.
-- Derived FORWARD from the banked CD product + star (the LEFT SCALING LAW, hypothesis-free
-- on the octonion shape), never an imported Mathlib CliffordAlgebra/QuadraticForm. The form
-- is the banked bilin/Nrm, not a posited inner product.
#print axioms Phys.Algebra.scaling_law
#print axioms Phys.Algebra.iota_add
#print axioms Phys.Algebra.add_mul_na
#print axioms Phys.Algebra.L_sq_imag
#print axioms Phys.Algebra.clifford_imag
#print axioms Phys.Algebra.Lop
#print axioms Phys.Algebra.L_sq_op
#print axioms Phys.Algebra.clifford_op
#print axioms Phys.Algebra.unit_imag
#print axioms Phys.Algebra.Nrm_unit
#print axioms Phys.Algebra.iota_Nrm_unit
#print axioms Phys.Algebra.Lop_one
#print axioms Phys.Algebra.L_unit_sq
#print axioms Phys.Algebra.unit_imag'
#print axioms Phys.Algebra.bilin_units
#print axioms Phys.Algebra.units_anticommute
#print axioms Phys.Algebra.op_nonassoc

-- N4 — THE GENERATED OPERATOR ALGEBRA + the MODULE (SPINOR) structure (Algebra layer).
-- The imaginary left-multiplications generate a unital associative subring of End (the
-- operator/Clifford algebra) inside which they square to −1 and pairwise anticommute when
-- orthonormal under the banked Born self-overlap; the terminal algebra is a MODULE over it,
-- a generator acting as octonion left-multiplication. DERIVED forward from N3's Lop/clifford_op
-- + banked CD/star/bilin/Nrm, never an imported CliffordAlgebra/QuadraticForm. Concrete on the
-- terminal O ℚ at a full 7-element orthonormal imaginary basis (whole-basis square +
-- anticommutation relations) with gen genuinely non-commutative (anti-vacuity).
#print axioms Phys.Algebra.Lop_one'
#print axioms Phys.Algebra.Lop_zero
#print axioms Phys.Algebra.iota_one
#print axioms Phys.Algebra.iota_zero
#print axioms Phys.Algebra.unit_sq_op
#print axioms Phys.Algebra.ortho_anticomm_op
#print axioms Phys.Algebra.genSet
#print axioms Phys.Algebra.gen
#print axioms Phys.Algebra.Lop_mem_gen
#print axioms Phys.Algebra.genModule
#print axioms Phys.Algebra.gen_smul
#print axioms Phys.Algebra.gen_smul_Lop
#print axioms Phys.Algebra.anticomm_val_mem
#print axioms Phys.Algebra.clifford_in_gen
#print axioms Phys.Algebra.ebasis
#print axioms Phys.Algebra.ebasis_imag
#print axioms Phys.Algebra.ebasis_nrm
#print axioms Phys.Algebra.bilin_re_re
#print axioms Phys.Algebra.bilin_re_im
#print axioms Phys.Algebra.bilin_im_re
#print axioms Phys.Algebra.bilin_im_im
#print axioms Phys.Algebra.ortho_of_dot
#print axioms Phys.Algebra.ebasis_ortho
#print axioms Phys.Algebra.Lbasis_sq
#print axioms Phys.Algebra.Lbasis_anticomm
#print axioms Phys.Algebra.ebasis_mem_gen
#print axioms Phys.Algebra.gen_noncomm

-- N5 — THE HERMITIAN JORDAN TOWER AND ITS FORCED CAP (Algebra layer).
-- The self-adjoint matrices over the terminal algebra carry the symmetrized (Jordan)
-- product; the tower is CAPPED. The associative side has NO cap (special Jordan, any
-- order); the octonionic side FAILS at order 4 — and that order-4 failure is logically
-- EQUIVALENT to the non-associativity of 𝕆 (the SAME octonionic fact that stopped the
-- cascade, surfacing as a second termination — ONE CAUSE, MANY TERMINATIONS). Derived
-- FORWARD from the banked CD product + star; the witness defect is a single octonion-
-- product computation tracing to the cascade's own non-associating triple. NO Mathlib
-- JordanAlgebra/exceptional-algebra import asserting H₃(𝕆) IS the Albert algebra.
#print axioms Phys.Algebra.jordan_of_ring
#print axioms Phys.Algebra.jordan_of_assoc
#print axioms Phys.Algebra.jdef_witness
#print axioms Phys.Algebra.jordan_fails_H4
#print axioms Phys.Algebra.cap_forces_nonassoc
#print axioms Phys.Algebra.jordan_cap_iff_nonassoc
#print axioms Phys.Algebra.cap_from_cascade_stop

-- N5b — THE TERMINAL ALGEBRA'S ALTERNATIVITY (the cap's positive lever, Algebra layer).
-- The octonion shape 𝕆 = CD (CD B), though NON-associative, stays ALTERNATIVE: its
-- associator [x,y,z]=(x·y)·z−x·(y·z) is an ALTERNATING trilinear form (left/right-alt,
-- flexible, antisymmetric in each adjacent pair), and it satisfies the three Moufang
-- identities. DERIVED FORWARD from the banked CD product, never an imported Mathlib
-- alternative-/composition-algebra structure (the POSIT-vs-DERIVE moat). This is the
-- exact property the H₃ Jordan cap's positive edge (n ≤ 3) needs — the gap between
-- "alternative" (which 𝕆 keeps) and "associative" (which 𝕆 lost at the cascade stop).
-- Non-vacuous: the laws FAIL on the sedenion shape, and the associator is genuinely
-- nonzero on O ℚ (witness coordinate = 2).
#print axioms Phys.Algebra.mul_mul_left
#print axioms Phys.Algebra.mul_mul_right
#print axioms Phys.Algebra.mul_flex
#print axioms Phys.Algebra.mul_swap12
#print axioms Phys.Algebra.mul_swap23
#print axioms Phys.Algebra.moufang_left
#print axioms Phys.Algebra.moufang_right
#print axioms Phys.Algebra.moufang_mid
#print axioms Phys.Algebra.assoc
#print axioms Phys.Algebra.alt_left
#print axioms Phys.Algebra.alt_right
#print axioms Phys.Algebra.alt_flex
#print axioms Phys.Algebra.assoc_swap12
#print axioms Phys.Algebra.assoc_swap23
#print axioms Phys.Algebra.assoc_witness_coord
#print axioms Phys.Algebra.assoc_nonvanishing

-- N5b — THE HERMITIAN CARRIER (Setup): the general Hermitian 3×3 over the terminal
-- algebra O ℚ (real central diagonal `ocR`, conjugate-transpose octonion off-diagonals
-- `Hm`) on which the positive edge of the Jordan cap (n = 3) is to be assembled. The
-- carrier is the cascade's own octonion shape — no new posited algebra, no Mathlib
-- exceptional-/Jordan-algebra import (the POSIT-vs-DERIVE moat). The order-3 Jordan
-- identity itself (jdef_H3 = 0) is the heavy structural assembly childed onto the
-- chain tail; this banks the lever (Alternative) + carrier (Setup).
#print axioms Phys.Algebra.HJ.ocR
#print axioms Phys.Algebra.HJ.Hm

-- N5c — CENTRALITY OF THE REAL DIAGONAL (Helpers): the ground-ring embedding `ocR r`
-- COMMUTES and ASSOCIATES with all of O ℚ (and is self-adjoint), derived forward from the
-- banked CD product. One half of the exact relation set the entrywise Jordan-identity
-- assembly consumes — the other half being Alternative.lean's alternating-form laws. (The
-- structural numerics, workbench/N5-jordan-cap, establish that alternativity ALONE is NOT
-- sufficient; composition-centrality of the involution is also required — the classical
-- Jacobson statement. The full jdef_H3 = 0 assembly stays childed on the chain tail.)
#print axioms Phys.Algebra.HJ.ocR_comm
#print axioms Phys.Algebra.HJ.ocR_assocL
#print axioms Phys.Algebra.HJ.ocR_assocM
#print axioms Phys.Algebra.HJ.ocR_assocR
#print axioms Phys.Algebra.HJ.ocR_star

-- N5d — COMPOSITION-CENTRALITY OF THE INVOLUTION (CompCentral): the symmetric TRACE
-- `a + star a` and the NORM `a * star a` of the Cayley–Dickson involution are CENTRAL
-- (commute & associate in every position) in the octonion shape CD (CD B), the NORM
-- additionally being symmetric (`a * star a = star a * a`); plus the rank-2 Cayley–Hamilton
-- reduction `a*a + a*star a = (a + star a)*a` (degree-LOWERING). Derived forward from the
-- banked CD product, NO Mathlib composition-algebra import (the POSIT-vs-DERIVE moat). This
-- is the classical Jacobson/Schafer nuclear-involution ingredient (2) of the H₃ Jordan cap,
-- traced in-chain to N2's self-overlap norm / scaling law. (The structural numerics,
-- workbench/N5-jordan-cap, establish that the entry blocks do NOT vanish individually and
-- bridge across atom-multisets via the star→trace substitution + this CH degree-lowering,
-- so the closing route is a sequenced rewrite, NOT a flat alternating-law span. The full
-- jdef_H3 = 0 assembly stays childed on the chain tail.)
#print axioms Phys.Algebra.HJ.tr_comm
#print axioms Phys.Algebra.HJ.tr_assocL
#print axioms Phys.Algebra.HJ.tr_assocM
#print axioms Phys.Algebra.HJ.tr_assocR
#print axioms Phys.Algebra.HJ.nrm_comm
#print axioms Phys.Algebra.HJ.nrm_assocL
#print axioms Phys.Algebra.HJ.nrm_assocM
#print axioms Phys.Algebra.HJ.nrm_assocR
#print axioms Phys.Algebra.HJ.nrm_symm
#print axioms Phys.Algebra.HJ.sq_ch

-- N5e — LINEARITY OF THE JORDAN DEFECT (Linear): the symmetric Jordan bracket `jb` is
-- BIADDITIVE and the order-3 Jordan-identity defect `jdef` is ADDITIVE in its second
-- argument — pure structural matrix identities over a NonAssocRing coordinate algebra
-- (matrix distributivity + abel), no octonion-coordinate expansion. The reduction lever
-- (docs/RUNBOOK.md W1/W9): the real central diagonal of a Hermitian matrix peels off as a
-- separate centrally-vanishing summand, collapsing the cap to its zero-diagonal core.
#print axioms Phys.Algebra.HJ.jb_add_left
#print axioms Phys.Algebra.HJ.jb_add_right
#print axioms Phys.Algebra.HJ.jdef_add_right

-- N5e — THE POSITIVE-EDGE SINGLE-GENERATOR CASE (SinglePair): the FIRST proved instance
-- of the order-3 Jordan identity `jdef_H3 = 0`. The generic diagonal-entry workhorse
-- `central_diag` (over any NonAssocRing: a central `n` kills the single-generator Jordan
-- defect diagonal combination), and `jdef_single_pair` — for the zero-diagonal Hermitian
-- core carrying a SINGLE off-diagonal octonion generator, the order-3 Jordan identity
-- holds, closed by the involution's composition-centrality (banked `nrm_comm`/`nrm_assocM`/
-- `nrm_assocR`/`nrm_symm`) ALONE, NO alternativity, NO coordinate `ring`. The diagonal
-- half of the Jacobson nuclearity condition. The multi-generator entries (whose cross
-- terms require the alternating-form laws) are the heavy remainder, childed on the chain
-- tail.
#print axioms Phys.Algebra.HJ.central_diag
#print axioms Phys.Algebra.HJ.jdef_single_pair

-- N5f — THE MULTI-GENERATOR BUILDING BLOCK (Building): the heavy remainder of the order-3
-- Jordan identity. `ka` — the associator-transport lever valid over the alternative algebra
-- `CD (CD B)`: `[star x, star w, y·x] = [star x·star y, w, x]`, a small degree-3 identity
-- (NOT a brute coordinate `ring` on the full defect). `e22` — the (2,2) entry of the
-- building block `jdef (Xz a b c) (Xz p 0 0)` vanishes, closed as `2·ka(c,a,p) +
-- 2·ka(b, star a, star p)`. The building block is the single-second-generator summand of
-- the `jdef_add_right` split that reduces the general zero-diagonal core to single-generator
-- pieces (≤20 monomials/entry).
#print axioms Phys.Algebra.HJ.ka
#print axioms Phys.Algebra.HJ.e22

-- N5f — THE THREE MULTI-GENERATOR BUILDING BLOCKS (Building/Building2/Building3): the full
-- single-second-generator summands of the `jdef_add_right` split, each closed by the bounded
-- Cayley–Dickson coordinate route (≤20 octonion monomials/entry, NOT the dead brute route on
-- the full six-generator core). `bb1`/`bb2`/`bb3` — `jdef (Xz a b c) (Xz p 0 0) = 0`,
-- `jdef (Xz a b c) (Xz 0 q 0) = 0`, `jdef (Xz a b c) (Xz 0 0 r) = 0`.
#print axioms Phys.Algebra.HJ.bb1
#print axioms Phys.Algebra.HJ.bb2
#print axioms Phys.Algebra.HJ.bb3

-- N5f — THE ZERO-DIAGONAL CORE ASSEMBLY (Core): the cap's positive edge for the zero-diagonal
-- Hermitian core, ALL six off-diagonal generators present. `Xz_split` decomposes
-- `Xz p q r = Xz p 0 0 + Xz 0 q 0 + Xz 0 0 r` entrywise; `jdef_Xz_core` —
-- `jdef (Xz a b c) (Xz p q r) = 0` — assembles the three building blocks via the additive
-- split of the defect in its second argument (`jdef_add_right`). Structural reassembly only;
-- the heavy cross-terms are discharged inside the building blocks.
#print axioms Phys.Algebra.HJ.Xz_split
#print axioms Phys.Algebra.HJ.jdef_Xz_core

-- N5g — THE CENTRAL-DIAGONAL REDUCTION SPINE (Reduction): the structural levers that reduce
-- the GENERAL Hermitian pair to its zero-diagonal core. `jdef_master` — over ANY NonAssocRing,
-- the order-3 Jordan defect of `A` against a NUCLEAR matrix `E` is the COMMUTATOR `E·G − G·E`
-- with `G = A·{A,A} − {A,A}·A` (no alternativity, no coordinate expansion — the degree-3 defect
-- collapses against a nuclear argument to a single commutator). `Dg` — the real central diagonal
-- `diag(ocR eᵢ)`; `Dg_assocL/M/R` — it is NUCLEAR (associates in all three matrix positions),
-- derived entrywise from the banked `ocR_assocL/M/R` with `ocR` kept opaque (NOT the dead
-- coordinate expansion). Together: `jdef A (Dg …) = Dg·G_A − G_A·Dg`.
#print axioms Phys.Algebra.HJ.jdef_master
#print axioms Phys.Algebra.HJ.Dg
#print axioms Phys.Algebra.HJ.Dg_assocL
#print axioms Phys.Algebra.HJ.Dg_assocM
#print axioms Phys.Algebra.HJ.Dg_assocR

-- N5g — pieceA (PieceA): the CENTRAL-DIAGONAL DROP in the SECOND slot. `Gmat`/`assoc` — the
-- un-normalised cube-associator and the matrix associator; `gmat_drop_abstract` — the nuclear
-- part of a matrix drops out of its cube-associator (`Gmat (E+X) = Gmat X` for nuclear `E`,
-- because the matrix associator vanishes on any nuclear slot). `Hm_split` — `Hm = Dg + Xz`;
-- `gmat_Hm` — `Gmat (Hm) = Gmat (Xz)` (the real diagonal drops, `Dg` nuclear). `gxz_offdiag` —
-- the zero-diagonal cube-associator `Gmat (Xz)` is OFF-DIAGONAL-FREE (the single octonion
-- alternativity burden of pieceA, bounded per-entry octonion route, NOT the dead full-Hm route).
-- `diag_comm_offzero` — a central diagonal commutes with an off-diagonal-free matrix. Together:
-- `jdef_Hm_Dg` — `jdef (Hm …) (Dg …) = 0`, the order-3 Jordan defect of any general Hermitian
-- matrix against a real-diagonal Hermitian matrix vanishes, structurally (`ocR` opaque).
#print axioms Phys.Algebra.HJ.gmat_drop_abstract
#print axioms Phys.Algebra.HJ.Hm_split
#print axioms Phys.Algebra.HJ.gmat_Hm
#print axioms Phys.Algebra.HJ.gxz_offdiag
#print axioms Phys.Algebra.HJ.diag_comm_offzero
#print axioms Phys.Algebra.HJ.jdef_Hm_Dg

-- N5h — pieceB SPINE (PieceB): the FIRST-slot central-diagonal drop. `jdef_nuc_first` — over
-- ANY NonAssocRing, a NUCLEAR FIRST argument kills the entire order-3 Jordan defect
-- (`jdef E B = 0`); where a nuclear SECOND argument collapsed the defect to a commutator
-- (`jdef_master`), a nuclear FIRST argument collapses the whole cubic defect to zero. The
-- proof keeps the square `E·E` opaque (`generalize`) so the nuclearity rewrites cannot loop on
-- `E·E·E`. `jdef_Dg_Xz` — `jdef (Dg …) (Xz …) = 0`, the degree-3 (pure-diagonal) summand of
-- the first-slot drop, instantiating `jdef_nuc_first` at the nuclear real diagonal (`ocR`
-- opaque). The reusable degree-3 killer beneath the degree-1 polarization kernel.
#print axioms Phys.Algebra.HJ.jdef_nuc_first
#print axioms Phys.Algebra.HJ.jdef_Dg_Xz

-- `asw_star` — the octonion associator is PURE-IMAGINARY (star-skew): over `CD (CD B)`,
-- `assoc x y z + star (assoc x y z) = 0`. The structural lever for the `Dg`-degree-1
-- polarization kernel of the first-slot central-diagonal drop: its diagonal entries are
-- `2·([u,v,w] + star [u,v,w])` for octonion associators, hence zero. Bounded Cayley–Dickson
-- coordinate route (the `Alternative.lean` route), not a brute defect `ring`.
#print axioms Phys.Algebra.HJ.asw_star

-- N5i — pieceB POLARIZATION REDUCTION (PolarFirst): the FIRST-ARGUMENT polarization of the
-- order-3 defect. `jdef_polar_first` — over ANY NonAssocRing, the cubic-in-first-argument defect
-- of a sum splits as `jdef (D+X) Y = jdef X Y + jdef D Y + polarCross D X Y`, a pure biadditive
-- identity (`jb_add_left`/`jb_add_right` + `abel`; squares stay implicit, no coordinate/nuclearity).
-- `jdef_Hm_Xz_polar` — pieceB collapses to the polarization cross: against a zero-diagonal
-- Hermitian second argument, `jdef (Hm …) (Xz …) = polarCross (Dg …) (Xz …) (Xz …)`, because both
-- pure-cube pieces are banked zero (`jdef_Xz_core`, `jdef_Dg_Xz`). The genuine remaining octonionic
-- content of the first-slot drop, sharply isolated; `ocR` never enters coordinates.
#print axioms Phys.Algebra.HJ.jdef_polar_first
#print axioms Phys.Algebra.HJ.jdef_Hm_Xz_polar

-- N5j — pieceB SCALAR BUILDING BLOCKS (PieceBscale): the trunk-native frame the eight prior
-- coordinate runs missed. `ocR` is the SCALAR ring ℚ embedded onto the center of O ℚ: it is
-- MULTIPLICATIVE (`ocR_mul`) and ADDITIVE (`ocR_add`), preserves zero/one (`ocR_zero`,
-- `ocR_one_mul`). The real diagonal matrix `Dg`'s entries are exactly these central scalars
-- (`Dg00..Dg22 = ocR d_i`, off-diagonals zero). And the Jordan bracket against `Dg` is a
-- central-scalar HADAMARD SCALING of each entry (`jbDg_scale`): `(jb Dg M) i j = ocR(d_i+d_j)·M_ij`.
-- Pure bounded ground-ring identities, `ocR` transparent (numeric constant in the deepest slot).
#print axioms Phys.Algebra.HJ.ocR_mul
#print axioms Phys.Algebra.HJ.ocR_add
#print axioms Phys.Algebra.HJ.ocR_zero
#print axioms Phys.Algebra.HJ.ocR_one_mul
#print axioms Phys.Algebra.HJ.Dg00
#print axioms Phys.Algebra.HJ.Dg11
#print axioms Phys.Algebra.HJ.Dg22
#print axioms Phys.Algebra.HJ.Dg01
#print axioms Phys.Algebra.HJ.Dg02
#print axioms Phys.Algebra.HJ.Dg10
#print axioms Phys.Algebra.HJ.Dg12
#print axioms Phys.Algebra.HJ.Dg20
#print axioms Phys.Algebra.HJ.Dg21
#print axioms Phys.Algebra.HJ.jbDg_scale

-- N5j — pieceB DEGREE-2 HALF (PieceBdeg2): the SCALAR-MODULE DISSOLUTION (docs/STANDARD.md THE
-- ONE LAW; docs/RUNBOOK.md W1 "Mathlib lacks it → BUILD it"). The eight prior runs (64–78) died
-- grinding a looping `ocR`-canonicalizer; the fix is to recognize `ocR d_k` as SCALARS. `qMod` —
-- the ℚ-module action `r • x := ocR r * x` on O ℚ (built; no such instance existed), its axioms
-- the banked centrality/nuclearity of `ocR`. `tr_l`/`tr_r`/`tr_sl`/`tr_sr` — transport every
-- `ocR`-factor out to a ℚ-scalar action. `polarCross2_Dg_Xz` — ★★ the degree-2 part of the pieceB
-- polarization cross vanishes (`polarCross2 (Dg) (Xz) (Xz) = 0`), closed entrywise: distribute,
-- transport scalars, and `module` discharges the ℚ-linear octonion-monomial identity — the
-- scalars canonicalize themselves by the module axioms. Closes by CENTRALITY alone, no
-- alternativity (the "cheap structural half"; verified 40/40 in the faithful octonion model).
#print axioms Phys.Algebra.HJ.qMod
#print axioms Phys.Algebra.HJ.tr_l
#print axioms Phys.Algebra.HJ.tr_r
#print axioms Phys.Algebra.HJ.tr_sl
#print axioms Phys.Algebra.HJ.tr_sr
#print axioms Phys.Algebra.HJ.polarCross2_Dg_Xz

-- N5j — pieceB DEGREE-1 HALF, STRUCTURAL CORE (PieceBdeg1): the UNIT-DIAGONAL DISSOLUTION
-- (docs/STANDARD.md THE ONE LAW; docs/RUNBOOK.md W1 "BUILD it", W9). The degree-1 part of the
-- pieceB polarization cross is the genuine octonionic ALTERNATIVITY kernel; eight prior runs
-- (64–78) died grinding a looping `ocR`-canonicalizer on the OPAQUE real diagonal `Dg d0 d1 d2`.
-- The fix: `polarCross1` is ℚ-LINEAR in its diagonal argument, so the opaque-`ocR` content reduces
-- to the diagonal's value at the three UNIT positions `Du0/Du1/Du2 = diagonal eᵢ` — where the
-- coordinate is a literal `1`, no `ocR` appears, and the alternativity kernel becomes a concrete
-- Cayley–Dickson coordinate identity `ring` discharges over the commutative ground. `polarCross1_Du0`
-- /`_Du1`/`_Du2` — ★ the polarization cross's degree-1 part vanishes at each unit diagonal.
#print axioms Phys.Algebra.HJ.polarCross1_Du0
#print axioms Phys.Algebra.HJ.polarCross1_Du1
#print axioms Phys.Algebra.HJ.polarCross1_Du2

-- N5j — pieceB CLOSED + THE FULL CAP ASSEMBLED (PieceBfinal): the CAP'S POSITIVE EDGE. The real
-- diagonal decomposes as a ℚ-linear combination of the three UNIT diagonals (`Dg_eq_smul`), so by
-- the ℚ-linearity of `polarCross1` in its diagonal argument (`pc1_add_left`, `pc1_smul_left`, on
-- the banked `qMod` scalar tower `jb_smul_left`/`jb_smul_right`) the degree-1 cross at the OPAQUE
-- real diagonal reduces to the three banked unit-diagonal vanishings: ★★ `polarCross1_Dg_Xz`
-- (`polarCross1 (Dg) (Xz) (Xz) = 0`, the alternativity kernel closed; the eight-run instrument wall
-- dissolved by linearity). ★★ `jdef_Hm_Xz` (`jdef (Hm) (Xz p q r) = 0`, pieceB: the order-3 Jordan
-- defect of a general Hermitian against a zero-diagonal off-part, via `jdef_Hm_Xz_polar` +
-- `polarCross_split` + pc1=0 + pc2=0). ★★ `jdef_H3` (`jdef (Hm…) (Hm…) = 0`, THE CAP'S POSITIVE
-- EDGE for the GENERAL Hermitian pair over O ℚ, via `jdef_add_right` along `Hm_split` + pieceA
-- `jdef_Hm_Dg` + pieceB `jdef_Hm_Xz` — structural matrix arithmetic, no octonion-coordinate `ring`
-- on the full defect). ★★★ `jordan_cap_pinned_at_three` (the n=3 success `jdef_H3` ∧ the banked n=4
-- failure `jordan_fails_H4` — the Jordan cap value 3 is FORCED, the exact gap between alternativity
-- and associativity, the SAME octonionic non-associativity driving both: ONE CAUSE, the cap).
#print axioms Phys.Algebra.HJ.jb_smul_left
#print axioms Phys.Algebra.HJ.jb_smul_right
#print axioms Phys.Algebra.HJ.pc1_smul_left
#print axioms Phys.Algebra.HJ.pc1_add_left
#print axioms Phys.Algebra.HJ.Dg_eq_smul
#print axioms Phys.Algebra.HJ.polarCross1_Dg_Xz
#print axioms Phys.Algebra.HJ.jdef_Hm_Xz
#print axioms Phys.Algebra.HJ.jdef_H3
#print axioms Phys.Algebra.HJ.jordan_cap_pinned_at_three


-- N10 — THE √2 OBSTRUCTION RE-GROUNDED ONTO THE DERIVED ℚ (`Phys.Foundation.Q`, N9).
-- The analytic obstruction `no_rat_sq_two` (above, over imported ℚ) re-derived over the DERIVED
-- ℚ, with NO `import Mathlib.Data.{Nat,Int,Rat,Real}` as content. By infinite descent on counting
-- (`Re`): `Re.even_or_odd` (counting's parity), `Re.no_sq_two_bounded`/`Re.no_sq_two` (★ THE
-- DESCENT — no count solves `a²=2b²` nontrivially, bounded induction + parity, no well-founded
-- recursion, no Mathlib `Rat.den`), lifted to the derived ℤ (`Z.no_sq_two_Z` — squaring kills the
-- sign) and the derived ℚ (★★ `Q.no_q_sq_two` — no derived rational squares to 2). The exact
-- analytic gap N6's continuum is built to fill, now over the derived ground.
#print axioms Phys.Foundation.Re.even_or_odd
#print axioms Phys.Foundation.Re.no_sq_two_bounded
#print axioms Phys.Foundation.Re.no_sq_two
#print axioms Phys.Foundation.Z.no_sq_two_Z
#print axioms Phys.Foundation.Q.no_q_sq_two

-- N10 — THE CONTINUUM RE-GROUNDED ONTO THE DERIVED ℚ (`Phys.Foundation.ContinuumDerived`).
-- The entire N6-pre continuum construction (obstruction half `Continuum.lean` + resolution
-- half `CompletionContinuum.lean`, both over IMPORTED ℚ) re-stated with the ground type = the
-- DERIVED ℚ (`Phys.Foundation.Q`, a LINEARLY ORDERED FIELD via OrderedTower + N9 Q.field), with
-- NO Mathlib number-system content import, NO posited ℝ. EXACTLY ONE step is not verbatim: the
-- analytic obstruction `no_rat_sq_two` (Mathlib `Rat.den_pow`) is replaced by the banked
-- `Q.no_q_sq_two`. Everything else ports verbatim. The ℝ rung's order-completeness now rests on
-- the FOLD, not on imported `Rat`. ★★ `completion_coherence_closed` (Dedekind completeness over
-- the derived ground); ★ `sqrt2`/`sqrt2_not_rational`/`sqrt2_fills_gap` (the derived √2 as a new
-- completion element, not rational over the DERIVED ℚ).
#print axioms Phys.Foundation.ContinuumQ.sqrtTwoGather_isGather
#print axioms Phys.Foundation.ContinuumQ.sqrtTwoGather_not_coherent
#print axioms Phys.Foundation.ContinuumQ.ground_not_coherence_closed
#print axioms Phys.Foundation.ContinuumQ.Cut.le_total
#print axioms Phys.Foundation.ContinuumQ.completion_coherence_closed
#print axioms Phys.Foundation.ContinuumQ.coherent_gather
#print axioms Phys.Foundation.ContinuumQ.sqrt2
#print axioms Phys.Foundation.ContinuumQ.sqrt2_not_rational
#print axioms Phys.Foundation.ContinuumQ.sqrt2_fills_gap

-- N11 — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 1: THE ADDITIVE ORDERED GROUP on the
-- DERIVED-ℚ completion `ContinuumQ.Cut` (`Phys.Foundation.ContinuumField`). NO posited ℝ,
-- NO Mathlib number-system content import. INC-0: the derived ℤ/ℚ are ARCHIMEDEAN, derived
-- from counting (`Re.toNat`), NOT imported — the prerequisite for the cut additive inverse.
-- INC-1: cut addition = the gather of pairwise sums; negation = the fold's reflection (reflect
-- the upper complement); ★★ `add_neg_self` (`x+(-x)=0`, the eternal approach / Archimedean made
-- load-bearing via `approx`); `AddCommGroup Cut`; `LinearOrder Cut` (upgrading the banked
-- PartialOrder via `Cut.le_total`); `IsOrderedAddMonoid Cut` (order-compatible +). NON-VACUITY:
-- the embedding `Qcut` is an additive strictly-monotone hom, and the derived √2 is a strictly
-- positive new element (`zero_lt_sqrt2`).
#print axioms Phys.Foundation.Z.ofRe_eq_natCast
#print axioms Phys.Foundation.Z.instArchimedean
#print axioms Phys.Foundation.Q.instArchimedean
#print axioms Phys.Foundation.ContinuumQ.addGather
#print axioms Phys.Foundation.ContinuumQ.negGather
#print axioms Phys.Foundation.ContinuumQ.approx
#print axioms Phys.Foundation.ContinuumQ.add_neg_self
#print axioms Phys.Foundation.ContinuumQ.add_comm'
#print axioms Phys.Foundation.ContinuumQ.add_assoc'
#print axioms Phys.Foundation.ContinuumQ.zero_add'
#print axioms Phys.Foundation.ContinuumQ.addCommGroup
#print axioms Phys.Foundation.ContinuumQ.linearOrder
#print axioms Phys.Foundation.ContinuumQ.add_le_add_right'
#print axioms Phys.Foundation.ContinuumQ.Qcut_add
#print axioms Phys.Foundation.ContinuumQ.Qcut_strictMono
#print axioms Phys.Foundation.ContinuumQ.zero_lt_sqrt2

-- N12 — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 2: THE POSITIVE-CONE MULTIPLICATION
-- on the DERIVED-ℚ completion `ContinuumQ.Cut` + THE CAPSTONE `√2·√2 = 2`
-- (`Phys.Foundation.ContinuumFieldMul`). NO posited ℝ, NO Mathlib number-system content
-- import. THE POSITIVE CONE is the trunk's Born = self-overlap = POSITIVITY one level up:
-- `pmul` = the gather of pairwise products of NONNEGATIVE approximants (a genuine cut for
-- all x,y); sign-extended to `Mul Cut` via the banked negation + `LinearOrder Cut`; `One`
-- = `Qcut 1`. ★★ THE CAPSTONE `pmul_sqrt2_sqrt2`/`sqrt2_mul_sqrt2` (`√2·√2 = Qcut 2`):
-- the analytic gap N6 forced (`x²=2` has NO solution in the derived ℚ — banked
-- `Q.no_q_sq_two`) is SOLVED in the completion. The C6 eternal approach is load-bearing
-- a second time — `sq_dense` (density of rational squares below 2) iterates the HERON
-- mediant step whose gap CONTRACTS geometrically (`heron_gap`, `(2/9)ⁿ`), closed by the
-- banked `Q.instArchimedean`. The completion strictly extends the derived ℚ AND closes
-- the square the ground could not.
#print axioms Phys.Foundation.ContinuumQ.mulNonnegGather
#print axioms Phys.Foundation.ContinuumQ.pmul
#print axioms Phys.Foundation.ContinuumQ.pmul_comm
#print axioms Phys.Foundation.ContinuumQ.instMul
#print axioms Phys.Foundation.ContinuumQ.instOne
#print axioms Phys.Foundation.ContinuumQ.mul_of_nonneg
#print axioms Phys.Foundation.ContinuumQ.sqrt2_S_nonneg
#print axioms Phys.Foundation.ContinuumQ.heron_inv
#print axioms Phys.Foundation.ContinuumQ.heron_gap
#print axioms Phys.Foundation.ContinuumQ.sq_dense
#print axioms Phys.Foundation.ContinuumQ.pmul_sqrt2_sqrt2
#print axioms Phys.Foundation.ContinuumQ.sqrt2_mul_sqrt2

-- N13 — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 3: THE COMMUTATIVE RING `CommRing Cut`
-- on the DERIVED-ℚ completion `ContinuumQ.Cut` (`Phys.Foundation.ContinuumFieldRing`). NO
-- posited ℝ, NO Mathlib number-system content import. The ring laws are GENUINE content
-- proved ON THE POSITIVE CONE (Born = self-overlap = positivity): `pmul_assoc_cone`,
-- ★ `pmul_distrib_cone` (the fiddliest Dedekind-reals law, kept tractable by the cone),
-- `pmul_one_cone`. The SIGN EXTENSION (banked `instMul`) reduces every product to the cone
-- via the banked NEGATION (the fold's reflection) + `LinearOrder Cut`; the sign-homomorphism
-- laws `neg_mul`/`mul_neg` collapse the sign explosion, lifting each cone law to all of `Cut`.
-- ★ `commRing` (CommRing Cut). `zero_ne_one'` (the ring is non-trivial). Built on the banked
-- `addCommGroup` (the additive half) + the cone ring laws lifted through the sign homomorphism.
#print axioms Phys.Foundation.ContinuumQ.zero_le_pmul
#print axioms Phys.Foundation.ContinuumQ.pmul_zero
#print axioms Phys.Foundation.ContinuumQ.pmul_one_cone
#print axioms Phys.Foundation.ContinuumQ.pmul_assoc_cone
#print axioms Phys.Foundation.ContinuumQ.pmul_distrib_cone
#print axioms Phys.Foundation.ContinuumQ.neg_mul
#print axioms Phys.Foundation.ContinuumQ.mul_neg
#print axioms Phys.Foundation.ContinuumQ.mul_comm'
#print axioms Phys.Foundation.ContinuumQ.mul_assoc'
#print axioms Phys.Foundation.ContinuumQ.left_distrib'
#print axioms Phys.Foundation.ContinuumQ.right_distrib'
#print axioms Phys.Foundation.ContinuumQ.commRing
#print axioms Phys.Foundation.ContinuumQ.zero_ne_one'

-- N13 — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 4: THE MULTIPLICATIVE INVERSE →
-- `Field Cut` + `IsStrictOrderedRing Cut` on the DERIVED-ℚ completion `ContinuumQ.Cut`
-- (`Phys.Foundation.ContinuumFieldInverse`). NO posited ℝ, NO Mathlib number-system
-- content import. The INVERSE of a positive cut is the REFLECT-AND-RECIPROCATE set
-- `pinvS` (the multiplicative SWAP one level up, mirroring N9's q/p swap = the fold's
-- reflection on the multiplicative pairs). The cancellation `pmul x (pinv x) = 1` is
-- where the C6 ETERNAL APPROACH becomes load-bearing a THIRD time — the multiplicative
-- approximation `mul_approx` (the ratio a/r of an interior point to an exterior bound
-- approaches 1, forced past any t<1 by the banked Archimedean `approx` lever). The sign
-- extension (banked negation = the fold's reflection) carries the inverse to all nonzero
-- cuts ⟹ ★★ `isField`/`field` (Field Cut). `mul_pos` (the positive cone is closed under
-- the product — Born = self-overlap = positivity as an ORDER fact) ⟹ ★★ `isStrictOrderedRing`
-- (IsStrictOrderedRing Cut). With the banked Dedekind completeness, the completion is a
-- LINEARLY ORDERED FIELD WITH THE LUB PROPERTY — the ℝ rung, over the derived ℚ.
-- `sqrt2_inv_mul_sqrt2` (the field inverts the very irrational the ground was forced to miss).
#print axioms Phys.Foundation.ContinuumQ.pinv
#print axioms Phys.Foundation.ContinuumQ.pinvGather
#print axioms Phys.Foundation.ContinuumQ.zero_le_pinv
#print axioms Phys.Foundation.ContinuumQ.mul_approx
#print axioms Phys.Foundation.ContinuumQ.pmul_pinv_cancel
#print axioms Phys.Foundation.ContinuumQ.mul_pinv_cancel
#print axioms Phys.Foundation.ContinuumQ.isField
#print axioms Phys.Foundation.ContinuumQ.field
#print axioms Phys.Foundation.ContinuumQ.mul_pos
#print axioms Phys.Foundation.ContinuumQ.isStrictOrderedRing
#print axioms Phys.Foundation.ContinuumQ.sqrt2_inv_mul_sqrt2

-- N6 — THE DERIVATION (infinitesimal automorphism) LIE ALGEBRA of the terminal algebra
-- `𝕆 = CD (CD B)` (`Phys.Algebra.Derivation`). The FIRST physics-recognized (Emergent-layer)
-- structure: the Leibniz-derivations of the terminal algebra form a LIE ALGEBRA under the
-- commutator bracket, non-trivially. DERIVED FORWARD from the banked `CD` product + the
-- Leibniz law (NO Mathlib `Derivation`/`LieAlgebra`-on-𝕆/`G₂` import that would ASSERT 𝕆's
-- derivations ARE a Lie algebra / are g₂ — the posit-vs-derive moat). ★★ `isDeriv_bracket`
-- (the commutator of two derivations is again a derivation) uses ONLY Leibniz + biadditivity
-- + distributivity — NOT associativity of 𝕆, which is exactly why the structure survives on
-- the non-associative terminal algebra. `derivation` (Der(𝕆) as a LieSubalgebra of the
-- machinery Lie algebra Module.End ℤ 𝕆) inherits LieRing + LieAlgebra ℤ; the three defining
-- laws are exposed as `deriv_lie_add_left`/`deriv_lie_add_right` (BILINEAR), `deriv_lie_self`
-- (ALTERNATING), `deriv_lie_jacobi` (JACOBI). NON-VACUITY (W8): `witnessDeriv` = the lift of
-- the inner derivation `ad_{e₂}` (imaginary generator of the associative base H ℚ) is a
-- concrete NONZERO derivation on O ℚ — nonzero THEORY-NATIVELY (e₂ and ιJ do not commute,
-- banked iota_e2_comm_iff + J_ne_star_J), so `derivation_nontrivial`/`derivation_ne_bot`.
#print axioms Phys.Algebra.IsDeriv
#print axioms Phys.Algebra.isDeriv_zero
#print axioms Phys.Algebra.isDeriv_add
#print axioms Phys.Algebra.isDeriv_neg
#print axioms Phys.Algebra.isDeriv_smul
#print axioms Phys.Algebra.isDeriv_bracket
#print axioms Phys.Algebra.derivation
#print axioms Phys.Algebra.mem_derivation
#print axioms Phys.Algebra.deriv_lie_add_left
#print axioms Phys.Algebra.deriv_lie_add_right
#print axioms Phys.Algebra.deriv_lie_self
#print axioms Phys.Algebra.deriv_lie_jacobi
#print axioms Phys.Algebra.liftEnd
#print axioms Phys.Algebra.liftEnd_apply
#print axioms Phys.Algebra.liftEnd_isDeriv
#print axioms Phys.Algebra.adHom
#print axioms Phys.Algebra.adHom_apply
#print axioms Phys.Algebra.adHom_isDeriv
#print axioms Phys.Algebra.adHom_star_comm
#print axioms Phys.Algebra.innerDeriv
#print axioms Phys.Algebra.innerDeriv_isDeriv
#print axioms Phys.Algebra.innerDeriv_apply
#print axioms Phys.Algebra.e2_imag_H
#print axioms Phys.Algebra.witnessDeriv
#print axioms Phys.Algebra.witnessDeriv_isDeriv
#print axioms Phys.Algebra.adHom_e2_iotaJ_ne_zero
#print axioms Phys.Algebra.witnessDeriv_iotaiotaJ_ne_zero
#print axioms Phys.Algebra.witnessDeriv_ne_zero
#print axioms Phys.Algebra.derivation_nontrivial
#print axioms Phys.Algebra.derivation_ne_bot

-- N16 — TOWARD THE DIMENSION / g₂ CHARACTERIZATION of Der(O ℚ) (`Phys.Algebra.DerivationDim`).
-- The structural CORE of the deeper claim N6 deferred: the constraints EVERY Leibniz-derivation
-- of the terminal algebra satisfies, derived FORWARD from the banked `IsDeriv` predicate, NO
-- posited `G₂` import (the posit-vs-derive moat). `deriv_one`: every derivation kills the unit
-- (`D 1 = 0`, pure Leibniz + the unit law, no associativity, no coordinates) — the first
-- structural reduction cutting Der(𝕆) toward g₂ (a derivation is determined by its action on
-- the imaginary subspace). `witnessDeriv_one`: the banked NONZERO witness (N6) kills the unit.
-- Confirmed by faithful exact-rational numerics: dim_ℚ Der(O ℚ) = 14 (the exact 512×64 ℚ-rank
-- count + the explicit g₂ basis/bracket + the ≅ g₂ Lie isomorphism are the W9-prime dissolution
-- child, NOT this node).
#print axioms Phys.Algebra.deriv_one
#print axioms Phys.Algebra.witnessDeriv_one

-- N17 — THE ℚ-MODULE STRUCTURE + the structural reduction `Der(O ℚ) ⊆ so(Born)` (`Phys.Algebra.DerivationSkew`).
-- N16 W3-scoped these to the dissolution child. The ℚ-MODULE structure on the terminal algebra
-- (`instModuleQO` — machinery on the DERIVED object, NOT a posited number system, STANDARD §3),
-- every ℤ-derivation is ℚ-linear (`deriv_qsmul`), `D (star x) = −D x` (`deriv_star`), a derivation
-- kills every self-conjugate/real element (`deriv_real_zero`), and ★★ the SKEW-ADJOINTNESS
-- `D x · star x = x · D x` (`deriv_norm_preserve`) = the containment `Der ⊆ so(Born) = so(7)`,
-- derived COORDINATE-FREE via the trunk (the Born self-overlap `x · star x` is self-conjugate, so a
-- derivation kills it) — the W9 monolithic 8-coordinate rank entirely AVOIDED. Polarized
-- (`deriv_skew_polar`) and non-vacuous on the banked nonzero witness (`witnessDeriv_skew`). NO
-- posited `G₂`/`LieAlgebra.g2` import. The exact `dim = 14` (so(7)→g₂ cut) + the ≅ g₂ Lie
-- isomorphism are the W9-prime dissolution child, NOT this node.
#print axioms Phys.Algebra.instModuleQO
#print axioms Phys.Algebra.deriv_qsmul
#print axioms Phys.Algebra.trace_id
#print axioms Phys.Algebra.deriv_star
#print axioms Phys.Algebra.deriv_real_zero
#print axioms Phys.Algebra.selfMul_selfconj
#print axioms Phys.Algebra.deriv_norm_preserve
#print axioms Phys.Algebra.deriv_skew_polar
#print axioms Phys.Algebra.witnessDeriv_skew

-- N18 — THE TRACE-FREE / Im-PRESERVING REFINEMENT of `Der(O ℚ) ⊆ so(Born)` (`Phys.Algebra.DerivationTraceFree`).
-- Completes the QUALITATIVE so(7) characterization: N16 banked `D 1 = 0`, N17 banked the
-- skew-adjointness (`Der ⊆ so(7)`); N18 banks the two remaining structural constraints the
-- exact-rational numerics record for every derivation — (3) TRACE-FREE (`reQ (D x) = 0`,
-- `deriv_reQ_zero` / `deriv_maps_im`: every derivation maps `O` into the 7-dim imaginary
-- subspace) and (4) COMMUTES WITH CONJUGATION (`deriv_comm_star`) — derived COORDINATE-FREE
-- from the banked skew reduction via the Jordan/Born anticommutation `deriv_jordan_anticomm`
-- + the trace identity, NO fully-expanded-octonion-coordinate rank (the W9 monolith AVOIDED),
-- NO posited `G₂`/`LieAlgebra.g2` import. Non-vacuous on the banked nonzero witness
-- (`witnessDeriv_reQ_zero`/`witnessDeriv_maps_im`/`witnessDeriv_comm_star`). The exact
-- `dim = 14` (so(7)→g₂ cut 21→14, needing finrank infra) + the ≅ g₂ Lie isomorphism are the
-- W9-prime dissolution child N19, NOT this node.
#print axioms Phys.Algebra.deriv_jordan_anticomm
#print axioms Phys.Algebra.deriv_reflect
#print axioms Phys.Algebra.deriv_re_smul_zero
#print axioms Phys.Algebra.deriv_reQ_zero_imag
#print axioms Phys.Algebra.deriv_reQ_zero
#print axioms Phys.Algebra.deriv_maps_im
#print axioms Phys.Algebra.deriv_comm_star
#print axioms Phys.Algebra.witnessDeriv_reQ_zero
#print axioms Phys.Algebra.witnessDeriv_maps_im
#print axioms Phys.Algebra.witnessDeriv_comm_star

-- N19 — THE FINITE-DIMENSIONALITY SCAFFOLD on `O ℚ` + `Der(O ℚ)` as a ℚ-submodule
-- (`Phys.Algebra.DerivationFinrank`). The PREREQUISITE INFRA the exact dim count needs
-- (N18 FINDINGS flagged it as "the real first blocker"): the terminal algebra is an
-- 8-dimensional ℚ-vector space (`finrank_O_eq_eight`, derived STRUCTURALLY through the
-- product equivalences `cdProdEquiv`/`dblProdEquiv` 2→4→8, NO coordinate basis matrix —
-- the W9 expansion avoided), its endomorphism ring is 64-dimensional, and `Der(O ℚ)` is
-- realized as a finite-dimensional ℚ-submodule `derivationQ` of `Module.End ℚ (O ℚ)` —
-- making `Module.finrank ℚ derivationQ` a well-typed natural number with proved bounds
-- `1 ≤ dim_ℚ Der(O ℚ) ≤ 64` (`finrank_derivationQ_pos` nonzero via the banked nonzero
-- witness, `finrank_derivationQ_le`). NO posited `G₂`/`LieAlgebra.g2` import. The exact
-- `dim = 14` (lower bound: 14 explicit derivations; upper bound: the so(7)→g₂ cut 21→14,
-- the rep-theoretic W9-prime half) + the ≅ g₂ structure are the dissolution child N20.
#print axioms Phys.Algebra.dblProdEquiv
#print axioms Phys.Algebra.cdProdEquiv
#print axioms Phys.Algebra.instFiniteO
#print axioms Phys.Algebra.finrank_dbl_eq_two
#print axioms Phys.Algebra.finrank_H_eq_four
#print axioms Phys.Algebra.finrank_O_eq_eight
#print axioms Phys.Algebra.finrank_End_eq_64
#print axioms Phys.Algebra.qsmul_mul_left
#print axioms Phys.Algebra.qsmul_mul_right
#print axioms Phys.Algebra.derivationQ
#print axioms Phys.Algebra.finrank_derivationQ_le
#print axioms Phys.Algebra.toEndQ
#print axioms Phys.Algebra.toEndQ_isDerivQ
#print axioms Phys.Algebra.toEndQ_mem
#print axioms Phys.Algebra.witnessDerivQ_isDerivQ
#print axioms Phys.Algebra.witnessDerivQ_mem
#print axioms Phys.Algebra.witnessDerivQ_ne_zero
#print axioms Phys.Algebra.derivationQ_ne_bot
#print axioms Phys.Algebra.finrank_derivationQ_pos

-- N19 (L) — THE LOWER BOUND `14 ≤ dim_ℚ Der(O ℚ)` (`Phys.Algebra.DerivationLowerBound`).
-- The well-typed scaffold bound `1 ≤ dim` is sharpened to the EXACT `≥ 14` by EXHIBITING
-- 14 explicit linearly-independent derivations of the terminal algebra — the explicit
-- integer-sparse nullbasis of the Leibniz ℚ-system (workbench/N16-g2-dimension, re-verified
-- exact-rational every node N16–N19). Each `DkE` is a `Module.End ℚ (O ℚ)` proved to satisfy
-- the Leibniz law (`DkE_isDerivQ`); the 14 are linearly independent via the DIAGONAL-FUNCTIONAL
-- route (each has a coordinate where it is the unique nonzero, so the read-off functionals form
-- a negated identity — NO 14×14 determinant, the W9.4 structure-over-expansion reframe); their
-- span sits in `derivationQ`, so `Submodule.finrank_mono` gives `14 ≤ finrank ℚ derivationQ`.
-- Forward, NO posited `G₂`/`LieAlgebra.g2`. The matching upper bound `≤ 14` (the so(7)→g₂ cut
-- 21→14) + the ≅ g₂ structure are the dissolution child N20.
#print axioms Phys.Algebra.D0E_isDerivQ
#print axioms Phys.Algebra.D7E_isDerivQ
#print axioms Phys.Algebra.D13E_isDerivQ
#print axioms Phys.Algebra.Dvec_linearIndependent
#print axioms Phys.Algebra.Dvec_mem
#print axioms Phys.Algebra.finrank_derivationQ_ge_14

-- N20 (U) — THE UPPER BOUND `dim_ℚ Der(O ℚ) ≤ 14` ⟹ THE EXACT `= 14`
-- (`Phys.Algebra.DerivationUpperBound`). The so(7)→g₂ cut 21→14, derived FORWARD.
-- A derivation is DETERMINED by its three generator values `D e1, D e2, D e4`
-- (`determined`: the octonion shape is multiplicatively generated by e1,e2,e4 with
-- e3=e1·e2, e5=e1·e4, e6=e2·e4, e7=e3·e4). Each `D ei` is trace-free (banked N18
-- `deriv_reQ_zero`, here `derivQ_reQ_zero`), so the naive count is 3×7=21; the
-- Leibniz law on the generator products imposes EXACTLY the 7 structural cut
-- constraints (`cut_e1_c1`/`cut_e2_c2`/`cut_e4_c4` the diagonal skew, `cut_e12_c0`/
-- `cut_e14_c0`/`cut_e24_c0` the off-diagonal skew, `cut_e34_c0` the octonionic step
-- e3·e4=e7) that cut 21→14. The 14 pivot coordinates assemble into the injective
-- `coordMap`/`coordMapR` (`coordMapR_injective` via the cascade `gens_zero` +
-- `determined`), so `LinearMap.finrank_le_finrank_of_injective` with
-- `finrank ℚ (Fin 14 → ℚ) = 14` gives `finrank_derivationQ_le_14`; `le_antisymm`
-- against the banked lower bound closes `finrank_derivationQ_eq_14`. Forward,
-- NO posited `G₂`/`LieAlgebra.g2` — the SAME posit-vs-derive moat N3..N6/N16..N19 held.
#print axioms Phys.Algebra.determined
#print axioms Phys.Algebra.cut_e1_c1
#print axioms Phys.Algebra.cut_e34_c0
#print axioms Phys.Algebra.coordMapR_injective
#print axioms Phys.Algebra.finrank_derivationQ_le_14
#print axioms Phys.Algebra.finrank_derivationQ_eq_14

-- N21 (i) — THE g₂ LIE STRUCTURE of Der(O ℚ), PART 1 (`Phys.Algebra.DerivationBracket`).
-- On the banked exact dimension `finrank_derivationQ_eq_14` (N20) + the 14 explicit
-- derivations `D0E..D13E` (N19) + the bracket source `isDeriv_bracket` (N6), the g₂
-- Lie structure is derived FORWARD. `isDerivQ_bracket`: the commutator of two ℚ-linear
-- derivations is a derivation (the ℚ-analog of N6 — Leibniz + distributivity ALONE, no
-- associativity). `derivationLieQ`: Der(O ℚ) as a `LieSubalgebra ℚ (Module.End ℚ (O ℚ))`,
-- inheriting LieRing+LieAlgebra (bilinear/alternating/Jacobi exposed). `derivBasis`: the
-- 14 `D0E..D13E` form a `Module.Basis (Fin 14) ℚ derivationQ` — independence lifted from
-- the banked `Dvec_linearIndependent` into the submodule, spanning via the banked
-- `finrank=14`. NO posited `G₂`/`LieAlgebra.g2`.
#print axioms Phys.Algebra.isDerivQ_bracket
#print axioms Phys.Algebra.derivationLieQ
#print axioms Phys.Algebra.derivLieQ_jacobi
#print axioms Phys.Algebra.Dsub_indep
#print axioms Phys.Algebra.derivBasis

-- N21 (ii) — THE g₂ STRUCTURE-CONSTANT TABLE (`Phys.Algebra.DerivationStructureConstants`).
-- For every pair i<j of the 14 basis derivations, the commutator `⁅DiE,DjE⁆ = Σ cᵏᵢⱼ DkE`
-- is computed explicitly and PROVED forward (each bracket a derivation by `isDerivQ_bracket`
-- ⟹ in the 14-dim span; structure constants read off + proved by ext+simp+ring on the
-- derived CD product). All 91 pairs banked; integer constants in {-2,-1,1,2}, 84/91 nonzero.
-- The single-term skew brackets + the two-term octonionic brackets (e.g. `br_4_7 = 2 D0E +
-- 2 D3E`, the associator contribution of the non-associativity that stopped the cascade).
-- NO posited `g₂` bracket table.
#print axioms Phys.Algebra.br_0_1
#print axioms Phys.Algebra.br_0_4
#print axioms Phys.Algebra.br_4_7
#print axioms Phys.Algebra.br_12_13

-- N22 — THE FAITHFUL 7-DIM REPRESENTATION (the g₂ FUNDAMENTAL rep) (`Phys.Algebra.DerivationRep7`).
-- On the banked `derivationLieQ` (N21) + `deriv_maps_im` (N18) + `determined` + `finrank_O_eq_eight`
-- (N19/N20), the action of the derivation Lie algebra on the imaginary subspace is derived FORWARD.
-- `ImO`: the imaginary subspace `ker(star+1)`. `finrank_ImO`: `finrank ℚ ImO = 7` via rank–nullity
-- (range(star+1)=ℚ·1 from the trace identity; finrank O=8 banked). `imRep`: the restriction-to-Im
-- Lie homomorphism `derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO` (ImO an invariant subspace by
-- `deriv_maps_im`). `imRep_injective`: ★★ FAITHFUL — `imRep D = 0 ⟹ D u1=D u2=D u4=0 ⟹ D=0` by
-- `determined`. `imRep_witness_ne_zero`: anti-vacuity (the nonzero witness has nonzero image). A
-- 14-dim Lie algebra acting faithfully on a 7-dim space = the g₂ fundamental representation. NO
-- posited `G₂`/`LieAlgebra.g2`. (The compact-form Killing-definiteness + simplicity that complete
-- the type-G₂ pinning are childed N23 — Der(O ℚ) is the COMPACT form, ≇ the split Serre g₂ ℚ.)
#print axioms Phys.Algebra.finrank_ImO
#print axioms Phys.Algebra.imRep
#print axioms Phys.Algebra.imRep_injective
#print axioms Phys.Algebra.imRep_witness_ne_zero
#print axioms Phys.Algebra.derivLieQ_mapsTo

-- N23 — THE PERFECTNESS / NON-SOLVABILITY (the cleanly-tractable compact-form / type-G₂ invariant)
-- (`Phys.Algebra.DerivationPerfect`). Derived FORWARD from the banked 91-pair bracket table (N21):
-- every basis derivation is a SINGLE banked bracket `⁅bL i, bL j⁆ = c • bL k` (the `cert_k`), so the
-- whole 14-dim algebra lies in its own derived ideal. `bL_span_top`: the 14 generators span ⊤
-- (transported from `derivBasis`). `bL_mem_derived`: each `bL k ∈ ⁅⊤,⊤⁆`. `derivationLieQ_perfect`:
-- ★★ `⁅⊤,⊤⁆ = ⊤` (PERFECT). `derivationLieQ_not_solvable`: ★★ ¬ IsSolvable (the derived series is
-- constant ⊤, never ⊥, since ⊤ ≠ ⊥). `derivationLieQ_not_lieAbelian`: anti-vacuity (a nonzero
-- generator bracket exists). NO posited `G₂`/`LieAlgebra.g2`. (Irreducibility of the faithful 7-rep,
-- Killing nondegeneracy/definiteness, and simplicity that complete the compact-form pinning are
-- childed N24.)
#print axioms Phys.Algebra.bL_span_top
#print axioms Phys.Algebra.bL_mem_derived
#print axioms Phys.Algebra.derivationLieQ_perfect
#print axioms Phys.Algebra.derivationLieQ_top_ne_bot
#print axioms Phys.Algebra.derivationLieQ_not_solvable
#print axioms Phys.Algebra.derivationLieQ_not_lieAbelian

-- N24 — THE COMPACT-SIGNATURE PIN: NEGATIVE-DEFINITENESS + NONDEGENERACY of the defining
-- trace form (`Phys.Algebra.DerivationCompact`). The compact real form is the DEFINITE one;
-- the ticket feared this as a 14×14 nested-rational-determinant W9 beast. It DISSOLVES through
-- the trunk (THE ONE LAW): every derivation is SKEW-ADJOINT for the positive-definite Born
-- self-overlap form `g v w = reQ (v · star w)` (banked N17/N18, lifted to ℚ in `gFormQ_skew`),
-- so the CHEAP 8-dim defining trace form `B(D,E) = tr_{O ℚ}(D∘E)` satisfies
-- `B(D,D) = − Σ_j g(D bO_j, D bO_j) ≤ 0` (`traceForm_self_nonpos`), `= 0 → D = 0`
-- (`traceForm_self_eq_zero`, anisotropy of the 8-square Born form) — NEGATIVE-DEFINITE, NO
-- determinant. Hence `traceForm_nondegenerate` (the Cartan-criterion input). `traceForm_witness_neg`:
-- anti-vacuity (the banked nonzero witness has `B(w,w) < 0` — NOT in the radical). NO posited
-- `G₂`/`LieAlgebra.g2`; `LieModule.traceForm` is MACHINERY on the derived object. (SEMISIMPLICITY
-- — the no-abelian-atoms clause, which is NOT free from this DEFINITE module trace form — plus
-- irreducibility of the faithful 7-rep, simplicity, and the automorphism Lie GROUP are childed N25.)
#print axioms Phys.Algebra.gFormQ_skew
#print axioms Phys.Algebra.traceForm_apply_neg
#print axioms Phys.Algebra.traceForm_self_nonpos
#print axioms Phys.Algebra.traceForm_self_eq_zero
#print axioms Phys.Algebra.traceForm_nondegenerate
#print axioms Phys.Algebra.traceForm_witness_neg

-- N25 — SEMISIMPLICITY (the no-abelian-atoms clause + the trivial centre + the assembly),
-- forward from the banked NEGATIVE-DEFINITE nondegenerate trace form (N24) + PERFECTNESS (N23).
-- The Mathlib entry `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` needs, beyond the
-- nondegenerate/reflexive/lie-invariant inputs (all banked/free), the clause `∀ I, IsAtom I →
-- ¬IsLieAbelian I`. For the negative-DEFINITE module trace form the false "abelian ideal ⊆
-- radical" Killing argument does NOT apply; the clean theory-native route uses trace-form
-- INVARIANCE + negative-DEFINITENESS + N23 PERFECTNESS through the centre. `derivationLieQ_center_eq_bot`:
-- the centre is trivial (perfect ⟹ every element ∈ lcs 1, orthogonal to the centre ⟹ 0).
-- `derivationLieQ_no_abelian_atom`: the atom dichotomy `⁅⊤,I⁆ ∈ {⊥, I}` both lead to `I = ⊥`.
-- `derivationLieQ_semisimple`: the assembly. NO posited `G₂`; `LieModule.traceForm`/`LieIdeal`/
-- `IsAtom`/`IsLieAbelian`/`InvariantForm` are MACHINERY on the derived object (STANDARD §3).
-- (Irreducibility of the faithful 7-rep, simplicity, and the automorphism Lie GROUP are childed N26.)
#print axioms Phys.Algebra.traceForm_self_eq_zero'
#print axioms Phys.Algebra.derivationLieQ_center_eq_bot
#print axioms Phys.Algebra.derivationLieQ_no_abelian_atom
#print axioms Phys.Algebra.derivationLieQ_semisimple

-- N26 — THE INVARIANT 7-DIM Lie SUBMODULE + the ORTHOGONAL (COMPACT) EMBEDDING + the
-- SIMPLICITY SKELETON, forward from the banked faithful 7-rep (N22) + skew-adjointness for
-- the Born self-overlap form (N24) + non-abelianness (N23). `ImLie`: the banked imaginary
-- subspace `ImO` promoted to a `LieSubmodule ℚ derivationLieQ (O ℚ)` (invariant via
-- `derivLieQ_mapsTo`), nontrivial (the banked nonzero generator `u1`), `finrank_ImLie = 7`.
-- `gBil`: the Born self-overlap form as a `BilinForm`; `deriv_isSkewAdjoint_gBil`: every
-- derivation is skew-adjoint for it (banked `gFormQ_skew`). `derivationLieQ_le_skewAdjoint`:
-- THE COMPACT EMBEDDING — the whole 14-dim algebra lands in the skew-adjoint operators of the
-- POSITIVE-DEFINITE Born form (`g₂ ↪ so(7)` compact, NOT split). `gBil_separatingLeft`: the
-- form is anisotropic/nondegenerate. `isSimple_of_isSimpleOrder`: the simplicity skeleton —
-- simple iff the ideal lattice is a simple order (via banked non-abelianness). NO posited `G₂`;
-- `LieSubmodule`/`BilinForm`/`skewAdjointLieSubalgebra`/`IsSimpleOrder`/`LieIdeal` are MACHINERY
-- on the derived object (STANDARD §3). (The full irreducibility of the 7-rep + the
-- `IsSimpleOrder (LieIdeal)` core + the automorphism Lie GROUP are childed N27.)
#print axioms Phys.Algebra.ImLie
#print axioms Phys.Algebra.finrank_ImLie
#print axioms Phys.Algebra.gBil
#print axioms Phys.Algebra.deriv_isSkewAdjoint_gBil
#print axioms Phys.Algebra.derivationLieQ_le_skewAdjoint
#print axioms Phys.Algebra.gBil_separatingLeft
#print axioms Phys.Algebra.isSimple_of_isSimpleOrder

-- N27 — COMPLETE REDUCIBILITY of the faithful 7-rep + the d=1 EXCLUSION, forward from the
-- banked `ImLie`/`gBil`/skew-adjointness (N26) + perfectness/faithfulness (N22/N23). The
-- trunk's Born positivity (the self-overlap form `gBil` is DEFINITE) makes the Weyl unitary
-- trick free: `gBil_restrict_nondegenerate` (the definite form restricts nondegenerately to
-- EVERY subspace), `isCompl_gBil_orthogonal` (so the Born-orthogonal complement is a genuine
-- linear complement), `deriv_mapsTo_orthogonal` (skew-adjointness ⟹ the complement of a
-- D-invariant subspace is D-invariant), `gPerp`/`isCompl_gPerp` (every Lie submodule has an
-- INVARIANT complement — COMPLETE REDUCIBILITY, no averaging, no posited compact group).
-- The d=1 exclusion ("one cause many terminations" at the rep level): `deriv_eigenvalue_zero`
-- (a derivation, skew-adjoint for a DEFINITE form, has no nonzero real eigenvalue),
-- `no_common_eigenvector_ImO` (a nonzero common eigenvector in `ImO` would lie in the joint
-- kernel `{D0E,D3E,D8E}` = 0), `no_one_dim_invariant_ImO` (hence no 1-dim invariant subspace).
-- NO posited `G₂`; `BilinForm.orthogonal`/`IsCompl`/`finrank` are MACHINERY on the derived
-- object (STANDARD §3). (The d∈{2,3,4,5} so(n) dimension-count → full irreducibility, and the
-- `IsSimpleOrder (LieIdeal)` core → `IsSimple`, and the automorphism Lie GROUP are childed N28.)
#print axioms Phys.Algebra.gBil_isSymm
#print axioms Phys.Algebra.gBil_restrict_nondegenerate
#print axioms Phys.Algebra.isCompl_gBil_orthogonal
#print axioms Phys.Algebra.deriv_mapsTo_orthogonal
#print axioms Phys.Algebra.gPerp
#print axioms Phys.Algebra.isCompl_gPerp
#print axioms Phys.Algebra.deriv_eigenvalue_zero
#print axioms Phys.Algebra.no_common_eigenvector_ImO
#print axioms Phys.Algebra.no_one_dim_invariant_ImO

-- N28 — FULL IRREDUCIBILITY of the faithful 7-rep, forward from the banked COMPLETE
-- REDUCIBILITY + d=1 exclusion (N27) + ImLie/gBil/compact embedding (N26) + faithfulness
-- (N22). THE W1 BUILD (Mathlib lacks `dim so(n) = C(n,2)`): the so(n)-type dimension bound
-- `finrank_skewAdjoint_le_choose` (a skew-adjoint operator of a symmetric nondegenerate form
-- on a d-space lies in a space of dim ≤ C(d,2)) is DERIVED FORWARD via the alternating-Fin-2 /
-- exterior-power injection `skewToDual` (NOT a posited so(n), NO coordinate matrix). The
-- assembly: `restrictOp_skew` (a derivation restricted to an invariant subspace is skew-adjoint
-- for the restricted Born form), `finrank_restrictSkew_le` (the bound applied to the restricted
-- form), `no_proper_invariant_ImO` (the Born-orthogonal split + faithfulness force
-- `14 ≤ C(d,2)+C(7−d,2)`, false for every proper d∈{1..6}), `ImLie_isIrreducible`
-- (`LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie` — the only Lie submodules are ⊥/⊤). NO
-- posited `G₂`; `AlternatingMap`/`⋀²`/`BilinForm`/`finrank`/`IsSimpleOrder` are MACHINERY on the
-- derived object (STANDARD §3). (The `IsSimpleOrder (LieIdeal)` core → `IsSimple` and the
-- automorphism Lie GROUP are childed N29.)
#print axioms Phys.Algebra.bml_zero_diag
#print axioms Phys.Algebra.skewToDual_injective
#print axioms Phys.Algebra.finrank_skewAdjoint_le_choose
#print axioms Phys.Algebra.restrictOp_skew
#print axioms Phys.Algebra.restrictToSkew
#print axioms Phys.Algebra.finrank_restrictSkew_le
#print axioms Phys.Algebra.no_proper_invariant_ImO
#print axioms Phys.Algebra.map_incl_le_ImO
#print axioms Phys.Algebra.finrank_map_incl
#print axioms Phys.Algebra.ImLie_isIrreducible

-- N29 — the SIMPLICITY-REDUCTION levers toward `LieAlgebra.IsSimple ℚ derivationLieQ`.
-- N26 banked the simplicity skeleton `isSimple_of_isSimpleOrder`; N28 banked FULL
-- IRREDUCIBILITY of the faithful 7-rep; N25 banked SEMISIMPLICITY (so the ideal lattice is a
-- Boolean algebra, atomistic). The remaining gap — `IsSimpleOrder (LieIdeal ℚ derivationLieQ)`,
-- "exactly one atom" — is NOT near-free (faithful+irreducible⟹simple is FALSE in general,
-- `so(4)`/ℝ⁴), and needs the irreducible-faithful-module⟹simple structure theorem
-- (isotypic decomposition + Schur over ℚ + the prime-dimension-7 count), a substantial W1
-- BUILD Mathlib lacks for Lie modules — childed N30. This file banks the route-independent
-- FORWARD levers: `lieIdeal_nontrivial` (⊥≠⊤, the Nontrivial half of IsSimpleOrder, from the
-- banked non-abelianness), `eq_bot_of_lie_ImLie_bot` (a Lie ideal bracketing to ⊥ against the
-- faithful 7-rep is ⊥ — the faithfulness lever the structure theorem turns on), and
-- `lie_ImLie_ne_bot_of_ne_bot` (every nonzero ideal acts nontrivially on the irreducible
-- 7-rep). NO posited `G₂`; `LieIdeal`/`LieSubmodule`/`Nontrivial` are MACHINERY on the derived
-- object (STANDARD §3).
#print axioms Phys.Algebra.lieIdeal_nontrivial
#print axioms Phys.Algebra.eq_bot_of_lie_ImLie_bot
#print axioms Phys.Algebra.lie_ImLie_ne_bot_of_ne_bot

-- N30 — the irreducible-faithful-module⟹simple STRUCTURE THEOREM levers (the atom →
-- two-commuting-ideals reduction toward `IsSimpleOrder (LieIdeal ℚ derivationLieQ)`).
-- Semisimplicity (N25) makes the ideal lattice a Boolean algebra, atomistic; so if it is
-- NOT a simple order there is an atom `I ≠ ⊤` (`exists_atom_ne_top`), and its Boolean
-- complement `J = Iᶜ` gives two nonzero COMMUTING ideals (`⁅I,J⁆ = ⊥`) splitting `⊤ = I ⊕ J`
-- (`atom_compl_decomp`) — the direct-sum-of-commuting-ideals hypothesis the prime-dimension-7 /
-- isotypic-Schur structure theorem refutes. NO posited `G₂`; `IsAtom`/`IsSimpleOrder`/`Booleanᶜ`
-- are MACHINERY on the derived object (STANDARD §3). The collapse-consumed levers:
-- `imRep_commute_of_lie_zero` (commuting ideals act by commuting operators on the 7-rep —
-- `imRep` a Lie hom), `atom_isPerfect` (an atom is simple hence perfect — kills the 1-dim
-- character branch), `atom_center_eq_bot` (an atom has trivial centre — kills the dim Δ=7 branch).
#print axioms Phys.Algebra.exists_atom_ne_top
#print axioms Phys.Algebra.atom_compl_decomp
#print axioms Phys.Algebra.imRep_commute_of_lie_zero
#print axioms Phys.Algebra.atom_isPerfect
#print axioms Phys.Algebra.atom_center_eq_bot

-- N30a — the Lie→associative SEMISIMPLE-MODULE BRIDGE `IsSemisimpleModule A_I ↥ImO`.
-- The prime-7 / isotypic-Schur structure theorem (N30b) runs on an ASSOCIATIVE module fact:
-- `↥ImO` must be SEMISIMPLE over the associative subalgebra `A_I := Algebra.adjoin ℚ (imRep '' I)`
-- generated by the action of a Lie ideal `I`. Mathlib has the isotypic/Schur machinery for
-- semisimple ASSOCIATIVE modules but NO Lie-module → associative-module semisimplicity bridge
-- (W1 BUILD). This file builds it FORWARD as N27's Born-orthogonal complete reducibility
-- transported from the whole derivation algebra to the SUBalgebra `A_I`, proved GENERICALLY:
-- for any symmetric reflexive form `B` whose restriction to every subspace is nondegenerate
-- (the DEFINITE / Born-positivity hypothesis) and any set `S` of `B`-skew-adjoint operators,
-- `V` over `Algebra.adjoin K S` is SEMISIMPLE — every `A`-submodule has the `B`-orthogonal
-- complement as an `A`-submodule complement (`isSemisimpleModule_adjoin`; the orthogonal is
-- `A`-stable by `Algebra.adjoin_induction` since `A` is generated by skew-adjoint operators,
-- `adjoin_stable_orthogonal`/`skewAdjoint_mapsTo_orthogonal`, and a genuine complement because
-- `B` is definite, `isCompl_of_restrictScalars`). The bridge `semisimpleModule_imRep_adjoin` is
-- the instantiation at `V = ↥ImO`, `B = gBil.restrict ImO` (definite by the banked Born
-- anisotropy `gForm_self_eq_zero`, `gImO_restrict_nondegenerate`), `S = imRep '' I` (skew-adjoint
-- by the banked N28 `restrictOp_skew`, `imRep_isSkewAdjoint_gImO`). NO posited `G₂`;
-- `IsSemisimpleModule`/`ComplementedLattice`/`Submodule A`/`Algebra.adjoin`/`Module.End`/
-- `BilinForm.orthogonal` are MACHINERY on the derived object (STANDARD §3).
#print axioms Phys.Algebra.skewAdjoint_mapsTo_orthogonal
#print axioms Phys.Algebra.adjoin_stable_orthogonal
#print axioms Phys.Algebra.isCompl_of_restrictScalars
#print axioms Phys.Algebra.orthogonalASubmodule
#print axioms Phys.Algebra.isSemisimpleModule_adjoin
#print axioms Phys.Algebra.imRep_isSkewAdjoint_gImO
#print axioms Phys.Algebra.gImO_restrict_nondegenerate
#print axioms Phys.Algebra.semisimpleModule_imRep_adjoin

-- N30b — THE PRIME-7 / ISOTYPIC-SCHUR COLLAPSE ⟹ `IsSimpleOrder (LieIdeal ℚ derivationLieQ)`
-- ⟹ `LieAlgebra.IsSimple ℚ derivationLieQ`. The capstone of the type-G₂/compact-form
-- identification (NO posited G₂). The GENERIC prime-dimension structure-theorem layer is proved
-- over an ABSTRACT subalgebra `A : Subalgebra ℚ (End ℚ V)` (the concrete `A_I` blows up `SMul A_I`
-- typeclass synthesis, so the structure content is abstract; instantiation at `A_I` is cheap):
-- `commutantHom` (an operator commuting with the adjoin generators is `A`-linear — the commutant
-- lever for a commuting ideal), `isotypic_prime_split` (V semisimple over A + every fully-invariant
-- A-submodule ⊥/⊤ + dim_ℚ V PRIME ⟹ V ≃ₗ[A] Fin n → S with (n,dim S) ∈ {(p,1),(1,p)}), and the
-- ↥S-free `prime_split_dichotomy` (EITHER every a∈A is a ℚ-scalar OR V is A-SIMPLE). The W1
-- DISSOLUTION of the heavy Schur branch is `skew_odd_det_zero`: a B-skew-adjoint operator on an
-- ODD-dim nondegenerate space is SINGULAR (det = 0) — so a commuting-ideal generator that lands in
-- the Schur division ring of the simple module yet is skew-adjoint on the odd (7) definite Born
-- space must be 0. The CONCRETE layer: `collapse_Winv`/`collapse_dich` (a fully-invariant A_I-
-- submodule of ↥ImO is ⊥/⊤, via `no_proper_invariant_ImO`), `collapse_scalar_branch` (character
-- branch ⟹ I=⊥ by atom perfectness + faithfulness), `collapse_schur_branch` (Schur branch ⟹ Iᶜ=⊥
-- by skew_odd_det_zero + Schur injectivity + faithfulness). `derivationLieQ_isSimpleOrder` assembles
-- the dichotomy at A_I; `derivationLieQ_isSimple` wires the banked `isSimple_of_isSimpleOrder` (N26).
-- `IsSemisimpleModule`/`IsIsotypic`/`IsSimpleModule`/`Submodule A`/`Algebra.adjoin`/`Module.End`/
-- `BilinForm`/`LinearMap.det` are MACHINERY on the derived object (STANDARD §3); NO posited G₂.
#print axioms Phys.Algebra.Collapse.commutantHom
#print axioms Phys.Algebra.Collapse.skew_odd_det_zero
#print axioms Phys.Algebra.Collapse.finrank_of_linearEquiv_fun
#print axioms Phys.Algebra.Collapse.isotypic_prime_split
#print axioms Phys.Algebra.Collapse.prime_split_dichotomy
#print axioms Phys.Algebra.collapse_Winv
#print axioms Phys.Algebra.collapse_dich
#print axioms Phys.Algebra.collapse_scalar_branch
#print axioms Phys.Algebra.gBil_ImO_nondegenerate
#print axioms Phys.Algebra.collapse_schur_branch
#print axioms Phys.Algebra.derivationLieQ_isSimpleOrder
#print axioms Phys.Algebra.derivationLieQ_isSimple

-- N31 — THE AUTOMORPHISM GROUP of the terminal algebra, increment 1 (DEFINE + SEED). The Lie
-- GROUP whose Lie algebra is the banked simple type-G₂ `derivationLieQ` (N30b): the algebra-
-- automorphism group `AutO` of `O ℚ`, realized as a `Subgroup` of the ℚ-linear automorphism
-- group `(O ℚ ≃ₗ[ℚ] O ℚ)` carved by the multiplicative-and-unital predicate `IsAlgAut` (NO
-- posited G₂/Aut — `O ℚ` is non-associative, so there is no `Algebra ℚ (O ℚ)`/Mathlib `AlgEquiv`
-- to import and assert against; the structure is built FORWARD, `Subgroup`/`LinearEquiv` are
-- MACHINERY on the derived object, STANDARD §3). The forward SEED facts derived from the banked
-- algebra-level results: `octo_quadratic` (every element satisfies a monic quadratic over ℚ·1,
-- coefficients the banked trace + Born self-overlap), `aut_reQ` (an automorphism PRESERVES the
-- real part — the nontrivial step, via the quadratic), `aut_star` (commutes with conjugation),
-- `aut_gForm` (★★ PRESERVES the Born self-overlap form — the group analogue of the infinitesimal
-- skew-adjointness `derivationLieQ_le_skewAdjoint`, the SAME Born positivity integrated; ONE
-- cause), `aut_mapsTo_ImO` (preserves the trace-zero subspace `ImO`), `aut_map_one` (fixes the
-- unit). Group closure `isAlgAut_one`/`isAlgAut_mul`/`isAlgAut_inv` ⟹ `AutO`, non-vacuous
-- (`one_mem_AutO`). The analytic exp-over-`ContinuumQ.Cut` + compactness are childed. NO posited
-- G₂, NO bridge.
#print axioms Phys.Algebra.octo_quadratic
#print axioms Phys.Algebra.selfMul_eq_smul
#print axioms Phys.Algebra.aut_quad_diff
#print axioms Phys.Algebra.aut_reQ
#print axioms Phys.Algebra.aut_star
#print axioms Phys.Algebra.aut_gForm
#print axioms Phys.Algebra.aut_mapsTo_ImO
#print axioms Phys.Algebra.aut_map_one
#print axioms Phys.Algebra.isAlgAut_one
#print axioms Phys.Algebra.isAlgAut_mul
#print axioms Phys.Algebra.isAlgAut_inv
#print axioms Phys.Algebra.AutO
#print axioms Phys.Algebra.one_mem_AutO
#print axioms Phys.Algebra.AutO_reQ
#print axioms Phys.Algebra.AutO_star
#print axioms Phys.Algebra.AutO_gForm
#print axioms Phys.Algebra.AutO_mapsTo_ImO

-- N32 — THE AUTOMORPHISM GROUP, increment 2: the continuum-free COMPACTNESS SKELETON (the
-- orthogonal-group / boundedness core). W9 MEASURE-FIRST (workbench/N32-aut-exp/PREREG.md):
-- the derived ℝ `ContinuumQ.Cut` carries Field+LinearOrder+IsStrictOrderedRing but NO
-- TopologicalSpace/NormedField/Archimedean, and Mathlib's `exp` wants a topological/normed
-- field — so the analytic exp `Der(𝕆) → Aut(𝕆)` is a genuine W1 BUILD of an analytic sub-tower
-- over the derived ℝ, childed (N33). But the COMPACTNESS has a continuum-free algebraic heart,
-- banked here: in the `gForm`-orthonormal coordinate frame `bO` (N24), the banked
-- form-preservation `aut_gForm` (N31) makes every automorphism an ISOMETRY. `gForm_polar` (★ the
-- Born self-overlap form IS the inner product in the frame: `gForm v w = ∑ coordO v i · coordO w i`,
-- polarizing N24's `gForm_self_sum_sq`), `gForm_orthonormal` (the frame is orthonormal),
-- `coordO_bO`; `aut_col_unit` (★ each coordinate column of an automorphism is a unit vector),
-- `aut_col_orthogonal` (★ the columns are mutually orthonormal — the algebraic `MᵀM = I`),
-- `aut_entry_sq_le_one`/`aut_entry_abs_le_one` (★★ THE BOUNDEDNESS: every coordinate entry has
-- `|entry| ≤ 1` — the algebraic skeleton of COMPACTNESS, from the definite Born form, ONE cause
-- with the skew-adjointness). Member-level corollaries on `AutO` + non-vacuity (the identity
-- saturates the bound, `one_entry_diag = 1`). NO posited exp/G₂/Aut/orthogonal-group, NO Mathlib
-- ℝ as content, NO bridge.
#print axioms Phys.Algebra.gForm_add_right
#print axioms Phys.Algebra.gForm_smul_right
#print axioms Phys.Algebra.gForm_add_left
#print axioms Phys.Algebra.gForm_smul_left
#print axioms Phys.Algebra.gForm_polar
#print axioms Phys.Algebra.coordO_bO
#print axioms Phys.Algebra.gForm_orthonormal
#print axioms Phys.Algebra.aut_col_unit
#print axioms Phys.Algebra.aut_col_orthogonal
#print axioms Phys.Algebra.aut_entry_sq_le_one
#print axioms Phys.Algebra.aut_entry_abs_le_one
#print axioms Phys.Algebra.AutO_col_unit
#print axioms Phys.Algebra.AutO_col_orthogonal
#print axioms Phys.Algebra.AutO_entry_abs_le_one
#print axioms Phys.Algebra.one_col_unit

-- N33 — THE ANALYTIC SUB-TOWER, increment 3 (3a): the ORDER-COMPLETENESS of the DERIVED ℝ in
-- Mathlib's STANDARD idiom. The genuine W1 BUILD the N32 compactness measurement forced (the derived
-- ℝ `ContinuumQ.Cut` carried no topology). N6/N10–N14 banked the bespoke Dedekind completeness
-- (`completion_coherence_closed`: every gather has a coherence point = the union cut); this re-expresses
-- it as the standard least-upper-bound property and assembles `ConditionallyCompleteLinearOrder Cut`.
-- `sSupCutS` (the union of lower sets of a `Set Cut`), `sSupCutGather` (★ the union of a nonempty
-- bounded family of cuts is a cut — a verbatim port of the `hgather` block of
-- `completion_coherence_closed`; the `nomax` up-step IS C6 eternal approach), the `SupSet` instance,
-- `isLUB_csSupCut` (★★ union cut = LEAST UPPER BOUND, the completeness in standard form),
-- `not_bddAbove_univ` (the derived ℝ has no greatest element), and `condCompleteLinearOrder`
-- (★★ the derived ℝ is a `ConditionallyCompleteLinearOrder`). This unlocks the standard ORDER TOPOLOGY
-- and Heine–Borel (`isCompact_Icc`) on the DERIVED ℝ as MACHINERY (STANDARD §3 — a property OF the
-- derived ℝ, not a posited number system / topology / exp). NO posited ℝ/topology/exp/G₂, NO Mathlib ℝ
-- as content, NO bridge. The analytic exp `Der(𝕆) → Aut(𝕆)` + topological compactness via Heine–Borel
-- childed (N34) onto the chain tail.
#print axioms Phys.Foundation.ContinuumQ.sSupCutS
#print axioms Phys.Foundation.ContinuumQ.sSupCutGather
#print axioms Phys.Foundation.ContinuumQ.csSupCut
#print axioms Phys.Foundation.ContinuumQ.csSupCut_eq
#print axioms Phys.Foundation.ContinuumQ.csSupCut_eq_zero
#print axioms Phys.Foundation.ContinuumQ.isLUB_csSupCut
#print axioms Phys.Foundation.ContinuumQ.not_bddAbove_univ
#print axioms Phys.Foundation.ContinuumQ.condCompleteLinearOrder
#print axioms Phys.Algebra.one_entry_diag

-- N34 — THE AUTOMORPHISM GROUP, increment 4: the TOPOLOGY RUNG on the DERIVED ℝ + the Heine–Borel
-- TOPOLOGICAL COMPACTNESS of the automorphism group over the DERIVED continuum `ContinuumQ.Cut`.
-- W9 MEASURE-FIRST (workbench/N34-operator-exp/PREREG.md): with N33's `ConditionallyCompleteLinearOrder
-- Cut`, the standard ORDER TOPOLOGY (`Preorder.topology`, `OrderTopology` by rfl) is reachable cheaply
-- as MACHINERY, giving `T2Space`, `IsTopologicalRing` (continuous field ops), `CompactIccSpace` ⟹
-- ★★ Heine–Borel `isCompact_Icc_cut`, and finite-product box compactness `isCompact_box` — all on the
-- DERIVED ℝ (STANDARD §3: a property OF the derived ℝ, not a posited topology/number system). The
-- ANALYTIC operator-exp `Der(𝕆) → Aut(𝕆)` (Cauchy-completeness/tsum/exp∈Aut/d-dt) is the genuine
-- multi-file W1 analytic BUILD, childed (N35). The COMPACTNESS, banked here over the derived ℝ:
-- `bornIsometrySet` (the `MᵀM = I` matrices over `Cut` = Born-form preservation in the bO frame),
-- `bornIsometry_isClosed` (intersection of continuous-bilinear level sets, Hausdorff),
-- `matBox_isCompact` (Heine–Borel per factor + finite Tychonoff), `bornIsometry_subset_box` (the
-- diagonal condition bounds each entry — N32 boundedness over Cut), ★★ `bornIsometry_isCompact`
-- (closed ⊆ compact box ⟹ COMPACT), ★ `autMatrix_mem_bornIsometry` (the banked AutO coordinate image,
-- cast ℚ→Cut, lands in the compact set — transporting `AutO_col_orthogonal` N32) + identity
-- non-vacuity. ONE cause: the SAME definite Born positivity (self-overlap) that gave skew-adjointness
-- (N26), simplicity (N30b) and entry-boundedness (N32) now gives topological COMPACTNESS once the
-- derived ℝ is order-complete (N33) + carries the order topology (N34). NO posited exp/G₂/Aut/
-- orthogonal-group, NO Mathlib ℝ as content, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.isCompact_Icc_cut
#print axioms Phys.Foundation.ContinuumQ.isCompact_box
#print axioms Phys.Foundation.ContinuumQ.t2Space_cut
#print axioms Phys.Foundation.ContinuumQ.isTopologicalRing_cut
#print axioms Phys.Foundation.ContinuumQ.compactIccSpace_cut
#print axioms Phys.Algebra.entry_continuous
#print axioms Phys.Algebra.colBilin_continuous
#print axioms Phys.Algebra.bornIsometry_isClosed
#print axioms Phys.Algebra.matBox_isCompact
#print axioms Phys.Algebra.bornIsometry_subset_box
#print axioms Phys.Algebra.bornIsometry_isCompact
#print axioms Phys.Algebra.autMatrix_mem_bornIsometry
#print axioms Phys.Algebra.one_autMatrix_mem_bornIsometry
-- N35 — THE AUTOMORPHISM GROUP, increment 5: the ARCHIMEDEAN / C6-eternal-approach analytic
-- FOUNDATION RUNG of the DERIVED ℝ `ContinuumQ.Cut` — the first analytic rung the operator-exp
-- tower rests on, BELOW the metric/uniform structure. W9 MEASURE-FIRST (workbench/N35-operator-exp/
-- PREREG.md + probes, all exit 0 ~8s) established the scope: UniformSpace/MetricSpace/CompleteSpace
-- Cut do NOT synthesize and there is no generic metric-from-order-topology — the metric/uniform/
-- Cauchy-complete + operator-norm + tsum-exp + exp∈AutO + d/dt core is the genuine multi-file W1
-- analytic BUILD, childed (N36). Banked here, the cheaply-reachable analytic foundation:
-- `instArchimedeanCut` (the derived ℝ is ARCHIMEDEAN — the C6 eternal-approach / no-infinite-element
-- fact, as MACHINERY via `ConditionallyCompleteLinearOrderedField.to_archimedean` on the banked
-- Field + ConditionallyCompleteLinearOrder (N33) + IsStrictOrderedRing, a property OF the derived ℝ,
-- STANDARD §3), `cut_exists_nat_gt` (the explicit no-infinite-element form), and the C6 eternal-
-- approach read as analytic CONVERGENCE with NO metric — `cut_tendsto_atTop_ciSup`/`ciInf`/`isLUB`
-- (bounded monotone sequences converge to their sup/inf in the banked order topology N34; the
-- bounded approach eternally tends to its LUB coherence point, banked N33 `isLUB_csSupCut`) +
-- non-vacuity witnesses. ONE cause: the SAME C6 eternal-approach that built the cut and gave order-
-- completeness (N33) and the order topology (N34) now gives the Archimedean property + the analytic
-- limit. NO posited exp/G₂/Aut/metric/number-system, NO Mathlib ℝ as content, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.instArchimedeanCut
#print axioms Phys.Foundation.ContinuumQ.cut_exists_nat_gt
#print axioms Phys.Foundation.ContinuumQ.cut_tendsto_atTop_ciSup
#print axioms Phys.Foundation.ContinuumQ.cut_tendsto_atTop_ciInf
#print axioms Phys.Foundation.ContinuumQ.cut_tendsto_atTop_isLUB
#print axioms Phys.Foundation.ContinuumQ.cut_one_lt_two_nat
#print axioms Phys.Foundation.ContinuumQ.cut_const_tendsto
-- N36 — THE AUTOMORPHISM GROUP, increment 6: the UNIFORM STRUCTURE on the DERIVED ℝ
-- `ContinuumQ.Cut` (the trunk-native group uniformity), with TOPOLOGY AGREEMENT to the banked
-- order topology. W9 MEASURE-FIRST (workbench/N36-operator-exp/PREREG.md + probes, all exit 0 ~7s)
-- + W1 REFRAME-THROUGH-THE-TRUNK DISSOLVED the feared hard part: the N35 measurement isolated "a
-- PseudoMetricSpace Cut with dist=|x-y| whose induced topology = Preorder.topology Cut" — but that
-- route is also a CONTENT trap (Mathlib's dist is ℝ-valued, casting |x-y|:Cut into ℝ = importing ℝ).
-- The trunk dodges BOTH: Cut is a banked TOPOLOGICAL RING (N34) ⟹ IsTopologicalAddGroup ⟹ the
-- CANONICAL GROUP UNIFORMITY `IsTopologicalAddGroup.rightUniformSpace` whose toTopologicalSpace
-- equals the banked instTopologicalSpaceCut BY rfl — NO ℝ-valued metric, NO replaceTopology, NO
-- content import. Banked: `instUniformSpaceCut` (the group uniformity), ★ `cut_uniformSpace_
-- toTopologicalSpace_eq` (the topology AGREEMENT, by construction), `instIsUniformAddGroupCut`
-- (left=right uniformity coincide, the comm case), `cut_uniformity_eq` (the order-native explicit
-- uniformity — entourages = "difference near 0"), + non-vacuity `cut_tsum_statable` (tsum
-- expressible) / `cut_const_cauchySeq` (constant seq Cauchy — the uniform structure non-degenerate).
-- ONE cause: the SAME C6 eternal-approach that built the cut + order-completeness (N33) + the order
-- topology + topological-ring continuity (N34) + Archimedean/convergence (N35) now gives the uniform
-- refinement. CompleteSpace + operator-norm + tsum-exp + exp∈AutO + d/dt childed (N37). NO posited
-- exp/G₂/Aut/metric/number-system, NO Mathlib ℝ as content, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.instUniformSpaceCut
#print axioms Phys.Foundation.ContinuumQ.cut_uniformSpace_toTopologicalSpace_eq
#print axioms Phys.Foundation.ContinuumQ.instIsUniformAddGroupCut
#print axioms Phys.Foundation.ContinuumQ.cut_uniformity_eq
#print axioms Phys.Foundation.ContinuumQ.cut_tsum_statable
#print axioms Phys.Foundation.ContinuumQ.cut_const_cauchySeq
-- N37 — THE AUTOMORPHISM GROUP, increment 7: `CompleteSpace Cut` — the CAUCHY-COMPLETENESS of the
-- DERIVED ℝ `ContinuumQ.Cut`, the analytic completeness rung the operator-exp power series rests on.
-- W9 MEASURE-FIRST (workbench/N37-operator-exp/PREREG.md + probe1..6, all exit 0 ~7-9s — the full
-- CompleteSpace proof measured clean at 7.4s before production). W1 REFRAME-THROUGH-THE-TRUNK:
-- Mathlib's `CompleteSpace ℝ` goes through `CauSeq` + an ℝ-VALUED metric — a CONTENT trap here
-- (casting |x-y|:Cut into ℝ = importing ℝ). The trunk dodges it: completeness IS the banked C6
-- eternal-approach one level up, closing from TWO banked trunk facts with NO metric: (i) the nhds
-- filter at 0 has the countable basis {|x| < 1/(n+1)} — the eternal approach by reciprocals of the
-- Archimedean naturals (N35) — so `𝓝 0` and hence `𝓤 Cut` (N36) is IsCountablyGenerated
-- (FirstCountableTopology Cut does NOT synth; this BUILD supplies it); (ii) a Cauchy seq is BOUNDED,
-- so it lives in a banked-COMPACT closed Icc (N34 Heine–Borel), has a convergent subsequence, and —
-- being Cauchy — converges. `UniformSpace.complete_of_cauchySeq_tendsto` assembles them. Banked:
-- `cut_nhds_zero_countablyGenerated` (the C6 eternal-approach as countable nearness),
-- `cut_uniformity_countablyGenerated` (via comap), `cut_uniformity_hasBasis_abs` (the order-native
-- abs entourage basis), `cauchySeq_bddAbove_range`/`cauchySeq_bddBelow_range` (Cauchy ⟹ bounded),
-- ★★ `instCompleteSpaceCut` (THE TARGET — CompleteSpace Cut), + non-vacuity `cut_const_tendsto_complete`/
-- `cut_cauchySeq_const_converges`. ONE cause: the SAME C6 eternal-approach that built the cut (N6),
-- order-completeness (N33), the order topology + Heine–Borel (N34), the Archimedean/convergence rung
-- (N35), and the uniform structure (N36) now closes Cauchy completeness. operator-norm + tsum-exp +
-- exp∈AutO + d/dt childed (N38). NO posited exp/G₂/Aut/metric/CauSeq/number-system, NO Mathlib ℝ as
-- content, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.cut_nhds_zero_countablyGenerated
#print axioms Phys.Foundation.ContinuumQ.cut_uniformity_countablyGenerated
#print axioms Phys.Foundation.ContinuumQ.cut_uniformity_hasBasis_abs
#print axioms Phys.Foundation.ContinuumQ.cauchySeq_bddAbove_range
#print axioms Phys.Foundation.ContinuumQ.cauchySeq_bddBelow_range
#print axioms Phys.Foundation.ContinuumQ.instCompleteSpaceCut
#print axioms Phys.Foundation.ContinuumQ.cut_const_tendsto_complete
#print axioms Phys.Foundation.ContinuumQ.cut_cauchySeq_const_converges

-- N38 — THE AUTOMORPHISM GROUP, increment 8 (part b): the Cut-VALUED OPERATOR NORM on the 8×8
-- coordinate matrices over the DERIVED ℝ `ContinuumQ.Cut`, the magnitude against which the
-- exponential series `∑ Dⁿ/n!` will converge (the first rung of the operator-exp core). W9
-- MEASURE-FIRST (workbench/N38-operator-exp/PREREG.md + probe1..3, each `lake env lean` ~2s user
-- CPU — submultiplicativity closes with ABSTRACT Finset lemmas, never Fin 8 expansion / decide /
-- ring). W1 / THE-ONE-LAW REFRAME-THROUGH-THE-TRUNK (the content-trap dodge): Mathlib's
-- `Norm`/`NormedRing`/`NormedSpace` typeclass is ℝ-VALUED (`norm : α → ℝ`) — instantiating it would
-- cast a Cut-valued magnitude into Mathlib's ℝ = importing ℝ as CONTENT (the SAME trap the metric
-- N35→N36 and Cauchy-completeness N37 dodged). The trunk dodges it again: `opNorm : Matrix … Cut →
-- Cut` is a Cut-VALUED function built from the order-native `abs` on the derived ℝ + finite
-- `Finset.sum` — pure MACHINERY on the DERIVED Cut, NO `Norm` typeclass, NO ℝ. THE NORM:
-- `opNorm M = ∑ᵢⱼ |Mᵢⱼ|` (entrywise ℓ¹), submultiplicative with NO dimension factor — so
-- `opNorm (Dⁿ) ≤ (opNorm D)ⁿ`, the convergence-controlling property for the next increment. Banked:
-- `opNorm_nonneg`, `opNorm_zero`, `opNorm_eq_zero` (definiteness — a genuine norm), `entry_abs_le_opNorm`
-- (dominates each entry), `opNorm_add_le` (triangle), `opNorm_smul` (absolute homogeneity),
-- ★★ `opNorm_mul_le` (SUBMULTIPLICATIVITY — the load-bearing convergence seed), `opNorm_pow_le`
-- (series-term bound, n≥1), `opNorm_autMatrix_le` (≤ 64, the N32 unit-box: 64 entries each |·| ≤ 1),
-- `opNorm_one` (= 8, non-vacuity — the norm is not the zero map, and 8 ≰ 1 is why the power bound
-- needs n ≥ 1). ONE cause: the SAME Born positivity that made every derivation skew-adjoint (N26),
-- forced the simple type-G₂ Lie algebra (N24/N30b), bounded every automorphism entry (N32), and made
-- the automorphism group topologically compact (N34), read through the `abs` of the derived ℝ now
-- gives the Cut-valued submultiplicative norm. tsum-exp + exp∈AutO + d/dt childed (N39). NO posited
-- exp/G₂/Aut/metric/norm-system, NO Mathlib ℝ as content, NO ℝ-valued Norm typeclass, NO bridge.
#print axioms Phys.Algebra.opNorm_nonneg
#print axioms Phys.Algebra.opNorm_zero
#print axioms Phys.Algebra.opNorm_eq_zero
#print axioms Phys.Algebra.entry_abs_le_opNorm
#print axioms Phys.Algebra.opNorm_add_le
#print axioms Phys.Algebra.opNorm_smul
#print axioms Phys.Algebra.opNorm_mul_le
#print axioms Phys.Algebra.opNorm_pow_le
#print axioms Phys.Algebra.opNorm_autMatrix_le
#print axioms Phys.Algebra.opNorm_one

-- N39 — THE AUTOMORPHISM GROUP, increment 9 (part c): the POWER-SERIES EXP `exp(D) = ∑ Dⁿ/n!`
-- CONVERGES over the DERIVED ℝ `ContinuumQ.Cut` — the analytic core completing `Der(𝕆) → Aut(𝕆)`.
-- W9 MEASURE-FIRST (workbench/N39-operator-exp/PREREG.md + probe1..11, each `lake env lean` ≤ 3s user
-- CPU). W1 / THE-ONE-LAW REFRAME-THROUGH-THE-TRUNK (the content-trap dodge, CONFIRMED): Mathlib's
-- standard convergence machinery is ℝ-VALUED — `Summable.of_norm_bounded`, `Summable.of_nonneg_of_le`,
-- `summable_geometric_of_lt_one`, the ratio test all take an ℝ-valued `Norm`/`NormedRing`; using any
-- casts a Cut-valued magnitude into Mathlib's ℝ = importing ℝ as CONTENT (the SAME trap the metric
-- N35→N36 / completeness N37 / operator norm N38 dodged). The trunk dodges it again: every lever is a
-- property OF the derived Cut, proved from order-completeness (N33) + order topology (N34) +
-- Archimedean (N35) + Cauchy-completeness (N37), NO ℝ-valued Norm.
-- PART c·1 (Phys/Foundation/ContinuumSummable.lean) — the 5 scalar summability levers over the derived ℝ:
--   `cut_summable_of_nonneg_of_bddAbove` (nonneg + bounded partial sums ⟹ Summable, via N33 isLUB_csSup
--   + hasSum_of_isLUB_of_nonneg — the C6 eternal-approach as a convergent series), `cut_summable_of_nonneg_of_le`
--   (nonneg comparison test), `cut_summable_of_abs` (absolute convergence via pos/neg parts on the N37
--   Cauchy-complete derived ℝ), `cut_geom_telescope`/`cut_summable_geometric` (0≤r<1 ⟹ Summable rⁿ),
--   `cut_summable_pow_div_factorial` (the analytic crux: 0≤c ⟹ Summable cⁿ/n!, a ratio-test BY HAND
--   dominating the tail from an Archimedean M>c by a geometric majorant) + `cut_summable_one_div_factorial`
--   (non-vacuity).
-- PART c·2 (Phys/Algebra/DerivationAutExp.lean) — the matrix-level convergence: `matrix_summable_of_entrywise`
--   (matrix Summable reduces ENTRYWISE via Pi.summable — the Matrix instances are LITERALLY Pi's, NO ℝ-valued
--   norm), `expTerm` (= (1/n!)•Dⁿ), `expTerm_entry_abs_le` (entry bound via N38 entry_abs_le_opNorm +
--   opNorm_pow_le), ★★ `expTerm_summable` (the matrix exp series ∑ₙ (1/n!)•Dⁿ of any 8×8 coordinate matrix
--   over the derived ℝ is ABSOLUTELY convergent) + `expTerm_summable_one` (non-vacuity).
-- ONE cause: the SAME Born positivity that gave the submultiplicative operator norm (N38) makes the exp
-- series absolutely convergent — the factorial outruns (opNorm D)ⁿ. exp∈AutO + d/dt childed (N40). NO
-- posited exp/G₂, NO Mathlib ℝ as content, NO ℝ-valued Norm, NO Mathlib NormedSpace.exp/Matrix.exp, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.cut_summable_of_nonneg_of_bddAbove
#print axioms Phys.Foundation.ContinuumQ.cut_summable_of_nonneg_of_le
#print axioms Phys.Foundation.ContinuumQ.cut_summable_of_abs
#print axioms Phys.Foundation.ContinuumQ.cut_geom_telescope
#print axioms Phys.Foundation.ContinuumQ.cut_summable_geometric
#print axioms Phys.Foundation.ContinuumQ.cut_summable_pow_div_factorial
#print axioms Phys.Foundation.ContinuumQ.cut_summable_one_div_factorial
#print axioms Phys.Algebra.matrix_summable_of_entrywise
#print axioms Phys.Algebra.expTerm_entry_abs_le
#print axioms Phys.Algebra.expTerm_summable
#print axioms Phys.Algebra.expTerm_summable_one

-- N40 — THE EXPONENTIAL ONE-PARAMETER SUBGROUP over the DERIVED ℝ ContinuumQ.Cut (increment 10).
-- N39 banked `expTerm_summable`: the matrix exponential series exp(D)=∑ₙ (1/n!)•Dⁿ of any 8×8
-- coordinate matrix over the derived ℝ is ABSOLUTELY CONVERGENT. N40 banks the GROUP-THEORETIC
-- content of that exponential: it is a ONE-PARAMETER SUBGROUP of the matrix units —
-- exp(A+B)=exp(A)·exp(B) for COMMUTING A,B, whence exp(D)·exp(-D)=exp(0)=1, so exp(D) is INVERTIBLE
-- with inverse exp(-D). The structure-preserving-bijection (group-membership) property of the
-- matrix exponential, derived coordinate-natively over the derived ℝ.
-- ★ THE ONE LAW (RUNBOOK W5 / STANDARD §4) — WHY THE GROUP-LAW, NOT `∈ AutO`. The banked `AutO`
-- (DerivationAutGroup.lean) is `Subgroup (O ℚ ≃ₗ[ℚ] O ℚ)` — over the RATIONALS. But exp(D) has
-- TRANSCENDENTAL Cut entries (exp of a nonzero rational derivation). A Cut-matrix cannot be an
-- element of a group of ℚ-linear equivalences — `exp(D) ∈ AutO` is literally ill-typed. Returning to
-- the trunk: the MATHEMATICAL CONTENT that "the exponential lands in the automorphism group" asserts,
-- over the derived ℝ, is exactly the one-parameter-subgroup HOMOMORPHISM LAW + INVERTIBILITY. The
-- full algebra-automorphism of `O Cut` (needing a Cut-side automorphism infrastructure, ℚ-only now)
-- and the tangent map d/dt exp(tD)|₀=D are SEPARATE forward nodes, childed onto the chain tail.
-- ★ THE W1 / CONTENT-TRAP REFRAME (MEASURED, NO ℝ-valued norm). The engine is the Cauchy product.
-- Mathlib's `…_of_summable_norm` is ℝ-NORM bound (a CONTENT trap, STANDARD §3). The TRUNK-NATIVE
-- `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` needs only [T3Space][NonUnitalNonAssocSemiring]
-- [IsTopologicalSemiring] — all synthesize on `Matrix (Fin 8) (Fin 8) Cut` with NO norm. So the
-- homomorphism law is the Cauchy product + the binomial identity, entirely over the derived ℝ.
-- PART 1 (Phys/Foundation/ContinuumSummable.lean) — the Cut-native product-summability engine:
--   `cut_summable_of_nonneg_of_bddAbove'`/`_of_le'`/`_of_abs'` (general-index versions of the N39
--   levers, the proofs index-agnostic), ★ `cut_summable_prod_of_nonneg` (nonneg ι×κ product
--   summability — Mathlib's `summable_prod_of_nonneg` is ℝ-ONLY, a content trap; trunk-native via
--   Finset.sum_mul_sum on s.image fst ×ˢ snd), `cut_summable_mul_of_abs` (ℕ-indexed absolute product).
-- PART 2 (Phys/Algebra/DerivationAutExpHom.lean) — the one-parameter subgroup: `expMap D := ∑' n,
--   expTerm D n` (tsum exists by N37 CompleteSpace + N39 summability), `expMap_hasSum`, `expMap_zero`
--   (exp 0 = 1), `matrix_summable_prod_of_entrywise`, `expTerm_entry_abs_summable`,
--   `matrix_prod_summable` (the ℕ×ℕ product family summable), ★ `expTerm_antidiagonal` (THE BINOMIAL
--   CRUX: ∑_{k+l=n} expTerm A k · expTerm B l = expTerm (A+B) n for Commute A B, via Commute.add_pow'
--   + the scalar choose identity), ★★ `expMap_mul_of_commute` (THE HOMOMORPHISM LAW exp(A)·exp(B)=
--   exp(A+B), trunk-native Cauchy product — NO ℝ-valued norm), ★ `expMap_mul_neg`/`expMap_neg_mul`
--   (THE GL-LANDING exp(D)·exp(-D)=1, exp invertible) + non-vacuity `expMap_one_mul_neg`/`_one_mul_one`.
-- ONE cause (THE ONE LAW): the SAME Born positivity that made the exp series converge (N39, the
-- factorial outrunning the operator norm) is what lets the Cauchy product rearrange absolutely and the
-- binomial identity close — convergence and the group law are the same self-overlap positivity read
-- twice. Costume C62 bites `⊢ Commute A B` (the WRONG claim that the homomorphism law holds for
-- ARBITRARY non-commuting matrices — the dropped Commute hypothesis). NO posited exp/G₂/Aut, NO
-- Mathlib ℝ as content, NO ℝ-valued Norm, NO Mathlib NormedSpace.exp/Matrix.exp, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.cut_summable_of_nonneg_of_bddAbove'
#print axioms Phys.Foundation.ContinuumQ.cut_summable_of_nonneg_of_le'
#print axioms Phys.Foundation.ContinuumQ.cut_summable_of_abs'
#print axioms Phys.Foundation.ContinuumQ.cut_summable_prod_of_nonneg
#print axioms Phys.Foundation.ContinuumQ.cut_summable_mul_of_abs
#print axioms Phys.Algebra.expMap_hasSum
#print axioms Phys.Algebra.expMap_zero
#print axioms Phys.Algebra.matrix_summable_prod_of_entrywise
#print axioms Phys.Algebra.expTerm_entry_abs_summable
#print axioms Phys.Algebra.matrix_prod_summable
#print axioms Phys.Algebra.expTerm_antidiagonal
#print axioms Phys.Algebra.expMap_mul_of_commute
#print axioms Phys.Algebra.expMap_mul_neg
#print axioms Phys.Algebra.expMap_neg_mul
#print axioms Phys.Algebra.expMap_one_mul_neg
#print axioms Phys.Algebra.expMap_one_mul_one

-- N41a — THE ITERATED LEIBNIZ BINOMIAL over the non-associative octonion algebra (increment 11,
--   part a; Phys/Algebra/DerivationLeibnizPow.lean). The ALGEBRAIC CORE of the exponential flow's
--   product-preservation `exp(D)(xy) = exp(D)(x)·exp(D)(y)` — the piece needing NO topology, NO
--   coordinates, NO completeness, only the Leibniz law and binomial combinatorics. For a Leibniz
--   derivation `D` of the Cayley–Dickson double-of-a-double `CD (CD B)` (so `O Cut` verbatim):
--       `Dⁿ(x·y) = ∑_{k+l=n} C(n,k)·(Dᵏx · Dˡy)`,
--   the algebra-side analogue of the banked matrix `expTerm_antidiagonal`. Because the octonion
--   product is non-associative AND non-commutative we CANNOT use `Commute.add_pow'`; the binomial is
--   proved by a DIRECT induction driven by the Leibniz split `D(Dᵏx·Dˡy)=D^{k+1}x·Dˡy+Dᵏx·D^{l+1}y`
--   (`dterm_split`, the ONLY place `IsDeriv` enters) and a pure ℕ-scalar Pascal identity
--   (`pascal_smul_sum`). ★ ONE cause (THE ONE LAW): the SAME Leibniz bilinearity that made `Der(𝕆)`
--   a Lie algebra (`isDeriv_bracket`, order 1) integrates to the binomial flow on a product (order n)
--   — non-associativity is no obstruction because every step is a bilinear distributive identity,
--   never an associative one. Costume C63 bites `⊢ IsDeriv D` (the WRONG claim that the binomial
--   holds for an ARBITRARY endomorphism — the dropped Leibniz hypothesis). Non-vacuity:
--   `iter_leibniz_two` exhibits the genuine `C(2,1)=2` cross-term `2•(Dx·Dy)`. NO posited
--   exp/G₂/Aut, NO Mathlib ℝ as content, NO bridge.
#print axioms Phys.Algebra.pascal_smul_sum
#print axioms Phys.Algebra.dpow_succ_apply
#print axioms Phys.Algebra.dterm_split
#print axioms Phys.Algebra.iter_leibniz_range
#print axioms Phys.Algebra.iter_leibniz_antidiag
#print axioms Phys.Algebra.iter_leibniz_two

-- N41b — THE TOPOLOGICAL `*`-ALGEBRA STRUCTURE on the octonion algebra `O Cut` over the DERIVED ℝ
--   (increment 11, part b; Phys/Cascade/OctonionTopology.lean). The FOUNDATIONAL ANALYTIC RUNG that
--   the literal `O Cut` automorphism `exp(D)(xy)=exp(D)(x)·exp(D)(y)` and the derivative
--   `d/dt exp(tD)|₀=D` (childed N41c) stand on: a complete uniform topological `*`-algebra structure
--   on the 8-dimensional non-associative `O Cut = CD (CD (Dbl Cut))`, built ENTIRELY by transfer from
--   the banked complete-uniform-topological-ring structure on the derived ℝ `ContinuumQ.Cut`
--   (N33–N37). Each Cayley–Dickson double `CD A` / rung-1 double `Dbl R` carries the COMPLETELY
--   INDUCED uniform structure `UniformSpace.comap toProd` pulled back along the pair projection
--   `toProd : CD A → A × A`; the induced topology equals the order-pullback by `rfl` (NO topology/
--   uniformity diamond), and CompleteSpace / T2 / T3 / ContinuousAdd/Neg/Mul/Star/SMul /
--   IsTopologicalSemiring all transfer structurally because the doubled operations are continuous
--   `Cut`-polynomials in the (continuous) base operations. ★ ONE cause (THE ONE LAW): the SAME
--   Born-positivity completion that made `Cut` a complete uniform topological ring (the C6
--   eternal-approach as Cauchy-completeness) propagates up every rung of the cascade unchanged —
--   completeness and continuity of the base lift to every Cayley–Dickson double. ★ THE NON-
--   ASSOCIATIVITY IS NO OBSTRUCTION: continuity is a statement about the BILINEAR product map, not
--   reassociation, so the topological structure survives non-associativity exactly as the derivation
--   Lie algebra (N6) and the iterated Leibniz binomial (N41a) do. `IsTopologicalSemiring (O Cut)` is
--   the precise hypothesis the trunk-native Cauchy product `tsum_mul_tsum_eq_tsum_sum_antidiagonal`
--   consumes — established with NO ℝ-valued `Norm`, NO Mathlib ℝ as content. Costume C64
--   (OctonionTopologyDiscreteCostume) bites the WRONG claim that the genuine induced topology on
--   `O Cut` is the DISCRETE topology `⊥` (under which every continuity/separation theorem would be
--   vacuous) — it reduces via `CD.topology_eq_induced` to the unsatisfiable
--   `TopologicalSpace.induced CD.toProd inferInstance = ⊥`. NO posited topology/metric/norm, NO
--   Mathlib ℝ as content, NO bridge.
#print axioms Phys.Cascade.Dbl.toProd_injective
#print axioms Phys.Cascade.Dbl.instUniformSpace
#print axioms Phys.Cascade.Dbl.topology_eq_induced
#print axioms Phys.Cascade.Dbl.isUniformInducing_toProd
#print axioms Phys.Cascade.Dbl.continuous_mk
#print axioms Phys.Cascade.Dbl.instCompleteSpace
#print axioms Phys.Cascade.Dbl.instT2Space
#print axioms Phys.Cascade.Dbl.instT3Space
#print axioms Phys.Cascade.Dbl.instContinuousAdd
#print axioms Phys.Cascade.Dbl.instContinuousNeg
#print axioms Phys.Cascade.Dbl.instContinuousStar
#print axioms Phys.Cascade.Dbl.instContinuousMul
#print axioms Phys.Cascade.Dbl.instContinuousSMul
#print axioms Phys.Cascade.CD.toProd_injective
#print axioms Phys.Cascade.CD.instUniformSpace
#print axioms Phys.Cascade.CD.topology_eq_induced
#print axioms Phys.Cascade.CD.isUniformInducing_toProd
#print axioms Phys.Cascade.CD.continuous_mk
#print axioms Phys.Cascade.CD.instCompleteSpace
#print axioms Phys.Cascade.CD.instT2Space
#print axioms Phys.Cascade.CD.instT3Space
#print axioms Phys.Cascade.CD.instContinuousAdd
#print axioms Phys.Cascade.CD.instContinuousNeg
#print axioms Phys.Cascade.CD.instContinuousStar
#print axioms Phys.Cascade.CD.instContinuousMul
#print axioms Phys.Cascade.CD.instSMul
#print axioms Phys.Cascade.CD.instContinuousSMul
#print axioms Phys.Cascade.instIsTopologicalSemiring
#print axioms Phys.Cascade.oCut_t2Space
#print axioms Phys.Cascade.oCut_t3Space
#print axioms Phys.Cascade.oCut_completeSpace
#print axioms Phys.Cascade.oCut_continuousAdd
#print axioms Phys.Cascade.oCut_continuousMul
#print axioms Phys.Cascade.oCut_continuousStar
#print axioms Phys.Cascade.oCut_continuousSMul
#print axioms Phys.Cascade.oCut_isTopologicalSemiring
#print axioms Phys.Cascade.oCut_t2_nonvacuous
#print axioms Phys.Cascade.oCut_isEmbedding
-- N41c — THE VECTOR EXPONENTIAL on `O Cut` + THE CAUCHY-PRODUCT PRODUCT-PRESERVATION (increment 11,
--   part c; Phys/Algebra/DerivationOExp.lean). THE ANALYTIC INTEGRATION completing the literal
--   `O Cut` algebra-automorphism: the vector exponential `expO D x := ∑' n, (1/n!)•(Dⁿ x)` on the
--   non-associative `O Cut = CD (CD (Dbl Cut))`, and the literal product-preservation
--   `expO D (x·y) = expO D x · expO D y` for a Leibniz derivation `D` (given convergence). The
--   per-`n` algebraic integration `expO_term_antidiag` combines the banked N41a iterated-Leibniz
--   binomial `Dⁿ(x·y) = ∑ C(n,k)•(Dᵏx·Dˡy)` with the smul-centrality bundle `smulCompat_oCut`
--   (the bilinearity of `•` over `·`, lifted up the cascade, surviving non-associativity exactly as
--   N41a's binomial and N6's bracket do) and the scalar identity `C(n,k)/n!=1/(k!·l!)`, rewriting
--   `(1/n!)•(Dⁿ(x·y))` to the antidiagonal of products of exponential terms; `expO_mul_of_summable`
--   passes this to the `tsum` limit by the trunk-native Cauchy product
--   `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` over the banked N41b topological semiring
--   `O Cut` (oCut_t3Space + oCut_completeSpace + oCut_isTopologicalSemiring + oCut_continuousMul),
--   with NO ℝ-valued `Norm`. `Module Cut (O Cut)` (the `(1/n!)•` action) is built by transfer up the
--   cascade (defeq to the `CD.instSMul` N41b's `oCut_continuousSMul` is stated over). ★ ONE cause
--   (THE ONE LAW): the SAME Leibniz bilinearity that made `Der(𝕆)` a Lie algebra (N6, order 1) and
--   gave the iterated binomial (N41a, order n) integrates — once N41b's topological ground lets the
--   finite identity pass to the limit — to the product-preservation of the flow (order ∞).
--   `expO_term_antidiag_one` exhibits the `n=1` integration collapsing EXACTLY to the Leibniz law
--   `D(x·y) = D x · y + x · D y` (the derivative seed). The three summability hypotheses are honest
--   analytic prerequisites scoped to the dedicated SUMMABILITY node (childed N41d, the Cut-side
--   coordinatization transporting the banked N39 operator-norm majorant) — explicit hypotheses of a
--   fully proved conditional implication, never an unproven assertion.
--   Costume C65 (DerivationOExpNoDerivCostume) bites the WRONG claim that the per-`n` exponential
--   product-integration holds for an ARBITRARY endomorphism `D` — routing through `expO_term_antidiag`
--   leaves the undischargeable `IsDeriv D`. NO posited exp/`G₂`/`Aut`/metric/norm, NO Mathlib ℝ as
--   content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO bridge.
#print axioms Phys.Algebra.SmulCompat
#print axioms Phys.Algebra.smulCompat_cd
#print axioms Phys.Algebra.smulCompat_dbl_cut
#print axioms Phys.Algebra.smulCompat_oCut
#print axioms Phys.Algebra.dblModuleCut
#print axioms Phys.Algebra.cdModuleCut
#print axioms Phys.Algebra.instModuleCutH
#print axioms Phys.Algebra.instModuleCutO
#print axioms Phys.Algebra.expO
#print axioms Phys.Algebra.expO_zero
#print axioms Phys.Algebra.expO_term_antidiag
#print axioms Phys.Algebra.expO_mul_of_summable
#print axioms Phys.Algebra.expO_term_antidiag_one
#print axioms Phys.Algebra.isDeriv_witness_exists
-- N41d — THE CUT-SIDE COORDINATIZATION + THE UNCONDITIONAL SUMMABILITY of the `O Cut` vector
--   exponential series (increment 11, part d; Phys/Algebra/DerivationOExpSummable.lean). Discharges
--   the GATING dependency of N41c's conditional product-preservation: the two vector-exponential
--   series converge UNCONDITIONALLY. `coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut)` is the Cut-side
--   coordinate frame (the EXACT analogue of the banked ℚ-side `coordO`/`bO`, now over the derived ℝ
--   `Cut`), CONTINUOUS both ways over the N41b uniform topology (each of the 8 coordinate components is
--   a composition of the banked `CD.continuous_re/im`, `Dbl.continuous_re/im`). For a `Cut`-linear
--   endomorphism `D'` of `O Cut`, `expO_matrix_rep` transports the endomorphism power to the
--   coordinate-matrix power `coordOCut ((D'ⁿ) x) = (derivMatrix D')ⁿ *ᵥ coordOCut x` (via `map_pow` of
--   the `toMatrixAlgEquiv'` algebra-iso + `map_pow` of the `conjRingEquiv` ring-iso + `toMatrix'_mulVec`),
--   and `expO_term_coord` transports the `n`-th exponential term to the banked N39 matrix `expTerm`.
--   ★★ `expO_summable` is then the UNCONDITIONAL summability of `n ↦ (1/n!)•((D'ⁿ) x)`: its image under
--   the continuous `coordOCut` is `n ↦ expTerm (derivMatrix D') n *ᵥ coordOCut x`, summable because the
--   matrix series `expTerm` is summable (banked N39 `expTerm_summable`, the `Cut`-valued operator-norm
--   factorial majorant `opNorm = ∑ᵢⱼ|Mᵢⱼ|`) and `(· *ᵥ v)` is a continuous additive map (`mulVecHom`);
--   transported back by the continuous `coordOCut.symm`. ★ THE ONE LAW: the octonion-valued exponential
--   convergence is not bashed analytically — it reduces, through the coordinate frame the same Born-positive
--   structure provides, to the already-banked matrix-series convergence whose majorant is the Cut-valued
--   operator norm. `expO_summable_restrict` carries it to the `ℤ`-restriction `D'.restrictScalars ℤ` (same
--   underlying powers) — the form N41c's `expO` consumes. NON-VACUITY `expO_summable_one` (the identity
--   endomorphism's series converges). NO ℝ-valued `Norm`, NO Mathlib ℝ as content, NO Mathlib
--   `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO posited exp/`G₂`/`Aut`/metric, NO bridge.
#print axioms Phys.Algebra.coordOCut
#print axioms Phys.Algebra.coordOCut_continuous
#print axioms Phys.Algebra.coordOCut_symm_continuous
#print axioms Phys.Algebra.derivMatrix
#print axioms Phys.Algebra.expO_matrix_rep
#print axioms Phys.Algebra.expO_term_coord
#print axioms Phys.Algebra.mulVecHom
#print axioms Phys.Algebra.mulVecHom_continuous
#print axioms Phys.Algebra.expO_summable
#print axioms Phys.Algebra.expO_summable_restrict
#print axioms Phys.Algebra.expO_summable_one
-- N41e — THE LITERAL `O Cut` ALGEBRA-AUTOMORPHISM PRODUCT-PRESERVATION, UNCONDITIONAL (increment 11,
--   part e; Phys/Algebra/DerivationOProductPreserving.lean). Discharges the THREE summability premises
--   of the banked N41c conditional `expO_mul_of_summable` to the UNCONDITIONAL literal product-
--   preservation `expO D (x·y) = expO D x · expO D y` for `D = D'.restrictScalars ℤ` of a `Cut`-linear
--   Leibniz `D'`. THE GENUINE HARD CORE the N41c/N41d retrospectives isolated: the `hxy` OCTONION-
--   PRODUCT-family summability. `coordOCut` is `Cut`-linear but NOT multiplicative, so `expO_summable`'s
--   matrix-transport route does not apply verbatim. ★ THE ONE LAW: the non-associative octonion product
--   is not bashed analytically — `oCut_prod_summable` reduces, through the same coordinate frame N41d
--   built, EACH product coordinate `coordOCut (a·b) m` to a FINITE signed sum of `(coordOCut a) i ·
--   (coordOCut b) j` (the octonion multiplication, expanded once via the banked `@[simp]` CD/Dbl
--   `mul_re`/`mul_im`/`add_*`/`neg_*`/`star_*` + `ring`), each leaf summable over `ℕ × ℕ` by the banked
--   `cut_summable_mul_of_abs` on the absolutely-summable coordinate sequences (`oCut_term_abs_summable`,
--   the entrywise N40 factorial majorant `expTerm_entry_abs_summable` transported through
--   `expO_term_coord`); `Pi.summable` assembles the 8 coordinates, the continuous `coordOCut.symm`
--   transports back to `O Cut`. ★★★ `expO_mul` is then the UNCONDITIONAL product-preservation: feed
--   `expO_summable_restrict` (the two single-variable series, banked unconditional) + `oCut_prod_summable`
--   (the product family) into `expO_mul_of_summable`, leaving only the Leibniz law (the defining property
--   of the class) as hypothesis. NON-VACUITY `expO_mul_zero` (the zero `Cut`-linear endomorphism's
--   `ℤ`-restriction is a Leibniz derivation, inhabiting the hypothesis class). Costume C67
--   (DerivationOProductPreservingDropFactorialCostume) bites the WRONG product-family summability
--   (dropping the factorial that makes the coordinate majorant converge). NO ℝ-valued `Norm`, NO Mathlib
--   ℝ as content, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO posited exp/`G₂`/`Aut`, NO
--   structure-constant table, NO bridge.
#print axioms Phys.Algebra.oCut_term_abs_summable
#print axioms Phys.Algebra.restrictScalars_pow_apply
#print axioms Phys.Algebra.oCut_prod_leaf
#print axioms Phys.Algebra.oCut_prod_summable
#print axioms Phys.Algebra.expO_mul
#print axioms Phys.Algebra.expO_mul_zero

-- N41f — THE BIJECTION + THE Cut-side `≃ₗ[Cut]` / `IsAlgAutCut` AUTOMORPHISM of `O Cut` (increment 11,
--   part f; Phys/Algebra/DerivationOAutomorphism.lean). Completes the LITERAL `Der(𝕆) → Aut(𝕆)`
--   correspondence at the GROUP end: the vector exponential `expO D` of a `Cut`-linear Leibniz
--   derivation `D'` is a genuine `Cut`-side ALGEBRA AUTOMORPHISM of the non-associative `O Cut`. ★ THE
--   ONE LAW (matrix-transport, reframe through the trunk): the `Cut`-linearity and invertibility are NOT
--   bashed over the non-associative product — they transport, through the SAME N41d coordinate frame
--   `coordOCut`, to the banked N40 MATRIX one-parameter-subgroup law `expMap_mul_neg`. `coordOCut_expO`
--   is the INTERTWINING (`coordOCut (expO D x) = expMap (derivMatrix D') *ᵥ coordOCut x`, the `tsum`
--   analogue of the banked per-power `expO_matrix_rep`: continuous `coordOCut` commutes with the banked-
--   summable `tsum`, each term transports by `expO_term_coord`, the `tsum` of `(· *ᵥ v)` pulls out).
--   `expOLin` is the MANIFESTLY `Cut`-linear `coordOCut.symm ∘ₗ mulVecLin (expMap M) ∘ₗ coordOCut`,
--   equal to `expO` by `coordOCut_expO`. `expOEquiv` is the BIJECTION `LinearEquiv.ofLinear (expOLin D')
--   (expOLin (-D'))`, the composition identities collapsing through `Matrix.mulVec_mulVec` +
--   `derivMatrix_neg` to the banked `expMap_mul_neg`/`expMap_neg_mul` (the inverse of the flow is the
--   flow of the negated derivation — the literal group inverse). `expO_one` is UNITAL (`deriv_one_eq_zero`:
--   a Leibniz derivation kills the unit, `D 1 = 0` from `D 1 = D(1·1) = 2 D 1`). ★★ `expOEquiv_isAlgAut`
--   is the HEADLINE: `IsAlgAutCut (expOEquiv D')` — multiplicative (banked N41e `expO_mul`) + unital
--   (`expO_one`) on the `Cut`-linear equivalence. NON-VACUITY `expOEquiv_zero_isAlgAut` /
--   `expOEquiv_zero_symm_one` (the zero derivation's exponential is the identity automorphism). The
--   TANGENT half `d/dt exp(tD)|₀ = D` is childed (N41g). NO ℝ-valued `Norm`, NO Mathlib ℝ as content, NO
--   Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO posited exp/`G₂`/`Aut`, a fully proved
--   implication (no claim left without a proof).
#print axioms Phys.Algebra.coordOCut_expO
#print axioms Phys.Algebra.derivMatrix_neg
#print axioms Phys.Algebra.expOLin_apply
#print axioms Phys.Algebra.expOLin_comp_neg
#print axioms Phys.Algebra.expOLin_neg_comp
#print axioms Phys.Algebra.expOEquiv_apply
#print axioms Phys.Algebra.expOEquiv_symm_apply
#print axioms Phys.Algebra.deriv_one_eq_zero
#print axioms Phys.Algebra.expO_one
#print axioms Phys.Algebra.expOEquiv_isAlgAut
#print axioms Phys.Algebra.expOEquiv_zero_isAlgAut
#print axioms Phys.Algebra.expOEquiv_zero_symm_one

-- N41g (part 1) — THE SCALAR POWER-SERIES DERIVATIVE AT 0 over the derived ℝ (the analytic core of the
--   `Der → Aut` tangent map; Phys/Foundation/ContinuumScalarDeriv.lean). The genuine W1 BUILD: the banked
--   trunk-native limit infra over `Cut` was SEQUENCE-only (`atTop` over ℕ); there was NO continuous-
--   parameter `𝓝[≠] 0` function-limit / remainder-tail-squeeze. BUILT here, trunk-native, NO ℝ-valued
--   `Norm`/`Metric`, NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/`NormedField`. `cut_tendsto_zero_of_abs_le`
--   is THE SQUEEZE over the N34 `OrderTopology Cut` (`-u ≤ h ≤ u`, `u → 0` ⟹ `h → 0`). `cut_abs_tsum_le`
--   is `|∑' f| ≤ ∑' |f|` (the triangle inequality at the `tsum`). `cut_geomdom_abssummable` /
--   `cut_geomdom_tsum_le` give the remainder majorant control for `|t| ≤ 1` (`|t|^n ≤ 1`). ★★
--   `cut_powerseries_deriv` is THE THEOREM: for `∑ |a n|` summable (entire, radius ≥ 1, the exp setting),
--   the difference quotient `t⁻¹ ((∑' tⁿ aₙ) − a₀) → a₁` as `t → 0` in `𝓝[≠] 0` — the trunk-native
--   `Tendsto`, peeling `f(t) = a₀ + a₁t + t²R(t)` via `Summable.sum_add_tsum_nat_add`, bounding `|tR(t)| ≤
--   C|t|`, and squeezing. NO ℝ-valued `Norm`, NO Mathlib ℝ as content, NO `HasDerivAt`, a fully proved
--   implication (no claim left without a proof).
#print axioms Phys.Foundation.ContinuumQ.cut_tendsto_zero_of_abs_le
#print axioms Phys.Foundation.ContinuumQ.cut_abs_tsum_le
#print axioms Phys.Foundation.ContinuumQ.cut_geomdom_abssummable
#print axioms Phys.Foundation.ContinuumQ.cut_geomdom_tsum_le
#print axioms Phys.Foundation.ContinuumQ.cut_powerseries_deriv

-- N41g (part 2) — THE TANGENT HALF `d/dt exp(tD)|₀ = D` over the derived ℝ (the `Der → Aut` derivative
--   recovering the derivation; Phys/Algebra/DerivationOTangent.lean). Completes the Lie-algebra ↔
--   Lie-group correspondence over the derived continuum: N41f closed the GROUP end (expO is an
--   automorphism), this closes the TANGENT end (the derivative at 0 of the flow IS the derivation). THE
--   ONE LAW: the derivative is NOT bashed on the non-associative product — it transports through the N41d
--   coordinate homeomorphism `coordOCut` to the MATRIX exp derivative, reducing ENTRYWISE to the banked
--   scalar power-series derivative `cut_powerseries_deriv`. `derivMatrix_smul` is the matrix homogeneity
--   (`derivMatrix (t•D') = t • derivMatrix D'`). `expMap_smul_entry` reads each matrix-exp entry as the
--   scalar power series `∑' tⁿ expTerm M n i j` (entry-projection commutes with the banked tsum via
--   `HasSum.map`). `expMap_entry_tangent` is THE HEART (`d/dt expMap(t•M)_{ij}|₀ = M_{ij}`, the entrywise
--   derivative = `cut_powerseries_deriv` at `a n := expTerm M n i j`). `expMap_vec_tangent` lifts to the
--   vector statement (per-coordinate `tendsto_pi_nhds` + finite `tendsto_finset_sum`). ★★ `expO_tangent`
--   is THE THEOREM: `t⁻¹ • (expO ((t•D').restrictScalars ℤ) x − x) → D' x` in `𝓝[≠] 0`, transported back
--   through `coordOCut.symm` (continuous) using the N41f intertwining `coordOCut_expO` and the `n=1` power
--   transport `expO_matrix_rep`. `expO_tangent_zero` is the non-vacuity. NO ℝ-valued `Norm`, NO Mathlib ℝ
--   as content, NO `HasDerivAt`, a fully proved implication (no claim left without a proof).
#print axioms Phys.Algebra.derivMatrix_smul
#print axioms Phys.Algebra.expMap_smul_entry
#print axioms Phys.Algebra.expMap_entry_tangent
#print axioms Phys.Algebra.expMap_vec_tangent
#print axioms Phys.Algebra.expO_tangent
#print axioms Phys.Algebra.expO_tangent_zero

-- N42a — THE STABILIZER LIE SUBALGEBRA of a fixed imaginary unit inside `Der(𝕆)` (the structural
--   skeleton of `su(3) ⊂ g₂`; Phys/Algebra/DerivationStabilizer.lean). DERIVED from the chain: the
--   banked 14-dim derivation Lie algebra `derivationLieQ` (N16–N21), the banked first imaginary
--   generator `u1 = e₁` of the cascade, the banked imaginary subspace `ImO`. `complexUnit_sq` proves
--   the fixed unit is a square root of `−1` (`u1·u1 = −1`, a complex unit). `evalU1` is the ℚ-linear
--   evaluation-at-`u1` map `D ↦ D u1`. ★★ `stabLieQ` is the STABILIZER `{D ∈ Der(𝕆) : D u1 = 0}` as a
--   `LieSubalgebra` of `derivationLieQ` — the bracket closes because `⁅D,E⁆ u1 = D(E u1) − E(D u1) = 0`.
--   `stabLieQ_toSubmodule_eq_ker` is the rank–nullity hook (`stabLieQ.toSubmodule = ker evalU1`, the
--   dimension `= 8` childed N42b). NON-VACUITY (W8): `stabLieQ_ne_bot` (`D0E ∈ stab`, `D0E ≠ 0`, so
--   nontrivial) and `stabLieQ_ne_top` (`D3E ∉ stab` since `D3E u1 = e₆ ≠ 0`, so proper) pin the
--   stabilizer STRICTLY between `0` and the 14-dim whole. Pure algebra over ℚ — NO continuum, NO Mathlib
--   ℝ as content; `LieSubalgebra`/`LinearMap.ker` are MACHINERY on the DERIVED objects. NO posited
--   `SU(3)`/`G₂`/`su(3)`/`g₂`, a fully proved derivation (no claim left without a proof).
#print axioms Phys.Algebra.complexUnit_sq
#print axioms Phys.Algebra.evalU1
#print axioms Phys.Algebra.stabLieQ
#print axioms Phys.Algebra.stabLieQ_toSubmodule_eq_ker
#print axioms Phys.Algebra.stabLieQ_ne_bot
#print axioms Phys.Algebra.stabLieQ_ne_top

-- N42b — THE DIMENSION `dim stabLieQ = 8 = dim su(3)` of the stabilizer Lie subalgebra of a fixed
--   imaginary unit inside `Der(𝕆)` (Phys/Algebra/DerivationStabilizerDim.lean). DERIVED by rank–nullity
--   on the banked `evalU1`, NOT a posited `dim su(3) = 8`. `imgUnit_indep`: the 6 imaginary units
--   `{e₂,…,e₇}` orthogonal to the `⟨1,u1⟩` complex line are linearly independent. ★★ `range_evalU1_eq`:
--   `range evalU1 = span {e₂,…,e₇}` — computed from the explicit images of the banked 14-element basis
--   `bL` (`bLbasis`/`bL_span_top`, N23) on `u1` (`D0E,D1E,D2E,D13E ↦ 0`, the other ten ↦ ± the 6 units).
--   `finrank_range_evalU1`: `finrank (range evalU1) = 6`. ★★★ `finrank_stabLieQ`: `dim stabLieQ = 8` by
--   `LinearMap.finrank_range_add_finrank_ker` with `finrank derivationLieQ = 14` (banked basis) and
--   `stabLieQ_toSubmodule_eq_ker` (N42a): `14 − 6 = 8`. Pure algebra over ℚ — NO continuum, NO Mathlib ℝ
--   as content; `Module.finrank`/rank–nullity/`Submodule.span` are MACHINERY on the DERIVED objects. NO
--   posited `SU(3)`/`G₂`/`su(3)`/`g₂`/`dim`, a fully proved derivation (no claim left without a proof).
#print axioms Phys.Algebra.imgUnit_indep
#print axioms Phys.Algebra.range_evalU1_eq
#print axioms Phys.Algebra.finrank_range_evalU1
#print axioms Phys.Algebra.finrank_stabLieQ

-- N42c — THE BRANCHING `7 = 3 ⊕ 3̄ ⊕ 1` of `Im(𝕆)` under the complex structure `J = L_{u1}`
--   (Phys/Algebra/DerivationStabilizerSplit.lean). DERIVED from the chain — the complex unit `u1`
--   (banked square-root of `−1`) acting by left-multiplication on the banked `Im(𝕆)`, NOT a posited
--   `SU(3)`/`3 ⊕ 3̄`. ★★ `JO_sq`: `J ∘ J = −id` — the COMPLEX STRUCTURE, trunk-native from the banked
--   LEFT-ALTERNATIVE law `mul_mul_left` (`u1·(u1·x) = (u1·u1)·x`) + `complexUnit_sq` (`u1·u1 = −1`),
--   NO coordinate bash on the non-associative product (W1 reframe through the trunk). `JOequiv`: `J` is
--   a linear automorphism (inverse `−J`). `singlet`/`Uhol`/`Uah`: the `1` (`⟨u1⟩`), the `3` (`⟨e₂,e₄,e₆⟩`),
--   the `3̄` (`⟨e₃,e₅,e₇⟩`), of dims `1/3/3` (`finrank_singlet`/`finrank_Uhol`/`finrank_Uah`). `Uhol_map_JO_le_Uah`
--   / `Uah_map_JO_le_Uhol`: `J` SWAPS the two triplets `3 ↔ 3̄` (the conjugation). `Uhol_sup_Uah_eq_Vsub`:
--   the `6 = 3 ⊕ 3̄` split; `singlet_sup_Vsub_eq_ImO`: the `7 = 1 ⊕ 6` split. ★★★ `branching_7`: the
--   packaged headline `Im(𝕆) = ⟨u1⟩ ⊕ (3 ⊕ 3̄)`, dims `1 + (3 + 3) = 7`, pairwise disjoint, summing to
--   `Im(𝕆)`. Pure algebra over ℚ — NO continuum, NO Mathlib ℝ/ℂ as content; the complexification is the
--   DERIVED `u1`-action, `LinearMap`/`Submodule`/`finrank`/`LinearEquiv` are MACHINERY on DERIVED objects.
--   NO posited `SU(3)`/`G₂`/`3`/`3̄`, a fully proved derivation (no claim left without a proof).
#print axioms Phys.Algebra.JO_sq
#print axioms Phys.Algebra.JOequiv
#print axioms Phys.Algebra.finrank_Uhol
#print axioms Phys.Algebra.finrank_Uah
#print axioms Phys.Algebra.Uhol_map_JO_le_Uah
#print axioms Phys.Algebra.Uah_map_JO_le_Uhol
#print axioms Phys.Algebra.Uhol_sup_Uah_eq_Vsub
#print axioms Phys.Algebra.singlet_sup_Vsub_eq_ImO
#print axioms Phys.Algebra.branching_7

-- N43 — THE LORENTZIAN SIGNATURE `(1, 9)` of the determinant form on the self-adjoint `2 × 2`
--   matrices over the terminal algebra (Phys/Algebra/SpacetimeSignature.lean). DERIVED from the
--   trunk's Born positivity — the banked `gForm` on `O ℚ` is positive-definite (a sum of 8 squares,
--   `gForm_self_sum_sq`/`gForm_self_eq_zero`), NOT a posited `(1,9)`/Lorentzian split. ★★ `herm2_det_eq`:
--   the real determinant `reQ (M₀₀·M₁₁ − M₀₁·M₁₀)` of the self-adjoint `2 × 2` octonion matrix reduces —
--   via the banked Born identity `v·star v = ι(Nrm v)` written through `gForm` — to the quadratic form
--   `t² − x² − gForm v v` (the octonionic Minkowski norm; the minus on the Born block is the source of
--   the indefiniteness, the trunk positivity entering opposite-sign to the time square). `Qform_time_pos`:
--   the TIME line carries a positive square; `Qform_space_nonpos`/`Qform_space_def`: the SPACE block is
--   negative-DEFINITE (Born anisotropy). ★ `timeSub_isCompl_spaceSub`: `STV = ℚ × ℚ × O ℚ` splits as an
--   internal direct sum `timeSub ⊕ spaceSub`; `finrank_timeSub = 1`, `finrank_spaceSub = 9` (rank–nullity
--   on the time projection); the form positive-definite on the `1` and negative-definite on the `9`. ★★★
--   `signature_one_nine`: the packaged Sylvester signature `(1, 9)` — ONE timelike, NINE spacelike. Pure
--   algebra over ℚ — NO Mathlib ℝ/ℂ as content (Sylvester inertia is a ℚ-fact); `Matrix`/`Submodule`/
--   `finrank`/`LinearMap.ker` are MACHINERY on the DERIVED `O ℚ`. NO posited signature, a fully proved
--   derivation (no claim left without a proof).
#print axioms Phys.Algebra.herm2_isHermitian
#print axioms Phys.Algebra.herm2_det_eq
#print axioms Phys.Algebra.Qform_time_pos
#print axioms Phys.Algebra.Qform_space_nonpos
#print axioms Phys.Algebra.Qform_space_def
#print axioms Phys.Algebra.finrank_STV
#print axioms Phys.Algebra.finrank_spaceSub
#print axioms Phys.Algebra.finrank_timeSub
#print axioms Phys.Algebra.timeSub_isCompl_spaceSub
#print axioms Phys.Algebra.signature_one_nine

-- N44 — THE CHIRALITY BLOCK: the left/right (chirality) multiplication families on the terminal
--   algebra `O ℚ` do NOT all commute (Phys/Algebra/ChiralityBlock.lean). DERIVED from the chain's
--   non-associativity — the banked cascade-stop `not_associative` — NOT a posited chirality. The two
--   chiralities are the LEFT regular representation `LeftMul a : x ↦ a·x` and the RIGHT regular
--   representation `RightMul b : x ↦ x·b`, each ℚ-linear via the banked distributivity (`mul_add_na`/
--   `add_mul_na`) + scalar laws (`qsmul_mul_right`/`qsmul_mul_left`). ★★ `chirality_commute_iff_assoc`:
--   THE ONE-CAUSE BICONDITIONAL — the two families commute for ALL `a,b` IFF the algebra associates
--   (the commutator `L_a R_b x − R_b L_a x = a·(x·b) − (a·x)·b` is the associator's middle slot, so
--   commutation IS associativity; the trunk identity carries it, NO coordinate bash — W1 reframe).
--   ★★★ `chirality_block`: THE HEADLINE — the families do NOT all commute, by the banked
--   `not_associative` (the cascade's own stop). ★★★ `chirality_block_iff_jordan_cap`: THE ONE-CAUSE
--   LINK (a PROVED `Iff`, candidate genuine novelty) — the chirality block is EQUIVALENT to the
--   order-4 Hermitian-Jordan generation-cap failure (`jdef Xwit Ywit ≠ 0`, banked
--   `jordan_cap_iff_nonassoc`): one octonionic non-associativity, three terminations (cascade-stop,
--   generation-cap, chirality-block). ★ `chirality_block_witness`: the sharpest non-vacuity — the SAME
--   explicit cascade-stop triple `(ι(ιJ), ι(e₂), e₂)` realizes a concrete pair whose left/right actions
--   disagree. Pure algebra over ℚ — NO Mathlib ℝ/ℂ as content; `LinearMap`/`LinearMap.comp` are
--   MACHINERY on the DERIVED `O ℚ`. NO posited chirality, a fully proved derivation (no claim left
--   without a proof).
#print axioms Phys.Algebra.LeftMul
#print axioms Phys.Algebra.RightMul
#print axioms Phys.Algebra.chirality_commute_iff_assoc
#print axioms Phys.Algebra.chirality_block
#print axioms Phys.Algebra.chirality_block_iff_jordan_cap
#print axioms Phys.Algebra.chirality_block_witness

-- N45 — THE ISOMETRY STRUCTURE of the Born determinant form (Phys/Algebra/LorentzIsometry.lean):
--   the ℚ-linear self-maps of `STV = ℚ × ℚ × O ℚ` PRESERVING the banked Lorentzian `(1,9)` form
--   `Qv = t² − x² − gForm v v` (N43). DERIVED as the `Qform`-preserving structure — NOT a posited
--   Lorentz group / `O(1,9)`. `IsQvIsom`/`isQvIsom_id`/`isQvIsom_comp` — the isometry predicate and
--   id/composition closure. ★ `qvIsomMonoid` — THE STRUCTURE: the preservers as a `Submonoid` of
--   `Module.End ℚ STV`. ★★ `boost a b`/`boost_isom` — THE NON-COMPACT BOOST: the rational hyperbolic
--   shear `(t,x,v) ↦ (a t + b x, b t + a x, v)` with `a² − b² = 1` (a point on the unit hyperbola)
--   preserves `Qv` by PURE ℚ RING ARITHMETIC — the indefinite SIGN of the banked form (the source of
--   the `(1,9)` signature) is what a hyperbolic shear, not a circular rotation, preserves; NO matrix
--   determinant (the `det(AB)=det A·det B` route FAILS over the non-associative `O ℚ` — the W1 reframe
--   dissolves the difficulty through the form's sign instead). `boost_mem`/`boost_ne_id`/
--   `boost_mixes_time_space` — NON-TRIVIALITY (W8): a `b ≠ 0` boost is NOT the identity and sends the
--   pure-time vector `(1,0,0) ↦ (a,b,0)`, a genuine time–space mix; the structure is strictly larger
--   than `{id}`. ★ `gForm_comp` — THE BORN COMPOSITION LAW `gForm (u·v)(u·v) = gForm u u · gForm v v`,
--   from the banked `Nrm_mul_on_O` (the composition law surviving at the last associative rung `𝕆`).
--   ★ `rot u`/`rot_isom`/`rot_mem` — A SPACE ROTATION `(t,x,v) ↦ (t,x,u·v)` with a Born-unit `u`
--   (`gForm u u = 1`) preserves `Qv` via `gForm_comp`, a norm-preserving rotation of the nine space
--   directions. THE MOAT: `SO(1,9)` acting on `H₂(𝕆)` is standard (Sudbery, Manogue–Dray, Baez); the
--   novelty is the isometry structure DESCENDS from the banked `(1,9)` form + the banked Born
--   multiplicativity (the cascade's own composition law), NOT a posited Lorentz group. Pure algebra
--   over ℚ — NO Mathlib ℝ/ℂ as content; `LinearMap`/`Submodule`/`Module.End` are MACHINERY on the
--   DERIVED `O ℚ`. NO posited Lorentz group, a fully proved derivation (no claim left without a proof).
#print axioms Phys.Algebra.IsQvIsom
#print axioms Phys.Algebra.isQvIsom_id
#print axioms Phys.Algebra.isQvIsom_comp
#print axioms Phys.Algebra.qvIsomMonoid
#print axioms Phys.Algebra.boost
#print axioms Phys.Algebra.boost_isom
#print axioms Phys.Algebra.boost_mem
#print axioms Phys.Algebra.boost_ne_id
#print axioms Phys.Algebra.boost_mixes_time_space
#print axioms Phys.Algebra.gForm_comp
#print axioms Phys.Algebra.rot
#print axioms Phys.Algebra.rot_isom
#print axioms Phys.Algebra.rot_mem

-- N46 — THE SPINOR (matrix) REALIZATION of the Lorentz boost (Phys/Algebra/SpinorCover.lean):
--   the `SL(2,𝕆)`-style conjugation action `M ↦ (A · M) · Aᴴ` on the banked self-adjoint `2 × 2`
--   carrier `herm2 t x v : Matrix (Fin 2) (Fin 2) (O ℚ)` (N43), DERIVED, NOT a posited Lorentz group.
--   `boostMat p` — THE CONCRETE DIAGONAL RATIONAL GENERATOR `diag(p•1, p⁻¹•1)` (real determinant
--   `p·p⁻¹ = 1`); `actBy` — the conjugation `M ↦ (A·M)·Aᴴ`; `mdet` — the generalized real-part
--   determinant `reQ(M₀₀M₁₁ − M₀₁M₁₀)` of an arbitrary `2×2` (`O ℚ` non-commutative ⇒ no Mathlib
--   `Matrix.det`), `mdet_herm2` agreeing with the banked `herm2_det` on the carrier. `boostMat_selfadjoint`
--   — `Aᴴ = A`. ★★ `act_herm2` — THE FORCED SHAPE: the action maps `herm2 t x v ↦ herm2 t' x' v` with
--   `t'+x' = p²(t+x)`, `t'−x' = p⁻²(t−x)`, the off-diagonal `v` EXACTLY preserved (picks up `p·p⁻¹ = 1`),
--   no matrix determinant, no irrational entry, the non-associativity untouched. `act_isHermitian` — the
--   action PRESERVES Hermiticity (result is again a `herm2`). `scaled_Qform` — the rescaled lightcone
--   coords carry the SAME `Qform` (the `p²·p⁻² = 1` determinant-one cancellation). ★★★ `mdet_act` /
--   `mdet_act_eq_herm2_det` — THE HEADLINE — DETERMINANT PRESERVATION: `mdet (actBy (boostMat p) M) =
--   Qform t x v = herm2_det t x v`, the spinor conjugation realizes the boost as a genuine
--   determinant-preserving transformation over the NON-ASSOCIATIVE `O ℚ`, by the W1-reframe
--   concrete-rational route (NOT the false general `det(AB)=det A·det B`, NOT an irrational matrix).
--   ★ `boostMat_ne_one`/`act_scales_lightcone` — NON-TRIVIALITY (W8): for `p ≠ 1` the generator is NOT
--   the identity and genuinely rescales the lightcone (`herm2 t t 0 ↦ herm2 (p²t)(p²t) 0`). THE MOAT:
--   the `SL(2,𝕆) ↠ SO⁺(1,9)` spinor cover is standard (Sudbery, Manogue–Dray, Baez); the novelty is the
--   matrix action + det-preservation DESCEND from the banked `herm2`/`herm2_det_eq` carrier, and the W1
--   reframe (a rational diagonal generator in lightcone coords) dissolves the flagged W9
--   non-associative-determinant difficulty. Pure algebra over ℚ — NO Mathlib ℝ/ℂ as content; `Matrix`/
--   `conjTranspose` are MACHINERY on the DERIVED `O ℚ`. NO posited Lorentz group, a fully proved
--   derivation (no claim left without a proof). The full `SL(2,𝕆) ↠ SO⁺(1,9)` cover childed (N47).
#print axioms Phys.Algebra.boostMat
#print axioms Phys.Algebra.actBy
#print axioms Phys.Algebra.mdet
#print axioms Phys.Algebra.mdet_herm2
#print axioms Phys.Algebra.boostMat_selfadjoint
#print axioms Phys.Algebra.act_herm2
#print axioms Phys.Algebra.act_isHermitian
#print axioms Phys.Algebra.scaled_Qform
#print axioms Phys.Algebra.mdet_act
#print axioms Phys.Algebra.mdet_act_eq_herm2_det
#print axioms Phys.Algebra.boostMat_ne_one
#print axioms Phys.Algebra.act_scales_lightcone

-- N47 — THE SPACE-ROTATION (matrix) GENERATOR of the spinor cover (Phys/Algebra/SpinorRotation.lean):
--   the OTHER half of `SL(2,𝕆) ↠ SO⁺(1,9)` beyond the N46 boost, DERIVED, NOT a posited Lorentz group.
--   `rotMat u` — THE SPACE-ROTATION GENERATOR `!![u, 0; 0, 1]`, a single Born-unit octonion `u` in the
--   `(0,0)` corner (the matrix analogue of N46's diagonal `boostMat`). ★ THE W1 REFRAME that dissolved
--   the flagged W9 risk (octonion-valued `A` ⇒ `(A·M)·Aᴴ` triggers genuine NON-ASSOCIATIVITY): a single
--   octonion corner keeps every conjugation entry a BINARY product, no triple-product ambiguity. ★★
--   `act_herm2_rot` — THE FORCED SHAPE: the conjugation maps `herm2 t x v ↦ herm2 t x (u·v)` (Born-unit
--   `u`, `u·star u = 1`), the off-diagonal `v` rotated to `u·v`, the real diagonals fixed. `rot_Qform`
--   — the rotated coords carry the SAME `Qform` (the Born composition law `gForm (u·v)(u·v) = gForm u u ·
--   gForm v v = gForm v v`, `gForm u u = 1`). `act_isHermitian_rot` — the action PRESERVES Hermiticity.
--   ★★★ `mdet_act_rot` / `mdet_act_rot_eq_herm2_det` — THE HEADLINE — DETERMINANT PRESERVATION:
--   `mdet (actBy (rotMat u) M) = Qform t x v = herm2_det t x v`, the rotation conjugation realizes the
--   space rotation as a genuine determinant-preserving transformation over the NON-ASSOCIATIVE `O ℚ`, by
--   the W1-reframe single-octonion-corner route (dissolving through the banked `gForm_comp`, exactly as
--   N45's abstract `rot_isom`, NOT a non-associative matrix determinant expansion). ★ `mdet_act_boost_rot`
--   — THE COMBINED BOOST + ROTATION: conjugating by the rotation then the boost preserves the Born form —
--   both generator families of the cover, composed, are determinant-preserving. `star_u1`/`gForm_u1` — the
--   banked imaginary unit `u1` is a concrete Born-unit (`gForm u1 u1 = 1`). ★ `rotMat_u1_ne_one`/
--   `act_rotates_space` — NON-TRIVIALITY (W8): `rotMat u1 ≠ 1` and `herm2 t x 1 ↦ herm2 t x u1` (a genuine
--   rotation of the nine space directions). THE MOAT: the rotation subgroup of the `SL(2,𝕆) ↠ SO⁺(1,9)`
--   cover is standard (Sudbery, Manogue–Dray, Baez); the novelty is the matrix action + det-preservation
--   DESCEND from the banked `herm2`/`herm2_det_eq` + Born composition `gForm_comp`, and the W1 reframe (a
--   single-octonion-corner generator) dissolves the flagged W9 non-associative-conjugation risk. Pure
--   algebra over ℚ — NO Mathlib ℝ/ℂ as content; `Matrix`/`conjTranspose` are MACHINERY on the DERIVED
--   `O ℚ`. NO posited Lorentz group, a fully proved derivation (no claim left without a proof). The
--   surjectivity / `2:1` covering DEGREE of the cover childed (N48).
#print axioms Phys.Algebra.rotMat
#print axioms Phys.Algebra.act_herm2_rot
#print axioms Phys.Algebra.rot_Qform
#print axioms Phys.Algebra.act_isHermitian_rot
#print axioms Phys.Algebra.mdet_act_rot
#print axioms Phys.Algebra.mdet_act_rot_eq_herm2_det
#print axioms Phys.Algebra.mdet_act_boost_rot
#print axioms Phys.Algebra.star_u1
#print axioms Phys.Algebra.gForm_u1
#print axioms Phys.Algebra.rotMat_u1_ne_one
#print axioms Phys.Algebra.act_rotates_space

-- N48 — THE SPINOR-COVER GROUP STRUCTURE (`Phys/Algebra/SpinorCoverGroup.lean`). The W1/W3-decomposed
--   LIGHT part of the surjectivity node: the matrix (spinor) conjugations of N46/N47 ARE the abstract
--   N45 isometry generators (the EQUIVARIANT INTERTWINING), and the SUBMONOID they GENERATE sits inside
--   the Born-form isometry monoid. ★★ `actBy_rotMat_Hmap`/`actBy_boostMat_Hmap` — the equivariant
--   intertwining `actBy A (Hmap q) = Hmap (T q)`: the matrix conjugation by `rotMat u`/`boostMat p` read
--   through `Hmap (t,x,v) = herm2 t x v` IS the abstract `rot u`/`boost a b` (`(a,b) = boostParam p`).
--   `boostParam`/`boostParam_hyperbola` — the matrix boost parameters land on the unit hyperbola
--   `a² − b² = 1`. ★ `spinorCoverMonoid` — THE COVER GROUP, generated on the ASSOCIATIVE endomorphism
--   side `Module.End ℚ STV` (the W9/W1 reframe: octonionic `2 × 2` matrices are NOT a monoid — matrix
--   multiplication is non-associative — so the cover lives where composition IS associative, intertwined
--   to the matrix picture only by `act_herm2`). ★★★ `spinorCoverMonoid_le_qvIsom` — THE HEADLINE: the
--   whole generated cover ≤ `qvIsomMonoid` — every finite product of boosts and rotations preserves the
--   Born form. `boost_mem_cover`/`rot_mem_cover`/`comp_mem_cover`/`cover_isom` — both generator families
--   and their composites lie in the cover and act by isometries. ★ `spinorCoverMonoid_ne_bot` —
--   NON-TRIVIALITY (W8): the cover contains the concrete boost `(5/4, 3/4)` `≠ id`, so `≠ ⊥`. THE MOAT:
--   that the boost+rotation generators generate the connected component of the `SL(2,𝕆) ↠ SO⁺(1,9)`
--   cover is standard (Sudbery, Manogue–Dray, Baez); the novelty is the cover-group object + the
--   equivariant intertwining + the containment in the isometry monoid DESCEND from the banked
--   `herm2`/`qvIsomMonoid`/`boost`/`rot`/`act_herm2`/`act_herm2_rot`. Pure algebra over ℚ — NO Mathlib
--   ℝ/ℂ as content; `Submonoid`/`Module.End` are MACHINERY on the DERIVED objects. NO posited Lorentz
--   group, a fully proved derivation (no claim left without a proof). The SURJECTIVITY onto the
--   continuous connected component `SO⁺(1,9)` (needing the derived ℝ + Aut(𝕆)/exp stack) childed (N49).
#print axioms Phys.Algebra.Hmap
#print axioms Phys.Algebra.boostParam
#print axioms Phys.Algebra.boostParam_hyperbola
#print axioms Phys.Algebra.actBy_rotMat_Hmap
#print axioms Phys.Algebra.actBy_boostMat_Hmap
#print axioms Phys.Algebra.coverGens
#print axioms Phys.Algebra.spinorCoverMonoid
#print axioms Phys.Algebra.coverGens_subset_isom
#print axioms Phys.Algebra.spinorCoverMonoid_le_qvIsom
#print axioms Phys.Algebra.boost_mem_cover
#print axioms Phys.Algebra.rot_mem_cover
#print axioms Phys.Algebra.comp_mem_cover
#print axioms Phys.Algebra.cover_isom
#print axioms Phys.Algebra.spinorCoverMonoid_ne_bot
-- N49 — THE CONTINUUM RE-GROUNDING of the isometry structure over the DERIVED ℝ `Cut`. The Born
--   form `QformC`/`QvC`, the continuum hyperbolic boost `boostFunC`, and the continuum isometry monoid
--   `qvIsomMonoidC` built over the terminal algebra `O Cut := CD (H Cut)` over the DERIVED continuum
--   (NOT Mathlib ℝ/ℂ; `Cut` is the derived ℝ over the derived ℚ `Q`). ★★ `boostC_isom` — the continuum
--   boost preserves `QvC` iff `a²−b²=1`, by PURE FIELD ARITHMETIC (the W1 reframe: the algebraic
--   hyperbola point, not the transcendental rapidity, so the continuum boost re-grounds with NO
--   analysis). ★ `qvIsomMonoidC` — the continuum isometry structure as a submonoid of
--   `Function.End STVC`. ★ `irr_hyperbola`/`irrBoost_isom` — the IRRATIONAL boost `(3√2/4, √2/4)` (built
--   from the DERIVED √2) is a genuine continuum isometry. ★★★ `continuum_strictly_extends_rational` —
--   THE HEADLINE: the irrational continuum boost is NOT equal to ANY boost with derived-RATIONAL
--   parameters `Qcut a`, `Qcut b` — so the rational cover (N48) does NOT surject onto the continuous
--   isometry component; reaching it genuinely REQUIRES the derived ℝ. `sqrt2_quarter_not_rational`
--   (`√2/4 ∉ image Qcut`, from `sqrt2_not_rational`); `boostFunC_inj`; ★ `irrBoost_ne_id` (W8: the
--   irrational boost genuinely mixes time and space, `√2/4 ≠ 0`). THE MOAT: that `SO⁺(1,9)` is the
--   connected isometry group of octonionic Minkowski space is standard (Sudbery, Manogue–Dray, Baez);
--   the novelty is the continuum carrier + form + boost isometry + the strict extension over the
--   rational cover DESCEND from the banked terminal-algebra construction + the DERIVED ℝ `Cut` over the
--   DERIVED ℚ + the derived √2 — NO posited Lorentz group, NO Mathlib ℝ/ℂ as content, a fully proved
--   derivation (no claim left without a proof). The FULL surjectivity onto `SO⁺(1,9)` (the heavy
--   Cartan/polar-decomposition core, + the continuum rotation generator) childed (N50).
#print axioms Phys.Algebra.reQC
#print axioms Phys.Algebra.gFormC
#print axioms Phys.Algebra.QformC
#print axioms Phys.Algebra.QvC
#print axioms Phys.Algebra.boostFunC
#print axioms Phys.Algebra.boostC_isom
#print axioms Phys.Algebra.IsQvIsomC
#print axioms Phys.Algebra.isQvIsomC_id
#print axioms Phys.Algebra.isQvIsomC_comp
#print axioms Phys.Algebra.qvIsomMonoidC
#print axioms Phys.Algebra.boostC_mem
#print axioms Phys.Algebra.sqrt2_sq
#print axioms Phys.Algebra.irr_hyperbola
#print axioms Phys.Algebra.irrBoost_isom
#print axioms Phys.Algebra.sqrt2_quarter_not_rational
#print axioms Phys.Algebra.boostFunC_inj
#print axioms Phys.Algebra.continuum_strictly_extends_rational
#print axioms Phys.Algebra.irrBoost_ne_id
-- N50(a) — THE CONTINUUM ROTATION generator over the DERIVED ℝ `Cut`. `boostC_isom`'s sibling
--   (the compact, space-rotating generator): the Born-unit space rotation `v ↦ u·v` re-grounded
--   over `O Cut`, proved to preserve the continuum Born form `QvC`. ★★ `gFormC_comp` — the
--   `Cut`-PINNED BORN COMPOSITION LAW `gFormC (x·y)(x·y) = gFormC x x · gFormC y y`, routed through
--   the GENERIC doubled-base multiplicativity `CD.Nrm_mul_of_doubled_base` (O Cut = CD (CD (Dbl Cut)),
--   base associative) + the real factorization of self-conjugate products `reH_mul_selfconj` (the
--   derived `Cut` is 2-torsion-free, `cut_add_self_zero`) — NOT the ℚ-pinned scalar coordinatization
--   the abstract `gForm_comp` used (the W1 reframe). ★★ `rotC_isom` — the continuum rotation preserves
--   `QvC` when `gFormC u u = 1`, via `gFormC_comp`. `rotC_mem` — the Born-unit rotation lies in
--   `qvIsomMonoidC`. ★ `gFormC_one`/`rotC_one_mem` (W8 non-vacuity: `1 : O Cut` is a concrete
--   Born-unit; the `u=1` rotation is a genuine member). THE MOAT: that the compact part of the
--   octonionic Minkowski isometry group rotates the spacelike block is standard (Sudbery, Manogue–Dray,
--   Baez); the novelty is that the rotation generator + its Born-form preservation DESCEND from the
--   banked terminal-algebra composition law over the DERIVED ℝ `Cut` — NO posited Lorentz group, NO
--   Mathlib ℝ/ℂ as content, a fully proved derivation. The FULL surjectivity onto the connected
--   component (the heavy Cartan/polar-decomposition / generation-by-one-parameter-subgroups core)
--   childed (N51).
#print axioms Phys.Algebra.cut_add_self_zero
#print axioms Phys.Algebra.nrm_selfconj
#print axioms Phys.Algebra.reH_mul_selfconj
#print axioms Phys.Algebra.gFormC_comp
#print axioms Phys.Algebra.rotFunC
#print axioms Phys.Algebra.rotC_isom
#print axioms Phys.Algebra.rotC_mem
#print axioms Phys.Algebra.gFormC_one
#print axioms Phys.Algebra.rotC_one_mem
-- N51 — THE INFINITESIMAL ISOMETRY LIE ALGEBRA of the continuum Born form over the DERIVED ℝ `Cut`
--   — the TANGENT ALGEBRA of the connected isometry component `SO⁺(1,9)`, the W3-decomposed bankable
--   piece of the full surjectivity (the global exp-integration / Cartan-decomposition / surjectivity
--   childed N52). N49/N50 banked BOTH one-parameter generator families (the boost `boostC_isom`, the
--   rotation `rotC_isom`) over the derived ℝ; this node banks their INFINITESIMAL/tangent shadow.
--   ★★ `gFormC_skew` — THE SKEW IDENTITY `gFormC (a·v) w + gFormC v (a·w) = 2·gFormC a 1·gFormC v w`,
--   the engine of infinitesimal-rotation skewness, derived by POLARIZING the banked Born composition
--   law `gFormC_comp` twice (the W1 reframe: polarize the composition law, NOT an adjoint at the wrong
--   Cayley–Dickson depth). ★ `BvC` — the polarized Minkowski form (`BvC_self` polarizes `QvC`). ★
--   `IsInfIsomC` — the form-skew (infinitesimal isometry) predicate `∀ p q, B(Tp)q + Bp(Tq) = 0`.
--   ★★ `infIsom_bracket` — BRACKET-CLOSURE (generic from biadditivity + skewness, NO coordinate brute).
--   ★ `infIsomLieAlg` — the tangent algebra as a `LieSubalgebra Cut (Module.End Cut STVC)`. ★★
--   `boostGenC_inf` (the infinitesimal boost `(t,x,v)↦(x,t,0)` is form-skew, field arithmetic) +
--   `rotGenC_inf` (the infinitesimal rotation `(t,x,v)↦(0,0,a·v)` is form-skew when `gFormC a 1 = 0`,
--   via `gFormC_skew`). ★★★ `boost_rot_bracket_mem` — THE HEADLINE: the commutator of the
--   infinitesimal boost and an imaginary infinitesimal rotation lies in the tangent algebra (the
--   boost + rotation infinitesimal generators close under the Lie bracket). ★ `boostGenC_ne_zero` /
--   `infIsomLieAlg_ne_bot` (W8 non-vacuity: the tangent algebra is not the trivial `{0}` algebra).
--   THE MOAT: that the Lie algebra of the octonionic Minkowski isometry group is `𝔰𝔬(1,9)`, generated
--   by infinitesimal boosts + rotations, is standard (Sudbery, Manogue–Dray, Baez); the novelty is the
--   tangent algebra + its bracket-closure + the generator memberships DESCEND from the banked continuum
--   Born form + the banked Born composition law `gFormC_comp` (polarized to the skew identity) over the
--   DERIVED ℝ `Cut` — NO posited Lorentz Lie algebra, NO Mathlib ℝ/ℂ as content, a fully proved
--   derivation. The GLOBAL exp-integration / Cartan-decomposition / surjectivity childed (N52).
#print axioms Phys.Algebra.reQC_add
#print axioms Phys.Algebra.reQC_smul
#print axioms Phys.Algebra.gFormC_symm
#print axioms Phys.Algebra.gFormC_smul_left
#print axioms Phys.Algebra.gFormC_neg_left
#print axioms Phys.Algebra.gFormC_leftcomp
#print axioms Phys.Algebra.gFormC_mixed
#print axioms Phys.Algebra.gFormC_skew
#print axioms Phys.Algebra.BvC
#print axioms Phys.Algebra.BvC_self
#print axioms Phys.Algebra.BvC_symm
#print axioms Phys.Algebra.IsInfIsomC
#print axioms Phys.Algebra.bracketEnd_apply
#print axioms Phys.Algebra.infIsom_zero
#print axioms Phys.Algebra.infIsom_add
#print axioms Phys.Algebra.infIsom_smul
#print axioms Phys.Algebra.infIsom_bracket
#print axioms Phys.Algebra.infIsomLieAlg
#print axioms Phys.Algebra.boostGenC
#print axioms Phys.Algebra.boostGenC_inf
#print axioms Phys.Algebra.boostGenC_mem
#print axioms Phys.Algebra.rotGenC
#print axioms Phys.Algebra.rotGenC_inf
#print axioms Phys.Algebra.rotGenC_mem
#print axioms Phys.Algebra.boost_rot_bracket_mem
#print axioms Phys.Algebra.boostGenC_ne_zero
#print axioms Phys.Algebra.infIsomLieAlg_ne_bot
-- N52 — THE GLOBAL EXP-INTEGRATION of the infinitesimal boost generator (N51) to the BOOST
--   ONE-PARAMETER SUBGROUP over the DERIVED ℝ `Cut`. The global boost `boostFunC` composes by the
--   algebraic HYPERBOLA-GROUP law (`boostFunC_comp`, the theory-native `exp((s+t)T)=exp(sT)·exp(tT)`),
--   forms the one-parameter subgroup `boostOPS ≤ qvIsomMonoidC` (`boostOPS_le_isom`, the integrated
--   tangent is a global isometry), and IS the finite exp-polynomial in the N51 infinitesimal
--   generator (`boostFunC_eq_gen_poly`, since `boostGenC³ = boostGenC` dissolves the transcendental
--   rapidity into the algebraic hyperbola point). NO posited Lorentz group, NO Mathlib ℝ/ℂ as
--   content, a fully proved derivation. The HEAVY KAK surjectivity + the rotation one-parameter
--   subgroup childed (N53).
#print axioms Phys.Algebra.boostFunC_comp
#print axioms Phys.Algebra.boostParam_hyp_mul
#print axioms Phys.Algebra.boostFunC_one
#print axioms Phys.Algebra.boostFunC_inv
#print axioms Phys.Algebra.boostGenC_sq_apply
#print axioms Phys.Algebra.boostFunC_eq_gen_poly
#print axioms Phys.Algebra.boostOPS
#print axioms Phys.Algebra.boostOPS_le_isom
#print axioms Phys.Algebra.irrBoost_mem_boostOPS
#print axioms Phys.Algebra.boostOPS_ne_bot
#print axioms Phys.Algebra.boostExp
#print axioms Phys.Algebra.boostExp_eq_boostFunC
#print axioms Phys.Algebra.boostExp_isom
#print axioms Phys.Algebra.boostExp_one
#print axioms Phys.Algebra.boostExp_comp
-- N53 — THE ROTATION ONE-PARAMETER SUBGROUP over the DERIVED ℝ `Cut` (the COMPACT MIRROR of the N52
--   boost one-parameter subgroup). The rotation around a fixed imaginary unit `a` (`a·(a·v) = −v`,
--   the banked left-ALTERNATIVE operator-square law `L_sq_imag`) composes by the algebraic CIRCLE-
--   GROUP law (`rotCircFun_comp`, the theory-native `exp((θ+φ)R)=exp(θR)·exp(φR)` with the circle
--   point `(c c'−s s', c s'+s c')` — the octonion non-associativity DISSOLVING on the single-unit
--   alternative subalgebra), forms the one-parameter subgroup `rotCircOPS ≤ qvIsomMonoidC`
--   (`rotCircOPS_le_isom`, the integrated compact tangent is a global isometry via the banked N50
--   `rotC_isom`), and IS the banked N50 global rotation by the unit-circle element `c•1+s•a`
--   (`rotCircFun_eq_rotFunC`). Concrete on the cascade's terminal imaginary unit `a = e₂`
--   (`e2_alt`/`e2_gFormC_self`/`rotCircOPS_e2_ne_bot`, W8 non-vacuity). NO posited Lorentz group, NO
--   Mathlib ℝ/ℂ as content, a fully proved derivation. The HEAVY KAK finite-product surjectivity +
--   the non-associative SO(9)/Spin(9) completion childed (N54).
#print axioms Phys.Algebra.rotCircFun_comp
#print axioms Phys.Algebra.circParam_circle_mul
#print axioms Phys.Algebra.rotCircFun_one
#print axioms Phys.Algebra.rotCircFun_inv
#print axioms Phys.Algebra.rotCircFun_eq_rotFunC
#print axioms Phys.Algebra.gFormC_circParam_self
#print axioms Phys.Algebra.rotCircFun_isom
#print axioms Phys.Algebra.rotCircFun_mem
#print axioms Phys.Algebra.rotCircOPS
#print axioms Phys.Algebra.rotCircOPS_le_isom
#print axioms Phys.Algebra.e2_imag
#print axioms Phys.Algebra.e2_alt
#print axioms Phys.Algebra.e2_gFormC_self
#print axioms Phys.Algebra.e2_gFormC_one
#print axioms Phys.Algebra.rotCircOPS_e2
#print axioms Phys.Algebra.rotCircFun_e2_quarter_ne_id
#print axioms Phys.Algebra.rotCircOPS_e2_ne_bot

-- N54 — THE GENERATED ISOMETRY SUBMONOID + the FORWARD half of the finite-product surjectivity
--   (Cartan/polar KAK) over the DERIVED ℝ `Cut`. The boost one-parameter subgroup `boostOPS` (N52)
--   and the rotation generator family `rotGenSetC` (all single-unit rotations around imaginary
--   Born-units, N53) generate `genIsomMonoidC := ⟨boostOPS ∪ rotGenSetC⟩`, and EVERY finite product
--   of them preserves the continuum Born form `QvC` (`genIsomMonoidC_le_isom`, the "every word is an
--   isometry" half of `g = k·exp(p)`, via the banked `boostOPS_le_isom` + `rotCircFun_mem`, closed
--   structurally by `Submonoid.closure_le` — NO grind, NO topology). The generated group STRICTLY
--   contains each family (`boostOPS_lt_gen` + `irrBoost_not_rotGen`, W8: the quarter-turn rotation
--   around `e₂` is a non-boost member; the irrational boost is not a rotation), so it is a genuine
--   two-block group. NO posited Lorentz group, NO Mathlib ℝ/ℂ as content, a fully proved derivation.
--   The REVERSE direction (every isometry IS such a product — the polar/KAK square root over `Cut` +
--   the non-associative SO(9)/Spin(9) Moufang completion) is the W1 heavy remainder, childed (N55).
#print axioms Phys.Algebra.rotGenSetC
#print axioms Phys.Algebra.genIsomMonoidC
#print axioms Phys.Algebra.boostOPS_le_gen
#print axioms Phys.Algebra.rotGenSetC_subset_gen
#print axioms Phys.Algebra.rotGenSetC_le_isom
#print axioms Phys.Algebra.genIsomMonoidC_le_isom
#print axioms Phys.Algebra.quarterTurn_e2_mem_rotGenSet
#print axioms Phys.Algebra.quarterTurn_e2_mem_gen
#print axioms Phys.Algebra.quarterTurn_e2_not_boost
#print axioms Phys.Algebra.irrBoost_mem_gen
#print axioms Phys.Algebra.irrBoost_not_rotGen
#print axioms Phys.Algebra.boostOPS_lt_gen

-- N55 — THE TWO-SIDED MOUFANG / Spin(9) ROTATION GENERATOR beyond the single-unit circle
--   subgroups + the EXTENDED generated isometry submonoid, over the DERIVED ℝ `Cut`. The
--   two-sided bimultiplication `biMulFun u u' : (t,x,v) ↦ (t,x, u·(v·u'))` is a continuum Born-form
--   `QvC`-isometry whenever `u, u'` are Born-units (`biMulFun_isom`), DISSOLVED structurally through
--   the banked `Cut`-pinned Born composition law `gFormC_comp` applied TWICE (`biMul_gFormC`:
--   `gFormC (u·(v·u'))(u·(v·u')) = gFormC u u · (gFormC v v · gFormC u' u')`) — the Spin(9) generator
--   the single-unit circle subgroups (N53/N54) do not reach. It RECOVERS the single left-mult at
--   `u'=1` (`biMulFun_one_right`), and the extended generated group `genIsomMonoidC2 := ⟨boostOPS ∪
--   rotGenSetC ∪ biMulGenSetC⟩` still lies in the isometry monoid (`genIsomMonoidC2_le_isom`, via
--   `Submonoid.closure_le` — NO grind) while strictly enlarging N54 (`genIsomMonoidC_le_gen2`) and
--   containing a genuinely NEW two-sided generator (`biMulFun_e2_e2_ne_rotFunC_e2`, W8: `biMulFun
--   e₂ e₂` sends space-1 to `e₂·e₂ = −1 ≠ e₂`, NOT a single multiplication). NO posited Lorentz/Spin
--   group, NO Mathlib ℝ/ℂ as content, a fully proved derivation. The REVERSE surjectivity (every
--   isometry IS such a product — the polar/KAK square root over `Cut` from Born positivity +
--   connectedness + that the two-sided generators exhaust SO(9)) is the W1 heavy remainder, childed.
#print axioms Phys.Algebra.biMulFun
#print axioms Phys.Algebra.biMul_gFormC
#print axioms Phys.Algebra.biMulFun_isom
#print axioms Phys.Algebra.biMulFun_mem
#print axioms Phys.Algebra.biMulFun_one_right
#print axioms Phys.Algebra.biMulGenSetC
#print axioms Phys.Algebra.genIsomMonoidC2
#print axioms Phys.Algebra.biMulGenSetC_le_isom
#print axioms Phys.Algebra.genIsomMonoidC2_le_isom
#print axioms Phys.Algebra.genIsomMonoidC_le_gen2
#print axioms Phys.Algebra.biMulFun_e2_e2_ne_rotFunC_e2
#print axioms Phys.Algebra.biMulFun_e2_e2_mem_gen2
-- N56 — THE BORN SELF-OVERLAP POSITIVITY + the forced (1,9) SIGNATURE SPLIT of the continuum
--   Minkowski form over the DERIVED ℝ `Cut`, the positive-definiteness the polar/reverse
--   decomposition rests on. The Born self-overlap `gFormC v v = reQC (v·star v)` over the
--   Cayley–Dickson double³ `O Cut` equals the SUM OF THE EIGHT coordinate squares
--   (`gFormC_sumOfSquares`), hence `0 ≤ gFormC v v` (`gFormC_nonneg`, the trunk's Born = self-
--   overlap = positivity made a theorem of the ordered continuum) with equality iff `v = 0`
--   (`gFormC_eq_zero_iff`, positive-DEFINITENESS — the non-degeneracy the polar positive part
--   needs). This forces the (1,9) SIGNATURE SPLIT of `QvC = t² − x² − gFormC v v`: the time
--   direction is positive (`QvC_time_pos`), the space block is nonpositive (`QvC_space_nonpos`)
--   and NEGATIVE-DEFINITE off the origin (`QvC_space_neg_of_ne`) — one timelike, nine spacelike
--   directions, DERIVED from Born positivity over the ordered derived ℝ. NO posited inner product,
--   NO posited signature, NO Mathlib ℝ/ℂ as content, a fully proved derivation. The actual KAK
--   `g=k·exp(p)` finite-product exhaustion + the full Spin(9)→SO(9) surjectivity (requiring a
--   positive-definite square root over `Cut`, connectedness, Lie-group integration) is the W1
--   heavy remainder, childed.
#print axioms Phys.Algebra.gFormC_sumOfSquares
#print axioms Phys.Algebra.gFormC_nonneg
#print axioms Phys.Algebra.gFormC_eq_zero_iff
#print axioms Phys.Algebra.gFormC_pos_of_ne_zero
#print axioms Phys.Algebra.gFormC_one_pos
#print axioms Phys.Algebra.QvC_time_pos
#print axioms Phys.Algebra.QvC_space_nonpos
#print axioms Phys.Algebra.QvC_space_neg_of_ne
#print axioms Phys.Algebra.QvC_space_e2_neg

-- N57 — THE POSITIVE-DEFINITE SQUARE ROOT over the derived ℝ `Cut` (the first true
--   prerequisite of the polar/KAK boost part `exp(p) = √(g*g)`). Mathlib has NO general
--   `sqrt` over `Cut`; the root DISSOLVES through the order-completeness the continuum was
--   built with — `intermediate_value_Icc` (N33 `ConditionallyCompleteLinearOrder` + N34
--   `OrderTopology`) applied to the continuous squaring map `x ↦ x·x` (continuous because
--   the derived ℝ is a topological ring, N34) on `[0, max 1 a]` returns a nonnegative root
--   (`cutSqrt_exists`); squaring is injective on the nonnegatives (`sq_nonneg_inj`), giving
--   the named witness `cutSqrt` with `(cutSqrt a)·(cutSqrt a) = a` (`cutSqrt_sq`), strictly
--   positive off zero (`cutSqrt_pos`), and `cutSqrt 4 = 2` (`cutSqrt_four_eq_two`, W8 non-
--   vacuity). NO posited ℝ, NO Mathlib number-system content, a fully proved derivation. The
--   global reverse KAK surjectivity + the full Spin(9)→SO(9) exhaustion is the W1 heavy
--   remainder, childed.
#print axioms Phys.Algebra.continuous_cut_sq
#print axioms Phys.Algebra.cutSqrt_exists
#print axioms Phys.Algebra.sq_nonneg_inj
#print axioms Phys.Algebra.cutSqrt_nonneg
#print axioms Phys.Algebra.cutSqrt_sq
#print axioms Phys.Algebra.cutSqrt_unique
#print axioms Phys.Algebra.cutSqrt_pos
#print axioms Phys.Algebra.cutSqrt_zero
#print axioms Phys.Algebra.cutSqrt_one
#print axioms Phys.Algebra.cutSqrt_four_eq_two

-- N58 — THE INFINITESIMAL CARTAN DECOMPOSITION of the continuum isometry Lie algebra over the
--   derived ℝ `Cut` — the Lie-algebra skeleton of the polar/KAK decomposition `g = k·exp(p)`.
--   The Euclidean reference form `EvC p q = t·t' + x·x' + gFormC v v'` (the positive-definite
--   `(+,+,…,+)` companion of the indefinite Minkowski `BvC`) is symmetric `Cut`-bilinear and
--   positive-DEFINITE — `0 ≤ EvC p p` (`EvC_nonneg`, a sum of squares + the N56-nonneg Born
--   self-overlap) with equality iff `p = 0` (`EvC_eq_zero_iff`). Relative to it the tangent
--   generators split into the COMPACT and NONCOMPACT parts of the Cartan decomposition: the
--   infinitesimal boost `boostGenC` is EvC-SYMMETRIC (`boostGenC_EvC_symm`, the noncompact 𝔭),
--   the imaginary infinitesimal rotation `rotGenC a` is EvC-SKEW (`rotGenC_EvC_skew`, the compact
--   𝔨, via the polarized Born skew identity `gFormC_skew`), and the two are genuinely DISTINCT —
--   the boost is NOT EvC-skew (`boostGenC_not_EvC_skew`, W8). DERIVED from the banked Born
--   positivity + the polarized skew identity over the ordered derived ℝ, NO posited Cartan
--   involution, NO posited inner product, NO Mathlib ℝ/ℂ as content, a fully proved derivation.
--   The global reverse KAK surjectivity (operator square root + connectedness + the full
--   Spin(9)→SO(9) exhaustion) is the W1 heavy remainder, childed.
#print axioms Phys.Algebra.EvC_self
#print axioms Phys.Algebra.EvC_symm
#print axioms Phys.Algebra.EvC_nonneg
#print axioms Phys.Algebra.EvC_eq_zero_iff
#print axioms Phys.Algebra.EvC_one_pos
#print axioms Phys.Algebra.boostGenC_EvC_symm
#print axioms Phys.Algebra.rotGenC_EvC_skew
#print axioms Phys.Algebra.boostGenC_not_EvC_skew

-- N59 — THE OPERATOR FORM-ADJOINT w.r.t. the positive-definite Euclidean reference form `EvC`
--   (N58) — lifting the N58 infinitesimal `IsEvCSymm`/`IsEvCSkew` split to the OPERATOR
--   (group-level) adjoint. `IsEvCAdjoint g h := ∀ p q, EvC (g p) q = EvC p (h q)` (the form-adjoint
--   relation); adjunction is symmetric (`IsEvCAdjoint.symm`); the form-adjoint composite `h∘g`
--   (= `g*g`) is EvC-SELF-ADJOINT (`comp_isEvCSymm`) and EvC-POSITIVE-SEMIDEFINITE
--   (`comp_nonneg`, reducing to `EvC (g p)(g p) ≥ 0` via N58 `EvC_nonneg` — the trunk's Born =
--   self-overlap = positivity at the operator level, the existence-of-the-positive-root hypothesis
--   the polar/KAK boost part `exp(p) = √(g*g)` consumes). The boost is its own EvC-adjoint
--   (self-adjoint, noncompact); the imaginary rotation `−rotGenC a` is the adjoint of `rotGenC a`
--   (skew-adjoint, compact, `rotGenC_adjoint`); the two parts are genuinely DISTINCT — `rotGenC e₂`
--   is NOT EvC-symmetric (`rotGenC_e2_not_EvC_symm`, W8). DERIVED from the banked positive-definite
--   reference form + Born positivity over the ordered derived ℝ, NO posited adjoint, NO posited
--   inner product, NO Mathlib spectral theory, NO Mathlib ℝ/ℂ as content, a fully proved
--   derivation. The global reverse KAK surjectivity (the operator square root over the form space +
--   the polar/KAK assembly + connectedness + the full Spin(9)→SO(9) exhaustion) is the W1 heavy
--   remainder, childed.
#print axioms Phys.Algebra.EvC_neg_right
#print axioms Phys.Algebra.IsEvCAdjoint.symm
#print axioms Phys.Algebra.IsEvCAdjoint.comp_isEvCSymm
#print axioms Phys.Algebra.IsEvCAdjoint.comp_nonneg
#print axioms Phys.Algebra.boostGenC_self_adjoint
#print axioms Phys.Algebra.boostGenC_comp_symm
#print axioms Phys.Algebra.boostGenC_comp_nonneg
#print axioms Phys.Algebra.boostGenC_comp_pos_witness
#print axioms Phys.Algebra.rotGenC_adjoint
#print axioms Phys.Algebra.rotGenC_comp_symm
#print axioms Phys.Algebra.rotGenC_comp_nonneg
#print axioms Phys.Algebra.rotGenC_e2_not_EvC_symm

-- N60 — THE OPERATOR SQUARE ROOT (the structured/scalar case) over the derived ℝ `Cut` —
--   lifting the scalar positive-definite square root `cutSqrt` (N57) to the OPERATOR level and
--   CONSUMING the N59 operator form-adjoint positivity (`IsEvCAdjoint.comp_nonneg`). The positive
--   operator square-root predicate `IsEvCOpSqrt s g := IsEvCSymm s ∧ (∀ p, 0 ≤ EvC (s p) p) ∧
--   s∘s = g`; THE HEART `scalar_op_sqrt` — for `c ≥ 0`, `(cutSqrt c)·id` is a positive operator
--   square root of `c·id` (self-adjoint via the reference-form bilinearity, positive-semidefinite
--   via N57 `cutSqrt_nonneg` + N58 `EvC_nonneg` — the trunk positivity — and squaring back via N57
--   `cutSqrt_sq`); the N59 CONSUMPTION `comp_scalar_pos` (`g*g = c·id ⟹ 0 ≤ c`, via `comp_nonneg`
--   at the unit time vector) and `comp_scalar_op_sqrt` (in the structured case `g*g = c·id`, the
--   polar positive part `√(g*g) = (cutSqrt c)·id` EXISTS — the existence-of-the-positive-root
--   hypothesis the polar boost part consumes, DISCHARGED in the structured case); structured
--   uniqueness `scalar_op_sqrt_unique`; and the W8 non-vacuity (`scalar_op_sqrt_witness`: `4·id`
--   the root of `16·id`; `not_scalar_op_sqrt_5_7`: `5·id` is NOT a root of `7·id`). DERIVED from
--   the banked scalar `cutSqrt` + the positive-definite reference form `EvC` + the operator
--   form-adjoint positivity over the ordered derived ℝ, NO posited operator calculus, NO Mathlib
--   spectral theory, NO Mathlib ℝ/ℂ as content, a fully proved derivation. The FULL spectral
--   square root over the 10-dim form space (a general non-scalar `g*g`) + the polar/KAK assembly +
--   connectedness + the full Spin(9)→SO(9) exhaustion is the W1 heavy remainder, childed.
#print axioms Phys.Algebra.EvC_smul_left
#print axioms Phys.Algebra.EvC_smul_right
#print axioms Phys.Algebra.cutSmul_id_apply
#print axioms Phys.Algebra.cutSmul_isEvCSymm
#print axioms Phys.Algebra.cutSmul_comp
#print axioms Phys.Algebra.cutSmul_id_inj
#print axioms Phys.Algebra.scalar_op_sqrt
#print axioms Phys.Algebra.comp_scalar_pos
#print axioms Phys.Algebra.comp_scalar_op_sqrt
#print axioms Phys.Algebra.scalar_op_sqrt_unique
#print axioms Phys.Algebra.cutSqrt_sixteen_eq_four
#print axioms Phys.Algebra.scalar_op_sqrt_witness
#print axioms Phys.Algebra.not_scalar_op_sqrt_5_7

-- N61 — THE 2-BLOCK (NON-SCALAR) OPERATOR SQUARE ROOT over the derived ℝ `Cut` — extending the
--   N60 structured/scalar operator square root toward the FULL SPECTRUM via the first genuinely
--   NON-scalar case: the diagonal operator `blockDiag a b := (t,x,v) ↦ (a•t, a•x, b•v)`, scalar
--   `a` on the EvC-orthogonal `(t,x)` plane, scalar `b` on the octonion block `v`. `blockDiag c c
--   = c·id` (the scalar collapse — it genuinely extends N60); `blockDiag a b` is EvC-self-adjoint
--   (`blockDiag_isEvCSymm`, diagonal in the EvC-orthogonal splitting); composes blockwise
--   (`blockDiag_comp`); is determined by its eigenvalues (`blockDiag_inj`); is EvC-positive-
--   semidefinite for `a,b ≥ 0` (`blockDiag_nonneg`, the trunk positivity blockwise). THE HEART
--   `blockDiag_op_sqrt` — for `c₁,c₂ ≥ 0`, `blockDiag (cutSqrt c₁)(cutSqrt c₂)` is a positive
--   operator square root of `blockDiag c₁ c₂`, the FIRST genuinely non-scalar operator square
--   root, the scalar `cutSqrt` applied EIGENBLOCK-by-EIGENBLOCK; uniqueness
--   `blockDiag_op_sqrt_unique`; and the W8 non-vacuity (`blockDiag_op_sqrt_witness`: `blockDiag 2
--   3` (2≠3, off the scalar diagonal) the root of `blockDiag 4 9`; `not_blockDiag_op_sqrt_2_3`:
--   `blockDiag 2 3` is NOT a root of `blockDiag 4 10`, forcing `9 = 10` at the `b` eigenblock).
--   DERIVED from the banked scalar `cutSqrt` (N57) + the positive-definite reference form `EvC`
--   (N58) + N60 `IsEvCOpSqrt` over the ordered derived ℝ, NO posited operator calculus, NO Mathlib
--   spectral theory, NO Mathlib ℝ/ℂ as content, a fully proved derivation. The FULL spectral
--   square root (a general non-block-diagonal `g*g`) + the polar/KAK assembly + connectedness +
--   the full Spin(9)→SO(9) exhaustion is the W1 heavy remainder, childed.
#print axioms Phys.Algebra.blockDiag
#print axioms Phys.Algebra.blockDiag_apply
#print axioms Phys.Algebra.blockDiag_scalar
#print axioms Phys.Algebra.blockDiag_isEvCSymm
#print axioms Phys.Algebra.blockDiag_comp
#print axioms Phys.Algebra.blockDiag_a_read
#print axioms Phys.Algebra.blockDiag_b_read
#print axioms Phys.Algebra.blockDiag_inj
#print axioms Phys.Algebra.blockDiag_nonneg
#print axioms Phys.Algebra.blockDiag_op_sqrt
#print axioms Phys.Algebra.blockDiag_op_sqrt_unique
#print axioms Phys.Algebra.blockDiag_op_sqrt_witness
#print axioms Phys.Algebra.not_blockDiag_op_sqrt_2_3
-- N62 — THE OCTONION-INTERNAL (3-EIGENVALUE) COORDINATE-DIAGONAL OPERATOR SQUARE ROOT over the
--   derived ℝ `Cut` — the first diagonalization WITHIN the octonion block `O Cut = CD (H Cut)`,
--   extending the N61 2-block (which kept the whole 8-dim octonion `v` as ONE eigenblock) by
--   splitting the octonion into its Cayley–Dickson re-half and im-half eigenspaces. The polarized
--   Born form `gFormC_coordExpand` (the 8-coordinate dot product) shows the re-half and im-half are
--   EvC-ORTHOGONAL; `octBlock a b : v ↦ ⟨a•v.re, b•v.im⟩` (scale the re-half by `a`, the im-half by
--   `b`) is then gFormC-self-adjoint (`octBlock_gForm_symm`), composes halfwise (`octBlock_comp`),
--   and is gFormC-positive-semidefinite for `a,b ≥ 0` (`octBlock_gForm_nonneg`, the re/im split of
--   the trunk Born positivity). Lifted to the 10-dim form space, `coordDiag3 a b₁ b₂ : (t,x,v) ↦
--   (a•t, a•x, octBlock b₁ b₂ v)` is a GENUINELY 3-distinct-eigenvalue diagonal operator (the
--   `(t,x)` plane, the octonion re-half, the octonion im-half), EvC-self-adjoint
--   (`coordDiag3_isEvCSymm`), composing coordinatewise (`coordDiag3_comp`), determined by its three
--   eigenvalues (`coordDiag3_inj` via the three readers), EvC-positive-semidefinite for nonneg
--   eigenvalues (`coordDiag3_nonneg`), with the scalar collapse `coordDiag3 c c c = c·id`
--   (`coordDiag3_scalar`, it genuinely extends N60/N61). THE HEART `coordDiag3_op_sqrt` — for
--   `c,a₁,a₂ ≥ 0`, `coordDiag3 (cutSqrt c)(cutSqrt a₁)(cutSqrt a₂)` is a positive operator square
--   root of `coordDiag3 c a₁ a₂` (the first diagonalization WITHIN the octonion, the scalar
--   `cutSqrt` per re/im eigenspace, NO Mathlib spectral theory); structured uniqueness
--   `coordDiag3_op_sqrt_unique`; and the W8 non-vacuity (`coordDiag3_op_sqrt_witness`: `coordDiag3
--   1 2 3` (three distinct eigenvalues) the root of `coordDiag3 1 4 9`; `not_coordDiag3_op_sqrt_1_2_3`:
--   `coordDiag3 1 2 3` is NOT a root of `coordDiag3 1 4 11`, forcing `9 = 11` at the im-half
--   eigenblock). All foundations-only over the ordered derived ℝ `Cut` + the terminal algebra
--   `O Cut`, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
#print axioms Phys.Algebra.gFormC_coordExpand
#print axioms Phys.Algebra.octBlock
#print axioms Phys.Algebra.octBlock_scalar
#print axioms Phys.Algebra.octBlock_one
#print axioms Phys.Algebra.octBlock_e2
#print axioms Phys.Algebra.octBlock_gForm_symm
#print axioms Phys.Algebra.octBlock_comp
#print axioms Phys.Algebra.octBlock_gForm_nonneg
#print axioms Phys.Algebra.coordDiag3
#print axioms Phys.Algebra.coordDiag3_apply
#print axioms Phys.Algebra.coordDiag3_scalar
#print axioms Phys.Algebra.coordDiag3_isEvCSymm
#print axioms Phys.Algebra.coordDiag3_comp
#print axioms Phys.Algebra.coordDiag3_nonneg
#print axioms Phys.Algebra.coordDiag3_a_read
#print axioms Phys.Algebra.coordDiag3_b1_read
#print axioms Phys.Algebra.coordDiag3_b2_read
#print axioms Phys.Algebra.coordDiag3_inj
#print axioms Phys.Algebra.coordDiag3_op_sqrt
#print axioms Phys.Algebra.coordDiag3_op_sqrt_unique
#print axioms Phys.Algebra.coordDiag3_op_sqrt_witness
#print axioms Phys.Algebra.not_coordDiag3_op_sqrt_1_2_3
-- N63 — THE EvC-ORTHOGONAL EIGENPROJECTION + THE SPECTRAL SQUARE ROOT IN A ROTATED ORTHONORMAL BASIS.
#print axioms Phys.Algebra.EvC_add_left
#print axioms Phys.Algebra.EvC_add_right
#print axioms Phys.Algebra.IsEvCSymm_add
#print axioms Phys.Algebra.IsEvCSymm_smul
#print axioms Phys.Algebra.projC
#print axioms Phys.Algebra.projC_apply
#print axioms Phys.Algebra.projC_isEvCSymm
#print axioms Phys.Algebra.projC_idem
#print axioms Phys.Algebra.projC_orth
#print axioms Phys.Algebra.projC_nonneg
#print axioms Phys.Algebra.specOp
#print axioms Phys.Algebra.specOp_apply
#print axioms Phys.Algebra.specOp_isEvCSymm
#print axioms Phys.Algebra.specOp_nonneg
#print axioms Phys.Algebra.specOp_comp
#print axioms Phys.Algebra.specOp_read₁
#print axioms Phys.Algebra.specOp_read₂
#print axioms Phys.Algebra.specOp_op_sqrt
#print axioms Phys.Algebra.u35a
#print axioms Phys.Algebra.u35b
#print axioms Phys.Algebra.u35a_norm
#print axioms Phys.Algebra.u35b_norm
#print axioms Phys.Algebra.u35_orth
#print axioms Phys.Algebra.specOp_4_9_offdiag
#print axioms Phys.Algebra.specOp_witness
#print axioms Phys.Algebra.not_specOp_2_4_op_sqrt_4_15
-- N64 — THE GENERAL (WHOLE-FAMILY) EvC-ORTHONORMAL EIGENBASIS EXISTENCE (irrational off-axis basis)
-- + the isometry-derived diagonalization (boostGenC∘boostGenC).
#print axioms Phys.Algebra.txOp
#print axioms Phys.Algebra.txOp_apply
#print axioms Phys.Algebra.s2_sq
#print axioms Phys.Algebra.uP
#print axioms Phys.Algebra.uM
#print axioms Phys.Algebra.uP_norm
#print axioms Phys.Algebra.uM_norm
#print axioms Phys.Algebra.uPM_orth
#print axioms Phys.Algebra.txOp_eq_specOp
#print axioms Phys.Algebra.boostGenC_sq_eq
#print axioms Phys.Algebra.txOp_op_sqrt
#print axioms Phys.Algebra.txOp_5_4_5_diag
#print axioms Phys.Algebra.txOp_5_4_5_witness
-- N65 — THE FULL ARBITRARY-UNEQUAL-DIAGONAL EvC-ORTHONORMAL EIGENBASIS EXISTENCE
-- (the discriminant radical cutSqrt(δ²+b²), parameter-dependent rotating eigenbasis)
-- + the general operator square root in the constructed eigenbasis.
#print axioms Phys.Algebra.rotA
#print axioms Phys.Algebra.rotB
#print axioms Phys.Algebra.rotA_norm
#print axioms Phys.Algebra.rotB_norm
#print axioms Phys.Algebra.rotAB_orth
#print axioms Phys.Algebra.specOp_rot_eq_txOp
#print axioms Phys.Algebra.rotEig_normalized
#print axioms Phys.Algebra.txOp_eq_specOp_rot
#print axioms Phys.Algebra.txOp_op_sqrt_gen
#print axioms Phys.Algebra.txOp_73_36_52_diag
#print axioms Phys.Algebra.txOp_73_36_52_witness
-- N66 — THE POLAR / KAK ASSEMBLY g = k·exp(p) of a concrete isometry: the boost operator boostC
-- (its self-adjointness, composition, square, positivity, operator square root, eigenblock reading,
-- and form-isometry), the compact involution R = blockDiag 1 (−1), and the polar factorization
-- (form-adjoint, positive operator g*∘g, the positive part √(g*g) = boostC a b), with both factors
-- nontrivial.
#print axioms Phys.Algebra.boostC
#print axioms Phys.Algebra.boostC_apply
#print axioms Phys.Algebra.boostC_isEvCSymm
#print axioms Phys.Algebra.boostC_comp
#print axioms Phys.Algebra.boostC_sq
#print axioms Phys.Algebra.boostC_nonneg
#print axioms Phys.Algebra.boostC_op_sqrt
#print axioms Phys.Algebra.boostC_uP
#print axioms Phys.Algebra.boostC_uP_read
#print axioms Phys.Algebra.boostC_isQvIsomC
#print axioms Phys.Algebra.R_orthogonal
#print axioms Phys.Algebra.polG_adjoint
#print axioms Phys.Algebra.polG_starComp
#print axioms Phys.Algebra.polG_pos_part
#print axioms Phys.Algebra.boostC_witness_isom
#print axioms Phys.Algebra.R_ne_id
#print axioms Phys.Algebra.boostC_ne_id
#print axioms Phys.Algebra.polG_starComp_witness

-- N67 — THE FIRST 10-DIMENSION-MIXING SPECTRAL SQUARE ROOT (an EvC-orthonormal eigenbasis mixing
-- the (t,x) plane with the octonion block O Cut) + THE RANK-3 SPECTRAL OPERATOR specOp3 (the
-- structural lever rank-2 → rank-n toward the full n-dim spectral existence). Part A: the concrete
-- mixing pair mixA/mixB, its orthonormality, the 10-dim mixing witness (time axis maps INTO the
-- octonion block), the mixing spectral square root + concrete witness + teeth. Part B: specOp3, its
-- action/self-adjointness/positivity/composition over an orthonormal triple/eigenblock reader/square
-- root, with a concrete time/space/octonion-mixing orthonormal triple {mixA,mixB,mixW3}.
#print axioms Phys.Algebra.gFormC_zero_right'
#print axioms Phys.Algebra.mixA
#print axioms Phys.Algebra.mixB
#print axioms Phys.Algebra.mixA_norm
#print axioms Phys.Algebra.mixB_norm
#print axioms Phys.Algebra.mix_orth
#print axioms Phys.Algebra.EvC_mixA_e0
#print axioms Phys.Algebra.EvC_mixB_e0
#print axioms Phys.Algebra.specOp_mix_octBlock
#print axioms Phys.Algebra.specOp_mix_op_sqrt
#print axioms Phys.Algebra.specOp_mix_witness
#print axioms Phys.Algebra.not_specOp_mix_2_6
#print axioms Phys.Algebra.specOp3
#print axioms Phys.Algebra.specOp3_apply
#print axioms Phys.Algebra.specOp3_isEvCSymm
#print axioms Phys.Algebra.specOp3_nonneg
#print axioms Phys.Algebra.specOp3_comp
#print axioms Phys.Algebra.specOp3_read₃
#print axioms Phys.Algebra.specOp3_op_sqrt
#print axioms Phys.Algebra.mixW3
#print axioms Phys.Algebra.mixW3_norm
#print axioms Phys.Algebra.mixA_mixW3_orth
#print axioms Phys.Algebra.mixB_mixW3_orth
#print axioms Phys.Algebra.specOp3_mix_witness
-- N68 — THE GENERAL RANK-n SPECTRAL OPERATOR specOpN (the inductive backbone of the full n-dim
-- spectral existence) over the derived ℝ Cut and the terminal algebra O Cut. The reference form
-- bundled as a Cut-linear map in each slot (EvCRight/EvCLeft) so EvC commutes with finite sums
-- (EvC_sum_right/_left); the Fin n-indexed spectral operator specOpN := ∑ i, (l i) • projC (u i),
-- its action/self-adjointness/positivity/family-eigenblock-reader/composition over a mutually-
-- orthonormal family/diagonal-reader/cutSqrt-per-eigenvalue square root, at arbitrary finite rank;
-- a concrete time/space/octonion-real/octonion-im orthonormal 4-frame {mixA,mixB,mixW3,mixW4} with
-- its orthonormality matrix + a rank-4 spectral-square-root witness; and the subsumption theorems
-- showing specOpN at n=2,3 IS the banked specOp (N63) / specOp3 (N67).
#print axioms Phys.Algebra.EvCRight
#print axioms Phys.Algebra.EvCLeft
#print axioms Phys.Algebra.EvC_sum_right
#print axioms Phys.Algebra.EvC_sum_left
#print axioms Phys.Algebra.specOpN
#print axioms Phys.Algebra.specOpN_apply
#print axioms Phys.Algebra.specOpN_isEvCSymm
#print axioms Phys.Algebra.specOpN_nonneg
#print axioms Phys.Algebra.specOpN_EvC_read
#print axioms Phys.Algebra.specOpN_comp
#print axioms Phys.Algebra.specOpN_read
#print axioms Phys.Algebra.specOpN_op_sqrt
#print axioms Phys.Algebra.mixW4
#print axioms Phys.Algebra.mixW4_norm
#print axioms Phys.Algebra.mixA_mixW4_orth
#print axioms Phys.Algebra.mixB_mixW4_orth
#print axioms Phys.Algebra.mixW3_mixW4_orth
#print axioms Phys.Algebra.mix4
#print axioms Phys.Algebra.mix4_orthonormal
#print axioms Phys.Algebra.specOpN_mix4_witness
#print axioms Phys.Algebra.specOpN_eq_specOp
#print axioms Phys.Algebra.specOpN_eq_specOp3
-- N69 — THE CONCRETE EIGENBASIS-EXISTENCE WITNESS (a coordinate operator IS the rank-`n` spectral
-- operator over an explicit mixing eigen-family, with its square root read off).
#print axioms Phys.Algebra.txMix
#print axioms Phys.Algebra.txMix_apply
#print axioms Phys.Algebra.mix3
#print axioms Phys.Algebra.mix3_orthonormal
#print axioms Phys.Algebra.txMix_eq_specOp3
#print axioms Phys.Algebra.txMix_eq_specOpN
#print axioms Phys.Algebra.txMix_op_sqrt
-- N70 — THE DEFLATION / PEEL-OFF ENGINE (the inductive step of the spectral existence theorem:
-- peel one eigenpair, restrict to its EvC-orthogonal complement, recurse).
#print axioms Phys.Algebra.EvC_sub_left
#print axioms Phys.Algebra.EvC_sub_right
#print axioms Phys.Algebra.EvC_zero_left
#print axioms Phys.Algebra.IsEvCSymm_sub
#print axioms Phys.Algebra.deflateC
#print axioms Phys.Algebra.deflateC_apply
#print axioms Phys.Algebra.deflateC_isEvCSymm
#print axioms Phys.Algebra.deflateC_eigen_kills
#print axioms Phys.Algebra.deflateC_image_orth
#print axioms Phys.Algebra.deflateC_specOpN
#print axioms Phys.Algebra.deflateC_txMix_fst

-- N71 — THE SEED EIGENPAIR EXTRACTION (the genuine vector eigen-equation that drives the N70
-- deflation induction; the first non-vacuous firing of the deflation engine on a concrete operator).
#print axioms Phys.Algebra.specOpN_eigen
#print axioms Phys.Algebra.txMix_isEvCSymm
#print axioms Phys.Algebra.txMix_eigen_mixA
#print axioms Phys.Algebra.txMix_eigen_mixB
#print axioms Phys.Algebra.txMix_eigen_mixW3
#print axioms Phys.Algebra.txMix_deflate_kills_mixA
#print axioms Phys.Algebra.txMix_deflate_image_orth
#print axioms Phys.Algebra.txMix_deflate_eigen_mixB

-- N72 — THE CONSTRUCTED SEED EIGENPAIR EXTRACTION FROM AN OCTONION-COUPLING COORDINATE OPERATOR
-- (the discriminant-radical eigenvector construction for an operator touching the octonion block;
-- the deflation engine firing on the CONSTRUCTED seed).
#print axioms Phys.Algebra.omixA_norm
#print axioms Phys.Algebra.omixB_norm
#print axioms Phys.Algebra.omixAB_orth
#print axioms Phys.Algebra.toMix_apply
#print axioms Phys.Algebra.toMix_isEvCSymm
#print axioms Phys.Algebra.toMix_octBlock
#print axioms Phys.Algebra.specOp_omix_eq_toMix
#print axioms Phys.Algebra.specOp_eigen₁
#print axioms Phys.Algebra.specOp_eigen₂
#print axioms Phys.Algebra.toMix_eq_specOp_omix
#print axioms Phys.Algebra.toMix_op_sqrt_gen
#print axioms Phys.Algebra.toMix_seed_eigen
#print axioms Phys.Algebra.toMix_deflate_kills_seed
#print axioms Phys.Algebra.toMix_deflate_image_orth
#print axioms Phys.Algebra.toMix_73_36_52_diag
#print axioms Phys.Algebra.toMix_73_36_52_seed_eigen
#print axioms Phys.Algebra.toMix_73_36_52_deflate_kills
#print axioms Phys.Algebra.toMix_73_36_52_witness
#print axioms Phys.Algebra.toMix_73_36_52_read_seed

-- N73 — THE FIRST CLOSED MULTI-STEP DEFLATION DESCENT (the extract→deflate→recurse loop assembled
-- to its termination at the zero operator: the general termination base case + the closed inductive
-- skeleton over a growing peeled-index set + the terminal state + the full 3-step concrete descent
-- of the 10-dim-mixing witness txMix to the zero operator).
#print axioms Phys.Algebra.specOpN_zero
#print axioms Phys.Algebra.zeroOn_not_mem
#print axioms Phys.Algebra.deflateC_specOpN_zeroOn
#print axioms Phys.Algebra.zeroOn_univ
#print axioms Phys.Algebra.specOpN_zeroOn_univ
#print axioms Phys.Algebra.deflateC_specOpN_step2
#print axioms Phys.Algebra.deflateC_specOpN_step3
#print axioms Phys.Algebra.specOpN_mix3_zero
#print axioms Phys.Algebra.deflateC_step2_survive
#print axioms Phys.Algebra.txMix_full_descent

-- N74 — THE GENERAL ITERATED DEFLATION DESCENT AT ARBITRARY RANK (assembling N73's single-step
-- closed-descent skeleton into one theorem that iterates the actual deflation peel over all n
-- indices and drives the full rank-n spectral operator specOpN l u to the zero operator at general n).
#print axioms Phys.Algebra.deflateList_nil
#print axioms Phys.Algebra.deflateList_cons
#print axioms Phys.Algebra.zeroOn_empty
#print axioms Phys.Algebra.deflateList_zeroOn
#print axioms Phys.Algebra.specOpN_full_descent
#print axioms Phys.Algebra.deflateList_mix_partial_survive
#print axioms Phys.Algebra.deflateList_txMix_concrete
#print axioms Phys.Algebra.deflateList_txMix_descent

-- N75 — THE ODD-DEGREE ROOT ENGINE over the derived ℝ Cut: the cube root cutCbrt and the GENERAL
-- MONIC-CUBIC ROOT lever cut_cubic_has_root (the eigenvalue-existence ingredient at dimension ≥ 3 —
-- a root of the characteristic cubic — the SEED-eigenvalue half the now-general iterated descent N74
-- is banked to consume; the degree-2→odd escalation of the N57 cutSqrt IVT engine).
#print axioms Phys.Algebra.continuous_cut_cube
#print axioms Phys.Algebra.cutCbrt_exists
#print axioms Phys.Algebra.cutCbrt_nonneg
#print axioms Phys.Algebra.cutCbrt_cube
#print axioms Phys.Algebra.cube_nonneg_inj
#print axioms Phys.Algebra.cutCbrt_unique
#print axioms Phys.Algebra.cutCbrt_eight_eq_two
#print axioms Phys.Algebra.continuous_cut_cubic
#print axioms Phys.Algebra.cut_cubic_has_root
#print axioms Phys.Algebra.cut_cubic_root_witness

-- N76 — THE EIGENVECTOR HALF OF THE 3-DIM SEED over the derived ℝ Cut: the structural
-- finite-dimensionality of STVC = Cut × Cut × O Cut (the product equivalences of the cascade rungs
-- 2 → 4 → 8) + the N75 chain joint (a monic degree-3 poly over Cut has a root) + the NON-VACUOUS
-- seed at dimension 3 (every endomorphism of a 3-dim Cut-space has a nonzero eigenvector) + the
-- eigenVECTOR half over STVC (any charpoly root yields a nonzero eigenvector) — completing the seed
-- eigenpair the N70 deflateC / N74 iterated descent consume.
#print axioms Phys.Algebra.dblProdEquivCut
#print axioms Phys.Algebra.hProdEquivCut
#print axioms Phys.Algebra.oProdEquivCut
#print axioms Phys.Algebra.instFiniteDblCut
#print axioms Phys.Algebra.instFiniteHCut
#print axioms Phys.Algebra.instFiniteOCut
#print axioms Phys.Algebra.monic_cubic_poly_has_root
#print axioms Phys.Algebra.dim3_has_eigenvector
#print axioms Phys.Algebra.stvc_eigenvector_of_charpoly_root
-- N77 — THE DERIVED ℝ Cut IS A REAL CLOSED FIELD: the general odd-degree root engine
-- (cut_odd_degree_has_root, generalizing N75's cubic to arbitrary odd degree via the same IVT
-- engine), the two IsRealClosed facts (cut_isSquare_of_nonneg from N57 cutSqrt, cut_exists_root_of_odd),
-- the HEADLINE cut_isRealClosed (IsRealClosed Cut), and the general odd-dimensional eigen-seed
-- dim_odd_has_eigenvector (every endo of an odd-finrank Cut-space has a nonzero eigenvector,
-- generalizing N76's dim-3-only seed — the re-seeding lever for the odd rungs of the deflation cascade).
#print axioms Phys.Algebra.cutPoly_eval_upper_nonneg
#print axioms Phys.Algebra.cutPoly_eval_lower_nonpos
#print axioms Phys.Algebra.cut_odd_degree_has_root
#print axioms Phys.Algebra.cut_isSquare_of_nonneg
#print axioms Phys.Algebra.cut_exists_root_of_odd
#print axioms Phys.Algebra.cut_isRealClosed
#print axioms Phys.Algebra.cut_odd_real_root
#print axioms Phys.Algebra.dim_odd_has_eigenvector
-- N78 — THE EVEN-RUNG OBSTRUCTION REMOVER: a negative-discriminant quadratic in an EvC-self-adjoint
-- operator over the positive-definite reference form EvC is INJECTIVE hence INVERTIBLE (the companion
-- to N77 dim_odd_has_eigenvector — the odd rungs re-seeded by the odd-degree root, the EVEN rungs
-- cleared by the positive-definite invertibility of every irreducible quadratic factor), and a
-- self-adjoint operator's characteristic polynomial CANNOT be a pure product of neg-disc quadratics
-- (Cayley–Hamilton + product-of-units), isolating the remaining gap to the real-closed factorization.
#print axioms Phys.Algebra.selfadj_negDisc_quad_apply_form
#print axioms Phys.Algebra.selfadj_negDisc_quad_pos
#print axioms Phys.Algebra.selfadj_negDisc_quad_injective
#print axioms Phys.Algebra.selfadj_negDisc_quad_bijective
#print axioms Phys.Algebra.selfadj_negDisc_quad_isUnit
#print axioms Phys.Algebra.selfadj_negDisc_quad_ne_zero
#print axioms Phys.Algebra.aeval_quad_eq
#print axioms Phys.Algebra.aeval_quad_isUnit
#print axioms Phys.Algebra.isUnitListProd
#print axioms Phys.Algebra.selfadj_no_pure_quad_charpoly
-- N79 — THE DEFLATION RE-SEEDING INDUCTION LEVER: the deflated operator RESTRICTS to the
-- EvC-orthogonal complement of the peeled eigenvector (the kernel of the bundled trunk functional
-- EvCRight u) as an EvC-self-adjoint endomorphism on a space whose finrank DROPS BY EXACTLY ONE
-- (rank–nullity on the surjective unit functional), and re-seeds via N77 dim_odd_has_eigenvector an
-- eigenvector lying INSIDE that complement at any odd rung — the EvC-orthogonal-complement finrank
-- bookkeeping the full-existence spectral induction runs on.
#print axioms Phys.Algebra.uPerp
#print axioms Phys.Algebra.mem_uPerp
#print axioms Phys.Algebra.evCRight_surjective
#print axioms Phys.Algebra.uPerp_finrank
#print axioms Phys.Algebra.deflateC_mapsTo_uPerp
#print axioms Phys.Algebra.deflateRestrict
#print axioms Phys.Algebra.deflateRestrict_coe
#print axioms Phys.Algebra.deflateRestrict_isEvCSymm
#print axioms Phys.Algebra.uPerp_finite
#print axioms Phys.Algebra.self_not_mem_uPerp
#print axioms Phys.Algebra.uPerp_ne_top
#print axioms Phys.Algebra.deflateRestrict_odd_reseed
-- N80 — THE REAL-CLOSED QUADRATIC-IRREDUCIBILITY CLASSIFICATION: a monic quadratic
-- X² + C b·X + C c over the derived ℝ Cut (real-closed-by-squares via N57 cutSqrt) is IRREDUCIBLE
-- iff it has NEGATIVE DISCRIMINANT b² < 4c — the trunk-native bridge between Mathlib's "irreducible
-- quadratic factor" language and N78 selfadj_no_pure_quad_charpoly's neg-disc qs form. The hard
-- Artin–Schreier FACTORIZATION (real-closed ⟹ Cut[i] algebraically closed, the content Mathlib
-- lacks) + the even-dim seed + the full existence + the global polar/KAK assembly childed N81.
#print axioms Phys.Algebra.cutQuad
#print axioms Phys.Algebra.cutQuad_isMonicOfDegree
#print axioms Phys.Algebra.cutQuad_monic
#print axioms Phys.Algebra.cutQuad_natDegree
#print axioms Phys.Algebra.cutQuad_eval
#print axioms Phys.Algebra.cutQuad_hasRoot_iff_nonnegDisc
#print axioms Phys.Algebra.cut_monic_quad_irreducible_iff_negDisc
#print axioms Phys.Algebra.cut_monic_quad_irreducible_of_negDisc
#print axioms Phys.Algebra.cut_negDisc_of_irreducible
#print axioms Phys.Algebra.cutQuad_negDisc_irreducible_ne_root
-- N81 — THE TRUNK-NATIVE ARTIN–SCHREIER DEGREE-2 INPUT: the quadratic extension
-- Cut[i] = Cut[X]/(X²+1) of the derived ℝ Cut is a FIELD (N80 irreducibility) in which EVERY
-- ELEMENT IS A SQUARE (riding N57 cutSqrt — Cut real-closed-by-squares), hence every quadratic
-- over Cut[i] has a root: Cut[i] is DEGREE-2-CLOSED, the "no degree-2 extension" half of the
-- Artin–Schreier theorem. The full algebraic closure (the Galois/Sylow 2-group argument Mathlib
-- lacks) + the even-dim seed + the full existence + the global polar/KAK assembly childed N82.
#print axioms Phys.Algebra.cutiI_sq
#print axioms Phys.Algebra.cutiI_ne_zero
#print axioms Phys.Algebra.cuti_finrank_eq_two
#print axioms Phys.Algebra.cuti_surjective_gauss
#print axioms Phys.Algebra.cutiGauss_sq
#print axioms Phys.Algebra.cutiMod_sq
#print axioms Phys.Algebra.cutiMod_nonneg
#print axioms Phys.Algebra.cutiMod_add_re_nonneg
#print axioms Phys.Algebra.cutiGauss_isSquare
#print axioms Phys.Algebra.cuti_isSquare
#print axioms Phys.Algebra.cuti_quadratic_has_root

-- N82 — THE ARTIN–SCHREIER ALGEBRAIC CLOSURE bricks (route a, the classical algebraic route):
-- (A) cut_no_odd_ext — every finite ODD-degree extension of the derived ℝ Cut is trivial
--     (degree 1), riding N77 cut_odd_degree_has_root via the primitive element + minpoly
--     irreducibility. (B) cut_galois_finrank_two_power — every finite GALOIS extension of Cut
--     has 2-power degree (the 2-Sylow fixed field has odd degree over Cut, = 1 by (A), forcing
--     the Galois group to be a 2-group). The content Mathlib genuinely lacks (no Sylow-in-field-
--     theory glue). (C) cuti_no_deg_two_ext — Cut[i] has NO degree-2 field extension (a degree-2
--     extension's primitive-element minpoly is a monic irreducible quadratic, but every quadratic
--     over Cut[i] has a root by N81 cuti_quadratic_has_root — Cut[i] is DEGREE-2-CLOSED). (D)
--     cuti_galois_two_group_trivial — a finite GALOIS 2-group extension of Cut[i] is trivial (a
--     nontrivial 2-group has an index-2 subgroup whose fixed field is a degree-2 extension of
--     Cut[i], impossible by (C)). (E) cuti_isAlgClosed — THE FULL ARTIN–SCHREIER ALGEBRAIC
--     CLOSURE: IsAlgClosed Cut[i]. For a monic irreducible p over Cut[i], the normal closure of
--     Cut[i][X]/(p) over Cut is finite Galois of 2-power degree (B), trivial over Cut[i] (D),
--     forcing deg p = 1, so p has a root. The crown target — Mathlib genuinely lacks this content.
#print axioms Phys.Algebra.cut_no_odd_ext
#print axioms Phys.Algebra.cut_galois_finrank_two_power
#print axioms Phys.Algebra.cuti_no_deg_two_ext
#print axioms Phys.Algebra.cuti_galois_two_group_trivial
#print axioms Phys.Algebra.cuti_isAlgClosed
-- N83 — THE REAL-CLOSED FACTORIZATION → THE EVEN-DIM REAL-EIGENVALUE SEED (over the derived ℝ Cut,
--     using the banked N82 cuti_isAlgClosed). (A) cut_irreducible_natDegree_le_two — every
--     irreducible p ∈ Cut[X] has natDegree ≤ 2: p splits over the alg-closed Cut[i], so
--     p.natDegree ∣ finrank Cut Cut[i] = 2. (B) cut_no_root_factors_negDisc — a monic p with no
--     root in Cut factors as a product of negative-discriminant monic quadratics (strong induction
--     on natDegree, each irreducible factor degree exactly 2 + neg-disc via N80). (C)
--     cut_selfadj_has_eigenvalue — every EvC-self-adjoint g on STVC has a REAL eigenvalue: else
--     charpoly is a pure neg-disc-quadratic product, forbidden by N78. The even-dim seed, completing
--     the spectral seed at EVERY rung (odd via N77, even via this).
#print axioms Phys.Algebra.cut_irreducible_natDegree_le_two
#print axioms Phys.Algebra.cut_no_root_factors_negDisc
#print axioms Phys.Algebra.cut_selfadj_has_eigenvalue
-- N84 — THE SUBMODULE REAL-EIGENVALUE SEED → THE PARITY-FREE DEFLATION RE-SEED (over the derived ℝ
--     Cut + the terminal algebra O Cut). The N83 seed lifted from the whole STVC to an ARBITRARY
--     finite-dim submodule W ≤ STVC: every EvC-symmetric T on W (symmetric w.r.t. the ambient EvC on
--     coercions) has a REAL eigenvalue — same Cayley–Hamilton / complete-the-square / real-closed
--     factorization argument as N83/N78, ported to W. This removes the LAST parity gate: the
--     deflation re-seed becomes UNCONDITIONAL (drops N79's Odd hypothesis), so the full
--     spectral-existence induction (childed N85) closes with NO parity case-split.
--     (A) subQuad_injective — T·T + b•T + c•1 injective on W for b² < 4c (complete-the-square on the
--     ambient EvC). (B) submodule_selfadj_has_eigenvalue — the submodule seed. (C)
--     deflateRestrict_reseed / deflateRestrict_reseed_unit — the parity-free (and unit-normalized)
--     re-seed inside uPerp u.
#print axioms Phys.Algebra.subQuad_injective
#print axioms Phys.Algebra.subSelfadj_no_pure_quad_charpoly
#print axioms Phys.Algebra.submodule_selfadj_has_eigenvalue
#print axioms Phys.Algebra.deflateRestrict_reseed
#print axioms Phys.Algebra.deflateRestrict_reseed_unit
-- N85 — THE FULL n-DIM SPECTRAL EXISTENCE (over the derived ℝ Cut + the terminal algebra O Cut).
--     Every EvC-self-adjoint endomorphism g of STVC equals the rank-n spectral operator specOpN l u
--     for an EvC-ORTHONORMAL eigen-family {u i} — the spectral theorem, derived inside the chain
--     with NO Mathlib spectral theory, NO Mathlib ℝ/ℂ. The two subtle parts the N85 frontier flagged
--     DISSOLVE under the trunk: (a) the forward reconstruction is the deflation peel reversed
--     (specOpN_snoc, a one-line Fin.sum_univ_castSucc), (b) the nested-complement orthonormality is a
--     single support-submodule invariant image(h) ⊆ W shrinking by W ⊓ uPerp u each rung.
--     (A) specOpN_snoc — appending one eigenpair adds one scaled eigenprojection. (B)
--     finrank_inf_uPerp_within — the codim-one drop WITHIN W (rank-nullity on EvCRight u | W). (C)
--     specExists_aux — the strong induction on finrank W, parity-free (submodule seed N84). (D)
--     stvc_selfadj_specExists — the full existence, the W = ⊤ specialization. NO parity case-split.
#print axioms Phys.Algebra.specOpN_snoc
#print axioms Phys.Algebra.finrank_inf_uPerp_within
#print axioms Phys.Algebra.specExists_aux
#print axioms Phys.Algebra.stvc_selfadj_specExists
-- N86 — THE GLOBAL POLAR POSITIVE PART (over the derived ℝ Cut + the terminal algebra O Cut).
--     For an ARBITRARY operator g with an EvC-adjoint h (IsEvCAdjoint g h), the form-adjoint
--     composite g*g = h∘g is EvC-self-adjoint (N59) AND positive (N59 comp_nonneg = Born self-overlap
--     positivity), so by the FULL spectral existence N85 it equals specOpN c u over an EvC-orthonormal
--     eigen-family with EVERY eigenvalue 0 ≤ c i, and its POSITIVE OPERATOR SQUARE ROOT exists and is
--     specOpN (cutSqrt ∘ c) u (N68) — the p^{1/2} factor of the polar decomposition g = k·p^{1/2}.
--     (A) specOpN_eigenvector / specOpN_orth_ne_zero — the eigenvector action + unit nonzero.
--     (B) specExists_eigen_nonneg / _ne_zero / _pos — eigenvalue positivity (nonneg, then strict under
--     injectivity, the invertibility lever toward (p^{1/2})⁻¹). (C) comp_specExists_nonneg — g*g
--     spectrally decomposes with nonneg eigenvalues. (D) comp_op_sqrt_exists — the global positive
--     operator square root of an arbitrary g*g (N66 concrete polar lifted to GLOBAL). (E)
--     boostGenC_comp_op_sqrt_exists — non-vacuity on a concrete banked operator.
#print axioms Phys.Algebra.specOpN_eigenvector
#print axioms Phys.Algebra.specOpN_orth_ne_zero
#print axioms Phys.Algebra.specExists_eigen_nonneg
#print axioms Phys.Algebra.specExists_eigen_ne_zero
#print axioms Phys.Algebra.specExists_eigen_pos
#print axioms Phys.Algebra.comp_specExists_nonneg
#print axioms Phys.Algebra.comp_op_sqrt_exists
#print axioms Phys.Algebra.boostGenC_comp_op_sqrt_exists
-- N87 — THE RESOLUTION-OF-IDENTITY → THE OPERATOR INVERSE (p^{1/2})⁻¹ (over the derived ℝ Cut +
--     the terminal algebra O Cut). The EvC-orthonormal eigen-family the FULL spectral existence
--     (N85) returns on the IDENTITY operator has projector sum ∑ projC u_i = id (the
--     resolution-of-identity, completeness read off id with NO spanning argument), so the
--     reciprocal-eigenvalue spectral operator is the operator inverse — the (p^{1/2})⁻¹ step of
--     the polar/KAK assembly g = k·p^{1/2}, k := g·(p^{1/2})⁻¹. (A) lid_isEvCSymm — id is
--     EvC-self-adjoint. (B) specOpN_one_eq_sum_projC — all-ones eigenvalues give the bare
--     projector sum. (C) specOpN_comp_two — the TWO-family spectral composition law (N68 comp
--     generalized). (D) stvc_resolution_of_identity — ∑ projC u_i = id from N85 on id. (E)
--     specOpN_inverse / specOpN_inverse_right — the reciprocal-eigenvalue two-sided operator
--     inverse. (F) stvc_specOpN_const_invertible — non-vacuity on a concrete nonzero-eigenvalue op.
#print axioms Phys.Algebra.lid_isEvCSymm
#print axioms Phys.Algebra.specOpN_one_eq_sum_projC
#print axioms Phys.Algebra.specOpN_comp_two
#print axioms Phys.Algebra.stvc_resolution_of_identity
#print axioms Phys.Algebra.specOpN_inverse
#print axioms Phys.Algebra.specOpN_inverse_right
#print axioms Phys.Algebra.stvc_specOpN_const_invertible
-- N88 — THE CONCRETE (p^{1/2})⁻¹ FOR THE g*g-FAMILY (the spanning / resolution-of-identity
--     lemma for the decomposing family, over the derived ℝ Cut + the terminal algebra O Cut).
--     An EvC-orthonormal family over which an INJECTIVE specOpN c u decomposes resolves the
--     identity (∑ projC u_i = id) — read off INJECTIVITY, NO dimension count — so the g*g-family
--     of an INJECTIVE g resolves the identity, has every eigenvalue strictly positive, and the
--     positive operator square root p^{1/2} = specOpN (cutSqrt∘c) u has a CONCRETE two-sided
--     inverse (p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u — the (p^{1/2})⁻¹ step of g = k·p^{1/2}
--     made concrete on the g*g-family. (A) injective_idem_eq_id — injective idempotent = id.
--     (B) specOpN_one_idem — the all-ones spectral operator is idempotent. (C)
--     specOpN_ker_sub_of_one — ker of the projector sum ⊆ ker of every specOpN c u over the
--     family. (D) specOpN_resolution_of_injective — ★ THE SPANNING LEMMA: orthonormal +
--     injective ⟹ ∑ projC u_i = id. (E) comp_injective_of_adjoint — IsEvCAdjoint g h + g
--     injective ⟹ g*g injective. (F) comp_specInverse_exists — ★★ THE PAYOFF: the concrete
--     (p^{1/2})⁻¹ for the g*g-family of an injective g. (G) smulId_isEvCAdjoint /
--     smulId_injective / smulId_comp_specInverse_exists — non-vacuity on the concrete 3•id.
#print axioms Phys.Algebra.injective_idem_eq_id
#print axioms Phys.Algebra.specOpN_one_idem
#print axioms Phys.Algebra.specOpN_ker_sub_of_one
#print axioms Phys.Algebra.specOpN_resolution_of_injective
#print axioms Phys.Algebra.comp_injective_of_adjoint
#print axioms Phys.Algebra.comp_specInverse_exists
#print axioms Phys.Algebra.smulId_isEvCAdjoint
#print axioms Phys.Algebra.smulId_injective
#print axioms Phys.Algebra.smulId_comp_specInverse_exists
-- N89 — THE COMPOSITION-ADJOINT LEMMA + THE COMPACT PART k := g·(p^{1/2})⁻¹ WITH k*k = 1 + THE
--     POLAR RECONSTRUCTION g = k·p^{1/2}, over the derived ℝ Cut + the terminal algebra O Cut.
--     The EvC-adjoint composes CONTRAVARIANTLY; from it, for an injective g with an EvC-adjoint
--     h, the compact/orthogonal part k := g∘(p^{1/2})⁻¹ has EvC-adjoint (p^{1/2})⁻¹∘h, satisfies
--     k*k = 1, and reconstructs g = k∘p^{1/2}. (A) IsEvCAdjoint.comp — ★ THE COMPOSITION-ADJOINT
--     LEMMA: IsEvCAdjoint a a' + IsEvCAdjoint b b' ⟹ IsEvCAdjoint (a∘b) (b'∘a'). (B)
--     comp_polar_decomposition — ★★ THE COMPACT PART k*k = 1 + THE POLAR RECONSTRUCTION
--     g = k∘p^{1/2}. (C) smulId_comp_polar_decomposition — non-vacuity on the concrete 3•id.
#print axioms Phys.Algebra.IsEvCAdjoint.comp
#print axioms Phys.Algebra.comp_polar_decomposition
#print axioms Phys.Algebra.smulId_comp_polar_decomposition
-- N90 — THE SIGNATURE INVOLUTION OPERATOR J + THE OPERATOR LORENTZ METRIC CONDITION gᵀ J g = J.
--   (A) sigOpC_comp_self — J∘J = id (involution). sigOpC_isEvCAdjoint_self — J* = J.
--   (B) BvC_eq_EvC_sigOpC — ★ THE METRIC-OPERATOR BRIDGE BvC p q = EvC p (J q).
--       QvC_polariz — the Born polarization. EvC_right_nondegen — ★ EvC right-nondegeneracy.
--   (C) linIsom_BvC_preserved — a linear QvC-isometry preserves BvC.
--   (D) linIsom_metric_condition — ★★ THE OPERATOR LORENTZ METRIC CONDITION h∘J∘g = J.
--   (E) boostEndC_isQvIsomC / boostEndC_isEvCAdjoint_self / boostEndC_metric_condition —
--       non-vacuity on the concrete boost (a²−b²=1).
#print axioms Phys.Algebra.sigOpC_comp_self
#print axioms Phys.Algebra.sigOpC_isEvCAdjoint_self
#print axioms Phys.Algebra.BvC_eq_EvC_sigOpC
#print axioms Phys.Algebra.QvC_polariz
#print axioms Phys.Algebra.EvC_right_nondegen
#print axioms Phys.Algebra.linIsom_BvC_preserved
#print axioms Phys.Algebra.linIsom_metric_condition
#print axioms Phys.Algebra.boostEndC_isQvIsomC
#print axioms Phys.Algebra.boostEndC_isEvCAdjoint_self
#print axioms Phys.Algebra.boostEndC_metric_condition
-- N91 — THE METRIC-CONDITION CHARACTERIZATION OF THE LINEAR ISOMETRIES + INJECTIVITY +
--   ADJOINT-UNIQUENESS + THE TWO-SIDED METRIC CONDITION g∘J∘h = J + THE J-CONJUGATION
--   INVERSION J p J = p⁻¹.
--   (A) metric_condition_imp_isQvIsom — ★ THE CONVERSE of N90: h∘J∘g = J ⟹ IsQvIsomC g.
--   (B) isEvCAdjoint_right_unique — the EvC-adjoint is unique. sigOpC_injective — J injective.
--       linIsom_injective — a linear isometry with an EvC-adjoint is injective.
--   (C) isQvIsom_iff_metric_condition — ★★ THE FULL CHARACTERIZATION IsQvIsomC g ↔ h∘J∘g = J.
--   (D) linIsom_inverse_metric_condition — ★ THE TWO-SIDED METRIC CONDITION g∘J∘h = J.
--       linIsom_posPart_J_conj_inv — ★★★ THE J-CONJUGATION INVERSION J∘(h∘g)∘J∘(h∘g) = id.
--   (E) boostEndC_metric_char / boostEndC_inverse_metric_condition / boostEndC_posPart_J_conj_inv
--       — non-vacuity on the concrete boost (a²−b²=1).
#print axioms Phys.Algebra.metric_condition_imp_isQvIsom
#print axioms Phys.Algebra.isEvCAdjoint_right_unique
#print axioms Phys.Algebra.sigOpC_injective
#print axioms Phys.Algebra.linIsom_injective
#print axioms Phys.Algebra.isQvIsom_iff_metric_condition
#print axioms Phys.Algebra.linIsom_inverse_metric_condition
#print axioms Phys.Algebra.linIsom_posPart_J_conj_inv
#print axioms Phys.Algebra.boostEndC_metric_char
#print axioms Phys.Algebra.boostEndC_inverse_metric_condition
#print axioms Phys.Algebra.boostEndC_posPart_J_conj_inv
-- N92 — Phys.Algebra.LorentzContinuumOpSqrtJConj: THE J-CONJUGATION OF A POSITIVE OPERATOR
--   SQUARE ROOT + THE TWO POSITIVE OPERATOR SQUARE ROOTS OF p⁻¹ (J p^{1/2} J and (p^{1/2})⁻¹).
--   The immediately-bankable structural setup the operator-square-root-UNIQUENESS lift
--   J p^{1/2} J = (p^{1/2})⁻¹ consumes (general uniqueness + the lift + the compact-part lemma
--   childed N93).
--   (A) opSqrt_sigOpC_conj — ★ the J-conjugate of a positive operator square root of q is a
--       positive operator square root of J∘q∘J (J* = J, J∘J = id; pure composition algebra).
--   (B) linIsom_JsqrtJ_isOpSqrt — J p^{1/2} J is a positive operator square root of J p J.
--       linIsom_posInv_isOpSqrt — (p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u is a positive operator
--       square root of p⁻¹ = specOpN c⁻¹ u.
--   (C) linIsom_JpJ_eq_specInv — ★★ J p J = specOpN c⁻¹ u as an operator equality (left-inverse =
--       right-inverse over the finite module: N91 lever + N88 reciprocal inverse).
--   (D) linIsom_two_opSqrts_of_posInv — ★★★ THE DELIVERABLE: both J p^{1/2} J and (p^{1/2})⁻¹ are
--       positive operator square roots of the SAME p⁻¹ — the setup the N93 uniqueness consumes.
--   (E) boostEndC_two_opSqrts_of_posInv — non-vacuity on the concrete boost (a²−b²=1).
#print axioms Phys.Algebra.opSqrt_sigOpC_conj
#print axioms Phys.Algebra.linIsom_JsqrtJ_isOpSqrt
#print axioms Phys.Algebra.linIsom_posInv_isOpSqrt
#print axioms Phys.Algebra.linIsom_JpJ_eq_specInv
#print axioms Phys.Algebra.linIsom_two_opSqrts_of_posInv
#print axioms Phys.Algebra.boostEndC_two_opSqrts_of_posInv
-- N93 — Phys.Algebra.LorentzContinuumOpSqrtScalarUnique: THE SCALAR-TARGET POSITIVE-OPERATOR-
--   SQUARE-ROOT UNIQUENESS — the eigenspace KERNEL the general positive-operator-square-root
--   uniqueness consumes per q-eigenspace, banked over the derived ℝ Cut + the terminal algebra
--   O Cut. (The fully general uniqueness, the lift J p^{1/2} J = (p^{1/2})⁻¹, and the full
--   isometry-compact-part lemma are childed N94.)
--   (A) evC_radical_of_nonneg — THE POSITIVE-SEMIDEFINITE-FORM RADICAL LEMMA (elementary
--       Cauchy–Schwarz/discriminant): EvC-self-adjoint + EvC-nonneg + EvC (M y) y = 0 ⟹ M y = 0.
--   (B) evC_RR_eq_scalar — the key identity EvC (R v)(R v) = l·EvC v v for R²=l·id, R self-adjoint.
--   (C) op_sqrt_scalar_unique — ★ THE DELIVERABLE: a positive operator square root of l·id (0≤l) is
--       cutSqrt l · id (the (R+μ·id)-injective dissolution; generalizes scalar_op_sqrt_unique from a
--       homothety root to an ARBITRARY positive root).
--   (D) op_sqrt_scalar_unique_eq — two positive operator square roots of the same l·id are equal.
--   (E) op_sqrt_scalar_unique_witness / not_op_sqrt_scalar_4_9 — non-vacuity (W8): 3·id is THE root
--       of 9·id; 4·id is NOT a root of 9·id (16 ≠ 9).
#print axioms Phys.Algebra.evC_radical_of_nonneg
#print axioms Phys.Algebra.evC_RR_eq_scalar
#print axioms Phys.Algebra.op_sqrt_scalar_unique
#print axioms Phys.Algebra.op_sqrt_scalar_unique_eq
#print axioms Phys.Algebra.op_sqrt_scalar_unique_witness
#print axioms Phys.Algebra.not_op_sqrt_scalar_4_9
-- N93 — Phys.Algebra.LorentzContinuumIsomCompact: THE GENERAL (INJECTIVE-TARGET) POSITIVE-
--   OPERATOR-SQUARE-ROOT UNIQUENESS → THE LIFT J p^{1/2} J = (p^{1/2})⁻¹ → THE FULL ISOMETRY-
--   COMPACT-PART LEMMA, banked over the derived ℝ Cut + the terminal algebra O Cut.
--   (A) evC_shift_injective — S + a·id injective for a > 0, S EvC-positive-semidefinite (the
--       Born-positivity injectivity lever the per-eigenvector step consumes).
--   (B) linMap_eq_of_resolution — two linear maps agreeing on a resolving family are equal.
--   (C) op_sqrt_unique_of_injective — ★ THE DELIVERABLE: IsEvCOpSqrt s₁ q → IsEvCOpSqrt s₂ q →
--       s₁ = s₂ for INJECTIVE q (the operator lift of N57 cutSqrt_unique; the two roots live over
--       DIFFERENT eigen-families — dissolved eigen-family-by-eigen-family of one root).
--   (D) linIsom_JsqrtJ_eq_posInv — ★★ THE LIFT: J p^{1/2} J = (p^{1/2})⁻¹ as an OPERATOR EQUALITY,
--       for a linear isometry (uniqueness applied to the N92 two-roots setup; p⁻¹ injective).
--   (E) isometry_compact_part_isQvIsom — ★★★ THE FULL ISOMETRY-COMPACT-PART LEMMA: the compact part
--       k := g∘(p^{1/2})⁻¹ of an isometry preserves QvC (pure composition algebra from the lift +
--       the N91 converse metric_condition_imp_isQvIsom).
--   (F) boostEndC_compact_part_isQvIsom / not_op_sqrt_unique_clash — non-vacuity (W8): a concrete
--       boost realises the compact-part lemma; a wrong two-roots collapse 2·id = 3·id fails (2 ≠ 3).
#print axioms Phys.Algebra.evC_shift_injective
#print axioms Phys.Algebra.linMap_eq_of_resolution
#print axioms Phys.Algebra.op_sqrt_unique_of_injective
#print axioms Phys.Algebra.linIsom_JsqrtJ_eq_posInv
#print axioms Phys.Algebra.isometry_compact_part_isQvIsom
#print axioms Phys.Algebra.boostEndC_compact_part_isQvIsom
#print axioms Phys.Algebra.not_op_sqrt_unique_clash
-- N94 — Phys.Algebra.LorentzContinuumSpin9Reach: A CONCRETE biMulFun 2-PLANE ROTATION WITNESS —
--   the order-2 half-turn realized as a single two-sided generator, the immediately-bankable
--   SO(9)-reachability piece toward the Spin(9)→SO(9) exhaustion, over the derived ℝ Cut + O Cut.
--   (A) biMulFun_imag_sq — ★ the CORE: u·((u·(v·u))·u) = v for unit-imaginary u (u·u = −1,
--       u·(u·v) = −v), the two-sided square via the banked octonion alternative laws (mul_flex,
--       mul_mul_right, N5b).
--   (B) biMulFun_imag_involutive / _comp — ★★ the order-2 half-turn (pointwise + composition form).
--   (C) biMulFun_imag_negates_one / _negates_self / _fixes_anticomm — ★ the 2-plane geometry:
--       negate span{1,u}, FIX the anticommuting complement.
--   (D) biMulFun_imag_mem_gen2 — the unit half-turn lies in the extended generated group.
--   (E) biMulFun_e2_sq / _involutive / _fixes_j / _mem_gen2 — the CONCRETE e₂ realization; _fixes_j
--       is the W8 teeth (the half-turn FIXES the anticommuting unit ιe₂, NOT a whole-block −id).
#print axioms Phys.Algebra.biMulFun_imag_sq
#print axioms Phys.Algebra.biMulFun_imag_involutive
#print axioms Phys.Algebra.biMulFun_imag_involutive_comp
#print axioms Phys.Algebra.biMulFun_imag_negates_one
#print axioms Phys.Algebra.biMulFun_imag_negates_self
#print axioms Phys.Algebra.biMulFun_imag_fixes_anticomm
#print axioms Phys.Algebra.biMulFun_imag_mem_gen2
#print axioms Phys.Algebra.biMulFun_e2_sq
#print axioms Phys.Algebra.biMulFun_e2_involutive
#print axioms Phys.Algebra.biMulFun_e2_fixes_j
#print axioms Phys.Algebra.biMulFun_e2_mem_gen2
-- N95 — A FINITE PRODUCT OF biMulFun GENERATORS: a 2-plane rotation in a NEW (purely-imaginary)
--   plane — the structural exhaustion step toward Spin(9)→SO(9), over the derived ℝ Cut + O Cut.
--   (A) the product of two anticommuting unit-imaginary half-turns FIXES the real axis (1↦1),
--       NEGATES the imaginary plane span{u,w}, FIXES the common complement; (B) the product lies
--       in genIsomMonoidC2; (C) ιe₂ is a unit-imaginary over Cut; (D) the CONCRETE e₂/ιe₂ product
--       FIXES the real axis (W8 teeth — a single half-turn would send 1↦−1) and ∈ genIsomMonoidC2.
#print axioms Phys.Algebra.biMulFun_imag_negates_neg_one
#print axioms Phys.Algebra.biMulComp_fixes_one
#print axioms Phys.Algebra.biMulComp_negates_u
#print axioms Phys.Algebra.biMulComp_negates_w
#print axioms Phys.Algebra.biMulComp_fixes_common
#print axioms Phys.Algebra.biMulComp_mem_gen2
#print axioms Phys.Algebra.biMulComp_apply
#print axioms Phys.Algebra.je2_imag
#print axioms Phys.Algebra.je2_alt
#print axioms Phys.Algebra.je2_sq
#print axioms Phys.Algebra.je2_gFormC_self
#print axioms Phys.Algebra.e2_je2_anticomm
#print axioms Phys.Algebra.biMulComp_e2_je2_fixes_one
#print axioms Phys.Algebra.biMulComp_e2_je2_negates_e2
#print axioms Phys.Algebra.biMulComp_e2_je2_mem_gen2
-- N96 — THE AFFINE SPECTRAL PATH: the positive (boost/self-adjoint) part of a polar/KAK split is
--   connected to the identity THROUGH THE CONE OF POSITIVE OPERATORS by a STRAIGHT-LINE eigenvalue
--   segment, over the derived ℝ Cut + O Cut — dissolving the missing continuous power (c i)^t /
--   operator exp into convex ordered-field arithmetic. The path γ(t) := specOpN ((1−t)+t·cutSqrt∘c) u
--   has γ(0)=id (resolution-of-identity N87), γ(1)=p^{1/2} (spectral root N68), is self-adjoint ∀t,
--   and stays positive-semidefinite ∀t∈[0,1]; packaged as specPathOp_connects with a concrete rank-4
--   non-vacuity witness + the W8 midpoint reading 3/2.
#print axioms Phys.Algebra.specPathOp_zero
#print axioms Phys.Algebra.specPathOp_one
#print axioms Phys.Algebra.specPathOp_isEvCSymm
#print axioms Phys.Algebra.specPathOp_nonneg
#print axioms Phys.Algebra.specPathOp_connects
#print axioms Phys.Algebra.specPathOp_mix4_witness
#print axioms Phys.Algebra.specPathOp_mix4_mid_read
-- N97 — THE PACKAGED REVERSE-SURJECTIVITY / POLAR-PATH DECOMPOSITION WITNESS: every isometry g
--   factors as g = k·γ(1) with k itself an isometry (the compact/orthogonal factor, N93) and γ the
--   affine spectral path (N96) of cone-positive self-adjoint operators from γ(0)=id to γ(1)=p^{1/2},
--   over the derived ℝ Cut + O Cut. The positive factor of the polar split is the ENDPOINT OF A
--   CONE-PATH FROM THE IDENTITY — the structural skeleton of the global reverse surjectivity in one
--   statement, WITHOUT any continuous power / operator exp / operator topology. Concrete boost
--   non-vacuity + the W8 reconstruction coordinate 4/3.
#print axioms Phys.Algebra.isometry_polar_path_decomp
#print axioms Phys.Algebra.boost_polar_path_decomp
#print axioms Phys.Algebra.boost_polar_recon_coord
-- N98 — THE DISTINCT-UNITS TWO-SIDED GENERATOR CARRIES THE REAL AXIS ONTO A PRODUCT UNIT: the
--   off-diagonal generator biMulFun u u' (distinct anticommuting unit-imaginaries u ≠ u') swaps the
--   real axis 1 ↔ u·u' (a NEW product-unit 2-plane span{1, u·u'}, reached by NEITHER the diagonal
--   half-turn N94 — which keeps 1 on the real line at −1 — NOR the imaginary-plane product N95 —
--   which fixes 1), the product unit u·u' is itself a Born-unit, the generator is order-2 on the
--   2-plane and ∈ genIsomMonoidC2, over the derived ℝ Cut + O Cut. Concrete e₂·ιe₂ off-axis
--   (re.re.re = 0) with the W8 swap coordinate im.im.re = −1.
#print axioms Phys.Algebra.biMulFun_distinct_swap_one
#print axioms Phys.Algebra.biMulFun_distinct_swap_prod
#print axioms Phys.Algebra.biMulFun_distinct_prod_born
#print axioms Phys.Algebra.biMulFun_distinct_mem_gen2
#print axioms Phys.Algebra.biMulFun_distinct_order2_one
#print axioms Phys.Algebra.biMulFun_e2je2_offaxis
#print axioms Phys.Algebra.biMulFun_e2je2_swap_coord
#print axioms Phys.Algebra.biMulFun_e2je2_distinct_mem
#print axioms Phys.Algebra.biMulFun_e2je2_order2_one
-- N99 — THE Module.End ↔ Function.End MONOID BRIDGE: the faithful monoid homomorphism that renders
--   the polar/KAK compact part (a Module.End operator, N93) and the two-sided Moufang generators
--   (Function.End self-maps, N55/N98) commensurable in ONE monoid, making the global reverse
--   surjectivity qvIsomMonoidC ≤ genIsomMonoidC2 a WELL-POSED membership question. The coercion
--   ⇑ : Module.End Cut STVC → Function.End STVC is an injective monoid hom; it reflects the QvC-
--   isometry predicate; the generators biMulFun u u' are bridge-images of explicit Cut-linear
--   operators biMulLin u u'; and the bridged compact part lands in qvIsomMonoidC. Over the derived
--   ℝ Cut + O Cut. The generation proper / operator topology / Spin(9)→SO(9) stay childed N100.
#print axioms Phys.Algebra.endToFunEnd
#print axioms Phys.Algebra.endToFunEnd_apply
#print axioms Phys.Algebra.endToFunEnd_injective
#print axioms Phys.Algebra.endToFunEnd_mem_qvIsomMonoidC_iff
#print axioms Phys.Algebra.biMulLin
#print axioms Phys.Algebra.endToFunEnd_biMulLin
#print axioms Phys.Algebra.biMulLin_mem_gen2
#print axioms Phys.Algebra.isometry_compact_part_mem_qvIsomMonoidC
#print axioms Phys.Algebra.boost_compact_part_mem_qvIsomMonoidC
#print axioms Phys.Algebra.endToFunEnd_biMulLin_e2_coord
-- N100 — THE ALGEBRAIC GENERATION TRANSPORT: the Module.End-side two-sided generators (the Cut-
--   linear operators biMulLin u u') close into a submonoid genIsomMonoidLin whose bridge-image under
--   endToFunEnd lands in the Function.End-side generated isometry submonoid genIsomMonoidC2 — every
--   finite product of the linear generators, pushed across the faithful bridge, IS a finite product
--   of the bare-self-map generators (Submonoid.closure_induction over map_one/map_mul). The concrete
--   Cut-linear 2-plane rotation genTwoPlaneLin u w = biMulLin w w * biMulLin u u bridges to the N95
--   imaginary-plane composite and lands in genIsomMonoidC2; the concrete e₂,ιe₂ rotation fixes the
--   real axis (deep coord re.re.re = 1). Over the derived ℝ Cut + O Cut. The converse generation
--   (arbitrary compact part IS a biMulLin product) / operator topology / Spin(9)→SO(9) stay childed N101.
#print axioms Phys.Algebra.biMulGenSetLin
#print axioms Phys.Algebra.genIsomMonoidLin
#print axioms Phys.Algebra.biMulGenSetLin_image_subset
#print axioms Phys.Algebra.endToFunEnd_genIsomMonoidLin_mem_gen2
#print axioms Phys.Algebra.endToFunEnd_map_genIsomMonoidLin_le
#print axioms Phys.Algebra.genTwoPlaneLin
#print axioms Phys.Algebra.genTwoPlaneLin_apply
#print axioms Phys.Algebra.endToFunEnd_genTwoPlaneLin
#print axioms Phys.Algebra.genTwoPlaneLin_mem_genLin
#print axioms Phys.Algebra.genTwoPlaneLin_mem_gen2
#print axioms Phys.Algebra.genTwoPlaneLin_e2je2_fixes_one
#print axioms Phys.Algebra.genTwoPlaneLin_e2je2_real_coord
-- N101 — THE CONVERSE GENERATION ON THE BOOST (NON-COMPACT) SECTOR: a proper orthochronous boost
--   boostEndC a b (a²−b²=1, a±b≥0) is EvC-self-adjoint AND EvC-positive-semidefinite, so it IS its own
--   polar positive part p^{1/2} = √(g*g); by positive-operator-root uniqueness on the injective square
--   the spectral root EQUALS the boost, so the polar/KAK compact part k := g∘(p^{1/2})⁻¹ = IDENTITY (the
--   empty two-sided generator word) ∈ genIsomMonoidLin, and its bridge-image ∈ genIsomMonoidC2 — the
--   CONVERSE direction of qvIsomMonoidC ≤ genIsomMonoidC2, DISCHARGED on the entire boost sector with
--   NO operator topology. A pure boost contributes the trivial element to the compact generation. Over
--   the derived ℝ Cut + O Cut. The compact-sector generation / operator topology / Spin(9)→SO(9) stay childed N102.
#print axioms Phys.Algebra.boostEndC_nonneg
#print axioms Phys.Algebra.boostEndC_compact_part_eq_id
#print axioms Phys.Algebra.boostEndC_compact_part_mem_genLin
#print axioms Phys.Algebra.boostEndC_compact_part_mem_gen2
#print axioms Phys.Algebra.boostEndC_5343_compact_part_id_coord
-- N102 — THE CONVERSE GENERATION ON THE COMPACT (ROTATION) SECTOR: a two-sided half-turn
--   biMulLin u u (unit-imaginary u, u·u=−1) is EvC-self-adjoint AND an involution (g∘g=id), so its
--   polar positive part p = g*∘g = id, hence p^{1/2}=id, and the polar/KAK compact part
--   k := g∘(p^{1/2})⁻¹ = g ITSELF — a NONTRIVIAL single two-sided generator ∈ genIsomMonoidLin, and
--   its bridge-image ∈ genIsomMonoidC2 (the N100 transport) — the CONVERSE direction of
--   qvIsomMonoidC ≤ genIsomMonoidC2, DISCHARGED on a concrete genuinely-COMPACT generator with NO
--   operator topology. The DUAL of N101 (the boost contributes k=id; the half-turn contributes k=g).
--   Over the derived ℝ Cut + O Cut. The arbitrary-word compact generation / operator topology /
--   Spin(9)→SO(9) exhaustion stay childed N103.
#print axioms Phys.Algebra.biMulLin_imag_isQvIsomC
#print axioms Phys.Algebra.biMulLin_imag_involutive
#print axioms Phys.Algebra.biMulLin_apply_coord
#print axioms Phys.Algebra.biMulLin_imag_polarized_isom
#print axioms Phys.Algebra.biMulLin_imag_isEvCAdjoint_self
#print axioms Phys.Algebra.biMulLin_imag_compact_part_eq_self
#print axioms Phys.Algebra.biMulLin_imag_compact_part_mem_genLin
#print axioms Phys.Algebra.biMulLin_imag_compact_part_mem_gen2
#print axioms Phys.Algebra.biMulLin_e2_compact_part_neg_coord
-- N103 — THE CONVERSE GENERATION ON A PRODUCT-OF-HALF-TURNS COMPACT ROTATION: a concrete 2-plane
--   rotation product genTwoPlaneLin u w = biMulLin w w * biMulLin u u (a product of two two-sided
--   half-turns) is EvC-ORTHOGONAL (g*∘g = (A∘B)∘(B∘A) = A∘A = id, collapsing the involutions), so
--   its polar positive part p = id, hence p^{1/2}=id, and the polar/KAK compact part
--   k := g∘(p^{1/2})⁻¹ = g ITSELF — a NONTRIVIAL TWO-GENERATOR biMulLin word ∈ genIsomMonoidLin, and
--   its bridge-image ∈ genIsomMonoidC2 (the N100 transport) — the CONVERSE direction of
--   qvIsomMonoidC ≤ genIsomMonoidC2, DISCHARGED on a concrete genuinely-COMPACT MULTI-GENERATOR with
--   NO operator topology. The multi-generator extension of N102 (single half-turn → itself). Over
--   the derived ℝ Cut + O Cut. The unbounded-word generation / operator topology / Spin(9)→SO(9)
--   exhaustion stay childed N104.
#print axioms Phys.Algebra.genTwoPlaneLin_isQvIsomC
#print axioms Phys.Algebra.genTwoPlaneLin_isEvCAdjoint
#print axioms Phys.Algebra.genTwoPlaneLin_adjoint_comp_self
#print axioms Phys.Algebra.genTwoPlaneLin_compact_part_eq_self
#print axioms Phys.Algebra.genTwoPlaneLin_compact_part_mem_genLin
#print axioms Phys.Algebra.genTwoPlaneLin_compact_part_mem_gen2
#print axioms Phys.Algebra.genTwoPlaneLin_e2je2_compact_part_real_coord
-- N104 — THE GENERAL EvC-ORTHOGONAL LEVER (abstract, word-length-independent converse-generation
--   core) + the GENERAL REDUCTION (to the single residual word-membership surjectivity) + a
--   concrete THREE-generator word (the lever past word-length two). The compact-part-IS-self half
--   of the converse generation closed in FULL generality; the word-membership half (the literal
--   Spin(9) generation surjectivity) + the operator topology over Cut + the Spin(9)→SO(9)
--   exhaustion stay childed N105.
#print axioms Phys.Algebra.evCOrthogonal_compact_part_eq_self
#print axioms Phys.Algebra.evCOrthogonal_word_compact_part_mem_gen2
#print axioms Phys.Algebra.triHalfTurnLin_isQvIsomC
#print axioms Phys.Algebra.triHalfTurnLin_isEvCAdjoint
#print axioms Phys.Algebra.triHalfTurnLin_adjoint_comp_self
#print axioms Phys.Algebra.triHalfTurnLin_mem_genLin
#print axioms Phys.Algebra.triHalfTurnLin_compact_part_eq_self
#print axioms Phys.Algebra.triHalfTurnLin_compact_part_mem_gen2
#print axioms Phys.Algebra.triHalfTurnLin_e2je2e2_compact_part_real_coord
-- N105 — THE WORD-MEMBERSHIP OBSTRUCTION. The biMulLin-word x-rigidity (every word in
--   genIsomMonoidLin fixes the time and x coordinates, reaching at most the octonion-block SO(8)
--   sector) + a concrete EvC-orthogonal QvC-isometry that MOVES x (the x-negation xNegLin and the
--   genuine SO(2) ninth-direction rotation planeRotLin), hence is NOT a biMulLin word — REFUTING
--   the literal residual (R) "every EvC-orthogonal QvC-isometry is a biMulLin word". The missing
--   x↔𝕆 ninth-direction generator is genuine (a gap in the generating SET, not the proof). Over
--   the derived ℝ Cut + O Cut. The enlarged-alphabet converse / operator topology / Spin(9)→SO(9)
--   exhaustion stay childed N106.
#print axioms Phys.Algebra.genIsomMonoidLin_fixes_fst
#print axioms Phys.Algebra.genIsomMonoidLin_fixes_snd
#print axioms Phys.Algebra.xNegLin_isQvIsomC
#print axioms Phys.Algebra.xNegLin_isEvCAdjoint_self
#print axioms Phys.Algebra.xNegLin_comp_self
#print axioms Phys.Algebra.xNegLin_compact_part_eq_self
#print axioms Phys.Algebra.xNegLin_not_mem_genIsomMonoidLin
#print axioms Phys.Algebra.planeRotLin_isQvIsomC
#print axioms Phys.Algebra.planeRotLin_moves_x
#print axioms Phys.Algebra.planeRotLin_not_mem_genIsomMonoidLin
-- N106 — THE ENLARGED-ALPHABET CONVERSE GENERATION. Adjoin the x↔𝕆 ninth-direction rotation
--   generator (planeRotLin, N105) to the biMulLin alphabet, forming the enlarged generated
--   submonoid genIsomMonoidLinPlus. SOUNDNESS (every enlarged word is a QvC-isometry) + STRICT
--   enlargement (the N105 obstruction planeRotLin (3/5)(4/5) is the strictness witness:
--   ∈ Plus, ∉ the biMulLin-word submonoid) + a concrete SO(8)·(ninth-rotation) higher-rank
--   compact rotation enlargedTwoPlaneNinth = planeRotLin · genTwoPlaneLin that moves x, an
--   enlarged word no biMulLin word realises. Over the derived ℝ Cut + O Cut. The full compact-SO(9)
--   surjectivity / operator topology over Cut / Spin(9)→SO(9) exhaustion stay childed N107.
#print axioms Phys.Algebra.biMulLin_isQvIsomC
#print axioms Phys.Algebra.genIsomMonoidLinPlus_isQvIsomC
#print axioms Phys.Algebra.genIsomMonoidLin_le_genIsomMonoidLinPlus
#print axioms Phys.Algebra.planeRotLin_mem_genIsomMonoidLinPlus
#print axioms Phys.Algebra.genIsomMonoidLin_lt_genIsomMonoidLinPlus
#print axioms Phys.Algebra.enlargedTwoPlaneNinth_mem
#print axioms Phys.Algebra.enlargedTwoPlaneNinth_isQvIsomC
#print axioms Phys.Algebra.enlargedTwoPlaneNinth_moves_x
#print axioms Phys.Algebra.enlargedTwoPlaneNinth_not_mem_genIsomMonoidLin
-- N107 — THE NINTH-ROTATION CIRCLE SUBGROUP (the abelian A-factor / maximal torus of the
--   SO(9)=SO(8)·A·SO(8) KAK decomposition). The ninth-direction rotations planeRotLin c s form a
--   CLOSED 1-parameter abelian subgroup ≅ SO(2) inside the enlarged submonoid: the angle-addition
--   composition law planeRotLin c₁ s₁ * planeRotLin c₂ s₂ = planeRotLin (c₁c₂−s₁s₂)(c₁s₂+s₁c₂)
--   (unconditional), the circle closed under it (circlePoint_mul), the identity (planeRotLin 1 0),
--   the inverse (planeRotLin c (−s)), composite ∈ enlarged submonoid, composite a QvC-isometry, and
--   the concrete double-angle of (3/5,4/5) → (−7/25,24/25) moving x. Over the derived ℝ Cut + O Cut.
--   The full compact-SO(9) surjectivity (SO(8)-generation + KAK assembly + operator topology over
--   Cut) stays the childed heavy remainder N108.
#print axioms Phys.Algebra.reQC_one
#print axioms Phys.Algebra.planeRotLin_one
#print axioms Phys.Algebra.planeRotLin_mul
#print axioms Phys.Algebra.circlePoint_mul
#print axioms Phys.Algebra.planeRotLin_mul_inv
#print axioms Phys.Algebra.ninthRot_mul_mem_ninthGenSetLin
#print axioms Phys.Algebra.planeRotLin_mul_mem_genIsomMonoidLinPlus
#print axioms Phys.Algebra.planeRotLin_mul_isQvIsomC
#print axioms Phys.Algebra.planeRotDouble_eq
#print axioms Phys.Algebra.planeRotDouble_moves_x
-- N108 — THE OCTONION-BLOCK SO(8)-GENERATION LEG (a concrete multi-block factorization). A product
--   of two genTwoPlaneLin octonion-block 2-plane rotations doubleBlockLin u w a b =
--   genTwoPlaneLin a b * genTwoPlaneLin u w (a four-generator biMulLin word): ∈ genIsomMonoidLin
--   (mul_mem), a QvC-isometry (composition of two genTwoPlaneLin isometries), bridged ∈
--   genIsomMonoidC2 (the N100 transport), and bridging to the nested four-factor biMulFun composite.
--   The HIGHER-RANK witness: the concrete third unit ke2je2 = e₂·ιe₂ (Born-unit-imaginary) is FIXED
--   by the first block genTwoPlaneLin e₂ ιe₂ but NEGATED by the double block — a strictly
--   higher-rank octonion-block rotation reaching a 2-plane the single block leaves fixed (coord 1 vs
--   −1). Over the derived ℝ Cut + O Cut. The full SO(8)-generation + KAK assembly + operator
--   topology over Cut stay the childed heavy remainder N109.
#print axioms Phys.Algebra.doubleBlockLin_apply
#print axioms Phys.Algebra.doubleBlockLin_mem_genLin
#print axioms Phys.Algebra.doubleBlockLin_isQvIsomC
#print axioms Phys.Algebra.doubleBlockLin_mem_gen2
#print axioms Phys.Algebra.doubleBlock_bridge_eq
#print axioms Phys.Algebra.doubleBlock_bridge_apply
#print axioms Phys.Algebra.ke2je2_sq
#print axioms Phys.Algebra.ke2je2_imag
#print axioms Phys.Algebra.ke2je2_gFormC_self
#print axioms Phys.Algebra.block1_fixes_ke2je2
#print axioms Phys.Algebra.doubleBlock_e2je2_negates_ke2je2
#print axioms Phys.Algebra.doubleBlock_e2je2_coord

-- N109 — THE TRIPLE-BLOCK SO(8)-GENERATION LEG (a concrete rank-≥6 octonion-block factorization,
--   extending N108's two-block witness one rank higher). A product of three genTwoPlaneLin
--   octonion-block 2-plane rotations tripleBlockLin u w a b c d = genTwoPlaneLin c d *
--   doubleBlockLin u w a b (a six-generator biMulLin word): ∈ genIsomMonoidLin (mul_mem of
--   genTwoPlaneLin_mem_genLin and doubleBlockLin_mem_genLin), a QvC-isometry (composition of three
--   genTwoPlaneLin isometries), bridged ∈ genIsomMonoidC2 (the N100 transport), and bridging to the
--   nested six-factor biMulFun composite. The rank-≥6 witness: the concrete fourth unit ii4 =
--   iota(iota(Dbl.J)) (the embedded complex unit, a Born-unit-imaginary outside the quaternion
--   span{e₂,ιe₂,ke2je2}) is FIXED by BOTH the single block and the double block but NEGATED by the
--   triple block — a strictly higher-rank octonion-block rotation reaching a THIRD 2-plane both lower
--   blocks leave fixed (coord −1 vs +1). Over the derived ℝ Cut + O Cut. The full SO(8)-generation
--   rank-induction + KAK assembly + operator topology over Cut stay the childed heavy remainder N110.
#print axioms Phys.Algebra.ii4_imag
#print axioms Phys.Algebra.ii4_sq
#print axioms Phys.Algebra.ii4_alt
#print axioms Phys.Algebra.ii4_gFormC_self
#print axioms Phys.Algebra.ke2je2_alt
#print axioms Phys.Algebra.tripleBlockLin_apply
#print axioms Phys.Algebra.tripleBlockLin_mem_genLin
#print axioms Phys.Algebra.tripleBlockLin_isQvIsomC
#print axioms Phys.Algebra.tripleBlockLin_mem_gen2
#print axioms Phys.Algebra.tripleBlock_bridge_eq
#print axioms Phys.Algebra.tripleBlock_bridge_apply
#print axioms Phys.Algebra.e2_ii4_anticomm
#print axioms Phys.Algebra.je2_ii4_anticomm
#print axioms Phys.Algebra.ke2je2_ii4_anticomm
#print axioms Phys.Algebra.block2_fixes_ii4
#print axioms Phys.Algebra.tripleBlock_negates_ii4
#print axioms Phys.Algebra.tripleBlock_ii4_coord
-- N110 — THE QUAD-BLOCK SO(8)-GENERATION LEG (a concrete rank-≥8 octonion-block factorization,
--   extending N109's three-block witness one rank higher to the TOP of the explicit-witness ladder).
--   A product of four genTwoPlaneLin octonion-block 2-plane rotations quadBlockLin u w a b c d e f =
--   genTwoPlaneLin e f * tripleBlockLin u w a b c d (an eight-generator biMulLin word): ∈
--   genIsomMonoidLin (mul_mem of genTwoPlaneLin_mem_genLin and tripleBlockLin_mem_genLin), a
--   QvC-isometry (composition of four genTwoPlaneLin isometries), bridged ∈ genIsomMonoidC2 (the N100
--   transport), and bridging to the nested eight-factor biMulFun composite. The rank-≥8 witness: the
--   concrete fifth unit ii5 = ii4·ιe₂ (the embedded quaternion unit k = i·j, a Born-unit-imaginary
--   outside the span{e₂,ιe₂,ke2je2,ii4}) is FIXED by the single, double AND triple block but NEGATED
--   by the quad block — the strictly-highest-rank explicit octonion-block rotation reaching a FOURTH
--   2-plane all three lower blocks leave fixed (coord −1 vs +1), the full rank on the 8-dim octonion
--   space. Over the derived ℝ Cut + O Cut. The abstract general SO(8)-generation rank-induction + KAK
--   assembly + operator topology over Cut stay the childed heavy remainder N111.
#print axioms Phys.Algebra.ii5_sq
#print axioms Phys.Algebra.ii5_imag
#print axioms Phys.Algebra.ii5_alt
#print axioms Phys.Algebra.ii5_gFormC_self
#print axioms Phys.Algebra.quadBlockLin_apply
#print axioms Phys.Algebra.quadBlockLin_mem_genLin
#print axioms Phys.Algebra.quadBlockLin_isQvIsomC
#print axioms Phys.Algebra.quadBlockLin_mem_gen2
#print axioms Phys.Algebra.quadBlock_bridge_eq
#print axioms Phys.Algebra.quadBlock_bridge_apply
#print axioms Phys.Algebra.e2_ii5_anticomm
#print axioms Phys.Algebra.je2_ii5_anticomm
#print axioms Phys.Algebra.ke2je2_ii5_anticomm
#print axioms Phys.Algebra.ii4_ii5_anticomm
#print axioms Phys.Algebra.block3_fixes_ii5
#print axioms Phys.Algebra.quadBlock_negates_ii5
#print axioms Phys.Algebra.quadBlock_ii5_coord

-- N111 — THE GENERAL SO(8)-GENERATION RANK-INDUCTION (the ABSTRACT, arbitrary-length octonion-block
--   word — the explicit-witness ladder having TOPPED OUT at rank 8 since O Cut is 8-dimensional).
--   blockWordLin : List (O Cut × O Cut) → Module.End Cut STVC is the List-fold of genTwoPlaneLin
--   products ([] ↦ 1, (u,w)::rest ↦ genTwoPlaneLin u w * blockWordLin rest), generalizing the
--   explicit ladder (single/double/triple/quad block = the length-1/2/3/4 lists). Proved by LIST
--   INDUCTION: ∈ genIsomMonoidLin at arbitrary length (blockWordLin_mem_genLin, the full generation
--   reach), a QvC-isometry at arbitrary length (blockWordLin_isQvIsomC), the bridge transport
--   (blockWordLin_mem_gen2), the nested biMulFun cons step (blockWordFun_apply), THE RANK-FIXES
--   (blockWordLin_fixes_anticomm — z anticommuting with every unit ⇒ the word fixes (0,0,z), the
--   abstract generalization of block1/2/3_fixes), and THE RANK-STEP NEGATION (blockWordLin_negates —
--   prepend a z-block onto a word that fixes z ⇒ negation, the abstract generalization of
--   double/triple/quadBlock_negates). W8 non-vacuity: the concrete length-4 word recovers the rank-≥8
--   witness (blockWord_ii5_concrete / blockWord_ii5_coord, deep slot −1). Over the derived ℝ Cut +
--   O Cut. The KAK assembly + operator topology over Cut stay the childed heavy remainder N112.
#print axioms Phys.Algebra.blockWordLin_nil
#print axioms Phys.Algebra.blockWordLin_cons
#print axioms Phys.Algebra.blockWordLin_mem_genLin
#print axioms Phys.Algebra.blockWordLin_isQvIsomC
#print axioms Phys.Algebra.blockWordLin_mem_gen2
#print axioms Phys.Algebra.blockWordFun_apply
#print axioms Phys.Algebra.blockWordLin_fixes_anticomm
#print axioms Phys.Algebra.blockWordLin_negates
#print axioms Phys.Algebra.blockWord_ii5_concrete
#print axioms Phys.Algebra.blockWord_ii5_coord
-- N112 — THE KAK-SANDWICH ASSEMBLY SO(8)·A·SO(8) AND THE SINGLE-PLANE DEGENERATION (the
--   measure-first finding). The KAK sandwich kakWordLin L₁ L₂ c s := blockWordLin L₂ · planeRotLin
--   c s · blockWordLin L₁ is a sound enlarged compact isometry (kakWordLin_mem ∈ genIsomMonoidLinPlus,
--   kakWordLin_isQvIsomC) — the ⊇ direction. THE FINDING: the octonion-block words FIX t, x AND the
--   real octonion axis 1 (vTwoPlane_fix_one) and PRESERVE reQC (vTwoPlane_reQC, via the polarization
--   gFormC_polarize of the Born composition law), acting only on the imaginary block, while
--   planeRotLin acts only on span{x,1}; so each genTwoPlaneLin COMMUTES with the A-torus ninth
--   rotation (commuteBlockNinth ⇒ genTwoPlaneLin_commute_planeRot), lifted to arbitrary length by ONE
--   list induction (blockWordLin_commute_planeRot). Hence the single-plane KAK sandwich DEGENERATES
--   (kakWordLin_degenerate): kakWordLin L₁ L₂ c s = blockWordLin (L₂ ++ L₁) · planeRotLin c s — a
--   mere SO(8)·A product, NOT a genuine three-factor SO(9). A single A-plane is structurally
--   insufficient for the full compact SO(9); the genuine remainder is the full ninth-generator family
--   (x ↔ eᵢ against EACH octonion axis), childed N113. W8: a concrete active sandwich moves x to 3/5
--   (kakWord_e2je2_x). Over the derived ℝ Cut + O Cut.
#print axioms Phys.Algebra.kakWordLin_mem
#print axioms Phys.Algebra.kakWordLin_isQvIsomC
#print axioms Phys.Algebra.biMulV
#print axioms Phys.Algebra.vTwoPlane
#print axioms Phys.Algebra.genTwoPlaneLin_vblock
#print axioms Phys.Algebra.vTwoPlane_fix_one
#print axioms Phys.Algebra.gFormC_polarize
#print axioms Phys.Algebra.vTwoPlane_gFormC_diag
#print axioms Phys.Algebra.vTwoPlane_reQC
#print axioms Phys.Algebra.commuteBlockNinth
#print axioms Phys.Algebra.genTwoPlaneLin_commute_planeRot
#print axioms Phys.Algebra.blockWordLin_commute_planeRot
#print axioms Phys.Algebra.blockWordLin_append
#print axioms Phys.Algebra.kakWordLin_degenerate
#print axioms Phys.Algebra.kakWord_e2je2_x
#print axioms Phys.Algebra.kakWord_e2je2_x_val
-- N113 — THE FULL NINTH-DIRECTION GENERATOR FAMILY x ↔ eᵢ (a GENERAL octonion axis) AND THE
--   NON-COMMUTATION WITH THE OCTONION-BLOCK WORDS (the structural complement to N112's commuting
--   single A-plane). axisRotLin e c s rotates span{x, e} for a general unit axis e, reading the
--   e-component gFormC v e (the e = 1 case IS N105's planeRotLin, axisRotLin_one_eq_planeRotLin); it
--   is a QvC-isometry (axisRotLin_isQvIsomC, via the general-axis completing-the-square
--   gFormC_add_axis_self). The full family ninthFamilyGenSetLin enlarges the alphabet to
--   genIsomMonoidLinFamily (SOUND: genIsomMonoidLinFamily_isQvIsomC; CONTAINS N106's single-axis
--   alphabet: genIsomMonoidLinPlus_le_genIsomMonoidLinFamily). THE JOINT (the structural opposite of
--   N112): the banked word genTwoPlaneLin e₂ je2 NEGATES e₂ (vTwoPlane_e2_je2_e2), so axisRotLin e₂ c
--   s does NOT commute with it (axisRotLin_word_not_commute) — the two orders read x-slot +s vs −s at
--   (0,0,e₂); strictly beyond the SO(8)·A sector. W8: the concrete (3/5,4/5) reads 4/5 vs −4/5. Over
--   the derived ℝ Cut + O Cut.
#print axioms Phys.Algebra.axisRotLin
#print axioms Phys.Algebra.axisRotLin_apply
#print axioms Phys.Algebra.axisRotLin_one_eq_planeRotLin
#print axioms Phys.Algebra.gFormC_add_axis_self
#print axioms Phys.Algebra.axisRotLin_isQvIsomC
#print axioms Phys.Algebra.ninthFamilyGenSetLin
#print axioms Phys.Algebra.genIsomMonoidLinFamily
#print axioms Phys.Algebra.genIsomMonoidLinFamily_isQvIsomC
#print axioms Phys.Algebra.axisRotLin_mem_genIsomMonoidLinFamily
#print axioms Phys.Algebra.ninthGenSetLin_subset_ninthFamily
#print axioms Phys.Algebra.genIsomMonoidLinPlus_le_genIsomMonoidLinFamily
#print axioms Phys.Algebra.vTwoPlane_e2_je2_e2
#print axioms Phys.Algebra.gFormC_neg_e2_e2
#print axioms Phys.Algebra.axisRot_word_e2
#print axioms Phys.Algebra.word_axisRot_e2
#print axioms Phys.Algebra.axisRotLin_word_not_commute
#print axioms Phys.Algebra.axisRot_word_e2_val
#print axioms Phys.Algebra.word_axisRot_e2_val
-- N114 — THE FULL-SO(9) ASSEMBLY THROUGH THE GENERAL-AXIS FAMILY (the concrete higher-sector witness).
#print axioms Phys.Algebra.enlargedAxisNinth
#print axioms Phys.Algebra.genIsomMonoidLin_le_family
#print axioms Phys.Algebra.enlargedAxisNinth_mem
#print axioms Phys.Algebra.enlargedAxisNinth_isQvIsomC
#print axioms Phys.Algebra.enlargedAxisNinth_e2_apply
#print axioms Phys.Algebra.enlargedAxisNinth_e2_moves_x
#print axioms Phys.Algebra.enlargedAxisNinth_e2_reads_s
#print axioms Phys.Algebra.enlargedTwoPlaneNinth_e2_reads_zero
#print axioms Phys.Algebra.enlargedAxisNinth_e2_not_mem_genIsomMonoidLin
#print axioms Phys.Algebra.enlargedAxisNinth_ne_enlargedTwoPlaneNinth
#print axioms Phys.Algebra.five_twelve_thirteen_sq
#print axioms Phys.Algebra.twelve_thirteenths_ne_zero
#print axioms Phys.Algebra.enlargedAxisNinth_e2_deep_val
-- N115 — THE x-MOVING → x-FIXING DEFLATION STEP (the SO(9) → SO(8) reduction).
#print axioms Phys.Algebra.deflateNinth
#print axioms Phys.Algebra.gFormC_pos_of_ne
#print axioms Phys.Algebra.deflate_r_ne
#print axioms Phys.Algebra.deflateNinth_axis_unit
#print axioms Phys.Algebra.deflateNinth_circle
#print axioms Phys.Algebra.deflateNinth_mem
#print axioms Phys.Algebra.deflateNinth_isQvIsomC
#print axioms Phys.Algebra.isom_xaxis_image_norm
#print axioms Phys.Algebra.deflateNinth_apply_image
#print axioms Phys.Algebra.deflateNinth_step
#print axioms Phys.Algebra.deflate_witness_norm
#print axioms Phys.Algebra.deflate_witness_v_ne
#print axioms Phys.Algebra.deflate_witness_x_val
-- N116 — THE EXHAUSTION-ASSEMBLY FACTORIZATION (the inverse ninth rotation + the factorization).
#print axioms Phys.Algebra.axisRotLin_comp_same_axis
#print axioms Phys.Algebra.axisRotLin_one_zero
#print axioms Phys.Algebra.inflateNinth
#print axioms Phys.Algebra.inflateNinth_circle
#print axioms Phys.Algebra.inflateNinth_mem
#print axioms Phys.Algebra.inflateNinth_isQvIsomC
#print axioms Phys.Algebra.inflate_deflate_id
#print axioms Phys.Algebra.inflateNinth_apply_pole
#print axioms Phys.Algebra.deflate_factorization
#print axioms Phys.Algebra.deflate_factorization_stabilizer
#print axioms Phys.Algebra.inflate_witness_x_val
-- N117 — THE OCTONION-BLOCK AXIS-FIXING REFLECTION DEFLATION (the SO(8) analogue of N115's x-deflation).
#print axioms Phys.Algebra.octRefl_trace_id
#print axioms Phys.Algebra.octRefl_gFormC_imag_right
#print axioms Phys.Algebra.octRefl_polarize_imag
#print axioms Phys.Algebra.octRefl_selfconj_eq_smul
#print axioms Phys.Algebra.octRefl_mul_self_imag
#print axioms Phys.Algebra.octRefl_reflect_imag
#print axioms Phys.Algebra.octRefl_gFormC_neg_right
#print axioms Phys.Algebra.octRefl_swap_unnorm
#print axioms Phys.Algebra.octRefl_biMul_scale
#print axioms Phys.Algebra.octRefl_swap_norm
#print axioms Phys.Algebra.octDeflate
#print axioms Phys.Algebra.octBisector_unit
#print axioms Phys.Algebra.octDeflate_mem
#print axioms Phys.Algebra.octDeflate_isQvIsomC
#print axioms Phys.Algebra.octDeflate_apply_image
#print axioms Phys.Algebra.octDeflate_step
#print axioms Phys.Algebra.octDeflate_e2_je2_gFormC_zero
#print axioms Phys.Algebra.octDeflate_witness_ne
#print axioms Phys.Algebra.octDeflate_witness_image
#print axioms Phys.Algebra.octDeflate_witness_coord
-- N118 — THE OCTONION-BLOCK REFLECTION-INVOLUTION + FACTORIZATION (the SO(8) reassembly).
#print axioms Phys.Algebra.octBisector_imag
#print axioms Phys.Algebra.octDeflate_sq_neg_one
#print axioms Phys.Algebra.octDeflate_mul_mul_left
#print axioms Phys.Algebra.octDeflate_involution
#print axioms Phys.Algebra.octDeflate_factorization
#print axioms Phys.Algebra.octDeflate_factorization_stabilizer
#print axioms Phys.Algebra.octDeflate_involution_witness
#print axioms Phys.Algebra.octDeflate_roundtrip_coord
-- N119 — THE RANK-DROP RESTRICTION LEMMA (the octonion-block isometry strand).
#print axioms Phys.Algebra.gFormCRight
#print axioms Phys.Algebra.ePerp
#print axioms Phys.Algebra.mem_ePerp
#print axioms Phys.Algebra.gFormCRight_surjective
#print axioms Phys.Algebra.ePerp_finrank
#print axioms Phys.Algebra.isom_fixes_mapsTo_ePerp
#print axioms Phys.Algebra.isomRestrict
#print axioms Phys.Algebra.isomRestrict_coe
#print axioms Phys.Algebra.isomRestrict_gFormC_isom
#print axioms Phys.Algebra.ePerp_finite
#print axioms Phys.Algebra.self_not_mem_ePerp
#print axioms Phys.Algebra.ePerp_ne_top
#print axioms Phys.Algebra.vTwoPlane_e2je2_fixes_ke2je2
#print axioms Phys.Algebra.rankdrop_witness_mapsTo
#print axioms Phys.Algebra.rankdrop_witness_self_overlap
-- N120 — THE ORTHOGONAL-AXIS-PRESERVING REFLECTION + THE BOUNDED TWO-AXIS EXHAUSTION.
#print axioms Phys.Algebra.octDeflate_fixes_orthogonal_axis
#print axioms Phys.Algebra.octDeflate_two_axis_step
#print axioms Phys.Algebra.octDeflate_two_axis_factorization
#print axioms Phys.Algebra.ke2je2_e2_gFormC_zero
#print axioms Phys.Algebra.ke2je2_je2_gFormC_zero
#print axioms Phys.Algebra.twoaxis_witness_self_overlap
#print axioms Phys.Algebra.twoaxis_witness
#print axioms Phys.Algebra.twoaxis_witness_coord
-- N121 — THE SUBSPACE-PRESERVING REFLECTION-ON-ePerp (the finrank-recursion crux).
#print axioms Phys.Algebra.octReflBlock
#print axioms Phys.Algebra.octReflBlock_apply
#print axioms Phys.Algebra.octReflBlock_gFormC_diag
#print axioms Phys.Algebra.octReflBlock_fixes_orthogonal
#print axioms Phys.Algebra.octReflBlock_mapsTo_ePerp
#print axioms Phys.Algebra.octReflBlockRestrict
#print axioms Phys.Algebra.octReflBlockRestrict_coe
#print axioms Phys.Algebra.octReflBlockRestrict_gFormC_isom
#print axioms Phys.Algebra.octReflBlock_witness
#print axioms Phys.Algebra.octReflBlock_witness_self_overlap
#print axioms Phys.Algebra.octReflBlock_mapsTo_witness
#print axioms Phys.Algebra.finrank_dbl_eq_two_Cut
#print axioms Phys.Algebra.finrank_H_eq_four_Cut
#print axioms Phys.Algebra.finrank_O_eq_eight_Cut
#print axioms Phys.Algebra.finrank_STVC
#print axioms Phys.Algebra.ePerp_finrank_value
#print axioms Phys.Algebra.finrank_End_O_Cut
#print axioms Phys.Algebra.ePerp_finrank_witness
-- N123 — THE GLOBAL OCTONION-BLOCK EXHAUSTION (the finrank-strong-recursion skeleton).
#print axioms Phys.Algebra.fixSubmodule
#print axioms Phys.Algebra.mem_fixSubmodule
#print axioms Phys.Algebra.fixSubmodule_finrank_le
#print axioms Phys.Algebra.fixSubmodule_id
#print axioms Phys.Algebra.fixSubmodule_id_finrank
#print axioms Phys.Algebra.isom_fix_full_eq_id
#print axioms Phys.Algebra.IsGFormCIsom
#print axioms Phys.Algebra.octReflBlock_isGFormCIsom
#print axioms Phys.Algebra.reflection_exhaustion_aux
#print axioms Phys.Algebra.reflection_exhaustion
#print axioms Phys.Algebra.octReflBlock_witness_mem_fix
-- N124 — THE PEEL ORACLE CONSTRUCTION (the fixed-subspace-growing Householder reflection;
-- the oracle discharged, the full octonion-block exhaustion / O(8) surjectivity closed).
#print axioms Phys.Algebra.houseHolder
#print axioms Phys.Algebra.houseHolder_apply
#print axioms Phys.Algebra.houseHolder_fixes_ortho
#print axioms Phys.Algebra.houseHolder_neg_self
#print axioms Phys.Algebra.gFormC_houseterm
#print axioms Phys.Algebra.houseHolder_isom
#print axioms Phys.Algebra.houseHolder_involutive
#print axioms Phys.Algebra.houseHolderSet
#print axioms Phys.Algebra.gFormC_sub_left
#print axioms Phys.Algebra.IsGFormCIsom.comp
#print axioms Phys.Algebra.isom_ne_id_has_moved
#print axioms Phys.Algebra.houseHolder_oracle
#print axioms Phys.Algebra.gFormC_isom_mem_closure
#print axioms Phys.Algebra.houseHolder_witness_neg
#print axioms Phys.Algebra.houseHolder_witness_self_overlap
-- N125 — THE INDEFINITE-SIGNATURE HOUSEHOLDER REFLECTION + THE ANISOTROPIC PEEL ORACLE
-- (lifting N124's positive-definite Householder peel from O Cut to the full 10-dim STVC
-- carrying the indefinite Minkowski form BvC, signature (1,9)).
#print axioms Phys.Algebra.BvC_add_right
#print axioms Phys.Algebra.BvC_smul_right
#print axioms Phys.Algebra.BvCRight
#print axioms Phys.Algebra.fixSubmoduleM
#print axioms Phys.Algebra.mem_fixSubmoduleM
#print axioms Phys.Algebra.IsBvIsomLin
#print axioms Phys.Algebra.IsBvIsomLin.comp
#print axioms Phys.Algebra.isBvIsomLin_ne_id_has_moved
#print axioms Phys.Algebra.houseHolderM
#print axioms Phys.Algebra.houseHolderM_apply
#print axioms Phys.Algebra.houseHolderM_fixes_ortho
#print axioms Phys.Algebra.houseHolderM_neg_self
#print axioms Phys.Algebra.BvC_houseterm
#print axioms Phys.Algebra.houseHolderM_isom
#print axioms Phys.Algebra.houseHolderM_involutive
#print axioms Phys.Algebra.houseHolderMSet
#print axioms Phys.Algebra.houseHolderM_oracle
#print axioms Phys.Algebra.BvC_mTimeUnit_self
#print axioms Phys.Algebra.BvC_mSpaceUnit_self
#print axioms Phys.Algebra.houseHolderM_witness_neg_T
#print axioms Phys.Algebra.houseHolderM_witness_neg_X
#print axioms Phys.Algebra.houseHolderM_witness_self_overlap_T
-- N126 — THE NULL-DIFFERENCE TWO-REFLECTION PEEL-BACK (the indefinite-Cartan–Dieudonné null case:
-- when the moved difference T v − v is NULL the single N125 reflection is undefined; the null
-- obstruction dissolves through the anisotropic SUM auxiliary b := T v + v, forced anisotropic by
-- the norm-sum identity BvC a a + BvC b b = 4·BvC v v whenever v is anisotropic).
#print axioms Phys.Algebra.houseHolderM_sendback
#print axioms Phys.Algebra.BvC_isom_coef_diff
#print axioms Phys.Algebra.BvC_isom_coef_sum
#print axioms Phys.Algebra.BvC_isom_diff_perp_sum
#print axioms Phys.Algebra.BvC_isom_diff_sum_norm
#print axioms Phys.Algebra.isom_moved_aniso_dichotomy
#print axioms Phys.Algebra.houseHolderM_diff_sends_back
#print axioms Phys.Algebra.houseHolderM_sum_sends_neg
#print axioms Phys.Algebra.houseHolderM_null_peel_back
#print axioms Phys.Algebra.nullVec
#print axioms Phys.Algebra.BvC_nullVec_self
#print axioms Phys.Algebra.wVec
#print axioms Phys.Algebra.BvC_wVec_self
#print axioms Phys.Algebra.wVec_sub_mSpaceUnit_null
#print axioms Phys.Algebra.bVec
#print axioms Phys.Algebra.BvC_bVec_self
#print axioms Phys.Algebra.bVec_eq_sum
#print axioms Phys.Algebra.houseHolderM_bVec_wVec
#print axioms Phys.Algebra.houseHolderM_null_two_reflection_witness
#print axioms Phys.Algebra.houseHolderM_null_peel_self_overlap
-- N127 — THE INDEFINITE FINRANK-STRONG-RECURSION ASSEMBLY (the indefinite Cartan–Dieudonné descent
-- over the 10-dim STVC; the skeleton + the concrete anisotropic reduction via houseHolderM_oracle).
#print axioms Phys.Algebra.fixSubmoduleM_finrank_le
#print axioms Phys.Algebra.fixSubmoduleM_id
#print axioms Phys.Algebra.fixSubmoduleM_id_finrank
#print axioms Phys.Algebra.isom_fix_full_eq_id_M
#print axioms Phys.Algebra.reflection_exhaustion_M_aux
#print axioms Phys.Algebra.reflection_exhaustion_M
#print axioms Phys.Algebra.reflection_exhaustion_M_aniso
#print axioms Phys.Algebra.houseHolderM_mTimeUnit_mem_closure
#print axioms Phys.Algebra.exhaustion_witness_self_overlap
-- N128 — DISCHARGING haniso_exists: the totally-isotropic existence question dissolved through Born
-- positivity, closing the full unconditional SO⁺(1,9) indefinite Cartan–Dieudonné exhaustion.
#print axioms Phys.Algebra.bvC_totally_isotropic_first_zero
#print axioms Phys.Algebra.bvC_right_nondeg
#print axioms Phys.Algebra.BvC_smul_left
#print axioms Phys.Algebra.isom_totally_isotropic_eq_id
#print axioms Phys.Algebra.haniso_exists_thm
#print axioms Phys.Algebra.lorentz_exhaustion_M
#print axioms Phys.Algebra.lorentz_exhaustion_mTimeUnit_mem
#print axioms Phys.Algebra.lorentz_exhaustion_witness_self_overlap

-- N129 — THE BOOST/ROTATION BLOCK DECOMPOSITION (stitching the boost strand + octonion-block
-- exhaustion to the closed indefinite Householder exhaustion; the block-diagonal boost × rotation
-- subgroup covered by lorentz_exhaustion_M, the BvC-orthogonal block split).
#print axioms Phys.Algebra.octBlockEndC
#print axioms Phys.Algebra.octBlockEndC_apply
#print axioms Phys.Algebra.octBlockEndC_isBvIsomLin
#print axioms Phys.Algebra.boostEndC_isBvIsomLin
#print axioms Phys.Algebra.blockDiagC
#print axioms Phys.Algebra.blockDiagC_apply
#print axioms Phys.Algebra.boostEndC_octBlockEndC_commute
#print axioms Phys.Algebra.blockDiagC_isBvIsomLin
#print axioms Phys.Algebra.blockDiagC_mem_closure
#print axioms Phys.Algebra.bvC_tx_oct_orthogonal
#print axioms Phys.Algebra.id_isGFormCIsom
#print axioms Phys.Algebra.blockDiagC_boost_witness_image
#print axioms Phys.Algebra.blockDiagC_boost_witness_self_overlap

-- N130 — THE CONVERSE POLAR DECOMPOSITION OF AN ARBITRARY BvC-ISOMETRY (the joint connecting the
-- indefinite-Householder/BvC world N125–N129 to the polar/KAK strand N89–N105: every BvC-isometry
-- is injective, preserves QvC, has a two-sided inverse, HAS an EvC-adjoint h = J∘S⁻¹∘J, and so
-- polar-decomposes via the banked N97 packaged witness).
#print axioms Phys.Algebra.bvIsomLin_injective
#print axioms Phys.Algebra.bvIsomLin_isQvIsomC
#print axioms Phys.Algebra.evC_eq_bvC_sigOpC
#print axioms Phys.Algebra.bvIsomLin_inverse
#print axioms Phys.Algebra.bvIsomLin_has_evCAdjoint
#print axioms Phys.Algebra.bvIsomLin_polar_path_decomp
#print axioms Phys.Algebra.bvIsomLin_boost_recon_coord
#print axioms Phys.Algebra.bvIsomLin_boost_witness_self_overlap
-- N131 — THE COMPACT FACTOR OF AN ARBITRARY BvC-ISOMETRY IS AN EvC-ORTHOGONAL QvC-ISOMETRY (the
-- joint wiring N130's converse polar decomposition into N104's single-residual reduction: the
-- compact factor k = S∘(p^{1/2})⁻¹ is EvC-orthogonal kadj∘k = id and IsQvIsomC, and IF k is a
-- biMulLin word THEN the bridged compact factor ∈ genIsomMonoidC2 — the global reverse surjectivity
-- reduced to the single clean word-membership residual, childed N132).
#print axioms Phys.Algebra.bvIsomLin_compact_factor_spec
#print axioms Phys.Algebra.bvIsomLin_compact_factor_word_mem_gen2
#print axioms Phys.Algebra.bvIsomLin_boost_compact_factor_evCOrthogonal
#print axioms Phys.Algebra.bvIsomLin_boost_compact_factor_witness_qvC

-- N132 — THE GLOBAL REVERSE SURJECTIVITY, CLOSED UNCONDITIONALLY AGAINST THE REFLECTION ALPHABET:
-- every linear QvC-isometry of STVC is a finite product of indefinite Householder reflections, and
-- the generated reflection submonoid IS exactly the full linear BvC-isometry group SO⁺(1,9). The
-- ONE LAW reframe: N131's conditional residual k ∈ genIsomMonoidLin is FALSE against the biMulLin
-- alphabet (x-rigid, only SO(8), N105), so the residual DISSOLVES against the reflection alphabet
-- that reaches the full group (lorentz_exhaustion_M N128 + linIsom_BvC_preserved N51) — no open
-- residual, no operator topology, no posited group.
#print axioms Phys.Algebra.bvIsomLinMonoid
#print axioms Phys.Algebra.mem_bvIsomLinMonoid
#print axioms Phys.Algebra.linQvIsom_mem_reflection_closure
#print axioms Phys.Algebra.reflection_closure_eq_bvIsomLinMonoid
#print axioms Phys.Algebra.boost_mem_reflection_closure
#print axioms Phys.Algebra.boost_reflection_word_witness_self_overlap

-- N133 — THE CLIFFORD / PIN COVER OF THE CLOSED CONTINUUM LORENTZ GROUP SO⁺(1,9) AT THE GENERATOR
-- LEVEL: the derived Minkowski quadratic form QvCQuad carries a Clifford algebra (Mathlib's Clifford
-- functor applied to the DERIVED form over the DERIVED field Cut), and every banked indefinite
-- Householder reflection houseHolderM a lifts to Clifford conjugation by the Clifford UNIT ι a —
-- the Pin cover at the generator level, DERIVED from the trunk's own reflection (N123–N128) and the
-- Clifford relation, no posited adjoint, no posited Pin/Spin group.
#print axioms Phys.Algebra.BvCBilin
#print axioms Phys.Algebra.BvCBilin_apply
#print axioms Phys.Algebra.QvCQuad
#print axioms Phys.Algebra.QvCQuad_apply
#print axioms Phys.Algebra.QvCQuad_polar
#print axioms Phys.Algebra.cliffSq
#print axioms Phys.Algebra.cliffAnticomm
#print axioms Phys.Algebra.cliffSandwich
#print axioms Phys.Algebra.cliff_unit_isUnit
#print axioms Phys.Algebra.reflection_clifford_conj
#print axioms Phys.Algebra.cover_timelike_unit_clifford_sq
#print axioms Phys.Algebra.cover_form_timelike_unit
-- N134 — THE EVEN / SPIN COVER STRUCTURE (the cover-is-a-homomorphism at the two-generator level).
#print axioms Phys.Algebra.cover_even_isUnit
#print axioms Phys.Algebra.cover_conj_mem_range
#print axioms Phys.Algebra.cover_compose_two
#print axioms Phys.Algebra.cover_conj_even
#print axioms Phys.Algebra.cover_spin_scalar_timelike_unit
#print axioms Phys.Algebra.cover_timelike_double_eq_id
-- N135 — THE GLOBAL COVER HOMOMORPHISM Pin(1,9) ↠ SO⁺(1,9) (the twisted adjoint along a reflection word).
#print axioms Phys.Algebra.twistedAdjoint_ι_reflection
#print axioms Phys.Algebra.cliffCovers_reflection
#print axioms Phys.Algebra.cliffCovers_one
#print axioms Phys.Algebra.cliffCovers_mul
#print axioms Phys.Algebra.cover_global_reflection_word
#print axioms Phys.Algebra.cover_global_bvIsom
#print axioms Phys.Algebra.cover_global_qvIsom
#print axioms Phys.Algebra.cover_global_boost
#print axioms Phys.Algebra.cover_global_timelike_scalar_unit
-- N136 — THE COVER KERNEL {±1} (the two-to-one / "double" half of the double cover Pin(1,9) ↠ SO⁺(1,9)).
#print axioms Phys.Algebra.cover_neg_unit
#print axioms Phys.Algebra.cover_kernel_neg_one
#print axioms Phys.Algebra.cliffC_two_ne_zero
#print axioms Phys.Algebra.cover_kernel_distinct
#print axioms Phys.Algebra.cover_kernel_neg_one_sq
#print axioms Phys.Algebra.cover_boost_two_covers
#print axioms Phys.Algebra.cover_kernel_timelike_norm
-- N137 — THE OCTONION-BLOCK STABILIZER's GAUGE CONTENT (the (t,x)-plane stabilizer of the Lorentz group restricts to the octonion-block gFormC-isometry / SO(8)/Spin(7)/G₂ gauge group).
#print axioms Phys.Algebra.bvC_oct_time
#print axioms Phys.Algebra.bvC_oct_space
#print axioms Phys.Algebra.octStab_time_comp_zero
#print axioms Phys.Algebra.octStab_space_comp_zero
#print axioms Phys.Algebra.octStab_block_gFormC_isom
#print axioms Phys.Algebra.octStabMonoid_le_bvIsomLinMonoid
#print axioms Phys.Algebra.octBlockEndC_fixes_mTimeUnit
#print axioms Phys.Algebra.octBlockEndC_fixes_mSpaceUnit
#print axioms Phys.Algebra.octBlockEndC_mem_octStab
#print axioms Phys.Algebra.octStab_witness_moves
#print axioms Phys.Algebra.octStab_witness_mem
#print axioms Phys.Algebra.octStab_witness_self_overlap
-- N138 — THE EXPLICIT G₂ = Aut(O) = Der(O) GAUGE LINK (octonion automorphism ⊂ gauge stabilizer).
#print axioms Phys.Algebra.selfMulC_eq_smul
#print axioms Phys.Algebra.octo_quadraticC
#print axioms Phys.Algebra.autC_quad_diff
#print axioms Phys.Algebra.autC_reQC
#print axioms Phys.Algebra.autC_star
#print axioms Phys.Algebra.autC_gFormC
#print axioms Phys.Algebra.autC_isGFormCIsom
#print axioms Phys.Algebra.octBlockEndC_autC_mem_octStab
#print axioms Phys.Algebra.octBlockEndC_id_mem_octStab
#print axioms Phys.Algebra.autC_gFormC_one
-- N139 — THE FULL G₂ NONTRIVIALITY (a concrete non-identity octonion automorphism — the Cayley–Dickson top-half negation — embedded into the gauge stabilizer, pinning the gauge group as genuinely non-trivial).
#print axioms Phys.Algebra.octTopNegFun_mul
#print axioms Phys.Algebra.octTopNegFun_one
#print axioms Phys.Algebra.octTopNeg_isAlgAut
#print axioms Phys.Algebra.octTopNeg_e2
#print axioms Phys.Algebra.octTopNeg_ne_refl
#print axioms Phys.Algebra.octBlockEndC_octTopNeg_mem_octStab
#print axioms Phys.Algebra.octTopNeg_gFormC_e2
#print axioms Phys.Algebra.octTopNeg_gFormC_e2_eq_one

-- N140 — A SECOND INDEPENDENT NON-IDENTITY G₂ AUTOMORPHISM (the inner Cayley–Dickson involution).
#print axioms Phys.Algebra.hTopNegFun_mul
#print axioms Phys.Algebra.hTopNegFun_one
#print axioms Phys.Algebra.hTopNegFun_star
#print axioms Phys.Algebra.octInnerNegFun_mul
#print axioms Phys.Algebra.octInnerNegFun_one
#print axioms Phys.Algebra.octInnerNeg_isAlgAut
#print axioms Phys.Algebra.octInnerNeg_innerGen
#print axioms Phys.Algebra.octInnerNeg_e2
#print axioms Phys.Algebra.octInnerNeg_ne_refl
#print axioms Phys.Algebra.octInnerNeg_ne_octTopNeg
#print axioms Phys.Algebra.octBlockEndC_octInnerNeg_mem_octStab
#print axioms Phys.Algebra.octInnerNeg_gFormC_e2_eq_one

-- N141 — THE COMPOSITION GROUP ℤ/2 × ℤ/2 ⊂ G₂ (the Klein four-group the two involutions generate).
#print axioms Phys.Algebra.isAlgAutCut_trans
#print axioms Phys.Algebra.octCompNeg_isAlgAut
#print axioms Phys.Algebra.octCompNeg_eq_mul
#print axioms Phys.Algebra.octCompNeg_e2
#print axioms Phys.Algebra.octCompNeg_innerGen
#print axioms Phys.Algebra.octCompNeg_ne_refl
#print axioms Phys.Algebra.octCompNeg_ne_octTopNeg
#print axioms Phys.Algebra.octCompNeg_ne_octInnerNeg
#print axioms Phys.Algebra.octCompNeg_mul_self
#print axioms Phys.Algebra.octTopNeg_comm_octInnerNeg
#print axioms Phys.Algebra.octInnerNeg_mul_octTopNeg
#print axioms Phys.Algebra.kleinFour
#print axioms Phys.Algebra.kleinFour_eq_closure
#print axioms Phys.Algebra.kleinFour_elem_involution
#print axioms Phys.Algebra.octBlockEndC_octCompNeg_mem_octStab
#print axioms Phys.Algebra.octCompNeg_gFormC_e2_eq_one

-- N142 — THE EVEN / SPIN ℤ/2-GRADING OF THE CLIFFORD COVER (the even subalgebra CliffC⁰ Spin grade).
#print axioms Phys.Algebra.cliffUnit_mem_lipschitzGroup
#print axioms Phys.Algebra.cliffUnitMul_mem_lipschitzGroup
#print axioms Phys.Algebra.cliffUnit_involute_neg
#print axioms Phys.Algebra.cliffUnit_mem_evenOdd_one
#print axioms Phys.Algebra.cliffEvenUnit_mem_even
#print axioms Phys.Algebra.even_involute_fixed_cliffC
#print axioms Phys.Algebra.cliffEvenUnit_involute_fixed
#print axioms Phys.Algebra.cover_kernel_one_mem_even
#print axioms Phys.Algebra.cover_kernel_neg_one_mem_even
#print axioms Phys.Algebra.cover_proper_even
#print axioms Phys.Algebra.cover_even_odd_split
#print axioms Phys.Algebra.cover_spin_timelike_double_val_eq_one

-- N143 — THE ABSTRACT SPIN GROUP spinGroup = pinGroup ⊓ even via the UNITARY condition star x · x = 1.
#print axioms Phys.Algebra.star_even_unit
#print axioms Phys.Algebra.cliffEvenUnit_star_mul_self
#print axioms Phys.Algebra.cliffEvenUnit_mul_star_self
#print axioms Phys.Algebra.cliffEvenUnit_mem_unitary
#print axioms Phys.Algebra.cliffEvenUnit_mem_pinGroup
#print axioms Phys.Algebra.cliffEvenUnit_mem_spinGroup
#print axioms Phys.Algebra.QvC_mTimeUnit
#print axioms Phys.Algebra.QvC_mSpaceUnit
#print axioms Phys.Algebra.cover_spin_timelike_double_mem_spinGroup
#print axioms Phys.Algebra.cover_spin_spacelike_double_mem_spinGroup
#print axioms Phys.Algebra.cover_proper_spin
#print axioms Phys.Algebra.cover_boost_even_star_mul_self_eq_neg_one

-- N144 — THE COVER GROUP HOMOMORPHISM Pin/Spin ↠ SO⁺(1,9) as a surjective MonoidHom.
#print axioms Phys.Algebra.cliff_iota_injective
#print axioms Phys.Algebra.cliffCovers_unique
#print axioms Phys.Algebra.coverOp_mem
#print axioms Phys.Algebra.coverOp_covers
#print axioms Phys.Algebra.coverMap
#print axioms Phys.Algebra.coverMap_coe
#print axioms Phys.Algebra.coverMap_surjective
#print axioms Phys.Algebra.coverOp_eq_of_covers
#print axioms Phys.Algebra.coverMap_spin_mem
#print axioms Phys.Algebra.coverMap_boost_apply
-- N145 — THE PIN GROUP + THE SURJECTIVE DOUBLE COVER WITH ORDER-2 KERNEL.
#print axioms Phys.Algebra.pinGenSet
#print axioms Phys.Algebra.PinSub
#print axioms Phys.Algebra.cliffUnitOf_mem_pinSub
#print axioms Phys.Algebra.pinSub_le_coversSub
#print axioms Phys.Algebra.pin_covers_word
#print axioms Phys.Algebra.coverMapPin
#print axioms Phys.Algebra.coverMapPin_coe
#print axioms Phys.Algebra.coverMapPin_surjective
#print axioms Phys.Algebra.cliffUnitOf_mSpaceUnit_sq
#print axioms Phys.Algebra.negOne_mem_pinSub
#print axioms Phys.Algebra.negOne_mem_mker_coverMapPin
#print axioms Phys.Algebra.coverMapPin_mker_nontrivial
#print axioms Phys.Algebra.coverMapPin_boost_apply
-- N146 — THE SCALAR-BLOAT OBSTRUCTION + THE UNIT-NORMALIZED PIN GROUP.
#print axioms Phys.Algebra.cliffUnitOf_sq
#print axioms Phys.Algebra.cliffUnitOf_sq_mem_pinSub
#print axioms Phys.Algebra.cliffUnitOf_sq_covers_id
#print axioms Phys.Algebra.cliffUnitOf_sq_mem_mker
#print axioms Phys.Algebra.mkerWitnessVec_norm
#print axioms Phys.Algebra.mkerWitnessVec_aniso
#print axioms Phys.Algebra.coverMapPin_mker_has_nonScalarPM
#print axioms Phys.Algebra.pinUnitGenSet_subset_pinGenSet
#print axioms Phys.Algebra.pinUnitSub_le_pinSub
#print axioms Phys.Algebra.pinUnitSub_le_coversSub
#print axioms Phys.Algebra.cliffUnitOf_unit_sq
#print axioms Phys.Algebra.negOne_mem_pinUnitSub
#print axioms Phys.Algebra.coverMapPinUnit_coe
#print axioms Phys.Algebra.negOne_mem_mker_coverMapPinUnit
#print axioms Phys.Algebra.coverMapPinUnit_mker_nontrivial
#print axioms Phys.Algebra.coverMapPinUnit_neg_one_fixes_time
-- N147 — THE SPINOR NORM ±1 + THE SCALAR-ELEMENT HALF OF INJECTIVITY-MOD-CENTER.
#print axioms Phys.Algebra.pinUnitNorm
#print axioms Phys.Algebra.pinUnitNorm_eq_pm
#print axioms Phys.Algebra.pinUnitNorm_timelike
#print axioms Phys.Algebra.scalar_pinUnit_eq_pm
#print axioms Phys.Algebra.scalar_pinUnit_unit_eq_pm
#print axioms Phys.Algebra.coverMapPinUnit_injmodcenter_of_scalar
-- N148 — THE CENTRALIZER DISSOLUTION CORE — covers-id ⟹ the Clifford-contraction kernel.
#print axioms Phys.Algebra.master_contract
#print axioms Phys.Algebra.covers_id_comm
#print axioms Phys.Algebra.covers_id_contract_zero
#print axioms Phys.Algebra.mker_covers_id
#print axioms Phys.Algebra.mker_coverMapPinUnit_contract_zero
#print axioms Phys.Algebra.coverMapPinUnit_exactKernel_of_contractScalar
#print axioms Phys.Algebra.contract_iota_timelike
-- N149 — THE NONDEGENERACY KEYSTONE OF LEMMA Z — BvC / polar separates points.
#print axioms Phys.Algebra.BvC_nondegenerate
#print axioms Phys.Algebra.QvCQuad_polar_nondegenerate
#print axioms Phys.Algebra.polarBilin_separating
#print axioms Phys.Algebra.bvNondegenerate_timelike_teeth
-- N150 — THE GLOBAL LEMMA Z and THE FULL EXACT KERNEL mker coverMapPinUnit = {1,-1}.
#print axioms Phys.Algebra.polarBilin_injective
#print axioms Phys.Algebra.polarBilin_surjective
#print axioms Phys.Algebra.contract_all_of_polar
#print axioms Phys.Algebra.numOp_eigen
#print axioms Phys.Algebra.exterior_lemmaZ
#print axioms Phys.Algebra.lemmaZ
#print axioms Phys.Algebra.coverMapPinUnit_mker_eq
-- N151 — THE SURJECTIVITY of the unit-normalized Pin double cover coverMapPinUnit ↠ SO⁺(1,9).
#print axioms Phys.Algebra.QvC_smul
#print axioms Phys.Algebra.houseHolderM_smul
#print axioms Phys.Algebra.QvC_unitAxis
#print axioms Phys.Algebra.unitAxis_aniso
#print axioms Phys.Algebra.houseHolderM_unitAxis
#print axioms Phys.Algebra.cliffUnitOf_unitAxis_mem
#print axioms Phys.Algebra.cover_global_reflection_word_pinUnit
#print axioms Phys.Algebra.cover_global_bvIsom_pinUnit
#print axioms Phys.Algebra.coverMapPinUnit_surjective
#print axioms Phys.Algebra.coverMapPinUnit_boost_apply
-- N152 — THE OPERATOR TOPOLOGY OVER Cut + CONTINUITY / PRECONNECTEDNESS of the affine spectral path.
#print axioms Phys.Algebra.endOpC_coe_continuous
#print axioms Phys.Algebra.endOpC_eval_continuous
#print axioms Phys.Algebra.endOpC_continuous_iff
#print axioms Phys.Algebra.specPathOp_eval_cont
#print axioms Phys.Algebra.specPathOp_cont
#print axioms Phys.Algebra.cut_isPreconnected_Icc
#print axioms Phys.Algebra.specPathOp_image_preconnected
#print axioms Phys.Algebra.specPathOp_joins_id_sqrt
#print axioms Phys.Algebra.specPathOp_mix4_cont
#print axioms Phys.Algebra.specPathOp_mix4_mid_read_cont
-- N153 — THE COMPACT-FACTOR (ninth-direction rotation) path joined to the identity in endOpC
--        (rational Cayley/stereographic dissolution — NO posited angle).
#print axioms Phys.Algebra.cayley_den_ne
#print axioms Phys.Algebra.cayleyC_continuous
#print axioms Phys.Algebra.cayleyS_continuous
#print axioms Phys.Algebra.cayley_on_circle
#print axioms Phys.Algebra.cayleyC_zero
#print axioms Phys.Algebra.cayleyS_zero
#print axioms Phys.Algebra.cayley_surj
#print axioms Phys.Algebra.rotPath_cont
#print axioms Phys.Algebra.rotPath_zero
#print axioms Phys.Algebra.rotPath_isQvIsomC
#print axioms Phys.Algebra.rotPath_reaches
#print axioms Phys.Algebra.rotPath_image_preconnected
#print axioms Phys.Algebra.rotPath_joins_id_rotation
#print axioms Phys.Algebra.endOpC_mul_right_cont
#print axioms Phys.Algebra.continuous_mul_right_path
#print axioms Phys.Algebra.cayleyC_one
#print axioms Phys.Algebra.rotPath_quarter_read
-- N154 — THE KAK-PRODUCT ASSEMBLY → full SO⁺(1,9) path-connectedness reduced to a single
--        compact residual (the abstract assembly engine + the full reduction + a concrete
--        unconditional rotation × boost witness), in the operator topology endOpC over Cut.
#print axioms Phys.Algebra.joined_id_of_factor_paths
#print axioms Phys.Algebra.boostAffinePath_cont
#print axioms Phys.Algebra.boostAffinePath_zero
#print axioms Phys.Algebra.boostAffinePath_one
#print axioms Phys.Algebra.bvIsom_joined_id_of_compact_joined
#print axioms Phys.Algebra.kakProduct_concrete_joins_id
#print axioms Phys.Algebra.kakProduct_concrete_read
-- N155 — THE COMPACT WORD-INDUCTION ASSEMBLY: the set-form path-component engine JoinedIdC, its
--        submonoid structure + word-induction, the full reduction (set form) and the CONDITIONAL
--        full SO⁺(1,9) path-connectedness (compact factor = a word of joined factors ⟹ joined),
--        with the antipode half-turn (outside the single Cayley chart) reached via the word (W8).
#print axioms Phys.Algebra.joinedIdC_one
#print axioms Phys.Algebra.joinedIdC_mul
#print axioms Phys.Algebra.joinedIdSubmonoid
#print axioms Phys.Algebra.joinedIdC_listProd
#print axioms Phys.Algebra.joinedIdC_planeRotLin
#print axioms Phys.Algebra.bvIsom_joinedIdC_of_compact_joinedSet
#print axioms Phys.Algebra.bvIsom_joinedIdC_of_compact_word
#print axioms Phys.Algebra.joinedIdC_quarterTurn
#print axioms Phys.Algebra.halfTurn_antipode_not_cayley
#print axioms Phys.Algebra.joinedIdC_halfTurn
-- N156 — THE GENERAL-AXIS GIVENS-ROTATION BASE CASE for the SO(9) word-exhaustion: every unit-axis
--        Givens rotation axisRotLin e c s is JoinedIdC (generalizing N155's real-axis-only base
--        case), the Givens-word product is JoinedIdC, the refined conditional full SO⁺(1,9)
--        path-connectedness in concrete Givens form, with the GENERAL-AXIS antipode half-turn
--        (off the single chart, beyond the real axis) reached via the word (W8).
#print axioms Phys.Algebra.axisRotPath_cont
#print axioms Phys.Algebra.axisRotPath_zero
#print axioms Phys.Algebra.axisRotPath_isQvIsomC
#print axioms Phys.Algebra.axisRotPath_reaches
#print axioms Phys.Algebra.axisRotPath_image_preconnected
#print axioms Phys.Algebra.joinedIdC_axisRotLin
#print axioms Phys.Algebra.joinedIdC_axisRotProd
#print axioms Phys.Algebra.bvIsom_joinedIdC_of_axisRotWord
#print axioms Phys.Algebra.joinedIdC_axisRotLin_quarterTurn
#print axioms Phys.Algebra.joinedIdC_axisRotLin_halfTurn
-- N157 — THE GROUP-CONSTRAINED PATH-COMPONENT ENGINE JoinedIdQvC (the NON-VACUOUS repair of the
--        JoinedIdC predicate). MEASURE-FIRST (THE ONE LAW): JoinedIdC is VACUOUS (joinedIdC_everything
--        — the convex operator segment joins 1 to ANY operator, so JoinedIdC g holds for every g),
--        and N156's hgivens is unsatisfiable for the full QvC group (boosts move time, Givens words
--        fix it). The repair: JoinedIdQvC constrains the whole connecting set to the isometry group;
--        the engine carries over NON-VACUOUSLY (joinedIdQvC_isQvIsomC: a JoinedIdQvC operator must
--        preserve QvC), with the non-vacuous general-axis Givens base case + Givens-word product.
#print axioms Phys.Algebra.segLin_cont
#print axioms Phys.Algebra.segLin_zero
#print axioms Phys.Algebra.segLin_one
#print axioms Phys.Algebra.joinedIdC_everything
#print axioms Phys.Algebra.isQvIsomC_one
#print axioms Phys.Algebra.isQvIsomC_mul
#print axioms Phys.Algebra.joinedIdQvC_one
#print axioms Phys.Algebra.joinedIdQvC_mul
#print axioms Phys.Algebra.joinedIdQvC_listProd
#print axioms Phys.Algebra.joinedIdQvC_axisRotLin
#print axioms Phys.Algebra.joinedIdQvC_axisRotProd
#print axioms Phys.Algebra.joinedIdQvC_isQvIsomC
#print axioms Phys.Algebra.joinedIdQvC_axisRotLin_quarterTurn
#print axioms Phys.Algebra.axisRotLin_quarterTurn_e2_read
-- N158 — THE GENUINE SO(9) GIVENS-WORD PEEL on the TIME-FIXING compact factor, into the
--        NON-VACUOUS JoinedIdQvC: EvC preservation from EvC-orthogonality, the spatial-image of the
--        x-axis under a time-fixing EvC-orthogonal isometry, the CORE PEEL (one explicit unit-axis
--        Givens rotation off, reducing JoinedIdQvC to the x-fixing SO(8) stabilizer's), and the
--        assembly over the genuine compact factor. W8: the concrete inflate factor is JoinedIdQvC.
#print axioms Phys.Algebra.evC_preserved_of_orth
#print axioms Phys.Algebra.evCOrth_xaxis_image_time_zero
#print axioms Phys.Algebra.xaxis_image_spatial_form
#print axioms Phys.Algebra.joinedIdQvC_peel_reduce
#print axioms Phys.Algebra.joinedIdQvC_of_timeFixing_evCOrth_peel
#print axioms Phys.Algebra.inflate_witness_joinedIdQvC
#print axioms Phys.Algebra.inflate_witness_x_read
-- N159 — THE OCTONION-BLOCK 2-PLANE ROTATION GENERATION into the NON-VACUOUS JoinedIdQvC: the
--        octonion-block 2-plane rotation generator octPlaneRot (x-fixing, time-fixing), its
--        gFormC-isometry (two-axis completing-the-square), the lift octBlockEndC to a QvC-isometry,
--        the cayley-steered continuous path of isometries, the CORE (the lifted generator is
--        JoinedIdQvC, non-vacuously), and the finite-product word. W8: the concrete lifted
--        quarter-turn moves the octonion axis e₂ ↦ je2 and is JoinedIdQvC.
#print axioms Phys.Algebra.octPlaneRot_apply
#print axioms Phys.Algebra.octPlaneRot_one_zero
#print axioms Phys.Algebra.gFormC_twoaxis_expand
#print axioms Phys.Algebra.octPlaneRot_isGFormCIsom
#print axioms Phys.Algebra.isQvIsomC_octBlockEndC_octPlaneRot
#print axioms Phys.Algebra.octPlaneRotPath_zero
#print axioms Phys.Algebra.octPlaneRotPath_isQvIsomC
#print axioms Phys.Algebra.octPlaneRotPath_reaches
#print axioms Phys.Algebra.octPlaneRotPath_cont
#print axioms Phys.Algebra.octPlaneRotPath_image_preconnected
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_octPlaneRot
#print axioms Phys.Algebra.joinedIdQvC_octPlaneRotWord
#print axioms Phys.Algebra.octPlaneRot_e2je2_quarter_moves
#print axioms Phys.Algebra.octBlockEndC_octPlaneRot_e2je2_moves_read
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_octPlaneRot_e2je2_quarter
-- N160 — LorentzContinuumOctBlockSO8Exhaustion: THE OCTONION-BLOCK SO(8) EXHAUSTION CORE —
--        the even-pair (orthogonal bireflection) = plane half-turn identity, lifting the BANKED
--        Householder reflection word (N124) into the NON-VACUOUS JoinedIdQvC (N157/N159). The
--        lift octBlockEndC is a monoid hom (octBlockEndC_mul/_one); houseHolder a · houseHolder b
--        = octPlaneRot a b (-1) 0 for orthonormal a,b (the rotation = even-reflection-pair
--        identification); the half-turn = quarter-turn squared; the lifted bireflection is
--        JoinedIdQvC non-vacuously. W8: the concrete e₂,je2 bireflection moves e₂ ↦ −e₂ (reads −1)
--        and is JoinedIdQvC.
#print axioms Phys.Algebra.octBlockEndC_mul
#print axioms Phys.Algebra.octBlockEndC_one
#print axioms Phys.Algebra.houseHolder_bireflection_eq_octPlaneRot
#print axioms Phys.Algebra.octPlaneRot_quarter_sq
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_orthoBireflection
#print axioms Phys.Algebra.orthoBireflection_e2je2_moves
#print axioms Phys.Algebra.octBlockEndC_orthoBireflection_e2je2_moves_read
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_orthoBireflection_e2je2
-- N161 — LorentzContinuumOctBlockSO8ClosureWord: THE GENERAL BIREFLECTION = octPlaneRot WORD —
--        removes N160's orthonormality restriction. houseHolder is scale-invariant
--        (houseHolder_smul); every nonzero-norm vector normalizes to unit (normalize_unit); the
--        GENERAL two-axis identity houseHolder e · houseHolder (k•e+μ•f) = octPlaneRot e f (2k²−1)
--        (−2kμ) (bireflection_eq_octPlaneRot_gen); the lifted plane rotation is JoinedIdQvC for ANY
--        circle point incl the antipode (joinedIdQvC_octBlockEndC_octPlaneRot_circle); the lifted
--        GENERAL bireflection of ANY two nonzero-norm vectors is JoinedIdQvC
--        (joinedIdQvC_octBlockEndC_bireflection, orthonormality REMOVED); any finite product of
--        general bireflections lifts (joinedIdQvC_octBlockEndC_bireflectionWord — the full SO(8)
--        identity component by even reflection words). W8: the NON-orthonormal pair e₂, e₂+je2
--        bireflection moves e₂+je2 ↦ e₂−je2 (reads −1) and is JoinedIdQvC.
#print axioms Phys.Algebra.houseHolder_smul
#print axioms Phys.Algebra.normalize_unit
#print axioms Phys.Algebra.bireflection_eq_octPlaneRot_gen
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_octPlaneRot_circle
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_unitBireflection
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_bireflection
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_bireflectionWord
#print axioms Phys.Algebra.e2_plus_je2_gFormC_self
#print axioms Phys.Algebra.bireflection_e2je2plus_moves
#print axioms Phys.Algebra.bireflection_e2je2plus_moves_read
-- N162 — LorentzContinuumOctBlockSO8DetParity: THE DET-PARITY CLOSURE BRIDGE — every det +1 (SO(8))
--        gFormC-isometry S of O Cut lifts to the NON-VACUOUS JoinedIdQvC (octBlockEndC S),
--        UNCONDITIONALLY. The even-pairing core (joinedIdQvC_octBlockEndC_evenReflWord: any
--        EVEN-length reflection word lifts, pairing two-at-a-time into N161's bireflection core);
--        the determinant det_houseHolder (LinearMap.det (houseHolder a) = −1 via the Sylvester /
--        Weinstein–Aronszajn flip through toMatrix, the rank-one factorization houseHolder a =
--        id − g∘f with f∘g = 2·id on the 1-dim Cut); the closure word as a list of axes
--        (axesWord_of_reflList / isom_eq_axesWord via Submonoid.exists_list_of_mem_closure on N124);
--        the word determinant det_houseHolderWord (= (−1)^length via the multiplicative LinearMap.det);
--        ★★ the bridge joinedIdQvC_octBlockEndC_of_det_one (det S = 1 forces Even length, hence the
--        pairing core lifts). W8: the NON-orthonormal axis-MOVING product houseHolder e₂ ·
--        houseHolder (e₂+je2) has det 1 computed THROUGH the homomorphism (det_e2je2_product) and is
--        JoinedIdQvC by THE BRIDGE (joinedIdQvC_octBlockEndC_e2je2_via_det), not the direct N161 lift.
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_evenReflWord
#print axioms Phys.Algebra.hhDetF
#print axioms Phys.Algebra.hhDetG
#print axioms Phys.Algebra.houseHolder_eq_id_sub_comp
#print axioms Phys.Algebra.houseHolder_factor_one_dim
#print axioms Phys.Algebra.det_houseHolder
#print axioms Phys.Algebra.cut_neg_one_ne_one
#print axioms Phys.Algebra.axesWord_of_reflList
#print axioms Phys.Algebra.isom_eq_axesWord
#print axioms Phys.Algebra.det_houseHolderWord
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_of_det_one
#print axioms Phys.Algebra.det_e2je2_product
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_e2je2_via_det
#print axioms Phys.Algebra.joinedIdQvC_octBlockEndC_bireflection_e2je2plus
-- N163 — LorentzContinuumSO9CompactAssembly: THE FULL TIME-FIXING SO(9) COMPACT FACTOR ASSEMBLY —
-- the N158 peel ∘ the EXTRACTION (a QvC-isometry fixing t and x is octBlockEndC of its v-block) ∘
-- the N162 det-parity SO(8) closure, reaching the full time-fixing SO(9) compact factor as the
-- NON-VACUOUS JoinedIdQvC.
#print axioms Phys.Algebra.vBlockEndC
#print axioms Phys.Algebra.vBlockEndC_apply
#print axioms Phys.Algebra.qvIsom_fixingTX_vanish
#print axioms Phys.Algebra.qvIsom_fixingTX_eq_octBlockEndC
#print axioms Phys.Algebra.vBlockEndC_isGFormCIsom
#print axioms Phys.Algebra.vBlockEndC_octBlockEndC
#print axioms Phys.Algebra.joinedIdQvC_of_xtFixing_det_one
#print axioms Phys.Algebra.deflateNinth_fixes_time
#print axioms Phys.Algebra.joinedIdQvC_of_timeFixing_evCOrth_SO9_aux
#print axioms Phys.Algebra.joinedIdQvC_of_timeFixing_evCOrth_SO9
#print axioms Phys.Algebra.so9Witness_isQvIsomC
#print axioms Phys.Algebra.joinedIdQvC_so9Witness_via_assembly
-- N164 — LorentzContinuumBoostPolarFactor: THE BOOST / POLAR NON-COMPACT FACTOR toward the full
-- SO⁺(1,9) identity component — the square-root-steered hyperbolic boost path (the cosh-analogue
-- cutSqrt(1+m²) continuous by the order-topology squeeze), the forward boost as the NON-VACUOUS
-- JoinedIdQvC, and the polar assembly boost · (time-fixing SO(9) compact) via joinedIdQvC_mul.
#print axioms Phys.Algebra.cutSqrt_one_add_sq_cont
#print axioms Phys.Algebra.boostPath
#print axioms Phys.Algebra.boostPath_iso
#print axioms Phys.Algebra.boostPath_zero
#print axioms Phys.Algebra.boostPath_isQvIsomC
#print axioms Phys.Algebra.boostPath_reaches
#print axioms Phys.Algebra.boostPath_cont
#print axioms Phys.Algebra.boostPath_image_preconnected
#print axioms Phys.Algebra.joinedIdQvC_boostEndC
#print axioms Phys.Algebra.joinedIdQvC_boost_compact
#print axioms Phys.Algebra.boostWitness_hab
#print axioms Phys.Algebra.joinedIdQvC_boostWitness
#print axioms Phys.Algebra.boostWitness_moves_time
-- N165 — THE FULL SO⁺(1,9) IDENTITY-COMPONENT ASSEMBLY (the KAK product + the polar reduction).
#print axioms Phys.Algebra.joinedIdQvC_boost_so9compact
#print axioms Phys.Algebra.bvIsomLin_polar_reduction
#print axioms Phys.Algebra.joinedIdQvC_boostWitness_so9Witness
#print axioms Phys.Algebra.boostWitness_so9Witness_moves_time
-- N166 — LorentzContinuumPositivePartDissolution: THE POSITIVE-PART DISSOLUTION (the
-- BvC-isometric-positive-part characterization). The positive part p = γ(1) of the converse polar
-- decomposition of a BvC-isometry is itself a QvC-isometry (a positive self-adjoint boost, NOT a
-- generic positive operator), via the general isometry-group cancellation k·p=S with k,S isometries
-- ⟹ p isometry — dissolving the N165 generic-positive-operator obstruction.
#print axioms Phys.Algebra.isQvIsomC_of_mul_eq
#print axioms Phys.Algebra.bvIsomLin_polar_part_isQvIsomC
#print axioms Phys.Algebra.bvIsomLin_polar_reduction_isom
#print axioms Phys.Algebra.polarPart_isom_self_overlap
-- N167 — LorentzContinuumPositivePartReciprocal: THE RECIPROCAL CHARACTERIZATION of the polar
-- positive part (the eigenvalue-reciprocal-pair pin toward the isometric positive-part path). An
-- EvC-self-adjoint QvC-isometry p satisfies p∘J∘p = J (the metric condition with h := p) and the
-- J-conjugation inversion J p J = p⁻¹ — the reciprocal-eigenvalue-pair structure of a pure boost
-- that the eigenframe boost-product closure (N168) consumes; the positive part is NOT a generic
-- positive operator.
#print axioms Phys.Algebra.evCSymm_isQvIsomC_recip
#print axioms Phys.Algebra.evCSymm_isQvIsomC_Jconj_inv
#print axioms Phys.Algebra.bvIsomLin_polar_part_recip
#print axioms Phys.Algebra.polarPart_recip_nonvac
-- N168 — LorentzContinuumGeneralAxisBoostPath: THE GENERAL-AXIS BOOST FACTOR (the genuinely-new
-- per-factor lever toward the eigenframe boost-product closure). The boost in the t–ŵ plane for an
-- arbitrary spatial unit direction ŵ = (wx, wv) (the hyperbolic mirror of axisRotLin): it is a
-- QvC-isometry (unit ŵ, a²−b²=1), reached by the cutSqrt-steered hyperbolic path staying IN the
-- isometry group, hence the NON-VACUOUS JoinedIdQvC — generalizing N164's t–x-only boostEndC to
-- ANY spatial direction. The W8 witness is a genuine octonion-direction boost not reachable by
-- boostEndC.
#print axioms Phys.Algebra.genBoostLin
#print axioms Phys.Algebra.genBoostLin_apply
#print axioms Phys.Algebra.genBoostLin_eq_boostEndC
#print axioms Phys.Algebra.genBoostLin_isQvIsomC
#print axioms Phys.Algebra.genBoostPath
#print axioms Phys.Algebra.genBoostPath_iso
#print axioms Phys.Algebra.genBoostPath_zero
#print axioms Phys.Algebra.genBoostPath_isQvIsomC
#print axioms Phys.Algebra.genBoostPath_reaches
#print axioms Phys.Algebra.genBoostPath_cont
#print axioms Phys.Algebra.genBoostPath_image_preconnected
#print axioms Phys.Algebra.joinedIdQvC_genBoostLin
#print axioms Phys.Algebra.joinedIdQvC_genBoostLin_octReal_nonvac
-- N169 — THE BOOST PEEL (the eigenframe-extraction core). Signature (1,9) forces ONE boost: an
-- orthochronous QvC-isometry p factors as p = B·k with B = genBoostLin (read off p e₀) a forward
-- general-axis boost and k a TIME-FIXING QvC-isometry. The boost factor is fully discharged,
-- reducing the full SO⁺(1,9) identity component to the time-fixing SO(9) spatial residual.
#print axioms Phys.Algebra.genBoostLin_comp_inv
#print axioms Phys.Algebra.qvIsom_orthochronous_boost_peel
#print axioms Phys.Algebra.qvIsom_orthochronous_boost_factor
#print axioms Phys.Algebra.joinedIdQvC_of_timeFixing_residual
#print axioms Phys.Algebra.boost_peel_octReal_nonvac
-- N170 — THE TIME-FIXING SPATIAL RESIDUAL CLOSURE (EvC-orthogonality DISSOLVED). The spatial form
-- (k(0,1,0)).1 = 0 of a TIME-FIXING QvC-isometry follows from the indefinite Born form BvC ALONE
-- (linIsom_BvC_preserved, N51) — the EvC-orthogonality hypothesis N163 consumed is REDUNDANT. So
-- the time-fixing SO(9) compact-factor closure (a time-fixing QvC-isometry whose x-axis moves and
-- whose deflated stabilizer has v-block det = 1 is JoinedIdQvC) holds EvC-free, feeding N163's
-- joinedIdQvC_of_timeFixing_evCOrth_SO9_aux directly. W8: the concrete x-moving inflateNinth
-- (3/5)((4/5)•e₂) is JoinedIdQvC by the EvC-free route (deflated stabilizer = identity, det = 1).
#print axioms Phys.Algebra.timeFixing_xaxis_time_zero
#print axioms Phys.Algebra.timeFixing_xaxis_spatial_form
#print axioms Phys.Algebra.joinedIdQvC_of_timeFixing_SO9
#print axioms Phys.Algebra.deflate_inflate_id
#print axioms Phys.Algebra.vBlockEndC_one
#print axioms Phys.Algebra.joinedIdQvC_timeFixingWitness
-- N171 — THE DETERMINANT-REDUCTION KEYSTONE for the det-parity propagation of the UNCONDITIONAL
-- full SO⁺(1,9) identity component. A QvC-isometry g fixing BOTH the timelike and x axes has its
-- 10-dim LinearMap.det over STVC EQUAL to its 8-dim v-block determinant over O Cut (det_fixingTX_eq_vBlock),
-- because g = octBlockEndC (vBlockEndC g) (N163) and the block-diagonal octBlockEndC R has det = det R
-- (det_octBlockEndC, via LinearMap.det_prodMap). The boost det = 1 is the coordinate-plane 2×2 hyperbolic
-- determinant a²−b² = 1 (det_boostFin). W8: the genuine axis-MOVING det-+1 isometry octBlockEndC so9WitnessR
-- has its 10-dim det reduced to the v-block det (−1)·(−1) = 1 by the keystone. The det-multiplicativity
-- structural lever the det-parity propagation consumes; the heavy det_genBoostLin/det_deflateNinth/antipode
-- remainder is childed N172.
#print axioms Phys.Algebra.det_octBlockEndC
#print axioms Phys.Algebra.det_fixingTX_eq_vBlock
#print axioms Phys.Algebra.det_boostFin
#print axioms Phys.Algebra.det_fixingTX_eq_vBlock_witness
-- N172 — THE DET-OF-BOOST / DET-OF-DEFLATION / ANTIPODE / FINAL-ASSEMBLY UNCONDITIONAL CLOSURE of
-- the full SO⁺(1,9) identity component. The general-axis boost genBoostLin and the general-axis
-- rotation axisRotLin are both id + (rank-2 perturbation) factoring through a 2-plane, so the
-- Sylvester (Weinstein–Aronszajn) flip Matrix.det_one_sub_mul_comm reduces each 10-dim determinant
-- to an explicit 2×2: det_axisRotLin = c²+s², det_genBoostLin = a²−b² = 1 (NO 10×10 expansion, NO
-- det-continuity). det_deflateNinth = 1 (the circle condition x'²+gFormC v' v'=1). The antipode
-- π-rotation axisRotLin e₂ (−1) 0 (the EXCLUDED 1+c=0 of the single-axis path) is JoinedIdQvC as the
-- SQUARE of the quarter-turn (joinedIdQvC_piRotE2). THE FULLY UNCONDITIONAL CLOSURE
-- joinedIdQvC_of_proper_orthochronous: every proper (LinearMap.det p = 1) orthochronous
-- (0 ≤ (p e₀).1) QvC-isometry p is JoinedIdQvC — the boost peel p = B·k + det B = 1 propagates
-- det k = det p = 1; the three time-fixing cases (x-axis moves v'≠0 via deflate + keystone;
-- x-axis fixed x'=+1; antipode x'=−1 via R·k fixing both axes) each close by the keystone
-- det(vBlock) = det + det-multiplicativity, feeding N170/N163. The ONLY determinant hypothesis is
-- the properness det p = 1, PROPAGATED never assumed on a v-block. W8: the concrete non-identity
-- octonion-direction boost genBoostLin 0 1 (5/3) (4/3) (proper, orthochronous) is JoinedIdQvC.
#print axioms Phys.Algebra.det_axisRotLin
#print axioms Phys.Algebra.det_genBoostLin
#print axioms Phys.Algebra.det_deflateNinth
#print axioms Phys.Algebra.det_End_mul
#print axioms Phys.Algebra.joinedIdQvC_piRotE2
#print axioms Phys.Algebra.det_piRotE2
#print axioms Phys.Algebra.joinedIdQvC_of_xtFixing_det_one_via_keystone
#print axioms Phys.Algebra.joinedIdQvC_of_proper_orthochronous
#print axioms Phys.Algebra.joinedIdQvC_octReal_boost
-- N173 — THE FULL O(1,9) FROM THE IDENTITY COMPONENT (the discrete component group). N172 closed
-- the proper orthochronous identity component SO⁺(1,9). This node assembles the FULL orthogonal
-- group of the indefinite Born form QvC from that one component, via the discrete component group:
-- three explicit sign-flip endomorphisms parityLin (det −1, orthochronous), timeRevLin (det −1,
-- non-orthochronous), ptLin (det +1, non-orthochronous), each a QvC-isometry, generating a Klein
-- four-group (parityLin² = timeRevLin² = 1, parityLin·timeRevLin = timeRevLin·parityLin, ptLin =
-- parityLin·timeRevLin). The determinants reduce block-diagonally via LinearMap.det_prodMap +
-- LinearMap.det_smul (det of −id over Cut = (−1)^1 = −1, over O Cut = (−1)^8 = 1 by
-- finrank_O_eq_eight_Cut) — NO 10×10 expansion. THE COMPONENT REDUCTION joinedIdQvC_discreteReduce:
-- every QvC-isometry p with det p = ±1 is moved into the NON-VACUOUS identity component JoinedIdQvC
-- by one of {1, parityLin, timeRevLin, ptLin} — the four-way case split on (det ±1)×(orthochronous?)
-- routes each class to a proper orthochronous representative fed to joinedIdQvC_of_proper_orthochronous
-- (N172). W8: the four discrete witnesses are pairwise distinct (fullO19_components_distinct); the
-- reduction fires on the genuine non-identity improper element parityLin (fullO19_discreteReduce_witness).
#print axioms Phys.Algebra.det_negId_Cut
#print axioms Phys.Algebra.det_negId_OCut
#print axioms Phys.Algebra.det_parityLin
#print axioms Phys.Algebra.det_timeRevLin
#print axioms Phys.Algebra.det_ptLin
#print axioms Phys.Algebra.isQvIsomC_parityLin
#print axioms Phys.Algebra.isQvIsomC_timeRevLin
#print axioms Phys.Algebra.isQvIsomC_ptLin
#print axioms Phys.Algebra.parityLin_sq
#print axioms Phys.Algebra.timeRevLin_sq
#print axioms Phys.Algebra.ptLin_sq
#print axioms Phys.Algebra.parity_timeRev_comm
#print axioms Phys.Algebra.ptLin_eq
#print axioms Phys.Algebra.joinedIdQvC_discreteReduce
#print axioms Phys.Algebra.fullO19_components_distinct
#print axioms Phys.Algebra.fullO19_discreteReduce_witness

-- N174 — THE CONTINUOUS EXPONENTIAL cutExp over the DERIVED ℝ Cut (the number-tower exponential
-- primitive). cutExp x = ∑' n, xⁿ/n! DERIVED from Cut via its own banked exp power series
-- (cut_summable_pow_div_factorial N39), NOT a Mathlib Real.exp import as content. Banks: the term
-- expTermC and its absolute summability for every x; cutExp and cutExp_zero (= 1); the binomial crux
-- expTermC_antidiagonal; the homomorphism law cutExp_add (Cauchy product, NO ℝ-valued norm);
-- invertibility cutExp_mul_neg; Born positivity cutExp_pos (a nonzero square of a unit).
#print axioms Phys.Foundation.ContinuumQ.expTermC
#print axioms Phys.Foundation.ContinuumQ.expTermC_abs_le
#print axioms Phys.Foundation.ContinuumQ.expTermC_abs_summable
#print axioms Phys.Foundation.ContinuumQ.expTermC_summable
#print axioms Phys.Foundation.ContinuumQ.cutExp
#print axioms Phys.Foundation.ContinuumQ.cutExp_hasSum
#print axioms Phys.Foundation.ContinuumQ.cutExp_zero
#print axioms Phys.Foundation.ContinuumQ.expTermC_prod_summable
#print axioms Phys.Foundation.ContinuumQ.expTermC_antidiagonal
#print axioms Phys.Foundation.ContinuumQ.cutExp_add
#print axioms Phys.Foundation.ContinuumQ.cutExp_mul_neg
#print axioms Phys.Foundation.ContinuumQ.cutExp_pos
#print axioms Phys.Foundation.ContinuumQ.cutExp_one_pos
#print axioms Phys.Foundation.ContinuumQ.cutExp_one_add_one

-- N175 — THE CONTINUOUS LOGARITHM cutLog AND THE CONTINUOUS REAL POWER cutRpow over the DERIVED ℝ
-- Cut (the number-tower continuous power). cutLog is the inverse of the banked cutExp (N174) on the
-- positives — built from cutExp strict monotonicity + continuity + the IVT on the complete Cut,
-- NOT a Mathlib Real.log/Real.rpow import as content. cutRpow x p := cutExp (p · cutLog x). Banks:
-- the near-zero bounds one_add_le_cutExp/cutExp_le_at_zero/cutExp_le_one_of_nonpos; cutExp
-- continuity cutExp_continuousAt_zero/cutExp_continuous; strict monotonicity cutExp_strictMono;
-- surjectivity onto the positives cutExp_surjOn_pos (via the IVT); the inverse cutLog and its laws
-- cutExp_cutLog/cutLog_cutExp/cutLog_one/cutLog_mul; the continuous power cutRpow and its laws
-- cutRpow_pos/cutRpow_add/cutRpow_zero/cutRpow_one/cutRpow_two.
#print axioms Phys.Foundation.ContinuumQ.one_add_le_cutExp
#print axioms Phys.Foundation.ContinuumQ.one_le_cutExp
#print axioms Phys.Foundation.ContinuumQ.cutExp_le_at_zero
#print axioms Phys.Foundation.ContinuumQ.cutExp_le_one_of_nonpos
#print axioms Phys.Foundation.ContinuumQ.cutExp_continuousAt_zero
#print axioms Phys.Foundation.ContinuumQ.cutExp_continuous
#print axioms Phys.Foundation.ContinuumQ.cutExp_strictMono
#print axioms Phys.Foundation.ContinuumQ.cutExp_surjOn_pos
#print axioms Phys.Foundation.ContinuumQ.cutLog
#print axioms Phys.Foundation.ContinuumQ.cutExp_cutLog
#print axioms Phys.Foundation.ContinuumQ.cutLog_cutExp
#print axioms Phys.Foundation.ContinuumQ.cutLog_one
#print axioms Phys.Foundation.ContinuumQ.cutLog_mul
#print axioms Phys.Foundation.ContinuumQ.cutRpow
#print axioms Phys.Foundation.ContinuumQ.cutRpow_pos
#print axioms Phys.Foundation.ContinuumQ.cutRpow_add
#print axioms Phys.Foundation.ContinuumQ.cutRpow_zero
#print axioms Phys.Foundation.ContinuumQ.cutRpow_one
#print axioms Phys.Foundation.ContinuumQ.cutRpow_two

-- N176 — THE CONTINUOUS SPECTRAL t-POWER and the ONE-PARAMETER SPECTRAL FLOW over the derived ℝ Cut:
-- the two-eigenvalue composition law specOpN_comp_general; the continuous spectral t-power specPow;
-- the one-parameter flow law specPow_flow (specPow p ∘ specPow q = specPow (p+q), from cutRpow_add per
-- eigenblock); specPow_read/specPow_one/specPow_zero/specPow_two/specPow_isEvCSymm/specPow_nonneg; and
-- the concrete rank-4 flow witness specPow_mix4_flow.
#print axioms Phys.Algebra.specOpN_comp_general
#print axioms Phys.Algebra.specPow
#print axioms Phys.Algebra.specPow_flow
#print axioms Phys.Algebra.specPow_read
#print axioms Phys.Algebra.specPow_one
#print axioms Phys.Algebra.specPow_zero
#print axioms Phys.Algebra.specPow_two
#print axioms Phys.Algebra.specPow_isEvCSymm
#print axioms Phys.Algebra.specPow_nonneg
#print axioms Phys.Algebra.specPow_mix4_flow

-- N177 — THE ONE-PARAMETER FLOW LAW of the octonion exponential automorphism over the derived ℝ Cut:
-- the continuous one-parameter SUBGROUP t ↦ expOEquiv (t•D') inside Aut(O Cut). commute_derivMatrix_smul
-- (the Commute hypothesis); the flow law expOLin_flow_apply / expOLin_flow / expO_flow
-- (expOLin (s•D') ∘ expOLin (t•D') = expOLin ((s+t)•D'), from expMap_mul_of_commute N40 + derivMatrix_smul
-- N41g); the flow identity expOLin_smul_zero; the one-parameter subgroup expOEquiv_flow / expOEquiv_smul_zero;
-- the flow stays in the automorphism group expOEquiv_flow_isAlgAut; and the concrete non-vacuity witnesses
-- expOLin_flow_zero / expOEquiv_flow_zero / expOEquiv_flow_zero_isAlgAut.
#print axioms Phys.Algebra.commute_derivMatrix_smul
#print axioms Phys.Algebra.expOLin_flow_apply
#print axioms Phys.Algebra.expOLin_flow
#print axioms Phys.Algebra.expO_flow
#print axioms Phys.Algebra.expOLin_smul_zero
#print axioms Phys.Algebra.expOEquiv_flow
#print axioms Phys.Algebra.expOEquiv_smul_zero
#print axioms Phys.Algebra.expOEquiv_flow_isAlgAut
#print axioms Phys.Algebra.expOLin_flow_zero
#print axioms Phys.Algebra.expOEquiv_flow_zero
#print axioms Phys.Algebra.expOEquiv_flow_zero_isAlgAut

-- N178 — THE ABSTRACT GROUP OBJECT of the gauge Klein four-group kleinFour (N141): kleinFour ≅ ℤ/2 × ℤ/2
-- as an abstract group, over the derived ℝ Cut. N141 banked the concrete 4-element subgroup
-- {1, octTopNeg, octInnerNeg, octCompNeg} of Aut(O) plus its generation + every-element-squares-to-1;
-- this node computes the cardinality (kleinFour_natCard_eq_four), the exponent
-- (kleinFour_monoidExponent_eq_two), assembles the abstract group-object class IsKleinFour
-- (kleinFour_isKleinFour), the non-cyclic fingerprint (kleinFour_not_isCyclic distinguishing ℤ/2×ℤ/2
-- from ℤ/4), and the abstract iso kleinFour_mulEquiv_zmod2sq_nonempty (Nonempty (↥kleinFour ≃*
-- Multiplicative (ZMod 2 × ZMod 2))). The Mathlib Klein-four / ZMod 2 machinery operates on the DERIVED
-- group object ↥kleinFour; no Mathlib ℝ/ℂ as content, no posited group / topology / π₀.
#print axioms Phys.Algebra.kleinFour_one_ne_octTopNeg
#print axioms Phys.Algebra.kleinFour_one_ne_octInnerNeg
#print axioms Phys.Algebra.kleinFour_one_ne_octCompNeg
#print axioms Phys.Algebra.kleinFour_natCard_eq_four
#print axioms Phys.Algebra.kleinFour_monoidExponent_eq_two
#print axioms Phys.Algebra.kleinFour_isKleinFour
#print axioms Phys.Algebra.kleinFour_not_isCyclic
#print axioms Phys.Algebra.kleinFour_mulEquiv_zmod2sq_nonempty

-- N179 — THE ABSTRACT GROUP OBJECT of the O(1,9) DISCRETE COMPONENT GROUP (the π₀(O(1,9)) = 4
-- statement), over the derived ℝ Cut. N173 banked the three sign-flip reflections parityLin/timeRevLin/
-- ptLin as elements of the MONOID Module.End Cut STVC with the Klein relations + distinctness +
-- the full component reduction joinedIdQvC_discreteReduce, but NEVER formed a group / computed
-- card/exponent/abstract class/iso. This node lifts the three involutive reflections to UNITS of
-- Module.End Cut STVC (parityUnit/timeRevUnit/ptUnit, each self-inverse via the banked _sq facts),
-- forms the explicit 4-element subgroup o19Comp of the unit group (Module.End Cut STVC)ˣ (the discrete
-- component group of the full indefinite orthogonal group O(1,9)), transports the Klein table + pairwise
-- distinctness to the units, then computes the cardinality (o19Comp_natCard_eq_four), the exponent
-- (o19Comp_monoidExponent_eq_two), assembles the abstract group-object class IsKleinFour
-- (o19Comp_isKleinFour), the non-cyclic fingerprint (o19Comp_not_isCyclic distinguishing ℤ/2×ℤ/2 from
-- ℤ/4), and the abstract iso o19Comp_mulEquiv_zmod2sq_nonempty (Nonempty (↥o19Comp ≃* Multiplicative
-- (ZMod 2 × ZMod 2))) — the π₀(O(1,9)) ≅ ℤ/2 × ℤ/2 classification. A DIFFERENT object from the gauge G₂
-- Klein-four N178. The Mathlib Klein-four / ZMod 2 / Units machinery operates on the DERIVED group
-- object ↥o19Comp; no Mathlib ℝ/ℂ as content, no posited component group / topology / π₀ / orthogonal group.
#print axioms Phys.Algebra.parityUnit
#print axioms Phys.Algebra.timeRevUnit
#print axioms Phys.Algebra.ptUnit
#print axioms Phys.Algebra.o19Comp
#print axioms Phys.Algebra.o19Comp_eq_closure
#print axioms Phys.Algebra.o19Comp_elem_involution
#print axioms Phys.Algebra.o19Comp_natCard_eq_four
#print axioms Phys.Algebra.o19Comp_monoidExponent_eq_two
#print axioms Phys.Algebra.o19Comp_isKleinFour
#print axioms Phys.Algebra.o19Comp_not_isCyclic
#print axioms Phys.Algebra.o19Comp_mulEquiv_zmod2sq_nonempty

-- N180 — the commuting-generator flow law and the abelian first-order bracket.
#print axioms Phys.Algebra.derivMatrix_mul
#print axioms Phys.Algebra.derivMatrix_add
#print axioms Phys.Algebra.derivMatrix_commute
#print axioms Phys.Algebra.commute_of_lie_zero
#print axioms Phys.Algebra.expOLin_comm_flow_apply
#print axioms Phys.Algebra.expOLin_comm_flow
#print axioms Phys.Algebra.expOLin_comm_flow_comm
#print axioms Phys.Algebra.expOEquiv_comm_flow
#print axioms Phys.Algebra.expOLin_comm_flow_self
#print axioms Phys.Algebra.expOLin_bracket_zero_flows_commute

-- N181 — the adjoint-flow derivative (the non-abelian first-order bracket).
#print axioms Phys.Algebra.matrix_mul_tendsto
#print axioms Phys.Algebra.expMap_tendsto_one
#print axioms Phys.Algebra.expMap_smul_tangent
#print axioms Phys.Algebra.adjMap_tangent
#print axioms Phys.Algebra.derivMatrix_sub
#print axioms Phys.Algebra.derivMatrix_bracket
#print axioms Phys.Algebra.adjMap_tangent_deriv
#print axioms Phys.Algebra.wit_bracket_ne

-- N182 — the scalar 2nd-order power-series derivative over the derived ℝ (the genuinely-unbanked
--   primitive the 2nd-order Taylor of `exp` over `Cut` needs; the exact 2nd-order analog of
--   `cut_powerseries_deriv` N41g, recovering the quadratic coefficient `a₂` of an entire series).
#print axioms Phys.Foundation.ContinuumQ.cut_powerseries_deriv2

-- N183 — the 2nd-order matrix/entry/operator tangent of `exp` over the derived ℝ (lifting the scalar
--   2nd-order power-series derivative `cut_powerseries_deriv2` N182 to the matrix exponential,
--   recovering the quadratic coefficient `½•M²` / `½•(D'² x)` — the genuine 2nd-order data the
--   first-order tangent `expO_tangent` N41g cannot express).
#print axioms Phys.Algebra.expTerm_two_entry
#print axioms Phys.Algebra.expMap_entry_tangent2
#print axioms Phys.Algebra.expMap_smul_tangent2
#print axioms Phys.Algebra.expMap_vec_tangent2
#print axioms Phys.Algebra.expO_tangent2
#print axioms Phys.Algebra.expO_tangent2_zero
#print axioms Phys.Algebra.cwM_second_coeff
#print axioms Phys.Algebra.cwM_first_coeff

-- N184 — the quaternion derivation Lie algebra Der(H ℚ) ≅ so(3) ≅ su(2) (the weak-isospin
--   gauge-algebra seed: the inner derivations ad_q of the associative quaternion algebra
--   H ℚ = CD (Dbl ℚ) carry the so(3)/su(2) bracket ⁅ad_i,ad_j⁆ = 2·ad_k cyclic, non-abelian;
--   complementary to the banked colour SU(3) ⊂ G₂ = Der(O) N42a/b/c).
#print axioms Phys.Algebra.hI_sq
#print axioms Phys.Algebra.hJ_sq
#print axioms Phys.Algebra.hK_sq
#print axioms Phys.Algebra.hI_hJ
#print axioms Phys.Algebra.hJ_hI
#print axioms Phys.Algebra.hJ_hK
#print axioms Phys.Algebra.hK_hJ
#print axioms Phys.Algebra.hK_hI
#print axioms Phys.Algebra.hI_hK
#print axioms Phys.Algebra.isDerivH_bracket
#print axioms Phys.Algebra.derivationH
#print axioms Phys.Algebra.adM_isDerivH
#print axioms Phys.Algebra.adM_mem
#print axioms Phys.Algebra.adM_bracket
#print axioms Phys.Algebra.adM_ij
#print axioms Phys.Algebra.adM_jk
#print axioms Phys.Algebra.adM_ki
#print axioms Phys.Algebra.adM_k_on_i
#print axioms Phys.Algebra.adM_k_ne_zero
#print axioms Phys.Algebra.adM_ij_ne_zero

-- N185 — the dimension of the quaternion inner-derivation Lie algebra is 3 (the so(3) ≅ su(2)
--   dimension count: the inner-derivation map adL : H ℚ →ₗ End ℚ (H ℚ), q ↦ ad_q, has
--   3-dimensional range — kernel = the 1-dim centre ℚ·1 — via rank–nullity over finrank_H_eq_four
--   N19; the defining-signature fact pinning so(3) ≅ su(2) with N184's non-abelian bracket).
#print axioms Phys.Algebra.H_qsmul_mul_left
#print axioms Phys.Algebra.H_qsmul_mul_right
#print axioms Phys.Algebra.adQ
#print axioms Phys.Algebra.adQ_eq_adM
#print axioms Phys.Algebra.adL
#print axioms Phys.Algebra.oneEmb
#print axioms Phys.Algebra.oneEmb_injective
#print axioms Phys.Algebra.centre_im
#print axioms Phys.Algebra.centre_reim
#print axioms Phys.Algebra.ker_adL_eq
#print axioms Phys.Algebra.finrank_ker_adL_eq_one
#print axioms Phys.Algebra.finrank_innerDeriv_eq_three
#print axioms Phys.Algebra.innerDeriv_ne_bot
#print axioms Phys.Algebra.adL_ne_zero

-- N186 — the U(1) HYPERCHARGE PHASE ALGEBRA so(Born on Dbl ℚ) ≅ so(2) ≅ u(1), dimension 1
--   (the third Standard-Model gauge factor's rank, complementary to dim G₂ = 14 colour N20 and
--   dim su(2) = 3 isospin N185): the skew-adjoint operators of the self-overlap form
--   bForm v w = (v·star w).re on the commutative complex-unit rung Dbl ℚ form a 1-dimensional
--   space, spanned by the phase rotation L_J = mult-by-J (the derived fold-root, N2), via the
--   so(n)-bound finrank_skewAdjoint_le_choose N28 over finrank_dbl_eq_two N19.
#print axioms Phys.Algebra.dbl_star_qsmul
#print axioms Phys.Algebra.bForm
#print axioms Phys.Algebra.bForm_self
#print axioms Phys.Algebra.bForm_symm
#print axioms Phys.Algebra.bForm_isSymm
#print axioms Phys.Algebra.bForm_self_eq_zero
#print axioms Phys.Algebra.bForm_nondegenerate
#print axioms Phys.Algebra.L_J
#print axioms Phys.Algebra.L_J_skew
#print axioms Phys.Algebra.L_J_ne_zero
#print axioms Phys.Algebra.dim_le_one
#print axioms Phys.Algebra.skewAdjoint_ne_bot
#print axioms Phys.Algebra.one_le_dim
#print axioms Phys.Algebra.finrank_phase_eq_one
#print axioms Phys.Algebra.phase_eq_span_L_J

-- N187 — THE WEAK-ISOSPIN DERIVATION ALGEBRA EMBEDS INTO THE COLOUR-HOSTING DERIVATION ALGEBRA:
--   Der(H ℚ) = su(2) ↪ Der(O ℚ) = g₂, the Lie embedding INDUCED BY THE CAYLEY–DICKSON DOUBLING
--   H ℚ ↪ O ℚ = CD (H ℚ). The first PROVED connection between two banked gauge-algebra factors:
--   the componentwise doubling lift liftEnd (N6) is additive (liftEnd_add), respects subtraction
--   (liftEnd_sub), carries composition to End-multiplication (liftEnd_mul), and is injective
--   (liftEnd_injective); hence the bracket of two lifted inner derivations reduces to the lift of
--   the base End-commutator, which on the ASSOCIATIVE quaternion ring equals ad_(p·q−q·p)
--   (adHom_comp_comm) — THE LIE-HOM innerDeriv_bracket: ⁅innerDeriv p, innerDeriv q⁆ =
--   innerDeriv (p·q − q·p). The three quaternion units hI/hJ/hK are imaginary (hI/hJ/hK_imag), so
--   their inner derivations LAND in the banked Der(O ℚ) = g₂ (innerDeriv_hI/J/K_isDerivO/_mem),
--   and the su(2) structure constants TRANSFER into g₂ (struct_ij/jk/ki: ⁅innerDeriv hI,
--   innerDeriv hJ⁆ = 2·innerDeriv hK cyclic), faithfully (innerDeriv_eq_zero_iff_adHom) and
--   genuinely non-abelian (innerDeriv_hI/J/K_ne_zero, struct_ij_ne_zero — W8). DERIVED from the
--   cascade's OWN doubling — the unbroken-strand novelty (the field POSITS the algebras as
--   islands; we DERIVE the nesting from the one doubling that also STOPS the cascade).
#print axioms Phys.Algebra.liftEnd_add
#print axioms Phys.Algebra.liftEnd_sub
#print axioms Phys.Algebra.liftEnd_mul
#print axioms Phys.Algebra.liftEnd_injective
#print axioms Phys.Algebra.adHom_addCD
#print axioms Phys.Algebra.adHom_comp_comm
#print axioms Phys.Algebra.innerDeriv_bracket
#print axioms Phys.Algebra.innerDeriv_addCD
#print axioms Phys.Algebra.innerDeriv_two_zsmul
#print axioms Phys.Algebra.innerDeriv_eq_zero_iff_adHom
#print axioms Phys.Algebra.hI_imag
#print axioms Phys.Algebra.hJ_imag
#print axioms Phys.Algebra.hK_imag
#print axioms Phys.Algebra.innerDeriv_hI_isDerivO
#print axioms Phys.Algebra.innerDeriv_hJ_isDerivO
#print axioms Phys.Algebra.innerDeriv_hK_isDerivO
#print axioms Phys.Algebra.innerDeriv_hI_mem
#print axioms Phys.Algebra.innerDeriv_hJ_mem
#print axioms Phys.Algebra.innerDeriv_hK_mem
#print axioms Phys.Algebra.struct_ij
#print axioms Phys.Algebra.struct_jk
#print axioms Phys.Algebra.struct_ki
#print axioms Phys.Algebra.innerDeriv_hK_ne_zero
#print axioms Phys.Algebra.innerDeriv_hI_ne_zero
#print axioms Phys.Algebra.innerDeriv_hJ_ne_zero
#print axioms Phys.Algebra.adHom_two_hK_hI
#print axioms Phys.Algebra.four_hJ_ne_zero
#print axioms Phys.Algebra.struct_ij_ne_zero

-- N188 — THE LOWER RUNG OF THE INCLUSION TOWER u(1) ↪ su(2): the Cayley–Dickson doubling
--   intertwiner between the U(1) hypercharge phase rotation L_J on Dbl ℚ (N186) and the
--   weak-isospin inner derivation adQ hI on H ℚ = CD (Dbl ℚ) (N184/N185, hI = ι J). The
--   doubling's new-dimension embedding κ : Dbl ℚ → H ℚ, b ↦ ⟨0,b⟩ intertwines them:
--   adQ hI ∘ κ = κ ∘ (2 • L_J) (the U(1) generator reappears, up to the doubling factor 2,
--   as the new-plane restriction of the SU(2) generator), and adQ hI annihilates the old
--   line ι(Dbl ℚ). N187 nested su(2)↪g₂ (upper rung H↪O); THIS node nests u(1)↪su(2) (lower
--   rung Dbl↪H) — one cause (the doubling), the connection between two banked algebras, a
--   PROVED non-trivial intertwiner (isospin_intertwines_hypercharge_ne_zero — W8), NOT a
--   juxtaposition. DERIVED from the trunk, foundations-only.
#print axioms Phys.Algebra.kappa
#print axioms Phys.Algebra.kappa_injective
#print axioms Phys.Algebra.adQ_hI_iota
#print axioms Phys.Algebra.adQ_hI_kappa
#print axioms Phys.Algebra.isospin_intertwines_hypercharge
#print axioms Phys.Algebra.intertwiner_coord
#print axioms Phys.Algebra.isospin_intertwines_hypercharge_ne_zero

-- N189 — THE ISOSPIN BRANCHING OF THE 7: the singlet drops out when g₂ is restricted to the
--   embedded su(2). The inner derivations act componentwise on O ℚ = CD (H ℚ) = ⟨H,H⟩
--   (innerDeriv q ⟨a,b⟩ = ⟨ad_q a, ad_q b⟩), so the upper-doubling unit e₄ := κO 1 = ⟨0,1⟩
--   is a nonzero vector of the 7 (kappaO_one_mem_ImO, kappaO_one_ne_zero) annihilated by
--   EVERY inner derivation (innerDeriv_kappaO_one) — in particular the whole embedded su(2)
--   fixes the line ℚ·e₄ (singlet_fixed_by_isospin): the trivial sub-representation, THE
--   SINGLET. Yet the FULL g₂ has NO 1-dim invariant subspace in ImO (banked N25), so some
--   derivation moves the singlet line (g2_moves_singletLine): the 7 is g₂-irreducible but
--   su(2)-reducible — the branching. The su(2) acts nontrivially on the 7
--   (isospin_singlet_ne_zero — W8). One cause (the doubling): the embedding (N187), the
--   lower-rung intertwiner (N188), and now the branching of the 7. Foundations-only.
#print axioms Phys.Algebra.kappaO
#print axioms Phys.Algebra.kappaO_one_mem_ImO
#print axioms Phys.Algebra.kappaO_one_ne_zero
#print axioms Phys.Algebra.innerDeriv_kappaO_one
#print axioms Phys.Algebra.singlet_fixed_by_isospin
#print axioms Phys.Algebra.kappaO_one_coord
#print axioms Phys.Algebra.g2_moves_singletLine
#print axioms Phys.Algebra.isospin_singlet_ne_zero

-- N190 — THE FULL ISOSPIN BRANCHING OF THE 7: 7 = 1 (+) 3 (+) 3 under the embedded su(2).
--   N189 split off the singlet Q.e4 (e4 = kappaO 1 = <0,1>); N190 completes the decomposition.
--   The two complementary coordinate embeddings iotaO (a -> <a,0>) and kappaO (b -> <0,b>) carry
--   the adjoint action componentwise (innerDeriv_iotaO / innerDeriv_kappaO_full). The imaginary
--   quaternion subspace ImH = ker(starLH+1) has finrank 3 (finrank_ImH_eq_three, rank-nullity
--   on starLH+1 with range Q.1 and finrank H = 4). Then ImO (finrank 7, N22) is the internal
--   sup of three su(2)-invariant pieces: the OLD adjoint 3 = iotaO(ImH), the singlet 1 = Q.e4,
--   the NEW adjoint 3 = kappaO(ImH) (fullBranching_sup_eq_ImO; invariant_iotaImH/_kappaImH),
--   with dimensions 3 + 1 + 3 = 7 (branching_dim_sum). W8: the su(2) acts nontrivially on the
--   OLD 3 (action_on_iotaImH_ne_zero, adHom hI hJ = 2hK /= 0). One cause (the doubling): the
--   embedding (N187), the lower-rung intertwiner (N188), the branching (N189/N190). Foundations-only.
#print axioms Phys.Algebra.iotaO
#print axioms Phys.Algebra.iotaO_injective
#print axioms Phys.Algebra.kappaO_injective
#print axioms Phys.Algebra.innerDeriv_iotaO
#print axioms Phys.Algebra.innerDeriv_kappaO_full
#print axioms Phys.Algebra.starLH
#print axioms Phys.Algebra.ImH
#print axioms Phys.Algebra.mem_ImH
#print axioms Phys.Algebra.reH_trace
#print axioms Phys.Algebra.range_starLH_add_one
#print axioms Phys.Algebra.finrank_ImH_eq_three
#print axioms Phys.Algebra.adHom_mem_ImH
#print axioms Phys.Algebra.invariant_iotaImH
#print axioms Phys.Algebra.invariant_kappaImH
#print axioms Phys.Algebra.fullBranching_sup_eq_ImO
#print axioms Phys.Algebra.finrank_iotaImH
#print axioms Phys.Algebra.finrank_kappaImH
#print axioms Phys.Algebra.finrank_singletLine
#print axioms Phys.Algebra.branching_dim_sum
#print axioms Phys.Algebra.action_on_iotaImH_ne_zero

-- N191 — TWO COMMUTING su(2)'s inside g₂ = Der(O ℚ): the so(4) = su(2)_S × su(2)_T whose
-- DIAGONAL is the embedded weak-isospin su(2) (N187). The second-slot family leftImDeriv +
-- the difference family secondSU2 mutually commute; the inner derivation is their sum.
#print axioms Phys.Algebra.leftImDeriv_isDeriv
#print axioms Phys.Algebra.leftImDeriv_bracket
#print axioms Phys.Algebra.innerDeriv_leftImDeriv_bracket
#print axioms Phys.Algebra.leftImDeriv_innerDeriv_bracket
#print axioms Phys.Algebra.secondSU2_isDeriv
#print axioms Phys.Algebra.secondSU2_bracket
#print axioms Phys.Algebra.secondSU2_commutes_leftImDeriv
#print axioms Phys.Algebra.innerDeriv_eq_diagonal
#print axioms Phys.Algebra.leftImDeriv_hI_isDerivO
#print axioms Phys.Algebra.leftImDeriv_hJ_isDerivO
#print axioms Phys.Algebra.leftImDeriv_hK_isDerivO
#print axioms Phys.Algebra.leftImDeriv_hI_mem
#print axioms Phys.Algebra.leftImDeriv_hJ_mem
#print axioms Phys.Algebra.leftImDeriv_hK_mem
#print axioms Phys.Algebra.secondSU2_hI_isDerivO
#print axioms Phys.Algebra.secondSU2_hJ_isDerivO
#print axioms Phys.Algebra.secondSU2_hK_isDerivO
#print axioms Phys.Algebra.secondSU2_hI_mem
#print axioms Phys.Algebra.secondSU2_hJ_mem
#print axioms Phys.Algebra.secondSU2_hK_mem
#print axioms Phys.Algebra.leftImDeriv_struct_ij
#print axioms Phys.Algebra.leftImDeriv_struct_jk
#print axioms Phys.Algebra.leftImDeriv_struct_ki
#print axioms Phys.Algebra.secondSU2_struct_ij
#print axioms Phys.Algebra.secondSU2_struct_jk
#print axioms Phys.Algebra.secondSU2_struct_ki
#print axioms Phys.Algebra.leftImDeriv_hK_ne_zero
#print axioms Phys.Algebra.secondSU2_hK_ne_zero
#print axioms Phys.Algebra.diagonal_not_commute_leftImDeriv
#print axioms Phys.Algebra.leftImDeriv_struct_ij_coord

-- N192 — THE BRANCHING OF THE 7 UNDER su(2)_T (the second-slot family leftImDeriv): 7 = 3·1 ⊕ 4,
-- distinct from N190's diagonal 1⊕3⊕3, with the SINGLET↔ADJOINT role swap.
#print axioms Phys.Algebra.leftImDeriv_iotaO
#print axioms Phys.Algebra.leftImDeriv_kappaO
#print axioms Phys.Algebra.invariant_kappaTop
#print axioms Phys.Algebra.branchingT_sup_eq_ImO
#print axioms Phys.Algebra.finrank_kappaTop
#print axioms Phys.Algebra.branchingT_dim_sum
#print axioms Phys.Algebra.leftImDeriv_moves_singlet
#print axioms Phys.Algebra.leftImDeriv_annihilates_iotaImH
#print axioms Phys.Algebra.singlet_moved_coord

-- N193 — THE su(2)_S ACTION ON THE 7 + THE JOINT so(4) BIGRADING 7 = (3,1) ⊕ (2,2), with the
-- diagonal singlet-fixing as an EXACT CANCELLATION of the two so(4) factors.
#print axioms Phys.Algebra.secondSU2_iotaO
#print axioms Phys.Algebra.secondSU2_kappaO
#print axioms Phys.Algebra.secondSU2_invariant_iotaImH
#print axioms Phys.Algebra.secondSU2_invariant_kappaTop
#print axioms Phys.Algebra.leftImDeriv_invariant_iotaImH
#print axioms Phys.Algebra.so4_pieces_invariant
#print axioms Phys.Algebra.secondSU2_singlet_eq_neg_leftImDeriv
#print axioms Phys.Algebra.diagonal_fixes_singlet_via_cancellation
#print axioms Phys.Algebra.secondSU2_singlet_coord
#print axioms Phys.Algebra.secondSU2_moves_singlet
#print axioms Phys.Algebra.secondSU2_acts_on_iotaImH_ne_zero

-- N194 — THE (2,2) IS IRREDUCIBLE — the Born-anisotropy / rational-division lever turning the
-- joint so(4) bigrading into a genuine IRREDUCIBLE decomposition (the (2,2) = κO(⊤) has no proper
-- nonzero su(2)_T-invariant — a fortiori so(4)-invariant — subspace).
#print axioms Phys.Algebra.quatNorm
#print axioms Phys.Algebra.starMulSelf_eq_quatNorm
#print axioms Phys.Algebra.quatNorm_eq_zero
#print axioms Phys.Algebra.quatNorm_ne_zero
#print axioms Phys.Algebra.sub_reH_mem_ImH
#print axioms Phys.Algebra.left_mul_mem_of_ideal
#print axioms Phys.Algebra.leftRegular_H_irreducible
#print axioms Phys.Algebra.kappaTop_su2T_irreducible
#print axioms Phys.Algebra.kappaTop_so4_irreducible
#print axioms Phys.Algebra.singletLine_ne_bot
#print axioms Phys.Algebra.singletLine_not_su2T_invariant

-- N195 — THE (3,1) SUMMAND IS IRREDUCIBLE: the Born-anisotropy / rational-division lever applied
-- to the ADJOINT rep, completing the irreducible decomposition of the joint so(4) bigrading
-- 7 = (3,1) ⊕ (2,2). The old line ιO(ImH) (dim 3) is irreducible under su(2)_S (the adjoint action),
-- via the double-bracket lever (4·quatNorm w)•p = ad_w(ad_p w) − (4·(w·p).re.re)•w with quatNorm
-- anisotropic over ℚ. Both branching summands now irreducible — a genuine FULLY IRREDUCIBLE so(4)
-- decomposition. Over ℂ the four-square form is isotropic and the lever fails (rational fact).
#print axioms Phys.Algebra.double_bracket_id
#print axioms Phys.Algebra.iotaImH_irreducible
#print axioms Phys.Algebra.iotaImH_su2S_irreducible
#print axioms Phys.Algebra.iotaImH_ne_bot
#print axioms Phys.Algebra.imHLine_not_adjoint_invariant

-- N196 — THE CANONICAL / MULTIPLICITY-FREE ISOTYPIC DECOMPOSITION 7 = (3,1) ⊕ (2,2). There is NO
-- nonzero su(2)_T-equivariant linear map carrying either summand into the other (both cross-Hom
-- spaces vanish), so the splitting is canonical / unique up to summand order. The lever is the
-- trunk's quaternionic DIVISION at the H rung: left-multiplication by the antifixed unit hI is
-- bijective, so the (2,2) = κO(⊤) (the left-regular H-module) has no nonzero su(2)_T-fixed vector
-- while the (3,1) = ιO(ImH) is su(2)_T-trivial — forcing both cross-intertwiners to vanish. NOT a
-- juxtaposition of N194/N195 (neither irreducibility is used); the SAME division survival that
-- stops the cascade forbids the cross-maps. Over a field where H is not a division algebra it fails.
#print axioms Phys.Algebra.hI_mul_hI
#print axioms Phys.Algebra.left_mul_hI_eq_zero
#print axioms Phys.Algebra.left_mul_hI_surjective
#print axioms Phys.Algebra.kappaTop_no_su2T_fixed
#print axioms Phys.Algebra.hom_iotaImH_to_kappaTop_eq_zero
#print axioms Phys.Algebra.hom_kappaTop_to_iotaImH_eq_zero
#print axioms Phys.Algebra.isotypic_decomposition_canonical
#print axioms Phys.Algebra.kappaO_one_not_su2T_fixed
#print axioms Phys.Algebra.w8_coord
#print axioms Phys.Algebra.iotaO_hJ_ne_zero

-- N197 — THE COMMUTATOR OF THE TWO DECOMPOSITIONS OF THE 7: colour J=L_{u1} vs isospin innerDeriv.
#print axioms Phys.Algebra.u1_eq_iotaO_hI
#print axioms Phys.Algebra.commutator_innerDeriv_JO
#print axioms Phys.Algebra.innerDeriv_u1
#print axioms Phys.Algebra.innerDeriv_u1_eq_zero_iff
#print axioms Phys.Algebra.innerDeriv_hI_u1
#print axioms Phys.Algebra.innerDeriv_hJ_u1
#print axioms Phys.Algebra.hK_ne_zero_witness
#print axioms Phys.Algebra.JO_isospin_not_commute

-- N198 — THE SYLVESTER INERTIA INVARIANCE of the (1,9) determinant form: the genuinely-new
-- strengthening of N43. N43 exhibited ONE (1,9) split; THIS proves the inertia is INVARIANT —
-- the positive (timelike) index is EXACTLY 1 (a UNIQUE time is forced, not chosen) and the
-- negative (spacelike) index is EXACTLY 9. Every subspace on which Qv is positive-definite has
-- finrank ≤ 1; every subspace on which it is negative-definite has finrank ≤ 9; both achieved by
-- the banked N43 blocks. The bound is the submodule dimension formula + the transversality of a
-- definite subspace with the opposite-definite banked block, descending from Born positivity.
#print axioms Phys.Algebra.timeSub_timelike
#print axioms Phys.Algebra.spaceSub_spacelike
#print axioms Phys.Algebra.timelike_inf_spaceSub_eq_bot
#print axioms Phys.Algebra.spacelike_inf_timeSub_eq_bot
#print axioms Phys.Algebra.timelike_index_le_one
#print axioms Phys.Algebra.spacelike_index_le_nine
#print axioms Phys.Algebra.timelike_index_eq_one
#print axioms Phys.Algebra.spacelike_index_eq_nine
#print axioms Phys.Algebra.signature_inertia_one_nine
#print axioms Phys.Algebra.timePlusSpace_not_timelike

-- N199 — THE LIGHT CONE / NULL STRUCTURE and the WITT INDEX of the (1,9) determinant form
--   (Phys/Algebra/SpacetimeLightCone.lean). A genuinely different invariant of the same form:
--   the form is ISOTROPIC (the light cone exists, witnessed by the rational null vector (1,1,0)),
--   and the Witt index (maximal totally-null dimension) is EXACTLY 1.
#print axioms Phys.Algebra.lightVec_null
#print axioms Phys.Algebra.form_isotropic
#print axioms Phys.Algebra.lightVec_not_mem_timeSub
#print axioms Phys.Algebra.lightVec_not_mem_spaceSub
#print axioms Phys.Algebra.nullLine_totallyNull
#print axioms Phys.Algebra.finrank_nullLine
#print axioms Phys.Algebra.totallyNull_inf_spaceSub_eq_bot
#print axioms Phys.Algebra.wittIndex_le_one
#print axioms Phys.Algebra.witt_index_eq_one
#print axioms Phys.Algebra.twoNull_span_not_totallyNull

-- N200 — THE LOSS OF LEFT-ALTERNATIVITY AT THE SEDENION RUNG (the FOURTH termination).
#print axioms Phys.Algebra.sX_mul_zero
#print axioms Phys.Algebra.zero_divisor_breaks_left_alternative
#print axioms Phys.Algebra.leftAlt_lhs_coord
#print axioms Phys.Algebra.leftAlt_lhs_ne_zero
#print axioms Phys.Algebra.sedenion_left_alt_witness
#print axioms Phys.Algebra.sedenion_not_left_alternative

-- N201 — THE COLOUR su(3) IS THE CENTRALIZER OF THE COLOUR COMPLEX STRUCTURE J = L_{u1} IN g₂.
#print axioms Phys.Algebra.comm_deriv_JO
#print axioms Phys.Algebra.commutes_JO_iff
#print axioms Phys.Algebra.comm_bracket
#print axioms Phys.Algebra.colourCentralizer
#print axioms Phys.Algebra.colourCentralizer_eq_stab
#print axioms Phys.Algebra.finrank_colourCentralizer_eq_eight
#print axioms Phys.Algebra.colourCentralizer_ne_bot
#print axioms Phys.Algebra.colourCentralizer_ne_top

-- N202 — THE MEET OF COLOUR su(3) AND ISOSPIN su(2) INSIDE g₂ = ℚ ∙ (innerDeriv hI), dim 1.
#print axioms Phys.Algebra.innerDerivQ
#print axioms Phys.Algebra.innerDerivQ_isDerivQ
#print axioms Phys.Algebra.DI
#print axioms Phys.Algebra.DJ
#print axioms Phys.Algebra.DK
#print axioms Phys.Algebra.DI_u1
#print axioms Phys.Algebra.DJ_u1
#print axioms Phys.Algebra.DK_u1
#print axioms Phys.Algebra.comb_u1
#print axioms Phys.Algebra.hJK_indep
#print axioms Phys.Algebra.comb_mem_colour_iff
#print axioms Phys.Algebra.isospinSpan
#print axioms Phys.Algebra.meet_eq_span_DI
#print axioms Phys.Algebra.DI_ne_zero
#print axioms Phys.Algebra.DJ_not_mem_colour
#print axioms Phys.Algebra.finrank_meet_eq_one

-- N203 — isospin does NOT normalize colour su(3) inside g₂ (colour not an ideal; factors entangled).
#print axioms Phys.Algebra.DI_mem_colour
#print axioms Phys.Algebra.DK_not_mem_colour
#print axioms Phys.Algebra.bracket_DI_DJ_eq
#print axioms Phys.Algebra.bracket_DI_DJ_ne_zero
#print axioms Phys.Algebra.bracket_DJ_DI_not_mem_colour
#print axioms Phys.Algebra.isospin_not_normalize_colour
#print axioms Phys.Algebra.colour_normalizer_ne_top

-- N204 — the invariant trace-form Gram matrix of the weak-isospin triple is −16•I₃
--        (canonical, convention-free normalization forced by the unique invariant form of g₂).
#print axioms Phys.Algebra.bracket_DJ_DK_eq
#print axioms Phys.Algebra.bracket_DK_DI_eq
#print axioms Phys.Algebra.traceForm_DI_DI
#print axioms Phys.Algebra.traceForm_DJ_DJ
#print axioms Phys.Algebra.traceForm_DK_DK
#print axioms Phys.Algebra.traceForm_DI_DJ
#print axioms Phys.Algebra.traceForm_DJ_DK
#print axioms Phys.Algebra.traceForm_DK_DI
#print axioms Phys.Algebra.isospinGram_eq
#print axioms Phys.Algebra.traceForm_DI_DI_ne_zero
#print axioms Phys.Algebra.traceForm_DI_DI_neg

-- N205 — the terminal algebra's OWN commutator bracket is NOT a Lie bracket:
--         the Jacobiator equals six times the alternating associator, and it is genuinely
--         nonzero on the cascade's non-associating triple (the one-cause web — non-associativity
--         forces the gauge Lie algebra to be Der(O ℚ)=g₂, not the carrier's own bracket).
#print axioms Phys.Algebra.octBracket_add_swap
#print axioms Phys.Algebra.octBracket_self
#print axioms Phys.Algebra.jacobiator_eq_assoc_sum
#print axioms Phys.Algebra.jacobiator_eq_six_assoc
#print axioms Phys.Algebra.jacobiator_witness_coord
#print axioms Phys.Algebra.jacobiator_witness_ne_zero
#print axioms Phys.Algebra.not_lie_bracket

-- N206 — THE 7-DIMENSIONAL CROSS PRODUCT on Im(O ℚ) and its LAGRANGE NORM IDENTITY:
--         octCross x y := x·y + ⟨x,y⟩•1 = Im(x·y) is anticommutative (octCross_antisymm),
--         closes in ImO (octCross_mem_ImO), and satisfies the composition-algebra Lagrange
--         identity gForm(x⊗y)(x⊗y) = gForm x x·gForm y y − (gForm x y)² (octCross_lagrange);
--         genuinely nonzero (octCross_u1_u2_ne_zero) with the orthonormal value 1
--         (octCross_lagrange_u1_u2). The vector-product face of the exceptional structure.
#print axioms Phys.Algebra.octCross
#print axioms Phys.Algebra.octMul_re_eq_neg_gForm
#print axioms Phys.Algebra.octCross_mem_ImO
#print axioms Phys.Algebra.octMul_symm_eq
#print axioms Phys.Algebra.octCross_antisymm
#print axioms Phys.Algebra.octCross_self
#print axioms Phys.Algebra.octCross_lagrange
#print axioms Phys.Algebra.gForm_ImO_one
#print axioms Phys.Algebra.octCross_u1_u2_coord
#print axioms Phys.Algebra.octCross_u1_u2_ne_zero
#print axioms Phys.Algebra.octCross_lagrange_u1_u2

-- N207 — DERIVATION-INVARIANCE OF THE 7-DIMENSIONAL CROSS PRODUCT: every Leibniz derivation
--         D of the octonion product (the elements of derivationLieQ = Der(O ℚ) = g₂, N16–N21)
--         is also a derivation of the cross product octCross (N206):
--         D (octCross x y) = octCross (D x) y + octCross x (D y) (octCross_deriv_leibniz);
--         the Lie-algebra form derivationLieQ_octCross_leibniz connects the two faces of the
--         exceptional structure (the product N205 and the vector product N206) to ONE symmetry
--         algebra g₂. The correction term (gForm x y)•1 is killed by skew-adjointness
--         (gFormQ_skew, N24). Non-vacuous at the banked nullbasis derivation D0E and units u1,u2
--         (octCross_deriv_witness_coord = −1, octCross_deriv_witness_ne_zero).
#print axioms Phys.Algebra.octCross_deriv_leibniz
#print axioms Phys.Algebra.derivationLieQ_octCross_leibniz
#print axioms Phys.Algebra.octCross_deriv_witness_coord
#print axioms Phys.Algebra.octCross_deriv_witness_ne_zero
#print axioms Phys.Algebra.octCross_deriv_witness

-- N208 — THE 7-DIMENSIONAL CROSS-PRODUCT CONTRACTION (VECTOR TRIPLE-PRODUCT) IDENTITY:
--         for imaginary x, y ∈ ImO, octCross x (octCross x y) = (gForm x y)•x − (gForm x x)•y
--         (octCross_contraction). The 7-dim analogue of x×(x×y) = ⟨x,y⟩x − ⟨x,x⟩y; the FULL
--         BAC–CAB rule fails in 7 dimensions, but this contracted (x,x,y) case survives PRECISELY
--         because of LEFT ALTERNATIVITY mul_mul_left (Alternative.lean, the alternating (x,x,y)
--         associator vanishes) + the imaginary minimal polynomial x·x = −(gForm x x)•1 (octSq_ImO)
--         + the orthogonality gForm x (octCross x y) = 0 (gForm_x_octCross). A NEW connection
--         N206 (cross product) ↔ Alternative.lean (the alternative laws), distinct from N206's
--         scalar Lagrange norm identity (degree 2) and N205's full-algebra Jacobiator.
--         Non-vacuous at the orthonormal pair u1, u2: octCross u1 (octCross u1 u2) = −u2
--         (octCross_contraction_witness_coord = −1, octCross_contraction_witness_ne_zero).
#print axioms Phys.Algebra.reQ_ImO_zero
#print axioms Phys.Algebra.octSq_ImO
#print axioms Phys.Algebra.octMul_x_octCross
#print axioms Phys.Algebra.gForm_x_octCross
#print axioms Phys.Algebra.octCross_contraction
#print axioms Phys.Algebra.octCross_contraction_witness
#print axioms Phys.Algebra.octCross_contraction_witness_coord
#print axioms Phys.Algebra.octCross_contraction_witness_ne_zero

-- N209 — THE ASSOCIATIVE CALIBRATION 3-FORM φ(x,y,z) = ⟨x, y × z⟩ on Im(O ℚ):
--         assoc3 x y z := gForm x (octCross y z). For imaginary x, y, z ∈ ImO this equals
--         − reQ (x·(y·z)) (assoc3_eq_neg_reQ), and it is CYCLIC (assoc3_cyclic) and ANTISYMMETRIC
--         under each transposition (assoc3_swap_yz, assoc3_swap_xy) — hence totally antisymmetric:
--         the calibration 3-form whose stabilizer in GL(7) is the exceptional structure g₂=Der(O).
--         The genuinely-new lever is the real-part TRACE-ASSOCIATIVITY reQ((a·b)·c)=reQ(a·(b·c))
--         (reQ_mul_assoc3) — the real part of the octonion product is associative though the product
--         is not — never banked before; together with trace cyclicity reQ(a·b)=reQ(b·a)
--         (reQ_mul_comm) it forces the cyclic symmetry. A NEW connection N206 (cross product) +
--         N24 (Born form) → the alternating 3-form, distinct from N206's bilinear vector product,
--         N206's scalar Lagrange norm, N208's degree-3 vector contraction, and N205's Jacobiator.
--         Non-vacuous: assoc3 u2 u1 (octCross u1 u2) = −1 (assoc3_witness, assoc3_witness_ne_zero),
--         flipping to +1 under the xy-swap (assoc3_witness_swapped) — genuinely alternating.
#print axioms Phys.Algebra.reQ_mul_comm
#print axioms Phys.Algebra.reQ_mul_assoc3
#print axioms Phys.Algebra.gForm_neg_right
#print axioms Phys.Algebra.assoc3_eq_neg_reQ
#print axioms Phys.Algebra.assoc3_cyclic
#print axioms Phys.Algebra.assoc3_swap_yz
#print axioms Phys.Algebra.assoc3_swap_xy
#print axioms Phys.Algebra.assoc3_witness
#print axioms Phys.Algebra.assoc3_witness_ne_zero
#print axioms Phys.Algebra.assoc3_witness_swapped

-- N210 — THE COASSOCIATIVE 4-FORM ψ(x,y,z,w) = ⟨[x,y,z], w⟩ on Im(O ℚ) (the Hodge dual *φ):
--         coassoc4 x y z w := gForm (assoc x y z) w, assembling the banked associator
--         assoc x y z = (x·y)·z − x·(y·z) (N5b, ALTERNATING in its three slots) with the Born
--         form gForm (N24). For imaginary w it equals − reQ ([x,y,z]·w) (coassoc4_eq_neg_reQ) and
--         it is ANTISYMMETRIC under each adjacent transposition: x↔y (coassoc4_swap_xy), y↔z
--         (coassoc4_swap_yz), z↔w (coassoc4_swap_zw) — hence totally antisymmetric, the alternating
--         4-form whose GL(7) stabilizer is the same g₂=Der(O) that fixes φ (N209). The genuinely-new
--         lever is the (z,w)-EXCHANGE assoc_reQ_skew: reQ([x,y,z]·w)+reQ([x,y,w]·z)=0 — the
--         associator is SKEW for the Born form in its last slot, content NOT in the three-slot
--         associator alternation. Non-vacuous: coassoc4 a b c [a,b,c] = ‖[a,b,c]‖² = 4 ≠ 0
--         (coassoc4_witness_ne_zero, coassoc4_witness_coord) on the cascade's non-associating triple.
#print axioms Phys.Algebra.coassoc4
#print axioms Phys.Algebra.coassoc4_eq_neg_reQ
#print axioms Phys.Algebra.assoc_reQ_skew
#print axioms Phys.Algebra.coassoc4_swap_xy
#print axioms Phys.Algebra.coassoc4_swap_yz
#print axioms Phys.Algebra.coassoc4_swap_zw
#print axioms Phys.Algebra.coassoc4_witness_ne_zero
#print axioms Phys.Algebra.coassoc4_witness_coord

-- N211 — THE CROSS-PRODUCT GRAM CONTRACTION (the polarized Born composition law): polarizing
--         the banked Born composition law gForm_comp (N24, gForm (x·y)(x·y) = gForm x x · gForm y y)
--         twice — left factor (gForm_right_exchange) then right factor — yields the master EXCHANGE
--         identity gForm (x·y)(z·w) + gForm (x·w)(z·y) = 2·gForm x z·gForm y w, the fully-polarized
--         composition law with NO coordinate expansion. On Im(O ℚ), where octCross x y = Im(x·y) is
--         the 7-dim vector product (N206), it contracts the Gram pairing of two cross products to the
--         metric: gForm (octCross x y)(octCross z w) + gForm (octCross x w)(octCross z y) =
--         2·gForm x z·gForm y w − gForm x y·gForm z w − gForm x w·gForm y z — the symmetric (metric)
--         part of the calibration contraction ⟨φ,φ⟩, in which the totally-antisymmetric coassociative
--         4-form ψ=*φ (N210) cancels. On the diagonal z=x, w=y it recovers the banked Lagrange/
--         Pythagorean norm identity (N206), of which it is the full polarization. Non-vacuous:
--         the contraction = 2 ≠ 0 on the orthonormal witness pair u1, u2 (octCross_gram_witness,
--         octCross_gram_witness_ne_zero).
#print axioms Phys.Algebra.gForm_right_exchange
#print axioms Phys.Algebra.gForm_exchange
#print axioms Phys.Algebra.gForm_xy_one
#print axioms Phys.Algebra.gForm_one_zw
#print axioms Phys.Algebra.gForm_octCross_octCross
#print axioms Phys.Algebra.octCross_gram_contraction
#print axioms Phys.Algebra.octCross_gram_witness
#print axioms Phys.Algebra.octCross_gram_witness_ne_zero

-- N212 — THE FORCED WEIGHT GRADING OF THE DIAGONAL CARTAN FRAME ON J₃(O).
#print axioms Phys.Algebra.HJ.jb_Du0_Xz
#print axioms Phys.Algebra.HJ.jb_Du1_Xz
#print axioms Phys.Algebra.HJ.jb_Du2_Xz
#print axioms Phys.Algebra.HJ.jb_Dg_Xz
#print axioms Phys.Algebra.HJ.frame_sum
#print axioms Phys.Algebra.HJ.Du0_idem
#print axioms Phys.Algebra.HJ.jb_Du0_Du1
#print axioms Phys.Algebra.HJ.slot01_weight_witness
#print axioms Phys.Algebra.HJ.slot01_E2_annihilates

-- N213 — THE FULL WEIGHT DIAGRAM + THE TRACE-ZERO CHARGE HYPERPLANE ON J₃(O).
#print axioms Phys.Algebra.HJ.jb_Du0_Xzabc
#print axioms Phys.Algebra.HJ.jb_Du1_Xzabc
#print axioms Phys.Algebra.HJ.jb_Du2_Xzabc
#print axioms Phys.Algebra.HJ.Xz_smul
#print axioms Phys.Algebra.HJ.Xz_add
#print axioms Phys.Algebra.HJ.jb_Dg_Xzabc
#print axioms Phys.Algebra.HJ.weight_sum_eq_two_trace
#print axioms Phys.Algebra.HJ.jb_Dg_Xzabc_traceZero
#print axioms Phys.Algebra.HJ.weight_sum_traceZero
#print axioms Phys.Algebra.HJ.slot12_traceZero_weight_witness
#print axioms Phys.Algebra.HJ.slot_weights_traceZero_sum_zero

-- N214 — THE LINEAR TRACE FORM + THE BILINEAR TRACE FORM (Cartan–Killing metric) on J₃(O),
--        and the charge hyperplane as the trace-form-orthogonal complement of the forced identity.
#print axioms Phys.Algebra.HJ.jTr_Dg
#print axioms Phys.Algebra.HJ.jTr_Xz
#print axioms Phys.Algebra.HJ.jTraceForm_symm
#print axioms Phys.Algebra.HJ.jTF_Dg_Dg
#print axioms Phys.Algebra.HJ.Du0_eq_Dg
#print axioms Phys.Algebra.HJ.Du1_eq_Dg
#print axioms Phys.Algebra.HJ.Du2_eq_Dg
#print axioms Phys.Algebra.HJ.jTF_Du0_Du0
#print axioms Phys.Algebra.HJ.jTF_Du0_Du1
#print axioms Phys.Algebra.HJ.Dg_one
#print axioms Phys.Algebra.HJ.jTF_one_Dg
#print axioms Phys.Algebra.HJ.jTF_one_Dg_zero_iff
#print axioms Phys.Algebra.HJ.traceform_metric_witness
#print axioms Phys.Algebra.HJ.traceform_metric_witness_ne

-- N215 — THE CUBIC NORM (the Freudenthal reduced determinant) on J₃(O),
--        and the WELL-DEFINEDNESS of its trilinear cross-term (bracketing-independent + cyclic).
#print axioms Phys.Algebra.HJ.jN_diag
#print axioms Phys.Algebra.HJ.jN_one
#print axioms Phys.Algebra.HJ.jN_frame0
#print axioms Phys.Algebra.HJ.jN_cross_assoc
#print axioms Phys.Algebra.HJ.jN_cross_cyclic1
#print axioms Phys.Algebra.HJ.jN_cross_cyclic2
#print axioms Phys.Algebra.HJ.jN_witness_a
#print axioms Phys.Algebra.HJ.jN_witness_cross
#print axioms Phys.Algebra.HJ.jN_witness_cross_ne

-- N216 — THE COMPLETED INVARIANT TOWER on J₃(O): the middle quadratic-spur invariant `jS`
--        and the generic characteristic / minimal polynomial (`jN_shift`, `jN_charpoly`)
--        whose three coefficients ARE the linear/quadratic/cubic invariants.
#print axioms Phys.Algebra.HJ.jS
#print axioms Phys.Algebra.HJ.jS_diag
#print axioms Phys.Algebra.HJ.jS_one
#print axioms Phys.Algebra.HJ.jS_frame0
#print axioms Phys.Algebra.HJ.gForm_neg_neg
#print axioms Phys.Algebra.HJ.reQ_cross_neg
#print axioms Phys.Algebra.HJ.jN_shift
#print axioms Phys.Algebra.HJ.jN_charpoly
#print axioms Phys.Algebra.HJ.jS_witness
#print axioms Phys.Algebra.HJ.jN_charpoly_witness
#print axioms Phys.Algebra.HJ.jS_witness_ne

-- N217 — THE FIRST POLARIZATION OF THE CUBIC NORM on J₃(O): the first polar `jNpolar`
--        (the Freudenthal sharp trace-pairing) and the cubic polarization identity
--        `jN (A + s·B) = jN A + s·jNpolar A B + s²·jNpolar B A + s³·jN B` — the sharp map
--        forced as the linear coefficient of the derived cubic norm's own polarization.
#print axioms Phys.Algebra.HJ.star_qsmul
#print axioms Phys.Algebra.HJ.jNpolar
#print axioms Phys.Algebra.HJ.jN_polarize
#print axioms Phys.Algebra.HJ.jNpolar_one_dir
#print axioms Phys.Algebra.HJ.jNpolar_diag
#print axioms Phys.Algebra.HJ.jNpolar_cross_witness
#print axioms Phys.Algebra.HJ.jNpolar_cross_witness_ne

-- N218T — THE GATHER ON THE TOWER: the rung-by-rung behaviour of INTER-WORLD gluing
--        (the left regular representation `worldMap a = L_a`) across the derived
--        Cayley–Dickson tower `Dbl ℚ → H ℚ → O ℚ → S ℚ`. Gather-coherence DEGRADES in a
--        forced four-step staircase (glue+symmetric → glue-not-symmetric → self-glue-only
--        → no-self-glue), one step lost at each doubling by exactly the property doubling
--        destroys (commutativity → associativity → left-alternativity). Last self-cohering
--        rung is O ℚ = the cascade stop (self-glue = Born-composition-law shadow). Rung-
--        dependent capstone `gather_staircase` exhibits all four distinct behaviours at once.
#print axioms Phys.Algebra.worldMap
#print axioms Phys.Algebra.WorldsGlue
#print axioms Phys.Algebra.dbl_worlds_glue
#print axioms Phys.Algebra.dbl_worlds_symm
#print axioms Phys.Algebra.h_worlds_glue
#print axioms Phys.Algebra.h_worlds_not_symm
#print axioms Phys.Algebra.o_world_self_glue
#print axioms Phys.Algebra.o_worlds_not_glue
#print axioms Phys.Algebra.s_self_glue_fail_coord
#print axioms Phys.Algebra.s_world_not_self_glue
#print axioms Phys.Algebra.gather_staircase

-- N219 — THE EXPLICIT GLUING-OBSTRUCTION COCYCLE: a deeper cut of the N218T gather
--        frontier. The obstruction to `WorldsGlue a b` is the explicit map
--        `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)`, whose vanishing IS `WorldsGlue a b`
--        (`worlds_glue_iff_gluingDefect_zero`), and on the octonion shape it is EXACTLY
--        the banked associator `[a,b,·]` (`o_gluingDefect_eq_assoc`). Across the tower the
--        SINGLE obstruction cocycle degrades: identically-zero on the associative rungs
--        `Dbl/H ℚ` → nonzero but ALTERNATING on `O ℚ` (diagonal `[a,a,·]=0` self-vanishing
--        + antisymmetric) → NON-alternating on `S ℚ` (self-obstruction ≠ 0). Self-coherence
--        = the alternating (diagonal-vanishing) property of the associator, lost at `S ℚ`
--        exactly where left-alternativity is lost. Capstone `gluing_obstruction_staircase`.
#print axioms Phys.Algebra.gluingDefect
#print axioms Phys.Algebra.worlds_glue_iff_gluingDefect_zero
#print axioms Phys.Algebra.dbl_gluingDefect_zero
#print axioms Phys.Algebra.h_gluingDefect_zero
#print axioms Phys.Algebra.o_gluingDefect_eq_assoc
#print axioms Phys.Algebra.o_gluingDefect_self
#print axioms Phys.Algebra.o_gluingDefect_antisymm
#print axioms Phys.Algebra.o_gluingDefect_ne_zero
#print axioms Phys.Algebra.s_gluingDefect_self_ne_zero
#print axioms Phys.Algebra.gluing_obstruction_staircase

-- N220 — THE GLUING-OBSTRUCTION COCYCLE STRUCTURE: a still-deeper cut of the N219 gather
--        frontier. The N219 gluing obstruction `gluingDefect = [·,·,·]` on the banked octonion
--        rung `O ℚ` is (1) a genuine Hochschild 3-COCYCLE — Hochschild-closed, `δ(assoc)=0`
--        (`teich_cocycle_O`, the Teichmüller identity); (2) EXACT — the coboundary of the
--        derived multiplication, `δμ = −2·assoc` (`mult_coboundary_O`); (3) as the `End`-valued
--        2-cochain `b ↦ gluingDefect a b` it is NOT closed — its coboundary is the LEVEL-UP
--        associator `−([a,b,c]·x)` (`gluingDefect_2coboundary_O`, the associator-of-associators);
--        (4) its cyclic antisymmetrization is exactly `6·` itself = the banked Jacobiator N205
--        (`jacobiator_eq_six_gluingDefect_O`); (5) it is a genuinely NONZERO cochain
--        (`gluing_cocycle_nonzero_O`, banked `assoc_nonvanishing`). Capstone
--        `gluing_cocycle_structure`. The tower's gluing obstruction is homologically the
--        coboundary of its own multiplication, and its higher defect is the associator one
--        level up — the same one cause (non-associativity) linking N219's obstruction to N205's
--        non-Lie Jacobiator.
#print axioms Phys.Algebra.teich_cocycle_generic
#print axioms Phys.Algebra.mult_coboundary_generic
#print axioms Phys.Algebra.gluingDefect_2coboundary_generic
#print axioms Phys.Algebra.teich_cocycle_O
#print axioms Phys.Algebra.mult_coboundary_O
#print axioms Phys.Algebra.gluingDefect_is_assoc_O
#print axioms Phys.Algebra.teich_cocycle_gluingDefect_O
#print axioms Phys.Algebra.gluingDefect_2coboundary_O
#print axioms Phys.Algebra.jacobiator_eq_six_gluingDefect_O
#print axioms Phys.Algebra.gluing_cocycle_nonzero_O
#print axioms Phys.Algebra.gluing_cocycle_structure

-- N221 — THE GLUING-OBSTRUCTION COCYCLE IS g₂-EQUIVARIANT; ITS CALIBRATION FORMS ARE
--        g₂-INVARIANT (a STILL-DEEPER cut of the N219/N220 gather frontier, under the OVERNIGHT
--        LOCK). Over the banked octonion rung `O ℚ = CD (H ℚ)`: the gluing obstruction (= the
--        associator, N219) is EQUIVARIANT under the banked derivation Lie algebra
--        `Der(O ℚ) = g₂` (N16–N207) — `D [x,y,z] = [Dx,y,z] + [x,Dy,z] + [x,y,Dz]`
--        (`assoc_derivQ_equivariant_O`, and on the obstruction map `gluingDefect_derivQ_equivariant_O`);
--        CONSEQUENTLY the coassociative calibration 4-form `ψ = ⟨[x,y,z],w⟩` (N210,
--        `coassoc4_derivQ_invariant`) and the associative calibration 3-form `φ = ⟨x, y×z⟩`
--        (N209, `assoc3_derivQ_invariant`) are g₂-INVARIANT (total infinitesimal variation = 0),
--        combining the equivariance with the banked skew-adjointness `gFormQ_skew` (N24/N26) and
--        cross-product equivariance `octCross_deriv_leibniz` (N207). The gather obstruction
--        (N218T–N220) and the gauge carrier `g₂ = Der(O)` (N16–N207) are ONE g₂-object. Non-vacuity
--        at the banked witness (`assoc_nonvanishing`) + the concrete derivation `D0E` (N16). Capstone
--        `obstruction_g2_invariance_structure`.
#print axioms Phys.Algebra.assoc_deriv_equivariant
#print axioms Phys.Algebra.assoc_derivQ_equivariant_O
#print axioms Phys.Algebra.gluingDefect_derivQ_equivariant_O
#print axioms Phys.Algebra.coassoc4_derivQ_invariant
#print axioms Phys.Algebra.assoc3_derivQ_invariant
#print axioms Phys.Algebra.assoc_equivariant_at_D0E
#print axioms Phys.Algebra.obstruction_invariance_nonvacuous
#print axioms Phys.Algebra.obstruction_g2_invariance_structure

-- N222 — THE GLUING-OBSTRUCTION COCYCLE IS A g₂-EQUIVARIANT MAP INTO THE FUNDAMENTAL
--        7-REPRESENTATION (ImO) (a STILL-DEEPER cut of the N219/N220/N221 gather frontier,
--        under the OVERNIGHT LOCK). Over the banked octonion rung `O ℚ = CD (H ℚ)`: the gluing
--        obstruction (= the associator, N219) is VALUED IN THE FUNDAMENTAL 7 — `reQ (assoc x y z)
--        = 0` (`reQ_assoc_zero`) so `assoc x y z ∈ ImO` (`assoc_mem_ImO`, the banked finrank-7
--        fundamental g₂-module N22; on the obstruction map `gluingDefect_mem_ImO`) — it
--        ANNIHILATES THE TRIVIAL REP (the unit) in each slot (`assoc_one_left`/`_mid`/`_right`),
--        and as an element of the banked fundamental 7-rep `imRep` it is a g₂-INTERTWINER,
--        transforming by the Leibniz sum (`assoc_imRep_equivariant`, the rep-theoretic content of
--        the N221 equivariance). Non-vacuity: the obstruction is a genuinely NONZERO element of
--        the 7 at the imaginary witness triple (`obstruction_nonzero_in_seven`, banked
--        `assoc_nonvanishing`). Capstone `obstruction_seven_rep_structure`.
#print axioms Phys.Algebra.reQ_assoc_zero
#print axioms Phys.Algebra.mem_ImO_of_reQ_zero
#print axioms Phys.Algebra.assoc_mem_ImO
#print axioms Phys.Algebra.gluingDefect_mem_ImO
#print axioms Phys.Algebra.assoc_one_left
#print axioms Phys.Algebra.assoc_one_mid
#print axioms Phys.Algebra.assoc_one_right
#print axioms Phys.Algebra.assoc_imRep_equivariant
#print axioms Phys.Algebra.wa_mem_ImO
#print axioms Phys.Algebra.wb_mem_ImO
#print axioms Phys.Algebra.wc_mem_ImO
#print axioms Phys.Algebra.obstruction_nonzero_in_seven
#print axioms Phys.Algebra.obstruction_seven_rep_structure

-- N223 — THE CROSS PRODUCT REALIZES THE FUNDAMENTAL 7 INSIDE so(7): the g₂-equivariant
--        embedding 7 → so(7) ⊂ End(7), with g₂ = Der(O ℚ) in the SAME so(7) (a STILL-DEEPER cut
--        of the N219–N222 gather frontier, under the OVERNIGHT LOCK). Over the banked octonion
--        rung `O ℚ = CD (H ℚ)` with the banked fundamental 7-module `ImO` (N22): the Born form
--        `gForm` restricted to `ImO` is packaged as `bornBil`; the cross-product operator
--        `crossOp a : ImO → ImO` (`y ↦ octCross a y`) is SKEW-ADJOINT for it and lands in
--        `skewAdjointLieSubalgebra bornBil = so(7)` (`crossOp_mem_so7`, the total antisymmetry of
--        the calibration 3-form `assoc3`, N209); every element of the banked 7-rep `imRep` (the
--        adjoint g₂ = Der(O ℚ), N22) lands in the SAME so(7) (`imRep_mem_so7`, banked `gFormQ_skew`
--        N26); the g₂-intertwiner `⁅imRep D, crossOp a⁆ = crossOp (D a)` links them
--        (`crossOp_imRep_intertwine`, banked `derivationLieQ_octCross_leibniz` N207) — the fundamental
--        7 is a g₂-submodule of so(7), the `so(7) = 14 ⊕ 7` arena. Non-vacuity: `crossOp u1 ≠ 0`
--        (`crossOp_ne_zero`) and the skew identity is non-trivial at a ±1 witness
--        (`crossOp_skew_witness`). Capstone `cross_seven_in_so7_structure`.
#print axioms Phys.Algebra.bornBil
#print axioms Phys.Algebra.crossOp
#print axioms Phys.Algebra.assoc3_swap_xz
#print axioms Phys.Algebra.crossOp_mem_so7
#print axioms Phys.Algebra.imRep_mem_so7
#print axioms Phys.Algebra.crossOp_imRep_intertwine
#print axioms Phys.Algebra.crossOp_ne_zero
#print axioms Phys.Algebra.crossOp_skew_witness
#print axioms Phys.Algebra.cross_seven_in_so7_structure

-- N224 — THE CROSS PRODUCT'S FAITHFUL, FULL, g₂-STABLE EMBEDDING OF THE FUNDAMENTAL 7 INTO so(7):
--        the 7-summand of `so(7) = 14 ⊕ 7`, made rigorous on the banked tower (a STILL-DEEPER cut
--        of the N219–N223 gather frontier, under the OVERNIGHT LOCK). N223's embedding statement
--        was POINTWISE (membership + one nonzero witness). N224 packages the embedding as an
--        honest LINEAR MAP `crossEmb : ImO →ₗ[ℚ] End ℚ ImO` (`a ↦ crossOp a`, linear via `add_mul`/
--        banked `qsmul_mul_left` + Born bilinearity) and proves it FAITHFUL (`crossEmb_injective`,
--        via the banked contraction N206 + `finrank_ImO = 7` N22 + Born anisotropy `gForm_self_eq_zero`
--        N24), with DIMENSION-7 image (`finrank_crossEmb_range`), lying in `so(7)`
--        (`crossEmb_range_le_so7`, banked `crossOp_mem_so7` N223), and a g₂-SUBMODULE under the
--        adjoint action (`crossEmb_range_g2_invariant`, banked intertwiner N223 + `derivLieQ_mapsTo`
--        N22). Non-vacuity `crossEmb_ne_zero`. Capstone `cross_seven_faithful_in_so7_structure`.
#print axioms Phys.Algebra.crossEmb
#print axioms Phys.Algebra.crossEmb_apply
#print axioms Phys.Algebra.crossOp_inj_on_ImO
#print axioms Phys.Algebra.crossEmb_injective
#print axioms Phys.Algebra.finrank_crossEmb_range
#print axioms Phys.Algebra.crossEmb_range_le_so7
#print axioms Phys.Algebra.crossEmb_range_g2_invariant
#print axioms Phys.Algebra.crossEmb_ne_zero
#print axioms Phys.Algebra.cross_seven_faithful_in_so7_structure

-- N225 — THE EXPLICIT g₂-MODULE COMPLEMENT `so(7) = imRep(g₂) ⊕ crossEmb(7)`: the `so(7) = 14 ⊕ 7`
--        direct-sum decomposition made rigorous on the banked tower (a STILL-DEEPER cut of the
--        N219–N224 gather frontier, under the OVERNIGHT LOCK). N223/N224 showed both the adjoint
--        g₂ (`range imRep`, dim 14) and the fundamental 7 (`range crossEmb`, dim 7) sit inside one
--        `so(7) = skewAdjointLieSubalgebra bornBil`; N225 proves them COMPLEMENTARY. THE CRUX
--        `inter_eq_bot` (`range imRep ⊓ range crossEmb = ⊥`): the preimage of `range crossEmb` under
--        the Lie hom `imRep` is a LIE IDEAL `interIdeal` (lie_mem = banked N224 g₂-invariance
--        `crossEmb_range_g2_invariant`); the banked SIMPLICITY `derivationLieQ_isSimpleOrder` (N28)
--        forces it to `⊥`/`⊤`, and `⊤` gives finrank 14 > 7, impossible — so trivial. THE SAME
--        simplicity of Der(O) that makes g₂ 14-dim forbids the 14 and the 7 from sharing a submodule
--        (one cause, one termination). `sup_eq_so7` (`range imRep ⊔ range crossEmb = so(7)`): the
--        21-dim direct sum fills the `≤ C(7,2)=21`-dim so(7) (banked `finrank_skewAdjoint_le_choose`
--        N28 at `bornBil`). `finrank_so7_eq_21` falls out. Both summands g₂-submodules
--        (`imRep_range_g2_invariant` via imRep's map_lie; crossEmb via N224). Non-vacuity
--        `so7_complement_nontrivial`. Capstone `so7_eq_adjoint_plus_fundamental`.
#print axioms Phys.Algebra.bornBil_isSymm
#print axioms Phys.Algebra.bornBil_nondegenerate
#print axioms Phys.Algebra.interIdeal
#print axioms Phys.Algebra.inter_eq_bot
#print axioms Phys.Algebra.finrank_imRep_range
#print axioms Phys.Algebra.finrank_sup_eq_21
#print axioms Phys.Algebra.sup_eq_so7
#print axioms Phys.Algebra.finrank_so7_eq_21
#print axioms Phys.Algebra.imRep_range_g2_invariant
#print axioms Phys.Algebra.so7_complement_nontrivial
#print axioms Phys.Algebra.so7_eq_adjoint_plus_fundamental

-- N226 — THE g₂-EQUIVARIANT PROJECTION `so(7) → crossEmb(7)` ALONG `imRep(g₂)`: the retraction
--        realizing the N225 `so(7) = 14 ⊕ 7` complement as a MORPHISM OF g₂-MODULES (a STILL-DEEPER
--        cut of the gather frontier, under the OVERNIGHT LOCK). N225 banked the direct-sum FACTS
--        (⊓=⊥, ⊔=so7, dims 14/7/21); N226 builds the SPLITTING MAP. `isCompl_fun_adj` packages the
--        N225 trivial-intersection + span as `IsCompl` on the pulled-back summands inside `↥so(7)`.
--        `adSo7 D` is the adjoint g₂-action `X ↦ ⁅imRep D, X⁆` (well-defined via
--        `isSkewAdjoint_bracket` + banked `imRep_mem_so7`); both summands g₂-stable
--        (`funIn_adSo7_inv` banked N224, `adjIn_adSo7_inv` banked N225). `projFun` is the projector
--        onto the fundamental 7 along the adjoint 14: idempotent (`projFun_idem`), range the
--        fundamental (`projFun_range`, full dim 7 `finrank_projFun_range`), kernel the adjoint
--        (`projFun_ker`). THE CROWN `projFun_equivariant`: `projFun (adSo7 D X) = adSo7 D (projFun X)`
--        — the projector COMMUTES with the g₂-action, a genuine g₂-module retraction (proof:
--        decompose X = fundamental + adjoint, project each). Capstone
--        `g2_equivariant_projection_structure`.
#print axioms Phys.Algebra.isCompl_fun_adj
#print axioms Phys.Algebra.adSo7
#print axioms Phys.Algebra.adSo7_coe
#print axioms Phys.Algebra.funIn_adSo7_inv
#print axioms Phys.Algebra.adjIn_adSo7_inv
#print axioms Phys.Algebra.projFun
#print axioms Phys.Algebra.projFun_eq
#print axioms Phys.Algebra.projFun_idem
#print axioms Phys.Algebra.projFun_projFun
#print axioms Phys.Algebra.projFun_range
#print axioms Phys.Algebra.projFun_ker
#print axioms Phys.Algebra.projFun_apply_mem
#print axioms Phys.Algebra.projFun_apply_fun
#print axioms Phys.Algebra.projFun_apply_adj
#print axioms Phys.Algebra.finrank_projFun_range
#print axioms Phys.Algebra.projFun_equivariant
#print axioms Phys.Algebra.g2_equivariant_projection_structure

-- N227 — THE SYMMETRIC / ANTISYMMETRIC SPLIT OF `7 ⊗ 7`:
--        `End ℚ ImO = Sym²7 (28) ⊕ Λ²7 (21 = so(7))` as g₂-modules (a STILL-DEEPER cut of the
--        gather frontier N218T/…/N226, under the OVERNIGHT LOCK). The whole N223–N226 so(7) arc
--        lives on the ANTISYMMETRIC (skew-adjoint) half of `7 ⊗ 7`; N227 opens the SYMMETRIC half.
--        The Born-adjoint involution `bAdj φ = bornBil.leftAdjointOfNondegenerate _ φ` (transpose
--        w.r.t. the banked Born form) is an involution (`bAdj_involutive`), ℚ-linear, and
--        anti-multiplicative (`bAdj_mul`) since `bornBil` is symmetric (N225) and nondegenerate
--        (N225). Its fixed / anti-fixed submodules are the self- / skew-adjoint sides
--        (`mem_self_iff`/`mem_skew_iff`); they are COMPLEMENTARY (`selfSkew_isCompl`: disjoint by
--        char 0, codisjoint by the canonical `½(φ+bAdjφ)+½(φ−bAdjφ)` split) — `End = Sym² ⊕ Λ²`.
--        Dimensions `49 = 28 + 21` (`finrank_end_eq_49` via `finrank_ImO`; `finrank_selfAdj_eq_28`
--        via `finrank_add_eq_of_isCompl` + banked `finrank_so7_eq_21` N225). Both summands are
--        g₂-stable under `adEnd D : X ↦ ⁅imRep D, X⁆` (`skewAdj_adEnd_inv` via Mathlib
--        `isSkewAdjoint_bracket` + banked `imRep_mem_so7`; `selfAdj_adEnd_inv` via `bAdj`
--        anti-mult + `imRep D` skew). Non-vacuity: `one_mem_selfAdj` (the trivial rep `1 = ℚ·id`
--        lives in the symmetric side), `one_adEnd_zero` (`⁅imRep D, 1⁆ = 0`). Capstone
--        `sym_antisym_decomposition_structure`.
#print axioms Phys.Algebra.bAdj
#print axioms Phys.Algebra.bAdj_pair
#print axioms Phys.Algebra.bAdj_eq_iff
#print axioms Phys.Algebra.bornBil_symm
#print axioms Phys.Algebra.isAdjointPair_swap
#print axioms Phys.Algebra.bAdj_involutive
#print axioms Phys.Algebra.bAdj_add
#print axioms Phys.Algebra.bAdj_sub
#print axioms Phys.Algebra.bAdj_smul
#print axioms Phys.Algebra.bAdj_mul
#print axioms Phys.Algebra.bAdj_one
#print axioms Phys.Algebra.mem_self_iff
#print axioms Phys.Algebra.mem_skew_iff
#print axioms Phys.Algebra.selfSkew_disjoint
#print axioms Phys.Algebra.selfSkew_codisjoint
#print axioms Phys.Algebra.selfSkew_isCompl
#print axioms Phys.Algebra.finrank_end_eq_49
#print axioms Phys.Algebra.finrank_selfAdj_eq_28
#print axioms Phys.Algebra.adEnd
#print axioms Phys.Algebra.adEnd_apply
#print axioms Phys.Algebra.skewAdj_adEnd_inv
#print axioms Phys.Algebra.selfAdj_adEnd_inv
#print axioms Phys.Algebra.one_mem_selfAdj
#print axioms Phys.Algebra.one_adEnd_zero
#print axioms Phys.Algebra.sym_antisym_decomposition_structure

-- N228 — THE FINER SPLIT OF THE SYMMETRIC 28: `Sym²7 = 1 ⊕ 27`, the last irreducible of
--        `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`, on the banked tower. Over the derived `ℚ` and `O ℚ = CD (H ℚ)`,
--        on `End ℚ ImO` with the banked symmetric side `selfAdjointSubmodule bornBil` (= `Sym²7`,
--        N227): the trivial rep line `trivialLine = ℚ ∙ 1` (finrank 1, `finrank_span_singleton`;
--        `trace 1 = 7 = finrank ImO`) and the traceless-symmetric `tracelessSym = selfAdj ⊓
--        ker(trace)` (finrank 27) are DISJOINT (`trivialTracefree_disjoint`: a `c•1` of trace 0
--        forces `7c = 0 ⇒ c = 0`, char 0) and SPAN the symmetric side (`trivialTracefree_span`:
--        `φ = (t/7)•1 + traceless part`), so `Sym²7 = 1 ⊕ 27` (`finrank_tracelessSym_eq_27` via
--        `finrank_sup_add_finrank_inf_eq` + banked `finrank_selfAdj_eq_28`). Both g₂-submodules
--        under `adEnd D` (`trivialLine_adEnd_inv` via banked `one_adEnd_zero`; `tracelessSym_adEnd_inv`
--        via banked `selfAdj_adEnd_inv` + Mathlib `trace_lie`). Non-vacuity: `one_mem_trivialLine`,
--        `finrank_tracelessSym_eq_27` (27 > 0). Capstone `traceless_sym_27_structure`.
#print axioms Phys.Algebra.trivialLine
#print axioms Phys.Algebra.tracelessSym
#print axioms Phys.Algebra.trace_one_eq_seven
#print axioms Phys.Algebra.one_ne_zero_End
#print axioms Phys.Algebra.one_mem_trivialLine
#print axioms Phys.Algebra.finrank_trivialLine
#print axioms Phys.Algebra.trivialLine_le_selfAdj
#print axioms Phys.Algebra.tracelessSym_le_selfAdj
#print axioms Phys.Algebra.trivialTracefree_disjoint
#print axioms Phys.Algebra.trivialTracefree_span
#print axioms Phys.Algebra.trivialTracefree_isCompl_in_selfAdj
#print axioms Phys.Algebra.finrank_tracelessSym_eq_27
#print axioms Phys.Algebra.trivialLine_adEnd_inv
#print axioms Phys.Algebra.tracelessSym_adEnd_inv
#print axioms Phys.Algebra.traceless_sym_27_structure

-- N229 — THE g₂-EQUIVARIANT PROJECTOR `End ℚ ImO → so(7)` ALONG `Sym²7`. Over the derived `ℚ` and
--        `O ℚ = CD (H ℚ)`, on the full endomorphism space `End ℚ ImO` (= `7 ⊗ 7 = 49`) with the
--        banked N227 direct-sum `End = Sym²7 (28) ⊕ Λ²7 (21 = so(7))` reoriented so(7)-first
--        (`skewSelf_isCompl = selfSkew_isCompl.symm`): the linear projection `projSo7 :=
--        skewSelf_isCompl.projection` retracts the whole `End ℚ ImO` onto the banked so(7)
--        (`skewAdjointSubmodule bornBil`) along `Sym²7` (`selfAdjointSubmodule bornBil`). Idempotent
--        (`projSo7_idem`), `range = so(7)` (`projSo7_range`), `ker = Sym²7` (`projSo7_ker`), image
--        the FULL 21-dim so(7) (`finrank_projSo7_range = 21` via banked `finrank_so7_eq_21`, N225);
--        fixes so(7) / kills Sym²7 (`projSo7_apply_skew`/`_self`), image in so(7)
--        (`projSo7_apply_mem`), pointwise idempotent (`projSo7_projSo7`). ★★★ `projSo7_equivariant`:
--        `projSo7 (adEnd D X) = adEnd D (projSo7 X)` — the projector COMMUTES with the adjoint
--        g₂-action (banked `skewAdj_adEnd_inv` + `selfAdj_adEnd_inv`, N227), a genuine morphism of
--        g₂-modules; so so(7) is a g₂-equivariant direct summand of `7 ⊗ 7`. Capstone
--        `end_projection_so7_structure`.
#print axioms Phys.Algebra.skewSelf_isCompl
#print axioms Phys.Algebra.projSo7
#print axioms Phys.Algebra.projSo7_idem
#print axioms Phys.Algebra.projSo7_range
#print axioms Phys.Algebra.projSo7_ker
#print axioms Phys.Algebra.finrank_projSo7_range
#print axioms Phys.Algebra.projSo7_apply_skew
#print axioms Phys.Algebra.projSo7_apply_self
#print axioms Phys.Algebra.projSo7_apply_mem
#print axioms Phys.Algebra.projSo7_projSo7
#print axioms Phys.Algebra.projSo7_equivariant
#print axioms Phys.Algebra.end_projection_so7_structure

-- N230 — THE g₂-EQUIVARIANT DUAL PROJECTOR `End ℚ ImO → Sym²7` ALONG `so(7)`, AND THE RESOLUTION OF
--        IDENTITY. Over the derived `ℚ` and `O ℚ = CD (H ℚ)`, on `End ℚ ImO` (= `7 ⊗ 7 = 49`) with the
--        banked N227 direct-sum `End = Sym²7 (28) ⊕ Λ²7 (21 = so(7))`: the complementary partner of
--        N229's `projSo7`. `projSym := selfSkew_isCompl.projection` retracts `End ℚ ImO` onto `Sym²7`
--        (`selfAdjointSubmodule bornBil`) along so(7) (`skewAdjointSubmodule bornBil`). Idempotent
--        (`projSym_idem`), `range = Sym²7` (`projSym_range`), `ker = so(7)` (`projSym_ker`), image the
--        FULL 28-dim Sym²7 (`finrank_projSym_range = 28` via banked `finrank_selfAdj_eq_28`, N227);
--        fixes Sym²7 / kills so(7) (`projSym_apply_self`/`_skew`), image in Sym²7 (`projSym_apply_mem`),
--        pointwise idempotent (`projSym_projSym`). ★★ RESOLUTION OF IDENTITY `projSym X + projSo7 X = X`
--        (`projSym_add_projSo7`), `projSym = 1 − projSo7` (`projSym_eq_sub`); ORTHOGONALITY
--        `projSo7 ∘ projSym = 0` (`projSo7_projSym`), `projSym ∘ projSo7 = 0` (`projSym_projSo7`).
--        ★★★ `projSym_equivariant`: `projSym (adEnd D X) = adEnd D (projSym X)` — the dual projector
--        COMMUTES with the adjoint g₂-action (banked `selfAdj_adEnd_inv` + `skewAdj_adEnd_inv`, N227), a
--        genuine morphism of g₂-modules; so `(projSo7, projSym)` is the internal g₂-equivariant direct
--        sum `7 ⊗ 7 = Λ²7 (so(7)) ⊕ Sym²7`. Capstone `end_dual_projection_sym27_structure`.
#print axioms Phys.Algebra.projSym
#print axioms Phys.Algebra.projSym_idem
#print axioms Phys.Algebra.projSym_range
#print axioms Phys.Algebra.projSym_ker
#print axioms Phys.Algebra.finrank_projSym_range
#print axioms Phys.Algebra.projSym_apply_self
#print axioms Phys.Algebra.projSym_apply_skew
#print axioms Phys.Algebra.projSym_apply_mem
#print axioms Phys.Algebra.projSym_projSym
#print axioms Phys.Algebra.projSym_add_projSo7
#print axioms Phys.Algebra.projSym_eq_sub
#print axioms Phys.Algebra.projSo7_projSym
#print axioms Phys.Algebra.projSym_projSo7
#print axioms Phys.Algebra.projSym_equivariant
#print axioms Phys.Algebra.end_dual_projection_sym27_structure

-- N231 — THE AMBIENT g₂-EQUIVARIANT FUNDAMENTAL-7 AND ADJOINT-14 PROJECTORS + THE THREE-WAY
--        RESOLUTION OF IDENTITY. Over the derived ℚ and `O ℚ = CD (H ℚ)`, on `End ℚ ImO` (the
--        `7 ⊗ 7 = 49` arena): lift N226's subtype projector `projFun` to genuine AMBIENT projectors.
--        `projSo7cod := codRestrict skewAdjointSubmodule projSo7 projSo7_apply_mem` corestricts N229's
--        `projSo7` to so(7); `proj7 := subtype ∘ projFun ∘ projSo7cod` is the ambient fundamental-7
--        projector (idempotent `proj7_idem`, `range = range crossEmb` (`proj7_range`), finrank 7
--        (`finrank_proj7_range`), fixes 7/kills 14 & Sym²7); `proj14 := projSo7 − proj7` the adjoint-14
--        projector (idempotent `proj14_idem`, `range = range imRepL` (`proj14_range`), finrank 14
--        (`finrank_proj14_range`)). `proj7 + proj14 = projSo7` (`proj7_add_proj14`); ORTHOGONALITY
--        `proj7 ∘ proj14 = proj14 ∘ proj7 = 0` and the four cross-vanishings with N230's `projSym`;
--        ★★ THREE-WAY RESOLUTION `projSym X + proj7 X + proj14 X = X` (`projSym_add_proj7_add_proj14`);
--        ★★★ g₂-EQUIVARIANCE `proj7_equivariant`/`proj14_equivariant` — both commute with `adEnd D`.
--        Internal g₂-equivariant direct sum `7 ⊗ 7 = Sym²7 (28) ⊕ 7 ⊕ 14`.
#print axioms Phys.Algebra.projSo7cod_coe
#print axioms Phys.Algebra.proj7_apply
#print axioms Phys.Algebra.proj7_apply_mem
#print axioms Phys.Algebra.proj7_apply_fun
#print axioms Phys.Algebra.proj7_apply_adj
#print axioms Phys.Algebra.proj7_apply_self
#print axioms Phys.Algebra.proj7_idem
#print axioms Phys.Algebra.proj7_proj7
#print axioms Phys.Algebra.proj7_range
#print axioms Phys.Algebra.finrank_proj7_range
#print axioms Phys.Algebra.proj14_apply
#print axioms Phys.Algebra.proj14_coe
#print axioms Phys.Algebra.proj14_apply_mem
#print axioms Phys.Algebra.proj14_apply_adj
#print axioms Phys.Algebra.proj14_apply_fun
#print axioms Phys.Algebra.proj14_apply_self
#print axioms Phys.Algebra.proj14_idem
#print axioms Phys.Algebra.proj14_proj14
#print axioms Phys.Algebra.proj14_range
#print axioms Phys.Algebra.finrank_proj14_range
#print axioms Phys.Algebra.proj7_add_proj14
#print axioms Phys.Algebra.proj7_proj14
#print axioms Phys.Algebra.proj14_proj7
#print axioms Phys.Algebra.projSym_proj7
#print axioms Phys.Algebra.proj7_projSym
#print axioms Phys.Algebra.projSym_proj14
#print axioms Phys.Algebra.proj14_projSym
#print axioms Phys.Algebra.projSym_add_proj7_add_proj14
#print axioms Phys.Algebra.projSo7cod_equivariant
#print axioms Phys.Algebra.proj7_equivariant
#print axioms Phys.Algebra.proj14_equivariant
#print axioms Phys.Algebra.ambient_fund_adjoint_projection_structure

-- N232 — THE AMBIENT g₂-EQUIVARIANT TRIVIAL-LINE (1) AND TRACELESS-SYMMETRIC (27) PROJECTORS +
--        THE FULL FOUR-WAY RESOLUTION OF IDENTITY `7 ⊗ 7 = 1 ⊕ 27 ⊕ 7 ⊕ 14 = id`. Over the derived
--        ℚ and `O ℚ = CD (H ℚ)`, on `End ℚ ImO`: lift N228's symmetric-side submodules
--        `trivialLine`/`tracelessSym` to genuine AMBIENT projectors (the symmetric partner of N231).
--        `projTrivial := smulRight ((7⁻¹)•(trace ∘ projSym)) 1` FACTORED THROUGH the banked N230
--        `projSym` (dissolves the classical skew⟹traceless fact — killing so(7) is `projSym_apply_skew`):
--        idempotent `projTrivial_idem`, `range = trivialLine` (`projTrivial_range`), finrank 1
--        (`finrank_projTrivial_range`), fixes 1/trivialLine, kills tracelessSym & so(7). `proj27 :=
--        projSym − projTrivial` the traceless-symmetric projector: idempotent `proj27_idem`,
--        `range = tracelessSym` (`proj27_range`), finrank 27 (`finrank_proj27_range`).
--        `projTrivial + proj27 = projSym` (`projTrivial_add_proj27`); ORTHOGONALITY — all cross
--        compositions among {projTrivial, proj27, proj7, proj14} vanish; ★★ FOUR-WAY RESOLUTION
--        `projTrivial X + proj27 X + proj7 X + proj14 X = X`
--        (`projTrivial_add_proj27_add_proj7_add_proj14`); ★★★ g₂-EQUIVARIANCE
--        `projTrivial_equivariant`/`proj27_equivariant` — both commute with `adEnd D`.
#print axioms Phys.Algebra.projTrivial_apply
#print axioms Phys.Algebra.projTrivial_apply_mem
#print axioms Phys.Algebra.projTrivial_one
#print axioms Phys.Algebra.projTrivial_apply_triv
#print axioms Phys.Algebra.projTrivial_apply_tracefree
#print axioms Phys.Algebra.projTrivial_apply_skew
#print axioms Phys.Algebra.projTrivial_idem
#print axioms Phys.Algebra.projTrivial_projTrivial
#print axioms Phys.Algebra.projTrivial_range
#print axioms Phys.Algebra.finrank_projTrivial_range
#print axioms Phys.Algebra.proj27_apply
#print axioms Phys.Algebra.proj27_apply_mem
#print axioms Phys.Algebra.proj27_apply_tracefree
#print axioms Phys.Algebra.proj27_apply_triv
#print axioms Phys.Algebra.proj27_apply_skew
#print axioms Phys.Algebra.proj27_idem
#print axioms Phys.Algebra.proj27_proj27
#print axioms Phys.Algebra.proj27_range
#print axioms Phys.Algebra.finrank_proj27_range
#print axioms Phys.Algebra.projTrivial_add_proj27
#print axioms Phys.Algebra.projTrivial_proj27
#print axioms Phys.Algebra.proj27_projTrivial
#print axioms Phys.Algebra.proj7_projTrivial
#print axioms Phys.Algebra.projTrivial_proj7
#print axioms Phys.Algebra.proj14_projTrivial
#print axioms Phys.Algebra.projTrivial_proj14
#print axioms Phys.Algebra.proj7_proj27
#print axioms Phys.Algebra.proj27_proj7
#print axioms Phys.Algebra.proj14_proj27
#print axioms Phys.Algebra.proj27_proj14
#print axioms Phys.Algebra.projTrivial_add_proj27_add_proj7_add_proj14
#print axioms Phys.Algebra.projTrivial_equivariant
#print axioms Phys.Algebra.proj27_equivariant
#print axioms Phys.Algebra.ambient_four_way_projection_structure

-- N233 — THE CANONICAL INTERNAL g₂-EQUIVARIANT DIRECT SUM `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`:
--        the four g₂-submodules `![trivialLine, range crossEmb, range imRepL, tracelessSym]` of
--        `End ℚ ImO` form a Mathlib internal direct sum (`DirectSum.IsInternal`), dims
--        `1+7+14+27=49=finrank(End ℚ ImO)`, each preserved by the adjoint g₂-action `adEnd D`.
#print axioms Phys.Algebra.fourSummands_zero
#print axioms Phys.Algebra.fourSummands_one
#print axioms Phys.Algebra.fourSummands_two
#print axioms Phys.Algebra.fourSummands_three
#print axioms Phys.Algebra.proj_fix
#print axioms Phys.Algebra.proj_kill
#print axioms Phys.Algebra.term0_mem
#print axioms Phys.Algebra.term1_mem
#print axioms Phys.Algebra.term2_mem
#print axioms Phys.Algebra.term3_mem
#print axioms Phys.Algebra.fourSummands_iSup_eq_top
#print axioms Phys.Algebra.fourSummands_iSupIndep
#print axioms Phys.Algebra.fourSummands_isInternal
#print axioms Phys.Algebra.fourSummands_finrank_values
#print axioms Phys.Algebra.fourSummands_finrank_sum
#print axioms Phys.Algebra.fourSummands_adEnd_inv
#print axioms Phys.Algebra.canonical_internal_direct_sum_structure

-- N235 — THE g₂-INVARIANT FORMS δ, φ, ψ ARE g₂-INVARIANT (the generator toolkit for the FFT ascent):
--        the metric δ = `gForm`, the associative 3-form φ = `assoc3`, and the coassociative 4-form
--        ψ = `coassoc4` are all invariant under every derivation `D ∈ derivationLieQ = g₂` (the
--        derivation/Leibniz invariance identities), φ genuinely nonzero — the generators whose
--        degree-4 contractions the g₂ FFT count `dim (ImO^{⊗4})^{g₂} = 4` contracts to force the 27
--        (`tracelessSym`) irreducible (childed dissolution node).
#print axioms Phys.Algebra.bornForm_g2_invariant
#print axioms Phys.Algebra.assoc_deriv_leibniz
#print axioms Phys.Algebra.assoc_deriv_leibniz_lieQ
#print axioms Phys.Algebra.assoc3_g2_invariant
#print axioms Phys.Algebra.coassoc4_g2_invariant
#print axioms Phys.Algebra.invariantForms_nonvacuity
#print axioms Phys.Algebra.invariant_forms_g2_invariant_toolkit

-- N236 — THE g₂-EQUIVARIANT ENDOMORPHISM SPACE + THE FFT LOWER BOUND: the commutant of the adjoint
--        g₂-action `adEnd` on `End ℚ ImO` (= `End_{g₂}(7 ⊗ 7)`) as a ℚ-submodule `commutantG2`; the
--        four banked g₂-equivariant projectors all lie in it and are linearly independent (orthogonal
--        nonzero idempotents), so `4 ≤ finrank ℚ commutantG2` — the `Σ mᵢ² ≥ 4` half of the g₂ First
--        Fundamental Theorem count `dim End_{g₂}(7 ⊗ 7) = 4` scoped by N234 (the ≤ 4 upper bound is
--        childed as the FFT hard core).
#print axioms Phys.Algebra.commutantG2
#print axioms Phys.Algebra.projTrivial_mem_commutantG2
#print axioms Phys.Algebra.proj7_mem_commutantG2
#print axioms Phys.Algebra.proj14_mem_commutantG2
#print axioms Phys.Algebra.proj27_mem_commutantG2
#print axioms Phys.Algebra.fourProj_mem_commutantG2
#print axioms Phys.Algebra.fourProj_mul_self
#print axioms Phys.Algebra.fourProj_mul_ne
#print axioms Phys.Algebra.fourProj_ne_zero
#print axioms Phys.Algebra.liftComm_injective
#print axioms Phys.Algebra.four_le_finrank_commutantG2
#print axioms Phys.Algebra.fft_lower_bound_toolkit

-- N237 — THE PEIRCE REDUCTION of the g₂-equivariant endomorphism algebra `commutantG2` and the
--        SHARPENING of the FFT UPPER bound `finrank ℚ commutantG2 ≤ 4` to the single crisp,
--        non-circular containment `commutantG2 ≤ commutantSpan`. Over the derived ℚ and
--        O ℚ = CD (H ℚ), on End ℚ ImO (the 7 ⊗ 7 = 49 arena): `commutantG2 = End_{g₂}(End ℚ ImO)`
--        is a UNITAL ℚ-SUBALGEBRA (`one_mem`/`mul_mem`); the four banked projectors sum to `1`
--        (`fourProj_sum_eq_one`), so every element PEIRCE-EXPANDS into its sixteen corners
--        `∑ᵢⱼ eᵢ T eⱼ` (`peirce_expand`), each again in the subalgebra (`corner_mem`); the span of
--        the four projectors `commutantSpan ≤ commutantG2` has dimension `≤ 4`; and the ENTIRE FFT
--        count `dim End_{g₂}(7 ⊗ 7) = 4` reduces (a proved IMPLICATION, not an assertion) to the
--        single containment `commutantG2 ≤ commutantSpan` — the g₂ First Fundamental Theorem count,
--        Mathlib-absent, CHILDED as the next dissolution node. The pillar/Schur route to ≤ 4 is
--        PROVABLY CIRCULAR (`End_{g₂}(27) = ℚ` IS the target), so only this direct-count reduction
--        is non-circular.
#print axioms Phys.Algebra.one_mem_commutantG2
#print axioms Phys.Algebra.mul_mem_commutantG2
#print axioms Phys.Algebra.fourProj_sum_eq_one
#print axioms Phys.Algebra.peirce_expand
#print axioms Phys.Algebra.corner_mem_commutantG2
#print axioms Phys.Algebra.commutantSpan_le_commutantG2
#print axioms Phys.Algebra.finrank_commutantSpan_le_four
#print axioms Phys.Algebra.finrank_commutantG2_le_four_of_le_span
#print axioms Phys.Algebra.finrank_commutantG2_eq_four_of_le_span
#print axioms Phys.Algebra.fft_peirce_reduction_toolkit

-- N238 — THE THREE KNOWN-SUMMAND IRREDUCIBILITIES of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` — the non-circular
--        forward TOOLKIT of the g₂ First Fundamental Theorem ascent, and the sharp isolation of the
--        single remaining hard core (the g₂ FFT GENERATION lemma), CHILDED. Over the derived ℚ and
--        O ℚ = CD (H ℚ), on End ℚ ImO (the 7 ⊗ 7 = 49 arena): the four g₂-summands of the banked
--        `fourSummands = ![trivialLine, range crossEmb, range imRepL, tracelessSym]` (N233) have
--        DISTINCT dimensions 1, 7, 14, 27. THREE of them — the KNOWN ones — are IRREDUCIBLE
--        `adEnd`-modules PROVABLE NOW, without the childed containment, each transported from a
--        banked lever across a banked injective g₂-equivariant map: the 1 (`trivialLine`) by pure
--        dimension; the fundamental 7 (`range crossEmb`) by pulling an `adEnd`-invariant subspace
--        back through the injective g₂-equivariant `crossEmb` (`crossEmb_injective` N224 +
--        `crossOp_imRep_intertwine` N223) to an `adEnd`-invariant subspace of `ImO`, killed by the
--        banked `no_proper_invariant_ImO` (N28); the adjoint 14 (`range imRepL`) by pulling back
--        through the injective Lie-hom `imRepL` (`imRep_injective` N22 + `LieHom.map_lie`) to a Lie
--        IDEAL of `derivationLieQ`, killed by the banked ideal-lattice simplicity
--        `derivationLieQ_isSimpleOrder` (N30). The fourth atom (the 27, `tracelessSym`) reduces via
--        Schur to `End_{g₂}(27) = ℚ` — CIRCULAR with the target, as N237 froze — so the SOLE remaining
--        non-circular wall is the direct g₂ FFT GENERATION lemma (every g₂-invariant degree-4 form on
--        the 7 is a ℚ-combination of the three δ-pairings + ψ = coassoc4), Mathlib-absent, CHILDED as
--        the next dissolution node; this node BLOCKS behind it. ONE CAUSE, THE IRREDUCIBLE FACE: the
--        SAME banked `no_proper_invariant_ImO` (the definite-Born / so(7)-bound dissolution, N28) that
--        made the fundamental 7 irreducible, transported through the two banked embeddings, delivers
--        three of the four Clebsch–Gordan atoms irreducible; the same ideal-lattice simplicity that
--        split the derivation algebra supplies the fourth.
#print axioms Phys.Algebra.trivialLine_no_proper_invariant
#print axioms Phys.Algebra.crossEmb_range_no_proper_invariant
#print axioms Phys.Algebra.imRepL_range_no_proper_invariant
#print axioms Phys.Algebra.three_known_summands_no_proper_invariant
#print axioms Phys.Algebra.known_summands_irreducible_toolkit


-- N234 — THE IRREDUCIBLE 27 (the genuine Clebsch–Gordan closure). Over the derived ℚ and
--        O ℚ = CD (H ℚ), on End ℚ ImO (the 7 ⊗ 7 = 49 arena): the banked traceless-symmetric
--        summand `tracelessSym` (N228, dim 27) has NO proper nonzero `adEnd`-invariant subspace —
--        the LAST Clebsch–Gordan atom, closing 7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27 into IRREDUCIBLES
--        (`fourSummands_irreducible`, with the three known atoms from N238). THE INSTRUMENT (the
--        trunk's own, the one that closed the 7 in N28 — NOT the invariant-theory FFT the
--        N235–N239 dissolution arc kept escalating into): the CARTAN PIN + WALK certificate on
--        the banked derivations. The commuting banked pair D0E,D3E gives integer spectral stages
--        pk = s²+5s+4 (s = (ad D)², spectrum {0,−1,−4} on the 27); one more generator D1E pins
--        the joint kernel to the LINE ℚ·X0q (X0 = diag(0,−1,1,1,−1,0,0)): the integer chain
--        satisfies chainM(B) = −256·τ(B)·X0 on every basis quadric (kernel `decide`, CERT 1).
--        27 words of length ≤ 2 in the banked generators walk X0 to a BASIS of the 27 (CERT 4)
--        and the same words separate it (the 27×27 pairing matrix has an explicit integer
--        left-inverse, CERTS 2–3). ASSEMBLY: nonzero w ∈ W invariant ⟹ some word τ0-detects w
--        (separation) ⟹ the chain — a polynomial in the banked action, so W-preserving —
--        collapses the carrier onto X0q ∈ W ⟹ the walk rebuilds all 27 dims inside W. PLUS the
--        constructive SCHUR strengthening: every banked-commutant element preserving the 27 acts
--        on it as the EXPLICIT scalar τ0(T X0q) — over ℚ abstract Schur gives only a division
--        algebra; the pin gives the full scalar theorem. The N239 FFT generation count now
--        follows from atomicity (the arrow REVERSED), instead of atomicity from the count.
#print axioms Phys.Algebra.span_Bq_eq_tracelessSym
#print axioms Phys.Algebra.eq_zero_of_psi_eq_zero
#print axioms Phys.Algebra.chainF_eq_pin
#print axioms Phys.Algebra.X0q_mem_of_invariant
#print axioms Phys.Algebra.walk_Bq
#print axioms Phys.Algebra.tracelessSym_le_of_X0q_mem
#print axioms Phys.Algebra.tracelessSym_no_proper_invariant
#print axioms Phys.Algebra.fourSummands_irreducible
#print axioms Phys.Algebra.commutant_scalar_on_tracelessSym
#print axioms Phys.Algebra.tau0_X0q_ne_zero
#print axioms Phys.Algebra.chainF_X0q_ne_zero
#print axioms Phys.Algebra.irreducible27_structure


-- N240 — THE FORCED u(1) CHARGE DIRECTION from the atomized gather obstruction, read on the
--        banked branching 7 = 3 ⊕ 3̄ ⊕ 1 (N42c). Over the derived ℚ and O ℚ = CD (H ℚ), the
--        gather-obstruction cross-product operator crossOp (N223, the fundamental-7-in-so(7)
--        tear) evaluated on the branching's distinguished singlet generator u1 (the cascade's
--        √−1 = the colour complex-structure axis) is the FORCED charge operator
--        chargeOp = crossOp u1 — no posited u(1), no normalization choice. It is a nonzero element
--        of the gather arena so(7) (chargeOp_mem_so7); it ANNIHILATES the branching singlet
--        (chargeOp_kills_singlet, octCross u1 u1 = 0 — the charge-zero direction, DERIVED); its
--        square is chargeOp²(y) = ⟨u1,y⟩•u1 − y (chargeOp_sq_coe, a complex structure on the
--        branching complement V = 3 ⊕ 3̄, 0 on the 1 — eigen-grading = the branching). THE
--        COVARIANCE HEADLINE (chargeOp_stabilizer_iff): the g₂-stabilizer of chargeOp is EXACTLY
--        colour su(3) = colourCentralizer (N201), via the banked g₂-intertwiner
--        ⁅imRep D, crossOp u1⁆ = crossOp (D u1) (N223) + faithfulness (N224) + the colour
--        criterion D u1 = 0 (N201) — dimension 8 (finrank_chargeStabilizer_eq_eight) and PROPER
--        (chargeOp_stabilizer_proper: ⁅imRep DJ, chargeOp⁆ ≠ 0, N202 DJ_not_mem_colour). A
--        COVARIANT gather object singles out a direction; an INVARIANT one (a trace form) cannot.
--        ONE cause (u1 = the fold's √−1 = the gather-tear input = the colour axis = the branching
--        singlet), many faces (the charge grading AND the colour stabilizer), derived not asserted.
#print axioms Phys.Algebra.chargeOp
#print axioms Phys.Algebra.chargeOp_mem_so7
#print axioms Phys.Algebra.chargeOp_ne_zero
#print axioms Phys.Algebra.chargeOp_kills_singlet
#print axioms Phys.Algebra.chargeOp_sq_coe
#print axioms Phys.Algebra.crossOp_zero
#print axioms Phys.Algebra.chargeOp_stabilizer_iff
#print axioms Phys.Algebra.chargeStabilizer
#print axioms Phys.Algebra.chargeStabilizer_eq_colour
#print axioms Phys.Algebra.finrank_chargeStabilizer_eq_eight
#print axioms Phys.Algebra.chargeOp_stabilizer_proper
#print axioms Phys.Algebra.forced_charge_direction_structure


-- N241 — THE FORCED CHARGE SPLITTING of the two triplets 3 = Uhol vs 3̄ = Uah (N42c), derived
--        FROM the gather-obstruction charge operator chargeOp = crossOp u1 (N240). Over the
--        derived ℚ and O ℚ = CD (H ℚ). THE JOINT: the gather tear crossOpO u1 and the branching
--        complex structure JO = L_{u1} (N42c) COINCIDE on the branching complement V = Vsub
--        (crossOpO_u1_eq_JO_on_Vsub) — because octCross u1 v = u1·v + ⟨u1,v⟩•1 and ⟨u1,v⟩ = 0 on
--        V (gForm_u1_vanish_Vsub, u1 ⟂ V). So the covariant gather charge operator INHERITS the
--        branching lever's 3 ↔ 3̄ swap, SHARPENED from N42c's inclusions to EQUALITIES:
--        Uhol.map (crossOpO u1) = Uah and Uah.map (crossOpO u1) = Uhol — the two triplets are
--        EXCHANGED. THE SWAP IS GENUINE (W8 teeth): Uhol.map (crossOpO u1) ⊓ Uhol = ⊥
--        (Uhol_crossOpO_disj, via Uhol_disj_Uah N42c) — the charge operator never fixes a triplet.
--        JO_JO: JO (JO v) = −v (pointwise JO_sq, from left-alternativity). The OPPOSITE-charge /
--        particle–antiparticle structure of the 3 vs the 3̄ is DERIVED from the gather-obstruction
--        charge operator (it IS the branching complex structure on V), not posited. ONE cause
--        (u1 = the fold's √−1 = the gather-tear input AND the left-mult complex structure), MANY
--        faces (the N240 charge operator and the N42c conjugation swap are the SAME map on V).
#print axioms Phys.Algebra.gForm_u1_e3O
#print axioms Phys.Algebra.gForm_u1_e4O
#print axioms Phys.Algebra.gForm_u1_e5O
#print axioms Phys.Algebra.gForm_u1_e6O
#print axioms Phys.Algebra.gForm_u1_e7O
#print axioms Phys.Algebra.gForm_u1_vanish_Vsub
#print axioms Phys.Algebra.crossOpO_u1_eq_JO_on_Vsub
#print axioms Phys.Algebra.chargeOp_coe_eq_JO_on_Vsub
#print axioms Phys.Algebra.JO_JO
#print axioms Phys.Algebra.Uhol_map_crossOpO_eq_Uah
#print axioms Phys.Algebra.Uah_map_crossOpO_eq_Uhol
#print axioms Phys.Algebra.Uhol_crossOpO_disj
#print axioms Phys.Algebra.forced_charge_splitting_structure


-- N242 — THE EXPLICIT OPPOSITE CHARGE EIGENVALUES ±i of the two triplets, DERIVED from the
--        gather-obstruction charge operator. Over the derived ℚ and O ℚ = CD (H ℚ). The gather
--        charge operator crossOpO u1 maps the branching complement V = Vsub onto itself
--        (Vsub_map_crossOpO), restricting to chargeOpV : End ℚ V. On V it IS the branching
--        complex structure (N241), so chargeOpV² = −id (chargeOpV_sq). Therefore its minimal
--        polynomial is X² + 1 (chargeOpV_minpoly), irreducible over ℚ (charge_poly_irreducible;
--        no rational root, q²+1 > 0 — the fold self-overlap positivity), so the charge operator
--        has NO rational eigenvalue (chargeOpV_no_rational_eigenvalue): its spectrum is the
--        imaginary opposite pair ±i. The two roots ±i ARE the derived complex unit ±J of Dbl ℚ
--        (Dbl_J_root / Dbl_negJ_root, J²=−1), opposite AND distinct (Dbl_J_ne_negJ). The
--        opposite ±i charge eigenvalues — the particle/antiparticle assignment of the 3 vs the
--        3̄ — are the explicit imaginary spectrum of the gather charge operator, DERIVED not
--        posited. ℚ[X] and Dbl ℚ are metalanguage naming the spectrum of a derived REAL operator;
--        Algebra ℚ (Dbl ℚ) is NOT used, no TensorProduct — no ℚ[i]-as-ground.
#print axioms Phys.Algebra.Vsub_map_crossOpO
#print axioms Phys.Algebra.crossOpO_u1_mapsTo_Vsub
#print axioms Phys.Algebra.chargeOpV
#print axioms Phys.Algebra.chargeOpV_coe
#print axioms Phys.Algebra.chargeOpV_sq
#print axioms Phys.Algebra.chargeOpV_aeval
#print axioms Phys.Algebra.chargeOpV_integral
#print axioms Phys.Algebra.charge_poly_no_root
#print axioms Phys.Algebra.charge_poly_irreducible
#print axioms Phys.Algebra.chargeOpV_minpoly
#print axioms Phys.Algebra.chargeOpV_no_rational_eigenvalue
#print axioms Phys.Algebra.Dbl_J_root
#print axioms Phys.Algebra.Dbl_negJ_root
#print axioms Phys.Algebra.Dbl_J_ne_negJ
#print axioms Phys.Algebra.forced_charge_eigenvalues_structure


-- N243 — THE COMPLETE CHARGE SPECTRUM of the fundamental 7, DERIVED from the gather-obstruction
--        charge operator. Over the derived ℚ and O ℚ = CD (H ℚ). Assembles N240 (charge 0 on the
--        singlet) + N242 (±i on the two triplets) into the minimal polynomial of the gather
--        charge operator on the ENTIRE ImO: chargeOp³ = −chargeOp (chargeOp_cube, from the N240
--        square + gForm_x_octCross collapsing the correction term — no coordinate bash), so
--        minpoly ℚ chargeOp = X³ + X = X·(X²+1) (chargeOp_minpoly, via X∣minpoly from the
--        0-eigenvalue singlet + q∣X²+1 with X²+1 irreducible). Its square is NOT −id on the whole
--        7 (chargeOp_sq_ne_neg_id — it kills the singlet; W8 teeth distinguishing the whole-7
--        spectrum from the X²+1 V-restriction of N242). The three roots {0, +J, −J} of X³+X
--        satisfy x³+x=0 in the derived Dbl ℚ (Dbl_zero/J/negJ_cube_root), mutually distinct
--        (Dbl_zero_ne_J/negJ + N242 Dbl_J_ne_negJ). The ONLY rational eigenvalue is 0
--        (chargeOp_rational_eigenvalue_eq_zero — the singlet's charge; the triplet charges ±i are
--        non-real). The complete charge-eigenvalue decomposition of 7 = 1 ⊕ 3 ⊕ 3̄ (singlet at 0,
--        two triplets at ±i) as the explicit spectrum {0,+i,−i} of the gather charge operator,
--        DERIVED not posited. ℚ[X] and Dbl ℚ are metalanguage naming a derived REAL operator's
--        spectrum; Algebra ℚ (Dbl ℚ) NOT used, no TensorProduct — no ℚ[i]-as-ground.
#print axioms Phys.Algebra.chargeOp_cube
#print axioms Phys.Algebra.chargeOp_aeval
#print axioms Phys.Algebra.chargeOp_integral
#print axioms Phys.Algebra.minpoly_dvd_cube
#print axioms Phys.Algebra.chargeOp_hasEigenvalue_zero
#print axioms Phys.Algebra.X_dvd_minpoly
#print axioms Phys.Algebra.chargeOp_minpoly
#print axioms Phys.Algebra.chargeOp_sq_ne_neg_id
#print axioms Phys.Algebra.Dbl_zero_cube_root
#print axioms Phys.Algebra.Dbl_J_cube_root
#print axioms Phys.Algebra.Dbl_negJ_cube_root
#print axioms Phys.Algebra.Dbl_zero_ne_J
#print axioms Phys.Algebra.Dbl_zero_ne_negJ
#print axioms Phys.Algebra.cube_poly_root_eq_zero
#print axioms Phys.Algebra.chargeOp_rational_eigenvalue_eq_zero
#print axioms Phys.Algebra.forced_charge_spectrum_structure


-- N244 — THE FORCED EIGENSPACE DECOMPOSITION of the fundamental 7, DERIVED from the gather-
--        obstruction charge operator. Over the derived ℚ and O ℚ = CD (H ℚ). Turns the N243
--        spectral polynomial minpoly ℚ chargeOp = X³+X into the explicit eigenspace decomposition:
--        ker chargeOp = span{sgl} (chargeOp_ker — the charge-0 direction EXHAUSTED, EXACTLY the
--        1-dim branching singlet, no other neutral direction; ⊆ via chargeOp_sq_coe collapse, no
--        coordinate bash), eigenspace chargeOp 0 = span{sgl} (chargeOp_eigenspace_zero),
--        finrank = 1 (finrank_ker_chargeOp — W8 non-vacuity), the kernel maps through ImO.subtype
--        onto the banked branching singlet (ker_chargeOp_map_eq_singlet). The complement Vsub =
--        3 ⊕ 3̄ carries NO charge-0 direction (chargeOpV_ker : ker chargeOpV = ⊥) and is the
--        complex structure chargeOpV² = −id (N242). With singlet ⊕ Vsub = ImO (N42c), ImO =
--        span{u1} ⊕ Vsub = 1 ⊕ (3 ⊕ 3̄) is the explicit eigenspace decomposition of the gather
--        charge operator: 0-eigenspace = singlet, complement = the two triplets at ±i. DERIVED not
--        posited. chargeOp/chargeOpV/ImO/Vsub stay derived REAL; ker/eigenspace/finrank/span are
--        Mathlib machinery; Algebra ℚ (Dbl ℚ) NOT used, no TensorProduct — no ℚ[i]-as-ground.
#print axioms Phys.Algebra.sgl_mem_ker
#print axioms Phys.Algebra.span_sgl_le_ker
#print axioms Phys.Algebra.ker_le_span_sgl
#print axioms Phys.Algebra.chargeOp_ker
#print axioms Phys.Algebra.chargeOp_eigenspace_zero
#print axioms Phys.Algebra.finrank_ker_chargeOp
#print axioms Phys.Algebra.ker_chargeOp_map_eq_singlet
#print axioms Phys.Algebra.chargeOpV_ker
#print axioms Phys.Algebra.forced_charge_eigenspace_structure


-- N245 — THE FORCED COMMUTING COLOUR–CHARGE STRUCTURE on the fundamental 7, DERIVED from the
--        gather-obstruction charge operator. Over the derived ℚ and O ℚ = CD (H ℚ). Fuses the
--        N240 covariance headline (g₂-stabilizer of chargeOp = colour su(3)) with the N244
--        eigenspace decomposition: colour su(3) COMMUTES with the u(1) charge operator, and only
--        colour does (chargeOp_commute_iff_colour : Commute (imRep D) chargeOp ↔ D ∈
--        colourCentralizer; chargeOp_commute_proper — DJ does NOT commute, su(3) ⊊ g₂ proper),
--        so it PRESERVES the charge decomposition (colour_mapsTo_ker_chargeOp /
--        colour_mapsTo_range_chargeOp — each eigen-piece colour-invariant) and ANNIHILATES the
--        neutral singlet (colour_kills_sgl — the 1 is doubly neutral). The charged complement is
--        EXACTLY the banked Vsub = 3 ⊕ 3̄ (range_chargeOp_map_eq_Vsub) of dimension 6
--        (finrank_range_chargeOp — rank-nullity on the 1-dim kernel, W8). The commuting SU(3)×U(1)
--        structure with 7 = 1 ⊕ (3 ⊕ 3̄) a decomposition into colour-invariant subspaces —
--        DERIVED not posited. chargeOp/imRep/ImO/Vsub/sgl stay derived REAL; Commute/range/MapsTo/
--        finrank are Mathlib machinery; no Algebra ℚ (Dbl ℚ), no TensorProduct — no ℚ[i]-as-ground.
#print axioms Phys.Algebra.chargeOp_commute_iff_colour
#print axioms Phys.Algebra.colour_commute_chargeOp
#print axioms Phys.Algebra.chargeOp_commute_proper
#print axioms Phys.Algebra.colour_kills_sgl
#print axioms Phys.Algebra.colour_mapsTo_ker_chargeOp
#print axioms Phys.Algebra.colour_mapsTo_range_chargeOp
#print axioms Phys.Algebra.crossOpO_u1_ImO_mem_Vsub
#print axioms Phys.Algebra.range_chargeOp_map_eq_Vsub
#print axioms Phys.Algebra.finrank_range_chargeOp
#print axioms Phys.Algebra.range_chargeOp_ne_bot
#print axioms Phys.Algebra.forced_colour_charge_commuting_structure


-- N246 — THE FORCED u(1) ⊕ su(3) COMMUTING PAIR AS COMPLEMENTARY SUMMANDS OF so(7) = 14 ⊕ 7,
--        DERIVED from the gather-obstruction charge operator. Over the derived ℚ and O ℚ = CD (H ℚ).
--        Places the charge story (N240–N245) inside the N225 decomposition: the charge operator
--        chargeOp = crossOp u1 lives in the FUNDAMENTAL-7 summand (chargeOp ∈ range crossEmb) and
--        NOT in the adjoint-14/colour summand (chargeOp ∉ range imRepL — the moat crux, forced by
--        the trivial intersection N225 inter_eq_bot = simplicity of Der(O)), so the u(1) charge line
--        chargeLine (dim 1) and colour su(3) colourImg (dim 8, in the adjoint 14) meet only in ⊥
--        and form a genuine u(1) ⊕ su(3) COMMUTING direct sum of dim 9 = 1 + 8 inside so(7)
--        (finrank_chargeLine_sup_colourImg), the two factors commuting (N245 colour_commute_chargeOp).
--        THE SAME inter_eq_bot that separates the 14 from the 7 separates charge from colour — one
--        cause, many terminations. chargeOp/crossEmb/imRepL/colourCentralizer/chargeLine/colourImg
--        stay derived REAL; range/map/span/finrank/Commute are Mathlib machinery; no Algebra ℚ
--        (Dbl ℚ), no TensorProduct — no ℚ[i]-as-ground.
#print axioms Phys.Algebra.chargeOp_mem_range_crossEmb
#print axioms Phys.Algebra.chargeOp_not_mem_range_imRep
#print axioms Phys.Algebra.chargeLine_le_range_crossEmb
#print axioms Phys.Algebra.finrank_chargeLine
#print axioms Phys.Algebra.chargeLine_inf_range_imRep_eq_bot
#print axioms Phys.Algebra.colourImg_le_range_imRep
#print axioms Phys.Algebra.finrank_colourImg
#print axioms Phys.Algebra.chargeLine_inf_colourImg_eq_bot
#print axioms Phys.Algebra.finrank_chargeLine_sup_colourImg
#print axioms Phys.Algebra.forced_charge_colour_complementary_structure


-- N247 — THE REDUCTIVE GAUGE LIE ALGEBRA u(1) ⊕ su(3) AS ONE LIE SUBALGEBRA OF so(7), DERIVED from
--        the gather-obstruction charge operator. Over the derived ℚ and O ℚ = CD (H ℚ). PROMOTES the
--        N246 submodule direct sum to the LIE-ALGEBRA object it forces: the join chargeLine ⊔ colourImg
--        is a genuine LieSubalgebra chargeColourLie of Module.End ℚ ImO (bracket-closed via
--        joint_lie_mem), sitting inside so(7) = skewAdjointLieSubalgebra bornBil
--        (chargeColourLie_le_so7), of dim 9 = 1 + 8 (chargeColourLie_finrank). The u(1) charge line is
--        CENTRAL in the join (chargeLine_central: ⁅x,y⁆ = 0 for x ∈ chargeLine, y ∈ chargeColourLie),
--        and the DERIVED subalgebra lands in colour (joint_derived_le_colourImg) — the abelian u(1)
--        lost under bracketing, the reductive splitting [g,g] = su(3). The four-term bracket collapse
--        uses N245 colour_commute_chargeOp (recast to the End Lie bracket) + LieHom.map_lie imRep +
--        colourCentralizer.lie_mem, NO coordinate bash. W8 teeth chargeOp_not_central_in_so7
--        (⁅imRep DJ, chargeOp⁆ ≠ 0, N240 chargeOp_stabilizer_proper — centrality PROPER). chargeOp/
--        chargeLine/colourImg/imRep/imRepL/colourCentralizer/bornBil stay derived REAL; LieSubalgebra/
--        ⁅·,·⁆/LieHom.map_lie/mem_sup are Mathlib machinery; no Algebra ℚ (Dbl ℚ), no TensorProduct —
--        no ℚ[i]-as-ground.
#print axioms Phys.Algebra.chargeOp_lie_colourImg
#print axioms Phys.Algebra.colourImg_lie_chargeOp
#print axioms Phys.Algebra.colourImg_lie_closed
#print axioms Phys.Algebra.chargeLine_lie_colourImg
#print axioms Phys.Algebra.colourImg_lie_chargeLine
#print axioms Phys.Algebra.chargeLine_lie_chargeLine
#print axioms Phys.Algebra.joint_derived_le_colourImg
#print axioms Phys.Algebra.joint_lie_mem
#print axioms Phys.Algebra.chargeColourLie
#print axioms Phys.Algebra.chargeColourLie_toSubmodule
#print axioms Phys.Algebra.mem_chargeColourLie
#print axioms Phys.Algebra.chargeLine_le_so7
#print axioms Phys.Algebra.colourImg_le_so7
#print axioms Phys.Algebra.chargeColourLie_le_so7
#print axioms Phys.Algebra.chargeLine_central
#print axioms Phys.Algebra.chargeOp_not_central_in_so7
#print axioms Phys.Algebra.chargeColourLie_finrank
#print axioms Phys.Algebra.reductive_gauge_lie_structure


-- N248 — THE INDUCED COLOUR su(3)-REPRESENTATION ON THE CHARGED COMPLEMENT Vsub = 3 ⊕ 3̄, DERIVED
--        from the gather-obstruction charge operator. Over the derived ℚ and O ℚ = CD (H ℚ). The
--        reductive gauge Lie algebra u(1) ⊕ su(3) (N247) forces its representation content: the
--        charged matter (Vsub, the 6 = 3 ⊕ 3̄, N42c) carries a genuine colour su(3)-rep. THE OBJECTS:
--        colour_mapsTo_Vsub (colour preserves the charged complement Vsub); colourVFun/colourVFun_coe
--        (the induced restricted operator); ⭐⭐⭐ colourRepV : colourCentralizer →ₗ⁅ℚ⁆ End ℚ Vsub (THE
--        INDUCED su(3)-REP as a genuine LIE-ALGEBRA HOM) + colourRepV_coe; ⭐⭐⭐ colourRepV_commute /
--        colourRepV_commute_chargeOpV (THE ℂ-LINEARITY: every value COMMUTES with the charge complex
--        structure chargeOpV — the ℚ-native meaning of 3 ⊕ 3̄; colour su(3) = centralizer of J forces
--        the induced action complex-linear, one cause u1); ⭐⭐ chargeOpV_sq_id (chargeOpV² = −id, N242
--        re-exported — the complex structure genuine, ℂ-linearity is content); ker_inf_range_chargeOp /
--        ker_sup_range_chargeOp (the eigenspace decomposition ImO = ker ⊕ range = 1 ⊕ (3⊕3̄) as a
--        submodule direct sum, 1 + 6 = 7); ⭐⭐ W8 colourRepV_ne_zero (the rep NONTRIVIAL — DI moves a
--        charged vector; if it vanished, imRep DI = 0 on ker ⊔ range = ⊤, so DI = 0 by imRep_injective,
--        contra DI_ne_zero — THE ONE LAW, no coordinate bash); capstone induced_colour_rep_structure.
--        The 3 ⊕ 3̄ colour-rep content is DERIVED (induced colour action is automatically ℂ-linear
--        because colour = centralizer of the charge complex structure), NOT posited. The literal
--        "colour preserves Uhol/Uah individually" is FALSE over ℚ (Res_ℝ of the non-self-conjugate 3
--        is irreducible; colour commutes with J which swaps Uhol↔Uah) — the TRUE forced content is the
--        ℂ-linearity, authored here (THE ONE LAW / W5 reframe). chargeOp/chargeOpV/imRep/
--        colourCentralizer/Vsub stay derived REAL; LieHom/restrict/ker/range/finrank/Commute are
--        Mathlib machinery; no Algebra ℚ (Dbl ℚ), no TensorProduct — no ℚ[i]-as-ground.

#print axioms Phys.Algebra.colour_mapsTo_Vsub
#print axioms Phys.Algebra.colourVFun
#print axioms Phys.Algebra.colourVFun_coe
#print axioms Phys.Algebra.colourRepV
#print axioms Phys.Algebra.colourRepV_coe
#print axioms Phys.Algebra.colourRepV_commute_chargeOpV
#print axioms Phys.Algebra.colourRepV_commute
#print axioms Phys.Algebra.chargeOpV_sq_id
#print axioms Phys.Algebra.ker_inf_range_chargeOp
#print axioms Phys.Algebra.ker_sup_range_chargeOp
#print axioms Phys.Algebra.colourRepV_ne_zero
#print axioms Phys.Algebra.induced_colour_rep_structure


-- N249 — THE FAITHFULNESS OF THE INDUCED COLOUR su(3)-REPRESENTATION ON THE CHARGED COMPLEMENT
--        Vsub = 3 ⊕ 3̄, DERIVED from the gather-obstruction charge operator. Over the derived ℚ and
--        O ℚ = CD (H ℚ). N248 banked the induced colour rep colourRepV : colourCentralizer →ₗ⁅ℚ⁆
--        End ℚ Vsub and its nontriviality (one witness DI acts nonzero). THIS node strengthens that
--        to the DEFINING faithful-representation fact: ⭐⭐⭐ colourRepV_faithful (Function.Injective
--        colourRepV — NO nonzero colour element acts as the zero endomorphism on the charged matter;
--        su(3) embeds FAITHFULLY into End ℚ Vsub); ⭐⭐ colourRepV_ker_eq_bot (the kernel form,
--        ker colourRepV.toLinearMap = ⊥); capstone faithful_colour_rep_structure (injective + ker=⊥
--        + nontrivial colourRepV_ne_zero + domain dim 8 finrank_colourCentralizer_eq_eight — the FULL
--        dim-8 colour su(3) embeds faithfully AND nontrivially). THE ONE LAW / no coordinate bash:
--        the N248 colourRepV_ne_zero argument generalized DI → arbitrary D via injective_iff_map_eq_zero
--        — imRep D vanishes on range chargeOp AND kills sgl, so = 0 on ker ⊔ range = ⊤, so imRep D = 0,
--        so D = 0 by imRep_injective (faithfulness of the 7-rep). THE MOAT / ONE CAUSE MANY TERMINATIONS:
--        the faithful 3 ⊕ 3̄ is DERIVED — it descends from the SAME imRep_injective (faithfulness of the
--        parent fundamental 7-rep) read through the charge eigenspace decomposition ImO = 1 ⊕ (3⊕3̄) the
--        gather obstruction forces, NOT a posited faithful assignment. chargeOp/chargeOpV/imRep/
--        colourCentralizer/Vsub/colourRepV stay derived REAL; LieHom/LinearMap.ker/Function.Injective/
--        finrank are Mathlib machinery; no Algebra ℚ (Dbl ℚ), no TensorProduct — no ℚ[i]-as-ground.

#print axioms Phys.Algebra.colourRepV_faithful
#print axioms Phys.Algebra.colourRepV_ker_eq_bot
#print axioms Phys.Algebra.faithful_colour_rep_structure

-- N250 — THE IMAGE of the faithful colour su(3)-representation as a CONCRETE dim-8 LIE SUBALGEBRA
--        of Module.End ℚ Vsub, in the COMMUTANT of the charge complex structure chargeOpV, DERIVED
--        from the gather-obstruction charge operator. Over the derived ℚ and O ℚ = CD (H ℚ). N249
--        banked the faithfulness (colourRepV_faithful : Function.Injective colourRepV); N248 the rep
--        + commute. THIS node realizes colour su(3) as a concrete dim-8 Lie subalgebra of the
--        endomorphisms of the charged matter — the FIRST place injectivity does load-bearing work:
--        ⭐⭐⭐ colourRepImg := colourRepV.range (LieHom.range — a LieSubalgebra of End ℚ Vsub);
--        ⭐⭐⭐ finrank_colourRepImg (finrank ℚ colourRepImg.toSubmodule = 8 — image dim = domain dim
--        = 8 REQUIRES faithfulness, via LieHom.equivRangeOfInjective → LinearEquiv.finrank_eq
--        transporting finrank_colourCentralizer_eq_eight N201); ⭐⭐ colourRepImg_le_commutant
--        (∀ M ∈ colourRepImg, Commute M chargeOpV — the image lands in the ℂ-linear commutant, N248
--        colourRepV_commute lifted to the whole range via LieHom.mem_range); ⭐⭐ colourRepImg_ne_bot
--        (W8: the image nonzero, colourRepV_ne_zero N248); capstone image_colour_subalgebra_structure
--        (dim 8 + commutant + chargeOpV²=−id + nonzero). THE ONE LAW / no coordinate bash: pure
--        packaging of banked structural facts, the toSubmodule/coe-sort reconciliations definitional.
--        THE MOAT / ONE CAUSE MANY TERMINATIONS: the concrete dim-8 realization is DERIVED — its being
--        the FULL 8 descends from imRep_injective through the charge eigenspace split (N249), its
--        landing in the ℂ-linear commutant from colour = centralizer of the charge complex structure
--        (one cause, u1). chargeOpV/colourRepV/colourCentralizer/Vsub stay derived REAL; LieSubalgebra/
--        LieHom.range/LieHom.equivRangeOfInjective/LinearEquiv.finrank_eq/Commute/finrank are Mathlib
--        machinery; no Algebra ℚ (Dbl ℚ), no TensorProduct — no ℚ[i]-as-ground.

#print axioms Phys.Algebra.colourRepImg
#print axioms Phys.Algebra.colourRepImg_eq_range
#print axioms Phys.Algebra.mem_colourRepImg
#print axioms Phys.Algebra.finrank_colourRepImg
#print axioms Phys.Algebra.colourRepImg_le_commutant
#print axioms Phys.Algebra.colourRepV_DI_mem_colourRepImg
#print axioms Phys.Algebra.colourRepImg_ne_bot
#print axioms Phys.Algebra.image_colour_subalgebra_structure

-- N251 (manager takeover) — THE ONE-CAUSE CONSOLIDATION `u1` (the fold-root √−1): the single
--        derived element wearing four faces (charge input / complex structure / colour centralizer /
--        ℂ-linearity axis) from which the colour rep's ℂ-linearity + faithfulness + dim-8 image all
--        descend. Extends (never forks) the retained N248–250 chain with the unifying capstone.
--        u1/chargeOp/chargeOpV/colourRepV/colourCentralizer/colourRepImg stay derived REAL;
--        crossOp/Commute/LinearMap.comp/LieHom/finrank Mathlib machinery; no Algebra ℚ (Dbl ℚ),
--        no TensorProduct — no ℚ[i]-as-ground.
#print axioms Phys.Algebra.chargeOp_eq_crossOp_u1
#print axioms Phys.Algebra.u1_charge_complex_structure
#print axioms Phys.Algebra.colour_is_u1_stabilizer
#print axioms Phys.Algebra.colour_rep_u1_complex_linear
#print axioms Phys.Algebra.colour_charge_one_cause_u1

-- N252 — THE UNIQUE COLOUR-FIXED AXIS: the colour-invariant subspace of the fundamental 7 is
--        EXACTLY the 1-dimensional branching singlet span{sgl}=span{u1}, DERIVED from the
--        gather-obstruction structure. Closes N251 FACE 3's stabilizer↔fixed-line DUALITY: colour
--        not only stabilizes the u1 line (FACE 3, chargeStabilizer = colourCentralizer), that line
--        is the ONLY thing colour fixes. THE CRUX / THE ONE LAW: the "no colour-fixed direction
--        outside the singlet" obstruction dissolves via ONE regular colour element Dreg := DL 0 +
--        DL 13 (colour since both annihilate u1), whose fundamental-7 action imRep Dreg = qI MHmat
--        (banked integer-matrix calculus N234) has kernel EXACTLY span{sgl} (6 imaginary rows force
--        c2..c7=0, x∈ImO forces c0=0, so x=c1(x)·u1); the joint kernel over ALL of colour ⊆ this one
--        element's kernel — no decide, no coordinate bash. ⭐⭐⭐ colourInvariants_eq_span_sgl
--        (colourInvariants := ⨅ D:colourCentralizer, ker(imRep D) = span{sgl}); ⭐⭐
--        finrank_colourInvariants (=1, W8 teeth — not 0: singlet fixed by colour_kills_sgl N245; not
--        larger: Vsub=3⊕3̄ carries no fixed vector); ⭐⭐ colourInvariants_map_eq_singlet (pushes
--        through ImO.subtype to the banked O ℚ-level singlet=span{u1} N42c); capstone
--        unique_colour_fixed_axis_structure (the DUALITY: colour and u1 mutually determine each
--        other). THE MOAT / DISSOLUTION: the field treats the U(1) DIRECTION as a chosen embedding of
--        SU(3)×U(1); the theory dissolves the DIRECTION/embedding choice — the colour-fixed subspace
--        is exactly 1-dimensional, so the charge axis is UNIQUE, FORCED not posited. (SCOPE: dissolves
--        the DIRECTION/embedding ambiguity ONLY, not the coupling NORMALIZATION / weak mixing angle.)
--        colourInvariants/Dreg/colourCentralizer/sgl stay derived REAL; iInf/ker/finrank/span/qI
--        Mathlib machinery; no Algebra ℚ (Dbl ℚ), no TensorProduct — no ℚ[i]-as-ground.
#print axioms Phys.Algebra.imRep_Dreg
#print axioms Phys.Algebra.Dreg_mem_colour
#print axioms Phys.Algebra.ker_imRep_Dreg
#print axioms Phys.Algebra.colourInvariants_eq_span_sgl
#print axioms Phys.Algebra.finrank_colourInvariants
#print axioms Phys.Algebra.colourInvariants_map_eq_singlet
#print axioms Phys.Algebra.unique_colour_fixed_axis_structure

-- N253 — THE CONVENTION-FREE CHARGE:ISOSPIN INVARIANT-LENGTH RATIO 3:8 in the ambient so(7). Over
--        the derived ℚ and O ℚ = CD (H ℚ): with the trace form B(A,C) = trace(A∘C) on the
--        fundamental 7 ImO, the gather charge operator chargeOp = crossOp u1 (N240) and the
--        weak-isospin Cartan image imRep DI (N202) have invariant lengths B(chargeOp,chargeOp) = -6
--        and B(imRep DI, imRep DI) = -16, so 8·B(chargeOp,chargeOp) = 3·B(imRep DI, imRep DI) — the
--        convention-free ratio 3:8 (ImO g₂-irreducible N234 ⇒ Schur ⇒ form unique up to scale), and
--        the two operators are trace-orthogonal (B(chargeOp, imRep DI) = 0). W9-LIGHT: both operators
--        expressed in the banked integer-matrix calculus qI (N234), chargeOp = qI Cmat / imRep DI =
--        qI Imat, the trace form reduced through qI_comp + trace_qI to a decide integer computation.
--        SCOPE: banks the convention-free invariant-length RATIO + orthogonality only, NOT the
--        physical weak mixing angle (couplings/running/embedding = separate downstream node).
--        chargeOp/imRep/DI/ImO stay derived REAL; qI/mul7/tr7/LinearMap.trace Mathlib machinery on
--        the DERIVED objects; no Algebra ℚ (Dbl ℚ), no TensorProduct — no ℚ[i]-as-ground.
#print axioms Phys.Algebra.chargeOp_eq_qI
#print axioms Phys.Algebra.imRep_DI_eq_qI
#print axioms Phys.Algebra.traceForm7_qI
#print axioms Phys.Algebra.B_chargeOp_chargeOp
#print axioms Phys.Algebra.B_imRep_DI
#print axioms Phys.Algebra.B_chargeOp_imRep_DI
#print axioms Phys.Algebra.charge_isospin_ratio
#print axioms Phys.Algebra.charge_isospin_ratio_nonvacuous
#print axioms Phys.Algebra.charge_isospin_ratio_structure
-- N254 — THE FORCED SECOND NEUTRAL DIRECTION: the gather charge chargeOp = crossOp u1 (N240) and
--        the doubling weak-isospin Cartan imRep DI (N202), both born from the fold-root u1, COMMUTE,
--        are ℚ-linearly independent (a rank-2 abelian torus of so(7)), grade the fundamental 7 = ImO
--        DIFFERENTLY (the isospin singlet kap1 = κO 1 is isospin-neutral yet charge-nonzero), and
--        meet only in the fold-root axis span{sgl} — so a second independent neutral generator
--        (hypercharge) is FORCED, not posited. Over the derived ℚ and O ℚ = CD (H ℚ). chargeOp/
--        imRep/DI/ImO/kap1/sgl stay derived REAL; qI/mul7/LinearMap.trace/ker/span Mathlib
--        machinery on the DERIVED objects; no Algebra ℚ (Dbl ℚ), no ℚ[i]-as-ground. SCOPE: banks
--        the forced-independence + grading-misalignment structure ONLY, NOT the weak mixing angle.
#print axioms Phys.Algebra.charge_isospin_commute
#print axioms Phys.Algebra.traceForm7_symm
#print axioms Phys.Algebra.traceForm7_left
#print axioms Phys.Algebra.charge_isospin_independent
#print axioms Phys.Algebra.imRep_DI_kappaO
#print axioms Phys.Algebra.chargeOp_kappaO_coord
#print axioms Phys.Algebra.chargeOp_kappaO_ne_zero
#print axioms Phys.Algebra.grading_misaligned
#print axioms Phys.Algebra.imRep_DI_sgl
#print axioms Phys.Algebra.joint_neutral_kernel
#print axioms Phys.Algebra.forced_second_neutral_nonvacuous
#print axioms Phys.Algebra.forced_second_neutral_structure
-- N255 — THE FORCED HYPERCHARGE DIRECTION: the isospin-commuting neutral generator hyperOp =
--        crossOp (kappaO 1) is the gather cross-product of the isospin-NEUTRAL branching singlet
--        (N189), the TWIN of chargeOp = crossOp u1 (N240). It COMMUTES with the WHOLE weak isospin
--        su(2)_L = {DI,DJ,DK} (⁅imRep D, hyperOp⁆ = 0 via crossOp_imRep_intertwine N225 +
--        innerDeriv_kappaO_one N189 + crossOp_zero), WHEREAS chargeOp does NOT (⁅imRep DJ, chargeOp⁆
--        ≠ 0, banked chargeOp_stabilizer_proper N240) — so the two U(1)s are GENUINELY DIFFERENT
--        operators with different commutants; hyperOp is nonzero (crossEmb_injective N225 +
--        kappaO_one_ne_zero N189, coordinate-free from Born positivity). Over the derived ℚ and
--        O ℚ = CD (H ℚ). hyperOp/crossOp/kappaO/imRep/DI/DJ/DK/ImO/chargeOp stay derived REAL;
--        crossEmb/Commute/bracket Mathlib machinery on the DERIVED objects; no Mathlib number/algebra
--        as content. SCOPE: banks the forced isospin-commuting DIRECTION + the twin asymmetry ONLY,
--        NOT the weak mixing angle / normalization / Gell-Mann–Nishijima. The uniqueness (1-dim
--        so(7)-centralizer of su(2)_L = span{hyperOp}) is childed (W1, heavier g₂-side vanishing).
#print axioms Phys.Algebra.hyperOp
#print axioms Phys.Algebra.D_kappaO_one_zero
#print axioms Phys.Algebra.hyperOp_bracket_gen
#print axioms Phys.Algebra.hyperOp_bracket_DI
#print axioms Phys.Algebra.hyperOp_bracket_DJ
#print axioms Phys.Algebra.hyperOp_bracket_DK
#print axioms Phys.Algebra.hyperOp_commute_DI
#print axioms Phys.Algebra.hyperOp_commute_DJ
#print axioms Phys.Algebra.hyperOp_commute_DK
#print axioms Phys.Algebra.hyperOp_commute_isospin
#print axioms Phys.Algebra.charge_not_isospin_commuting
#print axioms Phys.Algebra.hyper_charge_differ
#print axioms Phys.Algebra.kap1'_ne_zero
#print axioms Phys.Algebra.hyperOp_ne_zero
#print axioms Phys.Algebra.forced_hypercharge_structure
-- N256 — THE UNIQUE ISOSPIN-FIXED AXIS: the isospin-invariant subspace of the fundamental 7 = ImO
--        (the joint kernel ker(imRep DI) ⊓ ker(imRep DJ) ⊓ ker(imRep DK)) is EXACTLY the 1-dim
--        branching singlet span{kap1' = ⟨kappaO 1⟩}, DERIVED from the gather object — the vector-level
--        TWIN of N252's unique colour-fixed axis (DUAL: charge↔colour, hypercharge↔isospin). ⊆ via the
--        PAIR {DI,DJ}: imRep_DI_eq_qI = qI Imat (N253) + imRep_DJ_eq_qI = qI Jmat (this node) force
--        c1=c2=c3=c5=c6=c7=0, reQ_ImO_zero (N208) forces c0=0, leaving only c4 = the kappaO-1 axis
--        (linarith on the banked integer rows, no coordinate bash of O ℚ). The faithful embedding
--        crossEmb (N225, injective) sends it to span{hyperOp} — hyperOp = crossOp (kappaO 1) is the
--        UNIQUE isospin-commuting gather generator, grounding N255's EXISTENCE with UNIQUENESS. Over
--        the derived ℚ and O ℚ = CD (H ℚ). isospinInvariants/imRep/DI/DJ/DK/kap1'/hyperOp/crossEmb
--        stay derived REAL; ker/inf/finrank/span/map Mathlib machinery on the DERIVED objects; no
--        Mathlib number/algebra as content. SCOPE: banks the forced UNIQUE isospin-fixed DIRECTION +
--        the operator uniqueness within the faithful embedded 7 ONLY, NOT the weak mixing angle /
--        normalization, NOT the full so(7)-operator-centralizer uniqueness (heavier g₂-side, deferred).
#print axioms Phys.Algebra.Jmat
#print axioms Phys.Algebra.imRep_DJ_eq_qI
#print axioms Phys.Algebra.isospinInvariants
#print axioms Phys.Algebra.imRep_DI_kap1'
#print axioms Phys.Algebra.imRep_DJ_kap1'
#print axioms Phys.Algebra.imRep_DK_kap1'
#print axioms Phys.Algebra.kap1'_mem_isospinInvariants
#print axioms Phys.Algebra.isospinInvariants_le_span_kap
#print axioms Phys.Algebra.isospinInvariants_eq_span_kap
#print axioms Phys.Algebra.finrank_isospinInvariants
#print axioms Phys.Algebra.hyperOp_eq_crossEmb_kap1'
#print axioms Phys.Algebra.map_crossEmb_isospinInvariants
#print axioms Phys.Algebra.finrank_map_crossEmb_isospinInvariants
#print axioms Phys.Algebra.unique_isospin_fixed_axis_structure
-- N257 — THE GATHER ISOMETRY: crossEmb pulls the fold's Born self-overlap form gForm back to the
--        so(7) trace form traceForm7 up to the universal scale −6: traceForm7 (crossOp ↑a)(crossOp ↑b)
--        = −6 * gForm ↑a ↑b for all a b : ImO (gather_isometry). The neutral-sector Gram collapses as
--        ONE consequence: the two forced U(1)s chargeOp = crossOp u1 and hyperOp = crossOp (kappaO 1)
--        have EQUAL invariant length −6 (B_hyperOp_hyperOp, B_chargeOp_chargeOp_via_isometry) and are
--        trace-ORTHOGONAL (B_chargeOp_hyperOp = 0) — an orthonormal pair forced by the fold metric.
--        Route (W9-decomposed): both sides bundled as bilinear forms (traceBil/lhsBil/rhsBil), equal
--        on the banked basis bb; on basis crossOp (imBasis i) = qI (Km i) (7 bridges br0..br6, each
--        the banked chargeOp_eq_qI tactic — split per-i for the compile budget) and traceForm7_qI +
--        decide on integers, matched to gForm_imBasis. Over the derived ℚ and O ℚ = CD (H ℚ).
--        crossOp/crossEmb/traceForm7/gForm/hyperOp/chargeOp stay derived REAL; trace/mul/bilinear/
--        Basis Mathlib machinery on the DERIVED objects; no Mathlib number/algebra as content. SCOPE:
--        banks the convention-free pullback SCALE (−6) + the collapsed neutral Gram (equal length +
--        orthogonality of the two forced U(1)s) ONLY, NOT the weak mixing angle / normalization / GMN.
#print axioms Phys.Algebra.Km
#print axioms Phys.Algebra.br0
#print axioms Phys.Algebra.br1
#print axioms Phys.Algebra.br2
#print axioms Phys.Algebra.br3
#print axioms Phys.Algebra.br4
#print axioms Phys.Algebra.br5
#print axioms Phys.Algebra.br6
#print axioms Phys.Algebra.crossOp_imBasis_eq_qI
#print axioms Phys.Algebra.gForm_imBasis
#print axioms Phys.Algebra.traceBil
#print axioms Phys.Algebra.lhsBil
#print axioms Phys.Algebra.rhsBil
#print axioms Phys.Algebra.bb_coe
#print axioms Phys.Algebra.lhsBil_eq_rhsBil
#print axioms Phys.Algebra.gather_isometry
#print axioms Phys.Algebra.kap1O
#print axioms Phys.Algebra.u1I
#print axioms Phys.Algebra.B_chargeOp_chargeOp_via_isometry
#print axioms Phys.Algebra.B_hyperOp_hyperOp
#print axioms Phys.Algebra.B_chargeOp_hyperOp
#print axioms Phys.Algebra.gather_isometry_structure

-- N258 — THE ELECTROWEAK REDUCTIVE LIE ALGEBRA su(2)_L ⊕ u(1)_Y as ONE LieSubalgebra of so(7).
--        The twin of N247 (colour-charge factor) with the semisimple/central roles SWAPPED across
--        the gather tear so(7) = 14 (Der O) ⊕ 7 (crossEmb): semisimple su(2)_L = isospinImg (the
--        derivations {DI,DJ,DK} in the adjoint 14, pushed through imRepL) joined with the abelian
--        central u(1)_Y = hyperLine (hyperOp = crossOp (kappaO 1) in the fundamental 7). su(2)_L is
--        bracket-closed (isospinSpan_lie_closed via the 9 su(2) brackets + imRepL a Lie hom);
--        hyperLine is central (hyperOp commutes with the whole su(2)_L, N255, + self-abelian); the
--        derived subalgebra lands in su(2)_L (join_derived_le_isospinImg — the reductive splitting);
--        the join electroweakLie is a Lie subalgebra of End ℚ ImO inside so(7); the two summands
--        meet in ⊥ (inter_eq_bot, simplicity of Der O) so finrank = 4 = 3 + 1. W8 TEETH: the gather
--        charge chargeOp ∉ electroweakLie (chargeOp_not_mem_electroweakLie — coordinate-free via
--        inter_eq_bot + N257 orthogonality B_chargeOp_hyperOp = 0 vs B_chargeOp_chargeOp = -6), the
--        two SM reductive sectors genuinely distinct. Over the derived ℚ and O ℚ = CD (H ℚ).
--        DI/DJ/DK/isospinSpan/imRep/imRepL/hyperOp/crossOp/crossEmb/chargeOp/bornBil/traceForm7 stay
--        derived REAL; LieSubalgebra/⁅·,·⁆/finrank/span/map Mathlib machinery on the DERIVED objects;
--        no Mathlib number/algebra as content. SCOPE: banks the electroweak reductive Lie algebra +
--        reductive splitting + dim 4 + sector-distinctness teeth ONLY, NOT the weak mixing angle /
--        coupling ratio / GMN (structurally blocked — needs a structure larger than the neutral plane).
#print axioms Phys.Algebra.isospinSpan_lie_closed
#print axioms Phys.Algebra.isospinImg
#print axioms Phys.Algebra.hyperLine
#print axioms Phys.Algebra.isospinImg_le_range_imRep
#print axioms Phys.Algebra.hyperOp_mem_range_crossEmb
#print axioms Phys.Algebra.hyperLine_le_range_crossEmb
#print axioms Phys.Algebra.isospinImg_lie_closed
#print axioms Phys.Algebra.hyperOp_bracket_isospinSpan
#print axioms Phys.Algebra.isospinImg_lie_hyperOp
#print axioms Phys.Algebra.hyperOp_lie_isospinImg
#print axioms Phys.Algebra.hyperLine_lie_isospinImg
#print axioms Phys.Algebra.isospinImg_lie_hyperLine
#print axioms Phys.Algebra.hyperLine_lie_hyperLine
#print axioms Phys.Algebra.join_derived_le_isospinImg
#print axioms Phys.Algebra.join_lie_mem
#print axioms Phys.Algebra.electroweakLie
#print axioms Phys.Algebra.electroweakLie_toSubmodule
#print axioms Phys.Algebra.mem_electroweakLie
#print axioms Phys.Algebra.hyperLine_central
#print axioms Phys.Algebra.isospinImg_le_so7
#print axioms Phys.Algebra.hyperLine_le_so7
#print axioms Phys.Algebra.electroweakLie_le_so7
#print axioms Phys.Algebra.isospin_indep3
#print axioms Phys.Algebra.isospin_linearIndependent
#print axioms Phys.Algebra.finrank_isospinSpan
#print axioms Phys.Algebra.finrank_isospinImg
#print axioms Phys.Algebra.finrank_hyperLine
#print axioms Phys.Algebra.isospinImg_inf_hyperLine_eq_bot
#print axioms Phys.Algebra.electroweakLie_finrank
#print axioms Phys.Algebra.traceForm7_right
#print axioms Phys.Algebra.chargeOp_not_mem_electroweakLie
#print axioms Phys.Algebra.electroweak_reductive_lie_structure

-- N259 — THE SHARED ISOSPIN CARTAN (the two SM reductive factors are NOT a direct product).
#print axioms Phys.Algebra.colourImg_inf_isospinImg
#print axioms Phys.Algebra.chargeLine_inf_hyperLine
#print axioms Phys.Algebra.shared_cartan
#print axioms Phys.Algebra.imRepL_DI_ne_zero
#print axioms Phys.Algebra.finrank_inf_sharedCartan
#print axioms Phys.Algebra.finrank_sup_sharedCartan
#print axioms Phys.Algebra.inf_ne_bot_sharedCartan
#print axioms Phys.Algebra.chargeOp_not_mem_sharedCartan
#print axioms Phys.Algebra.shared_isospin_cartan_structure

-- N260 — THE GATHER TEAR REGENERATES THE AMBIENT (the fundamental-7 Lie-generates all of so(7)).
#print axioms Phys.Algebra.traceForm7_add_left
#print axioms Phys.Algebra.lieGenCross_le_so7
#print axioms Phys.Algebra.range_crossEmb_le_lieGenCross
#print axioms Phys.Algebra.bracket_cross_qI
#print axioms Phys.Algebra.witness_traceForm_eq
#print axioms Phys.Algebra.traceForm7_imRepDI_crossEmb_eq_zero
#print axioms Phys.Algebra.traceForm7_crossOp_imRep_DI
#print axioms Phys.Algebra.proj14_witness_ne_zero
#print axioms Phys.Algebra.adEnd_bracket_crossEmb
#print axioms Phys.Algebra.W14_le_range_imRepL
#print axioms Phys.Algebra.crossEmb_mem_lieGenCross
#print axioms Phys.Algebra.bracket_crossEmb_mem_lieGenCross
#print axioms Phys.Algebra.W14_le_lieGenCross
#print axioms Phys.Algebra.W14_adEnd_invariant
#print axioms Phys.Algebra.W14_ne_bot
#print axioms Phys.Algebra.range_imRepL_le_lieGenCross
#print axioms Phys.Algebra.crossEmb_lieSpan_eq_so7
#print axioms Phys.Algebra.finrank_lieSpan_crossEmb
#print axioms Phys.Algebra.gather_tear_generates_so7

-- N261 — THE GATHER WORLDMAP IS A CLIFFORD MODULE (`O ℚ` is a spinor for the fold metric).
#print axioms Phys.Algebra.key_sq
#print axioms Phys.Algebra.leftReg
#print axioms Phys.Algebra.leftReg_apply
#print axioms Phys.Algebra.leftReg_sq
#print axioms Phys.Algebra.leftReg_clifford
#print axioms Phys.Algebra.leftReg_clifford_diag_witness
#print axioms Phys.Algebra.leftReg_clifford_offdiag_witness
#print axioms Phys.Algebra.worldMap_clifford_module

-- N262 — THE SPIN GENERATORS (the antisymmetric worldMap part rotates the vectors; so(7) closure).
#print axioms Phys.Algebra.cliff_mul
#print axioms Phys.Algebra.spinGen
#print axioms Phys.Algebra.spinGen_antisymm
#print axioms Phys.Algebra.spinGen_self
#print axioms Phys.Algebra.spinGen_act
#print axioms Phys.Algebra.spinGen_bracket
#print axioms Phys.Algebra.leftReg_frame_ne_zero
#print axioms Phys.Algebra.spinGen_frame_ne_zero
#print axioms Phys.Algebra.worldMap_spin_generators

-- N263 — THE TWO FACES OF so(7) ARE ONE (the vector rotation and the spinor spin generator).
#print axioms Phys.Algebra.elemRot
#print axioms Phys.Algebra.elemRot_apply
#print axioms Phys.Algebra.elemRot_antisymm
#print axioms Phys.Algebra.elemRot_self
#print axioms Phys.Algebra.elemRot_skew
#print axioms Phys.Algebra.leftReg_injective
#print axioms Phys.Algebra.spinGen_vector_action
#print axioms Phys.Algebra.elemRot_bracket
#print axioms Phys.Algebra.elemRot_frame_ne_zero
#print axioms Phys.Algebra.two_faces_of_so7

-- N264 — THE SPINOR IS INTRINSICALLY TWO-HANDED (the chirality germ).
#print axioms Phys.Algebra.key_sq_right
#print axioms Phys.Algebra.rightReg
#print axioms Phys.Algebra.rightReg_sq
#print axioms Phys.Algebra.rightReg_clifford
#print axioms Phys.Algebra.rightReg_clifford_diag_witness
#print axioms Phys.Algebra.rightReg_clifford_offdiag_witness
#print axioms Phys.Algebra.chir_mixed_apply
#print axioms Phys.Algebra.chir_commute_of_assoc
#print axioms Phys.Algebra.chir_spinor_block
#print axioms Phys.Algebra.chir_spinor_block_witness
#print axioms Phys.Algebra.chir_spinor_block_iff_jordan_cap
#print axioms Phys.Algebra.spinor_two_handed

-- N265 — MATTER IS ONE INDIVISIBLE WHOLE, AND ITS INDIVISIBILITY IS THE CASCADE STOP.
#print axioms Phys.Algebra.octNoZeroDivisors
#print axioms Phys.Algebra.octMul_ne_zero
#print axioms Phys.Algebra.worldMap_injective
#print axioms Phys.Algebra.star_selfMul
#print axioms Phys.Algebra.im_mem
#print axioms Phys.Algebra.worldMap_irreducible
#print axioms Phys.Algebra.leftReg_nonvacuous
#print axioms Phys.Algebra.division_boundary
#print axioms Phys.Algebra.matter_indivisible

-- N266 — THE COLOUR-NEUTRAL CORE OF THE MATTER CARRIER IS THE FOLD'S OWN COMPLEX LINE.
#print axioms Phys.Algebra.colour_kills_u1
#print axioms Phys.Algebra.span_one_u1_le_matterColourNeutral
#print axioms Phys.Algebra.matterColourNeutral_le_span_one_u1
#print axioms Phys.Algebra.matterColourNeutral_eq_span_one_u1
#print axioms Phys.Algebra.one_u1_linIndep
#print axioms Phys.Algebra.finrank_matterColourNeutral
#print axioms Phys.Algebra.span_one_u1_mul_mem
#print axioms Phys.Algebra.neutral_disj_Vsub
#print axioms Phys.Algebra.matter_colour_neutral_core

-- N267 — THE FORCED THREE-FOLD MATTER-CARRIER MULTIPLICITY OF THE MAXIMAL HERMITIAN OCTONIONIC JORDAN ORDER.
#print axioms Phys.Algebra.HJ.slotA_entry
#print axioms Phys.Algebra.HJ.slotB_entry
#print axioms Phys.Algebra.HJ.slotC_entry
#print axioms Phys.Algebra.HJ.slotA_inj
#print axioms Phys.Algebra.HJ.slotB_inj
#print axioms Phys.Algebra.HJ.slotC_inj
#print axioms Phys.Algebra.HJ.slotA_add
#print axioms Phys.Algebra.HJ.slotA_smul
#print axioms Phys.Algebra.HJ.slot_disjointAB
#print axioms Phys.Algebra.HJ.slot_disjointAC
#print axioms Phys.Algebra.HJ.slot_disjointBC
#print axioms Phys.Algebra.HJ.Xz_slot_decomp
#print axioms Phys.Algebra.HJ.Hm_slot_decomp
#print axioms Phys.Algebra.HJ.slotA_ne_zero
#print axioms Phys.Algebra.HJ.maximal_matter_arena
#print axioms Phys.Algebra.HJ.matter_multiplicity_three

-- N268 — THE DERIVED GAUGE ACTS ON THE MAXIMAL MATTER ARENA BY JORDAN DERIVATIONS, IDENTICALLY ACROSS THE THREE CAP-FORCED COPIES (family universality FORCED).
#print axioms Phys.Algebra.HJ.derivQ_star_comm
#print axioms Phys.Algebra.HJ.jAct_add
#print axioms Phys.Algebra.HJ.jAct_smul_matrix
#print axioms Phys.Algebra.HJ.jAct_mul
#print axioms Phys.Algebra.HJ.jAct_jb
#print axioms Phys.Algebra.HJ.jAct_slotA
#print axioms Phys.Algebra.HJ.jAct_slotB
#print axioms Phys.Algebra.HJ.jAct_slotC
#print axioms Phys.Algebra.HJ.jAct_Dg
#print axioms Phys.Algebra.HJ.jAct_Hm
#print axioms Phys.Algebra.HJ.gauge_moves_matter
#print axioms Phys.Algebra.HJ.gauge_family_universality

-- N269 — THE DERIVED GAUGE PRESERVES THE ARENA'S OBSERVABLE SPECTRUM (cubic norm jN / spur jS / characteristic polynomial gauge-invariant, finite + infinitesimal; the first g2 subset f4 inclusion).
#print axioms Phys.Algebra.HJ.jN_aut_invariant
#print axioms Phys.Algebra.HJ.jS_aut_invariant
#print axioms Phys.Algebra.HJ.jN_charpoly_aut_invariant
#print axioms Phys.Algebra.HJ.reQ_deriv_zero
#print axioms Phys.Algebra.HJ.cross_variation_zero
#print axioms Phys.Algebra.HJ.jN_first_variation_zero
#print axioms Phys.Algebra.HJ.jS_first_variation_zero
#print axioms Phys.Algebra.HJ.jN_preserved_value_ne_zero
#print axioms Phys.Algebra.HJ.gauge_nontrivial
#print axioms Phys.Algebra.HJ.gauge_preserves_spectrum

-- N270 — THE OBSERVABLE MATTER ARENA IS FORMALLY REAL (the fold's Born positivity makes the banked trace form jTraceForm of J3(O Q) positive-definite; the maximal matter arena is a Euclidean Jordan algebra, grounding N269's spectrum as REAL).
#print axioms Phys.Algebra.HJ.jQ_Hm
#print axioms Phys.Algebra.HJ.jQ_Hm_nonneg
#print axioms Phys.Algebra.HJ.jQ_Hm_eq_zero_iff
#print axioms Phys.Algebra.HJ.reQ_jTraceForm_self
#print axioms Phys.Algebra.HJ.jTraceForm_Hm_nonneg
#print axioms Phys.Algebra.HJ.jTraceForm_Hm_posdef
#print axioms Phys.Algebra.HJ.jQ_witness_diag
#print axioms Phys.Algebra.HJ.jQ_witness_offdiag
#print axioms Phys.Algebra.HJ.jQ_witness_pos
#print axioms Phys.Algebra.HJ.arena_formally_real

-- N271 — THE JOINT COLOUR-ISOSPIN NEUTRAL-CORE DECOMPOSITION OF THE MATTER CARRIER (isospin-neutral core of O Q = span{1, kappaO 1}; doubly-neutral core = the fold's scalar unit span{1}; the two cores misaligned).
#print axioms Phys.Algebra.HJ.matterIsospinNeutral_eq_span_one_kap
#print axioms Phys.Algebra.HJ.one_kap_linIndep
#print axioms Phys.Algebra.HJ.finrank_matterIsospinNeutral
#print axioms Phys.Algebra.HJ.u1_not_mem_span_one_kap
#print axioms Phys.Algebra.HJ.kap_not_mem_span_one_u1
#print axioms Phys.Algebra.HJ.span_meet_eq_span_one
#print axioms Phys.Algebra.HJ.matter_joint_neutral_eq_span_one
#print axioms Phys.Algebra.HJ.finrank_matter_joint_neutral
#print axioms Phys.Algebra.HJ.matter_joint_neutral_core_structure

-- N272 — THE ARENA'S JORDAN PRODUCT CYCLICALLY WEAVES THE THREE CAP-FORCED GENERATIONS.
-- The three cyclic coupling laws (jb slotA slotB = slotC (star a * b), cyclic), division-
-- valuedness (nonzero cross-copy coupling, N265), the moat tie (reQ trace-contraction of a
-- same-slot Jordan square = 4·gForm x c, the Born cross-term), and the capstone carrying the
-- octonion cap jordan_cap_pinned_at_three.
#print axioms Phys.Algebra.HJ.jb_slotA_slotB
#print axioms Phys.Algebra.HJ.jb_slotB_slotC
#print axioms Phys.Algebra.HJ.jb_slotC_slotA
#print axioms Phys.Algebra.HJ.coupling_ne_zero
#print axioms Phys.Algebra.HJ.coupling_cross_copy
#print axioms Phys.Algebra.HJ.jbCC_d11
#print axioms Phys.Algebra.HJ.jbCC_d22
#print axioms Phys.Algebra.HJ.jbCC_d00
#print axioms Phys.Algebra.HJ.trace_coupling_reQ
#print axioms Phys.Algebra.HJ.trace_coupling_gForm
#print axioms Phys.Algebra.HJ.coupling_cross_term_assoc
#print axioms Phys.Algebra.HJ.generation_coupling_structure

-- N273 — THE DERIVED FAMILY (S₃) SYMMETRY OF THE MAXIMAL MATTER ARENA.
-- The family action framePerm σ M = M.submatrix σ σ (the C(3,2)=3-position relabeling S₃) is a
-- group action, a Jordan-bracket automorphism, COMMUTES with the derived gauge jAct (flavour ⊥
-- gauge), permutes the three cap-forced slots, and — the octonion HEADLINE — carries the N272
-- coupling law by PRODUCT-REVERSAL (framePerm(swap 1 2)(jb (slotA a)(slotB b)) = slotC (star b*a));
-- non-vacuous; maximal at S₃ because the Jordan order is cap-forced at 3.
#print axioms Phys.Algebra.HJ.framePerm_one
#print axioms Phys.Algebra.HJ.framePerm_comp
#print axioms Phys.Algebra.HJ.framePerm_add
#print axioms Phys.Algebra.HJ.framePerm_jb
#print axioms Phys.Algebra.HJ.framePerm_jAct
#print axioms Phys.Algebra.HJ.framePerm_swap12_slotA
#print axioms Phys.Algebra.HJ.framePerm_swap12_slotB
#print axioms Phys.Algebra.HJ.framePerm_swap12_slotC
#print axioms Phys.Algebra.HJ.framePerm_cyc_slotA
#print axioms Phys.Algebra.HJ.framePerm_swap12_coupling
#print axioms Phys.Algebra.HJ.coupling_orbit_reverses
#print axioms Phys.Algebra.HJ.family_moves_slot
#print axioms Phys.Algebra.HJ.family_symmetry_structure

-- N274 — THE ARENA'S INNER-MULTIPLICATION COMMUTATOR: THE DERIVED OPERATOR COUPLING THE
-- CHARGE-WEIGHT SPACE (N213) TO THE OCTONION FAMILY-COUPLING (N272).
-- The arena's Jordan-multiplication operator Lmul A := (X ↦ jb A X) and its inner commutator
-- innerMul A B := Lmul A ∘ₗ Lmul B - Lmul B ∘ₗ Lmul A (a ℚ-linear, antisymmetric endomorphism)
-- satisfy the charge-weight ↔ coupling identity innerMul (slotA a)(slotB b)(Dg d0 d1 d2) =
-- slotC ((d2-d1) • (star a * b)) — the inner commutator reads the diagonal position-weight
-- DIFFERENCE (d2-d1, the N213 charge-space coordinate) into the octonion coupling star a*b (N272);
-- the derived direction-mixing operator that MOVES matter jAct (fixes) and framePerm (permutes)
-- cannot; maximal at order 3 (jordan_cap_pinned_at_three).
#print axioms Phys.Algebra.HJ.mat_smul_mul
#print axioms Phys.Algebra.HJ.mat_mul_smul
#print axioms Phys.Algebra.HJ.Lmul
#print axioms Phys.Algebra.HJ.Lmul_apply
#print axioms Phys.Algebra.HJ.innerMul
#print axioms Phys.Algebra.HJ.innerMul_apply
#print axioms Phys.Algebra.HJ.innerMul_antisymm
#print axioms Phys.Algebra.HJ.ocRmulL
#print axioms Phys.Algebra.HJ.jb_Dg_slotB
#print axioms Phys.Algebra.HJ.jb_Dg_slotA
#print axioms Phys.Algebra.HJ.jb_comm
#print axioms Phys.Algebra.HJ.slotC_sub
#print axioms Phys.Algebra.HJ.star_qsmul
#print axioms Phys.Algebra.HJ.weight_diff_smul
#print axioms Phys.Algebra.HJ.innerMul_slot_diag
#print axioms Phys.Algebra.HJ.innerMul_moves_diagonal
#print axioms Phys.Algebra.HJ.inner_multiplication_structure

-- N275 — THE COMPLETE INNER-MULTIPLICATION A₂ TRIANGLE + THE FAMILY-ORBIT CEILING.
#print axioms Phys.Algebra.HJ.slotA_sub
#print axioms Phys.Algebra.HJ.slotB_sub
#print axioms Phys.Algebra.HJ.jb_Dg_slotC
#print axioms Phys.Algebra.HJ.innerMul_slot_diagBC
#print axioms Phys.Algebra.HJ.innerMul_slot_diagCA
#print axioms Phys.Algebra.HJ.innerMul_root_sum_zero
#print axioms Phys.Algebra.HJ.cyc
#print axioms Phys.Algebra.HJ.cyc_slotA
#print axioms Phys.Algebra.HJ.cyc_slotB
#print axioms Phys.Algebra.HJ.cyc_slotC
#print axioms Phys.Algebra.HJ.cyc_Dg
#print axioms Phys.Algebra.HJ.framePerm_sub
#print axioms Phys.Algebra.HJ.framePerm_innerMul
#print axioms Phys.Algebra.HJ.innerMul_family_orbit
#print axioms Phys.Algebra.HJ.inner_root_no_fixed_direction
#print axioms Phys.Algebra.HJ.innerMul_diagBC_nonvacuous
#print axioms Phys.Algebra.HJ.inner_multiplication_triangle_structure

-- N276 — THE JOINT (CHARGE, WEAK-ISOSPIN-CARTAN) WEIGHT DECOMPOSITION OF ONE GENERATION'S MATTER.
#print axioms Phys.Algebra.e4O_memI
#print axioms Phys.Algebra.e5O_memI
#print axioms Phys.Algebra.e2O_memI
#print axioms Phys.Algebra.e3O_memI
#print axioms Phys.Algebra.imRep_DI_e4I
#print axioms Phys.Algebra.imRep_DI_e5I
#print axioms Phys.Algebra.imRep_DI_e2I
#print axioms Phys.Algebra.chargeOp_e4I
#print axioms Phys.Algebra.chargeOp_e5I
#print axioms Phys.Algebra.e45_indep
#print axioms Phys.Algebra.e2367_indep
#print axioms Phys.Algebra.finrank_Winert
#print axioms Phys.Algebra.finrank_Wactive
#print axioms Phys.Algebra.Winert_sup_Wactive_eq_Vsub
#print axioms Phys.Algebra.e4O_mem_Uhol
#print axioms Phys.Algebra.e5O_not_mem_Uhol
#print axioms Phys.Algebra.e5O_mem_Uah
#print axioms Phys.Algebra.e5O_ne_zero
#print axioms Phys.Algebra.e4O_ne_zero
#print axioms Phys.Algebra.Winert_ne_bot
#print axioms Phys.Algebra.chargeOp_e4I_ne_zero
#print axioms Phys.Algebra.joint_charge_isospin_weight_structure

-- N277 — THE NON-ABELIAN WEAK-ISOSPIN (su(2)_L) MULTIPLET DECOMPOSITION OF ONE
-- GENERATION'S FUNDAMENTAL MATTER = THE CAYLEY–DICKSON DOUBLING TEAR.
#print axioms Phys.Algebra.u1_memI
#print axioms Phys.Algebra.e6O_memI
#print axioms Phys.Algebra.e7O_memI
#print axioms Phys.Algebra.u1M
#print axioms Phys.Algebra.e6I
#print axioms Phys.Algebra.e7I
#print axioms Phys.Algebra.Kmat
#print axioms Phys.Algebra.imRep_DK_eq_qI
#print axioms Phys.Algebra.imRep_DI_u1I
#print axioms Phys.Algebra.imRep_DJ_u1I
#print axioms Phys.Algebra.imRep_DK_u1I
#print axioms Phys.Algebra.imRep_DJ_e2I
#print axioms Phys.Algebra.imRep_DK_e2I
#print axioms Phys.Algebra.imRep_DJ_e3I
#print axioms Phys.Algebra.imRep_DK_e3I
#print axioms Phys.Algebra.imRep_DJ_e5I
#print axioms Phys.Algebra.imRep_DK_e5I
#print axioms Phys.Algebra.imRep_DI_e6I
#print axioms Phys.Algebra.imRep_DK_e6I
#print axioms Phys.Algebra.imRep_DI_e7I
#print axioms Phys.Algebra.imRep_DJ_e7I
#print axioms Phys.Algebra.imRep_DJ_e4I
#print axioms Phys.Algebra.imRep_DK_e4I
#print axioms Phys.Algebra.TL
#print axioms Phys.Algebra.TR
#print axioms Phys.Algebra.Sg
#print axioms Phys.Algebra.multBasis
#print axioms Phys.Algebra.multBasis_coe
#print axioms Phys.Algebra.multBasis_indep
#print axioms Phys.Algebra.TL_indep
#print axioms Phys.Algebra.TR_indep
#print axioms Phys.Algebra.finrank_TL
#print axioms Phys.Algebra.finrank_TR
#print axioms Phys.Algebra.finrank_Sg
#print axioms Phys.Algebra.TL_sup_Sg_sup_TR_eq_top
#print axioms Phys.Algebra.casimirOp
#print axioms Phys.Algebra.CasMat
#print axioms Phys.Algebra.casimirOp_eq_qI
#print axioms Phys.Algebra.CasMat_val
#print axioms Phys.Algebra.casimirOp_u1I
#print axioms Phys.Algebra.casimirOp_e5I
#print axioms Phys.Algebra.casimirOp_e4I
#print axioms Phys.Algebra.kap1'_eq_e4I
#print axioms Phys.Algebra.TL_no_fixed_vector
#print axioms Phys.Algebra.e4O_mem_Winert
#print axioms Phys.Algebra.e5O_mem_Winert
#print axioms Phys.Algebra.e4I_mem_Sg
#print axioms Phys.Algebra.e5I_mem_TR
#print axioms Phys.Algebra.e2O_mem_Uhol
#print axioms Phys.Algebra.e3O_mem_Uah
#print axioms Phys.Algebra.TL_ne_bot
#print axioms Phys.Algebra.TR_ne_bot
#print axioms Phys.Algebra.isospin_multiplet_structure

-- N278 — THE FORCED HYPERCHARGE OPERATOR IS THE CAYLEY–DICKSON DOUBLING INTERTWINER.
#print axioms Phys.Algebra.hyperOp_u1I
#print axioms Phys.Algebra.hyperOp_e2I
#print axioms Phys.Algebra.hyperOp_e3I
#print axioms Phys.Algebra.hyperOp_e4I
#print axioms Phys.Algebra.hyperOp_e5I
#print axioms Phys.Algebra.hyperOp_e6I
#print axioms Phys.Algebra.hyperOp_e7I
#print axioms Phys.Algebra.TL_map_hyperOp_eq_TR
#print axioms Phys.Algebra.TR_map_hyperOp_eq_TL
#print axioms Phys.Algebra.hyperOp_sq_coe
#print axioms Phys.Algebra.hyperOp_sq_u1I
#print axioms Phys.Algebra.hyperOp_sq_e2I
#print axioms Phys.Algebra.hyperOp_sq_e3I
#print axioms Phys.Algebra.hyperOp_sq_e4I
#print axioms Phys.Algebra.hyperOp_mapsTo_TL
#print axioms Phys.Algebra.hyperOp_mapsTo_TR
#print axioms Phys.Algebra.hyperTL
#print axioms Phys.Algebra.hyperTR
#print axioms Phys.Algebra.hyperTL_coe
#print axioms Phys.Algebra.hyperTR_coe
#print axioms Phys.Algebra.hyperTR_hyperTL
#print axioms Phys.Algebra.hyperTL_hyperTR
#print axioms Phys.Algebra.hyperEquivTLTR
#print axioms Phys.Algebra.hyperEquivTLTR_apply
#print axioms Phys.Algebra.hyperOp_u1I_ne_zero
#print axioms Phys.Algebra.hyperOp_not_id_on_TL
#print axioms Phys.Algebra.hypercharge_doubling_intertwiner_structure

-- N279 — THE WEAK-ISOSPIN FUNDAMENTAL DOUBLET OF MATTER IS THE LEFT-REGULAR QUATERNION ACTION
-- ON THE SPINOR, CONFINED TO THE LAST ASSOCIATIVE RUNG BY THE CASCADE-STOPPING ASSOCIATOR.
#print axioms Phys.Algebra.leftmul_comm_obstruction
#print axioms Phys.Algebra.assoc_iotaO
#print axioms Phys.Algebra.u1_iotaO
#print axioms Phys.Algebra.e2O_iotaO
#print axioms Phys.Algebra.e3O_iotaO
#print axioms Phys.Algebra.lregI_apply
#print axioms Phys.Algebra.lregJ_apply
#print axioms Phys.Algebra.lregK_apply
#print axioms Phys.Algebra.leftReg_closure_on_H_IJ
#print axioms Phys.Algebra.gForm_u1M
#print axioms Phys.Algebra.gForm_e2I
#print axioms Phys.Algebra.gForm_e3I
#print axioms Phys.Algebra.leftReg_casimir_eq_neg_three
#print axioms Phys.Algebra.leftReg_obstruction_at_e4O
#print axioms Phys.Algebra.leftReg_comm_obstructed
#print axioms Phys.Algebra.leftReg_defect_eq_associator
#print axioms Phys.Algebra.weak_doublet_leftregular_structure

-- N280 — THE TWO-HANDED so(4) = su(2)_L ⊕ su(2)_R OF THE MATTER SPINOR, CONFINED TO THE LAST
-- ASSOCIATIVE RUNG H AND BROKEN ON O BY THE CASCADE-STOPPING ASSOCIATOR.
#print axioms Phys.Algebra.rregI
#print axioms Phys.Algebra.rregJ
#print axioms Phys.Algebra.rregK
#print axioms Phys.Algebra.rregI_apply
#print axioms Phys.Algebra.rregJ_apply
#print axioms Phys.Algebra.rregK_apply
#print axioms Phys.Algebra.rightmul_comm_obstruction
#print axioms Phys.Algebra.rightReg_closure_on_H_IJ
#print axioms Phys.Algebra.leftRight_commute_on_H
#print axioms Phys.Algebra.rightReg_casimir_eq_neg_three
#print axioms Phys.Algebra.rightReg_defect_eq_associator
#print axioms Phys.Algebra.rightReg_obstruction_at_e4O
#print axioms Phys.Algebra.rightReg_comm_obstructed
#print axioms Phys.Algebra.so4_breaks_on_O
#print axioms Phys.Algebra.lregI_ne_rregI
#print axioms Phys.Algebra.two_handed_so4_structure

-- N281 — THE FOLD-ROOT'S TWO-FACED NEUTRAL TORUS (flexibility-protected rank-2 Cartan of the spinor).
#print axioms Phys.Algebra.flex_reg_commute
#print axioms Phys.Algebra.lregI_sq
#print axioms Phys.Algebra.rregI_sq
#print axioms Phys.Algebra.foldRoot_faces_distinct
#print axioms Phys.Algebra.foldVec_one
#print axioms Phys.Algebra.foldVec_u1
#print axioms Phys.Algebra.foldVec_kills_e2O
#print axioms Phys.Algebra.foldVec_kills_e3O
#print axioms Phys.Algebra.foldVec_kills_e4O
#print axioms Phys.Algebra.foldVec_kills_e5O
#print axioms Phys.Algebra.foldVec_kills_e6O
#print axioms Phys.Algebra.foldVec_kills_e7O
#print axioms Phys.Algebra.foldAx_one
#print axioms Phys.Algebra.foldAx_u1
#print axioms Phys.Algebra.foldVec_add_foldAx
#print axioms Phys.Algebra.foldVec_sub_foldAx
#print axioms Phys.Algebra.foldVec_imaginary_content_is_u1_axis
#print axioms Phys.Algebra.colour_centralizes_both_faces
#print axioms Phys.Algebra.foldRoot_neutral_torus_structure

-- N284 — THE DERIVED ARENA'S JORDAN-DERIVATION LIE ALGEBRA (f₄-ambient) + bundled g₂ embedding.
#print axioms Phys.Algebra.HJ.jActL
#print axioms Phys.Algebra.HJ.jActL_add_arg
#print axioms Phys.Algebra.HJ.jActL_smul_arg
#print axioms Phys.Algebra.HJ.IsJordanDerivQ
#print axioms Phys.Algebra.HJ.isJordanDerivQ_bracket
#print axioms Phys.Algebra.HJ.jDer
#print axioms Phys.Algebra.HJ.jActL_mem
#print axioms Phys.Algebra.HJ.jActL_bracket
#print axioms Phys.Algebra.HJ.g2ToJDer
#print axioms Phys.Algebra.HJ.g2ToJDer_coe
#print axioms Phys.Algebra.HJ.g2ToJDer_injective
#print axioms Phys.Algebra.HJ.jActL_skew_jTraceForm
#print axioms Phys.Algebra.HJ.jActL_witness_ne_zero
#print axioms Phys.Algebra.HJ.arena_derivation_algebra_structure

-- N285 — THE GENUINE f₄ = Der(H₃(O)) ON THE HERMITIAN CARRIER + the re-seated faithful g₂ embedding.
#print axioms Phys.Algebra.HJ.jb_herm
#print axioms Phys.Algebra.HJ.Xz_herm
#print axioms Phys.Algebra.HJ.slotA_one_herm
#print axioms Phys.Algebra.HJ.slotB_one_herm
#print axioms Phys.Algebra.HJ.innerMul_herm
#print axioms Phys.Algebra.HJ.jActL_herm
#print axioms Phys.Algebra.HJ.IsHermJordanDerivQ
#print axioms Phys.Algebra.HJ.hermJordanDerivQ_bracket
#print axioms Phys.Algebra.HJ.derH3
#print axioms Phys.Algebra.HJ.mem_derH3
#print axioms Phys.Algebra.HJ.jActL_mem_derH3
#print axioms Phys.Algebra.HJ.g2ToDerH3
#print axioms Phys.Algebra.HJ.g2ToDerH3_coe
#print axioms Phys.Algebra.HJ.g2ToDerH3_injective
#print axioms Phys.Algebra.HJ.innerMul_escapes_g2
#print axioms Phys.Algebra.HJ.g2ToDerH3_witness_ne_zero
#print axioms Phys.Algebra.HJ.herm_arena_derivation_algebra_structure

-- N286 — THE INNER-DERIVATION LEIBNIZ LAW innerMul(Herm) ∈ derH3 (f₄ ⊋ g₂ PROPER) by linearizing jdef_H3.
#print axioms Phys.Algebra.HJ.self_adjoint_ocR
#print axioms Phys.Algebra.HJ.herm_eq_Hm
#print axioms Phys.Algebra.HJ.jdef_herm
#print axioms Phys.Algebra.HJ.inner_leibniz_two
#print axioms Phys.Algebra.HJ.herm_add
#print axioms Phys.Algebra.HJ.innerMul_leibniz_herm
#print axioms Phys.Algebra.HJ.innerMul_mem_derH3
#print axioms Phys.Algebra.HJ.inner_derivation_in_f4

-- N287 — THE GAUGE-NEUTRAL INNER-DERIVATION MEMBER OF f₄ (INPUT-A dissolution).
#print axioms Phys.Algebra.HJ.innerMul_gauge_leibniz
#print axioms Phys.Algebra.HJ.innerMul_zero_left
#print axioms Phys.Algebra.HJ.innerMul_zero_right
#print axioms Phys.Algebra.HJ.jAct_slotA_one
#print axioms Phys.Algebra.HJ.jAct_slotB_one
#print axioms Phys.Algebra.HJ.M0_gauge_central
#print axioms Phys.Algebra.HJ.gauge_neutral_inner_derivation_in_f4

-- N288 — THE FAMILY-ROTATION GENERATORS OF THE GAUGE-NEUTRAL ROOM OF f₄.
#print axioms Phys.Algebra.HJ.slotC_one_herm
#print axioms Phys.Algebra.HJ.jAct_slotC_one
#print axioms Phys.Algebra.HJ.slotB_zero
#print axioms Phys.Algebra.HJ.slotB_neg
#print axioms Phys.Algebra.HJ.jb_slotA1_slotA
#print axioms Phys.Algebra.HJ.jb_slotB1_slotB
#print axioms Phys.Algebra.HJ.jb_slotC1_slotC
#print axioms Phys.Algebra.HJ.famC_mem_derH3
#print axioms Phys.Algebra.HJ.famA_mem_derH3
#print axioms Phys.Algebra.HJ.famB_mem_derH3
#print axioms Phys.Algebra.HJ.famC_gauge_central
#print axioms Phys.Algebra.HJ.famA_gauge_central
#print axioms Phys.Algebra.HJ.famB_gauge_central
#print axioms Phys.Algebra.HJ.famC_slotB
#print axioms Phys.Algebra.HJ.famC_slotA
#print axioms Phys.Algebra.HJ.famA_slotC
#print axioms Phys.Algebra.HJ.slotA_one_ne_zero
#print axioms Phys.Algebra.HJ.famC_slotB_ne_zero
#print axioms Phys.Algebra.HJ.family_rotation_generators

-- N289 — THE so(3) CLOSURE OF THE DERIVED FAMILY-ROTATION GENERATORS.
#print axioms Phys.Algebra.HJ.ocR_neg
#print axioms Phys.Algebra.HJ.ocR_sub
#print axioms Phys.Algebra.HJ.ocRM_assoc_L
#print axioms Phys.Algebra.HJ.ocRM_assoc_R
#print axioms Phys.Algebra.HJ.ocRM_mul
#print axioms Phys.Algebra.HJ.ocRM_sub
#print axioms Phys.Algebra.HJ.collapse
#print axioms Phys.Algebra.HJ.adE_bracket
#print axioms Phys.Algebra.HJ.slotA_one_ocRM
#print axioms Phys.Algebra.HJ.slotB_one_ocRM
#print axioms Phys.Algebra.HJ.slotC_one_ocRM
#print axioms Phys.Algebra.HJ.famC_eq_adE
#print axioms Phys.Algebra.HJ.famA_eq_adE
#print axioms Phys.Algebra.HJ.famB_eq_adE
#print axioms Phys.Algebra.HJ.q_so3_CA
#print axioms Phys.Algebra.HJ.q_so3_AB
#print axioms Phys.Algebra.HJ.q_so3_BC
#print axioms Phys.Algebra.HJ.famC_famA_closure
#print axioms Phys.Algebra.HJ.famA_famB_closure
#print axioms Phys.Algebra.HJ.famB_famC_closure
#print axioms Phys.Algebra.HJ.famB_ne_zero
#print axioms Phys.Algebra.HJ.family_rotation_so3

-- N290 — THE FAMILY-INVARIANT CORE OF THE MATTER ARENA IS THE SCALAR-UNIT LINE.
#print axioms Phys.Algebra.HJ.mul_ocR_one
#print axioms Phys.Algebra.HJ.Ka_const
#print axioms Phys.Algebra.HJ.Kb_const
#print axioms Phys.Algebra.HJ.famA_forces_12
#print axioms Phys.Algebra.HJ.famA_forces_diag_10
#print axioms Phys.Algebra.HJ.famA_forces_02
#print axioms Phys.Algebra.HJ.famB_forces_01
#print axioms Phys.Algebra.HJ.famB_forces_diag_20
#print axioms Phys.Algebra.HJ.famB_forces_10
#print axioms Phys.Algebra.HJ.adE_one
#print axioms Phys.Algebra.HJ.famA_one
#print axioms Phys.Algebra.HJ.famB_one
#print axioms Phys.Algebra.HJ.famC_one
#print axioms Phys.Algebra.HJ.FamInvariant
#print axioms Phys.Algebra.HJ.faminvariant_eq_scalar
#print axioms Phys.Algebra.HJ.Dg_eq_ocRM
#print axioms Phys.Algebra.HJ.adE_ocRM_Dg
#print axioms Phys.Algebra.HJ.famA_Dg
#print axioms Phys.Algebra.HJ.famB_Dg
#print axioms Phys.Algebra.HJ.famC_Dg
#print axioms Phys.Algebra.HJ.Dg_herm
#print axioms Phys.Algebra.HJ.slotA_one_not_faminvariant
#print axioms Phys.Algebra.HJ.family_invariant_core_eq_span_one

-- N291 — THE GAUGE-COVARIANT, COLOUR-NEUTRAL, FAMILY-VISIBLE COUPLING MEMBER OF f₄.
#print axioms Phys.Algebra.HJ.slotA_zero
#print axioms Phys.Algebra.HJ.coupling_covariance
#print axioms Phys.Algebra.HJ.coupling_mem_derH3
#print axioms Phys.Algebra.HJ.coupling_gauge_neutral_of_kills_u1
#print axioms Phys.Algebra.HJ.coupling_colour_neutral
#print axioms Phys.Algebra.HJ.coupling_slotA_diag_entry
#print axioms Phys.Algebra.HJ.coupling_slotA_ne_zero
#print axioms Phys.Algebra.HJ.coupling_isospin_covariant_ne_zero
#print axioms Phys.Algebra.HJ.coupling_moves_diagonal
#print axioms Phys.Algebra.HJ.gauge_family_coupling_member

-- N292 — THE FOLD-ROOT-DRESSED FAMILY-BREAKING COSET of the derived colour-centralizer su(3).
#print axioms Phys.Algebra.HJ.cosetBC_mem_derH3
#print axioms Phys.Algebra.HJ.cosetCA_mem_derH3
#print axioms Phys.Algebra.HJ.cosetBC_colour_neutral
#print axioms Phys.Algebra.HJ.kAB_slotA_one
#print axioms Phys.Algebra.HJ.kAB_slotB_one
#print axioms Phys.Algebra.HJ.kAB_slotC_one
#print axioms Phys.Algebra.HJ.kAB_moves_generation
#print axioms Phys.Algebra.HJ.colour_centralizer_coset

-- N293 — THE su(3)/so(3) SYMMETRIC-PAIR CLOSURE: the fold-root-dressed coset closes back into the family.
#print axioms Phys.Algebra.HJ.u1M
#print axioms Phys.Algebra.HJ.ocRM_assoc_M
#print axioms Phys.Algebra.HJ.u1_alt_L
#print axioms Phys.Algebra.HJ.u1_alt_R
#print axioms Phys.Algebra.HJ.u1_alt_M
#print axioms Phys.Algebra.HJ.u1M_assoc_L
#print axioms Phys.Algebra.HJ.u1M_assoc_R
#print axioms Phys.Algebra.HJ.u1M_assoc_M
#print axioms Phys.Algebra.HJ.adE_bracket_u1
#print axioms Phys.Algebra.HJ.u1_entry_prod
#print axioms Phys.Algebra.HJ.u1M_mul
#print axioms Phys.Algebra.HJ.u1M_ocRM
#print axioms Phys.Algebra.HJ.ocRM_u1M
#print axioms Phys.Algebra.HJ.u1M_sub
#print axioms Phys.Algebra.HJ.innerMul_ocRM_right
#print axioms Phys.Algebra.HJ.slotA_u1_u1M
#print axioms Phys.Algebra.HJ.slotB_u1_u1M
#print axioms Phys.Algebra.HJ.slotC_u1_u1M
#print axioms Phys.Algebra.HJ.kAB_eq_adE
#print axioms Phys.Algebra.HJ.kBC_eq_adE
#print axioms Phys.Algebra.HJ.kCA_eq_adE
#print axioms Phys.Algebra.HJ.q_close_AB_BC
#print axioms Phys.Algebra.HJ.q_close_BC_CA
#print axioms Phys.Algebra.HJ.q_close_CA_AB
#print axioms Phys.Algebra.HJ.adE_u1_bracket_ocRM
#print axioms Phys.Algebra.HJ.ocRM_neg
#print axioms Phys.Algebra.HJ.adE_neg
#print axioms Phys.Algebra.HJ.coset_close_AB_BC
#print axioms Phys.Algebra.HJ.coset_close_BC_CA
#print axioms Phys.Algebra.HJ.coset_close_CA_AB
#print axioms Phys.Algebra.HJ.coset_symmetric_pair_closure

-- N294 — THE DERIVED COLOUR GAUGE AND FAMILY-FLAVOUR su(3) ARE A COMMUTING PAIR IN f₄.
#print axioms Phys.Algebra.HJ.colour_centralizes_famA
#print axioms Phys.Algebra.HJ.colour_centralizes_famB
#print axioms Phys.Algebra.HJ.colour_centralizes_famC
#print axioms Phys.Algebra.HJ.colour_centralizes_kAB
#print axioms Phys.Algebra.HJ.colour_centralizes_kBC
#print axioms Phys.Algebra.HJ.colour_centralizes_kCA
#print axioms Phys.Algebra.HJ.colour_kills_foldcomplex_core
#print axioms Phys.Algebra.HJ.famC_ne_gauge
#print axioms Phys.Algebra.HJ.flavour_nonvacuous
#print axioms Phys.Algebra.HJ.colour_flavour_commuting_pair

-- N295 — THE SPECTRUM-MOVING SECTOR BEYOND f₄ (traceless left-mults move the identity f₄ fixes).
#print axioms Phys.Algebra.HJ.Lmul_one
#print axioms Phys.Algebra.HJ.derH3_kills_one
#print axioms Phys.Algebra.HJ.Lmul_moves_one_ne
#print axioms Phys.Algebra.HJ.Lmul_notMem_derH3
#print axioms Phys.Algebra.HJ.spectrum_movers_close_into_derH3
#print axioms Phys.Algebra.HJ.spectrum_motion_positive
#print axioms Phys.Algebra.HJ.spectrum_moving_sector_member

-- N296 — THE f₄-EQUIVARIANCE OF THE SPECTRUM-MOVING SECTOR ([f₄,L₀]⊆L₀; e₆=f₄⊕L₀ graded triple).
#print axioms Phys.Algebra.HJ.spectrum_sector_equivariance
#print axioms Phys.Algebra.HJ.family_moves_mover
#print axioms Phys.Algebra.HJ.family_moves_mover_ne
#print axioms Phys.Algebra.HJ.spectrum_sector_graded_module

-- N297 — THE DILATION/TRACELESS-SPLIT GRADING OF THE SPECTRUM-MOVING SECTOR (trace-graded L₀ action).
#print axioms Phys.Algebra.HJ.dilation_scale
#print axioms Phys.Algebra.HJ.dilation_fixed
#print axioms Phys.Algebra.HJ.diag_mover_split
#print axioms Phys.Algebra.HJ.mover_trace_grading
#print axioms Phys.Algebra.HJ.split_iff_traceless
#print axioms Phys.Algebra.HJ.split_iff_orthogonal
#print axioms Phys.Algebra.HJ.dilation_moves_trace
#print axioms Phys.Algebra.HJ.split_traceless
#print axioms Phys.Algebra.HJ.split_ne
#print axioms Phys.Algebra.HJ.spectrum_grading_structure

-- N298 — THE INVARIANCE OF THE DERIVED CARTAN–KILLING TRACE FORM + THE TRACE-ANNIHILATION BY THE
-- f₄-GENERATORS (the FORCED core of the childed "derH3 kills jTr"; gap = Der(H₃O)=InnDer, childed).
#print axioms Phys.Algebra.HJ.rtr_mul_comm
#print axioms Phys.Algebra.HJ.rtr_mul_assoc
#print axioms Phys.Algebra.HJ.traceform_associative
#print axioms Phys.Algebra.HJ.innerMul_kills_trace
#print axioms Phys.Algebra.HJ.jActL_kills_trace
#print axioms Phys.Algebra.HJ.herm_jTr_eq_ocR_rtr
#print axioms Phys.Algebra.HJ.innerMul_kills_jTr
#print axioms Phys.Algebra.HJ.jActL_kills_jTr
#print axioms Phys.Algebra.HJ.dilation_trace_rtr
#print axioms Phys.Algebra.HJ.dilation_trace_ne
#print axioms Phys.Algebra.HJ.trace_form_invariance_structure

-- N299 — the innerness-FREE trace-annihilation of f₄ (the commutator-trace dissolution).
#print axioms Phys.Algebra.HJ.hermSub
#print axioms Phys.Algebra.HJ.lmul_mapsTo
#print axioms Phys.Algebra.HJ.derH3_mapsTo
#print axioms Phys.Algebra.HJ.restricted_comm
#print axioms Phys.Algebra.HJ.derH3_kills_hermTrace
#print axioms Phys.Algebra.HJ.dilation_restrict
#print axioms Phys.Algebra.HJ.finrank_hermSub_pos
#print axioms Phys.Algebra.HJ.dilation_hermTrace
#print axioms Phys.Algebra.HJ.dilation_hermTrace_ne
#print axioms Phys.Algebra.HJ.herm_trace_commutator_structure

-- N300 — the trace-COEFFICIENT proportionality + the FULL f₄-annihilation of the linear trace.
#print axioms Phys.Algebra.HJ.csign_jb
#print axioms Phys.Algebra.HJ.pconj_jb
#print axioms Phys.Algebra.HJ.phi
#print axioms Phys.Algebra.HJ.phi_csign
#print axioms Phys.Algebra.HJ.phi_pconj
#print axioms Phys.Algebra.HJ.phi_pair_zero
#print axioms Phys.Algebra.HJ.phi_Eidem_eq
#print axioms Phys.Algebra.HJ.phi_Eidem_val
#print axioms Phys.Algebra.HJ.kconst_ne_zero
#print axioms Phys.Algebra.HJ.phi_proportional
#print axioms Phys.Algebra.HJ.derH3_kills_jTr
#print axioms Phys.Algebra.HJ.full_trace_annihilation_structure
-- N301 — the family-so(3) rotation of the mass-texture module (mass-splitting ↔ mixing, isospectral).
#print axioms Phys.Algebra.HJ.Dg_herm_gen
#print axioms Phys.Algebra.HJ.famC_diag_to_mix
#print axioms Phys.Algebra.HJ.famC_slotC
#print axioms Phys.Algebra.HJ.family_rotates_split_to_mix
#print axioms Phys.Algebra.HJ.family_rotates_mix_to_split
#print axioms Phys.Algebra.HJ.family_fixes_dilation
#print axioms Phys.Algebra.HJ.family_kills_linear_spectral
#print axioms Phys.Algebra.HJ.family_kills_quadratic_spectral
#print axioms Phys.Algebra.HJ.family_rotates_split_to_mix_ne
#print axioms Phys.Algebra.HJ.family_mass_mixing_orbit_structure
-- N302 — the cubic/determinant isospectrality: f₄=derH3 preserves the full spectrum.
#print axioms Phys.Algebra.HJ.rtr_jb_cyc
#print axioms Phys.Algebra.HJ.derH3_kills_quadratic_spectral
#print axioms Phys.Algebra.HJ.derH3_kills_cubic_spectral
#print axioms Phys.Algebra.HJ.derH3_isospectral_nonvacuous
#print axioms Phys.Algebra.HJ.derH3_isospectral
-- N303 — the fold-root complexification of the generation-mixing sector.
#print axioms Phys.Algebra.HJ.kAB_diag_to_imag_mix
#print axioms Phys.Algebra.HJ.breaking_rotates_split_to_imag_mix
#print axioms Phys.Algebra.HJ.kAB_kills_linear
#print axioms Phys.Algebra.HJ.kAB_kills_quadratic
#print axioms Phys.Algebra.HJ.kAB_kills_cubic
#print axioms Phys.Algebra.HJ.u1_in_fold_core
#print axioms Phys.Algebra.HJ.famMixJ_slotC_one
#print axioms Phys.Algebra.HJ.famMixJ_slotC_u1
#print axioms Phys.Algebra.HJ.famMixJ_sq_slotC_one
#print axioms Phys.Algebra.HJ.kAB_imag_mix_nonvacuous
#print axioms Phys.Algebra.HJ.family_mixing_complexification_structure
-- N304 — the generation fold-root charges of the family complex-structure generator.
#print axioms Phys.Algebra.HJ.famMixJ_slotA_one
#print axioms Phys.Algebra.HJ.famMixJ_slotB_one
#print axioms Phys.Algebra.HJ.famMixJ_slotC_charge
#print axioms Phys.Algebra.HJ.smul_u1_ne_zero
#print axioms Phys.Algebra.HJ.slotA_charge_ne_slotB_charge
#print axioms Phys.Algebra.HJ.slotB_charge_ne_slotC_charge
#print axioms Phys.Algebra.HJ.slotA_charge_ne_slotC_charge
#print axioms Phys.Algebra.HJ.generation_foldroot_charges
-- N305 — the ℤ₃ self-blind generation cycle and its forced Born-weight split (seed T1+T2).
#print axioms Phys.Algebra.HJ.gcyc_cube
#print axioms Phys.Algebra.HJ.gcyc_ne_one
#print axioms Phys.Algebra.HJ.gcyc_fpf
#print axioms Phys.Algebra.HJ.Eidem_inj
#print axioms Phys.Algebra.HJ.pconj_gcyc
#print axioms Phys.Algebra.HJ.gen_no_fixed
#print axioms Phys.Algebra.HJ.transp_self_sees
#print axioms Phys.Algebra.HJ.unity_fixed
#print axioms Phys.Algebra.HJ.see_others_0
#print axioms Phys.Algebra.HJ.see_others_1
#print axioms Phys.Algebra.HJ.see_others_2
#print axioms Phys.Algebra.HJ.see_diag_zero
#print axioms Phys.Algebra.HJ.see_trace_zero
#print axioms Phys.Algebra.HJ.see_Pdem
#print axioms Phys.Algebra.HJ.see_Poth
#print axioms Phys.Algebra.HJ.tr_Pdem
#print axioms Phys.Algebra.HJ.tr_Poth
#print axioms Phys.Algebra.HJ.born_fraction_others
#print axioms Phys.Algebra.HJ.born_fraction_dem
#print axioms Phys.Algebra.HJ.born_fraction_forced_gen
#print axioms Phys.Algebra.HJ.weight_balance
#print axioms Phys.Algebra.HJ.generation_cycle_born_split_structure
-- N306 — THE ℤ₃-FOURIER CYCLE FORM OF THE COHERENCE AMPLITUDES (seed T3).
#print axioms Phys.Algebra.HJ.Pcyc_ground
#print axioms Phys.Algebra.HJ.Pcyc_cube
#print axioms Phys.Algebra.HJ.Pcyc_Pdem
#print axioms Phys.Algebra.HJ.cyc_sum_Jall
#print axioms Phys.Algebra.HJ.Jall_three_Pdem
#print axioms Phys.Algebra.HJ.cyc_cyclotomic_on_Poth
#print axioms Phys.Algebra.HJ.Pcyc_Poth_comm
#print axioms Phys.Algebra.HJ.Pcyc_ne_one
#print axioms Phys.Algebra.HJ.pdem_mulvec
#print axioms Phys.Algebra.HJ.poth_mulvec
#print axioms Phys.Algebra.HJ.DCpower_eq
#print axioms Phys.Algebra.HJ.cyclepower_eq
#print axioms Phys.Algebra.HJ.parseval
#print axioms Phys.Algebra.HJ.sum_eq
#print axioms Phys.Algebra.HJ.balance_forces_koide
#print axioms Phys.Algebra.HJ.mean_cosVec
#print axioms Phys.Algebra.HJ.DCpower_cosVec
#print axioms Phys.Algebra.HJ.cyclepower_cosVec
#print axioms Phys.Algebra.HJ.forced_sqrt2
#print axioms Phys.Algebra.HJ.sqrt2_gives_balance
#print axioms Phys.Algebra.HJ.koide_not_one
#print axioms Phys.Algebra.HJ.koide_cosVec
#print axioms Phys.Algebra.HJ.generation_cycle_form_structure
-- N307 — THE KOIDE IDENTITY Q = 2/3 FOR ALL PHASES δ (seed T4).
#print axioms Phys.Algebra.HJ.genVec_zero
#print axioms Phys.Algebra.HJ.mean_genVec
#print axioms Phys.Algebra.HJ.DCpower_genVec
#print axioms Phys.Algebra.HJ.cyclepower_genVec_core
#print axioms Phys.Algebra.HJ.cyclepower_genVec
#print axioms Phys.Algebra.HJ.balance_genVec
#print axioms Phys.Algebra.HJ.forced_sqrt2_genVec
#print axioms Phys.Algebra.HJ.koide_genVec
#print axioms Phys.Algebra.HJ.koide_genVec_not_one
#print axioms Phys.Algebra.HJ.genVec_moves
#print axioms Phys.Algebra.HJ.Pcyc_mulVec
#print axioms Phys.Algebra.HJ.cyclepower_Pcyc_inv
#print axioms Phys.Algebra.HJ.Qkoide_Pcyc_inv
#print axioms Phys.Algebra.HJ.generation_koide_all_phases
-- N308 — THE CRUX: THE CYCLE PHASE δ_B = 2/9 FROM HOLONOMY = STATISTICS (seed T5).
#print axioms Phys.Algebra.HJ.seeMat_eq_cycle_holonomy
#print axioms Phys.Algebra.HJ.holonomy_diag_zero
#print axioms Phys.Algebra.HJ.cycle_holonomy_on_Pdem
#print axioms Phys.Algebra.HJ.cycle_holonomy_on_Poth
#print axioms Phys.Algebra.HJ.holonomy_from_selfblind
#print axioms Phys.Algebra.HJ.selfblind_from_holonomy
#print axioms Phys.Algebra.HJ.born_fixedpoint_solve
#print axioms Phys.Algebra.HJ.cyclephase_value
#print axioms Phys.Algebra.HJ.tr_sum_three
#print axioms Phys.Algebra.HJ.selfseen_two_thirds
#print axioms Phys.Algebra.HJ.democratic_third
#print axioms Phys.Algebra.HJ.selfblind_balance_traces
#print axioms Phys.Algebra.HJ.selfseen_satisfies_fixedpoint
#print axioms Phys.Algebra.HJ.cyclephase_delta_B
#print axioms Phys.Algebra.HJ.cyclephase_as_weight_product
#print axioms Phys.Algebra.HJ.total_holonomy_closes
#print axioms Phys.Algebra.HJ.cyclephase_value_n3
#print axioms Phys.Algebra.HJ.cyclephase_not_selfseen
#print axioms Phys.Algebra.HJ.cyclephase_not_democratic
#print axioms Phys.Algebra.HJ.fixedpoint_excludes_half
#print axioms Phys.Algebra.HJ.fixedpoint_forces_two_thirds
#print axioms Phys.Algebra.HJ.generation_cycle_phase_structure
-- N309 — THE GENERATION MASS RATIOS AS A FORCED CUBIC (seed T6).
#print axioms Phys.Algebra.HJ.massVec_born
#print axioms Phys.Algebra.HJ.e1_amp
#print axioms Phys.Algebra.HJ.sqsum_amp
#print axioms Phys.Algebra.HJ.sigma1_mass
#print axioms Phys.Algebra.HJ.mass_koide
#print axioms Phys.Algebra.HJ.e3amp_closed
#print axioms Phys.Algebra.HJ.e2_amp
#print axioms Phys.Algebra.HJ.sigma2_mass
#print axioms Phys.Algebra.HJ.sigma3_mass
#print axioms Phys.Algebra.HJ.mass_cubic
#print axioms Phys.Algebra.HJ.triple_phase_is_holonomy
#print axioms Phys.Algebra.HJ.triple_phase_value
#print axioms Phys.Algebra.HJ.sigma1_forced_value
#print axioms Phys.Algebra.HJ.genVec_ev1
#print axioms Phys.Algebra.HJ.genVec_ev2
#print axioms Phys.Algebra.HJ.mass_degenerate_at_zero
#print axioms Phys.Algebra.HJ.amp_distinct01
#print axioms Phys.Algebra.HJ.amp_distinct12
#print axioms Phys.Algebra.HJ.amp_distinct02
#print axioms Phys.Algebra.HJ.conic_point_valid
#print axioms Phys.Algebra.HJ.generation_mass_ratio_structure

-- N310 (seed T7): the quark associator deviation / the separation of the two generation invariants.
#print axioms Phys.Algebra.HJ.scaled_mul
#print axioms Phys.Algebra.HJ.assoc_central_homogeneous
#print axioms Phys.Algebra.HJ.cline_mul
#print axioms Phys.Algebra.HJ.cline_assoc_zero
#print axioms Phys.Algebra.HJ.octCross_smul_left
#print axioms Phys.Algebra.HJ.octCross_smul_right
#print axioms Phys.Algebra.HJ.assoc3_scale
#print axioms Phys.Algebra.HJ.octCross_u1_collinear
#print axioms Phys.Algebra.HJ.assoc3_cline_zero
#print axioms Phys.Algebra.HJ.fano_assoc3_ne_zero
#print axioms Phys.Algebra.HJ.fano_assoc_ne_zero
#print axioms Phys.Algebra.HJ.fano_scaled_ne_zero
#print axioms Phys.Algebra.HJ.separation
#print axioms Phys.Algebra.HJ.invariants_independent

-- N311 (seed T8): the generation-mixing tridiagonal frame (the ℚ-exact structural half).
#print axioms Phys.Algebra.HJ.cascadePath_diag_zero
#print axioms Phys.Algebra.HJ.cascadePath_nn
#print axioms Phys.Algebra.HJ.cascadePath_corner_zero
#print axioms Phys.Algebra.HJ.seeMat_corner_one
#print axioms Phys.Algebra.HJ.cascade_open_ne_closed
#print axioms Phys.Algebra.HJ.massMat_diag_0
#print axioms Phys.Algebra.HJ.massMat_diag_1
#print axioms Phys.Algebra.HJ.massMat_diag_2
#print axioms Phys.Algebra.HJ.massMat_corner_zero
#print axioms Phys.Algebra.HJ.massMat_symm_01
#print axioms Phys.Algebra.HJ.massMat_symm_12
#print axioms Phys.Algebra.HJ.massMat_offdiag_01
#print axioms Phys.Algebra.HJ.massMat_offdiag_12
#print axioms Phys.Algebra.HJ.massMat_nn_born_01
#print axioms Phys.Algebra.HJ.massMat_nn_born_12
#print axioms Phys.Algebra.HJ.gst_tan_sq_01
#print axioms Phys.Algebra.HJ.gst_tan_sq_12
#print axioms Phys.Algebra.HJ.corner_open_ne_cycle
#print axioms Phys.Algebra.HJ.massMat_genuinely_tridiagonal
#print axioms Phys.Algebra.HJ.coupling_geometric_not_arithmetic
#print axioms Phys.Algebra.HJ.generation_mixing_frame_structure

-- N312 — THE TWO-SECTOR FRAME OVERLAP (seed T8 remainder, the ℚ-exact structural core).
#print axioms Phys.Algebra.HJ.massSub01_born
#print axioms Phys.Algebra.HJ.massSub12_born
#print axioms Phys.Algebra.HJ.bornBlock_det_zero
#print axioms Phys.Algebra.HJ.bornBlock_eigvec_amp
#print axioms Phys.Algebra.HJ.bornBlock_eigvec_null
#print axioms Phys.Algebra.HJ.massMat_eigvec_amp_0
#print axioms Phys.Algebra.HJ.massMat_eigvec_amp_1
#print axioms Phys.Algebra.HJ.massMat_eigvec_null
#print axioms Phys.Algebra.HJ.mixV_unitary_up_to_scale
#print axioms Phys.Algebra.HJ.brahmagupta_fibonacci
#print axioms Phys.Algebra.HJ.cabibbo_mixing_orthonormal
#print axioms Phys.Algebra.HJ.mixNumer_ground
#print axioms Phys.Algebra.HJ.cp_invariant_tie
#print axioms Phys.Algebra.HJ.mixing_nonzero_distinct_sectors
#print axioms Phys.Algebra.HJ.mixV_not_identity
#print axioms Phys.Algebra.HJ.cabibbo_geometric_not_trivial
#print axioms Phys.Algebra.HJ.two_sector_frame_overlap_structure

-- N313 — THE OCTONION STRUCTURE 3-FORM φ AND ‖φ‖² = 42 = n(n−1) (seeded gauge route A1).
#print axioms Phys.Algebra.imParseval
#print axioms Phys.Algebra.assoc3InnerSum
#print axioms Phys.Algebra.assoc3NormSq_eq_42
#print axioms Phys.Algebra.assoc3NormSq_eq_n_times_n_sub_one
#print axioms Phys.Algebra.assoc3InnerSum_diag
#print axioms Phys.Algebra.assoc3InnerSum_offdiag_01
#print axioms Phys.Algebra.assoc3NormSq_ne_zero
#print axioms Phys.Algebra.assoc3NormSq_ne_49

-- N314 — THE INTERACTION-CHANNEL TOWER ℂ:0, ℍ:6, 𝕆:42 = n(n−1) (seeded gauge route A2).
#print axioms Phys.Algebra.imChannelCount_eq_n_times_n_sub_one
#print axioms Phys.Algebra.imDim_C
#print axioms Phys.Algebra.imDim_H
#print axioms Phys.Algebra.imDim_O
#print axioms Phys.Algebra.imDim_H_eq_ImH
#print axioms Phys.Algebra.imDim_O_eq_ImO
#print axioms Phys.Algebra.channels_C
#print axioms Phys.Algebra.channels_H
#print axioms Phys.Algebra.channels_O
#print axioms Phys.Algebra.channels_O_eq_assoc3NormSq
#print axioms Phys.Algebra.channelTower_n_times_n_sub_one
#print axioms Phys.Algebra.channelTower_distinct
#print axioms Phys.Algebra.channels_O_ne_49
#print axioms Phys.Algebra.channels_H_ne_9
#print axioms Phys.Algebra.channels_C_eq_zero_not_one

-- N315 — ★ BRIDGE: BORN-ISOMETRY COMPLETENESS 42·α = 1 (seeded gauge route A3).
#print axioms Phys.Algebra.chanSelfOverlap_eq
#print axioms Phys.Algebra.assoc3NormSq_as_channel_sum
#print axioms Phys.Algebra.bornWeight_offdiag
#print axioms Phys.Algebra.bornWeight_diag
#print axioms Phys.Algebra.bornWeight_uniform
#print axioms Phys.Algebra.born_isometry_completeness
#print axioms Phys.Algebra.couplingWeight_eq
#print axioms Phys.Algebra.channels_times_coupling
#print axioms Phys.Algebra.born_isometry_completeness_reading
#print axioms Phys.Algebra.couplingWeight_ne_zero
#print axioms Phys.Algebra.couplingWeight_ne_wrong
#print axioms Phys.Algebra.wrong_weight_breaks_completeness
#print axioms Phys.Algebra.bornWeight_diag_ne_offdiag

-- N316 — α* = 1/42 LANDS: THE FINE-STRUCTURE-SCALE COUPLING (seeded gauge route A4).
#print axioms Phys.Algebra.alphaStar_eq
#print axioms Phys.Algebra.alphaStar_reciprocal_completeness
#print axioms Phys.Algebra.inverseAlphaStar_eq_channelCount
#print axioms Phys.Algebra.inverseAlphaStar_eq_42
#print axioms Phys.Algebra.fineStructureScale_reading
#print axioms Phys.Algebra.alphaStar_ne_zero
#print axioms Phys.Algebra.alphaStar_ne_wrong
#print axioms Phys.Algebra.inverseAlphaStar_ne_wrong
#print axioms Phys.Algebra.inverseAlphaStar_channelCount_ne_49

-- N317 — CHIRAL-GENERATION CHARGE TRACE Tr(Q²)=16/3 (seeded gauge route A5, pillar 1).
#print axioms Phys.Algebra.sum_card_sq_three
#print axioms Phys.Algebra.ladderChargeTrace_three
#print axioms Phys.Algebra.generation_charge_trace
#print axioms Phys.Algebra.hyper_ratio_reduction
#print axioms Phys.Algebra.hyperRatio_at
#print axioms Phys.Algebra.weinberg_at
#print axioms Phys.Algebra.assembly_delivers_5_3
#print axioms Phys.Algebra.weinberg_delivers_3_8
#print axioms Phys.Algebra.ladderChargeTrace_two_ne
#print axioms Phys.Algebra.charge_trace_ne_trap
#print axioms Phys.Algebra.hyperRatio_trap_ne
#print axioms Phys.Algebra.chiral_generation_charge_trace_structure

-- N318 — CHIRAL-GENERATION ISOSPIN TRACES Tr(T3²)=2, Tr(Y·T3)=0 → 5/3, sin²θ_W=3/8
--        (seeded gauge route A5 remainder + A6).
#print axioms Phys.Algebra.fund2_traceless
#print axioms Phys.Algebra.fund2_gap_one
#print axioms Phys.Algebra.fund2_per_doublet_trace
#print axioms Phys.Algebra.fund2_trace_forced
#print axioms Phys.Algebra.generation_isospin_trace
#print axioms Phys.Algebra.hyper_isospin_per_doublet
#print axioms Phys.Algebra.hypercharge_isospin_orthogonal
#print axioms Phys.Algebra.generation_hypercharge_trace
#print axioms Phys.Algebra.hyperRatio_lands_5_3
#print axioms Phys.Algebra.weinberg_lands_3_8
#print axioms Phys.Algebra.isospinTrace_no_lepton_ne
#print axioms Phys.Algebra.isospinTrace_triplet_ne
#print axioms Phys.Algebra.hyperRatio_wrong_isospin_ne
#print axioms Phys.Algebra.fund2_nondegenerate
#print axioms Phys.Algebra.chiral_generation_isospin_trace_structure

-- N319 — ONE-COUPLING COHERENCE / ISO-STIFFNESS (seeded gauge route A7, the LAST node of Arc A).
#print axioms Phys.Algebra.oneCouplingMixing_at_5_3
#print axioms Phys.Algebra.oneCouplingMixing_eq_weinberg
#print axioms Phys.Algebra.mixing_grounded
#print axioms Phys.Algebra.oneCouplingMixing_rigid
#print axioms Phys.Algebra.oneCouplingMixing_injective
#print axioms Phys.Algebra.singleCoupling_is_alphaStar
#print axioms Phys.Algebra.one_coupling_coherence
#print axioms Phys.Algebra.oneCouplingMixing_naive_ne
#print axioms Phys.Algebra.oneCouplingMixing_one
#print axioms Phys.Algebra.oneCouplingMixing_wrong_ratio_ne
#print axioms Phys.Algebra.singleCoupling_ne_wrong
#print axioms Phys.Algebra.one_coupling_coherence_structure

-- N320 — DIMENSIONAL TRANSMUTATION `v = M·exp(−c/g²)` structural form (seeded gauge route B1,
--        the FIRST node of Arc B — the scale tower — on the banked derived-ℝ `cutExp`).
#print axioms Phys.Algebra.transmutationRatio_pos
#print axioms Phys.Algebra.transmutationRatio_le_one
#print axioms Phys.Algebra.transmutationRatio_lt_one
#print axioms Phys.Algebra.transmutationScale_lt_M
#print axioms Phys.Algebra.transmutationScale_pos
#print axioms Phys.Algebra.transmutationRatio_mono_c
#print axioms Phys.Algebra.transmutationRatio_mono_g2
#print axioms Phys.Algebra.transmutationRatio_eq_scale_div
#print axioms Phys.Algebra.transmutationRatio_at_alphaStar
#print axioms Phys.Algebra.transmutationRatio_inflation_gt
#print axioms Phys.Algebra.transmutation_form

-- N323 — THE DERIVED TRIGONOMETRIC FUNCTIONS `cutCos`/`cutSin` and the BORN-UNIT-CIRCLE
--        (Pythagorean identity `cutSin²+cutCos²=1`) over the derived ℝ `Cut` from the banked
--        alternating series (seeded arc-D/D1 pulled forward as the arc-B π-prerequisite).
#print axioms Phys.Foundation.ContinuumQ.cosTermC_summable
#print axioms Phys.Foundation.ContinuumQ.sinTermC_summable
#print axioms Phys.Foundation.ContinuumQ.cutCos_hasSum
#print axioms Phys.Foundation.ContinuumQ.cutSin_hasSum
#print axioms Phys.Foundation.ContinuumQ.cutCos_zero
#print axioms Phys.Foundation.ContinuumQ.cutSin_zero
#print axioms Phys.Foundation.ContinuumQ.cutCos_neg
#print axioms Phys.Foundation.ContinuumQ.cutSin_neg
#print axioms Phys.Foundation.ContinuumQ.cosCoeff_summable
#print axioms Phys.Foundation.ContinuumQ.sinCoeff_summable
#print axioms Phys.Foundation.ContinuumQ.cosCoeff_closed
#print axioms Phys.Foundation.ContinuumQ.sinCoeff_closed
#print axioms Phys.Foundation.ContinuumQ.even_choose_eq_odd_choose
#print axioms Phys.Foundation.ContinuumQ.even_choose_eq_odd_choose_cut
#print axioms Phys.Foundation.ContinuumQ.cosCoeff_succ_add_sinCoeff
#print axioms Phys.Foundation.ContinuumQ.cutSin_sq_add_cutCos_sq
#print axioms Phys.Foundation.ContinuumQ.cutSin_sq_add_cutCos_sq_one

-- N324 — THE DERIVED-ℝ TRIG ADDITION FORMULAS (the group law of the Born-circle orbit) and
--        BOUNDEDNESS over the derived ℝ `Cut` (seeded arc-D/D1, the arc-B π-prerequisite's
--        second half; DIRECTED decompose-remainder child of N323).
#print axioms Phys.Foundation.ContinuumQ.sum_range_odd_split_gen
#print axioms Phys.Foundation.ContinuumQ.sum_range_even_split_gen
#print axioms Phys.Foundation.ContinuumQ.ccCoeff_summable
#print axioms Phys.Foundation.ContinuumQ.ssCoeff_summable
#print axioms Phys.Foundation.ContinuumQ.scCoeff_summable
#print axioms Phys.Foundation.ContinuumQ.csCoeff_summable
#print axioms Phys.Foundation.ContinuumQ.cutCos_mul_cutCos
#print axioms Phys.Foundation.ContinuumQ.cutSin_mul_cutSin
#print axioms Phys.Foundation.ContinuumQ.cutSin_mul_cutCos
#print axioms Phys.Foundation.ContinuumQ.cutCos_mul_cutSin
#print axioms Phys.Foundation.ContinuumQ.ccCoeff_closed
#print axioms Phys.Foundation.ContinuumQ.ccCoeff_factored
#print axioms Phys.Foundation.ContinuumQ.ssCoeff_closed
#print axioms Phys.Foundation.ContinuumQ.ssCoeff_factored
#print axioms Phys.Foundation.ContinuumQ.scCoeff_factored
#print axioms Phys.Foundation.ContinuumQ.csCoeff_factored
#print axioms Phys.Foundation.ContinuumQ.cosTermC_add_zero
#print axioms Phys.Foundation.ContinuumQ.cosTermC_add_succ
#print axioms Phys.Foundation.ContinuumQ.sinTermC_add
#print axioms Phys.Foundation.ContinuumQ.cutCos_add
#print axioms Phys.Foundation.ContinuumQ.cutSin_add
#print axioms Phys.Foundation.ContinuumQ.cutCos_sq_le_one
#print axioms Phys.Foundation.ContinuumQ.cutSin_sq_le_one
#print axioms Phys.Foundation.ContinuumQ.cutCos_le_one
#print axioms Phys.Foundation.ContinuumQ.neg_one_le_cutCos
#print axioms Phys.Foundation.ContinuumQ.cutSin_le_one
#print axioms Phys.Foundation.ContinuumQ.neg_one_le_cutSin
#print axioms Phys.Foundation.ContinuumQ.abs_cutCos_le_one
#print axioms Phys.Foundation.ContinuumQ.abs_cutSin_le_one
#print axioms Phys.Foundation.ContinuumQ.cutCos_add_one_one
#print axioms Phys.Foundation.ContinuumQ.cutSin_add_one_one

-- ── N325 ContinuumTrigPi: cutPi (least positive zero of cutCos via IVT) + periodicity ──
#print axioms Phys.Foundation.ContinuumQ.sinAbsSum
#print axioms Phys.Foundation.ContinuumQ.cosAbsSumTail
#print axioms Phys.Foundation.ContinuumQ.sinAbsSum_summable
#print axioms Phys.Foundation.ContinuumQ.cosAbsSumTail_summable
#print axioms Phys.Foundation.ContinuumQ.sinTermC_abs_le_mul
#print axioms Phys.Foundation.ContinuumQ.cosTermC_abs_le_mul
#print axioms Phys.Foundation.ContinuumQ.cutSin_abs_bound
#print axioms Phys.Foundation.ContinuumQ.cutCos_abs_bound
#print axioms Phys.Foundation.ContinuumQ.cutSin_continuousAt_zero
#print axioms Phys.Foundation.ContinuumQ.cutCos_continuousAt_zero
#print axioms Phys.Foundation.ContinuumQ.cutCos_continuous
#print axioms Phys.Foundation.ContinuumQ.cutSin_continuous
#print axioms Phys.Foundation.ContinuumQ.cos2_tail_termbound
#print axioms Phys.Foundation.ContinuumQ.cos2_geo_value
#print axioms Phys.Foundation.ContinuumQ.cutCos_two_neg
#print axioms Phys.Foundation.ContinuumQ.cosZeroSet
#print axioms Phys.Foundation.ContinuumQ.cosZeroSet_nonempty
#print axioms Phys.Foundation.ContinuumQ.cosZeroSet_closed
#print axioms Phys.Foundation.ContinuumQ.cosZeroSet_bddBelow
#print axioms Phys.Foundation.ContinuumQ.leastCosZero
#print axioms Phys.Foundation.ContinuumQ.leastCosZero_mem
#print axioms Phys.Foundation.ContinuumQ.leastCosZero_cos
#print axioms Phys.Foundation.ContinuumQ.leastCosZero_nonneg
#print axioms Phys.Foundation.ContinuumQ.leastCosZero_pos
#print axioms Phys.Foundation.ContinuumQ.cutPi
#print axioms Phys.Foundation.ContinuumQ.cutPi_pos
#print axioms Phys.Foundation.ContinuumQ.cutCos_cutPi_half
#print axioms Phys.Foundation.ContinuumQ.cutSin_cutPi_half_sq
#print axioms Phys.Foundation.ContinuumQ.cutCos_cutPi
#print axioms Phys.Foundation.ContinuumQ.cutSin_cutPi
#print axioms Phys.Foundation.ContinuumQ.cutCos_add_cutPi
#print axioms Phys.Foundation.ContinuumQ.cutSin_add_cutPi
#print axioms Phys.Foundation.ContinuumQ.cutCos_add_two_cutPi
#print axioms Phys.Foundation.ContinuumQ.cutSin_add_two_cutPi
#print axioms Phys.Foundation.ContinuumQ.cutCos_cutPi_eq_neg_one
