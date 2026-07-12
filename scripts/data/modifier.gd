class_name Modifier
extends Resource

enum Effect {
	GOBLINS_PER_CLICK,
	GOBLINS_PER_SECOND,
	INFLUENCE_PER_GOBLIN,
	RUN_DURATION,
	EXPEDITIONS
}

enum Operation {
	ADD,
	SUBTRACT,
	MULTIPLY,
	UNLOCK
}

enum Target {
	SELF,
	KINGDOM,
	CAMPAIGN
}

@export var effect: Effect
@export var operation: Operation
@export var target: Target
@export var enabled: bool = true
@export var value: float = 0
