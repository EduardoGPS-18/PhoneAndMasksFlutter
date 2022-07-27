import 'custom_drop_down_menu_item.dart';

final dropDownItems = [
  CustomDropDownItem(
    value: CountryData(
      image: 'images/flags/ar.png',
      text: '+54 ES',
      code: "+54",
      mask: [
        Mask(
          mask: "## ###",
          regExp: RegExp(r""),
        ),
      ],
    ),
  ),
  CustomDropDownItem(
    value: CountryData(
      image: 'images/flags/br.png',
      text: '+55 BR',
      code: "+55",
      mask: [
        Mask(
          mask: "(##) #####-####",
          regExp: RegExp(r"^\d\d(9)"),
        ),
        Mask(
          mask: "(##) ####-####",
          regExp: RegExp(r"^\d\d(1|2|3|4|5|6|7|8)"),
        ),
      ],
    ),
  ),
  CustomDropDownItem(
    value: CountryData(
      image: 'images/flags/bo.png',
      text: '+591 BR',
      code: "+591",
      mask: [
        Mask(
          mask: "(#) ###",
          regExp: RegExp(r"\d\d9"),
        ),
      ],
    ),
  ),
];
