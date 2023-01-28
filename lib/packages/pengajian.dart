import 'package:flutter/material.dart';

class Pengajian {
  String? name;
  String? date;
  String? penceramah;
  String? time;
  String? location;
  String? description;
  String? picture;

  Pengajian({
    required this.name,
    required this.date,
    required this.penceramah,
    required this.time,
    required this.location,
    required this.description,
    required this.picture,
  });
}

var pengajianList = [
  Pengajian(
      name: 'Pengajian Al-Falaah',
      date: '01-02-2023',
      penceramah: 'Ust. Gustiono',
      time: '09.00',
      location: 'Sleman',
      description: 'description',
      picture: 'images/'),
  Pengajian(
      name: 'Pengajian Akidah',
      date: '01-02-2023',
      penceramah: 'Ust. Muhammad',
      time: '19.00',
      location: 'Godean',
      description: 'description',
      picture: 'images/'),
];
