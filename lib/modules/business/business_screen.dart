import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/shared/components/components.dart';
import 'package:newsapplication/shared/cubit/cubit.dart';
import 'package:newsapplication/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var list=NewsCubit.get(context).businessData;
          return articleBuilder(list,context);
        },

    );

  }
}
