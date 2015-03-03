#!/usr/bin/env bats

@test "git binary is found in PATH" {
  run which git
  [ "$status" -eq 0 ]
}

@test "Check there is a start command for prometheus" {
  command -v /etc/init.d/prometheus start
}

@test "Check there is a stop command for prometheus" {
  command -v /etc/init.d/prometheus stop
}

@test "Check there is a restart command for prometheus" {
  command -v /etc/init.d/prometheus restart
}
