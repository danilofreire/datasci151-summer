# JupyterLite for DATASCI 151

Students can run Python in their browser at
<https://danilofreire.github.io/datasci151-summer/jupyter>.
No installation required: Pyodide ships a full Python (with
pandas, numpy, matplotlib, scipy, etc.) as WebAssembly.

## Updating the JupyterLite site

Just run `quarto render` from the repo root. The `post-render`
hook in `_quarto.yml` rebuilds JupyterLite automatically.

If you only want to rebuild JupyterLite (no Quarto):

```bash
./jupyter/build.sh
```

## Adding starter notebooks or files

Drop them into `jupyter/content/`. They appear in the in-browser
file browser the next time JupyterLite is built.

## What's in this folder

| File | Purpose |
| --- | --- |
| `build.sh` | Build script. Creates a venv on first run, reuses it after. |
| `requirements.txt` | Host-side build dependencies. |
| `overrides.json` | JupyterLab theme override (dark mode). |
| `content/` | Starter notebooks shipped to students. |
| `.venv/` | Gitignored Python venv created by `build.sh`. |

## Why pandas/numpy/matplotlib aren't in `requirements.txt`

They're already bundled in Pyodide's WebAssembly distribution, served
from the Pyodide CDN. Listing them here would install host-side wheels
that Pyodide never uses. To pre-load extra packages inside a notebook:

```python
import piplite
await piplite.install("polars")
```

## Troubleshooting

- **First page load is slow**: Pyodide is around 30 MB; the browser
  caches it after the first visit.
- **`jupyter: command not found` when running `build.sh`**: the venv is
  missing or corrupted. Delete `jupyter/.venv/` and rerun the script.
- **Build fails with a Python version error**: the script asks `uv` for
  Python 3.12. If `uv` isn't installed, install it from
  <https://docs.astral.sh/uv/>.
