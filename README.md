# DATASCI 151: Course Website Source

This is the source for the [DATASCI 151 course
website](https://danilofreire.github.io/datasci151-summer/),
the Summer 2026 instance of *Introduction to Statistical
Computing II* at Emory University.

If you came here looking for the website itself, click the link
above. This branch (`gh-pages`) holds the Quarto sources, tutorial
PDFs, and the JupyterLite scaffolding. Lecture slides and notebooks
live on the [`main`](https://github.com/danilofreire/datasci151-summer/tree/main)
branch.

## What's on the site

- **[Syllabus](syllabus.qmd)**: schedule, grading, and policies.
- **[Lectures](lectures.qmd)**: slides and notebooks for each session, with dates.
- **[Tutorials](tutorials.qmd)**: setup guides for the tools we use in class.
- **[Assignments](assignments.qmd)**: instructions and starter files.
- **[JupyterLite](https://danilofreire.github.io/datasci151-summer/jupyter)**: a Python sandbox that runs entirely in the browser, no installation required.

## Updating the site

From the repo root:

```bash
quarto render
```

That builds the static HTML into `docs/`, which is the directory
GitHub Pages serves from this branch. The render also rebuilds
JupyterLite automatically through a `post-render` hook in
`_quarto.yml`, so the in-browser Python environment stays in sync
without any extra steps.

For a live preview while editing:

```bash
quarto preview
```

## Tutorials

| Tutorial | Source |
| --- | --- |
| 01 - VSCode and Anaconda | [qmd](01-vscode-anaconda-tutorial.qmd) |
| 02 - Jupyter Notebook and Markdown | [qmd](02-jupyter-markdown-tutorial.qmd) |
| 03 - GitHub | [qmd](03-github-tutorial.qmd) |

PDF versions render to `docs/` alongside the HTML when the site is
built. They are easier to print and read offline.

## JupyterLite pipeline

Students can run Python in their browser at
<https://danilofreire.github.io/datasci151-summer/jupyter>, no
installation required. The runtime is [Pyodide](https://pyodide.org),
a WebAssembly Python that ships pandas, numpy, matplotlib, scipy,
scikit-learn, and similar libraries used throughout the course.

The build setup lives in [`jupyter/`](jupyter/):

```text
jupyter/
├── build.sh           # invoked by Quarto's post-render hook
├── content/           # starter notebooks shipped to students
├── overrides.json     # JupyterLab theme override (dark mode)
└── requirements.txt   # host-side build dependencies
```

To add a starter notebook or dataset, drop it into `jupyter/content/`
and re-run `quarto render`. See [`jupyter/README.md`](jupyter/README.md)
for the full reference, including how to swap themes or troubleshoot
the build.

## Repository layout

```text
.
├── *.qmd               # source for site pages and tutorials
├── _quarto.yml         # site config and post-render hook
├── docs/               # rendered output, served by GitHub Pages
├── jupyter/            # JupyterLite build inputs and script
└── images/             # figures used across site pages
```

## Questions or feedback?

Open a [GitHub
issue](https://github.com/danilofreire/datasci151-summer/issues),
email me at <danilo.freire@emory.edu>, or catch me after class.
