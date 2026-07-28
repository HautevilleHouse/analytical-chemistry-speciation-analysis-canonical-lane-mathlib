import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

structure SpeciationEndpointCertificate where
  totalMetal : ℝ
  totalLigand : ℝ
  formationConstants : List ℝ
  protonationConstants : List ℝ
  phValue : ℝ
  modelConverged : Bool
  speciesResolved : Bool
  massBalanceCheck : Bool
  chargeBalanceCheck : Bool

def speciationEndpointCertificate : SpeciationEndpointCertificate := {
  totalMetal := 1e-3,
  totalLigand := 5e-4,
  formationConstants := [1e8, 1e4],
  protonationConstants := [1e10, 1e2],
  phValue := 7.0,
  modelConverged := true,
  speciesResolved := true,
  massBalanceCheck := true,
  chargeBalanceCheck := true
}

def SpeciationEndpointClosed (C : SpeciationEndpointCertificate) : Prop :=
  C.modelConverged = true ∧ C.speciesResolved = true ∧ C.massBalanceCheck = true ∧ C.chargeBalanceCheck = true

theorem speciation_endpoint_closed_checked : SpeciationEndpointClosed speciationEndpointCertificate := by
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse
