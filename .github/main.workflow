workflow "Test" {
  on = "pull_request"
  resolves = [
    "test",
    "lint",
  ]
}

action "fmt" {
  uses = "sjkaliski/go-github-actions/fmt@v0.2.0"
  secrets = ["GITHUB_TOKEN"]
}

action "test" {
  uses = "./.github/actions/go"
  args = "make test"
}

action "lint" {
  uses = "sjkaliski/go-github-actions/fmt@v0.2.0"
  needs = ["fmt"]
  secrets = ["GITHUB_TOKEN"]
}
