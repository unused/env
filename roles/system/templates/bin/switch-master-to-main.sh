#!/usr/bin/bash

git br -m master main && git fetch origin && git br -u origin/main main
