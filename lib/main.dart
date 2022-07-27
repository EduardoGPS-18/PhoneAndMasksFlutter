import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_dropdown/custom_drop_down_menu_item.dart';
import 'package:test_dropdown/ddi_picker.dart';
import 'package:test_dropdown/drop_down_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController phoneController;
  late MaskTextInputFormatter phoneMask;
  late CountryData countryData;
  String lastPhone = '';

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController(text: "");
    phoneMask = MaskTextInputFormatter(mask: "###");
    countryData = dropDownItems[1].value!;
    phoneController.addListener(() {
      _updateMask();
    });
  }

  _updateMask({bool returnIfIsSameText = true}) {
    final phoneIsTheSame = phoneController.text.removePhoneMask() == lastPhone.removePhoneMask();

    if (!returnIfIsSameText && phoneIsTheSame) {
      return;
    }
    final phone = phoneController.text.removePhoneMask();
    lastPhone = phone;
    for (final mask in countryData.mask) {
      if (mask.regExp.hasMatch(phone)) {
        phoneMask.updateMask(mask: mask.mask);
        break;
      }
    }
    final maskedPhone = phoneMask.maskText(phoneController.text);
    phoneController.value = TextEditingValue(
      text: maskedPhone,
      selection: TextSelection(
        baseOffset: maskedPhone.length,
        extentOffset: maskedPhone.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                DDIPicker(
                  onChanged: (country) {
                    setState(() {
                      countryData = country;
                    });
                    _updateMask(returnIfIsSameText: false);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: phoneController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: const Text('Entrar'))
          ],
        ),
      ),
    );
  }
}

extension on String {
  removePhoneMask() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }
}
