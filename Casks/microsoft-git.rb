cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.45.2.vfs.0.1'
  sha256 'cd345364ea8502e50f144c89ab470e7355d422282f9218d7e1bd8a57b30faf45'

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
