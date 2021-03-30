part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  final List<TodoModel> todos;

  TodoState(this.todos);

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {
  TodoInitial(List<TodoModel> todos) : super(todos);

  @override
  List<Object> get props => [
    todos,
  ];
}

class TodoAddSuccess extends TodoState {
  TodoAddSuccess(List<TodoModel> todos) : super(todos);

  @override
  List<Object> get props => [
    todos,
  ];
}

class TodoDeleteSuccess extends TodoState {
  TodoDeleteSuccess(List<TodoModel> todos) : super(todos);

  @override
  List<Object> get props => [
    todos,
  ];
}