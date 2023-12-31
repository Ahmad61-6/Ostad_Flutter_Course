// Created a Car class with properties:
// ●     brand (String),
// ●     model (String),
// ●     year (int),
// ●     milesDriven (double).
//
// Methods of this class are:
// ●     drive(double miles): Increases the milesDriven property by the provided distance value, simulating driving.
// ●     getMilesDriven(): Retrieves the current milesDriven value.
// ●     getBrand(): Retrieves the brand of the car.
// ●     getModel(): Retrieves the model of the car.
// ●     getYear(): Retrieves the manufacturing year of the car.
// ●     getAge(): Calculates and returns the age of the car.
// ●     Declaring a static variable numberOfCars to count the number of cars.

/* Expected output
Car 1: Toyota Camry 2020 Miles: 10000 Age: 3

Car 2: Honda Civic 2018 Miles: 8000 Age: 5

Car 3: FordF-1502015Miles:15000Age:
8 Total number of cars created: 3

 */



class Car{
  String? brand;
  String? model;
  int year;//Year of manufacture.
  double milesDriven;
  static int numberOfCars = 0;//count the number of instance.

  Car(
      {required this.brand,
        required this. model,
        required this.year,
         this.milesDriven = 0.0}){
    numberOfCars ++;//counting number of instance crated.
  }

  void drive(double miles){
    milesDriven+= miles;
  }

  double getMilesDriven(){
    return milesDriven;
  }

  String? getBrand(){
    return brand;
  }

  String? getModel(){
    return model;
  }

  int getYear(){
    return year;
  }

  int getAge(){
    int currentYear = DateTime.now().year;
  return currentYear - year;
  }


}

void main()
{
  //instance for car 1
Car toyota = Car(brand: "Toyota", model: "Camry", year: 2020);
toyota.drive(1000);//miles driven by toyota
print("Car ${Car.numberOfCars}: ${toyota.getBrand()} ${toyota.getModel()} ${toyota.getYear()} Miles: ${toyota.getMilesDriven().round()} Age: ${toyota.getAge()}");

//instance for car 2
  Car Honda = Car(brand: "Honda", model: "Civic", year: 2018);
  Honda.drive(8000);//miles driven by honda
  print("Car ${Car.numberOfCars}: ${Honda.getBrand()} ${Honda.getModel()} ${Honda.getYear()} Miles: ${Honda.getMilesDriven().round()} Age: ${Honda.getAge()}");

  //instance for car 3
  Car Ford = Car(brand: "Ford", model: "F-150", year: 2015);
  Ford.drive(15000);//miles driven by ford
  print("Car ${Car.numberOfCars}: ${Ford.getBrand()} ${Ford.getModel()} ${Ford.getYear()} Miles: ${Ford.getMilesDriven().round()} Age: ${Ford.getAge()}");
  print("${Ford.getAge()} Total number of cars created: ${Car.numberOfCars}");
}
