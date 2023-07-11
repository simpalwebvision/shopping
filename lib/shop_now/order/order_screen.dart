import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/shop_now/order/bloc/order_bloc.dart';
import 'package:shopping/shop_now/order/bloc/order_state.dart';
import 'package:shopping/widgets/common_loader.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoadingState) {
            return const CommonLoaderScreen();
          } else if (state is OrderDataLoadedState) {
            // return OrderLoadedWidget(orderedList: state.orderModel);
            return Container();
          } else {
            return const Text('Loading');
          }
        },
      ),
    );
  }
}

// class OrderLoadedWidget extends StatefulWidget {
//   final List<OrderModel> orderedList;
//   const OrderLoadedWidget({
//     Key? key,
//     required this.orderedList,
//   }) : super(key: key);

//   @override
//   State<OrderLoadedWidget> createState() => _OrderLoadedWidgetState();
// }

// class _OrderLoadedWidgetState extends State<OrderLoadedWidget> {
//   List<OrderModel> orderedList = [];
//   int _currentIndex = 0;
//   void _filtering(int index) {
//     orderedList.clear();
//     _currentIndex = index;

//     for (var element in widget.orderedList) {
//       if (element.orderStatus == index.toString()) {
//         orderedList.add(element);
//       }
//     }
//     if (mounted) setState(() {});
//   }

//   @override
//   void initState() {
//     _filtering(_currentIndex);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final routeName = ModalRoute.of(context)?.settings.name ?? '';

//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           titleSpacing: routeName != RouteNames.mainPage ? 0 : null,
//           automaticallyImplyLeading: routeName != RouteNames.mainPage,
//           titleTextStyle: const TextStyle(
//               color: blackColor, fontSize: 18, fontWeight: FontWeight.w600),
//           title: Text(Language.totalOrders.capitalizeByWord()),
//         ),
//         SliverToBoxAdapter(
//           child: ToggleButtonScrollComponent(
//             textList: list,
//             initialLabelIndex: _currentIndex,
//             onChange: _filtering,
//           ),
//         ),
//         if (orderedList.isEmpty) ...[
//           const SliverToBoxAdapter(child: EmptyOrderComponent()),
//         ] else ...[
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 // return Text(orderedList[index].id.toString());
//                 return OrderedListComponent(orderedItem: orderedList[index]);
//               },
//               childCount: orderedList.length,
//             ),
//           ),
//           const SliverToBoxAdapter(child: SizedBox(height: 30)),
//         ],
//         routeName == RouteNames.mainPage
//             ? const SliverToBoxAdapter(child: SizedBox(height: 65))
//             : const SliverToBoxAdapter(),
//       ],
//     );
//   }
// }
