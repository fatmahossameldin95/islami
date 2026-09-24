import 'package:islami/data/suras_names.dart';

class SuraModel {
  final String id;
  final String suraNameAr;
  final String suraNameEn;
  final String ayasCount;

  SuraModel({
    required this.suraNameAr,
    required this.suraNameEn,
    required this.ayasCount,
    required this.id,
  });

  static List<SuraModel> get allSuras {
    List<SuraModel> dataList = [];

    for (int i = 0; i < SurasData.arabicQuranSuras.length; i++) {
      SuraModel obj = SuraModel(
        ayasCount: SurasData.ayaNumber[i],
        id: (i + 1).toString(),
        suraNameAr: SurasData.arabicQuranSuras[i],
        suraNameEn: SurasData.englishQuranSurahs[i],
      );

      dataList.add(obj);
    }

    return dataList;
  }
}
