/*
  # Create todos table with authentication

  1. New Tables
    - `todos`
      - `id` (uuid, primary key)
      - `user_id` (uuid, references auth.users)
      - `text` (text)
      - `completed` (boolean)
      - `created_at` (timestamp with time zone)
      - `due_date` (timestamp with time zone, nullable)
      - `priority` (text)
      - `notes` (text)

  2. Security
    - Enable RLS on `todos` table
    - Add policies for CRUD operations
    - Only authenticated users can access their own todos
*/

create table todos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users not null,
  text text not null,
  completed boolean default false,
  created_at timestamptz default now(),
  due_date timestamptz,
  priority text check (priority in ('low', 'medium', 'high')) default 'medium',
  notes text default '',
  
  constraint fk_user
    foreign key (user_id)
    references auth.users (id)
    on delete cascade
);

alter table todos enable row level security;

-- Allow users to read their own todos
create policy "Users can read own todos"
  on todos
  for select
  to authenticated
  using (auth.uid() = user_id);

-- Allow users to insert their own todos
create policy "Users can insert own todos"
  on todos
  for insert
  to authenticated
  with check (auth.uid() = user_id);

-- Allow users to update their own todos
create policy "Users can update own todos"
  on todos
  for update
  to authenticated
  using (auth.uid() = user_id);

-- Allow users to delete their own todos
create policy "Users can delete own todos"
  on todos
  for delete
  to authenticated
  using (auth.uid() = user_id);