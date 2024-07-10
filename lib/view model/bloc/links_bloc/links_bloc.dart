import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/data/repos/links.dart';
import 'package:todo/models/links_model.dart';

part 'links_event.dart';
part 'links_state.dart';

class LinksBloc extends Bloc<LinksEvent, LinksState> {
  LinksBloc() : super(LinksInitial()) {
    on<LoadLinks>(onLoadLinks);
    on<InsertLinks>(onInsertLinks);
    on<DeleteLinks>(onDeleteLinks);
    on<UpdateLinks>(onUpdatelinks);
  }

  FutureOr<void> onLoadLinks(LoadLinks event, Emitter<LinksState> emit) async {
    emit(LinksLoading());
    try {
      List<LinkModel> links = await LinksRepo().readLinks();
      emit(LinksLoaded(links));
    } catch (e) {
      emit(LinksError(e.toString()));
    }
  }

  FutureOr<void> onInsertLinks(

      InsertLinks event,
      Emitter<LinksState> emit) async {
    emit(LinksLoading());
    try {
      await LinksRepo()
          .insertLink(event.title, event.body, event.ownerId, event.link);
      List<LinkModel> links = LinksRepo().readLinks();
      emit(LinksLoaded(links));
    } catch (e) {
      emit(LinksError(e.toString()));
    }
  }

  FutureOr<void> onDeleteLinks(
      DeleteLinks event, Emitter<LinksState> emit) async {
    emit(LinksLoading());
    try {
      await LinksRepo().deleteLink(event.linkId);
      List<LinkModel> links = await LinksRepo().readLinks();
      emit(LinksLoaded(links));
    } catch (e) {
      emit(LinksError(e.toString()));
    }
  }

  FutureOr<void> onUpdatelinks(
      UpdateLinks event, Emitter<LinksState> emit) async {
    emit(LinksLoading());
    try {
      await LinksRepo()
          .updateLink(event.title, event.body, event.ownerId, event.link);
      List<LinkModel> links = LinksRepo().readLinks();
      emit(LinksLoaded(links));
    } catch (e) {
      emit(LinksError(e.toString()));
    }
  }
}
