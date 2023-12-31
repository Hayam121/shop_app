import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/login_model.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{}

class ShopSuccessGetCategoriesState extends ShopStates{}
class ShopErrorGetCategoriesState extends ShopStates{}

class ShopSuccessChangeFavoritesState extends ShopStates{
  final ChangeFavoritesModel model  ;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopLoadingGetFavoritesState extends ShopStates{}
class ShopChangeFavoritesState extends ShopStates{}
class ShopErrorChangeFavoritesState extends ShopStates{}


class ShopSuccessGetFavoritesState extends ShopStates{}
class ShopErrorGetFavoritesState extends ShopStates{}

class ShopLoadingUserDataState extends ShopStates{}
class ShopSuccessUserDataState extends ShopStates{
 ShopLoginModel loginModel ;

  ShopSuccessUserDataState(this.loginModel);
}
class ShopErrorUserDataState extends ShopStates{}


class ShopLoadingUpdateUserState extends ShopStates{}
class ShopSuccessUpdateUserState extends ShopStates{
  ShopLoginModel loginModel ;

  ShopSuccessUpdateUserState(this.loginModel);
}
class ShopErrorUpdateUserState extends ShopStates{}