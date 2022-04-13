
import 'package:untitled17/kisilerDurum.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'kisilerDaoRepository.dart';

class kisilerCubit extends Cubit<kisilerDurum>
{
  kisilerRepository kisilerRepo;

  kisilerCubit(this.kisilerRepo) : super(kisilerBaslangicSinifi());

  Future <void> kisileriAlVeTetikle() async
  {
    try
        {
          emit(kisilerYukleniyor());
          var kisiListeCevap = await kisilerRepo.kisileriGetir();
          emit(kisilerYuklendi(kisiListeCevap));
        }
        catch(e)
    {
      emit(kisilerHata("hataMesaji: $e"));
    }
  }


}