// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/pages/details_page.dart';
import 'package:news_app/view/widgets/image_item_widget.dart';
import 'package:news_app/view_model/home_cubit.dart';
import 'package:news_app/view_model/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit();
    homeCubit.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877F2),
        foregroundColor: Color(0xffffffff),
        title: Text(
          'News App',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          if(state is SuccessState){
            return ListView.builder(
              itemBuilder: (context, index) {
                return ImageItemWidget(
                  image: state.articles[index].urlToImage ?? dummyImage,
                  title: state.articles[index].title ?? "",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsPage(articles: state.articles[index]),
                      ),
                    );
                  },
                );
              },
              itemCount: state.articles.length,
            );
          }else if(state is ErrorState){
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }else{
            return Skeletonizer(
              enabled: true,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ImageItemWidget(
                    image: dummyImage,
                    title: 'Image is Loading...',
                  );
                },
                itemCount: 10,
              ),
            );
          }
        },
      ),
    );
  }
}

String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';
