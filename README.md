# AI Code Generation Configuration for AutoHotkey v2

## Overview

This repository hosts the configuration file `ai-config-ahkv2.ahk`, designed to instruct an AI assistant (like ChatGPT, Claude, Gemini, etc.) on how to generate and modify AutoHotkey (AHK) v2 code according to specific standards and guidelines defined by the user.

The primary goal is to ensure consistency, maintainability, and adherence to best practices across multiple AHK scripts by centralizing the core ruleset and AI workflow instructions.

## Core Component: `ai-config-ahkv2.ahk`

The main file, [`ai-config-ahkv2.ahk`](ai-config-ahkv2.ahk), contains two key sections:

1.  **Section 1: AI Meta-Instructions & Workflow:** Defines *how* the AI must interact with this configuration, manage versions, handle local script-specific rules, and resolve conflicts. These are the operational procedures for the AI.
2.  **Section 2: General AHK v2 Ruleset:** Contains the language-specific coding standards, style guides, best practices, and mandatory requirements for writing AHK v2 code under this profile (Rule IDs G-...).

This file serves as the **single source of truth** for the general rules and AI behavior for AutoHotkey v2 scripts associated with this profile.

## How It Works

The intended workflow for the AI assistant is:

1.  **Reference in Local Script:** Each local `.ahk` script that the AI should process contains a header block at the very top pointing to the `ai-config-ahkv2.ahk` file in this repository via a URL.
2.  **Fetch Central Config:** Before modifying the local script, the AI MUST fetch and load the *entire* content of the central `ai-config-ahkv2.ahk` file.
3.  **Load Local Specifics:** The AI then loads the `SCRIPT-SPECIFIC RULESET` section found at the **end** of the local `.ahk` file being processed.
4.  **Version Synchronization:** The AI compares the versions of "Section 1" and "Section 2" from the fetched central file against its latest known versions (as per Meta-Instruction MI-2). It uses the *highest* version for each section and reports any discrepancies or updates.
5.  **Apply Combined Rules:** The AI applies the rules hierarchically: Meta-Instructions first, then the active General Rules, then the Script-Specific Rules, and finally the user's specific request for the current task. Conflicts are handled as defined in the Meta-Instructions (MI-4).

## Usage in Local `.ahk` Scripts

To enable this system for a specific AutoHotkey script, include the standard
header block at the very top, followed by metadata, configuration (if any),
the main script code (like hotkeys), and finally the script-specific rules
section at the very end. This structure mirrors simple, focused AHK v2 scripts.

**IMPORTANT:**
* Replace the placeholder URL with the **correct raw file URL** pointing to
  `ai-config-ahkv2.ahk` in *your* GitHub repository.
* Fill the `SCRIPT-SPECIFIC RULESET` section at the **end of the file** with
  requirements **unique** to that script, using concise language derived from
  your needs.

