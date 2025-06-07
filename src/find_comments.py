import os
import requests
import json
from dotenv import load_dotenv

load_dotenv()
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
OWNER = "llvm"
REPO = "llvm-project"

HEADERS = {
    "Authorization": f"Bearer {GITHUB_TOKEN}",
    "Accept": "application/vnd.github+json"
}

def search_openmp_prs(max_pages=10):
    prs = []
    for page in range(1, max_pages + 1):
        print(f"🔍 Searching OpenMP PRs page {page}")
        url = "https://api.github.com/search/issues"
        params = {
            "q": f"repo:{OWNER}/{REPO} is:pr is:closed openmp",
            "per_page": 100,
            "page": page
        }
        r = requests.get(url, headers=HEADERS, params=params)
        if r.status_code != 200:
            print("❌ Failed:", r.text)
            break
        page_data = r.json()
        items = page_data.get("items", [])
        if not items:
            break
        prs.extend(items)
    return prs

def fetch_pr_metadata(pr_number):
    url = f"https://api.github.com/repos/{OWNER}/{REPO}/pulls/{pr_number}"
    r = requests.get(url, headers=HEADERS)
    if r.status_code != 200:
        print(f"❌ Failed to fetch PR #{pr_number}: {r.text}")
        return None
    return r.json()

def main():
    raw_prs = search_openmp_prs(max_pages=10)
    print(f"🔎 Found {len(raw_prs)} PRs mentioning 'openmp'")

    enriched = []

    for item in raw_prs:
        pr_number = item["number"]
        print(f"🔄 Enriching PR #{pr_number}")
        pr_meta = fetch_pr_metadata(pr_number)
        if not pr_meta:
            continue
        enriched.append({
            "number": pr_meta["number"],
            "title": pr_meta["title"],
            "url": pr_meta["html_url"],
            "diff_url": pr_meta["diff_url"],
            "base": pr_meta["base"],
            "head": pr_meta["head"]
        })

    os.makedirs("data", exist_ok=True)
    with open("data/openmp_indexed_closed_prs.json", "w") as f:
        json.dump(enriched, f, indent=2)

    print(f"\n✅ Saved {len(enriched)} enriched PRs to data/openmp_indexed_closed_prs.json")

if __name__ == "__main__":
    main()
