# Rule: Plan Task List from PRD

## Goal

Guide the AI assistant to create a detailed, step-by-step task plan based on an existing Product Requirements Document (PRD) and use Claude Code's Todo system to track progress. This command analyzes the PRD and generates a structured task list while creating acceptance criteria files.

## Process

1. **Receive PRD Reference:** User points the AI to a specific PRD file or provides the directory path where the PRD is located
2. **Analyze PRD:** AI reads and analyzes the functional requirements, user stories, and other sections of the specified PRD
3. **Write Gherkin Acceptance Criteria:** Write high-level acceptance criteria for the entire PRD using Gherkin syntax and save as `acceptance.feature` file in the same directory as the PRD
4. **Phase 1: Generate Parent Tasks:** Based on PRD analysis and Gherkin acceptance criteria, generate the main high-level tasks needed to implement the feature (approximately 5-7)
5. **Use Todo System:** Add the generated tasks to Claude Code's Todo list with appropriate priorities
6. **Wait for Confirmation:** Show the high-level tasks to the user and ask if they need to be broken down into more detailed subtasks
7. **Phase 2: Generate Subtasks (Optional):** If the user requests, break down each parent task into smaller, actionable subtasks
8. **Identify Related Files:** Based on tasks and PRD, identify potential files that need to be created or modified
9. **Save Implementation Plan:** Save the complete task list, technical details, and file tracking information as `implementation-plan.md` file in the same directory as the PRD

## Todo Task Format

In Claude Code's Todo system, tasks should include:

- **Task Content**: Clear description of the work to be completed
- **Priority**:
  - `high`: Core feature implementation
  - `medium`: Supporting features or integration work
  - `low`: Optimization or documentation work
- **Status**:
  - `pending`: Not yet started
  - `in_progress`: Currently working on (only one at a time)
  - `completed`: Finished

## Task Examples

Based on PRD analysis, the Todo list might include:

```
1. [High Priority] Implement data model and database structure
2. [High Priority] Create core API endpoints
3. [Medium Priority] Develop frontend UI components
4. [Medium Priority] Implement state management logic
5. [Low Priority] Add error handling and validation
6. [High Priority] Execute acceptance tests
```

## Gherkin Acceptance Criteria File

Acceptance criteria should be written using Gherkin syntax and saved as `acceptance.feature` file in the same directory as the PRD:

- **File Location:** Same directory as PRD (e.g., `/spec/YYYYMMDD-[feature-slug]/acceptance.feature`)
- **File Format:** 

```gherkin
Feature: [Feature Name]
As a [user role]
I want to [desired action]
So that [expected outcome]

Scenario: [Scenario Name]
Given [precondition]
When [action performed]
Then [expected result]
And [additional validation]

Scenario: [Another Scenario Name]
Given [precondition]
When [action performed]
Then [expected result]

# Can include multiple Scenarios to cover different use cases
# Ensure coverage of core functionality and key user flows
```

This file will be used for subsequent acceptance test execution.

## Related File Tracking

When planning tasks, simultaneously identify:

- New files to be created
- Existing files to be modified
- Test file locations
- Configuration file updates

## Implementation Order Suggestions

1. **Utility Functions**: Helper functions and calculations
2. **Core Services**: Business logic and data processing
3. **API Integration**: External service communication
4. **State Management**: Application state logic
5. **UI Components**: User interface elements
6. **Integration Tests**: Acceptance criteria execution

## Acceptance Execution Methods

Acceptance tests can be executed through the following methods:

### UI Operation Acceptance
- When involving user interface operations (clicks, form filling, page navigation)
- Use appropriate tools to automate browser operations
- Verify page elements, content changes, state updates

### Command Execution Acceptance
- When involving command line operations or system behavior
- Execute relevant commands through terminal
- Check if execution results meet expectations

## Usage

1. User provides PRD file path
2. AI analyzes PRD and generates task plan
3. Create `acceptance.feature` file in the same directory as PRD
4. Add tasks to Todo system
5. Create `implementation-plan.md` file to record detailed implementation plan
6. Developers complete implementation step by step following Todo list
7. Mark each task as completed when finished
8. Finally execute acceptance tests in `acceptance.feature` to confirm feature completeness

## Notes

- Focus on concrete, actionable tasks
- Avoid over-decomposing tasks (maintain reasonable granularity)
- Ensure clear dependencies between tasks
- Use Todo system advantages for real-time progress tracking
- Acceptance criteria file (`acceptance.feature`) must be saved in the same directory as PRD
- Implementation plan file (`implementation-plan.md`) contains complete task details and technical information, also saved in the same directory as PRD
- Todo list is for tracking progress, acceptance criteria file is for final validation, implementation plan file is for recording technical details