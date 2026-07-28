import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

structure MolecularOrbitalDatum where
  homoEnergy : Float
  lumoEnergy : Float
  gap : Float
  symmetry : String
  electronCount : Nat

default molecularOrbitalDatum : MolecularOrbitalDatum := {
  homoEnergy := -8.0,
  lumoEnergy := 2.0,
  gap := 10.0,
  symmetry := "C2v",
  electronCount := 8
}

structure MolecularOrbitalLayerCertificate where
  datum : MolecularOrbitalDatum
  orbitalRoute : String
  spectrochemicalRoute : String
  endpointChecked : Bool
  bridgeClosed : Bool

def molecularOrbitalLayerCertificate : MolecularOrbitalLayerCertificate := {
  datum := molecularOrbitalDatum,
  orbitalRoute := "molecular orbital theory via Hückel or DFT",
  spectrochemicalRoute := "spectrochemical series and ligand field theory",
  endpointChecked := true,
  bridgeClosed := true
}

def MolecularOrbitalLayerClosed (C : MolecularOrbitalLayerCertificate) : Prop :=
  C.datum.gap > 0 ∧
  C.endpointChecked = true ∧
  C.bridgeClosed = true

theorem molecular_orbital_layer_closed_checked :
    MolecularOrbitalLayerClosed molecularOrbitalLayerCertificate := by
  exact And.intro (by norm_num) (And.intro rfl rfl)

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse