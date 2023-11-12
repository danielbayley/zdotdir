xcode-select --print-path | read DEVELOPER_DIR
PATH+=:/usr/libexec:/System/Library/CoreServices:$DEVELOPER_DIR/usr/bin

alias lsregister=/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister

# VM
alias vm=anka
autoload anka
