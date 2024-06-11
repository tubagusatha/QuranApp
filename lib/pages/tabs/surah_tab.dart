import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remake_quran_app/model/surah_model.dart';
import 'package:remake_quran_app/pages/detail_screen.dart';
import 'package:remake_quran_app/theme.dart';
import 'package:remake_quran_app/viewmodel/surah_viewmodel.dart';

class TabSurah extends StatelessWidget {
  const TabSurah({super.key});

  @override
  Widget build(BuildContext context) {
    final SurahViewModel _viewmodel = SurahViewModel();
    return FutureBuilder<List<surah>>(
        future: _viewmodel.getListSurah(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context, surah: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.length);
        });
  }

  Widget _itemList({required BuildContext context, required surah surah}) =>
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(id_surah: surah.nomor.toString()),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(children: [
            Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/nomor_surah.svg',
                  color: orange,
                ),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                    child: Text(
                      surah.nomor.toString(),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, color: Blue),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.nama_latin,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 16, color: Blue),
                  ),
                  Text(
                    "${surah.tempat_turun} - ${surah.jumlah_ayat} ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: orange),
                  )
                ],
              ),
            ),
            Text(
              surah.nama,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 16, color: Blue),
            ),
          ]),
        ),
      );
}
