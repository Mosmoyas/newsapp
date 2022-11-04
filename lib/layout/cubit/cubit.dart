import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);
}
