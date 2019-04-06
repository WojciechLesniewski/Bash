#!/bin/bash

find . -size +25M -mtime 2 -exec /bin/rm {}\
