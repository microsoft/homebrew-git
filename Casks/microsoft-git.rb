cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.46.0.vfs.0.0'
  sha256 '1c0dfcbb8782cc44ffe1806e629cbfc13e6d3171a17a212ed28d2bbcd9e12f86'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-universal.pkg"

  pkg "git-#{version}-universal.pkg", allow_untrusted: true

  conflicts_with formula: 'git'
  
  depends_on cask: 'homebrew/cask/git-credential-manager'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
