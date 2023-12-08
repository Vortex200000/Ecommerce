import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Core/utils/SearchBar.dart';
import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Core/utils/app_strings.dart';
import 'package:ecommerce/Features/home/domain/entites/ProductsEntity.dart';
import 'package:ecommerce/Features/home/presentation/pages/ItemColour.dart';

import 'package:ecommerce/Features/home/presentation/pages/SizeItemUnselected.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  ProductsDataEntity productEntityDetail;

  ProductDetails(this.productEntityDetail);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // const ProductDetails({super.key});
  List<Color> itemcolor = [
    Color(0xff2F2929),
    Color(0xffBC3018),
    Color(0xff0973DD),
    Color(0xff02B935),
    Color(0xffFF645A)
  ];

  int itemCounter = 0;
  List<int> Sizes = [39, 42, 40, 31, 38, 39];
  int i = 0;

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    // int? dataEntity = ModalRoute.of(context)?.settings.arguments as int?;
    return Scaffold(
      appBar: AppBar(
        title: flag == false
            ? Text(
                AppStrings.productDetails,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : SearchBarr(onClearTap),
        centerTitle: true,
        actions: [
          flag == false
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (flag == false) {
                      flag = true;
                    } else
                      flag = false;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(
            width: 32.w,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 30,
          ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Container(
                      width: 398.w,
                      height: 300.h,
                      child: CarouselSlider.builder(
                          itemCount: widget.productEntityDetail.images?.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: InkResponse(
                                  child: Image.network(
                                    widget.productEntityDetail.images?[index] ??
                                        "",
                                    width: 398.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            autoPlayCurve: Curves.linear,
                            scrollPhysics: BouncingScrollPhysics(),
                            autoPlay: true,
                            enlargeCenterPage: false,
                            height: 300.h,
                            enlargeFactor: 4,
                            animateToClosest: true,
                            viewportFraction: 1.5,
                            padEnds: false,
                            // clipBehavior: Clip.antiAliasWithSaveLayer,
                          )),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // image: DecorationImage(
                          //     image: NetworkImage(widget.productEntityDetail.imageCover??""),
                          //     fit: BoxFit.cover),
                          border:
                              Border.all(color: Color(0x2C004182), width: 2),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 15),
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          height: 25.h,
                          width: 25.w,
                          padding: EdgeInsets.all(4),
                          child: Image.asset(AppImages.faveBlue),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "${widget.productEntityDetail.title}",
                    maxLines: 5,
                  )),
                  Spacer(),
                  Expanded(
                      child: Text("EGP ${widget.productEntityDetail.price}"))
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "${widget.productEntityDetail.sold}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0x2C004182)),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "${widget.productEntityDetail.ratingsQuantity} (7,500)",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            if (itemCounter == 0) {
                              return;
                            } else
                              itemCounter--;
                            setState(() {});
                          },
                          onLongPress: () {
                            if (itemCounter == 0) {
                              return;
                            } else
                              while (i < itemCounter) {
                                itemCounter -= 1;
                              }
                            setState(() {});
                          },
                          child: ImageIcon(
                            AssetImage(AppImages.minusImage),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 22.w,
                        ),
                        Text(
                          "${itemCounter}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 22.w,
                        ),
                        InkWell(
                          onTap: () {
                            itemCounter++;
                            setState(() {});
                          },
                          child: ImageIcon(
                            AssetImage(AppImages.plusImage),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 18),
                  ),
                  Text("aprieff notesss",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Color(0x8c06004f))),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text("Size"),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 60.h,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        SizeItemUnSelected(Sizes, index)),
              )
              // SizedBox(height: 230.h,)
              ,
              Text("Color"),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 60.h,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemCount: itemcolor.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ItemColour(itemcolor[index]),
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Total Price",
                          style: TextStyle(
                            color: Color(0x8606004f),
                          )),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text("EGP ${widget.productEntityDetail.price}")
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 270.w,
                      height: 48.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                              Image.asset(AppImages.cart),
                              SizedBox(
                                width: 24.w,
                              ),
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 104.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  onClearTap(flags) {
    flags = false;
    flag = flags;
    setState(() {});
  }
}
