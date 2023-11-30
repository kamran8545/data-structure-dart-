import 'dart:math';

class SingleLinkedList{

  int data = -1;
  SingleLinkedList? node;

  SingleLinkedList({int data = -1, SingleLinkedList? link}) : data = data, node = link;

  /// This method will generate Single Linked List with n nodes
  void generateSingleLinked({required int noOfNodes}){
    SingleLinkedList? previousNode;
    for(int i = 1;i <= noOfNodes; i++){
      if(previousNode == null){
        node = SingleLinkedList(data:  Random().nextInt(100));
        previousNode = node;
      }else{
        previousNode.node = SingleLinkedList(data:  Random().nextInt(100));
        previousNode = previousNode.node;
      }
    }
  }

  void traverseSingleLinked(){
    SingleLinkedList? headNode = node;
    if(headNode == null){
      print('Linked List is empty!');
    }else{
      while(headNode!.node != null){
        print('Current Node Data => ${headNode.data}');
        headNode = headNode.node;
      }
      print('Current Node Data => ${headNode.data}');
    }
  }

  ///Time complexity of this method in 0(1)
  ///Time complexity of array will be 0(n) because we have shift all elements of arrays
  void addNodeStart({required int data}){
    if(node == null){
      node = SingleLinkedList(data: data);
    }else{
      SingleLinkedList? temp = node;
      node = SingleLinkedList(data: data);
      node!.node = temp;
    }
  }


  ///Time complexity of this method in 0(n) because we are traversing to the end of linked list
  ///If we do not traverse and store the last node some then add the element at the end then Time Complexity will be 0(1)
  ///For arrays if array has some empty slots then Time complexity will 0(1)
  ///and if arrays is full then Time compexity will be 0(n) because we have to create new array copy all the elements and add new element
  void addNodeEnd({required int data}){
    SingleLinkedList? headNode = node;
    if(headNode == null){
      node = SingleLinkedList(data: data);
    }else{
      while(headNode!.node != null){
        headNode = headNode.node;
      }
      headNode.node = SingleLinkedList(data:  data,);
    }
  }

  /// Time complexity of this method is O(n) because will have to traverse n to to add node at particular position
  void addNodeAt({required int position, required int data}){
    SingleLinkedList? headNode = node;
    if(headNode == null){
      node = SingleLinkedList(data: data);
    }else if(position <= 1){
      node = SingleLinkedList(data: data, link: headNode);
    }else{
      position--;
      while(position > 1 && headNode != null && headNode.node != null){
        headNode = headNode.node;
        position--;
      }
      SingleLinkedList? suffixNode = headNode!.node;
      headNode.node = SingleLinkedList(data: data, link: suffixNode);
    }
  }
  
  void deleteFirstNode(){
    if(node != null){
      node = node!.node; 
    }
  }

  void deleteLastNode(){
    SingleLinkedList? headNode = node;
    if(headNode == null){
      return;
    }else if(headNode.node == null){
      node = null;
    }else {
      SingleLinkedList? secondLastNode;
      while(headNode!.node != null){
        secondLastNode = headNode;
        headNode = headNode.node;
      }
      secondLastNode!.node = null;
    }
  }

}