class Zdotdir < Formula
  desc "Personal Zsh configuration"
  GITHUB_USER = GitHub.user["login"].freeze
  homepage "https://github.com/#{GITHUB_USER}/#{@formula.name.downcase}#readme"
  latest = homepage.sub "#readme", ".git"
  url latest, using: :git, branch: "main"
  version "latest"
  license "MIT"

  uses_from_macos "zsh" => :test

  def install
    doc.install_metafiles
  end

  def post_install
    system "#{HOMEBREW_BREW_FILE} completions link"
  end

  def caveats
    <<~EOS
      Consider adding to your Brewfile:
        brew "#{name}", restart_service: :changed
    EOS
  end

  service do
    zdotdir = @formula.tap.path/@formula.name.downcase
    run ["/bin/launchctl", "setenv", @formula.name.upcase, zdotdir]
    keep_alive path: zdotdir/".zshenv"
  end

  test do
    ENV[@formula.name.upcase] = testpath
    touch ".zshenv"
    sourced = shell_output "zsh --source-trace -c exec 2>&1"
    assert_match "#{testpath}/.zshenv", sourced
  end
end
