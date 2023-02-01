import 'dart:io';

void main(List<String> arguments) {
  inputData();
}

void inputData(){
  stdout.write("Person A\n");
  stdout.write("Age of Death : ");
  var ageA = int.parse(stdin.readLineSync()!);
  stdout.write("Year of Death : ");
  var yearA = int.parse(stdin.readLineSync()!);

  stdout.write("Person B\n");
  stdout.write("Age of Death : ");
  var ageB = int.parse(stdin.readLineSync()!);
  stdout.write("Year of Death : ");
  var yearB = int.parse(stdin.readLineSync()!);

  int calcA = calculate(ageA, yearA);
  stdout.write("Person A: $yearA - $ageA = $calcA, ");
  int deadA = killVilagers(calcA);
  stdout.write("number of people killed on year $calcA is: $deadA\n");

  int calcB = calculate(ageB, yearB);
  stdout.write("Person B: $yearB - $ageB = $calcB, ");
  int deadB = killVilagers(calcB);
  stdout.write("number of people killed on year $calcB is: $deadB\n");

  double fixAVG = avgKilled(deadA, deadB);
  stdout.write("Average Killed : $fixAVG");
}

int killVilagers(int time){
  int dead = 0;
  List<int> list = [0,1];
  if (time >=0 && time <= 2) {
    dead = time;
  } else if (time < 0) {
    dead = -1;
  } else {
    for (int i = 1; i < time; i++) {
      int a = list[i] + list[i - 1];
      list.add(a);
    }
    dead = list.fold(0, (tot, item) => tot + item);
    list.clear();
  }
  return dead;
}

int calculate (int age, int year){
  int time = year - age;
  return time;
}

double avgKilled (int deadA, int deadB){
  int totalDead = deadA + deadB;
  double avgDead = totalDead.toDouble()/2;
  return avgDead;
}



