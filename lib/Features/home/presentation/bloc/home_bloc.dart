import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/data_sources/remote/Home_remoted_ds_impl.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';
import 'package:ecommerce/Features/home/data/repository/Home_repo_impl.dart';
import 'package:ecommerce/Features/home/domain/repository/Home_repo.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_UseCases.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_brands.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Geta_All_Products_UseCase.dart';
import 'package:ecommerce/Features/home/domain/use_cases/move_index_usecase.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_event.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_event.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  Getallcatusecase getallcatusecase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  MoveIndexUseCase moveIndexUseCase;
  GetAllProductsUseCase getAllProductsUseCase;

  static HomePageBloc get(context) => BlocProvider.of(context);

  HomePageBloc(this.getAllBrandsUseCase, this.getallcatusecase,
      this.moveIndexUseCase, this.getAllProductsUseCase)
      : super(HomePageInitial()) {
    on<HomePageEvent>((event, emit) async {
      if (event is HomeGetCategoryesEvent) {
        emit(state.CopyWith(homescreenstates: Homescreenstate.loading));

        var res = await getallcatusecase.call();
        res.fold((l) {
          emit(state.CopyWith(
              homescreenstates: Homescreenstate.getcaterror, homefailuress: l));
        }, (r) {
          emit(state.CopyWith(
              homescreenstates: Homescreenstate.getcatsucsess,
              Categoryes: r.data));
        });
      } else if (event is HomeGetBrandsEvent) {
        emit(state.CopyWith(homescreenstates: Homescreenstate.loading));

        var res = await getAllBrandsUseCase.Call();
        res.fold((l) {
          emit(state.CopyWith(
              homescreenstates: Homescreenstate.getbrandserror,
              homefailuress: l));
        }, (r) {
          emit(state.CopyWith(
              homescreenstates: Homescreenstate.getbrandssucsess,
              brands: r.data));
        });
      } else if (event is HomeNavIndexChange) {
        emit(state.CopyWith(indexx: state.index));
        int res = moveIndexUseCase.call(state.index ?? 0);
      } else if (event is HomeProductsEvent) {
        emit(state.CopyWith(homescreenstates: Homescreenstate.loading));

        var res = await getAllProductsUseCase.call();
        res.fold((l) {
          emit(state.CopyWith(
              homescreenstates: Homescreenstate.getProductsError,
              homefailuress: l));
        },
            (r) => {
                  emit(state.CopyWith(
                      homescreenstates: Homescreenstate.getProductsSucsess,
                      Productss: r.data))
                });
      }
    });
  }
}
