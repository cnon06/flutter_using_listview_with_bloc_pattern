import 'package:untitled17/Kisiler.dart';

abstract class kisilerDurum
{
  kisilerDurum();
}

class kisilerBaslangicSinifi extends kisilerDurum
{
kisilerBaslangicSinifi();
}

class kisilerYukleniyor extends kisilerDurum
{
  kisilerYukleniyor();
}

class kisilerYuklendi extends kisilerDurum
{
  List <Kisiler> kisiListesi;
  kisilerYuklendi(this.kisiListesi);
}

class kisilerHata extends kisilerDurum
{
  String hataMesaji;
  kisilerHata(this.hataMesaji);
}