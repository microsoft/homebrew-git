cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.32.0.vfs.0.3'
  sha256 'd14bd29948dfa2b108db7642e961d0f023e1bcd2e95be5b6b03e528e560f2673'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-intel-universal-snow-leopard.pkg"

  pkg "git-#{version}-intel-universal-snow-leopard.pkg", allow_untrusted: true

  conflicts_with formula: 'git'
  
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
