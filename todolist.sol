// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract TodoList {
struct Todo {
uint256 id;
string text;
bool completed;
}
uint256 public todoCount;
mapping(uint256 => Todo) public todos;
event TodoCreated(uint256 id, string text, bool completed);
event TodoCompleted(uint256 id, bool completed);
constructor() {
 todoCount = 0;
}
function createTodo(string memory _text) public {
uint256 id = todoCount;
 todos[id] = Todo(id, _text, false);
 todoCount++;
emit TodoCreated(id, _text, false);
}
function completeTodo(uint256 _id) public {
require(_id < todoCount, "Invalid to-do ID");
 todos[_id].completed = true;
emit TodoCompleted(_id, true);
}
}
