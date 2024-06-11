import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remake_quran_app/model/ayah_model.dart';
import 'package:remake_quran_app/theme.dart';
import 'package:remake_quran_app/viewmodel/ayah_viewmodel.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  final String id_surah;
  const DetailScreen({Key? key, required this.id_surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AyahViewModel _viewModel = AyahViewModel();

    return Scaffold(
      appBar: AppBar(
        title: Text("Surah: $id_surah"),
        backgroundColor: Theme.of(context)
            .appBarTheme
            .backgroundColor, // Use theme's appBarTheme color
      ),
      backgroundColor:
          Theme.of(context).backgroundColor, // Use theme background color
      body: FutureBuilder<AyahModel>(
        future: _viewModel.getListAyah(id_surah),
        builder: (BuildContext context, AsyncSnapshot<AyahModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final List<Ayat> listAyah = snapshot.data!.ayat!;

            return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                context: context,
                ayat: listAyah[index],
              ),
              separatorBuilder: (context, index) => Divider(
                color:
                    const Color.fromARGB(255, 108, 107, 107).withOpacity(0.1),
                height: 1,
              ),
              itemCount: listAyah.length,
            );
          } else {
            return Center(
              child: Text("No Data Available"),
            );
          }
        },
      ),
    );
  }
}

Widget _itemList({required BuildContext context, required Ayat ayat}) =>
    InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Theme.of(context).backgroundColor,
              title: Text(
                "Arti",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: orange,
                ),
              ),
              content: Text(
                ayat.idn.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Primary,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: orange,
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/nomor_surah.svg',
                  color: Blue,
                ),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                    child: Text(
                      ayat.nomor.toString(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Blue,
                      ),
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
                    ayat.ar.toString(),
                    style: GoogleFonts.amiriQuran(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Blue,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    ayat.tr.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Blue,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
