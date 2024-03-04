import 'package:bookly_app/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similarbooks_state.dart';

class SimilarbooksCubit extends Cubit<SimilarbooksState> {
  SimilarbooksCubit(this.homeRepo) : super(SimilarbooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks(String category) async {
    emit(SimilarbooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarbooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SimilarbooksSuccess(books: books));
    });
  }
}
