cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.40.1.vfs.0.2'
  sha256 '46a9e09b5c4bce868dacbaa1961730cdd566126307d6d4be2adf780379e2a01a'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-intel-x86_64.pkg"

  pkg "git-#{version}-intel-x86_64.pkg", allow_untrusted: true

  conflicts_with formula: 'git'
  
  depends_on cask: 'git-credential-manager'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
