cask 'git-credential-manager-core' do
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.0.605.12951"
  sha256 'da72cce512ec40356aa137328843b599d46d123e7fbb80626de81749329f8a7b'

  url "https://github.com/GitCredentialManager/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcmcore-osx-#{version}.pkg"

  pkg "gcmcore-osx-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
