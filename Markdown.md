# Anwendungsfalldiagramm und Anforderungen

## A. Anwendungsfalldiagramm (Use Case Diagram)

```mermaid
graph TD
    User[Benutzer] -->|erstellt| CreateTodo[Todo erstellen]
    User -->|bearbeitet| EditTodo[Todo bearbeiten]
    User -->|löscht| DeleteTodo[Todo löschen]
    User -->|markiert als erledigt| CompleteTodo[Todo abschließen]
```

## B. Akteure

- **Benutzer**: Eine Person, die die Todo-App verwendet, um Aufgaben zu verwalten und zu organisieren.

## C. Nicht-funktionale Anforderungen (FURPS)

### Funktionalität (Functionality)

- Die App muss mindestens 75% der CRUD-Operationen (Create, Read, Update, Delete) für Todos erfolgreich ausführen können.
- Die App muss eine Offline-Funktionalität bieten, die mindestens 24 Stunden ohne Internetverbindung funktioniert.

### Benutzerfreundlichkeit (Usability)

- Die App muss eine durchschnittliche Ladezeit von unter 2 Sekunden aufweisen.
- Die App muss eine Touch-Zielgröße von mindestens 48x48 Pixeln für alle interaktiven Elemente bieten.

### Zuverlässigkeit (Reliability)

- Die App muss eine Verfügbarkeit von 100% gewährleisten.
- Die App muss Datenverlust bei Abstürzen verhindern, indem alle Änderungen mindestens alle 5 Minuten automatisch gespeichert werden.

### Performance (Performance)

- Die App muss mindestens 100 Todos gleichzeitig verwalten können, ohne dass die Applikation crasht.

### Supportability (Supportability)

- Die App muss eine durchschnittliche Fehlerbehebungszeit von unter 24 Stunden für kritische Fehler aufweisen.


# Test Concept Documentation

## Test Environment Description

### Hardware Environment

- **Mobile Devices**:
  - Primary test device: Google Pixel 6 (Android 12)
  - Secondary test devices:
    - Windows
- **Emulators/Simulators**:
  - Android Emulator: Pixel 4 with API 30 (Android 11)
  - Windows Simulator: Windows 11

### Software Environment

- **Development Environment**:
  - Flutter SDK version 3.10.0
  - Dart version 3.0.0
  - Android Studio 2023.1
  - Xcode 14.3
- **Testing Tools**:
  - Flutter Test framework for unit and widget tests
  - Manual Tests done by checking

### Network Environment

- Testing will be performed in the following network conditions:
  - Stable Wi-Fi connection (>50 Mbps)
  - Offline mode

## Test Methodology

### Testing Levels

1. **Unit Testing**:

   - Focus on testing individual components, services, and utility functions
   - Ensure business logic functions correctly in isolation

2. **Widget Testing (manual)**:

   - Test UI components in isolation
   - Verify rendering, layout, and user interactions
   - Test form validations and error handling

3. **Integration Testing (manual)**:

   - Test interaction between multiple components
   - Verify data flow between screens
   - Test navigation and state management

4. **System Testing (manual)**: 

   - End-to-end testing of complete user flows
   - Test app under realistic user scenarios
   - Verify all components work together correctly

### Testing Types

1. **Functional Testing**:

   - Verify all features work according to requirements
   - Test both positive and negative scenarios

2. **Performance Testing**:

   - Measure app startup time
   - Test responsiveness under load

3. **Usability Testing**:

   - Evaluate user experience with real users
   - Observe how users interact with the application
   - Collect feedback on UI/UX

4. **Compatibility Testing**:

   - Test on various device sizes and resolutions
   - Verify correct rendering on different screen densities

5. **Data Safety Testing**:

   - Verify data is correctly saved to device storage
   - Test data persistence across app restarts
   - Verify proper data cleanup when tasks are deleted

## Test Cases

### TC001: Create New Task

- **Identification**: TC001
- **Description**: Verify that a user can create a new task
- **Pre-conditions**:
  - App is installed and launched
  - User is on the Home screen
- **Steps**:
  1. Tap the "+" floating action button
  2. Enter "Buy groceries" in the title field
  3. Enter "Milk, eggs, bread" in the description field
  4. Select tomorrow's date as the due date
  5. Select "Medium" priority
  6. Tap the "Save" button
- **Expected Result**:
  - User is returned to the Home screen
  - The new task "Buy groceries" appears in the task list
  - The task shows the correct due date and priority

### TC002: Mark Task as Complete

- **Identification**: TC002
- **Description**: Verify that a user can mark a task as complete
- **Pre-conditions**:
  - App is installed and launched
  - At least one incomplete task exists in the task list
- **Steps**:
  1. Locate an incomplete task in the list
  2. Tap the checkbox next to the task
- **Expected Result**:
  - The checkbox becomes checked
  - The task is visually indicated as complete (strikethrough)
  - Task completion status is retained when returning to the app later

### TC003: Edit Existing Task

- **Identification**: TC003
- **Description**: Verify that a user can edit an existing task
- **Pre-conditions**:
  - App is installed and launched
  - At least one task exists in the task list
- **Steps**:
  1. Tap on an existing task in the list
  2. On the Task Detail screen, tap the "Edit" button
  3. Change the title to "Updated Task Title"
  5. Tap the "Save" button
- **Expected Result**:
  - User is returned to the Task Detail screen
  - The task details reflect the changes made
  - When navigating back to the Home screen, the updated task appears with the new title

### TC004: Delete Task

- **Identification**: TC004
- **Description**: Verify that a user can delete a task
- **Pre-conditions**:
  - App is installed and launched
  - At least one task exists in the task list
- **Steps**:
  1. Click on the three dots on the given task
  2. Tap the "Delete" button in the revealed action
- **Expected Result**:
  - The task is removed from the list
  - The task disappears 
  - The task remains deleted when returning to the app later

### TC005: Toggle Dark Mode

- **Identification**: TC005
- **Description**: Verify that a user can toggle between light and dark themes
- **Pre-conditions**:
  - App is installed and launched
  - User is on the Home screen
- **Steps**:
  1. Tap the settings icon in the app bar
  2. Toggle the "Dark Mode" switch to the opposite state
  3. Navigate back to the Home screen
- **Expected Result**:
  - The app theme changes according to the selection
  - All screens reflect the new theme
  - Theme preference is retained when the app is restarted

### TC006: App Performance Under Low Memory

- **Identification**: TC006
- **Description**: Verify that the app performs well under low memory conditions
- **Pre-conditions**:
  - App is installed on a test device
  - Test device has multiple apps running to simulate low memory
- **Steps**:
  1. Launch the Todo app
  2. Create 5 new tasks in quick succession
  3. Navigate between Home, Detail, and Settings screens multiple times
  4. Put the app in the background and return to it after using other memory-intensive apps
- **Expected Result**:
  - App remains responsive
  - No crashes or ANRs (Application Not Responding) occur
  - All task data is preserved

### TC007: Data Persistence After App Restart

- **Identification**: TC007
- **Description**: Verify that task data persists after app restart
- **Pre-conditions**:
  - App is installed and launched
  - User has created at least 3 tasks
  - User has marked at least 1 task as complete
- **Steps**:
  1. Force close the app
  2. Relaunch the app
- **Expected Result**:
  - All previously created tasks are displayed
  - Completed tasks maintain their completed status
  - Task details (due date, description) are preserved


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
