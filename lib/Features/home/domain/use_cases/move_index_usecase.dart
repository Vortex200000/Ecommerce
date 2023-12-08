import 'package:ecommerce/Features/home/domain/repository/Home_repo.dart';

class MoveIndexUseCase{

  HomeRepo homeRepo;

  MoveIndexUseCase(this.homeRepo);

 int call(int index)=>homeRepo.MoveIndex(index);
}
