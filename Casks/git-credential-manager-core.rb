cask 'git-credential-manager-core' do
  name 'Git Credential Manager Core'
  homepage 'https://aka.ms/gcmcore'

  version "2.0.474.41365"
  sha256 'f580e3e0518b4b549d606b559fea5977d3f32ab506d91db9aa6764cf6ada734b'

  url "https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v#{version.major_minor_patch}/gcmcore-osx-#{version}.pkg"

  pkg "gcmcore-osx-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
