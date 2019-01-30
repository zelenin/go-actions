workflow "Golang Workflow" {
  on = "push"
  resolves = ["Run"]
}

action "tag-filter" {
  uses = "actions/bin/filter@c6471707d308175c57dfe91963406ef205837dbd"
  args = "tag"
}

action "Build" {
  needs = ["tag-filter"]
  uses = "./.github/actions/build"
}

action "Run" {
  needs = ["Build"]
  uses = "./.github/actions/run"
  env = {
    FROM = "go-actions"
  }
}
