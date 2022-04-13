cask 'git-credential-manager-core' do
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.0.696"
  sha256 'f90f8728ac8bff74520a23114e0037aeee5869088fc0d51e5fb4b60bcce8b3a4'

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcmcore-osx-#{version.major_minor_patch}.pkg"

  pkg "gcmcore-osx-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
