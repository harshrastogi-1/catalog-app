import 'package:flutter/services.dart';

class CatalogData {
  Future<String> fetchData()async{
    return  
        await rootBundle.loadString("assets/files/catalog.json");
  }   
}
