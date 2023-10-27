import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/search_Cubit/saerch_states.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/network/remote/end_points.dart';
import 'package:shop_app/shared/constants.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);


  SearchModel? model ;

  void Search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      methodUrl: SEARCH,
      token: token,
      data:{
        "text" :text ,
      } ,
    ).then((value) {
      model=SearchModel.fromJson(value.data) ;
      emit(SearchSuccessState(model!)) ;

    }).catchError((error){
      print(error.toString()) ;
      emit(SearchErrorState()) ;
    });
  }
}
