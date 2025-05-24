# 🧠 OpenMP PR Scraper & Comment Analyzer

A GitHub data mining pipeline to collect, process, and analyze Pull Requests (PRs) from the LLVM/OpenMP project. It maps review and issue comments to code hunks and provides statistical summaries.


## 📦 Dependencies

Install the required Python packages:

```bash
pip install -r requirements.txt
```

**`requirements.txt` should contain:**

```txt
requests
python-dotenv
matplotlib
pandas
```

## 🔐 Environment Setup

Create a `.env` file in the project root with your GitHub token:

```env
GITHUB_TOKEN=ghp_your_personal_access_token_here
```

> Make sure your token has at least `read:public_repo` or `repo` scope.

---

## 🗂️ File Structure

```bash
.
├── .env
├── requirements.txt
├── run_preprocessing.sh
├── data/
│   ├── openmp_prs.json                  # PRs and raw comments
│   ├── openmp_hunks_comments.json       # Mapped comments to hunks
│   ├── prs_with_review_comments.json    # Filtered PRs with inline comments
│   └── mapping_stats.json               # Final stats
├── src/
│   ├── collect_data.py
│   ├── find_comments.py
│   ├── preprocess_data.py
│   └── analyze_mappings.py
```

## ▶️ Project Workflow

### 1. 🔎 Find PRs with Review Comments

```bash
python src/find_comments.py
```

**Output:** `data/prs_with_review_comments.json`


### 2. 🧲 Collect PR Data (Diffs + Comments)

```bash
python src/collect_data.py
```

**Output:** `data/openmp_prs.json`


### 3. 🧮 Map Comments to Code Hunks

```bash
python src/preprocess_data.py
```

**Output:** `data/openmp_hunks_comments.json`


### 4. 📊 Analyze Mappings & Generate Stats

```bash
python src/analyze_mappings.py
```

**Output:**

* Summary in terminal
* `data/mapping_stats.json`


### ✅ Run All Steps in One

```bash
chmod +x run_preprocessing.sh
./run_preprocessing.sh
```



## 📁 Output Description

| File                            | Description                             |
| ------------------------------- | --------------------------------------- |
| `openmp_prs.json`               | Raw PRs with review + issue comments    |
| `openmp_hunks_comments.json`    | Comments mapped to file hunks           |
| `mapping_stats.json`            | Summary of comment stats                |
| `prs_with_review_comments.json` | PRs filtered to contain inline comments |



## 🧪 Notes

* Review comments are inline comments attached to code.
* Issue comments are general PR discussions.
* Comment types are separated and analyzed independently.



---

## 🧠 Vector Database for Review Comment Retrieval

This module embeds PR diff-comment pairs using SentenceTransformers and stores them in a FAISS vector database. It enables fast similarity search to suggest historical review comments for new OpenMP code changes.

### 📦 Dependencies

Install required Python packages (if not already installed):

```bash
pip install faiss-cpu sentence-transformers numpy
In case of errors with TensorFlow or protobuf, run:

bash
Copy
Edit
pip uninstall tensorflow
pip install protobuf==3.20.*
🗂️ File Overview
File	Purpose
src/build_vector_db.py	Builds the FAISS index using comment-context embeddings
src/query_vector_db.py	Queries the vector DB to retrieve similar past review comments
data/openmp_hunks_comments.json	Input JSON with PR metadata and review comments
data/faiss_index.idx	Output: FAISS vector index file
data/comments_lookup.json	Output: Stores original queries and associated comments

⚙️ How to Use
🔨 Build the Vector Database
bash
Copy
Edit
python src/build_vector_db.py
This will generate:

data/faiss_index.idx

data/comments_lookup.json

