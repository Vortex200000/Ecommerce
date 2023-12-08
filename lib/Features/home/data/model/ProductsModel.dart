import 'package:ecommerce/Features/home/domain/entites/ProductsEntity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel({
      super.results,
      this.metadata, 
      super.data,});

  ProductsModel.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Metadata? metadata;


}

class Data extends ProductsDataEntity{
  Data({
      super.sold,
      super.images,
      super.ratingsQuantity,
      super.id,
      super.title,
      super.slug,
      super.description,
      super.quantity,
      super.price,
      super.imageCover,

      super.brand,
      // super.ratingsAverage,
      super.createdAt,
      super.updatedAt,
    });

  Data.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {

      json['subcategory'].forEach((v) {

      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    brand = json['brand'];
    // ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }







}




class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;



}