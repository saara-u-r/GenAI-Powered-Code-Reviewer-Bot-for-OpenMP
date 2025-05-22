import os
import requests
from dotenv import load_dotenv

load_dotenv()
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
OWNER = "llvm"
REPO = "llvm-project"
HEADERS = {
    "Authorization": f"Bearer {GITHUB_TOKEN}",
    "Accept": "application/vnd.github+json"
}

def get_recent_prs(limit=50):
    prs = []
    page = 1
    per_page = 30

    while len(prs) < limit:
        url = f"https://api.github.com/repos/{OWNER}/{REPO}/pulls"
        params = {
            "state": "all",
            "per_page": per_page,
            "page": page
        }
        r = requests.get(url, headers=HEADERS, params=params)
        if r.status_code != 200:
            print("Failed to fetch PRs:", r.text)
            break
        page_data = r.json()
        if not page_data:
            break
        prs.extend(page_data)
        page += 1

    return prs[:limit]

def has_review_comments(pr_number):
    url = f"https://api.github.com/repos/{OWNER}/{REPO}/pulls/{pr_number}/comments"
    r = requests.get(url, headers=HEADERS)
    if r.status_code != 200:
        print(f"Failed to fetch review comments for PR #{pr_number}")
        return False
    comments = r.json()
    for c in comments:
        # Check that it's not a bot, has position, and path (i.e. reviewable)
        if c.get("position") is not None and "bot" not in c["user"]["login"]:
            return True
    return False

def main():
    print("Searching for PRs with real review comments...")
    prs = get_recent_prs(limit=100)
    matching = []
    for pr in prs:
        pr_number = pr["number"]
        print(f"Checking PR #{pr_number}...")
        if has_review_comments(pr_number):
            print(f"✅ PR #{pr_number} has review comments.")
            matching.append({
                "number": pr["number"],
                "title": pr["title"],
                "diff_url": pr["diff_url"],
                "base": pr["base"],
                "head": pr["head"]
            })
        else:
            print(f"❌ PR #{pr_number} has no review comments.")

    print(f"\nFound {len(matching)} PRs with real review comments.")
    for pr in matching:
        print(f"- #{pr['number']}: {pr['title']}")

    # Optionally, save this for further use
    import json
    with open("data/prs_with_review_comments.json", "w") as f:
        json.dump(matching, f, indent=2)

if __name__ == "__main__":
    main()
