

import 'dart:math';

import 'package:data_structure/linked_list/doubly_linked_list.dart';
import 'package:data_structure/linked_list/single_linkedlist.dart';

void main(List<String> arguments) {
  // var linkedList  = SingleLinkedList();
  // linkedList.generateSingleLinked(noOfNodes:6);
  // linkedList.traverseSingleLinked();
  // print('\n========== Result ==========\n');
//   linkedList.addNodeEnd(data: Random().nextInt(100));
//   linkedList.addNodeStart(data: Random().nextInt(100));
//   linkedList.addNodeAt(position:3, data: Random().nextInt(100));
//   linkedList.deleteFirstNode();
//   linkedList.deleteAt(position: 2);
//   linkedList.clear();
//   linkedList.reverse();
//   linkedList.traverseSingleLinked();

  var doublyLinkedList = DoublyLinkedList();
  doublyLinkedList.generateDoublyLinkedList(noOfNodes: 5);
  doublyLinkedList.traverseDoublyLinkedList();
  print('\n========== Result ==========\n');
  // doublyLinkedList.addNodeStart(data: Random().nextInt(100));
  // doublyLinkedList.addNodeEnd(data: Random().nextInt(100));
  // doublyLinkedList.addNoteAt(data: Random().nextInt(100), position: 9);
  // doublyLinkedList.deleteFirstNode();
  // doublyLinkedList.deleteLastNode();
  // doublyLinkedList.deleteNodeAt(position: 5);
  doublyLinkedList.reverse();
  doublyLinkedList.traverseDoublyLinkedList();

  // reverseArray();
}

void reverseArray(){
  List array = [0,1,2,3,4,5,6];
  print(array);
  for(int i = 0; i < array.length / 2; i++){
    int temp = array[i];
    array[i] = array[array.length - i - 1];
    array[array.length - i - 1] = temp;
  }
  print(array);
}