

import 'dart:math';

import 'package:data_structure/linked_list/single_linkedlist.dart';

void main(List<String> arguments) {
  var linkedList  = SingleLinkedList();
  linkedList.generateSingleLinked(noOfNodes:5);
  linkedList.traverseSingleLinked();
  print('\n========== Result ==========\n');
//   linkedList.addNodeEnd(data: Random().nextInt(100));
//   linkedList.addNodeStart(data: Random().nextInt(100));
//   linkedList.addNodeAt(position:3, data: Random().nextInt(100));
//   linkedList.deleteFirstNode();
  linkedList.deleteLastNode();
  linkedList.traverseSingleLinked();
}
