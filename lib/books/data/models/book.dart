import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String title;

  const Book({required this.id, required this.title});

  @override
  List<Object> get props => [id];
}
