# GenderComics website content

The texts and images of [gendercomics.net](https://gendercomics.net). The website code lives in [gendercomics/website](https://github.com/gendercomics/website).

## Structure

| Folder | What's in it |
|---|---|
| `de/` | German pages, one markdown (`.md`) file per page |
| `en/` | English pages. Same file names and folders as `de/`; every page exists in both languages |
| `images/` | Images, referenced in pages as e.g. `image: team/maria-slater.jpg` |

The file path is the page address: `de/about.md` → `gendercomics.net/about`, `en/about.md` → `gendercomics.net/en/about`.

## Making a change

1. Open the file on GitHub and click the pencil icon (✏️) to edit it, or use **Add file → Upload files** for images.
2. Click **Commit changes…**, describe what you changed and commit to `main`.
3. The change is checked and published to **staging** automatically: <https://stage.gendercomics.net> (password protected). This takes about 10 minutes; progress is shown in the **Actions** tab.
4. When staging is ready, a reviewer gets an email. They check staging and click **Review deployments → Approve and deploy**.
5. A few minutes later the change is live on <https://gendercomics.net>.

If the check in step 3 fails (red ❌ in the Actions tab), nothing is published. Open the failed run to see why, or ask the tech team.

New pages only appear on the website if another page links to them.

## Branches

- `main`: the current content, shown on staging
- `production`: the content that is live. It is updated automatically on approval; don't edit it directly.
