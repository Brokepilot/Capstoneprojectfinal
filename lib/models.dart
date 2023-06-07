class CreditType {
  final String type;
  final int requiredCredits;
  int earnedCredits;

  CreditType(
      {required this.type,
      required this.requiredCredits,
      this.earnedCredits = 10});
}

class Semester {
  final String name;
  List<ClassTaken> classesTaken;

  Semester({required this.name, this.classesTaken = const []});

  void addClass(ClassTaken classTaken) {
    classesTaken.add(classTaken);
  }

  void removeClass(ClassTaken classTaken) {
    classesTaken.remove(classTaken);
  }
}




class ClassTaken {
  final String className;
  final String creditType;
  final int credits;

  ClassTaken(
      {required this.className,
      required this.creditType,
      required this.credits});
}

class User {
  int userid;
  List<CreditType> creditTypes;
  List<Semester> semesters;
  List<ClassTaken> allClasses;

  User({
    required this.userid,
    required this.creditTypes,
    required this.semesters,
    required this.allClasses,
  });

  //mainpage container calculator
  int requiredCreditsOfType(String type) {
    for (var creditType in creditTypes) {
      if (creditType.type == type) {
        return creditType.requiredCredits;
      }
    }
    return 0; // return 0 if the type is not found
  }

  // Calculate total credits earned
  int totalCreditsEarned() {
    int total = 0;
    for (var creditType in creditTypes) {
      total += creditType.earnedCredits;
    }
    return total;
  }

  // Calculate total credits currently taking
  int totalCreditsTaking() {
    int total = 0;
    for (var classTaken in allClasses) {
      total += classTaken.credits;
    }
    return total;
  }

  // Calculate total credits earned of a certain type
  int creditsEarnedOfType(String type) {
    int total = 0;
    for (var semester in semesters) {
      for (var classTaken in semester.classesTaken) {
        if (classTaken.creditType == type) {
          total += classTaken.credits;
        }
      }
    }
    return total;
  }
  // Calculate total credits in a particular semester
  int totalCreditsInSemester(String semesterName) {
    int total = 0;
    for (var semester in semesters) {
      if (semester.name == semesterName) {
        for (var classTaken in semester.classesTaken) {
          total += classTaken.credits;
        }
      }
    }
    return total;
  }

  // Calculate total credits taken so far
  int totalCreditsTaken() {
    int total = 0;
    for (var semester in semesters) {
      for (var classTaken in semester.classesTaken) {
        total += classTaken.credits;
      }
    }
    return total;
  }


void addClassToSemester(ClassTaken classTaken, Semester semester) {
  semester.addClass(classTaken);
  allClasses.add(classTaken);

  // Find the corresponding creditType and update earnedCredits
  for (var creditType in creditTypes) {
    if (creditType.type == classTaken.creditType) {
      creditType.earnedCredits += classTaken.credits;
    }
  }
}

void removeClassFromSemester(ClassTaken classTaken, Semester semester) {
  semester.removeClass(classTaken);
  allClasses.remove(classTaken);

  // Find the corresponding creditType and update earnedCredits
  for (var creditType in creditTypes) {
    if (creditType.type == classTaken.creditType) {
      creditType.earnedCredits -= classTaken.credits;
    }
  }
}
}