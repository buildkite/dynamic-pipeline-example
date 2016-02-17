# Buildkite Dynamic Pipeline Steps Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example [Buildkite](https://buildkite.com/) pipeline that shows how to [programmatically generate a build pipeline](https://buildkite.com/docs/guides/uploading-pipelines), allowing you to customize and distribute your build jobs however you wish.

## How does it work?

When a build is created it runs a single job that executes [.buildkite/pipeline.sh](.buildkite/pipeline.sh) and pipes the output to `buildkite-agent pipeline upload`. This example pipeline generation script:

* Creates a separate test step for each directory in [steps](steps/)
* Adds a deploy step at the end only if the build is on the master branch

What else could you do? The possibilities are endless.

## License

See [Licence.md](Licence.md) (MIT)
