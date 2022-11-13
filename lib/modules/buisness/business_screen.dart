import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/state.dart';
import 'package:newsapp/shared/components/components.dart';

class BuisnessScreen extends StatelessWidget {
  const BuisnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return conditionalBuilder(list, context);
      },
    );
  }
}
