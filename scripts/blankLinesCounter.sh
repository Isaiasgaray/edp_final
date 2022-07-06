#!/bin/bash

[ $# -ne 1 ] && exit 1

grep -c "^$" "${1}"
