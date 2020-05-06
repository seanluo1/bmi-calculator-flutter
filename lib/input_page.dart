import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'results_page.dart';
import 'constants.dart';
import 'calculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 22;
  /* Deprecated code that did gender card selection. Replaced with ternary operator
  void genderTap(Gender type) {
    if (type == Gender.male) {
      if (maleCol == cardColOff) {
        maleCol = cardColOn;
        femaleCol = cardColOff;
      } else {
        maleCol = cardColOff;
      }
    } else {
      if (femaleCol == cardColOff) {
        femaleCol = cardColOn;
        maleCol = cardColOff;
      } else {
        femaleCol = cardColOff;
      }
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch, //stretches all children
        children: [
          Expanded(
            // gender cards
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    col: selectedGender == Gender.male
                        ? kCardColOn
                        : kCardColOff,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars, size: 50),
                        SizedBox(height: 5),
                        Text('MALE'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    col: selectedGender == Gender.female
                        ? kCardColOn
                        : kCardColOff,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.venus, size: 50),
                        SizedBox(height: 5),
                        Text('FEMALE'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            //height slider
            child: ReusableCard(
              col: kCardColOn,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('cm'),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 300,
                    activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
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
                  child: ReusableCard(
                    //weight
                    col: kCardColOn,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text('kg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn1',
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 20),
                            FloatingActionButton(
                              heroTag: 'btn2',
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(Icons.keyboard_arrow_up,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    //age
                    col: kCardColOn,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text('years'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn3',
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 20),
                            FloatingActionButton(
                              heroTag: 'btn4',
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(Icons.keyboard_arrow_up,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
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
              CalculatorBrain calc = CalculatorBrain(
                weight: weight,
                height: height,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiNumber: calc.calculateBMI(),
                    bmiResult: calc.getResult(),
                  ),
                ),
              );
            },
            child: Container(
                color: kButtonCol,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: kButtonHeight,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    textScaleFactor: 2,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color col;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({this.onPress, this.col, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(15),
        ),
        //child: Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
