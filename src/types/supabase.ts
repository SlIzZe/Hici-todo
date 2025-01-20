export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      todos: {
        Row: {
          id: string
          user_id: string
          text: string
          completed: boolean
          created_at: string
          due_date: string | null
          priority: 'low' | 'medium' | 'high'
          notes: string
        }
        Insert: {
          id?: string
          user_id: string
          text: string
          completed?: boolean
          created_at?: string
          due_date?: string | null
          priority?: 'low' | 'medium' | 'high'
          notes?: string
        }
        Update: {
          id?: string
          user_id?: string
          text?: string
          completed?: boolean
          created_at?: string
          due_date?: string | null
          priority?: 'low' | 'medium' | 'high'
          notes?: string
        }
      }
    }
  }
}