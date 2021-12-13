cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.34.1.vfs.0.0'
  sha256 '26915c0c089dfd6c0d7a78d3aaa2ddc2907aabb3c2d05c6e9c33bf938dfce271'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-intel-x86_64-catalina.pkg"

  pkg "git-#{version}-intel-x86_64-catalina.pkg", allow_untrusted: true

  conflicts_with formula: 'git'
  
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
