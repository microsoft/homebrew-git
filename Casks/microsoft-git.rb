cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.35.0.vfs.0.0'
  sha256 '1ce7d2165d9f160496f868ba469846fb0730699bc1d8e43195afdf470d192c8d'

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
