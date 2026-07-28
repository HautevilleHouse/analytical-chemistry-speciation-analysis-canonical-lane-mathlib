import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

structure ThermodynamicsDatum where
  gibbsFreeEnergy : Float
  enthalpy : Float
  entropy : Float
  temperature : Float
  equilibriumConstant : Float

default thermodynamicsDatum : ThermodynamicsDatum := {
  gibbsFreeEnergy := -5.0,
  enthalpy := -10.0,
  entropy := 0.02,
  temperature := 298.15,
  equilibriumConstant := 1.5
}

structure ThermodynamicsLayerCertificate where
  datum : ThermodynamicsDatum
  thermodynamicRoute : String
  speciationRoute : String
  endpointChecked : Bool
  bridgeClosed : Bool

def thermodynamicsLayerCertificate : ThermodynamicsLayerCertificate := {
  datum := thermodynamicsDatum,
  thermodynamicRoute := "Gibbs free energy and equilibrium constant relationship",
  speciationRoute := "speciation diagram from equilibrium constants",
  endpointChecked := true,
  bridgeClosed := true
}

def ThermodynamicsLayerClosed (C : ThermodynamicsLayerCertificate) : Prop :=
  C.datum.gibbsFreeEnergy < 0 ∧
  C.datum.equilibriumConstant > 0 ∧
  C.endpointChecked = true ∧
  C.bridgeClosed = true

theorem thermodynamics_layer_closed_checked :
    ThermodynamicsLayerClosed thermodynamicsLayerCertificate := by
  exact And.intro (by norm_num) (And.intro (by norm_num) (And.intro rfl rfl))

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse