

import 'package:common_component/component/route/route.dart';

abstract class IRouteTable {
   Map<String, RouteTableBuilder> get  tables; 
   Map<String, RouteViewBuilder> get  views{
     return <String, RouteViewBuilder>{};
   }

}