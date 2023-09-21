// OTP Screen text
import 'package:flutter/cupertino.dart';

const String tPhoneNumber = 'Code has been send to';
const String tResendCode = 'Resend code in';

// Api
const String baseUrl = 'https://fm-rating-afghanistan-land.trycloudflare.com/';

const String imageUrl =
    'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3400&q=80';

final List<Map<String, ImageIcon>> categoriesList = [
  {
    'Sofa': const ImageIcon(
      AssetImage('assets/images/sofa.png'),
    )
  },
  {
    'Chair': const ImageIcon(
      AssetImage('assets/images/chair.png'),
    )
  },
  {
    'Table': const ImageIcon(
      AssetImage('assets/images/table.png'),
    )
  },
  {
    'Kitchen': const ImageIcon(
      AssetImage('assets/images/kitchen.png'),
    )
  },
  {
    'Lamp': const ImageIcon(
      AssetImage('assets/images/lamp.png'),
    )
  },
  {
    'Cupboard': const ImageIcon(
      AssetImage('assets/images/cupboard.png'),
    )
  },
  {
    'Vase': const ImageIcon(
      AssetImage('assets/images/vase.png'),
    )
  },
  {
    'Others': const ImageIcon(
      AssetImage('assets/images/more.png'),
    )
  },
];

final List<String> mostPopularCategoriesList = [
  'All',
  'Sofa',
  'Chair',
  'Table',
  'Kitchen',
  'Lamp',
  'Cupboard',
  'Vase'
];
