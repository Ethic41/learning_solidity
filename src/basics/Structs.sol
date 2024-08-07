// SPDX-License-Identifier: MIT
// -=-<[ Bismillahirrahmanirrahim ]>-=-
// -*- coding: utf-8 -*-
// @Date    : 2024-08-06 01:39:59
// @Author  : Dahir Muhammad Dahir (dahirmuhammad3@gmail.com)
pragma solidity ^0.8.26;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        // calling like a function call
        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // initilize empty struct then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false

        todos.push(todo);
    }

    function get(uint256 _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}

