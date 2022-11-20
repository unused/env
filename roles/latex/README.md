
# Latex and Pandoc via Toolbox

Installs [pandoc](https://pandoc.org/) document converter and setup
[Latex](https://www.latex-project.org/) in a toolbox. Additionally this role
keeps record about configuration of certain use cases.

## Usage

The common workflow to convert documents is to run pandoc inside the toolbox.

```sh
$ toolbox run -c latex pandoc -o README.pdf README.md
```

- [ ] Document build on change
- [ ] Document slides w/ beamer
- [ ] Document custom templates
