

import 'dart:math';

class DoublyLinkedListItem{
  DoublyLinkedListItem? next, prev;
  int? data;

  DoublyLinkedListItem.empty();

  DoublyLinkedListItem({this.data, this.next, this.prev});

}

class DoublyLinkedList{

  DoublyLinkedListItem? doublyLinkedListItem;

  void generateDoublyLinkedList({required int noOfNodes}){
    DoublyLinkedListItem? next, prev;
    while(noOfNodes > 0){
      if(doublyLinkedListItem == null){
        doublyLinkedListItem = DoublyLinkedListItem(data: Random().nextInt(100));
      }else if(doublyLinkedListItem != null && doublyLinkedListItem!.next == null){
        doublyLinkedListItem!.next = DoublyLinkedListItem(data: Random().nextInt(100), prev: doublyLinkedListItem);
        prev = doublyLinkedListItem;
        next = doublyLinkedListItem!.next;
      }else{
        next!.next = DoublyLinkedListItem(data: Random().nextInt(100), prev: next);
        prev = next;
        next = next.next;
      }
      noOfNodes--;
    }
  }

  void traverseDoublyLinkedList(){
    if(doublyLinkedListItem == null){
      print('Doubly Linked List is empty!');
    }else{
      DoublyLinkedListItem? headNote = doublyLinkedListItem;
      while(headNote != null){
        print('Previous => ${headNote.prev == null ? 'NULL' : headNote.prev!.data}, '
            'Current => ${headNote.data}, Next => ${headNote.next == null ? 'NULL' : headNote.next!.data}');
        headNote = headNote.next;
      }
    }
  }

  void addNodeStart({required int data}){
    if(doublyLinkedListItem == null){
      doublyLinkedListItem = DoublyLinkedListItem(data: data);
    }else {
      DoublyLinkedListItem temp = DoublyLinkedListItem(data: data, next: doublyLinkedListItem);
      doublyLinkedListItem!.prev = temp;
      doublyLinkedListItem = temp;
    }
  }

  void addNodeEnd({required int data}){
    if(doublyLinkedListItem == null){
      doublyLinkedListItem = DoublyLinkedListItem(data: data);
    }else if(doublyLinkedListItem != null && doublyLinkedListItem!.next == null){
      doublyLinkedListItem!.next = DoublyLinkedListItem(data: data, prev: doublyLinkedListItem);
    }else{
      DoublyLinkedListItem? headNote = doublyLinkedListItem;
      while(headNote!.next != null){
        headNote = headNote.next;
      }
      headNote.next = DoublyLinkedListItem(data: data, prev: headNote);
    }
  }

  void addNoteAt({required int data, required int position}){
    if(doublyLinkedListItem == null){
      doublyLinkedListItem = DoublyLinkedListItem(data: data);
    }else if(position == 1 || (doublyLinkedListItem != null && doublyLinkedListItem!.next == null)){
      doublyLinkedListItem = DoublyLinkedListItem(data: data, next: doublyLinkedListItem);
    }else {
      DoublyLinkedListItem? headNote = doublyLinkedListItem;
      while(headNote!.next != null && position > 1){
        headNote = headNote.next;
        position--;
      }
      if(headNote.next == null && position > 1){
        headNote.next = DoublyLinkedListItem(data: data, prev: headNote);
      }else{
        headNote.prev!.next = DoublyLinkedListItem(data: data, next: headNote);
      }
    }
  }

  void deleteFirstNode(){
    if(doublyLinkedListItem == null){
      return;
    }else{
      doublyLinkedListItem = doublyLinkedListItem!.next;
      /// When LinkedList size is greater than 1 update previous node of 1st node
      if(doublyLinkedListItem != null){
        doublyLinkedListItem!.prev = null;
      }
    }
  }

  void deleteLastNode(){
    if(doublyLinkedListItem == null){
      return;
    }else if(doublyLinkedListItem!.next == null){
      doublyLinkedListItem = doublyLinkedListItem!.next;
    }else{
      DoublyLinkedListItem? headNode = doublyLinkedListItem;
      while(headNode!.next != null){
        headNode = headNode.next;
      }
      headNode.prev!.next = null;
    }
  }

  void deleteNodeAt({required int position}){
    if(doublyLinkedListItem == null){
      return;
    }else if(doublyLinkedListItem!.next == null){
      doublyLinkedListItem = doublyLinkedListItem!.next;
    }else{
      DoublyLinkedListItem? headNode = doublyLinkedListItem;
      while(headNode!.next != null && position > 1){
        headNode = headNode.next;
        position--;
      }
      headNode.prev!.next = headNode.next;
    }
  }

  void reverse(){
    if(doublyLinkedListItem != null && doublyLinkedListItem!.next != null){
      DoublyLinkedListItem? headNode = doublyLinkedListItem, next = doublyLinkedListItem!.next;
      headNode!.next = null;
      headNode.prev = next;
      while(next != null){
        next.prev = next.next;
        next.next = headNode;
        headNode = next;
        next = next.prev;
      }
      doublyLinkedListItem = headNode;
    }
  }


}