import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:test_dropdown/drop_down_items.dart';
import 'package:test_dropdown/user_input.dart';

import 'custom_drop_down_menu_item.dart';

class DDIPicker extends StatefulWidget {
  final void Function(CountryData)? onChanged;
  const DDIPicker({Key? key, this.onChanged}) : super(key: key);

  @override
  State<DDIPicker> createState() => _DDIPickerState();
}

class _DDIPickerState extends State<DDIPicker> {
  late CountryData country;

  @override
  void initState() {
    super.initState();
    country = dropDownItems[1].value!;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<CountryData>(
      dropdownWidth: MediaQuery.of(context).size.width * .55,
      barrierColor: Colors.transparent,
      underline: const SizedBox(),
      dropdownMaxHeight: MediaQuery.of(context).size.height * .35,
      onChanged: (value) {
        setState(() {
          country = country.copyWith(country: value);
        });
        widget.onChanged?.call(country);
      },
      items: [
        ...dropDownItems,
        // CustomDropDownItem(value: CountryData(image: 'images/flags/cl.png', text: '+56 ES', code: "+56", mask: ["### ###"])),
        // CustomDropDownItem(value: CountryData(image: 'images/flags/co.png', text: '+57 PE', code: "+57", mask: ["# ##"])),
        // CustomDropDownItem(value: CountryData(image: 'images/flags/es.png', text: '+34 ES', code: "+34", mask: ["# ## #"])),
        // CustomDropDownItem(value: CountryData(image: 'images/flags/pe.png', text: '+51 PE', code: "+51", mask: ["# # #"])),
        // CustomDropDownItem(value: CountryData(image: 'images/flags/uy.png', text: '+598 PE', code: "+598", mask: ["#  #"])),
      ],
      customButton: IgnorePointer(
        child: UserInput(country: country),
      ),
    );
  }
}
