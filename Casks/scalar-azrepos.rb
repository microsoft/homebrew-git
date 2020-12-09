cask 'scalar-azrepos' do
  version '20.10.178.7'
  sha256 'bb3e53d66c7db479f320c4169898dc9dd0fb6b0c3f37bf44cddf5b4345b9566e'

  url "https://github.com/microsoft/scalar/releases/download/v#{version}/Installers_macOS_Release.zip"

  name 'Scalar for Azure Repos'
  homepage 'https://github.com/microsoft/scalar'

  pkg "Installers_macOS_Release/Scalar/Scalar.#{version}.pkg", allow_untrusted: true

  conflicts_with cask: 'scalar'

  depends_on cask: 'microsoft-git'
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
                      executable: '/usr/local/scalar/uninstall_scalar.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.scalar.pkg'
end
