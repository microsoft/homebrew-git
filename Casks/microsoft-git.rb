cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.56.0.vfs.0.2'
  sha256 '8fa096db00bfc2626b9c5cc6457b29351ebc0d389e7dd95320f43772b1f1358e'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-macos-arm64.pkg"

  pkg "git-#{version}-macos-arm64.pkg"
  
  depends_on cask: 'homebrew/cask/git-credential-manager'

  uninstall script: {
                      executable: '/usr/local/git/uninstall.sh',
                      args:       ['--yes'],
                      sudo:       true,
                    },
            pkgutil: 'com.git.pkg'
end
