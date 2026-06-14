#!/usr/bin/env bash
set -e

cleanup() {
  yarn workspace @andrew-codes/ps5-mqtt-dev-services run stop
}
trap cleanup EXIT INT TERM

yarn workspace @andrew-codes/ps5-mqtt-dev-services run start
yarn workspaces foreach -Ap -i --exclude @andrew-codes/ps5-mqtt-dev-services run start
