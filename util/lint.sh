#!/bin/bash

find ./ -iname *.h -o -iname *.cpp | xargs -i clang-tidy -checks=* {} --
