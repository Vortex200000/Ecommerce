class ProductsEntity {
  ProductsEntity({
      this.results,
      this.data,});


  int? results;
  List<ProductsDataEntity>? data;



}

class ProductsDataEntity {
  ProductsDataEntity({
      this.sold, 
      this.images, 

      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover,
      this.brand, 
      // this.ratingsAverage,
      this.createdAt, 
      this.updatedAt,

  });


  int? sold;
  List<String>? images;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  dynamic brand;
  // double? ratingsAverage;
  String? createdAt;
  String? updatedAt;

}





