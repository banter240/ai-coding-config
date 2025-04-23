/*
; ===============================================================================
;       AI CODE GENERATION CONFIGURATION FOR AUTOHOTKEY V2 (RULESET ONLY)
; ===============================================================================
; Profile Name: ai-config-ahkv2.ahk (This File)
; Purpose:      Defines MANDATORY rules and instructions for an AI code generation
;               assistant processing AutoHotkey v2 scripts under this profile.
;               Serves as the central, version-controlled source.
;
; Concept Origin: The overall concept, structure, and iterative refinement of
;               this ruleset system originate from the user (banter240).
;               AI assistance was used for formatting, suggestions, and generation
;               based on user-provided examples and directives.
;
; Copyright:    Copyright (c) 2025 banter240
; License:      This ruleset file is licensed under the GNU General Public License v3.0.
;               See the LICENSE file in the root of the repository for details.
;
; Format:       Uses .ahk extension primarily for comment syntax highlighting.
;               *** THIS FILE IS A RULESET, NOT AN EXECUTABLE SCRIPT. ***
; Hosting:      Intended for hosting on GitHub. Local scripts MUST reference this file.
; ===============================================================================
*/

;###############################################################################
; SECTION 1: AI META-INSTRUCTIONS & WORKFLOW (Version: 4.8.1)
;###############################################################################
; Defines AI operational procedure. Execute before user task. Rules are MANDATORY.

; --- CORE PRINCIPLES ---
; [MI-0] RULESET SUPREMACY & AI ADHERENCE (MANDATORY)
;    - THIS RULESET IS LAW. The AI processing code under this profile MUST strictly
;      adhere to ALL rules (MI-*, G-*) contained herein without deviation.
;    - Rules CANNOT be bypassed or ignored by the AI.
;    - USER OVERRIDE: Deviation from rules is ONLY permissible if the AI explicitly
;      identifies the specific rule in question and the interactive user provides
;      explicit, unambiguous confirmation for that specific instance override.
;    - SELF-MAINTENANCE: When processing THIS file, AI MUST automatically perform
;      maintenance per MI-5 (Versioning) and MI-10 (Changelog).

; [MI-9] CLARIFICATION REQUEST (MANDATORY)
;    - If any rule (Meta, General, Specific) or user request is ambiguous or its
;      application is unclear, AI MUST ask for clarification BEFORE proceeding.
;      DO NOT MAKE ASSUMPTIONS.

; --- INITIALIZATION & SETUP ---
; [MI-1] INITIALIZATION: RULESET LOADING
;    - Before ANY task on local .ahk file:
;      1. Access THIS central config (`ai-config-ahkv2.ahk`) via `SOURCE_URL`
;         from local script header. Handle fetch errors (report & halt).
;      2. Load/Parse THIS file: Section 1 (Meta) & Section 2 (General Rules).
;         IGNORE `RULESET CHANGELOG` section during parsing for rule application (See MI-10).
;      3. Load/Parse `SCRIPT-SPECIFIC RULESET` section from END of local .ahk file.

; [MI-2] VERSION MANAGEMENT & SYNCHRONIZATION
;    - Track latest known versions internally for Sec 1 & Sec 2 of THIS central config.
;    - COMPARE fetched versions (from Step MI-1.2) vs latest known internal versions.
;    - DETERMINE ACTIVE ruleset: Use HIGHEST version number for Sec 1 & Sec 2 independently.
;    - REPORTING: Inform user of version mismatches/updates. **MUST REPORT** ACTIVE
;      versions (Meta vX.Y, General vA.B) used before proceeding.

; --- EXECUTION & VERIFICATION ---
; [MI-4] RULE APPLICATION HIERARCHY & CONFLICT RESOLUTION
;    - Apply rules strictly in order:
;      1. ACTIVE Section 1 (Meta-Instructions)
;      2. ACTIVE Section 2 (General AHKv2 Ruleset)
;      3. SCRIPT-SPECIFIC rules (from local file)
;      4. User's specific request/prompt.
;    - CONFLICTS: If ambiguity/conflict arises: HALT, state conflict, request user clarification.

; [MI-8] COMPREHENSIVE RULE APPLICATION ("apply ruleset")
;    - "apply ruleset to <filename>" implies FULL application of ACTIVE + local rules.
;    - Includes violation fixes AND cleanup/refactoring (G-7.1) unless user excludes specifics.
;    - Proactively enforce naming (G-6.2) & style rules throughout entire target script.

; [MI-7] FINAL OUTPUT VERIFICATION (AI Self-Check)
;    - After code generation/modification, self-check output against ALL applicable rules.
;    - Verify: Syntax, Formatting (G-6.1), Resources (G-3.1), Comments (G-7.2, G-9.2).
;    - Remove AI's intermediary comments from final code block. Remove comments violating G-9.2.

