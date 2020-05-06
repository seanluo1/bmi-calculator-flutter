import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double buttonHeight = 70;
const cardColOn = Color(0xff1d1e33);
const cardColOff = Color(0xff111328);
const buttCol = Color(0xffeb1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 180;
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
                    col: selectedGender == Gender.male ? cardColOn : cardColOff,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.accessibility_new, size: 50),
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
                        ? cardColOn
                        : cardColOff,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.backup, size: 50),
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
              col: cardColOn,
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
                    col: cardColOn,
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
                            Text('lbs'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
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
                    col: cardColOn,
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
          Container(
            color: buttCol,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: buttonHeight,
            child: FlatButton(
              child: Text(
                'Get yo BMI!',
                textScaleFactor: 2,
              ),
              onPressed: () {},
            ),
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
