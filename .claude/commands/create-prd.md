# Rule: Generate Product Requirements Document (PRD)

## Goal

Guide the AI assistant to create a detailed Product Requirements Document (PRD) in Markdown format based on the user's initial prompt. The PRD should be clear, actionable, and suitable for junior developers to understand and implement the functionality.

## Process

1. **Receive Initial Prompt:** User provides a brief description or request for a new feature or functionality.
2. **Get Today's Date:** Use the appropriate command based on the operating system to get the correct date format (Windows: `powershell -Command "Get-Date -Format 'yyyyMMdd'"` / Linux/macOS: `date +%Y%m%d`).
3. **Ask Clarifying Questions:** Before writing the PRD, the AI _must_ ask clarifying questions to gather sufficient details. The goal is to understand the "what" and "why" of the feature, not necessarily the "how" (which will be solved by developers).
4. **Generate Feature SLUG:** Generate a short identifier based on the feature name (e.g., user-profile-editing, payment-gateway-integration).
5. **Generate PRD:** Based on the initial prompt and user's answers to clarifying questions, generate the PRD using the structure outlined below.
6. **Save PRD:** Save the generated document directly as `/spec/YYYYMMDD-[feature-slug]/prd.md` (using the date obtained in step 2).

## Clarifying Questions (Examples)

The AI should adapt its questions based on the prompt, but here are some common areas to explore:

- **Problem/Goal:** "What problem does this feature solve for users?" or "What is the main goal we want to achieve with this feature?"
- **Target Users:** "Who are the primary users of this feature?"
- **Core Functionality:** "Can you describe the key operations users should be able to perform with this feature?"
- **User Stories:** "Can you provide some user stories? (e.g., As a [user type], I want to [perform action] so that [get benefit].)"
- **Acceptance Criteria:** "How will we know this feature is successfully implemented? What are the key success criteria?"
- **Scope/Boundaries:** "Are there any specific things this feature _should not_ do (non-goals)?"
- **Data Requirements:** "What kind of data does this feature need to display or manipulate?"
- **Edge Cases:** "Are there any potential edge cases or error conditions we should consider?"

## PRD Structure

The generated PRD should include the following sections:

1. **Introduction/Overview:** Briefly describe the feature and the problem it solves. State the goals.
2. **Objectives:** List specific, measurable objectives for this feature.
3. **User Stories:** Detail user narratives explaining feature usage and benefits.
4. **Functional Requirements:** List specific functionalities the feature must have. Use clear, concise language (e.g., "The system must allow users to upload profile pictures."). Number these requirements.
5. **Non-Goals (Out of Scope):** Clearly state what this feature will _not_ include to manage scope.
6. **Design Considerations (Optional):** Link to mockups, describe UI/UX requirements, or mention related components/styles (if applicable).
7. **Technical Considerations (Optional):** Mention any known technical constraints, dependencies, or recommendations (e.g., "Should integrate with existing authentication module").
8. **Success Metrics:** How will the success of this feature be measured? (e.g., "Increase user engagement by 10%", "Reduce support tickets related to X").
9. **Open Questions:** List any remaining questions or areas needing further clarification.

## Target Audience

Assume the primary readers of the PRD are **junior developers**. Therefore, requirements should be clear, unambiguous, and avoid jargon as much as possible. Provide enough detail for them to understand the feature's purpose and core logic.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/spec/YYYYMMDD-[feature-slug]/` (YYYYMMDD is today's date format)
- **Filename:** `prd.md`

## Technical Implementation Notes

### Date Format Retrieval
Before starting to create the PRD, first use the following command to get today's date:

**Windows:**
```powershell
powershell -Command "Get-Date -Format 'yyyyMMdd'"
```

**Linux/macOS:**
```bash
date +%Y%m%d
```

### Directory Naming Convention
- Format: `spec/YYYYMMDD-feature-slug/`
- Example: If today is July 9, 2025, the directory would be `spec/20250709-keyboard-movement/`
- Feature slug should use lowercase letters and hyphens
- When using the `edit_file` tool, specify the full path directly; the tool will automatically create necessary directories

## Final Instructions

1. Do not start implementing the PRD
2. Ensure to ask user clarifying questions
3. Adopt user's answers to clarifying questions to refine the PRD
4. **Use the appropriate date command based on operating system to get the correct date format**
5. **When using the edit_file tool, specify the full path directly; no need to manually create directories**
6. After completion, inform the user that they can use the planning-tasks command to generate the corresponding task list