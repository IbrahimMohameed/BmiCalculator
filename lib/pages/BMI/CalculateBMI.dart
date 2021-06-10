import 'dart:math';

class CalculateBMI {
  final int height, weight;
  double bmi;
  CalculateBMI({this.height, this.weight});
  String calculateBMi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) 
      return 'Over Weight';
    else if (bmi > 18.5)
      return 'Normal';
    else
      return 'Under Weight';
  }

  String getInterpretation() {
    if (bmi >= 25)
      return 'You have a higher than normal body weight , Try to Exercise More.';
    else if (bmi > 18.5)
      return 'You have a normal body Weight , Good job.';
    else
      return 'You have a lower than normal body weight , You can eat a bit more.';
  }
  
}
