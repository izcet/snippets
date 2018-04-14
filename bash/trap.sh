#!/bin/bash

function foo () {
    rm -i bar
}
trap foo EXIT
