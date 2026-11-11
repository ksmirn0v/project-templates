# Project Templates

**Project Templates** is a repository,
containing templates for personal projects.
It uses [Copier](https://copier.readthedocs.io/)
to render projects, using templates.

The following table lists currently available templates:

| Folder     | Description             |
| ---------- | ----------------------- |
| `./python` | a shared template for Python projects 

The Python template asks for a `template`:

| `template` | Description |
| ---------- | ----------- |
| `generic`  | a generic Python package (default) |
| `lambda`   | an AWS Lambda function as a container image |


## Create a new Python project

### Local Setup

Local setup requires
[uv package manager](https://docs.astral.sh/uv/).
To set up a new project, run the following command:

```bash
uvx copier copy gh:ksmirn0v/project-templates <project-name>
cd <project-name>
make install
make check
```

### GitHub Actions

1. Run two options:
   - **Actions → Create Python project** → **Run workflow**
   - **Actions → Create Python Lambda project** → **Run workflow**
2. Fill in the necessary parameters
3. The workflow does the following tasks:
   - renders the template
   - locks dependencies
   - runs all checks
   - creates `<github_org>/<project-name>` with the first commit pushed

To create new repositories, the workflow needs
a `PROJECT_CREATOR_TOKEN` repository secret
(**Settings → Secrets and variables → Actions**)
with a token that can create repositories in every target organization.
Choose `repo` and `workflow` scopes.


## Result

The resulting project has the following base structure:
```text
<project-name>/
├── src/<project-name>/
├── tests/unit/
    ├── integration/
    ├── unit/
├── .github/scripts/next-version.sh
├── .github/workflows/ (branch-push.yml, pull-request.yml, master-push.yml)
├── .pre-commit-config.yaml  
├── .python-version
├── Makefile
├── pyproject.toml
└── .copier-answers.yml
```

A `lambda` project also adds:
```
<project-name>/
├── infra/docker/Dockerfile
├── tests/e2e/
├── .github/workflows/deploy-test.yml
├── .github/workflows/deploy-prod.yml
```

Setting a `namespace` (empty by default)
leads to an additional level in the `src` directory:
```text
<project-name>/
├── src/<namespace/<project-name>/
...
```


## Follow Template Updates

If an underlying template was updated,
it's possible to follow the updates in the generated project with the command:

```bash
uvx copier update
```
