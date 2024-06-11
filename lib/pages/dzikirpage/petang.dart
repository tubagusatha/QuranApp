import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remake_quran_app/model/dzikirpetang_model.dart';
import 'package:remake_quran_app/theme.dart';
import 'package:remake_quran_app/viewmodel/dzikir_viewmodel.dart';

class DzikirPetang extends StatelessWidget {
  static String routeName = 'dzikir_petang';
  const DzikirPetang({super.key});

  @override
  Widget build(BuildContext context) {
    final DzikirViewModel _viewmodel = DzikirViewModel();
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Theme.of(context)
            .appBarTheme
            .backgroundColor, 
        title: Text('Dzikir etang', style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Primary
        ),),
      ),
       backgroundColor:
          Theme.of(context).backgroundColor,
      body: FutureBuilder<List<Petang>>(
        
        future: _viewmodel.getListPetang(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          } 
          return ListView.separated(
            itemBuilder: (context, index) => _itemList(
              context: context,
              petang: snapshot.data!.elementAt(index),
            ),
            separatorBuilder: (context, index) => Divider(
              color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.1),
              height: 1,
            ),
            itemCount: snapshot.data!.length,
          );
        },
      ),
    );
  }

  Widget _itemList({required BuildContext context, required Petang petang}) =>
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
                    petang.title.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: orange,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    petang.arabic.toString(),
                    style: GoogleFonts.amiriQuran(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Blue,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    petang.fawaid.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Blue,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    petang.source.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Blue,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
    );
  }
