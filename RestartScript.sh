#!/bin/bash
VARIABLE=$(/usr/bin/osascript <<-EOF
tell application "System Events"
activate
set question to display dialog "This computer has not been shut down or restarted for more than 7 days. Please restart as soon as possible to ensure that all security patches are applied. This also helps the computer run at optimum performance.

This message will be repeated every day until you restart." with title "Hey Human: RESTART YOUR COMPUTER" buttons {"Shut Down", "Restart", "Cancel"} with icon file "Library:Application Support:Globoforce:Globostar.icns"
set answer to button returned of question
if answer is equal to "Shut Down" then
tell application "System Events"
shut down
end tell
end if
if answer is equal to "Restart" then
tell application "System Events"
restart
end tell
end if
if answer is equal to "Cancel" then
return
end if
end tell
EOF)

$VARIABLE
exit 0
