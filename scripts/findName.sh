#!/bin/bash

[ $# -ne 1 ] && exit 1

grep -oE "[A-Z][a-z]+" ${1}
