import AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Data.Set.Basic

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

universe u v w

structure ChemicalSpecies where
  name : String
  formula : String
  concentration : Float

deriving Repr, DecidableEq

structure TheoremSpecificObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String

deriving Repr, DecidableEq

structure UpstreamMathlibSubstrate where
  speciesCarrier : Type u
  speciesSet : Set ChemicalSpecies
  invariantOrGate : Prop
  speciationBridge : Prop
  sourceBoundaryLedger : Set String

structure AdmittedTheoremObject where
  object : TheoremSpecificObject
  substrate : UpstreamMathlibSubstrate
  localWitness : String
  bridgeEvidence : String
  operatorModelChecked : Prop
  operatorModelWitness : operatorModelChecked
  spectralPersistenceBridgeChecked : Prop
  spectralPersistenceBridgeWitness : spectralPersistenceBridgeChecked
  sourceBoundaryLedgerChecked : Prop
  sourceBoundaryLedgerWitness : sourceBoundaryLedgerChecked
  classicalRemainderCarried : formalizationCertificate.sourceConjectureClosureClaimed = false
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

def NativeBridgeClosed (O : AdmittedTheoremObject) : Prop :=
  O.object.sourceKey = sourceRepository ∧
  O.object.theoremObject = sourceDescription ∧
  O.operatorModelChecked ∧
  O.spectralPersistenceBridgeChecked ∧
  O.sourceBoundaryLedgerChecked ∧
  (formalizationCertificate.sourceConjectureClosureClaimed = false)

def ScopedClosure (O : AdmittedTheoremObject) : Prop :=
  NativeBridgeClosed O

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse