part of 'links_bloc.dart';

@immutable
abstract class LinksEvent {}

class LoadLinks extends LinksEvent {}

class InsertLinks extends LinksEvent {
  final String title;
  final String body;
  final String ownerId;
  final String link;
  InsertLinks(this.title, this.body, this.ownerId, this.link);
}

class DeleteLinks extends LinksEvent {
  final String linkId;
  DeleteLinks(this.linkId);
}

class UpdateLinks extends LinksEvent {
  final String title;
  final String body;
  final String ownerId;
  final String link;
  UpdateLinks(this.title, this.body, this.ownerId, this.link);
}
