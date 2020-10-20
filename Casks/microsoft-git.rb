cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.29.0.vfs.0.0'
  sha256 'b829b49daca5dcf7ad73028b332f68f5e5f9474282f72164ddaf8235e978a02e'

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
