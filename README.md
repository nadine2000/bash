# Folder and File Management Bash Scripts

This repository contains a set of Bash scripts designed to manage folders and files efficiently through a command-line interface. The scripts are modular, using functions to break down tasks into manageable steps. Each script can be developed, tested, and maintained independently, ensuring a cohesive and user-friendly experience.

---

## Scripts Overview

### 1. **Utility Script (`utility.sh`)**
This script provides utility functions for managing files and folders:

- **List Files**: Sort files in ascending or descending order by size.
- **Count Files by Extension**: Count the number of files by their extension and calculate the total size.
- **Show Folder Total Size**: Display the total size of the folder. If the size exceeds a specified limit, suggest compressing or deleting files.

---

### 2. **Read File Script (`read.sh`)**
This script is designed to read and analyze file contents:

- **Line-by-Line Printing**: Read a file line by line and print its contents.
- **Return Metrics**: Return the number of words, lines, and total file size.
- **Search Functionality**: Search for a specific term within the file. If the term is found, return the word location along with the regular output.

---

### 3. **Delete Script (`delete.sh`)**
This script handles file and folder deletion with safety checks:

- **Delete Options**:
  - Delete all contents of a folder (with details on the number of files and total disk usage).
  - Delete files of a specific extension.

---

### 4. **Manager Process (`manager.sh`)**
This script acts as the main menu to run the other scripts:

- **Script Options**: Display a menu of script options, where each selection runs one of the other scripts.
- **Infinite Loop**: The menu runs in an infinite loop until the user chooses to exit.

---

## How to Use

### Prerequisites
- Ensure you have **Bash** installed on your system.
- All scripts must be made executable before running.

### Setup
1. Clone the repository
2. run in terminal:
 -  a) chmod +x utility.sh read.sh delete.sh manager.sh
 - b) ./manager.sh
