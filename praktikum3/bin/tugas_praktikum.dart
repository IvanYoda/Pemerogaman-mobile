void main() {
  String nama = "Muhammad Ivan Yoda Bellamy";
  String nim = "2241760094";
  
  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print('$i adalah bilangan prima - $nama, NIM: $nim');
    }
  }
}

bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}
