import 'dart:math';

class CalculateBmi {
  CalculateBmi({this.height , this.weight});
  int height;
  int weight;
  double _bmi;

  String calculator(){
    _bmi = weight/pow(height/100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >=25)
      return 'Overweight';
    if(_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }


  String getResultComent(){
    if(_bmi >=25)
      return 'YOUR BMI IS HIGHER THAN USUAL';
    if(_bmi > 18.5)
      return 'Your BMI IS NORMAL';
    else
      return 'You BMI result is quite low you should eat more';
  }

}