import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapplication/modules/web_view/web_view.dart';
import 'package:newsapplication/shared/cubit/cubit.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget buildArticle(artical, context) => InkWell(
      onTap: () {
        navigateTo(
            context,
            WebViewScreen(
              url: artical['url'],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              //  child: Icon(Icons.content_paste_search_outlined,size: 120,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${artical['urlToImage']}'
                        // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSikUkwyzB7VALLf0LRzaqPkoxy1ciySTvePw&s'
                        ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      "${artical['title']}",
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 3,
                    )),
                    Text(
                      "${artical['publishedAt']}",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticle(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: NewsCubit.get(context).businessData.length,
        );
      },
      fallback: (context) => Center(
        child: isSearch ? Container() : CircularProgressIndicator(),
      ),
    );
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType Type,
  required String? Function(String?) validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: Type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
