import 'package:task/task.dart' as task;
//Abstract persin class

abstract class Person {
  final String name;
  final String phone;
  final String address;
  final int age;
  final int _id;
  final int _salary;

  Person(this.name, this.phone, this.address, this.age, this._id, this._salary);
  getId();
  getSalary();
}

//=============================
//empolyeee class
class Empolyee implements Person {
  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;
  @override
  final int age;
  @override
  int _id = 0;
  @override
  int _salary = 0;

  final bool takeSalaryIsDone;
  final int hoursWork;

  Empolyee(
    this.takeSalaryIsDone,
    this.hoursWork, {
    required this.name,
    required this.phone,
    required this.address,
    required this.age,
    required int salary,
    required int id,
  }) {
    _id = id;
    _salary = salary;
  }

// get Id value
  @override
  getId() {
    return _id;
  }

// get salary value
  @override
  getSalary() {
    return _salary;
  }
// fun changing value of salary for maanager and empolyee
}

class Manager extends Empolyee {
  Manager(
    super.takeSalaryIsDone,
    super.hoursWork, {
    required super.name,
    required super.phone,
    required super.address,
    required super.age,
    required super.salary,
    required super.id,
  });
}

class Accountant extends Empolyee {
  Accountant(
    super.takeSalaryIsDone,
    super.hoursWork, {
    required super.name,
    required super.phone,
    required super.address,
    required super.age,
    required super.salary,
    required super.id,
  });
}

void setSalaryForEmployee(Empolyee empolye, int changeAmount) {
  if (empolye == Accountant) {
    empolye._salary = (empolye._salary + changeAmount);
  } else if (empolye == Manager) {
    empolye._salary = (empolye._salary + changeAmount);
  } else {
    print('you are not an mmanger or empolyee');
  }
}

class FlutterDeveloper extends Empolyee {
  FlutterDeveloper(
    super.takeSalaryIsDone,
    super.hoursWork, {
    required super.name,
    required super.phone,
    required super.address,
    required super.age,
    required super.salary,
    required super.id,
  });
}

class BackendDeveloper extends Empolyee {
  BackendDeveloper(
    super.takeSalaryIsDone,
    super.hoursWork, {
    required super.name,
    required super.phone,
    required super.address,
    required super.age,
    required super.salary,
    required super.id,
  });
}

class UiUxDeveloper extends Empolyee {
  UiUxDeveloper(
    super.takeSalaryIsDone,
    super.hoursWork, {
    required super.name,
    required super.phone,
    required super.address,
    required super.age,
    required super.salary,
    required super.id,
  });
}

class Project {}

class Team {
  final String teamName;
  final Empolyee teamLeader;
  final List<FlutterDeveloper> flutterGroup;
  final List<BackendDeveloper> backendGroup;
  final List<UiUxDeveloper> uiUxGroup;
  final List<Empolyee> allTeamDeveloper;
  final List<Project> projects;

  Team(
    this.teamName,
    this.teamLeader,
    this.flutterGroup,
    this.backendGroup,
    this.uiUxGroup,
    this.allTeamDeveloper,
    this.projects,
  );

  // printing flutter group
  void showNamesFlutterDevelopers() {
    if (flutterGroup.isEmpty) {
      print("there is no flutter developers");
    } else {
      for (var valu in flutterGroup) {
        print(valu);
      }
    }
  }

// print backend group
  void showNamesBackendDevelopers() {
    if (backendGroup.isEmpty) {
      print("there is no backend developers");
    } else {
      for (var valu in backendGroup) {
        print(valu);
      }
    }
  }

// print UiUx group
  void showNamesUiUxDevelopers() {
    if (uiUxGroup.isEmpty) {
      print("there is no ui/ux developers");
    } else {
      for (var valu in uiUxGroup) {
        print(valu);
      }
    }
    print('teamleader: $teamLeader');
  }

// print all devolopers
  void showNameAllDevelopers() {
    if (allTeamDeveloper.isEmpty) {
      print("there is no ui/ux developers");
    } else {
      for (var valu in allTeamDeveloper) {
        print(valu);
      }
    }
  }

  //add empolyee
  void addEmployeeToTeam(Empolyee e) {
    if (e is FlutterDeveloper && flutterGroup.length < 8) {
      flutterGroup.add(e);
      allTeamDeveloper.add(e);
      print(" added ${e.name} to flutter group");
    } else {
      print('the flutter group is full');
    }
    if (e is BackendDeveloper && backendGroup.length < 5) {
      backendGroup.add(e);
      allTeamDeveloper.add(e);
      print(" added ${e.name} to backend group");
    } else {
      print('the backend group is full');
    }
    if (e is UiUxDeveloper && uiUxGroup.length < 2) {
      uiUxGroup.add(e);
      allTeamDeveloper.add(e);
      print(" added ${e.name} to UiUx group");
    } else {
      print('the UiUx group is full');
    }
    print(
        " can't add this employee , the team want just flutter or backend or ui/ui developer");
  }

  void removeEmployeeFromTeam(Empolyee e) {
    //removing flutter dev
    if (flutterGroup.isEmpty) {
      print('“the flutter group is empty');
    } else {
      if (e is FlutterDeveloper) {
        for (int i = 0; i < flutterGroup.length; i++) {
          if (e._id == flutterGroup[i]._id) {
            flutterGroup.remove(flutterGroup[i]);
            print('removed ${e.name} from flutter group');
            for (int j = 0; j < flutterGroup.length; j++) {
              if (e._id == allTeamDeveloper[i]._id) {
                allTeamDeveloper.remove(allTeamDeveloper[j]);
              }
            }
          }
        }
      }
    }
    //removing backen dev
    if (backendGroup.isEmpty) {
      print('“the backend group is empty');
    } else {
      if (e is BackendDeveloper) {
        for (int i = 0; i < backendGroup.length; i++) {
          if (e._id == backendGroup[i]._id) {
            backendGroup.remove(backendGroup[i]);
            print('removed ${e.name} from backend group');
            for (int j = 0; j < flutterGroup.length; j++) {
              if (e._id == allTeamDeveloper[i]._id) {
                allTeamDeveloper.remove(allTeamDeveloper[j]);
              }
            }
          }
        }
      }
    }
    //removing UiUx dev
    if (uiUxGroup.isEmpty) {
      print('“the UiUx group is empty');
    } else {
      if (e is UiUxDeveloper) {
        for (int i = 0; i < uiUxGroup.length; i++) {
          if (e._id == uiUxGroup[i]._id) {
            uiUxGroup.remove(uiUxGroup[i]);
            print('removed ${e.name} from UiUx group');
            for (int j = 0; j < flutterGroup.length; j++) {
              if (e._id == allTeamDeveloper[i]._id) {
                allTeamDeveloper.remove(allTeamDeveloper[j]);
              }
            }
          }
        }
      }
    }
    if (e != FlutterDeveloper && e != BackendDeveloper && e != UiUxDeveloper) {
      print(
          'This employee cannot be removed, the team only has a Flutter and Backend Developer " "and a UI/UI Developer');
    }
  }
}

class Company {
  final String name;
  final String address;
  final String phone;
  final int account;
  final Manager manager;
  final Accountant accountant;
  List<Team>? listOfTeams = [];
  List<Empolyee>? listOfEmployee = [];

  Company(
    this.name,
    this.address,
    this.phone,
    this.account,
    this.manager,
    this.accountant,
  );
}

void main(List<String> arguments) {}
