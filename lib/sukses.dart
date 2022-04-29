import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  get blurRadius => null;
  get decoration => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            const SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              pinned: false,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsetsDirectional.only(start: 16.0, bottom: 16.0),
                centerTitle: false,
                title: Text("Hi Wisnu.",
                  style: TextStyle(
                    height: 0,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ];
        },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kelas Berlangsung",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff333333),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  child: Container(
                    width:double.infinity,
                    height: 136,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: const Icon(
                            IconlyLight.login,
                            color: Color(0xFF64749F),
                            size: 35,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            "Belum memasuki kelas",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: const Color(0xFF64749F),
                            ),
                          ),
                        ),
                        Text(
                          "Cari Kelas",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF145AE3),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: const Color(0xFFF4F4F4), width: 1.0, style: BorderStyle.solid),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 2,
                            blurRadius: 10,
                          )
                        ]
                    ),
                  ),
                ),
                Expanded(
                    child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              IconlyLight.calendar,
                              color: Colors.blueAccent,
                              size: 35,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Jadwal \n Mata Kuliah",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: const Color(0xFFF4F4F4), width: 1.0, style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              IconlyLight.category,
                              color: Colors.blueAccent,
                              size: 35,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Daftar \n Ruangan",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: const Color(0xFFF4F4F4), width: 1.0, style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]
                        ),
                      ),
                      Container(
                       child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              IconlyLight.bookmark,
                              color: Colors.blueAccent,
                              size: 35,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Riwayat \n Presensi",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: const Color(0xFFF4F4F4), width: 1.0, style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]
                        ),
                      ),
                    ],
                    ),
                )
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff145ae3),
                Color(0xff15aeef),
              ]
            )
          ),
          child: SvgPicture.asset("assets/images/search-class.svg", height: 20,),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Padding(
          padding: const EdgeInsets.only(bottom:13.0, top: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Text(
                  "Cari Kelas",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}

