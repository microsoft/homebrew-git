cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.41.0.vfs.0.5'
  sha256 '5f352ef577c87aac4569523a0c4c1b217e09406bde96fe22035b66c50e904181'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-intel-x86_64.pkg"

  pkg "git-#{version}-intel-x86_64.pkg", allow_untrusted: true

  conflicts_with formula: 'git'
  
  depends_on cask: 'homebrew/cask/git-credential-manager'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
