cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.37.1.vfs.0.0'
  sha256 'f8c504188a0eeb16abb5429aa5b26abed40fe1d3f2e8923384f998b00c22a656'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-intel-x86_64-catalina.pkg"

  pkg "git-#{version}-intel-x86_64-catalina.pkg", allow_untrusted: true

  conflicts_with formula: 'git'
  
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
