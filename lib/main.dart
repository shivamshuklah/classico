import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI APP'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var cmController = TextEditingController();
  var result = "";
  var bgColor = const Color.fromARGB(255, 166, 142, 213);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI APP',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter you Weight (in Kg)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: cmController,
                    decoration: InputDecoration(
                        label: Text("Enter you Height (in Cm)"),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var cm = cmController.text.toString();

                        if (wt != "" && cm != "") {
                          var iWt = int.parse(wt);
                          var iCm = int.parse(cm);
                          var iM = iCm / 100;
                          var BMI = iWt / (iM * iM);
                          var msg = "";
                          if (BMI > 24) {
                            msg = "You are OVERWEIGHT";
                            bgColor = Colors.red.shade200;
                          } else if (BMI < 18) {
                            msg = "You are UNDERWEIGHT ";
                            bgColor = Colors.orange.shade200;
                          } else {
                            msg = "You are HEALTHY ";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result = "$msg \n BMI = ${BMI.toStringAsFixed(3)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the blanck Fields !!!";
                          });
                        }
                      },
                      child: Text("Calculate")),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
