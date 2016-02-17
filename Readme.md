# Buildkite Dynamic Pipeline Steps Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example [Buildkite](https://buildkite.com/) pipeline that shows how to [programmatically generate a build pipeline](https://buildkite.com/docs/guides/uploading-pipelines), allowing you to customize and distribute your build jobs however you wish.

## How does it work?

When a build is created it has a single job: to run `.buildkite/pipeline.sh`. This generates a the build pipeline depending on the environment.

The dynamic pipeline:

* Creates a separate test step for each directory in [steps](steps/)
* Adds a deploy step at the end only if the build is on the master branch

What else could you do? The possibilities are endless.

## License

See [Licence.md](Licence.md) (MIT)
