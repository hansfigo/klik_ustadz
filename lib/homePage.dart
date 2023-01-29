import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:klik_ustadz/chatListPage.dart';
import 'package:klik_ustadz/packages/pengajian.dart';
import 'package:klik_ustadz/packages/usztad.dart';
import 'package:klik_ustadz/profilePage.dart';
import 'package:klik_ustadz/widgets/PengajianCard.dart';
import 'package:klik_ustadz/widgets/dropdown.dart';
import 'package:klik_ustadz/styles/colors.dart';
import 'package:klik_ustadz/styles/font.dart';
import 'package:klik_ustadz/widgets/ustadzCard.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:random_avatar/random_avatar.dart';

const rnd = 'qw';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _listPage = <Widget>[
    const HomePageWidget(),
    const ChatList(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackbar(String status) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(status),
        duration: const Duration(seconds: 1),
      ));
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: customGreen,
                currentIndex: _selectedIndex,
                onTap: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Profile',
                  ),
                ],
              ),
              body: _listPage.elementAt(_selectedIndex));
        } else {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: customGreen,
                child: const Icon(Icons.chat_outlined),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return _listPage.elementAt(1);
                    },
                  ));
                },
              ),
              body: const HomePageWidgetWeb());
        }
      },
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showSnackbar(String status) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(status),
        duration: const Duration(seconds: 1),
      ));
    }

    return SingleChildScrollView(
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
                  children: const [
                    Text(
                      'Lokasi',
                      style: TextStyle(fontSize: 12, color: Colors.black26),
                    ),
                    DropdownC(),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    showSnackbar('Notification Button Pressed');
                  },
                  icon: const Icon(Icons.notifications_outlined),
                  iconSize: 26,
                )
              ],
            ),
            const SizedBox(
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
                        textStyle: Body,
                        hideSearchButton: true,
                        cursorColor: customGreen,
                        icon: const Icon(Icons.search_outlined),
                        onSearchButtonPressed: showSnackbar,
                      )),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                Ink(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                      onPressed: () {
                        showSnackbar('Filter Button Pressed');
                      },
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black38,
                      )),
                )
              ],
            ),
            const SizedBox(
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
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: ListView.separated(
                  itemCount: ustadzList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Widget svgCode = randomAvatar(
                        ustadzList[index].name.toString() + rnd,
                        height: 100,
                        width: 100,
                        trBackground: true);
                    final Ustadz us = ustadzList[index];
                    return UstadzCard(
                      us: us,
                      avatar: svgCode,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 22);
                  },
                ),
              ),
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
              height: 190,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: ListView.separated(
                  itemCount: pengajianList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Widget svgCode = randomAvatar(
                        pengajianList[index].name.toString(),
                        height: 100,
                        width: 100,
                        trBackground: true);

                    final Pengajian pengajian = pengajianList[index];
                    return PengajianCard(
                      pengajian: pengajian,
                      svgCode: svgCode,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomePageWidgetWeb extends StatelessWidget {
  const HomePageWidgetWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showSnackbar(String status) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$status'),
        duration: Duration(seconds: 1),
      ));
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 26.0),
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
                SizedBox(
                  width: 22,
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                      height: 30,
                      width: 100,
                      child: OutlineSearchBar(
                        borderRadius: BorderRadius.circular(12),
                        searchButtonIconColor: Colors.black38,
                        borderColor: Colors.black38,
                        hintText: 'Cari Ustads',
                        hintStyle: BodyGray,
                        textStyle: Body,
                        hideSearchButton: true,
                        cursorColor: customGreen,
                        icon: Icon(Icons.search_outlined),
                        onSearchButtonPressed: showSnackbar,
                      )),
                ),
                IconButton(
                  onPressed: () {
                    showSnackbar('Notification Button Pressed');
                  },
                  icon: Icon(Icons.notifications_outlined),
                  iconSize: 26,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  },
                  icon: Icon(Icons.person_outline),
                  iconSize: 26,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
            ),
            Text('Rekomendasi Ustadz', style: Headline14),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 300,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1/ 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                      itemCount: ustadzList.length,
                  itemBuilder: (context, index) {
                    Widget svgCode = randomAvatar(
                        ustadzList[index].name.toString() + rnd,
                        height: 100,
                        width: 100,
                        trBackground: true);
                    final Ustadz us = ustadzList[index];
                    return UstadzCard(us: us, avatar: svgCode);
                    //     );
                  },
                ),
                // child: ListView.separated(
                //   itemCount: ustadzList.length,
                //   scrollDirection: Axis.horizontal,
                //   itemBuilder: (context, index) {
                //     Widget svgCode = randomAvatar(
                //         ustadzList[index].name.toString() + rnd,
                //         height: 100,
                //         width: 100,
                //         trBackground: true);
                //     final Ustadz us = ustadzList[index];
                //     return UstadzCard(
                //       us: us,
                //       avatar: svgCode,
                //     );
                //   },
                //   separatorBuilder: (BuildContext context, int index) {
                //     return SizedBox(width: 22);
                //   },
                // ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Info Pengajian',
              style: Headline14,
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 194,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: ListView.separated(
                  itemCount: pengajianList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Widget svgCode = randomAvatar(
                        pengajianList[index].name.toString(),
                        height: 100,
                        width: 100,
                        trBackground: true);

                    final Pengajian pengajian = pengajianList[index];
                    return PengajianCard(
                      pengajian: pengajian,
                      svgCode: svgCode,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
