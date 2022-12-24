import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './result_page.dart';
import './user_data.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String gender = "";
  late double adet_Sigara = 5;
  late double adet_Spor = 1;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.purple),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyWidget(
                    renk: Colors.white70,
                    child: buildRowOnlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyWidget(
                    renk: Colors.white70,
                    child: buildRowOnlineButton("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyWidget(
              renk: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Haftada kaç gün spor yapıyorsunuz",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    adet_Spor.round().toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Slider(
                    value: adet_Spor,
                    min: 0,
                    max: 7,
                    label: adet_Spor.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        adet_Spor = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyWidget(
              renk: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Günde kaç tane sigara içiyorsunuz",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    adet_Sigara.round().toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Slider(
                    value: adet_Sigara,
                    max: 50,
                    // divisions: 5,
                    label: adet_Sigara.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        adet_Sigara = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "KADIN";
                      });
                    },
                    child: MyWidget(
                      renk: gender == "KADIN"
                          ? Colors.lightBlueAccent
                          : Colors.white70,
                      child: GenderWidget(
                        ikon: FontAwesomeIcons.venus,
                        cinsiyet: 'KADIN',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "ERKEK";
                      });
                    },
                    child: MyWidget(
                      renk: gender == "ERKEK"
                          ? Colors.lightBlueAccent
                          : Colors.white70,
                      child: GenderWidget(
                        ikon: FontAwesomeIcons.mars,
                        cinsiyet: "ERKEK",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
              textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 18, color: Colors.transparent)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(UserData(
                          gender, adet_Sigara, adet_Spor, boy, kilo))));
            },
            child: const Text("HESAPLA"),
          ),
        ],
      ),
    );
  }

  Row buildRowOnlineButton(String label) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              textAlign: TextAlign.center,
              label,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(width: 15),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              label == "BOY" ? boy.toString() : kilo.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy++ : kilo++;
                  });
                },
                child: const Icon(FontAwesomeIcons.plus),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? boy-- : kilo--;
                  });
                },
                child: const Icon(FontAwesomeIcons.minus),
              )
            ],
          ),
        ]);
  }
}

class GenderWidget extends StatelessWidget {
  IconData ikon;
  String cinsiyet;

  GenderWidget({super.key, required this.ikon, required this.cinsiyet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ikon,
          size: 35,
          color: Colors.black54,
        ),
        const SizedBox(height: 20),
        Text(
          cinsiyet,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  final Color renk;
  final Widget child;

  const MyWidget({
    super.key,
    required this.renk,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: renk,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
