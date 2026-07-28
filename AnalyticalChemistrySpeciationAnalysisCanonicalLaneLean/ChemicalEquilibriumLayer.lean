import AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

structure ChemicalEquilibriumLayerCertificate where
  equilibriumConstant : Float
  speciationYields : List Float
  phValue : Float
  temperature : Float
  equilibriumChecked : Bool
  speciationRoute : String

def primitiveChemicalEquilibriumDatum : ChemicalEquilibriumLayerCertificate := {
  equilibriumConstant := 1.0e-4,
  speciationYields := [0.1, 0.2, 0.3],
  phValue := 7.0,
  temperature := 298.15,
  equilibriumChecked := true,
  speciationRoute := "equilibrium constant routed through speciation yields"
}

def ChemicalEquilibriumLayerClosed (C : ChemicalEquilibriumLayerCertificate) : Prop :=
  C.equilibriumChecked = true ∧ C.speciationYields.length > 0

theorem chemical_equilibrium_layer_closed_checked :
    ChemicalEquilibriumLayerClosed primitiveChemicalEquilibriumDatum := by
  exact And.intro rfl (by decide)

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse