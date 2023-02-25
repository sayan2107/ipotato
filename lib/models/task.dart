import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  const TaskModel({
    required this.title,
    this.description = "",
    required this.duration,
  });

  final String title;
  final String description;
  final Duration duration;

  @override
  List<Object> get props => [title, description, duration];

  @override
  bool get stringify => true;
}
