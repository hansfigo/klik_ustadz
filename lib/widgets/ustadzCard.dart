import 'package:flutter/material.dart';
import 'package:klik_ustadz/packages/usztad.dart';
import 'package:klik_ustadz/styles/colors.dart';
import 'package:klik_ustadz/styles/font.dart';

class UstadzCard extends StatelessWidget {
  final Ustadz us;
  const UstadzCard({Key? key, required this.us}) : super(key: key);

  @override


  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 100,
                height: 100,
                color: customGreenSec,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              us.name!,
              style: Headline12,
            ),
            Text(
              us.location!,
              style: Body,
            ),
          ],
        ),
      ),
    );
  }
}