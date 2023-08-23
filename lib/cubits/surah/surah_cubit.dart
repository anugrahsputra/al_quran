import 'package:al_quran/models/surah_model.dart';
import 'package:al_quran/services/surah_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  late SurahModel surahModel;
  SurahCubit() : super(SurahInitial()) {
    getSurahs();
  }

  void getSurahs() async {
    try {
      emit(SurahLoading());
      surahModel = await SurahService().getSurahs();
      emit(SurahLoaded(surahModel));
    } catch (e) {
      emit(SurahError(e.toString()));
    }
  }

  getSurahsData() {
    return surahModel;
  }
}
