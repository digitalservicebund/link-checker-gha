# Link Checker

## About

This GHA detects broken links in a website and reports them to Slack.

It checks all links on all pages from a `SITEMAP_URL` you provide using [lychee](https://lychee.cli.rs/). A report will be send to your Slack with a provided `SLACK_WEBHOOK_URL`.

## Usage

Run it in a scheduled workflow:

```
name: Links

on:
  repository_dispatch:
  workflow_dispatch:
  schedule:
    - cron: "0 10 * * 1"  # every Monday at 10 am

jobs:
  link-checker:
    runs-on: ubuntu-latest
    steps:
      - name: Link Checker
        uses: digitalservicebund/link-checker-gha@v1
        with:
          SITEMAP_URL: "https://yoursite.com/sitemap.xml" # <- CHANGE THIS
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
```

## Test

To test the action locally, use [act](https://github.com/nektos/act):

```sh
act -j link-checker-test --bind
```

With the `--bind` flag, debug files will remain in the `/lychee` dir.

You can also test the action with a custom `SITEMAP_URL` using [just](https://github.com/casey/just) as a command runner:

```
just test https://yoursite.com/sitemap.xml
```
