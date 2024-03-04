import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featuredbooks_state.dart';

class FeaturedbooksCubit extends Cubit<FeaturedbooksState> {
  FeaturedbooksCubit(this.homeRepo) : super(FeaturedbooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedbooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedbooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(FeaturedbooksSuccess(books));
    });
  }
}
