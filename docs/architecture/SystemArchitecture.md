# System Architecture Diagram

## Package Diagram

```
+-----------------------------------------------------------------------------------------------------+
|                                           Todo App                                                  |
+-----------------------------------------------------------------------------------------------------+
|                                                                                                     |
|  +-----------------+      +----------------------+      +----------------------+      +-----------+  |
|  |                 |      |                      |      |                      |      |           |  |
|  |  Presentation   |<---->|     Application      |<---->|     Infrastructure   |<---->|   Domain  |  |
|  |                 |      |                      |      |                      |      |           |  |
|  +-----------------+      +----------------------+      +----------------------+      +-----------+  |
|    |                        |                             |                             |            |
|    v                        v                             v                             v            |
|  +-----------------+      +----------------------+      +----------------------+      +-----------+  |
|  | - screens       |      | - services           |      | - repositories       |      | - entities |  |
|  | - widgets       |      | - controllers        |      | - data_sources       |      | - value    |  |
|  | - themes        |      | - use_cases          |      | - storage            |      |   objects  |  |
|  | - navigation    |      | - state_management   |      | - local_storage      |      | - enums    |  |
|  +-----------------+      +----------------------+      +----------------------+      +-----------+  |
|                                                                                                     |
+-----------------------------------------------------------------------------------------------------+
```

## Package/Class Diagram with Relationships

```
+--------------------------------------------------------------------------------------------------+
|                                      Todo App Architecture                                       |
+--------------------------------------------------------------------------------------------------+
|                                                                                                  |
|  +----------------+        +-------------------+        +-------------------+                    |
|  |    Domain      |        |    Application    |        |   Presentation    |                    |
|  +----------------+        +-------------------+        +-------------------+                    |
|  | +------------+ |        | +---------------+ |        | +--------------+  |                    |
|  | |   Task     | |<-------| |  TaskService  | |<-------| |  HomeScreen  |  |                    |
|  | +------------+ |        | +---------------+ |        | +--------------+  |                    |
|  |                |        |         ^         |        |        ^          |                    |
|  | +------------+ |        |         |         |        |        |          |                    |
|  | |  Settings  | |<-------| +---------------+ |        | +--------------+  |                    |
|  | +------------+ |        | |SettingsService| |<-------| |SettingsScreen|  |                    |
|  |                |        | +---------------+ |        | +--------------+  |                    |
|  +----------------+        +-------------------+        +-------------------+                    |
|          ^                          ^                            ^                               |
|          |                          |                            |                               |
|  +------------------+      +-------------------+        +-------------------+                    |
|  |   Domain Repos   |      |  Infrastructure   |        |   Widget Library  |                    |
|  +------------------+      +-------------------+        +-------------------+                    |
|  | +------------+   |      | +---------------+ |        | +--------------+  |                    |
|  | |TaskRepository|<------>| |TaskRepoImpl   | |        | |  TaskWidget  |  |                    |
|  | +------------+   |      | +---------------+ |        | +--------------+  |                    |
|  |                  |      |         ^         |        |                   |                    |
|  | +------------+   |      |         |         |        | +--------------+  |                    |
|  | |SettingsRepo |<------>| +---------------+ |        | |SettingsWidget|  |                    |
|  | +------------+   |      | |SettingsRepoImpl| |        | +--------------+  |                    |
|  |                  |      | +---------------+ |        |                   |                    |
|  +------------------+      +-------------------+        +-------------------+                    |
|                                     ^                                                            |
|                                     |                                                            |
|                            +-------------------+                                                 |
|                            |   Device Storage  |                                                 |
|                            +-------------------+                                                 |
|                            | +---------------+ |                                                 |
|                            | |Shared Prefs   | |                                                 |
|                            | +---------------+ |                                                 |
|                            |                   |                                                 |
|                            | +---------------+ |                                                 |
|                            | |Local Files    | |                                                 |
|                            | +---------------+ |                                                 |
|                            +-------------------+                                                 |
|                                                                                                  |
+--------------------------------------------------------------------------------------------------+
```

## Layer Descriptions

### 1. Presentation Layer

- **Responsibility**: Handles UI components and user interactions
- **Components**:
  - **Screens**: Full-screen UI components (HomeScreen, TaskDetailScreen, etc.)
  - **Widgets**: Reusable UI components (TaskListItem, PrioritySelector, etc.)
  - **Theme**: Application styling and theming
  - **Navigation**: Screen routing and navigation logic

### 2. Application Layer

- **Responsibility**: Contains application business logic and use cases
- **Components**:
  - **Services**: Orchestrates business operations (TaskService, SettingsService)
  - **Use Cases**: Individual business operations (CreateTask, CompleteTask, etc.)
  - **State Management**: Manages application state using providers

### 3. Infrastructure Layer

- **Responsibility**: Provides implementations for data access on the device
- **Components**:
  - **Repositories**: Implementations of domain repositories
  - **Data Sources**: Local data sources for persistent storage
  - **Storage**: Simple local storage mechanisms (Shared Preferences, local files)

### 4. Domain Layer

- **Responsibility**: Contains business entities and repository interfaces
- **Components**:
  - **Entities**: Business objects (Task, Settings, etc.)
  - **Repository Interfaces**: Defines data access contracts
  - **Value Objects**: Immutable objects representing domain concepts

## Key Relationships

1. **Presentation ↔ Application**:

   - Screens depend on Services for data and operations
   - Services notify Screens of state changes

2. **Application ↔ Domain**:

   - Services use Domain entities and repository interfaces
   - Services implement Domain business rules

3. **Application ↔ Infrastructure**:

   - Services use Repository implementations for data access
   - Repositories transform data between Domain and external formats

4. **Infrastructure ↔ Domain**:

   - Repository implementations satisfy Domain repository interfaces
   - Infrastructure layer uses Domain entities

5. **Infrastructure ↔ Device Storage**:
   - Infrastructure components interact with device storage mechanisms for saving and retrieving data

## Design Patterns Used

1. **Repository Pattern**: Abstracts data access logic from business logic
2. **Dependency Injection**: Services and repositories are injected into consumers
3. **Observer Pattern**: State changes are propagated to UI components
4. **Factory Pattern**: For creating complex objects
5. **Service Locator**: Provider-based service location for UI components
