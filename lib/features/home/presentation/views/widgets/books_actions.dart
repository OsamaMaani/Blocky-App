import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () async {
              Uri uri = Uri.parse(bookModel.volumeInfo!.previewLink!);
              if (!await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            text: r"Free",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                12,
              ),
              bottomLeft: Radius.circular(
                12,
              ),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {},
            text: r"Free Preview",
            backgroundColor: const Color(0xffef8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(
                12,
              ),
              bottomRight: Radius.circular(
                12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
