import 'package:flutter/material.dart';
import '../models/item.dart';

const List<Item> _items = [
  Item(
    name: 'Хуушуур',
    totalPriceCents: 2000,
    uid: '1',
    imageProvider: NetworkImage(
        'https://www.travelbuddies.info/wp-content/uploads/2020/02/huushuur.jpg'),
  ),
  Item(
    name: 'Хоолондоо нэрийн цуйван',
    totalPriceCents: 15000,
    uid: '2',
    imageProvider: NetworkImage(
        'https://www.travelbuddies.info/wp-content/uploads/2020/02/tsuivan.jpg'),
  ),
  Item(
    name: 'Бууз',
    totalPriceCents: 1500,
    uid: '3',
    imageProvider: NetworkImage(
        'https://www.toptravelsights.com/wp-content/uploads/2023/02/Buuz.jpg'),
  ),
  Item(
    name: 'Монгол сет',
    totalPriceCents: 30000,
    uid: '4',
    imageProvider: NetworkImage(
        'https://truemongoliatravel.com/wp-content/uploads/2018/08/mongolian_national_food.jpg'),
  ),
  Item(
    name: 'Хуушуур',
    totalPriceCents: 1500,
    uid: '5',
    imageProvider: NetworkImage(
        'https://meanwhileinmongolia.com/wp-content/uploads/2020/06/Mongolian-Khuushuur.jpg'),
  ),
  Item(
    name: 'Өндөгтэй хуурга',
    totalPriceCents: 15000,
    uid: '6',
    imageProvider: NetworkImage(
        'https://pbs.twimg.com/media/EoePW4kUcAEBFbD?format=jpg&name=large'),
  ),
  Item(
    name: 'Банштай шөл',
    totalPriceCents: 10000,
    uid: '7',
    imageProvider:
        NetworkImage('https://khaanbuuz.mn/img/products/price/BRLP7451_2.jpg'),
  ),
];

List<Item> getMenuItems() => _items;
