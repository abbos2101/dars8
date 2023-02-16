import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LangPage extends StatefulWidget {
  const LangPage({Key? key}) : super(key: key);

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("name".tr())),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                context.setLocale(Locale("uz"));
              },
              child: Text("O'zbek"),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                context.setLocale(Locale("ru"));
              },
              child: Text("Rus"),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                context.setLocale(Locale("en"));
              },
              child: Text("Ingliz"),
            ),
          ],
        ),
      ),
    );
  }
}
