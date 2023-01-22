// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'product.dart';

class Brand {
  final String name;
  // final Image logo;
  final String description;
  final List<Product> productList;
  final double avgPrice;
  final double maxPrice;
  final double minPrice;

  final int impressions;
  final int sales;
  final int likes;

  Brand({
    required this.name,
    // required this.logo,
    required this.description,
    required this.productList,
    required this.avgPrice,
    required this.maxPrice,
    required this.minPrice,
    required this.impressions,
    required this.sales,
    required this.likes,
  });
}
