cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.52.0.vfs.0.4'
  sha256 'df44976107049071eac09b472287d68393ba3c58f29e34c538539e3e12f9ba5e'

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
