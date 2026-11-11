cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.56.1.vfs.0.1'
  sha256 'ff7e34f1759bdf4d232c2ef3888e528fb5dcf8d792aa3114b60e44e9396aba03'

  url "https://github.com/microsoft/git/releases/download/v2.56.1.vfs.0.1/git-2.56.1.vfs.0.1-macos-arm64.pkg"

  pkg "git-2.56.1.vfs.0.1-macos-arm64.pkg"
  
  depends_on cask: 'homebrew/cask/git-credential-manager'

  uninstall script: {
                      executable: '/usr/local/git/uninstall.sh',
                      args:       ['--yes'],
                      sudo:       true,
                    },
            pkgutil: 'com.git.pkg'
end
