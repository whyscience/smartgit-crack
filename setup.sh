#!/bin/bash

cp -r smartgit-agent $HOME/.config/smartgit/
echo '-javaagent:'"$HOME"'/.config/smartgit/smartgit-agent/smartgit-agent.jar' | tee "$HOME/.config/smartgit/smartgit.vmoptions"
