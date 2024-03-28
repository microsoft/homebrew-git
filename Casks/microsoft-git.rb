cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.44.0.vfs.0.2'
  sha256 '502c4a7337f96488a93eb669490e9c8c8ae16f12d92e82b441b34a641fbf1f9b'

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
