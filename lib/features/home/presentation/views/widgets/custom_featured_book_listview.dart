import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featuredbooks_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedbooksCubit, FeaturedbooksState>(
      builder: (context, state) {
        if (state is FeaturedbooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is FeaturedbooksSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailsView,
                          extra: state.books[index],
                        );
                      },
                      child: CustomBookImage(
                        imgURL: state
                            .books[index].volumeInfo!.imageLinks!.thumbnail!,
                      ),
                    ));
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
