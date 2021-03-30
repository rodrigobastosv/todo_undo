import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repeat/cubit/todo_cubit.dart';
import 'package:todo_repeat/model/todo_model.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (ctx, state) {
          if (state is TodoDeleteSuccess) {
            Scaffold.of(ctx).showSnackBar(
              SnackBar(
                content: Text('A Todo was deleted'),
                action: SnackBarAction(
                  label: 'Undo',
                  textColor: Colors.green,
                  onPressed: () => context.read<TodoCubit>().undo(),
                ),
              ),
            );
          }
        },
        builder: (_, state) => TodoList(todos: state.todos),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.read<TodoCubit>().addTodo(),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({Key key, this.todos}) : super(key: key);

  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        leading: Checkbox(
          value: todos[i].isDone,
          onChanged: (checked) {},
        ),
        title: Text(todos[i].title),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => context.read<TodoCubit>().deleteTodo(todos[i]),
        ),
      ),
      itemCount: todos.length,
    );
  }
}
