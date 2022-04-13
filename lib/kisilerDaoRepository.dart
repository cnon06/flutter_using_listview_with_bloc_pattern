import 'package:untitled17/Kisiler.dart';

abstract class kisilerRepository
{
  Future<List<Kisiler>> kisileriGetir();
}

class kisilerDaoRepository implements kisilerRepository
{
  @override
  Future<List<Kisiler>> kisileriGetir() async {
    var kisiListesi = <Kisiler>[];
    kisiListesi.add(Kisiler("1","Ahmet","111111"));
    kisiListesi.add(Kisiler("2","Mehmet","222222"));

    return kisiListesi;

  }

}