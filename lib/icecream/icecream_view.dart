import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  get decodedIcecreams => null;


  Future<void> loadIcecreams() async {
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    final decodedIcecreams = jsonDecode(rawIcecreams);
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Icecreams",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
           ),
          ),
          Text(
            "We got something that you would like to slurp down like yeehaww",
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(future: loadIcecreams(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState = ConnectionState.done) {
                            return const Text("Icecreams loaded");
                          }
                          else {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }
                      }
                    ),
                if (decodedIcecreams != null)
                  const Text("Icecreams loaded")
                else
                  const Center(child: CircularProgressIndicator.adaptive())
            ],
          ),
              ))
        ],
      ),
    );
  }
}
