import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NiatSholat()));
                  },
                  child: const Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/data/images/niatsholat.jpg"),
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Niat Sholat",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BacaanSholat()));
                  },
                  child: const Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/data/images/sholat.jpg"),
                        height: 100,
                        width: 100,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bacaan Sholat",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: const Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/data/images/ayatkursi.jpg"),
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ayat Kursi",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  NiatSholat() {}
}

BacaanSholat() {}
