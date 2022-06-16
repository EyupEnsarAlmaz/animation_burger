import 'package:flutter/material.dart';
import 'main_method.dart';
import 'model/data.position.dart';
import 'model/data_name.dart';
import 'model/data_value.dart';

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

List foodItem = [];

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
          child: _animatedStack(),
        ),
        Expanded(
          child: checkBoxListview(),
        ),
      ]),
    );
  }

  Stack _animatedStack() {
    return Stack(
      children: [
        animatedPositioned(
            top: ekmekAltiTop,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().ekmekaltiPath,
                  width: width,
                  height: height2,
                ),
                opacity: open)),
        animatedPositioned(
            top: ustKivircikTop,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().ustkivircikPath,
                  width: width,
                  height: height2,
                ),
                opacity: valueMarul ? open : close)),
        animatedPositioned(
            top: valueMarul ? etTop : etTop - 2,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().etPath,
                  width: width,
                  height: height,
                ),
                opacity: open)),
        animatedPositioned(
            top: foodItem.length < 2 ? peynirTop : peynirTop,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().peynirPath,
                  width: width,
                  height: height,
                ),
                opacity: valuePeynir ? open : close)),
        animatedPositioned(
            top: valuePeynir ? domatesTop - 10 : domatesTop,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().domatesPath,
                  width: width,
                  height: height,
                ),
                opacity: valueDomates ? open : close)),
        animatedPositioned(
            top: valuePeynir && valueDomates
                ? soganTop
                : valueDomates
                    ? soganTop + 10
                    : valuePeynir
                        ? soganTop + 20
                        : soganTop + 30,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().soganPath,
                  width: width,
                  height: height,
                ),
                opacity: valueSogan ? open : close)),
        animatedPositioned(
            top: valueSogan && valueDomates && valuePeynir
                ? tursuTop
                : valueSogan && valueDomates
                    ? tursuTop + 10
                    : valueSogan && valuePeynir
                        ? tursuTop + 20
                        : valueDomates && valuePeynir
                            ? tursuTop + 5
                            : valueDomates
                                ? tursuTop + 25
                                : valuePeynir
                                    ? tursuTop + 35
                                    : valueSogan
                                        ? tursuTop + 25
                                        : tursuTop + 45,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().tursuPath,
                  width: 340,
                  height: height,
                ),
                opacity: valueTursu ? open : close)),
        animatedPositioned(
            top: topp,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().ustEkmek,
                  width: width,
                  height: height2,
                ),
                opacity: open)),
      ],
    );
  }

  ListView checkBoxListview() {
    return ListView(children: [
      chekbox(
          title: Text(FoodName().marulName),
          value: valueMarul,
          selected: selectedMarul,
          onChanged: (_) {
            setState(() {
              valueMarul = !valueMarul;
              valueMarul
                  ? foodItem.add(selectedMarul)
                  : foodItem.remove(selectedMarul);
            });
          }),
      chekbox(
          title: Text(FoodName().domatesName),
          value: valueDomates,
          selected: selectedDomates,
          onChanged: (_) {
            setState(() {
              valueDomates = !valueDomates;
              valueDomates
                  ? foodItem.add(selectedDomates)
                  : foodItem.remove(selectedDomates);
              valueDomates ? arttir() : azalt();
            });
          }),
      chekbox(
          title: Text(FoodName().soganName),
          value: valueSogan,
          selected: selectedSogan,
          onChanged: (_) {
            setState(() {
              valueSogan = !valueSogan;
              valueSogan
                  ? foodItem.add(selectedSogan)
                  : foodItem.remove(selectedSogan);
              valueSogan ? arttir() : azalt();
            });
          }),
      chekbox(
          title: Text(FoodName().tursuName),
          value: valueTursu,
          selected: selectedTursu,
          onChanged: (_) {
            setState(() {
              valueTursu = !valueTursu;
              valueTursu
                  ? foodItem.add(selectedTursu)
                  : foodItem.remove(selectedTursu);
              valueTursu ? arttir() : azalt();
            });
          }),
      chekbox(
          title: Text(FoodName().peynirName),
          value: valuePeynir,
          selected: selectedPeynir,
          onChanged: (_) {
            setState(() {
              valuePeynir = !valuePeynir;
              valuePeynir
                  ? foodItem.add(selectedPeynir)
                  : foodItem.remove(selectedPeynir);
              valuePeynir ? arttir() : azalt();
            });
          })
    ]);
  }
}
