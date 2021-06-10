import 'package:bmi_calculator/pages/BMI/CalculateBMI.dart';
import 'package:bmi_calculator/pages/BMI/IconContent.dart';
import 'package:bmi_calculator/pages/BMI/containermodel.dart';
import 'package:bmi_calculator/pages/BMI/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splashscreen/splashscreen.dart';

enum Gender { male, female }

class BMIcalculator extends StatefulWidget {
  BMIcalculator({Key key}) : super(key: key);

  @override
  _BMIcalculatorState createState() => _BMIcalculatorState();
}

class _BMIcalculatorState extends State<BMIcalculator> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text(
        'BMI Calculator',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
      ),
      image: Image.asset(
        'images/splash1.png',
      ),
      photoSize: 150.0,
      backgroundColor: Color(0xFF1D1E33),
      seconds: 3,
      useLoader: false,
      navigateAfterSeconds: AfterSplash(),  
    );
  }
}

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  static const textstyle = TextStyle(
    color: Color(0xFF8D8E98),
    fontSize: 18,
  );
  static const numberTextstyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
  );
  static const activecardcolor = Color(0xFF1D1E33);
  static const inactivecardcolor = Color(0xFF111328);

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cusomcontainer(
                      tapFunction: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? activecardcolor
                          : inactivecardcolor,
                      newChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      )),
                ),
                Expanded(
                  child: Cusomcontainer(
                    tapFunction: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activecardcolor
                        : inactivecardcolor,
                    newChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cusomcontainer(
              color: activecardcolor,
              newChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: textstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextstyle,
                      ),
                      Text(
                        'cm',
                        style: textstyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    activeColor: Color(0xFFEB1555),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
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
                  child: Cusomcontainer(
                    color: activecardcolor,
                    newChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: textstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Cusomcontainer(
                    color: activecardcolor,
                    newChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: textstyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculateBMI calc = CalculateBMI(height: height, weight: weight);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ResultPage(
                    bmiResult: calc.calculateBMi(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  );
                },
              ));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 22.0,
                  horizontal: 110.0,
                ),
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              height: 80.0,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              color: Color(0xFFEB1555),
            ),
          ),
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  IconButton({this.child, @required this.onpressed});
  final Widget child;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      fillColor: Color(0xFF4C4F5E),
      child: child,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
    );
  }
}
