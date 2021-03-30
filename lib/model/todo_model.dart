import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  TodoModel({
    this.id,
    this.title,
    this.isDone,
  });

  final int id;
  final String title;
  final bool isDone;

  @override
  List<Object> get props => [
        id,
      ];
}
