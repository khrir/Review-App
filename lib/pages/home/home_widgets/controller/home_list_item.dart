import 'package:flutter/material.dart';
import 'package:review_app/pages/home/home_widgets/model/home_list_model.dart';

class HomeListItem extends StatefulWidget {
  final HomeListModel homeListModel;

  const HomeListItem({Key? key, required this.homeListModel}) : super(key: key);

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  widget.homeListModel.materiaName,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("${widget.homeListModel.qtdTopicos} de 50 tópicos revisados"),
                // Add progress bar
              ],
            ),        
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                  "Praticar",
                  style: TextStyle(fontSize: 22, color: Color.fromRGBO(57, 57, 57, 1)),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
