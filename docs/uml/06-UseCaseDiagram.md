# UML Use Case Diagram - Todo App

```
                                  +----------------------------------+
                                  |           Todo App               |
                                  +----------------------------------+
                                  |                                  |
                                  |  +-------------------------+     |
                                  |  |                         |     |
                                  |  |   Manage Tasks          |     |
                                  |  |                         |     |
+-------------+                   |  +-------------------------+     |
|             |                   |    ^ ^ ^ ^                       |
|             |---> Create Task ---|----+ | | |                      |
|             |                   |      | | |                       |
|             |---> View Tasks ----|------+ | |                      |
|   App User  |                   |        | |                       |
|             |---> Update Task ---|--------+ |                      |
|             |                   |          |                       |
|             |---> Delete Task ---|----------+                      |
|             |                   |                                  |
+-------------+                   |  +-------------------------+     |
        |                         |  |                         |     |
        |                         |  |   Manage Settings       |     |
        |                         |  |                         |     |
        |                         |  +-------------------------+     |
        |                         |    ^                             |
        +---> Toggle Theme -------|----+                             |
                                  |                                  |
                                  +----------------------------------+
```

## Actor Descriptions

### App User

The primary user of the Todo application who creates, views, updates, and deletes tasks, as well as manages application settings.

## Use Case Descriptions

### Manage Tasks

- **Create Task**: User adds a new task with title, description, due date, and priority
- **View Tasks**: User views the list of all tasks and can filter or sort them
- **Update Task**: User modifies an existing task, including marking it as complete
- **Delete Task**: User removes a task from the system

### Manage Settings

- **Toggle Theme**: User switches between light and dark themes
