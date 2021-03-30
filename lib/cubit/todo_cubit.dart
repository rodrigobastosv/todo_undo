import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';
import 'package:replay_bloc/replay_bloc.dart';
import 'package:todo_repeat/model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends ReplayCubit<TodoState> {
  TodoCubit() : super(TodoInitial([]));

  void addTodo() {
    final newTodo = TodoModel(
      id: Faker().randomGenerator.integer(9999),
      title: Faker().lorem.sentence(),
      isDone: Faker().randomGenerator.boolean(),
    );
    final todos = state.todos;
    final newTodos = [
      ...todos,
      newTodo,
    ];
    emit(TodoAddSuccess(newTodos));
  }

  void deleteTodo(TodoModel todo) {
    final newTodos = [
      ...state.todos,
    ];
    newTodos.remove(todo);
    emit(TodoDeleteSuccess(newTodos));
  }
}
