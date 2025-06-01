// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../domain/entities/home_item_entity.dart';
// import '../../controller/home_item_controller.dart';
//
// class HomeItemView extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Multi UI List')),
//       body: FutureBuilder<Map<String, List<HomeItemEntity>>>(
//         future: controller.getHomeItemsFuture(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           if (snapshot.hasError) return Center(child: Text('Error loading data'));
//
//           if (!snapshot.hasData) return SizedBox();
//
//           final data = snapshot.data!;
//
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 sectionTitle("Image Only"),
//                 buildList(data['homeImage'] ?? [], (item) => Image.network(item.image)),
//
//                 sectionTitle("Image + Title"),
//                 buildList(data['homeImageTitle'] ?? [], (item) => Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.network(item.image),
//                     SizedBox(height: 8),
//                     Text(item.title ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   ],
//                 )),
//
//                 sectionTitle("Image + Title + Subtitle"),
//                 buildList(data['homeImageSubTitle'] ?? [], (item) => Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.network(item.image),
//                     SizedBox(height: 8),
//                     Text(item.title ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                     Text(item.subtitle ?? '', style: TextStyle(color: Colors.grey)),
//                   ],
//                 )),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget buildList(List<HomeItemEntity> items, Widget Function(HomeItemEntity) itemBuilder) {
//     return SizedBox(
//       height: 220,
//       child: ListView.separated(
//         padding: EdgeInsets.all(10),
//         scrollDirection: Axis.horizontal,
//         itemCount: items.length,
//         separatorBuilder: (_, __) => SizedBox(width: 10),
//         itemBuilder: (context, index) => Container(
//           width: 160,
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade300),
//             borderRadius: BorderRadius.circular(12),
//             color: Colors.white,
//           ),
//           child: itemBuilder(items[index]),
//         ),
//       ),
//     );
//   }
//
//   Widget sectionTitle(String title) {
//     return Padding(
//       padding: EdgeInsets.only(left: 16, top: 20, bottom: 10),
//       child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//     );
//   }
// }
