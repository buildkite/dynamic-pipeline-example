# Buildkite Dynamic Pipeline Steps Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example [Buildkite](https://buildkite.com/) pipeline that shows how to [programmatically generate a build pipeline](https://buildkite.com/docs/guides/uploading-pipelines), allowing you to customize and distribute your build jobs however you wish.

## How does it work?

When a build is start it runs a single job first. This job executes `.buildkite/pipeline.sh | buildkite-agent pipeline upload`.

This [.buildkite/pipeline.sh](.buildkite/pipeline.sh) script does the following:

* Creates a separate test step for each directory in [steps](steps/)
* Adds a deploy step at the end only if the build is on the master branch

For a non-master branch build it generates:

```yml
steps:
  - command: "specs/controllers/test.sh"
    label: "controllers"
  - command: "specs/features/test.sh"
    label: "features"
  - command: "specs/models/test.sh"
    label: "models"
```

For a master branch build it generates:

```yml
steps:
  - command: "specs/controllers/test.sh"
    label: "controllers"
  - command: "specs/features/test.sh"
    label: "features"
  - command: "specs/models/test.sh"
    label: "models"
  - wait
  - command: "echo Deploy!"
    label: ":rocket:"
```

What else could you do? The possibilities are endless. For example [Jobsworth](https://github.com/saymedia/jobsworth) is a high-level tool that uses this to create deployments, rollbacks, QA steps, etc.

## License

See [Licence.md](Licence.md) (MIT)
