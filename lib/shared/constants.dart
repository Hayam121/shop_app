import 'package:shop_app/Screens/shop_login_screen.dart';
import 'package:shop_app/network/local/cash_helper.dart';
import 'package:shop_app/shared/component.dart';

void SignOut(context){
  CashHelper.removeData (
    key: "token",
  ).then((value) {
    if (value !=null) {
      navigateAndFinish(
        context: context,
        widget: ShopLoginScreen(),
      );
    }
  });
}


String? token= "" ;