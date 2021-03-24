cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.31.0.vfs.0.1'
  sha256 'fae1aa001f038c17cd994a1279327e449d801527b71b264e5f2dc4b04502066b'

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
