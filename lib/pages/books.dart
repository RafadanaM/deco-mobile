import 'package:flutter/material.dart';
import 'package:flutter_application_1/books/components/book_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../books/bloc/books_cubit.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksCubit, BooksState>(
        bloc: BlocProvider.of<BooksCubit>(context)..getBooks(),
        builder: (context, state) {
          if (state is BooksLoading) {
            return ListView.builder(
                itemCount: (MediaQuery.of(context).size.height / 84.0).floor(),
                itemBuilder: (context, index) => const BookCard.loading());
          } else if (state is BooksLoaded) {
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) =>
                  BookCard(title: state.books[index].title),
            );
          } else {
            return const Center(
              child: Text("Empty"),
            );
          }
        },
        listener: (context, state) {
          if (state is BooksError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Error"),
              ),
            );
          }
        });
  }
}