```ahk
;###############################################################################
; AI PROCESSING DIRECTIVES (MANDATORY PRE-PROCESSING)
;###############################################################################
; ACTION:      INITIALIZE RULESET before proceeding with user request.
;              Follow steps below meticulously.
;
; AI_TARGET:   AutoHotkey v2 ; <-- SPECIFY TARGET LANGUAGE/VERSION HERE
; SOURCE_URL:  https://github.com/YOUR_USERNAME/YOUR_REPO/blob/main/ai-config-ahkv2.ahk ; <-- SET URL TO MATCH TARGET!
; LOCAL_RULES: Parse SCRIPT-SPECIFIC RULESET section at END of THIS file.
; ---
; SYNC_CORE:   Execute these steps sequentially:
;              1. FETCH/LOAD Central_Meta & Central_General sections from SOURCE_URL.
;                 Handle fetch errors gracefully (report & halt).
;              2. COMPARE Central versions vs latest known versions held internally.
;                 (Use version comparison logic from Central_Meta MI-2).
;              3. DETERMINE ACTIVE ruleset for this task:
;                 Use HIGHEST available version for Meta & General sections.
;              4. **MUST REPORT** the ACTIVE versions determined in step 3
;                 (e.g., "Using Meta vX.Y, General vA.B") before proceeding.
; ---
; HIERARCHY:   Apply rules strictly in this order:
;              1. ACTIVE Central_Meta Instructions
;              2. ACTIVE Central_General Rules
;              3. LOCAL_RULES (from this file's end section)
;              4. User's specific request/prompt for the current task.
; PROCEED:     Execute user's request using the ACTIVE ruleset and adhering
;              to the specified HIERARCHY.
;-------------------------------------------------------------------------------
; META-INFO (AI confirms versions used in SYNC_CORE step 4)
; Using AI Meta-Instructions v?.? ; Using General Ruleset v?.?
;-------------------------------------------------------------------------------

#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn VarUnset, OutputDebug ; Example #Warn directive

;===============================================================================
; SCRIPT METADATA
;===============================================================================
global Script_Author := "Your Name"       ; Or retrieved from config/env
global Script_Version := "1.0.0"          ; This script's version
global Script_Title := "Simple Hotkey Sender" ; This script's title

;===============================================================================
; CONFIGURATION (User adjustable settings)
;===============================================================================
; (Empty for this simple example)
global cfg_TargetAppExe := "target-app.exe" ; Added for context example
global cfg_HotkeyExample := "^+!s"         ; Added for context example

;===============================================================================
; INTERNAL CONSTANTS & GLOBALS (Runtime state - Generally do not modify)
;===============================================================================
; (Empty for this simple example)

;===============================================================================
; FUNCTION DEFINITIONS
;===============================================================================
; (Empty for this simple example)

;===============================================================================
; AUTO-EXECUTE SECTION
;===============================================================================
OutputDebug("DBG: Script Initialization Started (" Script_Title " v" Script_Version ").")
OutputDebug("DBG: Initialization Complete.")
Return ; End of auto-execute section

;===============================================================================
; HOTKEYS
;===============================================================================

; --- Example Hotkey active only in Target App ---
#HotIf WinActive("ahk_exe " cfg_TargetAppExe) ; Context-sensitive hotkey
Hotkey(cfg_HotkeyExample, HandleExampleHotkey)
#HotIf ; End context

HandleExampleHotkey(*) {
    OutputDebug("DBG: Hotkey (" cfg_HotkeyExample ") triggered for " cfg_TargetAppExe)
    local codeToSend := "secret123" ; Example code
    try {
        SendInput codeToSend ; Use SendInput for reliability
        OutputDebug("DBG: Sent code via SendInput.")
    } catch Error as e {
        OutputDebug("ERR: Failed to SendInput code: " e.Message)
        MsgBox("Error sending code:`n" e.Message, Script_Title, 16) ; Use Script_Title constant
    }
}

; --- Global Exit Hotkey ---
^End:: ExitApp

; --- End of primary script code ---

; The following section contains rules specifically for AI processing of this file.
; It should generally be placed at the very end for readability.
;===============================================================================
; SCRIPT-SPECIFIC RULESET (Version: 1.0) <--- Keep this section updated!
;===============================================================================
; Focus on requirements ("What"), constraints, and workarounds unique to this script.
; Do NOT repeat General Rules (G-*). Reference them if needed.

; - REQ-HOTKEY: Implement the hotkey defined in `cfg_HotkeyExample`.
;     - It MUST send the predefined `codeToSend` sequence.
;     - It MUST only be active when `cfg_TargetAppExe` window is active.
;     - Verify correct use of `#HotIf` directive and `SendInput`.

; - REQ-MINIMALISM: This script must remain simple and resource-light.
;     - AVOID adding unnecessary complexity, GUIs, timers, or file I/O.
;     - Ensure no resources require explicit cleanup (Ref G-3.1).

;===============================================================================
; === END OF FILE ===
