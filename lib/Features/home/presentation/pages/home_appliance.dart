import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';
import 'package:flutter/material.dart';

class HomeApplianceItems extends StatelessWidget {
  // const HomeApplianceItems({super.key});

  List<DataEntity> Brands;
  int index;

  HomeApplianceItems(this.Brands, this.index);

  @override
  Widget build(BuildContext context) {



    return Stack(children: [
      Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(Brands[index].image ?? ""),
             fit: BoxFit.fill)),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: InkWell(
              child: ImageIcon(
            AssetImage(AppImages.faveBlue),
            color: AppColor.mainColor,
          )),
        ),
      ),
    ]);
  }
}
