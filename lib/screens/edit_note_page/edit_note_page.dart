import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/cubits/note-Cubit/Notes_states.dart';
import 'package:note_app/cubits/note-Cubit/notes_cubit.dart';
import 'package:note_app/layout/home.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/edit_note_page/edite_note_input.dart';
import 'package:note_app/screens/view_note_page/view_note_page.dart';
import 'package:note_app/shared/components/elevated_button.dart';
import 'package:note_app/shared/components/square_icon_button.dart';
import 'package:page_transition/page_transition.dart';

class EditNotePage extends StatelessWidget {
  EditNotePage({super.key, required this.note});

  NoteModel note;

  late var title = TextEditingController(text: note.title);
  late var body = TextEditingController(text: note.body);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
            backgroundColor: Color(0xff060E18),
            title: Text('Edit note'),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 20.w,
                  top: 5.h,
                  bottom: 5.h,
                ),
                child: SquareIconButton(
                  onPressed: () {
                    BlocProvider.of<NotesCubit>(context).editNote(
                      data: {
                        'id' : note.id ,
                        'title' : title.text ,
                        'body' : body.text ,
                      },
                    );
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Home(),
                        type: PageTransitionType.topToBottom,
                      ),
                    );
                  },
                  icon: Icons.save,
                  forgroundColor: Colors.green,
                  size: 40.w,
                  borderWidth: 0.5,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  EditTextInput(
                    controller: title,
                    hintText: note.title,
                    errorMessage: '',
                    isTitle: true,
                  ),
                  EditTextInput(
                    controller: body,
                    hintText: note.body,
                    errorMessage: '',
                    isTitle: false,
                    maxLines: 10,
                  ),
                  SizedBox(height: 100.h),
                  Center(
                    child: MyButton(
                      title: 'Save',
                      onPressed: () {
                        BlocProvider.of<NotesCubit>(context).editNote(
                          data: {
                            'id' : note.id ,
                            'title' : title.text ,
                            'body' : body.text ,
                          },
                        );
                        Navigator.push(
                          context,
                          PageTransition(
                            child: Home(),
                            type: PageTransitionType.topToBottom,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
