import HautevilleHouse.AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean.SpeciationEndpointLayer

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

structure SpeciationAdmittedObject where
  certificate : SpeciationEndpointCertificate
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : SpeciationAdmittedObject) : Prop :=
  SpeciationEndpointClosed A.certificate

def gateClosed (A : SpeciationAdmittedObject) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_speciation_object (A : SpeciationAdmittedObject) (h : SpeciationEndpointClosed A.certificate) : bridgeClosed A := h

theorem gate_from_speciation_object (A : SpeciationAdmittedObject) : gateClosed A :=
  A.gateWitness

def SpeciationClosure (A : SpeciationAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

def speciationAdmittedObject : SpeciationAdmittedObject := {
  certificate := speciationEndpointCertificate,
  endpointSatisfied := SpeciationEndpointClosed speciationEndpointCertificate,
  remainderRecorded := False,
  gateWitness := Or.inl (speciation_endpoint_closed_checked : SpeciationEndpointClosed speciationEndpointCertificate)
}

theorem speciation_closure_checked : SpeciationClosure speciationAdmittedObject := by
  have hBridge : bridgeClosed speciationAdmittedObject := speciation_endpoint_closed_checked
  have hGate : gateClosed speciationAdmittedObject := speciationAdmittedObject.gateWitness
  exact And.intro hBridge hGate

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse
