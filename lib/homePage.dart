import 'package:flutter/material.dart';
import 'package:klik_ustadz/dropdown.dart';
import 'package:klik_ustadz/styles/colors.dart';
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
      body: Padding(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Context) {
                      return DropdownC();
                    }));
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
                        hintStyle: TextStyle(fontSize: 12),
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
                const Text('Rekomendasi Ustadz'),
                const Text('Telusuri'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('data'),
                    Text('data'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
