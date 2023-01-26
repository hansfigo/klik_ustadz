import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Image.asset('images/logo.png'),
                ),
                Text('Sleman Yogyakarta'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined),
                  iconSize: 32,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SizedBox(
                      height: 50,
                      width: 100,
                      child: OutlineSearchBar(
                        borderRadius: BorderRadius.circular(12),
                        searchButtonIconColor: customGreen,
                        borderColor: customGreen,
                        hintText: 'Cari Ustads',
                      )),
                ), 
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
