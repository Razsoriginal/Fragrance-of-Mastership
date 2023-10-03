// /*
//
// class CollectionOperations extends StatelessWidget {
//   const CollectionOperations({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Create New Collection"),
//         ),
//         body: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: getProportionateScreenWidth(20)),
//             child: CreateCollection()));
//   }
// }
// */
//
// class CreateCollectionPage extends StatefulWidget {
//   const CreateCollectionPage({Key? key, this.title, this.index})
//       : super(key: key);
//
//   final String? title;
//   final int? index;
//
//   @override
//   State<CreateCollectionPage> createState() => _CreateCollectionPageState();
// }
//
// class _CreateCollectionPageState extends State<CreateCollectionPage> {
//   final TextEditingController nameController = TextEditingController();
//   final List<int> removedTraditionIndices = [];
//
//   @override
//   void initState() {
//     if (widget.title != null) {
//       nameController.text = widget.title!;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final collectionProvider =
//         Provider.of<CollectionServiceProvider>(context, listen: false);
//     List filteredTraditions;
//
//     if (widget.index != null) {
//       filteredTraditions = GetTraditionsFromCollection.getFilteredTraditions(
//         context: context,
//         collectionProvider: collectionProvider,
//         collectionIndex: widget.index as int,
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             widget.index == null ? "Create New Collection" : "Edit Collection"),
//       ),
//       body: Padding(
//         padding:
//             EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: getProportionateScreenHeight(30),
//               ),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: 'Collection Name'),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Consumer<CollectionServiceProvider>(
//                 builder: (context, collectionProvider, _) {
//                   return Column(
//                     children: [
//                       if (widget.index != null)
//                         for (int index = 0;
//                             index < filteredTraditions.length;
//                             index++)
//                           ListTile(
//                             title: Text(filteredTraditions[index]["title"]),
//                             trailing: IconButton(
//                               icon: const Icon(Icons.clear),
//                               onPressed: () {
//                                 setState(() {
//                                   removedTraditionIndices.add(index);
//                                 });
//                               },
//                             ),
//                           ),
//                       DefaultButton(
//                         text: widget.index == null ? "Create" : "Save",
//                         press: () async {
//                           final newName = nameController.text;
//
//                           if (newName.isEmpty) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text(
//                                     'Please add a name for the collection'),
//                                 duration: Duration(seconds: 2),
//                               ),
//                             );
//                             return;
//                           }
//
//                           if (collectionProvider
//                               .doesCollectionExistWithName(newName)) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text(
//                                     'A collection with the same name already exists'),
//                                 duration: Duration(seconds: 2),
//                               ),
//                             );
//                             return;
//                           }
//
//                           if (widget.index == null) {
//                             final newCollection = Collection(
//                               newName,
//                               [], // Provide the filteredTraditions list here
//                             );
//
//                             collectionProvider.addCollection(newCollection);
//                           } else {
//                             collectionProvider.updateCollectionName(
//                               widget.index as int,
//                               newName,
//                             );
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Collection name updated'),
//                                 duration: Duration(seconds: 2),
//                               ),
//                             );
//                           }
//
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
