import 'package:bloc/bloc.dart';
import 'package:note_app/cubits/app_cubit/app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
}