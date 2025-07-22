# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Todo application built with Vite + React + TypeScript following BDD (Behavior-Driven Development) methodology. The project includes detailed specifications in the `spec/` directory with PRD, acceptance criteria, and implementation plans.

## Development Commands

```bash
npm run dev        # Start development server (usually on port 5173/5174)
npm run build      # TypeScript check + production build
npm run lint       # Run ESLint
npm run preview    # Preview production build
```

## Network Access for MCP Browser

When running the development server with MCP (Model Context Protocol) in Docker, use the network IP address instead of localhost:
- The app runs on `http://172.24.173.103:5174/` (or similar network IP shown in console)
- Vite is configured with `host: true` to allow external connections

## Architecture

The application follows a component-based architecture with TypeScript:

- **Components**: Located in `src/components/`, each component has its own `.tsx` and `.module.css` file
- **State Management**: Uses React hooks (useState) with localStorage persistence via custom `useLocalStorage` hook
- **Type Safety**: All data structures are defined in `src/types/`
- **Styling**: CSS Modules for component-scoped styles with minimalist design

## BDD Workflow

1. Product requirements are defined in `spec/[date]-[feature]/prd.md`
2. Acceptance criteria use Gherkin syntax in `acceptance.feature`
3. Implementation follows the task breakdown in `implementation-plan.md`
4. Components are built incrementally and tested against acceptance criteria

## Current Implementation Status

The project structure is set up with partial implementation:
- TodoInput component (complete)
- TodoItem component (complete)
- useLocalStorage hook (complete)
- Main App integration (pending)
- TodoList component (pending)

## Key Technical Decisions

- **No Redux**: State is managed at the App level and passed via props
- **localStorage**: Used for persistence with the key `simple-todo-items`
- **CSS Modules**: For style isolation and maintainability
- **Minimalist UI**: Neutral colors (black, white, gray) with simple interactions