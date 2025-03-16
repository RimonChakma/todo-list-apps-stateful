import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  List<String> listItem =[];

  addItem(context){
    setState(() {
      listItem.add(context);
    });
  }

  deleteItem(index){
    setState(() {
      listItem.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Todo List Apps"),),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                flex: 90,
                child: TextFormField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      hintText: "enter your text"
                  ),),
              ),
              Expanded(
                  flex: 10,
                  child: IconButton(onPressed: (){
                    if(textEditingController.text.isNotEmpty){
                      addItem(textEditingController.text);
                    }textEditingController.clear();
                  }, icon: Icon(Icons.check)))
            ],),

            Expanded(
              child: ListView.builder(
                itemCount: listItem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listItem[index]),
                    trailing: IconButton(onPressed: (){
                      deleteItem(index);
                    }, icon: Icon(Icons.delete)),
                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}
