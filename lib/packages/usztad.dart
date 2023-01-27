import 'package:flutter/material.dart';

class Ustadz {
  String? name;
  String? location;
  String? description;
  String? picture;

  Ustadz({
    required this.name,
    required this.location,
    required this.description,
    required this.picture,
  });
}

var ustadzList = [
  Ustadz(
      name: 'Budi Sarwanto',
      location: 'Kota Yogyakarta',
      description: 'Lorem Ipsum Sir Dolot Kumoi Shiteai',
      picture: 'images/'),
  Ustadz(
      name: 'Sutarlan',
      location: 'Sleman',
      description: 'Lorem Ipsum',
      picture: 'images/'),
  Ustadz(
      name: 'Gustiono',
      location: 'Godean',
      description: 'description',
      picture: 'images/'),
  Ustadz(
      name: 'Ahmad Bakri',
      location: 'Sleman',
      description: 'description',
      picture: 'images/')
];
