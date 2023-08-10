void main() {
  List<int> grades = [85, 92, 78, 65, 88, 72];

  double average = getAverageGrade(grades: grades);

  print("Student's average grade: $average");

  //using round() to round the average to the nearest integer.
  int roundAverage = average.round();
  print("Rounded average: $roundAverage");

  //Using if else to check weather the the student have passed or failed.
  if(roundAverage>=70) {
    print("Passed");
  }
  else {
    print("Failed");
  }
}

/*declaring getAverageGrade() function to get the average.
Parameters:
    List of grades
    
return type double:
    average of total marks
 */
double getAverageGrade({required List<int> grades}){
  int sum =0;

  for(int grades in grades){
    sum+=grades;
  }
  return sum/grades.length;

}
