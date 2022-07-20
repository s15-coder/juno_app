import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light);

  void switchTheme() {
    if (state == ThemeState.dark) {
      emit(ThemeState.light);
    } else {
      emit(ThemeState.dark);
    }
  }
}
