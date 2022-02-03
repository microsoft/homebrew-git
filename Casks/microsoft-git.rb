cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.35.1.vfs.0.0'
  sha256 '331265c6a8a82f63798ceae43abbab316188394618aac390b4a92e1e94d9cd3c'

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
