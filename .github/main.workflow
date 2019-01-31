workflow "Golang Workflow" {
  on = "push"
  resolves = ["Push"]
}

action "Filter" {
  uses = "actions/bin/filter@c6471707d308175c57dfe91963406ef205837dbd"
  args = "tag"
}

action "Lint" {
  needs = ["Filter"]
  uses = "./.github/actions/lint"
}

action "Test" {
  needs = ["Lint"]
  uses = "./.github/actions/test"
}

action "Build" {
  needs = ["Test"]
  uses = "./.github/actions/build"
  args = ["./docker/Dockerfile"]
  secrets = ["DOCKER_IMAGE"]
}

action "Login" {
  needs = ["Build"]
  uses = "actions/docker/login@c08a5fc9e0286844156fefff2c141072048141f6"
  secrets = ["DOCKER_REGISTRY_URL", "DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Push" {
  needs = ["Login"]
  uses = "./.github/actions/push"
  secrets = ["DOCKER_IMAGE"]
}
