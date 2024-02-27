import 'package:bookly_app/features/home/presentation/views/widgets/custom_listview_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.only(right: 8),
              child: FeaturedListViewItem());
        },
      ),
    );
  }
}
