import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult , @required this.bmiResultText , @required this.bmiResultInterpretation});
  final String bmiResult;
  final String bmiResultText;
  final String bmiResultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                'YOUR RESULT',
                style: kHeavyWeightStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResultText,
                    style: kLabelTextStyle,
                  ),
                  Text(
                    bmiResult,

                    style: kHeavyWeightStyle,
                  ),
                  Text(
                    bmiResultInterpretation,
                    style: kLabelTextStyle,
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                color: kBottomContainerColor,
                child: Text(
                    'RE-CALCULATE',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),

              ),
            ),
          ),


        ],
      ),
    );
  }
}
