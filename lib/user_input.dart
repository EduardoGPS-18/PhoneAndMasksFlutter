import 'package:flutter/material.dart';
import 'package:test_dropdown/custom_drop_down_menu_item.dart';

class UserInput extends StatefulWidget {
  final CountryData country;

  const UserInput({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = widget.country.text;
    return SizedBox(
      width: MediaQuery.of(context).size.width * .36,
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: (value) {},
        decoration: InputDecoration(
          counterText: '',
          label: const Text(""),
          prefixIconConstraints: BoxConstraints.tight(const Size(50, 50)),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Container(
                decoration: BoxDecoration(image: DecorationImage(image: Image.asset(widget.country.image).image)),
                height: 20,
                width: 100,
              ),
            ),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.arrow_drop_down),
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          alignLabelWithHint: true,
          errorBorder: _makeInputBorder(color: Colors.red),
          enabledBorder: _makeInputBorder(color: Colors.blueGrey),
          focusedBorder: _makeInputBorder(color: Colors.blue),
          disabledBorder: _makeInputBorder(color: Colors.grey),
          focusedErrorBorder: _makeInputBorder(color: Colors.red),
        ),
      ),
    );
  }
}

OutlineInputBorder _makeInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
