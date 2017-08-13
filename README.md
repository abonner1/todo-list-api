# README

## Routes

### Users
```
POST   /api/users
GET    /api/users/:id
PATCH  /api/users/:id
PUT    /api/users/:id
DELETE /api/users/:id
```

### TodoLists
```
GET    /api/users/:user_id/todo_lists
POST   /api/users/:user_id/todo_lists
GET    /api/todo_lists/:id
PATCH  /api/todo_lists/:id
PUT    /api/todo_lists/:id
DELETE /api/todo_lists/:id
```

### Todos
```
POST   /api/todo_lists/:todo_list_id/todos
PATCH  /api/todos/:id
PUT    /api/todos/:id
DELETE /api/todos/:id
```

## Schema

User [id, first_name, last_name, email, password_digest, username]
- has many todo_lists

TodoList [id, name, user_id, date, isFavorited]
- belongs_to user
- has_many todos

Todo [id, description, todo_list_id, is_completed]
- belongs_to todo_list

## JSON Data Structure

```
{
  User: {
    firstName: "Andrew",
    lastName: "Bonner",
    email: "andrewbonner92@gmail.com",
    password: "password",
    username: "abonner1"
  },
  TodoLists: [
    {
      name: "Things to do today",
      id: 1,
      user_id: 3,
      date: 2017-08-13,
      isFavorited: false
    }
  ],
  Todos: [
    {
      id: 1,
      description: "Take out the trash",
      todoListId: 1,
      isCompleted: false
    },
    {
      id: 2,
      description: "Finish Redux",
      todoListId: 1,
      isCompleted: true
    },
    {
      id: 3,
      description: "Complete Rails API",
      todoListId: 1,
      isCompleted: false
    }
  ]
}
```
