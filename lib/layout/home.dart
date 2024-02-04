import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/cubits/note-Cubit/Notes_states.dart';
import 'package:note_app/cubits/note-Cubit/notes_cubit.dart';
import 'package:note_app/layout/bottom_sheet.dart';
import 'package:note_app/layout/floating_action_button.dart';
import 'package:note_app/layout/note_item.dart';
import 'package:note_app/layout/notes_view.dart';
import 'package:note_app/shared/components/my_app_bar.dart';
import '../shared/styles/style_constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Scaffold(
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              MyAppBar(
                title: 'My notes',
                icon: Icons.line_weight_sharp,
                iconAction: () {},
              ),
              cubit.notes.length > 0
                  ? NotesView(notes: cubit.notes)
                  : EmptyImage(),
            ],
          ),
          floatingActionButton: SquareFloatinButton(),
        );
      },
    );
  }
}

class EmptyImage extends StatelessWidget {
  const EmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Image(
          width: 100.w,
          image: AssetImage('assets/images/empty2.png'),
          color: const Color(0xffF7F7F7),
        ),
      ),
    );
  }
}
