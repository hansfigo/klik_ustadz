import 'package:flutter/material.dart';
import 'package:klik_ustadz/packages/pengajian.dart';
import 'package:klik_ustadz/styles/colors.dart';
import 'package:klik_ustadz/styles/font.dart';

class PengajianCard extends StatelessWidget {
  final Pengajian pengajian;
  final Widget svgCode;
  const PengajianCard({super.key, required this.pengajian,required this.svgCode});
  

  @override
  Widget build(BuildContext context) {
     void showSnackbar(String status) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(status),
        duration: const Duration(seconds: 1),
      ));
    }

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
                child: svgCode,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: customGreen,
                      size: 14,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      pengajian.location!,
                      style: bodyGreen_12,
                    ),
                    // Icon(Icons.bookmark_add_outlined),
                  ],
                ),
                Text(
                  pengajian.name!,
                  style: headline_14,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.people,
                      color: Colors.black38,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      pengajian.penceramah!,
                      style: body_12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black38,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      pengajian.date!,
                      style: body_12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.watch,
                      color: Colors.black38,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      pengajian.time!,
                      style: body_12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                    height: 36,
                    width: 176,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: customGreenSec,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showSnackbar("Anda Harus Login Terlebuh Dahulu");
                      },
                      child: const Text(
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
    
  }}
  

