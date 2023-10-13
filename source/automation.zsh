osa() osascript -${${=1:+e "$*"}:-i}
jxa() osascript -l JavaScript -${${=1:+e "$*"}:-i}

path+=/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Helpers
jsc() command jsc -${${=1:+e "$*"}:-i}

automator() command automator ${=2:+-i "${*:2}"} $1
