cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.45.0.vfs.0.0'
  sha256 '21f2e140f34a2aabcc199968f4b27929f93b85e9ced7d6d2adbe78e4a95229e0'

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
