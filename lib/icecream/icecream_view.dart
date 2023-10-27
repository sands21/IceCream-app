import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatefulWidget {
  const IcecreamView({super.key});

  @override
  State<IcecreamView> createState() => _IcecreamViewState();
}

class _IcecreamViewState extends State<IcecreamView> {
  Map<String,dynamic>? decodedIcecreams;

  @override
  void initState() {
    super.initState();
    loadIcecreams();
  }

  Future<void> loadIcecreams() async {
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    decodedIcecreams = jsonDecode(rawIcecreams);
    print(decodedIcecreams);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Icecream",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
           ),
          ),
          Text(
            "We got something that you would like to slurp down like yeehaww",
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          if (decodedIcecreams != null)
            const Text("Icecreams loaded")
          else
            const Center(child: CircularProgressIndicator.adaptive())
        ],
      ),
    );
  }
}
