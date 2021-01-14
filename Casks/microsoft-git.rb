cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.30.0.vfs.0.2'
  sha256 'd2d3733c8ea074ea653f3aa0be43ebe93a66c961a17294c979cb21487e0ed80b'

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
