import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_text_field_search.dart';
import 'package:flutter/material.dart';

import 'search_result_listview.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            "Best Seller",
            style: Styles.textStyle18,
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
