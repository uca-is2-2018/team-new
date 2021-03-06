Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testCreatingDeterministDiceWithInvalidSequenceNumber [
	| dice |
	self
		should: [ dice := Dice deterministicWithFaces: 3 throwing: #(1 2 5) ]
		raise: MatchException
		withExceptionDo: [ :exception | 
			self assert: exception messageText equals: 'The sequence can not have a number bigger than amount of faces' ]
]

{ #category : #tests }
DiceTest >> testCreatingDeterministicDiceWithAnEmptySequence [
	| dice |
	self should: [ dice := Dice deterministicWithFaces: 5 throwing: {  } ]
	raise: MatchException 
	withExceptionDo: [ :exception | self assert:  exception messageText equals: 'Sequence must have at least one number']
]

{ #category : #tests }
DiceTest >> testCreatingRandomDiceWithAmountOfFacesNoValid [
	| dice |
	self
		should: [ dice := Dice randomWithFaces: -3 ]
		raise: MatchException
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'you can not create a dice with less than 1 face' ]
]

{ #category : #tests }
DiceTest >> testDeterministicDiceRollsReturnExpectedNumber [
	| dice |
	dice := Dice deterministicWithFaces: 4 throwing: #(1 2 3 4).
	self
		assert: dice roll equals: 1;
		assert: dice roll equals: 2;
		assert: dice roll equals: 3;
		assert: dice roll equals: 4;
		assert: dice roll equals: 1
]

{ #category : #tests }
DiceTest >> testDeterministicDiceRollsValidAmountAccordingToTheAmountOfFaces [
	| dice |
	dice := Dice deterministicWithFaces: 3 throwing: #(1 2 3).
	self assert: dice roll <= 3
]

{ #category : #tests }
DiceTest >> testRandomDiceRollsAValidAmountAccordingToTheAmountOfFaces [
	| dice |
	dice := Dice randomWithFaces: 6.
	self
		assert: (dice roll between: 1 and: 6);
		assert: (dice roll between: 1 and: 6);
		assert: (dice roll between: 1 and: 6);
		assert: (dice roll between: 1 and: 6);
		assert: (dice roll between: 1 and: 6)
]
