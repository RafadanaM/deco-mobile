import '../../../common/network/exception.dart';
import '../models/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooks();
}

class BooksRepositoryImpl implements BooksRepository {
  @override
  Future<List<Book>> getBooks() {
    try {
      return Future.delayed(const Duration(seconds: 3), (() {
        final books = List<Book>.of([
          const Book(id: 1, title: "Book A"),
          const Book(id: 2, title: "Book B")
        ]);
        return books;
      }));
    } catch (e) {
      throw NetworkException();
    }
  }
}
