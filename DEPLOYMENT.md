# GitHub Pages Deployment Guide

This guide will help you deploy the NEET PG Study Materials site to GitHub Pages.

## Prerequisites

- Python 3.11 or higher
- Git
- GitHub account with a repository

## Local Setup

### 1. Install Dependencies

```bash
pip install -r requirements.txt
```

### 2. Sync Content to Docs Folder

The `sync-docs.sh` script copies all study materials to the `docs/` folder:

```bash
./sync-docs.sh
```

Run this script anytime you update content in the source directories (Anatomy, Physiology, etc.) to sync changes to the docs folder.

### 3. Preview Locally

To preview the site locally before deploying:

```bash
mkdocs serve
```

Open your browser to `http://127.0.0.1:8000` to view the site.

## GitHub Pages Deployment

### One-Time Setup

1. **Update Repository URLs**

   Edit `mkdocs.yml` and update these lines with your actual GitHub username/organization:

   ```yaml
   site_url: https://yourusername.github.io/neet-pg
   repo_name: neet-pg
   repo_url: https://github.com/yourusername/neet-pg
   ```

2. **Enable GitHub Pages in Repository Settings**

   - Go to your repository on GitHub
   - Click on **Settings** > **Pages**
   - Under **Source**, select **Deploy from a branch**
   - Under **Branch**, select `gh-pages` and `/ (root)`
   - Click **Save**

3. **Push Your Code**

   ```bash
   git add .
   git commit -m "Set up GitHub Pages deployment"
   git push origin main
   ```

### Automatic Deployment

The GitHub Actions workflow (`.github/workflows/docs.yml`) will automatically:

1. Run when you push changes to the `main` branch
2. Sync content using `sync-docs.sh`
3. Build the MkDocs site
4. Deploy to the `gh-pages` branch
5. Your site will be live at `https://yourusername.github.io/neet-pg`

### Manual Deployment

You can also manually trigger deployment:

1. Go to your repository on GitHub
2. Click **Actions** tab
3. Select **Deploy Documentation** workflow
4. Click **Run workflow**

## Updating Content

### Adding New Study Materials

1. Add your markdown files to the appropriate subject directory:
   - `Anatomy/`
   - `Physiology/`
   - `Medicine/`
   - `Surgery/`
   - etc.

2. Run the sync script:
   ```bash
   ./sync-docs.sh
   ```

3. Update the navigation in `mkdocs.yml` to include your new files:
   ```yaml
   nav:
     - Anatomy:
       - Your New Topic: anatomy/YourNewFile.md
   ```

4. Commit and push:
   ```bash
   git add .
   git commit -m "Add new study material"
   git push
   ```

The GitHub Actions workflow will automatically deploy your changes.

## Customization

### Change Theme Colors

Edit `mkdocs.yml`:

```yaml
theme:
  palette:
    - scheme: default
      primary: indigo  # Change this color
      accent: indigo   # Change this color
```

Available colors: red, pink, purple, deep purple, indigo, blue, light blue, cyan, teal, green, light green, lime, yellow, amber, orange, deep orange

### Add Custom CSS

1. Create a file: `docs/stylesheets/extra.css`
2. Add your custom CSS
3. Reference it in `mkdocs.yml`:
   ```yaml
   extra_css:
     - stylesheets/extra.css
   ```

## Troubleshooting

### Build Fails

- Check the Actions tab on GitHub for error details
- Verify all markdown files are valid
- Ensure `mkdocs.yml` navigation references existing files

### Site Not Updating

- Wait a few minutes for GitHub Pages to update
- Check that the workflow completed successfully in Actions tab
- Clear your browser cache

### Local Preview Not Working

- Ensure dependencies are installed: `pip install -r requirements.txt`
- Run sync script first: `./sync-docs.sh`
- Check for errors in the terminal

## Additional Resources

- [MkDocs Documentation](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)

## Support

If you encounter issues, check:
- GitHub Actions logs for deployment errors
- MkDocs documentation for configuration help
- Material theme documentation for customization options
