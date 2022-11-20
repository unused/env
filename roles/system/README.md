
# System Environment

Places bash configurations, installs main packages.

## Tmux

- Use `Ctrl+b v` to create a new pane vertically, `Ctrl+b b` to create a new
  pane horizontally.
- Navigate through panes using `Ctrl+b` and the `h`, `j`, `k`, `l` keys.
- Swap windows using `Ctrl+b :swap-window -s 1 -t 2`.
- Use `Ctrl+b ,` to rename a window.
- Start pane keystroke synchronization with `Ctrl+b Ctrl+e`.

## Tools

- `entr` watches file changes, e.g. `$ ls *.go | entr -c -s 'go test'`
