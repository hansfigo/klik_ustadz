import 'package:flutter/material.dart';
import 'package:klik_ustadz/packages/usztad.dart';
import 'package:klik_ustadz/widgets/PengajianCard.dart';
import 'package:klik_ustadz/widgets/dropdown.dart';
import 'package:klik_ustadz/styles/colors.dart';
import 'package:klik_ustadz/styles/font.dart';
import 'package:klik_ustadz/widgets/ustadzCard.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Image.asset('images/logo.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Lokasi',
                        style: TextStyle(fontSize: 12, color: Colors.black26),
                      ),
                      DropdownC(),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.notifications_outlined),
                    iconSize: 26,
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                        height: 40,
                        width: 100,
                        child: OutlineSearchBar(
                          borderRadius: BorderRadius.circular(12),
                          searchButtonIconColor: Colors.black38,
                          borderColor: Colors.black38,
                          hintText: 'Cari Ustads',
                          hintStyle: BodyGray,
                          hideSearchButton: true,
                          cursorColor: customGreen,
                          icon: Icon(Icons.search_outlined),
                        )),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Ink(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black38),
                        borderRadius: BorderRadius.circular(8)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.black38,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rekomendasi Ustadz', style: Headline14),
                  Text('Telusuri', style: BodyGreen),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 188,
                child: ListView.builder( itemCount: ustadzList.length, scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
                  final Ustadz us = ustadzList[index];
                  return Container(margin: index == 0 ? EdgeInsets.symmetric(horizontal: 0) : EdgeInsets.only(left: 24) , child: UstadzCard(us: us));
                },),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Info Pengajian',
                    style: Headline14,
                  ),
                  Text(
                    'Telusuri',
                    style: BodyGreen,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 184,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PengajianCard(),
                    PengajianCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



