import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remake_quran_app/component/tab_item..dart';
import 'package:remake_quran_app/model/surah_model.dart';
import 'package:remake_quran_app/pages/tabs/doa_tab.dart';
import 'package:remake_quran_app/pages/tabs/dzikir_tab.dart';
import 'package:remake_quran_app/pages/tabs/surah_tab.dart';
import 'package:remake_quran_app/theme.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  final List<surah> surahList;

  const HomeScreen({Key? key, required this.surahList}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: _isDarkMode ? background : Colors.white,
        appBar: _appBar(context, _scaffoldKey, widget.surahList),
        drawer: _drawer(context),
        body: _body(),
      ),
    );
  }

  AppBar _appBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      List<surah> surahList) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
        icon: SvgPicture.asset('assets/svg/menu_icon.svg'),
      ),
      title: Text(
        'Quran App',
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: Primary),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(surahList: surahList),
            );
          },
          icon: SvgPicture.asset('assets/svg/search_icon.svg'),
        )
      ],
    );
  }

  DefaultTabController _body() {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: _salam(),
            ),
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              automaticallyImplyLeading: false,
              shape: Border(
                bottom: BorderSide(
                  width: 3,
                  color: const Color.fromARGB(255, 54, 53, 53).withOpacity(0.1),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: TabBar(
                  labelColor: orange,
                  indicatorWeight: 3,
                  indicatorColor: orange,
                  tabs: [
                    itemTab(label: "Surah"),
                    itemTab(label: "Dzikir"),
                    itemTab(label: "Doa"),
                  ],
                ),
              ),
            )
          ],
          body: TabBarView(
            children: [TabSurah(), TabDzikir(), TabDoa()],
          ),
        ),
      ),
    );
  }

  Column _salam() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w600, color: orange),
        ),
        Text(
          'Tubagus',
          style: GoogleFonts.poppins(
              fontSize: 29, fontWeight: FontWeight.bold, color: Blue),
        ),
        SizedBox(
          height: 0,
        ),
        StreamBuilder(
          stream: Stream.periodic(Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Text(
              DateFormat('HH:mm:ss').format(DateTime.now()),
              style: GoogleFonts.poppins(
                  fontSize: 40, fontWeight: FontWeight.bold, color: orange),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffdf98fa), Color(0xff9055ff)],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset('assets/svg/quran_banner.svg'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/book.svg'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Last Read',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Al Fatihah',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Ayah No : 1",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _drawer(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context)
            .backgroundColor, // Menggunakan warna latar belakang aplikasi
      ),
      child: Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                "Quran App",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Dark Mode',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: orange,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              onTap: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
                Navigator.pop(context);
              },
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                },
                activeColor: orange,
              ),
            ),
            ListTile(
              title: Text(
                'Setting',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Bantuan',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<surah> {
  final List<surah> surahList;

  CustomSearchDelegate({required this.surahList});

  List<surah> getSurahResults(String query) {
    print('Query: $query');
    return surahList.where((surah) {
      final lowerCaseQuery = query.toLowerCase();
      return surah.nama.toLowerCase().contains(lowerCaseQuery) ||
          surah.nomor.toString().contains(lowerCaseQuery);
    }).toList();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text('Masukkan kata kunci pencarian'),
      );
    } else {
      final List<surah> searchResults = getSurahResults(query);
      return ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index].nama),
            onTap: () {},
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<surah> searchResults = getSurahResults(query);
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].nama),
          onTap: () {},
        );
      },
    );
  }
}
