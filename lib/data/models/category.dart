// ignore_for_file: non_constant_identifier_names

import 'package:area_51/data/models/brand.dart';
import 'product.dart';

class Category {
  final String name;
  // final Image categoryImage;
  // final List<Image> productImages;
  final List<Brand> brandsList;
  final List<Product> productsList;

  final int impressions;
  final int clicks;
  final int addToCarts;
  final int sales;
  final DateTime dateAdded;
  final int stockAvail;
  final int likes;

  Category({
    required this.name,
    // required this.productImages,
    required this.brandsList,
    required this.productsList,
    required this.impressions,
    required this.clicks,
    required this.addToCarts,
    required this.sales,
    required this.dateAdded,
    required this.stockAvail,
    required this.likes,
  });
}
