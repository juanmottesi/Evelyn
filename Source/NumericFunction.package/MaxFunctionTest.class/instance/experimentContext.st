tests
experimentContext

	^ EvolutionaryAlgorithmContext
		selectingSurvivorsWith: MaxNumericSurvivorsSelectionStrategy new
		parentsWith: ParentSelectionStrategy new
		crossingOverWith: NumericCrossOverStrategy new
		mutatingWith: (PluggableIndividualMutationStrategy creatingMutationsByMeansOf: NumericMutator)
		stoppingCriteria: [ :aGeneration | aGeneration number > 100 ]
		createGenerationWith: EvolutionaryAlgorithmGenerationBuilder new