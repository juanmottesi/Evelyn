Class {
	#name : #TravelingSalesmanSelectionTest,
	#superclass : #TestCase,
	#instVars : [
		'citiesFactory'
	],
	#category : 'TravelingSalesmanProblem-Tests'
}

{ #category : #initialization }
TravelingSalesmanSelectionTest >> setUp [
	citiesFactory := CityFactory new
]

{ #category : #initialization }
TravelingSalesmanSelectionTest >> testSortIndivicuals [

	| sortedIndividuals bestSolution secondSolution thirdSolution |

	bestSolution := RoadMap
		touringThrough:
			(OrderedCollection
				with: citiesFactory buenosAires
				with: citiesFactory villaCarlosPaz
				with: citiesFactory aconcagua
				with: citiesFactory ushuaia).
	secondSolution := RoadMap
		touringThrough:
			(OrderedCollection
				with: citiesFactory buenosAires
				with: citiesFactory aconcagua
				with: citiesFactory villaCarlosPaz
				with: citiesFactory ushuaia).
	thirdSolution := RoadMap
		touringThrough:
			(OrderedCollection
				with: citiesFactory buenosAires
				with: citiesFactory aconcagua
				with: citiesFactory ushuaia
				with: citiesFactory villaCarlosPaz).
	sortedIndividuals := (TravelingSalesmanSelectionStrategy surviving: 40 / 100) sortByFitness: (OrderedCollection with: secondSolution with: thirdSolution with: bestSolution).
	self
		assert: (sortedIndividuals at: 1) equals: bestSolution;
		assert: (sortedIndividuals at: 2) equals: secondSolution;
		assert: (sortedIndividuals at: 3) equals: thirdSolution
]
