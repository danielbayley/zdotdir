alias js=node
if ((`node --version | read && echo ${REPLY:1:2}` >= 21))
then alias node='node --experimental-default-type module'
else node() command node $@[1,#-1] --input-type module < $@[#]
fi

# https://nodejs.org/api/corepack.html#corepack
if (($+commands[corepack] && !$+commands[pnpm])) corepack enable

alias n=npm
if (($+commands[pnpm])) alias npm=pnpm
if (($+functions[pnpx])) then
  alias npx=pnpx
  autoload pnpx
else
  alias npx='npx --yes --quiet'
fi

alias np='npx np'
alias release-it='npx release-it'
alias  mrm='npx mrm'
alias meta='npx meta'

alias  gitignore='npx gitignore'
alias cz{g,-git}='npx czg'

alias  cjs{to,-}esm='npx cjstoesm'
alias js{2,-}coffee='npx js2coffee'
alias        coffee='npx --package coffee{script,}'
