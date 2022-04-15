cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.35.3.vfs.0.0'
  sha256 'f51cbbaffe03b0c6676802880b079dc7a1f865eea9d05ecd64ed998c04c1ff6a'

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
