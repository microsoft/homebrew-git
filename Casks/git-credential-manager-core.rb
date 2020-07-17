cask 'git-credential-manager-core' do
  name 'Git Credential Manager Core'
  homepage 'https://aka.ms/gcmcore'

  version "2.0.194.40577"
  sha256 '95232742134e81362d0f1a6d24026a1e7552c2c6b7bf62b7d54895f5bc9b0993'

  url "https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v#{version.major_minor_patch}-beta/gcmcore-osx-#{version}.pkg"

  pkg "gcmcore-osx-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
