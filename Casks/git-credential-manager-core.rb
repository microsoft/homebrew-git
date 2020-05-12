cask 'git-credential-manager-core' do
  name 'Git Credential Manager Core'
  homepage 'https://aka.ms/gcmcore'

  version "2.0.124.60385"
  sha256 '8d7d3c656f32ff79db7604853f4c653f6210aca7cdd35e611ab1ff8e44633862'

  url "https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v#{version.major_minor_patch}-beta/gcmcore-osx-#{version}.pkg"

  pkg "gcmcore-osx-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
