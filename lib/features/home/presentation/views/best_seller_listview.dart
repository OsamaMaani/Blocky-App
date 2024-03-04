import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/newst_books_cubit/newstbooks_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_Seller_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewstbooksCubit, NewstbooksState>(
      builder: (context, state) {
        if (state is NewstbooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else if (state is NewstbooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BookListViewItem(
                bookModel: state.books[index],
              ),
            ),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
