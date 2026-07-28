import canonicalLaneMathlib.AdmissibleClass
import FormalizationCertificate

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def AnalyticalChemistryConstraintClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ FormalizationLayersClosed formalizationCertificate

theorem analytical_chemistry_constraint_closure (A : AdmissibleClass) : AnalyticalChemistryConstraintClosure A := by
  exact And.intro (bridge_from_admissible_class A) (And.intro (gate_from_admissible_class A) formalization_layers_closed_checked)

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse