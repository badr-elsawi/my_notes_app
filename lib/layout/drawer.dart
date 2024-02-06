import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/cubits/note-Cubit/notes_cubit.dart';
import 'package:note_app/layout/bottom_sheet.dart';
import 'package:note_app/layout/notes_filter.dart';
import 'package:note_app/screens/trash_page/trash_page.dart';
import 'package:note_app/shared/components/square_icon_button.dart';
import 'package:page_transition/page_transition.dart';

import '../models/note_model.dart';
import '../screens/view_note_page/view_note_page.dart';
import '../shared/styles/style_constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.pinned,
  });

  final List<NoteModel> pinned;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 20.w,
          end: 20.w,
          top: 5.h,
          bottom: 15.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pinned Notes',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 500.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    PinnedNoteItem(note: pinned[index]),
                separatorBuilder: (context, index) => SizedBox(height: 7.h),
                itemCount: pinned.length,
              ),
            ),
            SizedBox(height: 3.h),
            Divider(
              height: 3.h,
              color: const Color(0xffF7F7F7),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: TrashPage(
                      notes: filterNotes(
                        filter: 'in_trash',
                        notes: BlocProvider.of<NotesCubit>(context).notes,
                      ),
                    ),
                    type: PageTransitionType.bottomToTop,
                  ),
                );
              },
              contentPadding: EdgeInsets.all(0),
              leading: SquareIconButton(
                onPressed: () {},
                icon: Icons.delete_rounded,
                forgroundColor: Colors.deepOrangeAccent,
                size: 40.w,
                borderWidth: 1.5,
              ),
              title: Text(
                'Trash',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PinnedNoteItem extends StatelessWidget {
  const PinnedNoteItem({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: InkWell(
        borderRadius: BorderRadius.circular(20).w,
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: ViewNotePage(note: note),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        child: Container(
          padding: EdgeInsetsDirectional.only(
            start: StyleConstants.defaultHPadding.w,
            end: StyleConstants.defaultHPadding.w,
            top: 10.h,
            bottom: 10.h,
          ),
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(StyleConstants.borderRadius).w,
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Color(0xff109242).withOpacity(0.8),
                Color(0xff6BBA50).withOpacity(0.8),
                // Colors.transparent,
                // Colors.teal.withOpacity(0.1),
              ],
            ),
          ),
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
              Spacer(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  note.date,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
