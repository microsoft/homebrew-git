cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.39.2.vfs.0.0'
  sha256 '5194783b7ae7115970c3afcde12198002e667e6455017c2fbeb3666beb50b958'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-intel-x86_64.pkg"

  pkg "git-#{version}-intel-x86_64.pkg", allow_untrusted: true

  conflicts_with formula: 'git'
  
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
