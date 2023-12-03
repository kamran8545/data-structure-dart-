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

  /// Time complexity of this function is O(1) because there only one statment needed to delete first node
  /// Time complexity of deleting first element of an array is O(n) because when first element is deleted
  /// we have to shift all the remaining element of array to left.
  void deleteFirstNode(){
    if(node != null){
      node = node!.node; 
    }
  }

  /// Hence loop will run n-1 times and 1 is constant so the complexity will be O(n)
  /// Time complexity of array for deleting last element is O(1) because we do not need
  /// to traverse array in order to delete last element
  void deleteLastNode(){
    SingleLinkedList? headNode = node;
    if(headNode == null){
      return;
    }else if(headNode.node == null){
      node = null;
    }else {
      while(headNode!.node!.node != null){
        headNode = headNode.node;
      }
      headNode.node = null;
    }
  }


  void deleteAt({required int position}){
    SingleLinkedList? headNode = node;
    if(headNode == null){
      return;
    }else if(position == 1){
      node = node!.node;
    }else if(position > 1){
      SingleLinkedList? prefixNode;
      while(position > 1 && headNode!.node != null){
        prefixNode = headNode;
        headNode = headNode.node;
        position--;
      }
      prefixNode!.node = headNode!.node;
    }
  }

  void clear(){
    /// Method 1
    // node = null;

    /// Method 2
    if(node == null){
      return;
    }else{
      while(node!.node != null){
        SingleLinkedList? temp = node!.node;
        node = null;
        node = temp;
      }
      node = null;
    }


    /// Method 3
    // _clearLinkedListUsingRecursion();
  }

  /// Purpose of this method is to traverse each node and delete it
  /// in other programing languages like C user has to traverse to each node
  /// and free up the memory
  void _clearLinkedListUsingRecursion(){
    if(node == null){
      return;
    }
    SingleLinkedList? temp = node!.node;
    node = null;
    node = temp;
    temp = null;
    _clearLinkedListUsingRecursion();
  }

  void reverse(){
    if(node != null && node!.node != null){
      SingleLinkedList? headNode = node, nextNode, preNode;
      while(headNode != null){
        nextNode = headNode.node;
        // headNode.node = preNode;
        preNode = headNode;
        headNode = nextNode;
      }
      headNode = preNode;
      node = headNode;
    }
  }
}