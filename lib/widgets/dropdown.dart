import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:klik_ustadz/styles/colors.dart';


class DropdownC extends StatefulWidget {
  const DropdownC({Key? key}) : super(key: key);

  @override
  State<DropdownC> createState() => _DropdownCState();
}

class _DropdownCState extends State<DropdownC> {
  final List<String> items = [
    'Sleman',
    'Kota Yogya',
    'Prambanan',
    'Godean',

  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Icon(Icons.location_pin, color: customGreen, size: 18,),
            SizedBox(
              width: 12,
            ),
            Text(
              'Pilih Lokasi',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: customBlack),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down,
        ),
        iconSize: 14,
        // iconEnabledColor: Colors.yellow,
        // iconDisabledColor: Colors.grey,
        buttonHeight: 26,
        buttonWidth: 120,
        // buttonPadding: const EdgeInsets.only(left: 22, right: 24),
        // buttonDecoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(14),
        //   border: Border.all(
        //     color: Colors.black26,
        //   ),
        //   color: Colors.redAccent,
        // ),
        buttonElevation: 2,
        itemHeight: 40,
        // itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: 200,
        // dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        // dropdownElevation: 8,
        // scrollbarRadius: const Radius.circular(40),
        // scrollbarThickness: 6,
        // scrollbarAlwaysShow: true,
        // offset: const Offset(-20, 0),
      ),
    );
  }
}
