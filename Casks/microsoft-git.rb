cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.53.0.vfs.0.7'
  sha256 '4f2af04d3bfbf79580f9e82ef0244a1ec3e349a36e31d4614d76086d2ab7f89c'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-universal.pkg"

  pkg "git-#{version}-universal.pkg", allow_untrusted: true
  
  depends_on cask: 'homebrew/cask/git-credential-manager'

  uninstall script: {
                      executable: '/usr/local/git/uninstall.sh',
                      args:       ['--yes'],
                      sudo:       true,
                    },
            pkgutil: 'com.git.pkg'
end
