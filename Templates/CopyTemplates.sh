#!/bin/bash

set -e
set -o pipefail

rm -rf ~/Library/Developer/Xcode/Templates/Dota2Info
mkdir -p ~/Library/Developer/Xcode/Templates/Dota2Info && cp -R Templates/xcode-templates/ ~/Library/Developer/Xcode/Templates/Dota2Info
