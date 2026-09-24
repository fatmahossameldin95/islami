import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/tabs/quran_tab/sura_details_screen.dart';

class SurasListView extends StatelessWidget {
  const SurasListView({super.key, required this.searchText});
  final String searchText;
  @override
  Widget build(BuildContext context) {
    List<SuraModel> suras = SuraModel.allSuras;

    suras = suras
        .where(
          (element) =>
              element.suraNameAr.contains(searchText) || element.suraNameEn.contains(searchText),
        )
        .toList();
    return suras.isEmpty
        ? Expanded(
            child: Center(
              child: Text(
                "No suras found!!",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Suras List",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => drawSuraTile(context, suras[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(color: Colors.white, indent: 44, endIndent: 44),
                    itemCount: suras.length,
                  ),
                ),
              ],
            ),
          );
  }

  Widget drawSuraTile(BuildContext context, SuraModel suraModel) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName, arguments: suraModel);
      },
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(Assets.images.suraStar),
          Text(
            (suraModel.id),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
      title: Text(
        suraModel.suraNameEn,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Text(
        '${suraModel.ayasCount} Verses',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      trailing: Text(
        suraModel.suraNameAr,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
