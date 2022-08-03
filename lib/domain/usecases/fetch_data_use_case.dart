import '/data/respositories/home_repository.dart';
class FetchDataUseCase {
  
  Future<dynamic> execute() {
    return HomeRepositoryIml().fetchData();
  }
}
