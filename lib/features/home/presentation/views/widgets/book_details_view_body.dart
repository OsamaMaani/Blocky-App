import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/similarbooks/similarbooks_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_detail_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                const CustomBookDetailAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .15),
                  child: CustomBookImage(
                    imgURL: bookModel.volumeInfo!.imageLinks!.thumbnail!,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  bookModel.volumeInfo!.title!,
                  style: Styles.textStyle30,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  bookModel.volumeInfo!.authors![0],
                  style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 18,
                ),
                const BookRating(
                  rating: 3,
                  count: 123,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                BooksAction(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SimilarBooksListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarbooksCubit, SimilarbooksState>(
      builder: (context, state) {
        if (state is SimilarbooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SimilarbooksSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .15,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomBookImage(
                        imgURL: state
                            .books[index].volumeInfo!.imageLinks!.thumbnail!,
                      ),
                    )),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
