import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rhino_pizzeria/models/pizza.dart';
import 'package:rhino_pizzeria/models/single_modifire.dart';
import 'package:rhino_pizzeria/providers/food_provider.dart';
import 'package:rhino_pizzeria/widgets/add_modifier.dart';
import 'package:rhino_pizzeria/widgets/image_input.dart';
import 'package:rhino_pizzeria/widgets/modifire_list.dart';

class AddProductScreen extends StatefulWidget {
  static String AddProductScreenRoute = '/AddProductScreenRoute';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _form = GlobalKey<FormState>();
  final _descriptionFocusNode = FocusNode();
  // var _myImage;
  List<Modifier> _modifiersList = [];
  var _newPizza = Pizza(
    id: '',
    description: '',
    imageUrl: '',
    title: '',
    modifiers: [],
  );
  // get the image file
  void _selectImage(pickedImage) {
    // _myImage = pickedImage;

    setState(() {
      _newPizza = Pizza(
          id: _newPizza.id,
          description: _newPizza.description,
          imageUrl: pickedImage,
          title: _newPizza.title,
          modifiers: _newPizza.modifiers);
    });
  }

// push the modifires
  void _pushModifires(Modifier myOpj) {
    _modifiersList.add(myOpj);
    setState(() {
      _newPizza = Pizza(
          id: _newPizza.id,
          description: _newPizza.description,
          imageUrl: _newPizza.imageUrl,
          title: _newPizza.title,
          modifiers: _modifiersList);
    });
    // print(_newPizza.modifiers.length);
  }

  void _submitNewProduct() {
    _form.currentState!.save();
    Provider.of<FoodProvider>(context, listen: false).addPizza(_newPizza);
  }

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _newPizza.title,
                decoration: const InputDecoration(label: Text('Title')),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _newPizza = Pizza(
                      id: _newPizza.id,
                      description: _newPizza.description,
                      imageUrl: _newPizza.imageUrl,
                      title: value!,
                      modifiers: _newPizza.modifiers);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You have to set a Text as Title';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: _newPizza.description,
                decoration: const InputDecoration(
                  label: Text('description'),
                ),
                maxLines: 3,
                focusNode: _descriptionFocusNode,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  _newPizza = Pizza(
                      id: _newPizza.id,
                      description: value!,
                      imageUrl: _newPizza.imageUrl,
                      title: _newPizza.title,
                      modifiers: _newPizza.modifiers);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You have to set a Text as description';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ImageInput(_selectImage),
              const Text(
                'Your Modifiers',
                style: TextStyle(fontSize: 26),
              ),
              Container(
                  height: 100,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                      ),
                      child: Column(
                        children: [
                          if (_newPizza.modifiers.isNotEmpty)
                            ModifiresList(_modifiersList),
                        ],
                      ),
                    ),
                  )),
              AddModifire(_pushModifires),
              ElevatedButton(
                onPressed: _submitNewProduct,
                child: const Text('Submit Your Product'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
