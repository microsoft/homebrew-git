cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.40.1.vfs.0.1'
  sha256 'e665142c913e6fd850e75e0c0be515045d2452095a631a3cfbae3a7fe311806c'

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
