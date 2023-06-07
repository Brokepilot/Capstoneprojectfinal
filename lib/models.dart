class CreditType {
  final String type;
  final int requiredCredits;
  int earnedCredits;

  CreditType({required this.type, required this.requiredCredits, this.earnedCredits = 10});
}
class Semester {
  final String name;
  final List<ClassTaken> classesTaken;

  Semester({required this.name, this.classesTaken = const []});
}

class ClassTaken {
  final String className;
  final String creditType;
  final int credits;

  ClassTaken({required this.className, required this.creditType, required this.credits});
}

class User {
  final int userid;
  final List<CreditType> creditTypes;
  final List<Semester> semesters;

  User({required this.userid, required this.creditTypes, required this.semesters});
}
