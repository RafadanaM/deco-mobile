import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../common/network/exception.dart';
import '../data/models/book.dart';
import '../data/repositories/books_repository.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final BooksRepository _booksRepository;

  BooksCubit(this._booksRepository) : super(const BooksInitial());

  Future<void> getBooks() async {
    try {
      emit(const BooksLoading());
      final books = await _booksRepository.getBooks();
      emit(BooksLoaded(books));
    } on NetworkException {
      emit(const BooksError());
    }
  }
}
