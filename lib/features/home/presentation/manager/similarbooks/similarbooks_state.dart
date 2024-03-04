part of 'similarbooks_cubit.dart';

abstract class SimilarbooksState extends Equatable {
  const SimilarbooksState();

  @override
  List<Object> get props => [];
}

class SimilarbooksInitial extends SimilarbooksState {}

class SimilarbooksLoading extends SimilarbooksState {}

class SimilarbooksFailure extends SimilarbooksState {
  final String errMessage;

  const SimilarbooksFailure({required this.errMessage});
}

class SimilarbooksSuccess extends SimilarbooksState {
  final List<BookModel> books;

  const SimilarbooksSuccess({required this.books});
}
