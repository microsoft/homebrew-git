cask 'git-credential-manager-core' do
  name 'Git Credential Manager Core'
  homepage 'https://aka.ms/gcmcore'

  version "2.0.318.44100"
  sha256 'f78e0e2b7916c99b84cf5a99e9b3725231761dfeb1f1807b1375da35a9be4cb6'

  url "https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v#{version.major_minor_patch}-beta/gcmcore-osx-#{version}.pkg"

  pkg "gcmcore-osx-#{version}.pkg", allow_untrusted: true

  uninstall script: {
                      executable: '/usr/local/share/gcm-core/uninstall.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
