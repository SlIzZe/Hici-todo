export type Priority = 'low' | 'medium' | 'high';

export interface Todo {
  id: string;
  text: string;
  completed: boolean;
  createdAt: string;
  dueDate?: string;
  priority: Priority;
  notes: string;
}