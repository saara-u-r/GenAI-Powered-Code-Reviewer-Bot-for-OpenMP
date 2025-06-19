# GenAI-Powered Code Reviewer Bot for OpenMP

Python-first prototype of a Clang-compatible CLI tool that analyzes OpenMP-related pull requests and suggests review comments using GenAI, trained on historical GitHub data.

## Dependencies

Install the required Python packages:

```bash
pip install -r requirements.txt
```

## Environment Setup

Create a `.env` file in the project root with your GitHub token:

```env
GITHUB_TOKEN=ghp_your_personal_access_token_here
GEMINI_API_KEY=your_gemini_api_key
```

> Make sure your token has at least `read:public_repo` or `repo` scope.

---

## File Structure

```bash
.
├── .env
├── requirements.txt
├── run_preprocessing.sh
├── data/
│   ├── openmp_prs.json
│   ├── openmp_hunks_comments.json
│   ├── openmp_indexed_closed_prs.json
│   ├── mapping_stats.json
│   ├── faiss_index.idx
│   └── comments_lookup.json
├── src/
│   ├── collect_data.py
│   ├── find_comments.py
│   ├── preprocess_data.py
│   ├── analyze_mappings.py
│   ├── build_vector_db.py
│   ├── diff_utils.py
│   └── suggest_code_review.py

```

## Project Workflow

### 1. Find PRs with Review Comments

```bash
python src/find_comments.py
```

**Output:** `data/openmp_indexed_closed_prs.json`


### 2. Collect PR Data (Diffs + Comments)

```bash
python src/collect_data.py
```

**Output:** `data/openmp_prs.json`


### 3. Map Comments to Code Hunks

```bash
python src/preprocess_data.py
```

**Output:** `data/openmp_hunks_comments.json`


### 4. Analyze Mappings & Generate Stats

```bash
python src/analyze_mappings.py
```

**Output:**

* Summary in terminal
* `data/mapping_stats.json`


### 5. Build a Vector Store

```bash
python src/build_vector_db.py
```

**Output:**

* `data/comments_lookup.json`
* `faiss_index.idx`


### 6. Suggest Code Review Comments

```bash
python src/suggest_code_review.py <pr#>
```

**Dummy Output:**
 ```
📥 Fetching hunks for PR #98547 
🔍 Hunk from clang/include/clang/Parse/Parser.h, line 3368
💬 Suggested Comment:
The addition of `TildeLoc` is good for parsing correctness. However, could you add a brief comment explaining the purpose of `TildeLoc` for better understanding in the future?
```

## Output File Description

| File                            | Description                             |
| ------------------------------- | --------------------------------------- |
| `openmp_prs.json`               | Raw PRs with review + issue comments    |
| `openmp_hunks_comments.json`    | Comments mapped to file hunks           |
| `mapping_stats.json`            | Summary of comment stats                |
| `openmp_indexed_closed_prs.json`| PRs filtered to contain inline comments |
| `comments_lookup.json`          | store queries and comments for lookup   |
| `faiss_index.idx`               | generated FAISS vector index            |




🔧 New Feature: Native C++ CLI Tool Integration (Clang-Style)
We extended the original Python-based code reviewer by wrapping it in a native-style C++ command-line tool, mimicking how clang-tidy or clang tools behave.

This makes it:

Easy to run from any terminal

Seamlessly call the Python-powered review engine

Look and feel like an actual compiler tool

⚙️ Setup Instructions for the C++ CLI Tool
✅ 1. Install CMake (if not already)
Download the latest installer from:
👉 https://cmake.org/download/

Choose: cmake-3.29.2-windows-x86_64.msi
During install, select “Add CMake to system PATH”

✅ 2. Install LLVM/Clang for Windows
Download prebuilt LLVM for MSVC from GitHub Releases:
👉 LLVM 20.1.7 Release

File to download:
clang+llvm-20.1.7-x86_64-pc-windows-msvc.tar.xz

Extract the archive (using 7-Zip), and add the bin/ folder to your system PATH.

✅ 3. Install Visual Studio C++ Build Tools
Open Visual Studio Installer

Click Modify on your installed version

Check ✅ Desktop development with C++

Click Modify to install cl.exe, CMake integration, and x64 Native Tools

✅ 4. Open the Native Command Prompt
To build the C++ tool correctly, you must open:

🔎 x64 Native Tools Command Prompt for VS 2022
(Search in Start menu → Run as Administrator)

Then run:

bash
Copy
Edit
cd path\to\clang-review-bot
mkdir build
cd build
cmake ..
cmake --build . --config Release
This compiles the C++ CLI tool and produces:

Copy
Edit
clang-review.exe
🚀 To Run the Review Tool (after building):
From inside build/ or wherever the .exe is:

bash
Copy
Edit
clang-review 98547
It will:

Call your Python script suggest_code_review.py

Load the FAISS index and metadata

Fetch PR diffs and generate review suggestions using Gemini

📦 What's Inside the C++ CLI
main.cpp: Takes PR number, calls Python using std::system()

CMakeLists.txt: Build file for CMake

clang-review-bot/: Folder containing the CLI logic

review_openmp_pr.bat: Optional wrapper to run the tool via .bat


