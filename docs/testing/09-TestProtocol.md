# Test Protocol Documentation

## Test Execution Information

| Information      | Value                      |
| ---------------- | -------------------------- |
| Test Date        | April 7, 2025              |
| Tester Name      | Kaya Decurins              |
| App Version      | 1.0.0                      |
| Test Environment | Android                    |

## Test Results Summary

| Total Test Cases | Passed | Failed | Skipped |
| ---------------- | ------ | ------ | ------- |
| 7                | 7      | 0      | 0       |

## Detailed Test Results

### TC001: Create New Task

| Information    | Value         |
| -------------- | ------------- |
| Test Case ID   | TC001         |
| Test Date      | April 7, 2025 |
| Tester         | Kaya Decurins |
| Status         | PASSED        |
| Execution Time | ~ 30s         |

**Observations**:

- Task was successfully created
- All task details were accurately displayed in the list
- Navigation worked as expected

**Evidence**: Screenshot_20250407_TC001.png

---

### TC002: Mark Task as Complete

| Information    | Value         |
| -------------- | ------------- |
| Test Case ID   | TC002         |
| Test Date      | April 7, 2025 |
| Tester         | Kaya Decurins |
| Status         | PASSED        |
| Execution Time | ~ 10s         |

**Observations**:

- Checkbox toggled correctly
- Task visually indicated as complete with strikethrough text
- Status persisted after restarting the app

**Evidence**: Screenshot_20250407_TC002.png

---

### TC003: Edit Existing Task

| Information    | Value         |
| -------------- | ------------- |
| Test Case ID   | TC003         |
| Test Date      | April 7, 2025 |
| Tester         | Kaya Decurins |
| Status         | PASSED        |
| Execution Time | ~ 45s         |

**Observations**:

- Task details were successfully updated
- Changes reflected immediately on the home screen
- No issues with saving or displaying modified data

**Evidence**: Screenshot_20250407_TC003.png

---

### TC004: Delete Task

| Information    | Value         |
| -------------- | ------------- |
| Test Case ID   | TC004         |
| Test Date      | April 7, 2025 |
| Tester         | Kaya Decurins |
| Status         | PASSED        |
| Execution Time | ~ 30s         |

**Observations**:

- Task was successfully removed from the list
- Confirmation snackbar appeared as expected
- Deleted task did not reappear after app restart

**Evidence**: Screenshot_20250407_TC004.png

---

### TC005: Toggle Dark/light Mode

| Information    | Value         |
| -------------- | ------------- |
| Test Case ID   | TC005         |
| Test Date      | April 7, 2025 |
| Tester         | Kaya Decurins |
| Status         | PASSED        |
| Execution Time | ~ 20s         |

**Observations**:

- Theme toggled successfully between light and dark modes
- All UI elements adapted to the selected theme
- Theme preference was maintained after app restart

**Evidence**: Screenshot_20250407_TC005_light.png, Screenshot_20250407_TC005_dark.png

---

### TC006: App Performance Under Low Memory

| Information    | Value         |
| -------------- | ------------- |
| Test Case ID   | TC006         |
| Test Date      | April 7, 2025 |
| Tester         | Kaya Decurins |
| Status         | PASSED        |
| Execution Time | 3m 10s        |

**Observations**:

- Nothing happened, app continued to work perfectly fine.

**Evidence**: Screenshot_20250407_TC006.png, 

---

### TC007: Data Persistence After App Restart

| Information    | Value         |
| -------------- | ------------- |
| Test Case ID   | TC007         |
| Test Date      | April 7, 2025 |
| Tester         | Kaya Decurins |
| Status         | PASSED        |
| Execution Time | 10s           |

**Observations**:

- All tasks persisted after app restart
- Completed task status was correctly maintained
- All task details (priority, due date, description) were preserved

**Evidence**: Screenshot_20250407_TC007.png
