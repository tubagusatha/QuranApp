import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remake_quran_app/model/doa_model.dart';
import 'package:remake_quran_app/theme.dart';
import 'package:remake_quran_app/viewmodel/doa_viewmodel.dart';

class TabDoa extends StatelessWidget {
  const TabDoa({super.key});

  @override
  Widget build(BuildContext context) {
    final DoaViewModel _viewmodel = DoaViewModel();
    return FutureBuilder<List<doa>>(
        future: _viewmodel.getListDoa(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          } 
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context, doa: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Divider(
                    color:
                        const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.length);
              // print(snapshot.data!.length);
              
        });
  }

  Widget _itemList({required BuildContext context, required doa doa}) =>
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(children: [
           const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doa.title.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 17, color: orange),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    doa.arabic.toString(),
                    style: GoogleFonts.amiriQuran(
                        fontWeight: FontWeight.w400, fontSize: 14, color: Blue,),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    doa.fawaid.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 14, color: Blue),
                  ),SizedBox(
                    height: 3,
                  ),
                  Text(
                    doa.source.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300, fontSize: 15, color: Blue),
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
}
