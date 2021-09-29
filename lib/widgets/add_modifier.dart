import 'package:flutter/material.dart';
import 'package:rhino_pizzeria/models/single_modifire.dart';

class AddModifire extends StatefulWidget {
  Function pushModifires;

  AddModifire(this.pushModifires);
  @override
  State<AddModifire> createState() => _AddModifireState();
}

class _AddModifireState extends State<AddModifire> {
  // ignore: prefer_final_fields
  Map _newModifier = {
    'modifierName': '',
    'modifierType': 'Radio',
    'modifierOptions': [],
  };
  int myCounter = 0;

  String _radioValue = 'Radio';
  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
    });

    _newModifier = {
      'modifierName': _newModifier['modifierName'],
      'modifierType': value,
      'modifierOptions': _newModifier['modifierOptions']
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          myCounter == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Modifires'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          myCounter = 1;
                        });
                      },
                      icon: const Icon(Icons.arrow_circle_down_outlined),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Modifires'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          myCounter = 0;
                        });
                      },
                      icon: const Icon(Icons.arrow_circle_up_outlined),
                    ),
                  ],
                ),
          myCounter == 0
              ? Text('data')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Modifire Name :',
                          style: TextStyle(fontSize: 26),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              label: Text(
                                'Name',
                              ),
                            ),
                            onChanged: (value) {
                              _newModifier = {
                                'modifierName': value,
                                'modifierType': _newModifier['modifierType'],
                                'modifierOptions':
                                    _newModifier['modifierOptions']
                              };
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Type :',
                          style: TextStyle(fontSize: 26),
                        ),
                        Column(
                          children: [
                            Radio(
                              value: 'Radio',
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            const Text(
                              'Radio',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Radio(
                              value: 'Select',
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            const Text(
                              'Select',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Radio(
                              value: 'Checkbox',
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            const Text(
                              'Checkbox',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Options: ',
                          style: TextStyle(fontSize: 26),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              helperText: 'use # between options',
                            ),
                            onChanged: (value) {
                              List myList = value.split('#');

                              _newModifier = {
                                'modifierName': _newModifier['modifierName'],
                                'modifierType': _newModifier['modifierType'],
                                'modifierOptions': myList
                              };
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                          onPressed: () {
                            widget.pushModifires(_newModifier);
                            _newModifier = {
                              'modifierName': '',
                              'modifierType': 'Radio',
                              'modifierOptions': [],
                            };
                            setState(() {
                              myCounter = 0;
                            });
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Add Modifier')),
                    ),
                  ],
                ),
        ]);
  }
}
