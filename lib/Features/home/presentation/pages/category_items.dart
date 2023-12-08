import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';
import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatelessWidget {
  // const CategoryItems({super.key});


  List<DataEntity> Cat;
  int index;


  CategoryItems(this.Cat ,this.index);

  @override
  Widget build(BuildContext context) {




    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              Cat[index].image??""),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          Cat[index].name??"",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}