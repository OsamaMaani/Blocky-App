import 'package:bookly_app/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newstbooks_state.dart';

class NewstbooksCubit extends Cubit<NewstbooksState> {
  NewstbooksCubit(this.homeRepo) : super(NewstbooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewstBooks() async {
    emit(NewstbooksLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold((failure) {
      emit(NewstbooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(NewstbooksSuccess(books: books));
    });
  }
}
