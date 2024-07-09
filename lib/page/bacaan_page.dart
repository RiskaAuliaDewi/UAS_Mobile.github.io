import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class BacaanSholat extends StatefulWidget {
  const BacaanSholat({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BacaanSholatState createState() => _BacaanSholatState();
}

class _BacaanSholatState extends State<BacaanSholat> {
  late Future<List<ModelBacaan>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = readJsonData();
  }

  Future<List<ModelBacaan>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/data/bacaanshalat.json');
    final List<dynamic> jsonList = json.decode(jsonData);
    return jsonList.map((e) => ModelBacaan.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e1446),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff44aca0),
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: const EdgeInsets.only(top: 120, left: 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bacaan Sholat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Bacaan sholat dari doa iftita",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/data/images/bg_doa.jpg',
                      width: 330,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<ModelBacaan>>(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    var items = snapshot.data!;
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(15),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: ExpansionTile(
                              title: Text(
                                items[index].name ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                        ),
                                        child: Text(
                                          items[index].arabic ?? '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                        ),
                                        child: Text(
                                          items[index].latin ?? '',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          top: 5,
                                        ),
                                        child: Text(
                                          items[index].terjemahan ?? '',
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("No data found."),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelBacaan {
  final String? name;
  final String? arabic;
  final String? latin;
  final String? terjemahan;

  ModelBacaan({
    this.name,
    this.arabic,
    this.latin,
    this.terjemahan,
  });

  factory ModelBacaan.fromJson(Map<String, dynamic> json) {
    return ModelBacaan(
      name: json['name'],
      arabic: json['arabic'],
      latin: json['latin'],
      terjemahan: json['terjemahan'],
    );
  }
}
