import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';

class GetAllBrandsModel extends CategorAndBrandsEntity{
  GetAllBrandsModel({
      this.results, 
      this.metadata, 
      super.data,});

  GetAllBrandsModel.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;


@override
  // TODO: implement props
  List<Object?> get props => super.props;

}

class Data extends DataEntity{
  Data({
      super.id,
      super.name,
      this.slug, 
      super.image,
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? slug;

  String? createdAt;
  String? updatedAt;



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