part of 'newstbooks_cubit.dart';

abstract class NewstbooksState extends Equatable {
  const NewstbooksState();

  @override
  List<Object> get props => [];
}

class NewstbooksInitial extends NewstbooksState {}

class NewstbooksLoading extends NewstbooksState {}

class NewstbooksSuccess extends NewstbooksState {
  final List<BookModel> books;

  const NewstbooksSuccess({required this.books});
}

class NewstbooksFailure extends NewstbooksState {
  final String errMessage;

  const NewstbooksFailure({required this.errMessage});
}
