import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean

structure EquilibriumConstant where
  reactionKey : String
  kValue : Float
  temperature : Float
  ph : Float
  ionicStrength : Float
deriving Repr, DecidableEq

structure ThermodynamicState where
  eqConstants : List EquilibriumConstant
  freeEnergies : List Float
  enthalpyChanges : List Float
  entropyChanges : List Float
deriving Repr, DecidableEq

def primitiveThermodynamicState : ThermodynamicState := {
  eqConstants := [
    { reactionKey := "H2O_H+_OH-", kValue := 1.0e-14, temperature := 298.15, ph := 7.0, ionicStrength := 0.0 },
    { reactionKey := "CO2_H2CO3", kValue := 4.3e-7, temperature := 298.15, ph := 5.6, ionicStrength := 0.01 }
  ],
  freeEnergies := [-237.2, -386.0],
  enthalpyChanges := [-285.8, -413.8],
  entropyChanges := [69.9, 56.5]
}

def ThermodynamicEquilibriumClosed (T : ThermodynamicState) : Prop :=
  T.eqConstants.length > 0 ∧ T.freeEnergies.length = T.eqConstants.length ∧
  T.enthalpyChanges.length = T.eqConstants.length ∧ T.entropyChanges.length = T.eqConstants.length

theorem thermodynamic_equilibrium_closed_checked : ThermodynamicEquilibriumClosed primitiveThermodynamicState := by
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end AnalyticalChemistrySpeciationAnalysisCanonicalLaneLean
end HautevilleHouse