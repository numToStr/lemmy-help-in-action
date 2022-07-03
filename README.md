# lemmy-help-in-action

Github action to generate `vimdoc` from `emmylua` using [`lemmy-help`](https://github.com/numToStr/lemmy-help)

## Inputs

### `version`

lemmy-help version

### `args`

Arguments for the CLI

### `path`

**Required** Path to the lua files

## Outputs

### `doc`

Generated vimdoc

## Example usage

```yaml
name: lemmy-help

on: [push]

env:
  PROJECT_NAME: awesome-plugin

jobs:
  docs:
    runs-on: ubuntu-latest
    name: emmylua to vimdoc
    steps:
      - uses: actions/checkout@v2

      - name: Generating help
        id: lemmyhelp
        uses: numToStr/lemmy-help-in-action@main
        with:
          args: --prefix-class --prefix-alias
          path: |
            path/to/first/file.lua
            path/to/first/second.lua
            path/to/first/third.lua

      - name: Creating help file
        run: echo "${{ steps.lemmyhelp.outputs.doc }}" > ./doc/${PROJECT_NAME}.txt

      - name: Commit
        uses: stefanzweifel/git-auto-commit-action@v4
        with:
          branch: ${{ github.head_ref }}
          commit_message: "chore(docs): generate"
          file_pattern: doc/*.txt
```
