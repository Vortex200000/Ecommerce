





import 'package:flutter/foundation.dart';

@immutable
abstract class HomePageEvent {}

class HomeGetBrandsEvent extends HomePageEvent {

}
class HomeGetCategoryesEvent extends HomePageEvent {

}


class HomeNavIndexChange extends HomePageEvent{

}

class HomeProductsEvent extends HomePageEvent{

}

class HomeAddToCart extends HomePageEvent{

}