; --- USER INTERACTION & MAINTENANCE ---
; [MI-5] AI RULE MODIFICATION & VERSIONING (User Interaction)
;    - User is rule origin. If THIS file unreadable, HALT & report.
;    - AI suggestions for rule changes (here or local) REQUIRE:
;        a) Presentation via `diff` block (See MI-6).
;        b) Justification/Reason.
;        c) Explicit user confirmation PER CHANGE before applying.
;    - ON CONFIRMED CHANGE (Perform BEFORE providing final file):
;        - Change in Sec 1 -> Increment Sec 1 Version here. Update CHANGELOG (MI-10).
;        - Change in Sec 2 -> Increment Sec 2 Version here. Update CHANGELOG (MI-10).
;        - Change in Script-Specific -> Increment version in local file only.

; [MI-6] CHANGE PRESENTATION (DIFF BLOCKS)
;    - Use standard `diff` format for proposing/confirming ALL ruleset changes.
;    - Provide complete updated file content AFTER applying confirmed changes (incl. version/changelog).

; [MI-10] CHANGELOG HANDLING
;    - `RULESET CHANGELOG` section below is for human reference ONLY.
;    - IGNORE changelog content during rule application & code generation/analysis.
;    - UPDATE changelog ONLY WHEN applying a user-confirmed change to Sec 1 or Sec 2 (per MI-5).
;        - Add new entry at TOP. Format: `YYYY-MM-DD - vX.Y (Section) - Summary.`
;        - Keep only latest 5 entries. Remove oldest if needed.

;###############################################################################
; SECTION 2: GENERAL AHK v2 RULESET (Version: 2.2)
;###############################################################################
; Universal AutoHotkey v2 coding standards. Apply strictly per hierarchy MI-4.

; --- G-1: Core Syntax & Structure ---
; G-1.1: AHK v2 CORE SYNTAX & FEATURES
;    - Generated scripts MUST include `#Requires AutoHotkey v2.0` & `#SingleInstance Force`.
;    - MUST use AHK v2 features/syntax (`FuncRef`, `Map`, `Class`, `=>`, `try`/`catch`).
;    - MUST use braces `{}` for ALL control flow blocks (even single-line).
; G-1.2: VARIABLE SCOPE (Local Default)
;    - Default `local` in functions. Use `global` sparingly (config `cfg_`, state `g_`, events, consts).
;    - Prefer parameters/returns over globals.
;    - **Strict Declaration:** Declare ALL `local` vars at scope start (func definition line).
;      ; --- Example ---
;      ; MyFunc(p) { local a, b:=0; a=p*2; /*...*/ } ; Correct
;      ; MyFunc(p) { local a=p*2; if(a>10){ local b=5; /*BAD*/ } } ; Incorrect
;    - NO `local` declarations inside nested blocks (`if`, `Loop`, `try`, etc.).
;    - Auto-Execute section: AVOID `local` keyword (top level).
;    - Implicit Global Workaround: ONLY as last resort for compiler errors, with user confirmation.
; G-1.3: CONSTANTS (No Magic Values)
;    - Define constants (`global Const` or `global`) for literals (numbers, strings, API consts).
;    - Use constants in code.

; --- G-2: Error Prevention & Handling ---
; G-2.1: TRY-CATCH (Error Handling)
;    - MUST wrap error-prone ops (`DllCall`, COM, File I/O, etc.) in `try...catch`.
;    - Use `try { ... } catch Error as e { ... }`. Ensure braces `{}`.
; G-2.2: DLLCALL STRICTNESS
;    - MUST verify `DllCall` param types against API docs. Check return/`A_LastError`.
; G-2.3: ERROR REPORTING (Catch Blocks)
;    - Use `OutputDebug` for technical details (`e.Message`, `e.Stack`).
;    - Use `MsgBox` ONLY for critical errors needing user attention/halt. Include context.

; --- G-3: Resource Management ---
; G-3.1: CLEANUP & RESOURCE MANAGEMENT
;    - Persistent resources (Timers, GUI, Hooks, COM, Files, Mutexes) REQUIRE cleanup via `OnExit()`.
;    - MUST explicitly release/destroy ALL acquired resources (`Timer.Stop()`, `Gui.Destroy()`, etc.).
;    - Hooks: Call `Uninstall...Hook()` unconditionally in cleanup if used.
;    - Use helper functions for clarity (e.g., `CleanupResources()`). Verify release.

