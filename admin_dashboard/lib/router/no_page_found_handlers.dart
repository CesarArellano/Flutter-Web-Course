import 'package:admin_dashboard/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  
  static final Handler noPageFound = Handler(
    handlerFunc: ( _, parameters) {
      return const NoPageFoundView();
    },
  );
}