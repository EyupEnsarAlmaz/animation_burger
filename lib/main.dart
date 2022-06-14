import 'package:flutter/material.dart';
import 'const.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Food Animation App';
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

double leftPosition = 20;

bool _valueMarul = false;
bool _valueDomates = false;
bool _valueSogan = false;
bool _valueTursu = false;
bool _valuePeynir = false;

bool _selectedMarul = false;
bool _selectedDomates = false;
bool _selectedSogan = false;
bool _selectedTursu = false;
bool _selectedPeynir = false;

List foodItem = [];
double topp = 110;

arttir() {
  topp -= 19;
}

azalt() {
  topp += 19;
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              AnimatedPositioned(
                top: 205, // ellenmicek
                left: 100,
                duration: const Duration(milliseconds: 500),
                child: animatedOpacity(
                    image: Image.asset(
                      ImagePath().ekmekaltiPath,
                      width: 250,
                      height: 100,
                    ),
                    opacity: 1.0),
              ),
              AnimatedPositioned(
                top: 190,
                left: 100,
                duration: const Duration(milliseconds: 500),
                child: animatedOpacity(
                    image: Image.asset(
                      ImagePath().ustkivircikPath,
                      width: 250,
                      height: 100,
                    ),
                    opacity: _valueMarul ? 1.0 : 0.0),
              ),
              AnimatedPositioned(
                top: _valueMarul ? 170 : 168,
                left: 100,
                duration: const Duration(milliseconds: 500),
                child: animatedOpacity(
                    image: Image.asset(
                      ImagePath().etPath,
                      width: 250,
                      height: 100,
                    ),
                    opacity: 1.0),
              ),
              AnimatedPositioned(
                top: foodItem.length < 2 ? 160 : 160,
                left: 100,
                duration: const Duration(milliseconds: 500),
                child: animatedOpacity(
                    image: Image.asset(
                      ImagePath().peynirPath,
                      width: 250,
                      height: 100,
                    ),
                    opacity: _valuePeynir ? 1.0 : 0.0),
              ),
              AnimatedPositioned(
                top: _valuePeynir ? 130 : 140,
                left: 100,
                duration: const Duration(milliseconds: 500),
                child: animatedOpacity(
                    image: Image.asset(
                      ImagePath().domatesPath,
                      width: 250,
                      height: 100,
                    ),
                    opacity: _valueDomates ? 1.0 : 0.0),
              ),
              AnimatedPositioned(
                top: _valuePeynir && _valueDomates
                    ? 110
                    : _valueDomates
                        ? 120
                        : _valuePeynir
                            ? 130
                            : 140,
                left: 100,
                duration: const Duration(milliseconds: 500),
                child: animatedOpacity(
                    image: Image.asset(
                      ImagePath().soganPath,
                      width: 250,
                      height: 100,
                    ),
                    opacity: _valueSogan ? 1.0 : 0.0),
              ),
              AnimatedPositioned(
                top: _valueSogan && _valueDomates && _valuePeynir
                    ? 95
                    : _valueSogan && _valueDomates
                        ? 100
                        : _valueSogan && _valuePeynir
                            ? 120
                            : _valueDomates && _valuePeynir
                                ? 100
                                : _valueDomates
                                    ? 120
                                    : _valuePeynir
                                        ? 130
                                        : _valueSogan
                                            ? 120
                                            : 140,
                left: 110,
                duration: const Duration(milliseconds: 500),
                child: animatedOpacity(
                    image: Image.asset(
                      ImagePath().tursuPath,
                      width: 340,
                      height: 100,
                    ),
                    opacity: _valueTursu ? 1.0 : 0.0),
              ),
              AnimatedPositioned(
                top: topp,
                left: 100,
                duration: const Duration(milliseconds: 500),
                child: animatedOpacity(
                    image: Image.asset(
                      ImagePath().ustEkmek,
                      width: 250,
                      height: 120,
                    ),
                    opacity: 1.0),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(children: [
            CheckboxListTile(
              activeColor: Colors.green,
              checkColor: Colors.white,
              title: Text("Marul"),
              value: _valueMarul,
              selected: _selectedMarul,
              onChanged: (bool? valueMarul) {
                setState(() {
                  _valueMarul = !_valueMarul;
                  _valueMarul
                      ? foodItem.add(_selectedMarul)
                      : foodItem.remove(_selectedMarul);
                });
              },
            ),
            CheckboxListTile(
              activeColor: Colors.green,
              checkColor: Colors.white,
              title: Text("Domates"),
              value: _valueDomates,
              selected: _selectedDomates,
              onChanged: (bool? valueDomates) {
                setState(() {
                  _valueDomates = !_valueDomates;
                  _valueDomates
                      ? foodItem.add(_selectedDomates)
                      : foodItem.remove(_selectedDomates);
                  _valueDomates ? arttir() : azalt();
                });
              },
            ),
            CheckboxListTile(
              activeColor: Colors.green,
              checkColor: Colors.white,
              title: Text("Soğan"),
              value: _valueSogan,
              selected: _selectedSogan,
              onChanged: (bool? valueSogan) {
                setState(() {
                  _valueSogan = !_valueSogan;
                  _valueSogan
                      ? foodItem.add(_selectedSogan)
                      : foodItem.remove(_selectedSogan);
                  _valueSogan ? arttir() : azalt();
                });
              },
            ),
            CheckboxListTile(
              activeColor: Colors.green,
              checkColor: Colors.white,
              title: Text("Turşu"),
              value: _valueTursu,
              selected: _selectedTursu,
              onChanged: (bool? valueTursu) {
                setState(() {
                  _valueTursu = !_valueTursu;
                  _valueTursu
                      ? foodItem.add(_selectedTursu)
                      : foodItem.remove(_selectedTursu);
                  _valueTursu ? arttir() : azalt();
                });
              },
            ),
            CheckboxListTile(
              activeColor: Colors.green,
              checkColor: Colors.white,
              title: Text("Peynir"),
              value: _valuePeynir,
              selected: _selectedPeynir,
              onChanged: (bool? valuePeynir) {
                setState(() {
                  _valuePeynir = !_valuePeynir;
                  _valuePeynir
                      ? foodItem.add(_selectedPeynir)
                      : foodItem.remove(_selectedPeynir);
                  _valuePeynir ? arttir() : azalt();
                });
              },
            ),
          ]),
        )
      ]),
    );
  }

  AnimatedOpacity animatedOpacity(
      {required Widget image, required double opacity}) {
    return AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 500),
        child: image);
  }
}
