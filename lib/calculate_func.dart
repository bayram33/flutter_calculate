import './user_data.dart';

class calculate {
  late UserData user;
  calculate(this.user);

  double bringResult() {
    double answer;
    answer = 100 + user.adet_Spor - user.adet_Sigara;
    answer = answer - (user.boy / user.kilo);
    if (user.gender == "KADIN") {
      answer = answer + 3;
    }
    return answer;
  }
}
