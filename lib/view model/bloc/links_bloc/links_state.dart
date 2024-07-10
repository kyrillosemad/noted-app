part of 'links_bloc.dart';

@immutable
sealed class LinksState {} 

final class LinksInitial extends LinksState {}

class LinksLoading extends LinksState {}

class LinksLoaded extends LinksState {
  final List<LinkModel> links;
  LinksLoaded(this.links); 
}

class LinksError extends LinksState {
  final String msg;
  LinksError(this.msg);
}
