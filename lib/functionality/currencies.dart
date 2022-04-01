import 'package:flutter/material.dart';

List<String> currencyFlags = [
  'unitedarab',
  'angolan',
  'argentina',
  'bangladesh',
  'burundian',
  'brazillian',
  'botswana',
  'congolese',
  'chinese',
  'colombian',
  'costarica',
  'djiboutian',
  'danish',
  'algerian',
  'ecuador',
  'european',
  'nigerian',
  'united-states'
];

List<String> currency = [
  'United Arab Emirates Dirham',
  'Angolan Kwanza',
  'Argentine Peso',
  'Bangladeshi Taka',
  'Burundian Franc',
  'Brazillian Real',
  'Botswana Pula',
  'Congolese Franc',
  'Chinese Yuan',
  'Colombian Peso',
  'Costa Rican Colon',
  'Djiboutain Franc',
  'Danish Krone',
  'Algerian Dinar',
  'Ecuadorian Sucre',
  'Euro',
  'Nigerian Naira',
  'United States Dollar'
  // 'Egyptian Pound',
  // 'Ethiopian Birr',
  // 'Euro',
  // 'British Pound',
  // 'Ghanian Cedi',
  // 'Gambian Dalasi',
  // 'Guinean Franc',
  // 'Hong Kong Dollar',
  // 'Haitian Gourde',
  // 'Indonesian Rupiah',
  // 'Indian Rupee',
  // 'Iranian Rial',
  // 'Jordanian Dinar'
  // 'Japanese Yen',
  // 'Kenyan Shilling',
  // 'Lebanese Pound',
  // 'Sri Lankan Rupee',
  // 'Liberian Dollar',
  // 'Moroccan Dirham',
  // 'Malagasy Ariary',
  // 'Myanmar Kyat',
  // 'Mauritanian ouguiya',
  // 'Mauritius Rupee',
  // 'Malawian Kwacha',
  // 'Mexican Peso',
  // 'Malaysian Ringgit',
  // 'Mozambican Metical',
  // 'Nigerian Naira',
  // 'Nepalese Rupee',
  // 'Omani Rial',
  // 'Panamanian Balboa',
  // 'Peruvian Sol',
  // 'Philippine Peso',
  // 'Pakistani Rupee',
  // 'Paraguayan Guarani',
  // 'Qatari Riyal',
  // 'Russian Ruble',
  // 'Rwanda Franc',
  // 'Saudi Riyal',
  // 'Sudanese Pound',
  // 'Sierra Leonean Leone',
  // 'Somali Shilling',
  // 'Thai Baht',
  // 'Tunisian Dinar',
  // 'Turkish Lira',
  // 'Tanzanian Shilling',
  // 'Ukranian Hryvnia',
  // 'Ugandan Shilling',
  // 'United States Dollar',
  // 'Venezuelan Bolivar',
  // 'Vietnamese Dong',
  // 'Central African CFA Franc',
  // 'CFA Franc (BCEAO)',
  // 'South African Rand',
  // 'Zambian Kwacha',
  // 'Zimbabwe Dollar'
];

List<String> currencyUnit = [
  'AED',
  'AOA',
  'ARS',
  'BDT',
  'BIF',
  'BRL',
  'BWP',
  'CDF',
  'CNY',
  'COP',
  'CRC',
  'DJF',
  'DKK',
  'DZD',
  'ECS',
  'EUR',
  'NGN',
  'USD'
  // 'EGP',
  // 'ETB',
  // 'EUR',
  // 'GBP',
  // 'GHS',
  // 'GMD',
  // 'GNF',
  // 'HKD',
  // 'HTG',
  // 'IDR',
  // 'INR',
  // 'IRR',
  // 'JOD',
  // 'JPY',
  // 'KES',
  // 'LBP',
  // 'LKR',
  // 'LRD',
  // 'MAD',
  // 'MGA',
  // 'MMK',
  // 'MRO',
  // 'MUR',
  // 'MWK',
  // 'MXN',
  // 'MYR',
  // 'MZN',
  // 'NGN',
  // 'NPR',
  // 'OMR',
  // 'PAB',
  // 'PEN',
  // 'PHP',
  // 'PKR',
  // 'PYG',
  // 'QAR',
  // 'RUB',
  // 'RWF',
  // 'SAR',
  // 'SDG',
  // 'SLL',
  // 'SOS',
  // 'THB',
  // 'TND',
  // 'TRY',
  // 'TZS',
  // 'UAH',
  // 'UGX',
  // 'USD',
  // 'VEF',
  // 'VND',
  // 'XAF',
  // 'XOF',
  // 'ZAR',
  // 'ZMW',
  // 'ZWL'
];

Map exchangeRates = {

};

class CurrencyInfo {
  String flag;
  String currency;
  String unit;

  CurrencyInfo({@required this.flag, @required this.currency, @required this.unit});

}

