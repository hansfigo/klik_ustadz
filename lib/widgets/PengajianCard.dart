import 'package:flutter/material.dart';
import 'package:klik_ustadz/packages/pengajian.dart';
import 'package:klik_ustadz/packages/usztad.dart';
import 'package:klik_ustadz/styles/colors.dart';
import 'package:klik_ustadz/styles/font.dart';

class PengajianCard extends StatelessWidget {
  final Pengajian pengajian;
  const PengajianCard({super.key, required this.pengajian});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 100,
                height: 100,
                color: customGreenSec,
              ),
            ),
            SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: customGreen,
                      size: 14,
                    ),
                    SizedBox(width: 6),
                    Text(
                      pengajian.location!,
                      style: BodyGreen,
                    ),
                    // Icon(Icons.bookmark_add_outlined),
                  ],
                ),
                Text(
                  pengajian.name!,
                  style: Headline14,
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      color: Colors.black38,
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      pengajian.penceramah!,
                      style: Body,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black38,
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      pengajian.date!,
                      style: Body,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch,
                      color: Colors.black38,
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      pengajian.time!,
                      style: Body,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    height: 36,
                    width: 176,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: customGreenSec,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Daftar Sekarang",
                        style: TextStyle(
                          color: customGreen,
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
