import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../cubit/cubit.dart';
class myClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path =Path();
    path.lineTo(0, size.height/1.25);
    path.cubicTo(
      size.width /2 *0.6,
      size.height *.5,
      size.width ,
      size.height *1.2,
      size.width *1.6,
      size.height /1.5,

    );
    path.lineTo(size.width, 0);
    return path;


  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
Widget defaultButton({
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 0.0,
   List<Color>? color,
  required Function function,
  required String text,
}) =>
    GestureDetector(

      child: Container(
        alignment: Alignment.center,
        width: 302,
        height: 62,
        decoration:BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF81D4FA),
                  Color(0xFF8D6E63),

                ])
        ),
        child: MaterialButton(
          onPressed: () {
            function();
          },

          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),

          ),

        ),

      ),
    );
Widget defaultTextButton({
  double radius = 0.0,
  required Function function,
  required String text,
}) => Container(

  child:   TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text.toUpperCase(),
       style: TextStyle(
         color: Colors.indigo
       ) ,
      )
     ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
),
);
Widget defaultFormField({
  // double raduis=0.0,
  required TextEditingController controller,
  required TextInputType type,
  onSubmit,
  onChanged,
  onTap,
  bool isPassword = false,
  required String? Function(String?)? validator ,
  required String lable,
  required IconData prefix,
  bool isClickabled = true,
  IconData? suffix,
  Function? suffixPressed,
}) => Container(

  child:   TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    enabled: isClickabled = true,
    onFieldSubmitted:
    onSubmit,
    onChanged:onChanged
    ,
    onTap:onTap,
    validator:validator
    ,
    decoration: InputDecoration(

      border:OutlineInputBorder(
        borderRadius: BorderRadius.circular(90),

      ) ,

      labelText: lable,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null
          ? IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(suffix))
          : null,
      // border:  OutlineInputBorder())),
      // decoration: BoxDecoration(
      // borderRadius: BorderRadius.circular(50)
    ),
  ),
);



Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);
Widget buildArticleItem(article, context) => InkWell(
  onTap: () {}
  // {
  //   navigateTo(context, WebViewScreen(article['url']),);
  // }
  ,
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              // mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: 100,
  ),
  fallback: (context) => isSearch
      ? Container()
      : const Center(child: CircularProgressIndicator()),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

// Widget buildListProduct(
//     model,
//     context, {
//       bool isOldPrice = true,
//     }) =>
    // InkWell(
    //   onTap: () {
    //     ShopCubit.get(context).getHomeData(model.id);
    //     // navigateTo(context, ProductDetails());
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: SizedBox(
    //       height: 120,
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Stack(
    //             alignment: AlignmentDirectional.bottomStart,
    //             children: [
    //               Image(
    //                 image: NetworkImage(model.image!),
    //               ),
    //               if (model.discount != 0 && isOldPrice)
    //                 Container(
    //                   color: Colors.red,
    //                   padding: const EdgeInsets.symmetric(horizontal: 5),
    //                   child: const Text(
    //                     'DISCOUNT',
    //                     style: TextStyle(
    //                       fontSize: 10,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //             ],
    //           ),
    //           const SizedBox(
    //             width: 20,
    //           ),
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   model.name!,
    //                   maxLines: 2,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: const TextStyle(fontSize: 14, height: 1.3),
    //                 ),
    //                 const Spacer(),
    //                 Row(
    //                   children: [
    //                     Text(
    //                       model.price.toString(),
    //                       maxLines: 2,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: const TextStyle(
    //                         fontSize: 12,
    //                         color: defaultColor,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       width: 5,
    //                     ),
    //                     if (model.oldPrice != 0 && isOldPrice)
    //                       Text(
    //                         model.oldPrice.toString(),
    //                         style: const TextStyle(
    //                           fontSize: 10,
    //                           color: Colors.grey,
    //                           decoration: TextDecoration.lineThrough,
    //                         ),
    //                       ),
    //                     const Spacer(),
    //                     IconButton(
    //                       icon: CircleAvatar(
    //                         radius: 15,
    //                         backgroundColor:
    //                         ShopCubit.get(context).favorites[model.id]!
    //                             ? defaultColor
    //                             : Colors.grey,
    //                         child: const Icon(
    //                           Icons.favorite_border,
    //                           size: 14,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                       onPressed: () {
    //                         ShopCubit.get(context).changeToFavorite(model.id);
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
