double heightInCmFromFeetInches(int height) {
  final feet = height ~/ 12;
  final inches = height % 12;
  return (feet * 30.48) + (inches * 2.54);
}

double weightInKgFromPounds(int weight) {
  return weight * 0.453592;
}