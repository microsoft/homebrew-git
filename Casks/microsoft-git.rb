cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.52.0.vfs.0.5'
  sha256 '27536465c2dbf272799e62fb5463dac7791308112a474a864063c8e342b7b9d1'

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
