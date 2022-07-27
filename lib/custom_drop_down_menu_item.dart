import 'package:flutter/material.dart';

class Mask {
  RegExp regExp;
  String mask;
  Mask({required this.mask, required this.regExp});
}

class CountryData {
  final String image;
  final String text;
  final String code;
  final List<Mask> mask;
  CountryData({required this.image, required this.text, required this.code, required this.mask});
  CountryData copyWith({CountryData? country}) {
    return CountryData(
      image: country?.image ?? image,
      text: country?.text ?? text,
      code: country?.code ?? code,
      mask: country?.mask ?? mask,
    );
  }
}

class CustomDropDownItem extends DropdownMenuItem<CountryData> {
  CustomDropDownItem({
    super.key,
    required super.value,
  }) : super(
          child: DropdownMenuItem<String>(
            value: value?.code,
            child: Row(children: [
              Container(
                height: 25,
                width: 35,
                decoration: value?.image == null
                    ? const BoxDecoration(color: Colors.grey)
                    : BoxDecoration(image: DecorationImage(image: Image.asset(value!.image).image)),
              ),
              const SizedBox(width: 6),
              Text(value?.text ?? '')
            ]),
          ),
        );
}
