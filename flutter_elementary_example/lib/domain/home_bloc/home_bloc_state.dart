abstract class TodoBlocStates {}

class TodoBlocInitialState extends TodoBlocStates {}

class TodoBlocLoadingState extends TodoBlocStates {}

class TodoBlocLoadedState extends TodoBlocStates {}

class TodoBlocTodoDeletedState extends TodoBlocStates {}

class TodoBlocDeletedState extends TodoBlocStates {}

class TodoBlocDeletingErrorState extends TodoBlocStates {}
