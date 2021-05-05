cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.31.1.vfs.0.2'
  sha256 '4150372406d667a7d1cbd3057f37e0629b9d5d90c6231631d0dfd43652664956'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-intel-universal-snow-leopard.pkg"

  pkg "git-#{version}-intel-universal-snow-leopard.pkg", allow_untrusted: true

  conflicts_with formula: 'git'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
