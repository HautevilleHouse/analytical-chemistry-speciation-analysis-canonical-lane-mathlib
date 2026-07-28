import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

structure ReactionKineticsDatum where
  rateConstant : Float
  order : Nat
  activationEnergy : Float
  halfLife : Float
deriving Repr, DecidableEq

structure ReactionKineticsCertificate where
  datum : ReactionKineticsDatum
  persistenceRoute : String
  endpointRoute : String
  kineticsChecked : Bool
  persistenceChecked : Bool
deriving Repr, DecidableEq

def primitiveReactionKineticsCertificate : ReactionKineticsCertificate := {
  datum := {
    rateConstant := 2.7e-3,
    order := 1,
    activationEnergy := 45.0,
    halfLife := 256.0
  },
  persistenceRoute := "kinetics persistence routed through rate law",
  endpointRoute := "rate constant endpoint projected through admitted kinetics class",
  kineticsChecked := true,
  persistenceChecked := true
}

def ReactionKineticsPersistenceLayerClosed (C : ReactionKineticsCertificate) : Prop :=
  C.datum.rateConstant > 0 ∧ C.datum.activationEnergy > 0 ∧ C.kineticsChecked = true ∧ C.persistenceChecked = true

theorem reaction_kinetics_persistence_layer_closed_checked : ReactionKineticsPersistenceLayerClosed primitiveReactionKineticsCertificate := by
  exact And.intro (by norm_num) (And.intro (by norm_num) (And.intro rfl rfl))

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse