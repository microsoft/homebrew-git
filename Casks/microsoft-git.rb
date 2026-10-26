cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.56.0.vfs.0.4'
  sha256 '538b03b70ca7c8657eb0ebfa4ca384b36d09adfe8da206d16d8192a810f702b0'

  url "https://github.com/microsoft/git/releases/download/v2.56.0.vfs.0.4/git-2.56.0.vfs.0.4-macos-arm64.pkg"

  pkg "git-2.56.0.vfs.0.4-macos-arm64.pkg"
  
  depends_on cask: 'homebrew/cask/git-credential-manager'

  uninstall script: {
                      executable: '/usr/local/git/uninstall.sh',
                      args:       ['--yes'],
                      sudo:       true,
                    },
            pkgutil: 'com.git.pkg'
end
