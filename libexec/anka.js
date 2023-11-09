#! /usr/bin/osascript -l JavaScript
ObjC.import("stdlib")
const { applicationProcesses: { Anka }} = Application("System Events")
Anka.windows[0].attributes.AXFullScreen.value = true
console.clear
