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

  void addNote({
    required String title,
    required String body,
  }) async {
    emit(AddNoteLoadingState());
    String formatedDate = DateFormat.yMd().format(DateTime.now()).toString();
    try {
      await HttpServices.postData(
        url: notesEndpoint,
        data: {
          'title': title,
          'body': body,
          'date': formatedDate,
        },
      );
      emit(AddNoteSuccessState());
      getNotes();
    } catch (error) {
      emit(AddNoteErrorState(error.toString()));
    }
  }

  List<NoteModel> notes = [];

  void getNotes() {
    emit(GetNotesLoadingState());
    List<NoteModel> myNotes = [];
    HttpServices.getData(
      url: notesEndpoint,
      query: {},
    ).then(
      (value) {
        value.data.forEach(
          (element) {
            myNotes.add(NoteModel.fromJson(element));
          },
        );
        notes = myNotes;
        emit(GetNotesSuccessState());
      },
    ).catchError(
      (error) {
        emit(GetNotesErrorState(error));
      },
    );
  }
}
