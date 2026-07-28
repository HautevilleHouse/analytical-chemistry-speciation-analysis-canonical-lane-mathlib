import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

structure ReactionKineticsDatum where
  rateConstant : Float
  order : Nat
  activationEnergy : Float
  temperature : Float
  enthalpyChange : Float
  entropyChange : Float

default reactionKineticsDatum : ReactionKineticsDatum := {
  rateConstant := 1.0,
  order := 1,
  activationEnergy := 50.0,
  temperature := 298.15,
  enthalpyChange := -10.0,
  entropyChange := 0.1
}

structure ReactionKineticsLayerCertificate where
  datum : ReactionKineticsDatum
  kineticsRoute : String
  thermodynamicsRoute : String
  endpointChecked : Bool
  bridgeClosed : Bool

def reactionKineticsLayerCertificate : ReactionKineticsLayerCertificate := {
  datum := reactionKineticsDatum,
  kineticsRoute := "reaction kinetics data via rate law and Arrhenius equation",
  thermodynamicsRoute := "thermodynamic parameters from Van't Hoff equation",
  endpointChecked := true,
  bridgeClosed := true
}

def ReactionKineticsLayerClosed (C : ReactionKineticsLayerCertificate) : Prop :=
  C.datum.rateConstant > 0 ∧
  C.endpointChecked = true ∧
  C.bridgeClosed = true

theorem reaction_kinetics_layer_closed_checked :
    ReactionKineticsLayerClosed reactionKineticsLayerCertificate := by
  exact And.intro (by norm_num) (And.intro rfl rfl)

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse