import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/cubits/note-Cubit/Notes_states.dart';
import 'package:note_app/cubits/note-Cubit/notes_cubit.dart';
import 'package:note_app/screens/edit_note_page/edit_note_page.dart';
import 'package:note_app/shared/components/my_app_bar.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/note_model.dart';
import '../../shared/components/square_icon_button.dart';

class ViewNotePage extends StatelessWidget {
  const ViewNotePage({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              MyAppBar(
                title: 'note.title',
                icon: Icons.edit,
                iconAction: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: EditNotePage(noteModel: note),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                },
                iconColor: Colors.tealAccent,
                hasLeading: true,
              ),
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          for (int i = 1; i <= 15; i++) LineWidget(),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                      child: Text(
                        'this is body',
                        style: Theme.of(context).textTheme.bodyMedium!.merge(
                              const TextStyle(
                                height: 1.5,
                                // fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareIconButton(
                      onPressed: () {},
                      icon: Icons.push_pin_rounded,
                      forgroundColor: Colors.lightGreen,
                      size: 50.w,
                      borderWidth: 0.5,
                    ),
                    SizedBox(width: 50.w),
                    SquareIconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: EditNotePage(
                              noteModel: note,
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      icon: Icons.edit,
                      forgroundColor: Colors.tealAccent,
                      size: 50.w,
                      borderWidth: 0.5,
                    ),
                    SizedBox(width: 50.w),
                    SquareIconButton(
                      onPressed: () {},
                      icon: Icons.delete_rounded,
                      forgroundColor: Colors.deepOrangeAccent,
                      size: 50.w,
                      borderWidth: 0.5,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class LineWidget extends StatelessWidget {
  const LineWidget({
    super.key,
    this.space = 22,
  });

  final double space;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      margin: EdgeInsets.only(top: space.h),
      color: Colors.white.withOpacity(0.2),
    );
  }
}
