import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/shared/components/square_icon_button.dart';

import '../../cubits/note-Cubit/notes_cubit.dart';
import '../../models/note_model.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({
    super.key,
    required this.notes,
  });

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_drop_down),
        ),
        backgroundColor: Color(0xff060E18),
        title: Text('Trash'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => TrashItem(note: notes[index]),
        separatorBuilder: (context, index) => Container(height: 15.h),
        itemCount: notes.length,
      ),
    );
  }
}

class TrashItem extends StatelessWidget {
  const TrashItem({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        note.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  note.body,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SquareIconButton(
            onPressed: () {
              BlocProvider.of<NotesCubit>(context).editNote(
                data: {
                  'id': note.id,
                  'in_trash': note.inTrash,
                },
              );
              Navigator.pop(context);
            },
            icon: Icons.refresh_rounded,
            forgroundColor: Colors.green,
            size: 40,
            borderWidth: 1,
          ),
          SizedBox(
            width: 20.w,
          ),
          SquareIconButton(
            onPressed: () {
              BlocProvider.of<NotesCubit>(context).deleteNote(
                data: {
                  'id': note.id,
                  'in_trash': note.inTrash,
                },
              );
              Navigator.pop(context);
            },
            icon: Icons.delete_rounded,
            forgroundColor: Colors.deepOrangeAccent,
            size: 40,
            borderWidth: 1,
          ),
        ],
      ),
    );
  }
}
