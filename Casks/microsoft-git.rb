cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.54.0.vfs.0.4'
  sha256 '03daacf20bb83e5162d91d6dab125b3cc395f672369ed0e20fd0a51eae9df0d7'

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
