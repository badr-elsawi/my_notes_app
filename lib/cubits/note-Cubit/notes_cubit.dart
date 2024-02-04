import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/note-Cubit/Notes_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/shared/constants.dart';
import 'package:note_app/shared/http_service/http_service.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());

  static NotesCubit get(context) => BlocProvider.of(context);



  List<NoteModel> notes = [];

  void getNotes() {
    emit(GetNotesLoadingState());
    HttpServices.getData(
      url: notesEndpoint,
      query: {},
    ).then(
      (value) {
        value.data.forEach(
          (element) {
            notes.add(NoteModel.fromJson(element));
          },
        );
        emit(GetNotesSuccessState());
      },
    ).catchError(
      (error) {
        emit(GetNotesErrorState(error));
      },
    );
  }
}
