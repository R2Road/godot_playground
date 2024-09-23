class_name script___object_helper extends RefCounted



var functor : Callable



func do()->void:
	if functor:
		functor.call()
