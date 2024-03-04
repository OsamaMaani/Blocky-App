part of 'featuredbooks_cubit.dart';

abstract class FeaturedbooksState extends Equatable {
  const FeaturedbooksState();

  @override
  List<Object> get props => [];
}

class FeaturedbooksInitial extends FeaturedbooksState {}

class FeaturedbooksLoading extends FeaturedbooksState {}

class FeaturedbooksFailure extends FeaturedbooksState {
  final String errMessage;

  const FeaturedbooksFailure({required this.errMessage});
}

class FeaturedbooksSuccess extends FeaturedbooksState {
  final List<BookModel> books;
  const FeaturedbooksSuccess(this.books);
}
