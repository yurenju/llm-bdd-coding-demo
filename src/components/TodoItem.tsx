import React from 'react';
import type { Todo } from '../types/Todo';
import styles from './TodoItem.module.css';

interface TodoItemProps {
  todo: Todo;
  onToggle: (id: string) => void;
  onDelete: (id: string) => void;
}

export const TodoItem: React.FC<TodoItemProps> = ({ todo, onToggle, onDelete }) => {
  return (
    <div className={styles['todo-item']}>
      <input
        type="checkbox"
        checked={todo.completed}
        onChange={() => onToggle(todo.id)}
        className={styles['todo-checkbox']}
      />
      <span 
        className={`${styles['todo-text']} ${todo.completed ? styles['completed'] : ''}`}
      >
        {todo.text}
      </span>
      <button
        onClick={() => onDelete(todo.id)}
        className={styles['todo-delete']}
      >
        Delete
      </button>
    </div>
  );
};