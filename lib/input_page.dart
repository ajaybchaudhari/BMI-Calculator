import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'calculateBmi.dart';
enum gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height= 100;
  int weight= 60;
  int age = 20;
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = gender.male;
                      });
                    },
                    colour: selectedGender == gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: InsideChildCard(textname:'MALE', icon:  FontAwesomeIcons.male ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                    colour: selectedGender == gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: InsideChildCard(textname:'FEMALE', icon:  FontAwesomeIcons.female),
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: ReuseableCard(
                colour: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kHeavyWeightStyle),
                        Text('cm', style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kBottomContainerColor,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: kBottomContainerColorLight,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20),

                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 300,
                        onChanged: (double newvalue){
                          setState(() {
                            height = newvalue.round();
                          });
                        },

                      ),
                    )
                  ],
                ),
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kHeavyWeightStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed:(){
                                  setState(() {
                                    weight--;
                                  });
                                } ,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
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
                    child: ReuseableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kHeavyWeightStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed:(){
                                  setState(() {
                                    age--;
                                  });
                                } ,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
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
              )
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                CalculateBmi cal = CalculateBmi(height: height , weight: weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage(
                      bmiResult:  cal.calculator(),
                      bmiResultInterpretation: cal.getResultComent(),
                      bmiResultText: cal.getResult(),
                    ),
                ));
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                ),
              ),
              padding: EdgeInsets.only(bottom: 15.0),
              color: kBottomcontainercolor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
                ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon , @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      elevation: 6.0,
      onPressed: onPressed,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: kActiveCardColor,
    );
  }
}
