# https://nodejs.org/api
alias js=node
if ((`node --version | read && echo ${REPLY:1:2}` >= 21))
then alias node='node --experimental-default-type module'
else node() command node $@[1,#-1] --input-type module < $@[#]
fi

# https://nodejs.org/api/corepack.html#corepack
if (($+commands[corepack] && !$+commands[pnpm])) corepack enable

# https://npmjs.com
alias n=npm
# https://pnpm.io
if (($+commands[pnpm])) alias npm=pnpm
# https://pnpm.io/cli/dlx
if (($+functions[pnpx])) then
  alias npx=pnpx
  autoload pnpx
else
  alias npx='npx --yes --quiet'
fi

# https://mrm.js.org/docs/getting-started#usage-via-npx
alias       mrm='npx mrm'
# https://github.com/depcheck/depcheck#readme
alias  depcheck='npx depcheck'

# https://github.com/msfeldstein/gitignore#readme
alias gitignore='npx gitignore'
# https://cz-git.qbb.sh/cli
alias       czg='npx czg'
# https://githubnext.com/projects/copilot-cli
alias   copilot='npx @githubnext/github-copilot-cli'

# Compilers
# https://www.typescriptlang.org/docs/handbook/compiler-options
alias        ts{c,}='npx --package typescript tsc' typescript=tsc
# https://github.com/wessberg/cjstoesm#cli-usage
alias  cjs{to,-}esm='npx cjstoesm'
# https://github.com/js2coffee/js2coffee#command-line
alias js{2,-}coffee='npx js2coffee'
# https://coffeescript.org#cli
alias        coffee='npx --package coffee{script,}'
# https://civet.dev/getting-started#executing-code
alias         civet='npx @danielx/civet'

# Testing/format
# https://coffeelint.github.io#usage
alias coffeelint='npx @coffeelint/cli'
# https://eslint.org/docs/latest/use/command-line-interface
alias     eslint='npx eslint'
# https://prettier.io/docs/en/cli
alias   prettier='npx prettier'
# https://jestjs.io/docs/cli
alias       jest='npx jest'

# https://github.com/open-cli-tools/chokidar-cli
alias   chokidar='npx chokidar-cli'

# Publish/release
# https://github.com/sindresorhus/np#readme
alias            np='npx np'
# https://github.com/release-it/release-it#readme
alias release{-it,}='npx release-it'
# https://github.com/vercel/pkg#usage
alias           pkg='npx pkg'