; --- G-4: Configuration & Design ---
; G-4.1: SCRIPT IDENTITY METADATA
;    - Define Title, Author, Version as `global Const` in `SCRIPT METADATA` section. Use consistently.
; G-4.2: EXTENSIVE CONFIGURATION
;    - STRONGLY prefer config vars (`cfg_`) over hardcoding behavior. Use `CONFIGURATION` section.
;    - Use clear names. For time values, use calculation + unit comments (e.g., `500 ; ms (0.5s)`).
; G-4.3: INTERNAL GLOBALS
;    - Separate runtime state globals (`g_`) from `cfg_`. Mark unsafe modification.
; G-4.4: CODE DYNAMISM
;    - Avoid hardcoding environment-dependent values. Use vars, config, `A_` vars, etc.
; G-4.5: FUNCTION DESIGN (SRP)
;    - Aim for functions with one clear task. Decompose complex logic. Keep short.
; G-4.6: DOCBLOCKS
;    - SHOULD add brief DocBlocks (`; ...`) for non-trivial functions (purpose, params, return).

; --- G-5: Specific AHK Practices & Performance ---
; G-5.1: `#WARN` HANDLING (VarUnset)
;    - AVOID local `#Warn` toggling. Prefer global `#Warn VarUnset, OutputDebug`.
;    - Explain effect (hides unless debugger attached). Avoid `#Warn VarUnset, Off` unless last resort.
; G-5.2: PERFORMANCE BASICS
;    - MUST use `Sleep` in polling loops/timers. Avoid redundant calcs in loops. Clarity > optimization.
; G-5.3: USER FEEDBACK
;    - Use `ToolTip`/`SplashText`/`TrayTip` for non-intrusive status. Use `MsgBox` only when essential.

; --- G-6: Code Style & Quality ---
; G-6.1: CODE FORMATTING
;    - Maintain readable format. Key Requirements:
;        - Indentation: 4 spaces. NO TABS.
;        - Spacing: Around binary operators; after commas; standard AHK function/control spacing.
;        - Line Length: Approx. 120 chars max. Break logically.
;        - Braces (`{}`): Always use for blocks (G-1.1). Style consistent.
; G-6.2: NAMING CONVENTIONS
;    - Variables: `cfg_PascalCase`, `g_PascalCase`, `localCamelCase`, `CONST_ALL_CAPS` (Be Consistent!)
;    - Functions/Classes: `PascalCase`.
;    - MUST apply chosen conventions consistently.
; G-6.3: OVERALL CONSISTENCY
;    - Strive for consistency in structure, formatting, commenting, logic patterns.

; --- G-7: Refinement ---
; G-7.1: CODE CLEANUP & REFACTORING
;    - After function confirmed stable, consider cleanup pass (remove dead code/comments, improve
;      structure, ensure consistency, verify cleanup) without altering behavior. User confirm recommended.
; G-7.2: COMMENTING STYLE
;    - Remove obvious comments. English only. Explain 'why'. Concise & accurate.
;    - Verify/Update comments near modified code. Consistent style (e.g., units ` ; ms (Xs)`).

; --- G-8: Final Verification ---
; G-8.1: FINAL SYNTAX & LOGIC CHECK
;    - After ANY change, review syntax (braces, parens, commas), logic, DllCall params.

; --- G-9: Meta-Rules (Ruleset Management) ---
; G-9.1: SCRIPT-SPECIFIC RULE STYLE
;    - Local rules SHOULD focus on "What" (requirements, constraints), not "How".
;    - AVOID repeating General Rules (G-*); reference if needed. No changelogs in local rules.
; G-9.2: DECLARATION LINE CLEANLINESS
;    - NO end-of-line comments on declarations (versions, metadata, cfg_, g_). Use lines above/below.

; === END OF AI CODE GENERATION CONFIGURATION (Rules sections end here) ===

;###############################################################################
; RULESET CHANGELOG (Last 5 Changes - For Human Reference Only)
; AI: Ignore this section during code generation/analysis. Update per MI-10.
;###############################################################################
; 2025-04-23 - v4.8.1 (Section 1) - Minor version bump for testing AI version detection.
; 2025-04-23 - v4.8 (Section 1)  - Generalized MI-0 User Override, removed specific user handle.
; 2025-04-23 - v4.7 (Section 1)  - Added user authorship/copyright/license notes to header. Updated MI-0.
; 2025-04-23 - v4.6 (Section 1)  - Added MI-0 (Ruleset Supremacy/Self-Adherence), reordered MI rules.
; 2025-04-23 - v4.5 (Section 1)  - Added MI-0 (Old#)/MI-10(New#) (Changelog Handling/Auto-Maintenance).
;###############################################################################
; === END OF FILE ===
