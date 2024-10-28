#!/bin/bash

if curl -f http://localhost/ || curl -f https://localhost/; then
    exit 0
else
    exit 1
fi