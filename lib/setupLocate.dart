
import 'package:ecommapp/cartLoad.dart';
import 'package:ecommapp/dataLoad.dart';
import 'package:ecommapp/goglAuth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommapp/homeModel.dart';

GetIt locator = GetIt.instance;


void setupLocator() {

  locator.registerLazySingleton<goglAuth>(() => goglAuth());
  locator.registerLazySingleton<dataLoad>(() => dataLoad());
  locator.registerLazySingleton<cartLoad>(()=> cartLoad());
  locator.registerFactory<homeModel>(() => homeModel());

}