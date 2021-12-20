cask 'git-credential-manager-core' do
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.0.632.34631"
  sha256 'cf75b5d082c103e63cee70dd70aa968b7f9ca1dbf10aad49d6c2309927757cc1'

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcmcore-osx-#{version}.pkg"

  pkg "gcmcore-osx-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
