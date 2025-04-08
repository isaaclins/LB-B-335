# Todo App Storyboard

## Screen Flow Diagram

```
+---------------------+       +-----------------------+       +----------------------+
|                     |       |                       |       |                      |
|    Splash Screen    |------>|      Home Screen      |------>|   Task Detail Screen |
|                     |       |                       |       |                      |
+---------------------+       +-----------------------+       +----------------------+
                                    |           ^
                                    v           |
                              +-----------------------+
                              |                       |
                              |    Add Task Screen    |
                              |                       |
                              +-----------------------+
                                    |           ^
                                    v           |
                              +-----------------------+
                              |                       |
                              |   Settings Screen     |
                              |                       |
                              +-----------------------+
```

## Screen Descriptions

### Splash Screen

- App logo displayed
- Brief loading animation
- Transitions automatically to Home Screen

### Home Screen

- List of all todo tasks
- Each task shows:
  - Title
  - Due date (if set)
  - Completion status (checkbox)
- Floating action button to add new task
- Settings button in app bar
- Pull to refresh functionality
- Swipe to delete tasks
- Tap on task to view details

### Add Task Screen

- Form with fields for:
  - Task title (required)
  - Task description
  - Due date picker
  - Priority selector (Low, Medium, High)
- Save button to create task
- Cancel button to return to home screen

### Task Detail Screen

- Displays full task information:
  - Title
  - Description
  - Due date
  - Priority
  - Completion status
- Edit button to modify task
- Delete button to remove task
- Back button to return to home screen

### Settings Screen

- Toggle for dark/light theme
- About section with app information
- Reset app data option
- Back button to return to home screen

## User Interactions

1. User opens app

   - Splash screen displays briefly
   - Home screen loads with existing tasks

2. User adds new task

   - Taps "+" floating action button
   - Enters task details in Add Task screen
   - Taps "Save" to create task
   - Returns to Home screen with new task in list

3. User views task details

   - Taps on a task in the Home screen
   - Task Detail screen shows complete information
   - User can edit or delete task from this screen

4. User completes a task

   - On Home screen, taps checkbox on a task
   - Task is marked as complete and visually indicated

5. User changes app settings
   - Taps settings icon in app bar
   - Adjusts preferences in Settings screen
   - Changes are applied immediately
   - Returns to Home screen with new settings applied
