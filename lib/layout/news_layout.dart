import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/modules/search/search_screen.dart';
import 'package:newsapplication/shared/components/components.dart';
import 'package:newsapplication/shared/cubit/cubit.dart';
import 'package:newsapplication/shared/cubit/states.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, NewsState state) {},
      builder: (BuildContext context, NewsState state) {
        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.Titles[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon:const Icon(Icons.search),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).changeAppMode();
                },
                icon:const Icon(Icons.brightness_4_outlined),
                iconSize: 30,
              )
            ],
          ),

          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                (cubit.changeIndex(index));
              },
              currentIndex: cubit.currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'Sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'Science'),
              ]),
        );
      },
    );
  }
}
