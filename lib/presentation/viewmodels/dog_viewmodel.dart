import '../../data/models/dog_model.dart';
import '../../data/repositories/dog_repository.dart';

class DogViewModel {
  final DogRepository repository;

  DogViewModel(this.repository);

  Future<void> addDog(Dog dog) async {
    await repository.insertDog(dog);
  }

  Future<List<Dog>> getDogs() async {
    return await repository.getDogs();
  }
}
